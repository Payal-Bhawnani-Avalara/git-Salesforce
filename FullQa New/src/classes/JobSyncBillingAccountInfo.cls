//This class will make Opportunity Contact Role Primary if Opportunity has only one contact role 
/*CRON :JobSyncBillingAccountInfo m = new JobSyncBillingAccountInfo();
        String seconds = '0'; //Execute at Zero Seconds
        String minutes = '30'; //Execute at every 0 minute of hour
        String hours = '*'; // Execute at 1 AM
        String dayOfMonth = '*'; // Execute Every Day of the Month
        String month = '*'; //Execute every Month
        String dayOfWeek = '?'; //Execute on all 7 days of the Week
        //ID oppbatchprocessid = Database.executeBatch(m,200);  
        
        //Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        String sch = seconds + ' ' + minutes + ' ' + hours + ' ' + dayOfMonth + ' ' + month + ' ' + dayOfWeek;
        //String sch = '0 0 01 * * ?';
        system.schedule('JobSyncBillingAccountInfo Run Everyday 30 minutes', sch, m);  */
global class JobSyncBillingAccountInfo implements Database.Batchable<sObject>, Schedulable, Database.Stateful {
    global void execute(SchedulableContext sc) {
         JobSyncBillingAccountInfo job = new JobSyncBillingAccountInfo();
         ID batchprocessid = Database.executeBatch(job,50); 
    }
    global Database.QueryLocator start(Database.BatchableContext BC) {
    		String query='Select Id from account where id in (select Zuora__Account__c from Zuora__CustomerAccount__c where lastmodifieddate>=yesterday AND LastModifiedBy.Id!=\'0050b000004pGls\')';
        return Database.getQueryLocator(query);
    }
  
    global void execute(Database.BatchableContext BC, List<Account> objList) {
    		if(objList!=null && objList.size()>0){
			List<Account> listAccounts=new List<Account>();	
			List<Zuora__CustomerAccount__c> listZCA=new List<Zuora__CustomerAccount__c>();							     			
    			for(Account a:[SELECT Id,AR_Max_Days_Past_Due__c,Zuora_Autopay__c,Zuora_Account_ID__c,Routing_State__c,
						  Routing_Zip__c,Routing_Country__c,Zuora_Master_Term__c,BillingAccountNumber_s__c,
						  	(SELECT Id,Zuora__AutoPay__c,Max_Days_Past_Due__c,Primary_Billing_Contact__c ,Invoice_Additional_To__c,
						  		Zuora__PurchaseOrderNumber__c,Zuora__Status__c,Zuora__Zuora_Id__c,Zuora__BillToState__c,
								Zuora__BillToPostalCode__c,Zuora__BillToCountry__c,Zuora__PaymentTerm__c,Zuora__AccountNumber__c 
								FROM R00N40000001kyLcEAI__r 
								ORDER BY LastModifiedDate ASC) 
					  	  FROM Account 
						  WHERE Id=:objList ]){
    				
    				Boolean updateAccount=false;
    				String oldValue=a.BillingAccountNumber_s__c;
    				String newValue='';
    				listZCA.addAll(a.R00N40000001kyLcEAI__r);
    				for(Zuora__CustomerAccount__c zca:a.R00N40000001kyLcEAI__r){
    					//Maintain AR Flag
    					//AND(OR(ISNEW(), ISCHANGED(Max_Days_Past_Due__c )), Zuora__Account__r.AR_Max_Days_Past_Due__c!=Max_Days_Past_Due__c )
    					if(a.AR_Max_Days_Past_Due__c!=zca.Max_Days_Past_Due__c){
    						a.AR_Max_Days_Past_Due__c=zca.Max_Days_Past_Due__c;
    						updateAccount=true;
    					}
    					//AutoPay to account from Billing account TRUE
    					if(a.Zuora_Autopay__c!=zca.Zuora__AutoPay__c){
    						a.Zuora_Autopay__c=zca.Zuora__AutoPay__c;
    						updateAccount=true;
    					}
    					//Mantain Zuora ID at Account Level
    					if(a.Zuora_Account_ID__c!=zca.Zuora__Zuora_Id__c && zca.Zuora__Status__c!='Canceled'){
    						a.Zuora_Account_ID__c=zca.Zuora__Zuora_Id__c;
    						updateAccount=true;
    					}
    					if(a.Routing_State__c!=zca.Zuora__BillToState__c ){
    						a.Routing_State__c=zca.Zuora__BillToState__c;
    						updateAccount=true;
    					}
    					if(a.Routing_Zip__c!=zca.Zuora__BillToPostalCode__c){
    						a.Routing_Zip__c=zca.Zuora__BillToPostalCode__c;
    						updateAccount=true;
    					}
    					if(a.Routing_Country__c!=zca.Zuora__BillToCountry__c ){
    						a.Routing_Country__c=zca.Zuora__BillToCountry__c;
    						updateAccount=true;
    					}
    					String paymentTerm=zca.Zuora__PaymentTerm__c== 'Net 7'?'Due Upon Receipt':zca.Zuora__PaymentTerm__c;
    					/*if(a.Billing_Account_Payment_Methods__c!=paymentTerm ){
    						a.Billing_Account_Payment_Methods__c=paymentTerm;
    						updateAccount=true;
    					} */
    					if(a.Zuora_Master_Term__c!=paymentTerm ){
    						a.Zuora_Master_Term__c=paymentTerm;
    						updateAccount=true;
    					}
		  	    	  if(String.isNotBlank(zca.Zuora__AccountNumber__c) &&!newValue.containsIgnoreCase(zca.Zuora__AccountNumber__c))
		  	 	  {
		  	 	     if(String.isNotBlank(newValue)){
		  	 	     		newValue+=';';
		  	 	     }
		  	         newValue += zca.Zuora__AccountNumber__c;
		  	      }    					    					   					
    				}
    				if(newValue!=oldValue){
    					a.BillingAccountNumber_s__c=newValue;
    					updateAccount=true;
    				}
    				if(updateAccount){
    					listAccounts.add(a);
    				}
    			}
    			Database.SaveResult[] dsrList=Database.update(listAccounts,false);
    			Utility.createApexLog('JobSyncBillingAccountInfo ', dsrList,true);
    			update listZCA;
    		}
    }
    global void finish(Database.BatchableContext BC) { 
        
    }    
}