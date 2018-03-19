@isTest
public class ZuoraCustomerAccountTriggerHandlerTest {
	private static Account a;
	private static Zuora__CustomerAccount__c zCA;
	static testMethod void testCustomerAccountUpdate() {
    	Test.startTest();
	  //Create an account
    	   Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
       a =TestUtil.createAccount(customerAccountTypeId,1,false)[0];
       a.BillingAccountNumber_s__c = 'abc';
       a.ActiveCustomer__c = true;
       insert a;
       zCA= TestUtil.createZuoraCustomerAccount(a.id,1,true)[0];
    	   zCA.Zuora__AccountNumber__c = 'test';
    	   update zCA;
    	   
    	   Account accTest=[Select Id,BillingAccountNumber_s__c From Account Where Id=:a.id][0];								
    	   System.assertequals(accTest.BillingAccountNumber_s__c, 'abc;test');
      Test.stopTest();
    }  
    
    static testMethod void testBlankCustomerAccountUpdate() {
    	Test.startTest();
	  //Create an account
    	   Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
       a =TestUtil.createAccount(customerAccountTypeId,1,false)[0];
       a.ActiveCustomer__c = true;
       insert a;
       zCA= TestUtil.createZuoraCustomerAccount(a.id,1,true)[0];
    	   zCA.Zuora__AccountNumber__c = 'test';
    	   update zCA;
    	   
    	   Account accTest=[Select Id,BillingAccountNumber_s__c From Account Where Id=:a.id][0];								
    	   System.assertequals(accTest.BillingAccountNumber_s__c, 'test');
      Test.stopTest();
    }  
}