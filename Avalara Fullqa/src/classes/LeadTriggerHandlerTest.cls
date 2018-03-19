@isTest
private class LeadTriggerHandlerTest {
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
       listKeyPairValue.add(new KeyPairValue__c(Name='EloquaAvalaraCaseSafeID ',Values__c='00540000000yXrwAAE '));
       insert listKeyPairValue;
    }
	//https://jira.avalara.com/browse/SFCOM-8722?filter=-1
    static testMethod void testLinkPartnerWithContact() {
    		//Create partner account
    		Id partnerAccountRecordTypeId=[select id From RecordType Where sObjectType='Account' and DeveloperName='Partner_Certification' limit 1].Id;
        Account partnerAccount=TestUtil.createAccount(partnerAccountRecordTypeId,1,true)[0];
        Contact partnerContact=TestUtil.createContact(partnerAccount.Id,1,false)[0];
        partnerContact.Email='partnercontact@example.com';
        insert partnerContact;  
        Test.startTest();   
        List<Lead> listLead=TestUtil.createLead(100,true);
        for(Lead l:[Select Id,PartnerName__c,Portal_Contact__c,Partner_Rep_Email__c,Partner_Contact_Not_Found_Email_Sent__c From Lead Where Id=:listLead]){
        		System.assertEquals(l.PartnerName__c,null);
        		System.assertEquals(l.Portal_Contact__c,null);
        		System.assertEquals(l.Partner_Rep_Email__c,null);
        		System.assertEquals(l.Partner_Contact_Not_Found_Email_Sent__c,0);        	
        }
        
        for(Lead l:listLead){
        		l.Partner_Rep_Email__c='test@example.com';
        }
        update listLead;
        for(Lead l:[Select Id,PartnerName__c,Portal_Contact__c,Partner_Rep_Email__c,Partner_Contact_Not_Found_Email_Sent__c From Lead Where Id=:listLead]){
        		System.assertEquals(l.PartnerName__c,null);
        		System.assertEquals(l.Portal_Contact__c,null);
        		System.assertNotEquals(l.Partner_Rep_Email__c,null);
        		System.assertEquals(l.Partner_Contact_Not_Found_Email_Sent__c,1);        	
        }     
        for(Lead l:listLead){
        		l.Partner_Rep_Email__c=partnerContact.Email;
        }
        update listLead;
        for(Lead l:[Select Id,PartnerName__c,Portal_Contact__c,Partner_Rep_Email__c,Partner_Contact_Not_Found_Email_Sent__c From Lead Where Id=:listLead]){
        		System.assertEquals(l.PartnerName__c,partnerAccount.Id);
        		System.assertEquals(l.Portal_Contact__c,partnerContact.Id);
        		System.assertEquals(l.Partner_Rep_Email__c,partnerContact.Email);
        		System.assertEquals(l.Partner_Contact_Not_Found_Email_Sent__c,1);        	
        }            
        Test.stopTest();   
    }
    //https://jira.avalara.com/browse/IBST-7371
    static testMethod void testPartnerContactUpdate6MonthsBefore() {
    	    //Create partner account
    		Id partnerAccountRecordTypeId=[select id From RecordType Where sObjectType='Account' and DeveloperName='Partner_Certification' limit 1].Id;
        Account partnerAccount=TestUtil.createAccount(partnerAccountRecordTypeId,1,true)[0];
        //Create an account
    	    Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
        Account customerAccount =TestUtil.createAccount(customerAccountTypeId,1,true)[0];
        String EloquaAvalaraCaseSafeID='';
        EloquaAvalaraCaseSafeID =KeyPairValue__c.getInstance('EloquaAvalaraCaseSafeID').Values__c;  
        USer u = [Select id from User where id =: EloquaAvalaraCaseSafeID];
        Test.startTest();   
        Lead lead=TestUtil.createLead(1,false)[0];
        lead.Prior_Channel_Partner_Name_Change_Date__c = system.today();    
        lead.PartnerName__c =  customerAccount.id;
        insert lead;
        
        System.runAs(u){
          lead.PartnerName__c =  partnerAccount.id;
          update lead;
        }
        Test.stopTest();   
    }
    
     //https://jira.avalara.com/browse/IBST-7371
    static testMethod void testPartnerContactUpdate6MonthsAfter() {
    	    //Create partner account
    		Id partnerAccountRecordTypeId=[select id From RecordType Where sObjectType='Account' and DeveloperName='Partner_Certification' limit 1].Id;
        Account partnerAccount=TestUtil.createAccount(partnerAccountRecordTypeId,1,true)[0];
        //Create an account
    	    Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
        Account customerAccount =TestUtil.createAccount(customerAccountTypeId,1,true)[0];
        String EloquaAvalaraCaseSafeID='';
        EloquaAvalaraCaseSafeID =KeyPairValue__c.getInstance('EloquaAvalaraCaseSafeID').Values__c;  
        USer u = [Select id from User where id =: EloquaAvalaraCaseSafeID];
        Test.startTest();   
        Lead lead=TestUtil.createLead(1,false)[0];
        lead.Prior_Channel_Partner_Name_Change_Date__c = Date.newInstance(2016, 12, 9);    
        lead.PartnerName__c =  customerAccount.id;
        insert lead;
        
        System.runAs(u){
          lead.PartnerName__c =  partnerAccount.id;
          update lead;
        }
        Test.stopTest();   
    }
    //https://jira.avalara.com/browse/IBST-8008
     //Devloper : Payal Bhawnani 01/23/2018
    static testMethod void testLeadconversion() {
    	   Lead lc=TestUtil.createLead(1,true)[0];
    	   lc.status = 'Converted';
    	   update lc;
	   Lead l=  [SELECT Id,Status, FirstName,LastName,Company,LeadSource FROM Lead WHERE Id = :lc.Id];
	   System.assertEquals('Converted', l.Status);
    	  
    }
}