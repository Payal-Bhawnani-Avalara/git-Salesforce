@isTest
public class ZuoraCustomerAccountTriggerHandlerTest {
      @testSetup static void setup() {
       //Setup custom setting
       List<CC_AVA_KeyPairValue__c> listCC_AVA_KeyPairValue=new List<CC_AVA_KeyPairValue__c>(); 
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_URL_Sandbox',Value__c='http://api.salesforce.com/'));
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_APIKEY_Sandbox',Value__c='123456'));
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_URL_Production',Value__c='http://api.salesforce.com/'));
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_APIKEY_Production',Value__c='123456'));
       insert listCC_AVA_KeyPairValue;
       
       //Setup VAT Number Custom Setting
      /* List<VATNumberRegex__c> listVATNumberRegex=new List<VATNumberRegex__c>(); 
       listVATNumberRegex.add(new VATNumberRegex__c(Name='Austria',Regex__c='^(AT)?U[0-9]{8}$'));
       insert listVATNumberRegex;*/
     }
	private static Account a;
	private static Zuora__CustomerAccount__c zCA;
	static testMethod void testCustomerAccountUpdate() {
    	Test.startTest();
	  //Create an account
    	   Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Prospect_Customer' limit 1].Id;
       a =TestUtil.createAccount(customerAccountTypeId,1,false)[0];
       a.BillingAccountNumber_s__c = 'abc';
       a.ActiveCustomer__c = true;
       insert a;
       zCA= TestUtil.createZuoraCustomerAccount(a.id,1,true)[0];
    	   zCA.Zuora__AccountNumber__c = 'test';
    	   update zCA;
    	 Test.stopTest();   
    	   Account accTest=[Select Id,BillingAccountNumber_s__c From Account Where Id=:a.id][0];								
    	   //System.assertequals(accTest.BillingAccountNumber_s__c, 'abc;test');
     
    }  
    
    static testMethod void testBlankCustomerAccountUpdate() {
    	Test.startTest();
	  //Create an account
    	   Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Prospect_Customer' limit 1].Id;
       a =TestUtil.createAccount(customerAccountTypeId,1,false)[0];
       a.ActiveCustomer__c = true;
       insert a;
       zCA= TestUtil.createZuoraCustomerAccount(a.id,1,true)[0];
    	   zCA.Zuora__AccountNumber__c = 'test';
    	   update zCA;
    	 Test.stopTest();   
    	   Account accTest=[Select Id,BillingAccountNumber_s__c From Account Where Id=:a.id][0];								
    	   //System.assertequals(accTest.BillingAccountNumber_s__c, 'test');
     
    }  
}