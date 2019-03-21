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
       listKeyPairValue.add(new KeyPairValue__c(Name='ZTBuyAPICaseSafeID',Values__c='00533000003RbvNAAS'));
       listKeyPairValue.add(new KeyPairValue__c(Name='EloquaAvalaraCaseSafeID',Values__c='00540000000yXrwAAE'));
       listKeyPairValue.add(new KeyPairValue__c(Name='LeadResponseVelocityOwnerChange',Values__c='00533000003hat0AAA,00540000001eFBmAAM,00540000002fhW6AAI'));
       listKeyPairValue.add(new KeyPairValue__c(Name='EContractActivityTriggerHandler',Values__c='False'));
       listKeyPairValue.add(new KeyPairValue__c(Name='LogOpportunityProductHistory',Values__c='TRUE'));
       listKeyPairValue.add(new KeyPairValue__c(Name='NonConnectorFees',Values__c='a0n3300000FTiWlAAL'));
       listKeyPairValue.add(new KeyPairValue__c(Name='OpportunitySubType',Values__c='AvaTax@@BizDev@@SOHO'));
       insert listKeyPairValue;
     }
    static testMethod void testLinkPartnerWithContact() {
            //Create partner account
            Id partnerAccountRecordTypeId=[select id From RecordType Where sObjectType='Account' and DeveloperName='Partner_Certification' limit 1].Id;
        Account partnerAccount=TestUtil.createAccount(partnerAccountRecordTypeId,1,false)[0];
        partnerAccount.ActivePartner__c =true;
        partnerAccount.PartnerNumber__c = '1234';
        insert partnerAccount;
        Contact partnerContact=TestUtil.createContact(partnerAccount.Id,1,false)[0];
        partnerContact.Email='partnercontact@example.com';
        insert partnerContact;
            //Create customer account
            Id customerAccountRecordTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
        Account customerAccount =TestUtil.createAccount(customerAccountRecordTypeId,1,true)[0];      
        
        //create a contact and make one as primary
        Test.startTest();
        List<Contact> listContacts=TestUtil.createContact(customerAccount.Id,50,true);
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
       Account a =TestUtil.createAccount(customerAccountTypeId,50,true)[0];
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
        Account partnerAccount=TestUtil.createAccount(partnerAccountRecordTypeId,1,false)[0];
        partnerAccount.ActivePartner__c =true;
        partnerAccount.PartnerNumber__c = '1234';
        insert partnerAccount;
        //Create an account
            Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
        Account customerAccount =TestUtil.createAccount(customerAccountTypeId,1,false)[0];
        customerAccount.ActivePartner__c =true;
        customerAccount.PartnerNumber__c = '1234';
        insert customerAccount;
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
        Account partnerAccount=TestUtil.createAccount(partnerAccountRecordTypeId,1,false)[0];
        partnerAccount.ActivePartner__c =true;
        partnerAccount.PartnerNumber__c = '1234';
        insert partnerAccount;
        //Create an account
            Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
         Account customerAccount =TestUtil.createAccount(customerAccountTypeId,1,false)[0];
        customerAccount.ActivePartner__c =true;
        customerAccount.PartnerNumber__c = '1234';
        insert customerAccount;
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
    static testMethod void testResponseVelocity(){
        //Create an account
        Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
        Account a =TestUtil.createAccount(customerAccountTypeId,1,true)[0];
            a.ActiveCustomer__c = true;
        update a;   
            //create contact and setup initial fields
            Contact c=TestUtil.createContact(a.Id,1,false)[0];
            c.ContactStatus__c=Constants.CONTACT_STATUS_MQL;
            c.Most_Recent_Conversion_Date__c=Date.today();
            insert c;
            
            //validate that response velocit was cretead and MQL date time was populated
            List<Response_Velocity__c> rvList=[Select Id,MQL_Date_Time__c,Assignment_Date_Time__c,Processing_Date_Time__c,Working_Date_Time__c From Response_Velocity__c Where Contact__c=:c.Id];
            system.assertEquals(1,rvList.size());    
            system.assertNotEquals(NULL,rvList[0].MQL_Date_Time__c);
            system.assertEquals(NULL,rvList[0].Processing_Date_Time__c);
            system.assertEquals(NULL,rvList[0].Working_Date_Time__c);
            system.assertEquals(NULL,rvList[0].Assignment_Date_Time__c);
            //change status to processing to populate processing date time
            ContactTriggerHandler.afterInsertUpdateExecuted=false;
            c.ContactStatus__c=Constants.CONTACT_STATUS_PROCESSING;
            update c;
            //change status to working to populate working date time
            ContactTriggerHandler.afterInsertUpdateExecuted=false;
            c.ContactStatus__c=Constants.CONTACT_STATUS_WORKING;
            update c;   
            /*//change owner to queue and then change it back to current user to populate assignment date time
            ContactTriggerHandler.afterInsertUpdateExecuted=false;
            c.OwnerId=[Select Id,Queue.Name,Queue.Id From QueueSObject Where sObjectType='Contact' limit 1].Queue.Id;
            update c; 
            ContactTriggerHandler.afterInsertUpdateExecuted=false;
            c.OwnerId=Userinfo.getUserId();
            update c;  */
    
        //validate all fields are populated
        rvList=[Select Id,MQL_Date_Time__c,Processing_Date_Time__c,Assignment_Date_Time__c,Working_Date_Time__c,Lead__c,Contact__c From Response_Velocity__c Where Contact__c=:c.Id];
            system.assertEquals(1,rvList.size());    
            system.assertNotEquals(NULL,rvList[0].MQL_Date_Time__c);
            system.assertNotEquals(NULL,rvList[0].Processing_Date_Time__c);
            system.assertNotEquals(NULL,rvList[0].Working_Date_Time__c);    
            //system.assertNotEquals(NULL,rvList[0].Assignment_Date_Time__c);
            system.assertEquals(NULL,rvList[0].Lead__c);    
            system.assertNotEquals(NULL,rvList[0].Contact__c);                                                      
    }  
    static testMethod void testGDPRProcess(){
            try{
                String email='testGDPR@example.com';
            Individual inv=new Individual(Email__c=email,LastName='lastname',ShouldForget=true);
            insert inv;     
                //Create an account
            Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
                Account a =TestUtil.createAccount(customerAccountTypeId,1,true)[0];
            a.ActiveCustomer__c = true;
                update a;   
            //create contact and setup initial fields
            Contact c=TestUtil.createContact(a.Id,1,false)[0];
            c.Email=email;
            insert c;
            }
            catch(Exception e){
            Boolean expectedExceptionThrown =  (e.getMessage().contains(Constants.CONTACT_CANNOT_INSERT_UPDATE_CONTACT_FOR_GDPR)) ? true : false;
            System.AssertEquals(expectedExceptionThrown, true);             
            }   
    }    
     static testMethod void testResponseVelocityAvaTax(){
        //Create an account
        Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
        Account a =TestUtil.createAccount(customerAccountTypeId,1,true)[0];
            a.ActiveCustomer__c = true;
        update a;   
            //create contact and setup initial fields
            Contact c=TestUtil.createContact(a.Id,1,false)[0];
            c.ContactStatus__c=Constants.CONTACT_STATUS_MQL;
            c.Opportunity_Sub_Type__c='AvaTax';
            c.Most_Recent_Conversion_Date__c=Date.today();
            c.mk_lead_avatax_score__c = 45;
            c.mk_customer_fit_avatax_score__c=90;
            c.Offer__c= Contact.Offer__c.getDescribe().getPicklistValues()[0].getLabel();
            c.Method_of_Contact_Contact__c = Contact.Method_of_Contact_Contact__c.getDescribe().getPicklistValues()[0].getLabel();
            insert c;
            
            //validate that response velocit was cretead and MQL date time was populated
            List<Response_Velocity__c> rvList=[Select Id,Opportunity_SubType__c,MK_Lead_Score__c,MK_Customer_Fit_Score__c,Most_Recent_Conversion_Date__c,Offer__c,Method_of_Contact__c From Response_Velocity__c Where Contact__c=:c.Id];
            system.assertEquals(1,rvList.size());    
            system.assertNotEquals(NULL,rvList[0].Opportunity_SubType__c);
            system.assertNotEquals(NULL,rvList[0].MK_Lead_Score__c);
            system.assertNotEquals(NULL,rvList[0].MK_Customer_Fit_Score__c);
            system.assertNotEquals(NULL,rvList[0].Most_Recent_Conversion_Date__c);
            system.assertNotEquals(NULL,rvList[0].Offer__c);
            system.assertNotEquals(NULL,rvList[0].Method_of_Contact__c);                                                      
    }     
     static testMethod void testResponseVelocityCC(){
        //Create an account
        Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
        Account a =TestUtil.createAccount(customerAccountTypeId,1,true)[0];
            a.ActiveCustomer__c = true;
        update a;   
            //create contact and setup initial fields
            Contact c=TestUtil.createContact(a.Id,1,false)[0];
            c.ContactStatus__c=Constants.CONTACT_STATUS_MQL;
            c.Opportunity_Sub_Type__c='CertCapture';
            c.Most_Recent_Conversion_Date__c=Date.today();
            c.MK_Lead_Score_CC__c = 45;
            c.MK_Customer_Fit_Score_CC__c=90;
            c.Offer__c= Contact.Offer__c.getDescribe().getPicklistValues()[0].getLabel();
            c.Method_of_Contact_Contact__c = Contact.Method_of_Contact_Contact__c.getDescribe().getPicklistValues()[0].getLabel();
            insert c;
            
            //validate that response velocit was cretead and MQL date time was populated
            List<Response_Velocity__c> rvList=[Select Id,Opportunity_SubType__c,MK_Lead_Score__c,MK_Customer_Fit_Score__c,Most_Recent_Conversion_Date__c,Offer__c,Method_of_Contact__c From Response_Velocity__c Where Contact__c=:c.Id];
            system.assertEquals(1,rvList.size());    
            system.assertNotEquals(NULL,rvList[0].Opportunity_SubType__c);
            system.assertNotEquals(NULL,rvList[0].MK_Lead_Score__c);
            system.assertNotEquals(NULL,rvList[0].MK_Customer_Fit_Score__c);
            system.assertNotEquals(NULL,rvList[0].Most_Recent_Conversion_Date__c);
            system.assertNotEquals(NULL,rvList[0].Offer__c);
            system.assertNotEquals(NULL,rvList[0].Method_of_Contact__c);                                                      
    }     
}