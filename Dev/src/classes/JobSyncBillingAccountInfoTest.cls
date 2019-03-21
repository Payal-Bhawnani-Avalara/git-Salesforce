@isTest
private class JobSyncBillingAccountInfoTest {
	private static Account a;
	private static Zuora__CustomerAccount__c zCA;
    static testMethod void testJobSyncBillingAccountInfo() {
    	Test.startTest();
	  //Create an account
    	   Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Prospect_Customer' limit 1].Id;
       a =TestUtil.createAccount(customerAccountTypeId,1,false)[0];
       a.BillingAccountNumber_s__c = 'abc';
       a.ActiveCustomer__c = true;
       insert a;
       zCA= TestUtil.createZuoraCustomerAccount(a.id,1,true)[0];
    	   zCA.Zuora__AccountNumber__c = 'test';
    	   zCA.Max_Days_Past_Due__c=1;
    	   zCA.Zuora__AutoPay__c=true;
    	   zCA.Zuora__Zuora_Id__c='123';
    	   zCA.Zuora__BillToState__c='WA';
    	   zCA.Zuora__BillToPostalCode__c='12345';
    	   zCA.Zuora__BillToCountry__c='US';
    	   zCA.Zuora__PaymentTerm__c='Due Upon Receipt';
    	   zCA.Zuora__AccountNumber__c='123';
    	   update zCA;
         JobSyncBillingAccountInfo job = new JobSyncBillingAccountInfo();
         ID batchprocessid = Database.executeBatch(job,50);     	   
    	 Test.stopTest();   
    	   Account accTest=[Select Id,BillingAccountNumber_s__c From Account Where Id=:a.id][0];								
    	   //System.assertequals(accTest.BillingAccountNumber_s__c, 'abc;test');
     
    }  
}