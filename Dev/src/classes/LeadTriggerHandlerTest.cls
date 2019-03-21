@isTest
private class LeadTriggerHandlerTest {
      @testSetup static void setup() {
     //  createCustomSetting();
     }
     
   /*public static void createCustomSetting(){
     //Setup custom setting
       List<KeyPairValue__c> listKeyPairValue=new List<KeyPairValue__c>(); 
       listKeyPairValue.add(new KeyPairValue__c(Name='Boomi_API_URL_Sandbox',Values__c='http://api.salesforce.com/'));
       listKeyPairValue.add(new KeyPairValue__c(Name='Boomi_API_Key',Values__c='123456'));
       listKeyPairValue.add(new KeyPairValue__c(Name='Boomi_API_URL_Production',Values__c='http://api.salesforce.com/'));
       listKeyPairValue.add(new KeyPairValue__c(Name='ZTBuyAPICaseSafeID ',Values__c='00533000003RbvNAAS '));
       listKeyPairValue.add(new KeyPairValue__c(Name='EloquaAvalaraCaseSafeID ',Values__c='00540000000yXrwAAE '));
       insert listKeyPairValue;
    }*/
    //https://jira.avalara.com/browse/SFCOM-8722?filter=-1
    static testMethod void testLinkPartnerWithContact() {
        Test.startTest();
        //Create partner account
        Id partnerAccountRecordTypeId=[select id From RecordType Where sObjectType='Account' and DeveloperName='Partner_Certification' limit 1].Id;
        Account partnerAccount=TestUtil.createAccount(partnerAccountRecordTypeId,1,false)[0];
        partnerAccount.ActivePartner__c =true;
        partnerAccount.PartnerNumber__c = '1234';
        insert partnerAccount;
        Contact partnerContact=TestUtil.createContact(partnerAccount.Id,1,false)[0];
        partnerContact.Email='partnercontact@example.com';
        insert partnerContact;  
           
        Test.stopTest();
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
    //https://jira.avalara.com/browse/ITBSE-941?filter=-1
     //Devloper : Payal Bhawnani 01/23/2018
    static testMethod void testLeadconversion() {
           List<Lead> listL=TestUtil.createLead(3,false);
           Lead acpLead=listL[0];
           acpLead.status = 'Converted';
           acpLead.OpportunitySubType__c='ACP';
           acpLead.Partner_Territory__c='Brazil';
           Lead dspLead=listL[1];
           dspLead.status = 'Converted';
           dspLead.OpportunitySubType__c='DSP';
           dspLead.Partner_Territory__c='Brazil';
           Lead mspLead=listL[2];
           mspLead.status = 'Converted';
           mspLead.OpportunitySubType__c='MSP';
           mspLead.Partner_Territory__c='Brazil';                  
           insert listL;
           LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
           for(Lead l:listL){
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(l.id);
        lc.setConvertedStatus(convertStatus.MasterLabel);
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());
           }
    }
    static testMethod void testResponseVelocity(){
            //create lead and setup initial fields
            Lead l=TestUtil.createLead(1,false)[0];
            l.Status=Constants.LEAD_STATUS_MQL;
            l.Most_Recent_Conversion_Date__c=Date.today();
            insert l;
            
            //validate that response velocit was cretead and MQL date time was populated
            List<Response_Velocity__c> rvList=[Select Id,MQL_Date_Time__c,Assignment_Date_Time__c,Processing_Date_Time__c,Working_Date_Time__c From Response_Velocity__c Where Lead__c=:l.Id];
            system.assertEquals(1,rvList.size());    
            system.assertNotEquals(NULL,rvList[0].MQL_Date_Time__c);
            system.assertEquals(NULL,rvList[0].Processing_Date_Time__c);
            system.assertEquals(NULL,rvList[0].Working_Date_Time__c);
            system.assertEquals(NULL,rvList[0].Assignment_Date_Time__c);
            //change status to processing to populate processing date time
            LeadTriggerHandler.afterInsertUpdateExecuted=false;
            l.Status=Constants.LEAD_STATUS_PROCESSING;
            update l;
            //change status to working to populate working date time
            LeadTriggerHandler.afterInsertUpdateExecuted=false;
            l.Status=Constants.LEAD_STATUS_WORKING;
            update l;   
            //change owner to queue and then change it back to current user to populate assignment date time
            LeadTriggerHandler.afterInsertUpdateExecuted=false;
            l.OwnerId=[Select Id,Queue.Name,Queue.Id From QueueSObject Where sObjectType='Lead' limit 1].Queue.Id;
            update l; 
            LeadTriggerHandler.afterInsertUpdateExecuted=false;
            l.OwnerId=Userinfo.getUserId();
            update l;  
            //convert lead to validate that response volocity is moved to converted contact 
            LeadTriggerHandler.afterInsertUpdateExecuted=false;   
        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1]; 
        Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(l.id);
        lc.setConvertedStatus(convertStatus.MasterLabel);
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());     
        //validate all fields are populated
        rvList=[Select Id,MQL_Date_Time__c,Processing_Date_Time__c,Assignment_Date_Time__c,Working_Date_Time__c,Lead__c,Contact__c From Response_Velocity__c Where Lead__c=:l.Id];
            system.assertEquals(1,rvList.size());    
            system.assertNotEquals(NULL,rvList[0].MQL_Date_Time__c);
            system.assertNotEquals(NULL,rvList[0].Processing_Date_Time__c);
            system.assertNotEquals(NULL,rvList[0].Working_Date_Time__c);    
            system.assertNotEquals(NULL,rvList[0].Assignment_Date_Time__c);
            system.assertNotEquals(NULL,rvList[0].Lead__c); 
            system.assertNotEquals(NULL,rvList[0].Contact__c);                                                      
    }
    static testMethod void testGDPRProcess(){
    		try{
	    		String email='testGDPR@example.com';
			Individual inv=new Individual(Email__c=email,LastName='lastname',ShouldForget=true);
			insert inv;    	
	    		//create lead and setup initial fields
	    		Lead l=TestUtil.createLead(1,false)[0];
	    		l.Email=email;
	    		insert l;  
    		}
    		catch(Exception e){
			Boolean expectedExceptionThrown =  (e.getMessage().contains(Constants.LEAD_CANNOT_INSERT_UPDATE_LEAD_FOR_GDPR)) ? true : false;
			System.AssertEquals(expectedExceptionThrown, true);    			
    		}  	
    } 
     static testMethod void testResponseVelocityAvaTax(){
            //create lead and setup initial fields
            Lead l=TestUtil.createLead(1,false)[0];
            l.Status=Constants.LEAD_STATUS_MQL;
            l.Most_Recent_Conversion_Date__c=Date.today();
            l.OpportunitySubType__c='AvaTax';
            l.mk_lead_avatax_score__c = 45;
            l.mk_customer_fit_avatax_score__c=90;
            l.Offer__c= Lead.Offer__c.getDescribe().getPicklistValues()[0].getValue();
            l.Method_of_Contact_Lead__c = Lead.Method_of_Contact_Lead__c.getDescribe().getPicklistValues()[0].getValue();
            insert l;
         
            //validate that response velocit was cretead and MQL date time was populated
            List<Response_Velocity__c> rvList=[Select Id,Opportunity_SubType__c,MK_Lead_Score__c,MK_Customer_Fit_Score__c,Most_Recent_Conversion_Date__c,Offer__c,Method_of_Contact__c From Response_Velocity__c Where Lead__c=:l.Id];
            system.assertEquals(1,rvList.size());    
            system.assertNotEquals(NULL,rvList[0].Opportunity_SubType__c);
            system.assertNotEquals(NULL,rvList[0].MK_Lead_Score__c);
            system.assertNotEquals(NULL,rvList[0].MK_Customer_Fit_Score__c);
            system.assertNotEquals(NULL,rvList[0].Most_Recent_Conversion_Date__c);
            system.assertNotEquals(NULL,rvList[0].Offer__c);
            system.assertNotEquals(NULL,rvList[0].Method_of_Contact__c);                                                                 
    }   
      static testMethod void testResponseVelocityCC(){
            //create lead and setup initial fields
            Lead l=TestUtil.createLead(1,false)[0];
            l.Status=Constants.LEAD_STATUS_MQL;
            l.Most_Recent_Conversion_Date__c=Date.today();
            l.OpportunitySubType__c='CertCapture';
            l.MK_Lead_Score_CC__c = 45;
            l.MK_Customer_Fit_Score_CC__c=90;
            l.Offer__c= Lead.Offer__c.getDescribe().getPicklistValues()[0].getValue();
            l.Method_of_Contact_Lead__c = Lead.Method_of_Contact_Lead__c.getDescribe().getPicklistValues()[0].getValue();
            insert l;
         
            //validate that response velocit was cretead and MQL date time was populated
            List<Response_Velocity__c> rvList=[Select Id,Opportunity_SubType__c,MK_Lead_Score__c,MK_Customer_Fit_Score__c,Most_Recent_Conversion_Date__c,Offer__c,Method_of_Contact__c From Response_Velocity__c  Where Lead__c=:l.Id];
            system.assertEquals(1,rvList.size());    
            system.assertNotEquals(NULL,rvList[0].Opportunity_SubType__c);
            system.assertNotEquals(NULL,rvList[0].MK_Lead_Score__c);
            system.assertNotEquals(NULL,rvList[0].MK_Customer_Fit_Score__c);
            system.assertNotEquals(NULL,rvList[0].Most_Recent_Conversion_Date__c);
            system.assertNotEquals(NULL,rvList[0].Offer__c);
            system.assertNotEquals(NULL,rvList[0].Method_of_Contact__c);                                                             
    }         
}