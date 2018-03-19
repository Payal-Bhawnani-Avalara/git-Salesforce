@isTest
private class AccountTriggerHandlerTest {
     @testSetup static void setup() {
       //Setup custom setting
       List<CC_AVA_KeyPairValue__c> listCC_AVA_KeyPairValue=new List<CC_AVA_KeyPairValue__c>(); 
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_URL_Sandbox',Value__c='http://api.salesforce.com/'));
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_APIKEY_Sandbox',Value__c='123456'));
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_URL_Production',Value__c='http://api.salesforce.com/'));
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_APIKEY_Production',Value__c='123456'));
       insert listCC_AVA_KeyPairValue;
     }
    static testMethod void test50AccountCPUUserChanged() {
    	Test.startTest();
	  //Create an account
    	   Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
       List<Account> listAcc =TestUtil.createAccount(customerAccountTypeId,50,true);
    	   for(Account acc : listAcc){
    	   	 acc.CUP_User__c = true;
    	   }
    	   TriggerHandler.clearBypass('AccountTriggerHandler');
       update listAcc;
       Test.setMock(HttpCalloutMock.class, new TestMockHttpResponseGenerator() );
      Test.stopTest();
    }  
    
    static testMethod void test101AccountCPUUserChanged() {
    	Test.startTest();
	  //Create an account
    	   Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
      List<Account> listAcc =TestUtil.createAccount(customerAccountTypeId,101,true);
    	   for(Account acc : listAcc){
    	   	 acc.CUP_User__c = true;
    	   }
    	   TriggerHandler.clearBypass('AccountTriggerHandler');
       update listAcc;
       /*}
       catch(Exception e){
       	   Boolean expectedExceptionThrown =  e.getMessage().contains('More than 100 Contacts are updated') ? true : false;
           System.AssertEquals(expectedExceptionThrown, true);
       }*/
       Test.setMock(HttpCalloutMock.class, new TestMockHttpResponseGenerator() );
      Test.stopTest();
    }    
}