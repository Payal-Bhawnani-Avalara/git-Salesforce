public class ZuoraCustomerAccountTriggerHandler  extends TriggerHandler{
	
	 //Trigger Handler Methods
    /*
  	protected override void beforeInsert(){}

  	protected override void beforeUpdate(){}

    protected override void beforeDelete(){}

  	protected override void afterInsert(){}

  	protected override void afterDelete(){}

  	protected override void afterUndelete(){}
  	
  	 protected override void afterUpdate(){}
	*/
	
	 protected override void afterInsert(){
  	  afterInsertUpdate();
  	}
  	
  	protected override void afterUpdate(){
  	  afterInsertUpdate();
  	}
  	//Developer : Payal Bhawnani
  	//https://jira.avalara.com/browse/IBST-8309
  	//Moving the Automation of Process Builder " Roll up Billing Account Number to Account" on Billing Account object to Trigger due CPU time out error
  	 public void afterInsertUpdate(){
  	 Set<Id> zuoraCustomerAccountIDSet = new Set<Id>();
  	 Set<Id> accountIDs=new Set<Id>();
  	  for( Zuora__CustomerAccount__c zCA : (List<Zuora__CustomerAccount__c>)Trigger.new){
  	  		if(String.isNotBlank(zCA.Zuora__AccountNumber__c)){
	  	 		zuoraCustomerAccountIDSet.add(zCA.id);
	  	 		accountIDs.add(zCA.Zuora__Account__c);
  	  		}
  	 	// zCA.Zuora__Account__r.BillingAccountNumber_s__c = zCA.Zuora__Account__r.BillingAccountNumber_s__c +';' +zCA.Zuora__AccountNumber__c;
  	  }
  	  
  	  if(accountIDs.size()>0){
        List<Account> listAccounts=[Select Id,BillingAccountNumber_s__c,(Select Id,Zuora__AccountNumber__c From Zuora__R00N40000001kyLcEAI__r where id in : zuoraCustomerAccountIDSet) 
    											From Account Where Id=:accountIDs AND ActiveCustomer__c=true];
  	    for(Account acc : listAccounts){
  	    	  for(Zuora__CustomerAccount__c zCA:acc.Zuora__R00N40000001kyLcEAI__r){
  	    	  	if(String.isBlank(acc.BillingAccountNumber_s__c)){
  	    	  		acc.BillingAccountNumber_s__c='';
  	    	  	}
  	    	  	if(String.isNotBlank(zCA.Zuora__AccountNumber__c) &&!acc.BillingAccountNumber_s__c.containsIgnoreCase(zCA.Zuora__AccountNumber__c))
  	 	     {
  	 	     	if(String.isNotBlank(acc.BillingAccountNumber_s__c)){
  	 	     		acc.BillingAccountNumber_s__c+=';';
  	 	     	}
  	            acc.BillingAccountNumber_s__c += zCA.Zuora__AccountNumber__c;
  	          }
  	      }
       }
        //by pass account trigger 
		TriggerHandler.bypass('AccountTriggerHandler');
		TriggerHandler.bypass('ZuoraCustomerAccountTriggerHandler');
		Database.SaveResult[] dsrList=Database.update(listAccounts,false);
		Utility.createApexLog('ZuoraCustomerAccountTriggerHandler', dsrList,true);
		//TriggerHandler.clearBypass('AccountTriggerHandler');	
  	  }
  	 }
}