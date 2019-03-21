/**************************************************************************************************************************************************
 Name: SyncSubscriptionFields 
 ==================================================================================================================================================
 Purpose: Sync custom fields belonging to the Quote's zqu__CustomQuoteFields field set to the Subscription object in Zuora for amendments 
          + renewals 
 --------------------------------------------------------------------------------------------------------------------------------------------------
 History:                                                        
 --------------------------------------------------------------------------------------------------------------------------------------------------
 VERSION AUTHOR              DATE          DETAIL                          
 --------------------------------------------------------------------------------------------------------------------------------------------------
    1.0  Christina Lesnick   05/20/2014    Initial Development
    2.0  Maks Demin          12/09/2014    Only update the first version of the subscription created from an amendment quote when there are multilpe amendments
**************************************************************************************************************************************************/

public with sharing class SyncSubscriptionFields {
	public static Zuora.zApi zuoraApi;
	public static Map<String, String> fieldNameToValue = new Map<String, String>();
	public static List<Zuora.zObject> sub = new List<Zuora.zObject>();
	public static Decimal subscriptionVersion = 0;
	
	// Public variables for Zuora callout error handling 
	public static ZLogging lh = new Zlogging();
	public static String request = '';
	public static String response = '';
	public static String description = '';
	public static String origin = '';
	public static String severity = '';

	/**
	Constructor
	*/
	public SyncSubscriptionFields(String subName, String quoteId, String subId, Decimal subVerion) {
		updateSubscription(subName, quoteId, subId, subVerion);	
	}

	/**
 	Initialize connection to Zuora and login
 	*/
 	public static void initZApi() {
 		// Initialize zApi client and login to Zuora
        zuoraApi = new Zuora.zApi();
        try { 
            if(!Test.isRunningTest()) zuoraApi.zlogin();  
        }
        catch(Exception ex){ 
            System.Debug('cl Zuora Login Error.' + ex.getMessage());
             
            description = 'ZLogin failed, update to account did not occur \r\n' + ex.getMessage();
            request = Zuora.zApi.currentLogger.request;
            response = Zuora.zApi.currentLogger.response;
            origin = 'SyncSubscriptionFields.initZApi()';
            severity = 'ERROR';

            System.debug( 'cl SOAP Request = ' + request );
            System.debug( 'cl SOAP Response = ' + response );

            ZlogException();
        }
 	}

 	/**
	Get fields from zqu__CustomQuoteFields field set
	*/
 	public static List<Schema.FieldSetMember> getFields() {
        return SObjectType.zqu__Quote__c.FieldSets.SubscriptionSyncFields.getFields();
    }

    /**
	Get values from zqu__CustomQuoteFields field set
	*/
 	public static void getFieldValues(String quoteId) {
 		String query = 'SELECT ';
        for(Schema.FieldSetMember f : getFields()) {
            query += f.getFieldPath() + ', ';
        }
        query += ('Id FROM zqu__Quote__c WHERE Id = ' + '\'' + quoteId + '\'' + ' LIMIT 1');
        List<zqu__Quote__c> quote = Database.query(query);

        if (quote.size() == 0) {
        	System.Debug('cl query failed to return quote');
        }
        setFieldValues(quote);
 	}

 	/**
	Map the field name to it's value
	*/
 	public static void setFieldValues(List<zqu__Quote__c> q) {
 		// Create a new quote as the generic type sObject
		sObject s = new zqu__Quote__c();
		// Get the sObject describe result for the quote object
		Schema.DescribeSObjectResult r = zqu__Quote__c.sObjectType.getDescribe();
		Map<String, Schema.SObjectField> qFieldMap = Schema.sObjectType.zqu__Quote__c.fields.getMap();           

 		for (Schema.FieldSetMember f : getFields()) {

	        Schema.SObjectField field = qFieldMap.get(f.getFieldPath());
	        Schema.DisplayType dataType = field.getDescribe().getType();

	        // If field is of type 'DATE' then format to yyyy-dd-MM
	        if (dataType.Name() == 'DATE') {
	        	System.Debug('cl detect field of type DATE');

	        	Date d = Date.valueOf(q[0].get(f.getFieldPath()));
	        	System.Debug('Date: ' + d);
	        	if(d != null){
	        		DateTime dt = datetime.newInstance(d.year(), d.month(),d.day());
					String dateString = dt.format('yyyy-dd-MM');

					fieldNameToValue.put(f.getFieldPath(), dateString);
				}
				continue;
	        }

 			System.Debug('cl quote value: ' +  q[0].get(f.getFieldPath()));
 			System.Debug('cl quote value cast as string: ' +  String.valueOf(q[0].get(f.getFieldPath())));
 			fieldNameToValue.put(f.getFieldPath(), String.valueOf(q[0].get(f.getFieldPath())));
 		}
 	}

 	/**
	Update subscription custom fields 
	*/
 	@Future(callout=true)
	public static void updateSubscription(String subName, String quoteId, String subId, Decimal subVerion) {
		List<Zuora.zObject> subList = new List<Zuora.zObject>();
		String subscriptionId = '';
		subscriptionVersion = subVerion;
		initZApi();
		//12/9/14 MD
		//get the version from the quote that was just sent
		querySubscriptionId(subName);
		subscriptionId = sub.size() != 0 ? String.valueOf(sub[0].getValue('Id')) : 'abc1235';
		getFieldValues(quoteId);

		Zuora.zObject subscription;
		subscription = new Zuora.zObject('Subscription');	
	 	subscription.setValue('Id', subscriptionId);

	 	Set<String> keys = fieldNameToValue.keySet();

	 	for (String k : keys) {
	 		System.Debug('cl key: ' + '\'' + k + '\'');
	 		System.Debug('cl value: ' +  '\'' + fieldNameToValue.get(k) + '\'');
			subscription.setValue(k, fieldNameToValue.get(k));
	 	}	
	 	subList.add(subscription);
        List<Zuora.zApi.SaveResult> results = new List<Zuora.zApi.SaveResult>();
        
        // Prepare error handling in case update fails
        description = ('Subscription update failed for: \r\n' + subList);
        severity = 'ERROR';
        origin = 'SyncSubscriptionFields.updateSubscription()';

        // Update Subscription
        try{
            results = !Test.isRunningTest() ? zuoraApi.zUpdate(subList) : TestFactoryAvalara.results;          
        }
        catch(Exception ex){
        	request = Zuora.zApi.currentLogger.request;
            response = Zuora.zApi.currentLogger.response;

            System.debug( 'cl SOAP Request = ' + request );
            System.debug( 'cl SOAP Response = ' + response );
            
            System.Debug('cl Exception: ' + ex.getMessage());

            ZlogException();
        }                       
        
        if (results.size() > 0) {
        	for (Zuora.zApi.SaveResult result : results){ 
	            // Update Successful
	            if (result.Success){
	                System.Debug('cl Update Result Id: ' + result.Id);
	                String updatedId = result.Id;
	            }
	            // Update Failed
	            else{
	                Zuora.zObject[] errors = result.errors;
	                String code = '';
	                String message = '';

	                for (Zuora.zObject error : errors) {
	                    code += ((String)error.getValue('Code') + '\r\n');
	                    message += ((String)error.getValue('Message') + '\r\n');
	                } 

	                ZlogSaveResultError(code, message);
	                System.Debug('cl update failed: ' + message);    
	               	
	            }       
	        }
        }

        // Create Zuora Message Logs if update fails
        if (lh.logs.size() != 0) {
        	lh.createMessageLogs();
        }
        
        return;
	 }


	 public static void querySubscriptionId(String subName) {
	 	//12-9-14 MD
	 	//get the next version of the subscription to update in zuora
	 	subscriptionVersion ++;
	 	String zoql = 'SELECT Id FROM Subscription WHERE Name =\'' + subName + '\' AND Version =\'' + subscriptionVersion +'\'';
		
		System.Debug('cl subscription query: ' + zoql);

		try {
			if(!Test.isRunningTest()){
				sub = zuoraApi.zquery(zoql);
			}
			else{
				// Make a fake result
				Zuora.zObject testobj = new Zuora.zObject('Subscription');
				testobj.setValue('Name', 'Test Sub');
				testobj.setValue('Id', '1234');
	 			sub.add(testobj);
			}
		} 
		catch (Exception e) {
			System.debug('cl Error in subscription query [' + zoql + '] ' + e.getMessage());
			description = 'Error in subscription query [' + zoql + '] \r\n' + e.getMessage();
            request = Zuora.zApi.currentLogger.request;
            response = Zuora.zApi.currentLogger.response;
            origin = 'SyncSubscriptionFields.querySubscriptionId()';
            severity = 'ERROR';

            System.debug( 'cl SOAP Request = ' + request );
            System.debug( 'cl SOAP Response = ' + response );

            ZlogException();
		}

		if (sub.size() == 0){
			System.debug('cl No Subscriptions exists given the Name: ' + subName);
		}		

		System.debug('cl output subscription' + sub);
	 }

	/**
	Log Exception 
	*/
	 public static void ZlogException() {
 		ZLogging.Log l = lh.newLog();
    	l.setSeverity(severity);
    	l.setOrigin(origin);
    	l.setErrorDescription(description);
    	l.setResponse(response);
    	l.setRequest(request);
	 }

	 /**
	 Log SaveResultError 
	 */
	  public static void ZlogSaveResultError(String code, String message) {
 		ZLogging.Log l = lh.newLog();
    	l.setSeverity(severity);
    	l.setOrigin(origin);
    	l.setErrorDescription(description);
    	l.setErrorCode(code);
    	l.setErrorMessage(message);
	 }

}