@isTest
private class ContactTriggerHandlerTest {
     @testSetup static void setup() {
       //Setup custom setting
       List<CC_AVA_KeyPairValue__c> listCC_AVA_KeyPairValue=new List<CC_AVA_KeyPairValue__c>(); 
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_URL_Sandbox',Value__c='http://api.salesforce.com/'));
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_APIKEY_Sandbox',Value__c='123456'));
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_URL_Production',Value__c='http://api.salesforce.com/'));
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_APIKEY_Production',Value__c='123456'));
       insert listCC_AVA_KeyPairValue;
       //Setup custom setting
       List<KeyPairValue__c> listKeyPairValue=new List<KeyPairValue__c>(); 
       listKeyPairValue.add(new KeyPairValue__c(Name='Boomi_API_URL_Sandbox',Values__c='http://api.salesforce.com/'));
       listKeyPairValue.add(new KeyPairValue__c(Name='Boomi_API_Key',Values__c='123456'));
       listKeyPairValue.add(new KeyPairValue__c(Name='Boomi_API_URL_Production',Values__c='http://api.salesforce.com/'));
       listKeyPairValue.add(new KeyPairValue__c(Name='ZTBuyAPICaseSafeID ',Values__c='00533000003RbvNAAS '));
       listKeyPairValue.add(new KeyPairValue__c(Name='EloquaAvalaraCaseSafeID ',Values__c='00540000000yXrwAAE '));
       insert listKeyPairValue;
     }
    static testMethod void testLinkPartnerWithContact() {
            //Create partner account
            Id partnerAccountRecordTypeId=[select id From RecordType Where sObjectType='Account' and DeveloperName='Partner_Certification' limit 1].Id;
        Account partnerAccount=TestUtil.createAccount(partnerAccountRecordTypeId,1,true)[0];
        Contact partnerContact=TestUtil.createContact(partnerAccount.Id,1,false)[0];
        partnerContact.Email='partnercontact@example.com';
        insert partnerContact;
            //Create customer account
            Id customerAccountRecordTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
        Account customerAccount =TestUtil.createAccount(customerAccountRecordTypeId,1,true)[0];      
        
        //create a contact and make one as primary
        Test.startTest();
        List<Contact> listContacts=TestUtil.createContact(customerAccount.Id,300,true);
        for(Contact c:[Select Id,Channel_Partner_Name__c,Channel_Partner_Sales_Rep__c,Partner_Rep_Email__c,Partner_Contact_Not_Found_Email_Sent__c From Contact Where Id=:listContacts ]){
                System.assertEquals(c.Channel_Partner_Name__c,null);
                System.assertEquals(c.Channel_Partner_Sales_Rep__c,null);
                System.assertEquals(c.Partner_Rep_Email__c,null);
                System.assertEquals(c.Partner_Contact_Not_Found_Email_Sent__c,0);
        }
        
        for(Contact c:listContacts){
                c.Partner_Rep_Email__c='test@example.com';
        }
        update listContacts;
        for(Contact c:[Select Id,Channel_Partner_Name__c,Channel_Partner_Sales_Rep__c,Partner_Rep_Email__c,Partner_Contact_Not_Found_Email_Sent__c From Contact Where Id=:listContacts ]){
                System.assertEquals(c.Channel_Partner_Name__c,null);
                System.assertEquals(c.Channel_Partner_Sales_Rep__c,null);
                System.assertNotEquals(c.Partner_Rep_Email__c,null);
                System.assertEquals(c.Partner_Contact_Not_Found_Email_Sent__c,1);
        }     

        for(Contact c:listContacts){
                c.Partner_Rep_Email__c=partnerContact.Email;
        }
        update listContacts;
        for(Contact c:[Select Id,Channel_Partner_Name__c,Channel_Partner_Sales_Rep__c,Partner_Rep_Email__c,Partner_Contact_Not_Found_Email_Sent__c From Contact Where Id=:listContacts ]){
                System.assertEquals(c.Channel_Partner_Name__c,partnerAccount.Id);
                System.assertEquals(c.Channel_Partner_Sales_Rep__c,partnerContact.Id);
                System.assertEquals(c.Partner_Rep_Email__c,partnerContact.Email);
                System.assertEquals(c.Partner_Contact_Not_Found_Email_Sent__c,1);
        }   
        Test.stopTest();        
    }
    static testMethod void test50ContactAuthorizedIdentityChanged() {
        Test.startTest();
      //Create an account
           Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
       Account a =TestUtil.createAccount(customerAccountTypeId,1,true)[0];
       //create a contact 
       List<Contact> listCon =TestUtil.createContact(a.Id,50,true);
           for(Contact con : listCon){
             con.Authorized_Identity_Contact__c = true;
           }
       update listCon;
       Test.setMock(HttpCalloutMock.class, new TestMockHttpResponseGenerator() );
      Test.stopTest();
    }  
    
