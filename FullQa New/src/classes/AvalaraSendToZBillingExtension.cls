/******************************************************************************************
* Class: AvalaraSendToZBillingExtension
* Description: Functions required to to implement "Carry Foward Usage" feature
*
* Author: Paul Nguyen, Zuora, Inc.
* Date: 03/20/2014
******************************************************************************************/


/******************************************************************************************
* Function: Helper functions to facilitate the carry forward usage process
* 
* Param: N/A
* Return: N/A
******************************************************************************************/
public with sharing class AvalaraSendToZBillingExtension {
	
	private string quoteId{
		get;
		set;
	}

	private string subQuoteId{
		get;
		set;
	}

	private String accountId{
		get;
		set;
	}

	private String subscriptionId{
		get;
		set;
	}

	//V1 of Subscription.Id
	private String originalId{
		get;
		set;
	}

	private Zuora.zApi zApi;

	//Key = UOM, Value = Charge.Id
	private Map<String,String> uomToChargeNumberMap;
	//Key = UOM, Value = Quantity of that usage charge
	private Map<String,Integer> uomToQuantityMap;


	/******************************************************************************************
	* Function: Constructor for AvalaraSendToZBillingExtension
	* 
	* Param: ApexPages.StandardController controller - the zqu__Quote__c controller
	* Return: N/A
	******************************************************************************************/
	public AvalaraSendToZBillingExtension(String mainQuoteId, String secondaryQuoteId){

		zApi = new Zuora.zApi();
		if(!Test.isRunningTest())
			zApi.zLogin(); 

		quoteId = mainQuoteId;
		subQuoteId = secondaryQuoteId;

		List<zqu__Quote__c> quoteList =	[select Id,zqu__ExistSubscriptionID__c,zqu__Subscription_Name__c
										from zqu__Quote__c where Id =: quoteId];

		zqu__Quote__c selectedQuote = quoteList.get(0);

		String subName = selectedQuote.zqu__Subscription_Name__c;

		//Sets the accountId and originalId
		findZuoraInfoFromSubscription(subName);

		System.debug('##OriginalId' + originalId);
		System.debug('##AccountId' + accountId);

		System.debug('##quoteId' + quoteId);

		uomToChargeNumberMap = new Map<String,String>();
		uomToQuantityMap = new Map<String,Integer>();

		doUsageLogic();
		
	}

	
	/******************************************************************************************
	* Function: From the Quote level, find Usage charges that have been "upgraded" and carry over the usage quantity
	* 
	* Param: N/A
	* Return: N/A
	******************************************************************************************/
	public void doUsageLogic(){

		List<Zuora.zObject> qrpcList = getCarryForwardCharges();

		System.debug('##ForwardCharges Size:' + qrpcList.size());

		uomToChargeNumberMap = findMatchingUOM(qrpcList);

		System.debug('##uomToChargeNumberMap Size:' + uomToChargeNumberMap.size());

		for(String uomType : uomToChargeNumberMap.keySet()){
			List<Zuora.zObject> usageList = getUsageFromZuora(uomType);

			System.debug('##Usage list:' + usageList.size());

			Integer quantity = countUpUsageQuantity(usageList);

			System.debug('##Usage Quantity:' + quantity);

			uomToQuantityMap.put(uomType, quantity);
		}

		System.debug('##uomToQuantityMap size' + uomToQuantityMap.size());

		List<Zuora.zApi.SaveResult> createResults = createUsageInZuora();
	}


	/******************************************************************************************
	* Function: Find the Zuora RatePlanCharges where CarryFoward__c = 'True';
	* 
	* Param: N/A
	* Return: List<Zuora.zObject> - list of RatePlanCharge from Zuora
	******************************************************************************************/
	public List<Zuora.zObject> getCarryForwardCharges(){

		List<String> rpList = findZuoraRatePlanIds(subscriptionId);

		System.debug('rpList '+ rpList);

		//Filters by Type = 'Usage' and CarryForward__c = 'True';
		List<Zuora.zObject> rpcList = findZuoraRatePlanCharges(rpList);
		
		return rpcList;
	}
	

	/******************************************************************************************
	* Function: Find the QuoteRatePlanCharge being removed, match the UOMs that need to be carried foward
	* 
	* Param: List<Zuora.zObject> zRpcList - list of original charge Ids from Zuora
	* Return: Map<String,String> uomMap- Map with UOM type as key, the Zuora Id of the usage charge as value
	******************************************************************************************/
	//find the charges being removed, match the ones added to the uom return the matching ones
	public Map<String,String> findMatchingUOM(List<Zuora.zObject> zRpcList){

		Set<String> idSet = new Set<String>();
		idSet.add(quoteId);
		idSet.add(subQuoteId);

		System.debug('qutoeId' + quoteId);
		System.debug('subId' + subQuoteId);

		/*Find the QuoteRatePlanCharge that were removed in the 'RemoveProduct' amendment   */
		List<zqu__QuoteAmendment__c> qaList = 	[Select Id 
												from zqu__QuoteAmendment__c 
												where  zqu__Quote__r.zqu__Status__c = 'Sent to Z-Billing' 
												and zqu__Quote__r.Id IN :idSet];


		//RemoveProduct rate plans
		List<zqu__QuoteRatePlan__c> rpQrpList = [Select Id, zqu__ProductRatePlanZuoraId__c
												from zqu__QuoteRatePlan__c 
												where zqu__QuoteAmendment__c IN : qaList and zqu__AmendmentType__c = 'RemoveProduct'];
		

		Set<String> rpZId = new Set<String>();
		for(zqu__QuoteRatePlan__c qrp: rpQrpList){
			rpZId.add(qrp.zqu__ProductRatePlanZuoraId__c);
		}


		List<zqu__ProductRatePlan__c> prpList =	[Select Id, Name, zqu__ZuoraId__c 
												from zqu__ProductRatePlan__c 
												where zqu__ZuoraId__c IN :rpZId];

		System.Debug('All prpc: ' + [SELECT Name , zqu__Type__c FROM zqu__ProductRatePlanCharge__c WHERE zqu__ProductRatePlan__c IN :prpList]);

		List<zqu__ProductRatePlanCharge__c> prpcList = 	[Select Id, zqu__UOM__c
														from zqu__ProductRatePlanCharge__c
														where zqu__Type__c = 'Usage' and zqu__ProductRatePlan__c IN :prpList ];

		//NewProduct rate plans
		List<zqu__QuoteRatePlan__c> npQrpList =	 [Select Id 
												from zqu__QuoteRatePlan__c 
												where zqu__QuoteAmendment__c IN : qaList and zqu__AmendmentType__c = 'NewProduct'];

		//NewProduct rate plan charges
		List<zqu__QuoteRatePlanCharge__c> npQrpcList = 	[Select Id,zqu__UOM__c 
														from zqu__QuoteRatePlanCharge__c 
														where zqu__ChargeType__c = 'Usage' and zqu__QuoteRatePlan__c IN :npQrpList];
		System.debug('qlist' + qaList);
		System.debug('rpQrpList' + rpQrpList);
		System.debug('rpZId' + rpZId);		
		System.debug('prpList' + prpList);
		System.debug('prpList' + prpList);
		System.debug('prpcList' + prpcList);
		System.debug('npQrpList' + npQrpList);
		System.debug('npQrpcList' + npQrpcList);

		List<String> uomList = new List<String>();
		List<zqu__QuoteRatePlanCharge__c> matchedList = new List<zqu__QuoteRatePlanCharge__c>();

		Map<String,String> uomMap = new Map<String,String>();


		System.debug('uomList' + uomList);
		System.debug('matchedList' + matchedList);
		System.debug('uomMap' + uomMap);
		System.debug('matchedList' + matchedList);


		//Compare charges being removed and charges being added, if the UOMs match we need to carry forward that usage
		for(zqu__ProductRatePlanCharge__c prpc : prpcList){
			String rpUOM = prpc.zqu__UOM__c;
			for(zqu__QuoteRatePlanCharge__c npQrpc : npQrpcList){
				String npUOM = npQrpc.zqu__UOM__c;
				if(rpUOM == npUOM){
					uomList.add(rpUOM);
				}
			}
		}

		System.debug('##uomList size:'+uomList.size());

		//Create a map of UOM as key, original charge Id as value

		System.debug('zRpcList' + zRpcList);
		System.debug('uomList' + uomList);




		for(Zuora.zObject zRpc : zRpcList){
			for(String matchUOM : uomList){
				String zUOM = (String)zRpc.getValue('UOM');	
				if(matchUOM == zUOM){
					String chargeNumber = (String) zRpc.getValue('ChargeNumber');
					uomMap.put(zUOM,chargeNumber);
				}	
			}
		}

		System.debug('##uomToChargeMap size:'+uomMap.size());


		return uomMap;
	}
	

	/******************************************************************************************
	* Function: Query for the usage records that need to be carried forward based on UOM
	* 
	* Param: String uomType -  Name of the UOM type
	* Return: List<Zuora.zObject> usageList- List of Zuora usage records to be counted
	******************************************************************************************/
	public List<Zuora.zObject> getUsageFromZuora(String uomType){
		List<Zuora.zObject> usageList = new List<Zuora.zObject>();
		
		List<zqu__Quote__c> quoteList = [select Id, Name, zqu__SubscriptionTermStartDate__c, zqu__SubscriptionTermEndDate__c 
										from zqu__Quote__c 
										where Id = :quoteId];

		zqu__Quote__c selectedQuote = quoteList.get(0);

		System.debug('###quoteList:' +quoteList);
		
		String startDate = zuora.zUtil.getZuoraDate(selectedQuote.zqu__SubscriptionTermStartDate__c);
		String endDate = zuora.zUtil.getZuoraDate(selectedQuote.zqu__SubscriptionTermEndDate__c);
		
		//To qualify, usage's start date must fall within Sub.start date & sub.endDate && caryfoward = 'true' and UOM = 'UOM'
		//Add CarryForward__c flag
		String request = 'SELECT id, quantity, UOM from Usage';
		String filter = ' WHERE CarryForward__c = \'True\' and UOM =\'' + uomType + '\' and AccountId =\'' + accountId + '\' and StartDateTime >= ' + startDate + ' and StartDateTime <= ' + endDate;
		String query = request + filter;
		
		try{
			System.debug('Get usage query:'+query);
			usageList = zapi.zQuery(query);
		}
		catch(Exception ex){
			System.Debug(ex.getMessage());
		}

		return usageList;
	}


	/******************************************************************************************
	* Function: Add the usage amounts in a list
	* 
	* Param: List<Zuora.zObject> usageList- List of Zuora usage records to be counted
	* Return: Integer total - total quantity of records
	******************************************************************************************/
	public Integer countUpUsageQuantity(List<zuora.Zobject> usageList){
		Integer total = 0;
		for(Zuora.zObject usage : usageList){
			Decimal decQuantity = (Decimal) usage.getValue('Quantity');
			Integer intQuantity = decQuantity.intValue();
			total += intQuantity;
		}
		return total;
	}

	/******************************************************************************************
	* Function: Prepares the Usage object to be passed onto a Zuora create() call
	* 
	* Param: String accId - 32 digit Zuora Account Id
	*		String subId - 32 digit Subscription Id of the V1 subscription or originalId
	*		String chargeId - 32 digit Charge Id of the original charge
	*		String uomType - type of UOM
	*		Integer quantity - quantity to carry forward
	* Return: Integer total - total quantity of records
	******************************************************************************************/
	public Zuora.zObject createUsageObject(String accId, String subId, String chargeNumber, String uomType, Integer quantity){

		Datetime today = Datetime.now();
		String effectiveDate = zuora.zUtil.getZuoraDate(today);

		Zuora.zObject usage = new Zuora.zObject('Usage');
		usage.setValue('AccountId', accId);
		usage.setValue('SubscriptionId', subId);
		usage.setValue('ChargeNumber', chargeNumber);
		usage.setValue('Quantity', quantity);
		usage.setValue('UOM', uomType);
		usage.setValue('StartDateTime', effectiveDate);
		usage.setValue('Description', 'Carry Forward Usage');

		return usage;
	}

	/******************************************************************************************
	* Function: Processes the create() call to Zuora to create Usage records
	* 
	* Param: N/A
	* Return: List<Zuora.zApi.SaveResult> createResult - create results returned by Zuora
	******************************************************************************************/
	public List<Zuora.zApi.SaveResult> createUsageInZuora(){

		Boolean isSuccessful = false;
		
		List<Zuora.zObject> usageList = new List<Zuora.zObject>();

		for(String uomString : uomToChargeNumberMap.keySet()){
			Integer quantity = uomToQuantityMap.get(uomString);
			String chargeNumber = uomToChargeNumberMap.get(uomString);
			Zuora.zObject usageObj = createUsageObject(accountId,originalId,chargeNumber,uomString,quantity);
			System.debug('##accountId: ' + accountId);
			System.debug('##originalId: ' + originalId);
			System.debug('##chargeId: ' + chargeNumber);
			System.debug('##uomString: ' + uomString);
			System.debug('##quantity: ' + quantity);
			usageList.add(usageObj);
		}
		
		List<Zuora.zApi.SaveResult> createResults = new List<Zuora.zApi.SaveResult>();
		
		try{
			createResults = !Test.isRunningTest() ? zApi.zCreate(usageList) : AvaSendToZbillingControllerTest.createRes;

			for (Zuora.zApi.SaveResult result : createResults) {
				if (result.Success) {
					isSuccessful = true;
					System.debug('Success creating Usage in Zuora');
				} 
				else {
					Zuora.zObject[] errors = result.errors;
					for (Zuora.zObject err : errors) {
						String errorCode = (String) err.getValue('Code');
						String message = (String) err.getValue('Message');
						System.debug(errorCode + ': ' + message);
					}
				}
			}
		} 
		catch (zqu.ZQException e) {
			System.debug('Error while updating an account in Zuora');
		}      

		return createResults;
	}	


	/******************************************************************************************
	* Function: Finds the account Id and original Id of subscription
	* 
	* Param: String subscriptionId - subscription Id of the quote being amended
	* Return: N/A
	******************************************************************************************/
	public void findZuoraInfoFromSubscription(String subName){
		String request = 'Select Id, AccountId, OriginalId, SubscriptionStartDate, SubscriptionEndDate from Subscription';
		String filter = ' where Status = \'Active\' and Name =\'' + subName + '\'';
		String query = request + filter;
		
		List<Zuora.zObject> subList = new List<Zuora.zObject>();

		try{
			System.debug('##Z InfoQuery:' + query);

			subList = !Test.isRunningTest() ? zApi.zQuery(query) : AvaSendToZbillingControllerTest.origSubQueryRes;
		}
		catch(Exception ex){
			System.Debug(ex.getMessage());
		}

		accountId = (String) subList.get(0).getValue('AccountId');
		subscriptionId = (String) subList.get(0).getValue('Id');
		originalId= (String) subList.get(0).getValue('OriginalId');

	}

	/******************************************************************************************
	* Function: Finds the account Id and original Id of subscription
	* 
	* Param: String subscriptionId - subscription Id of the quote being amended
	* Return: N/A
	******************************************************************************************/
	public List<String> findZuoraRatePlanIds(String subscriptionId){
		List<Zuora.zObject> rpList = new List<Zuora.zObject>();
		List<String> rpIdList = new List<String>();

		String request = 'Select Id from RatePlan';
		String filter = ' where SubscriptionId =\'' + subscriptionId + '\'';
		String query = request + filter;

		try{
			System.debug('##RatePlan Query:' + query);
			rpList = !Test.isRunningTest() ? zApi.zQuery(query) : AvaSendToZbillingControllerTest.ratePlanQueryRes;
		}
		catch(Exception ex){
			System.Debug(ex.getMessage());
		}

		for(Zuora.zObject rp : rpList){
			String rpId = (String) rp.getValue('Id');
			rpIdList.add(rpId);
		}

		return rpIdList;
	}

	/******************************************************************************************
	* Function: Finds Zuora Rate Plan Charge Ids from the inputted Rate Plans
	* 
	* Param: List<String> ratePlanIdList - List of Zuora Rate Plan Ids
	* Return: List<Zuora.zObject> rpcList - List of Zuora Rate Plan Charge Ids
	******************************************************************************************/
	public List<Zuora.zObject> findZuoraRatePlanCharges(List<String> ratePlanIdList){
		List<Zuora.zObject> rpcList = new List<Zuora.zObject>();

		String request = 'Select Id,ChargeNumber,UOM from RatePlanCharge';
		String filter = ' where ChargeType=\'Usage\' and '  + createOrString(ratePlanIdList,'RatePlanId');
		String query = request + filter;



		try{
			System.debug('##RatePlanCharge Query:' + query);
			rpcList = !Test.isRunningTest() ? zApi.zQuery(query) : AvaSendToZbillingControllerTest.ratePlanChargeQueryRes;
		}
		catch(Exception ex){
			System.Debug(ex.getMessage());
		}

		return rpcList;
	}

	/******************************************************************************************
	* Function: Creates multiple "or" strings to append a ZOQL query
	* 
	* Param: List<String> idList - List of Ids
	*		String fieldName - the name of the field to be repeated
	* Return: String result - the resulting "or" string
	******************************************************************************************/
	public String createOrString(List<String> idList, String fieldName){
		Integer size = idList.size();
		String result = '';
		if(size >= 1){
			result += fieldName + '=\'' + idList.remove(0) + '\'';

			for(String rpId : idList){
				result += ' or ' + fieldName + '=\'' + rpId + '\'';
			}
		}
		return result;
	}

}