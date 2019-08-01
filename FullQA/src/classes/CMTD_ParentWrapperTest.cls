@isTest
public class CMTD_ParentWrapperTest {
     @testSetup static void setup() {
       createCustomSetting();
     }
      public static void createCustomSetting(){
     //Setup custom setting
       List<KeyPairValue__c> listKeyPairValue=new List<KeyPairValue__c>(); 
       listKeyPairValue.add(new KeyPairValue__c(Name='Boomi_API_URL_Sandbox',Values__c='http://api.salesforce.com/'));
       listKeyPairValue.add(new KeyPairValue__c(Name='Boomi_API_Key',Values__c='123456'));
       listKeyPairValue.add(new KeyPairValue__c(Name='Boomi_API_URL_Production',Values__c='http://api.salesforce.com/'));
       listKeyPairValue.add(new KeyPairValue__c(Name='ZTBuyAPICaseSafeID ',Values__c='00533000003RbvNAAS '));
       insert listKeyPairValue;
    }
    private static Account a;
	static testMethod void testgetAccountId(){
		Test.startTest();
	    	//Create an account
	    	Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
	        a =TestUtil.createAccount(customerAccountTypeId,1,true)[0];
	        Id implemetationCaseId=Schema.SObjectType.Case.getRecordTypeInfosByName().get('Implementation').getRecordTypeId();
	        Case  c =TestUtil.createCase(implemetationCaseId,1,false)[0];
	        c.accountid = a.id;
	        insert c;   
	        Case ca = [Select accountid from Case where id =:c.id];
	        System.assertEquals(ca.accountid,CMTD_ParentWrapper.getAccountId(c.id));
        Test.stopTest();		
	}
}