     static testMethod void test101ContactAuthorizedIdentityChanged() {
        Test.startTest();
      //Create an account
           Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
       Account a =TestUtil.createAccount(customerAccountTypeId,1,true)[0];
       //try{
       //create a contact 
       List<Contact> listCon =TestUtil.createContact(a.Id,101,true);
           for(Contact con : listCon){
             con.Authorized_Identity_Contact__c = true;
           }
       update listCon;
       /*}
       catch(Exception e){
           Boolean expectedExceptionThrown =  e.getMessage().contains('More than 100 Contacts are updated') ? true : false;
           System.AssertEquals(expectedExceptionThrown, true);
       }*/
       Test.setMock(HttpCalloutMock.class, new TestMockHttpResponseGenerator() );
      Test.stopTest();
    }    
    
    static testMethod void testLeadConversion() {
    	Test.startTest();
    	 LeadTriggerHandler.isLeadConverted = false;
    	  //Create an account
       Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
       Account a =TestUtil.createAccount(customerAccountTypeId,1,true)[0];
       //create a contact 
       Contact con =TestUtil.createContact(a.Id,1,true)[0];
       con.ContactStatus__c = 'Working';
       update con;
       Contact c = [Select id, Status_Change_Date_Working__c from Contact where id=:con.id];
       //System.assertEquals(c.Status_Change_Date_Working__c,System.now());
      Test.stopTest();
    }
     static testMethod void testChangeContactOwner() {
      Test.startTest();
       //create user 
       Id ava2CAMProfileId = [Select Id from Profile where Name ='Ava2 CAM' limit 1].id;
       User u = TestUtil.createUSer(ava2CAMProfileId,null,1,true)[0];
	   //Create an account
    	   Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
       Account a =TestUtil.createAccount(customerAccountTypeId,101,true)[0];
    	   	 a.ActiveCustomer__c = true;
       update a;
       //create a contact 
       List<Contact> listCon =TestUtil.createContact(a.Id,50,true);
       for(Contact con :listCon ){
         con.ownerid = u.id;
       
       }
       /*}
       catch(Exception e){
       	   Boolean expectedExceptionThrown =  e.getMessage().contains('More than 100 Contacts are updated') ? true : false;
           System.AssertEquals(expectedExceptionThrown, true);
       }*/
      Test.stopTest();
    }   
     static testMethod void testChangeAccountOwner() {
      Test.startTest();
       //create user 
       Id ava2CAMProfileId = [Select Id from Profile where Name ='Ava2 CAM' limit 1].id;
       User u = TestUtil.createUSer(ava2CAMProfileId,null,1,true)[0];
	   //Create an account
    	   Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
       Account a =TestUtil.createAccount(customerAccountTypeId,101,true)[0];
    	   	 a.ActiveCustomer__c = true;
             a.OwnerId = u.Id;
       update a;
       //create a contact 
       List<Contact> listCon =TestUtil.createContact(a.Id,50,true);
       /*}
       catch(Exception e){
       	   Boolean expectedExceptionThrown =  e.getMessage().contains('More than 100 Contacts are updated') ? true : false;
           System.AssertEquals(expectedExceptionThrown, true);
       }*/
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
        Contact contact=TestUtil.createContact(null,1,false)[0];
        contact.Prior_Channel_Partner_Name_Change_Date__c = system.today();    
        contact.Channel_Partner_Name__c =  customerAccount.id;
        insert contact;
        
        System.runAs(u){
          contact.Channel_Partner_Name__c =  partnerAccount.id;
          update contact;
        }
        Test.stopTest();   
    }
    
     //https://jira.avalara.com/browse/IBST-7371
    static testMethod void testPartnerContactUpdate6MonthsAfter() {
    	   Id partnerAccountRecordTypeId=[select id From RecordType Where sObjectType='Account' and DeveloperName='Partner_Certification' limit 1].Id;
        Account partnerAccount=TestUtil.createAccount(partnerAccountRecordTypeId,1,true)[0];
        //Create an account
    	    Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
        Account customerAccount =TestUtil.createAccount(customerAccountTypeId,1,true)[0];
        String EloquaAvalaraCaseSafeID='';
        EloquaAvalaraCaseSafeID =KeyPairValue__c.getInstance('EloquaAvalaraCaseSafeID').Values__c;  
        USer u = [Select id from User where id =: EloquaAvalaraCaseSafeID];
        Test.startTest();   
        Contact contact=TestUtil.createContact(null,1,false)[0];
        contact.Prior_Channel_Partner_Name_Change_Date__c = Date.newInstance(2016, 12, 9);    
        contact.Channel_Partner_Name__c =  customerAccount.id;
        insert contact;
        
        System.runAs(u){
          contact.Channel_Partner_Name__c =  partnerAccount.id;
          update contact;
        }
        Test.stopTest();   
    }
}