public class AccountTriggerHandler extends TriggerHandler {

    //Trigger Handler Methods
  	protected override void beforeInsert(){
  		beforeInsertUpdate();
  	}

  	protected override void beforeUpdate(){
  	 beforeInsertUpdate();
  	}
    /*
    protected override void beforeDelete(){}

    protected override void afterInsert(){}

    protected override void afterDelete(){}

    protected override void afterUndelete(){}
  */
    //Helper Methods
  
    public void beforeInsertUpdate(){
    /*Map<String,VATNumberRegex__c> vatNumber = VATNumberRegex__c.getAll();
     Id emeaAccountTypeId=[Select Id from RecordType where DeveloperName='EMEA_Account' limit 1].Id;
	   	  for(Account acc : (List<Account>)Trigger.new ){
	   	  	acc.VAT_Number_Format_Status__c = 'INVALID';
	   	    if(
	   	      String.isNotBlank(acc.EMEA_Resident_Country__c) && 
     	      vatNumber.containsKey(acc.EMEA_Resident_Country__c) && 
     	      String.isNotBlank(acc.VAT_Number__c)
     	      && acc.RecordTypeId==emeaAccountTypeId){
		   	     /*String VATRegax = VATNumberRegex__c.getInstance(acc.EMEA_Resident_Country__c).Regex__c;
		   	     Pattern VATPattern = Pattern.compile(VATRegax);
		   	     Matcher VATMAatcher = VATPattern.matcher(acc.VAT_Number__c);
		   	     system.debug(VATMAatcher.matches());
		   	     
	   	         if(VATMAatcher!=null && VATMAatcher.matches()){
	   	           acc.VAT_Number_Format_Status__c = 'VALID';
	   	         }
	   	         	acc.VAT_Number_Format_Status__c= Utility.vatNumberVerification(acc.EMEA_Resident_Country__c,acc.VAT_Number__c,acc.VAT_Number_Format_Status__c)	;        
	   	      }
        }*/
   }
   protected override void afterUpdate(){
    Set<Id> accountId = new Set<Id>();
        for( Account acc : (List<Account>)Trigger.new)
      {
          Account oldAcc = (Account)trigger.oldMap.get(acc.Id);
          if(acc.CUP_User__c != oldAcc.CUP_User__c ){ 
                    accountId.add(acc.Id);
          }
          /*if(contactId.size() > 100){
           con.addError('More than 100 Contacts are updated');
           return;
          }*/
          if(acc.ActiveCustomer__c == true &&  acc.ownerid != oldAcc.ownerid ){
           
          
          }
      }     
      if(accountId.size() > 0 && accountId.size() <= 100 && !System.isFuture() && !System.isBatch() && !System.isScheduled()){
        // future method call
            sendFutureCPUUserChanged(accountId);
        }
        // TriggerHandler.bypass('AccountTriggerHandler');
   }
    @future(callout=true)
      public static void sendFutureCPUUserChanged(Set<Id> accId){
      	if(!Test.isRunningTest()){
        		CC_AVA_BizTech_API.sendCPUUserChanged(accId);
      	}
      }
}