@isTest
public class CaseTriggerHandlerTest {
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
	private static List<Contact> listContact;
	static void init(){
    		//Create an account
    		Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
        a =TestUtil.createAccount(customerAccountTypeId,1,false)[0];
        a.PROD_AvaTax_Account__c='123456';
        insert a;
        //create a contact and make one as ComplianceContact__c
        listContact=TestUtil.createContact(a.Id,5,false);
        listContact[0].ComplianceContact__c=true;
        insert listContact;
        		
	}
    static testMethod void testTreasuryServiceCase() {
    		init();
		//create cases and setup Treasury_Account_ID__c same as account PROD_AvaTax_Account__c
        Id treasuryServiceCaseId=[Select Id from RecordType where DeveloperName='Treasury_Service_Case' limit 1].Id;
        List<Case> listCases =TestUtil.createCase(treasuryServiceCaseId,5,false);
        for(Case c:listCases){
        		c.Treasury_Account_ID__c=a.PROD_AvaTax_Account__c;
        }
        insert listCases;
        //validate that account and contact is populated on case
        listCases=[Select Id,AccountId,ContactId From Case Where Id=:listCases];
        for(Case c:listCases){
        		System.assertEquals(a.Id,c.AccountId);
        		System.assertEquals(listContact[0].Id,c.ContactId);
        }
        
        for(Case c:listCases){
        		c.AccountId=null;
        		c.ContactId=null;
        }
        update listCases;
        //validate that account and contact is populated on case
        listCases=[Select Id,AccountId,ContactId From Case Where Id=:listCases];
        for(Case c:listCases){
        		System.assertEquals(a.Id,c.AccountId);
        		System.assertEquals(listContact[0].Id,c.ContactId);
        }                 
    }
    static testMethod void testOtherRecordTypes() {
    		init();
		//create cases and setup Treasury_Account_ID__c same as account PROD_AvaTax_Account__c
        Id treasuryServiceCaseId=[Select Id from RecordType where DeveloperName!='Treasury_Service_Case' AND sObjectType='Case' limit 1].Id;
        List<Case> listCases =TestUtil.createCase(treasuryServiceCaseId,5,false);
        for(Case c:listCases){
        		c.Treasury_Account_ID__c=a.PROD_AvaTax_Account__c;
        		c.Related_Amendment_s__c = 'N/A';
        		c.accountId = a.id;
        }
        insert listCases;
        //validate that account and contact is populated on case
        listCases=[Select Id,AccountId,ContactId From Case Where Id=:listCases];
        for(Case c:listCases){
        		//System.assertNotEquals(a.Id,c.AccountId);
        		System.assertNotEquals(listContact[0].Id,c.ContactId);
        }        
    } 
    
     static testMethod void testCaseStatusDeprovisioning() {
    	    init();
	    	Test.startTest();	
			//create cases of recordtype Cancellation and changed status to deprovisioning 
	        Id Cancellation=[Select Id from RecordType where DeveloperName!='Cancellation' AND sObjectType='Case' limit 1].Id;
	        Case c =TestUtil.createCase(Cancellation,1,false)[0];
	        		c.status='New';
	        		c.Related_Amendment_s__c = 'N/A';
	        		c.accountId = a.id;
	        insert c;   
	         c.status='Confirmed';
	         c.Approved_By_Billing__c=true;
	         c.Charge_Number__c='123';
	         //c.Related_Amendment_s__c = '1-AM00685930, 1-AM00685931,1-AM00685932';
	        update c;
	         Test.setMock(HttpCalloutMock.class, new TestMockHttpResponseGenerator() );
	     Test.stopTest();   
    }       
     static testMethod void testCaseIIA() {
    	    init();
	    	Test.startTest();	
			//create cases of recordtype Cancellation and changed status to deprovisioning 
	        Id Cancellation=[Select Id from RecordType where DeveloperName!='Cancellation' AND sObjectType='Case' limit 1].Id;
	        Case c =TestUtil.createCase(Cancellation,1,false)[0];
	        		c.status='New';
	        		c.Related_Amendment_s__c = 'N/A';
	        		c.accountId = a.id;
	        insert c;   
	         c.Invoice_Number__c='INV00138574';
	         //c.Related_Amendment_s__c = '1-AM00685930, 1-AM00685931,1-AM00685932';
	        update c;
	         Test.setMock(HttpCalloutMock.class, new TestMockHttpResponseGenerator() );
	     Test.stopTest();   
    }   
}