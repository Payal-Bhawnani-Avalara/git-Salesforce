@isTest
public class JobProcessOpportunityTest {
	private static Account a;
	private static Contact c;
	private static User u;
	private static Connector__c con;
	private static Opportunity o;
	private static OpportunityContactRole oCR;
	private static Campaign cam;
	private static CampaignMember camM;
	private static Event eI,eDeM,eDe,eDi; //Event with meeting Type Intrest,Demo Mid Market,Demo , Discovery
   
	static void init(){
    	//Create an account
      Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
       a =TestUtil.createAccount(customerAccountTypeId,1,true)[0];
       //create a contact 
       c =TestUtil.createContact(a.Id,1,true)[0];
       //create user 
       Id ava2MasterAdminProfileId = [Select Id from Profile where Name ='Ava2 Master Admin' limit 1].id;
       u = TestUtil.createUSer(ava2MasterAdminProfileId,null,1,true)[0];
       //create Connector 
       con = TestUtil.createConnector(a.id,a.id,1,true)[0];
       //create Opportunity
       Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
       o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,true)[0];
       
       //create Campaign
       Id tradeShowCamRecTypeId=[Select Id from RecordType where DeveloperName='TradeshowType' limit 1].Id;
       cam = TestUtil.createCampaign(tradeShowCamRecTypeId,1,true)[0];
       
	}
    
    static testMethod void testJobProcessOneOpportunityContactRole() {	
	    init();
	    Test.startTest();
	    //Create OpportunityContactRole
	       oCR = TestUtil.createOpportunityContactRole(o.id,c.id,null,1,false)[0];	
	       oCR.isPrimary = false;
	       insert oCR;
	       //Run JobProcessOpportunity class
	       JobProcessOpportunity obj = new JobProcessOpportunity();
	       DataBase.executeBatch(obj); 
	    Test.stopTest();
	    
	    //Check OCR flagged primary
	    List <OpportunityContactRole> testOCRIsPrimnary = [SELECT id,IsPrimary FROM OpportunityContactRole WHERE Id = :oCR.id]; 
	    system.assertEquals(testOCRIsPrimnary[0].isPrimary, true);

    }
    //test method for 2 opportunity contact role 
    static testMethod void testJobProcessTwoOpportunityContactRole() {	
      init();
      Test.startTest();
       //Create OpportunityContactRole
       oCR = TestUtil.createOpportunityContactRole(o.id,c.id,null,2,false)[0];	
       oCR.isPrimary = false;
       insert oCR;
       //Run JobProcessOpportunity class
       JobProcessOpportunity obj = new JobProcessOpportunity();
       DataBase.executeBatch(obj); 
     Test.stopTest();
      //Check OCR flagged primary
     List <OpportunityContactRole> testOCRIsPrimnary = [SELECT id,IsPrimary FROM OpportunityContactRole WHERE Id = :oCR.id]; 
     system.assertNotEquals(testOCRIsPrimnary[0].isPrimary, false);
    }
     
    static testMethod void testScheduler() {	
      init();
      Test.startTest();
      //Create OpportunityContactRole
       oCR = TestUtil.createOpportunityContactRole(o.id,c.id,null,2,false)[0];	
       oCR.isPrimary = false;
       insert oCR;
       JobProcessOpportunity m = new JobProcessOpportunity();
        String seconds = '0'; //Execute at Zero Seconds
        String minutes = '0'; //Execute at every 0 minute of hour
        String hours = '13'; // Execute at 1 PM
        String dayOfMonth = '*'; // Execute Every Day of the Month
        String month = '*'; //Execute every Month
        String dayOfWeek = '?'; //Execute on all 7 days of the Week
        ID oppbatchprocessid = Database.executeBatch(m,200);  
        
        //Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        String sch = seconds + ' ' + minutes + ' ' + hours + ' ' + dayOfMonth + ' ' + month + ' ' + dayOfWeek;
        //String sch = '0 0 01 * * ?';
        system.schedule('JobProcessOpportunity Run Everyday at 1am Test', sch, m); 
      Test.stopTest();
    }
     
   static testMethod void testNewCampaignMemberResponded() {	
    init();
    Test.startTest();
    //Create OpportunityContactRole
       oCR = TestUtil.createOpportunityContactRole(o.id,c.id,null,1,false)[0];	
       oCR.isPrimary = false;
       insert oCR;
       o.campaignid = cam.id;
       update o;
       JobProcessOpportunity obj = new JobProcessOpportunity();
       DataBase.executeBatch(obj); 
    Test.stopTest();
    
    List <CampaignMember> testCampaignMemeber = [Select CampaignId,ContactId,status,IsIRDUpdatedByTrigger__c from CampaignMember where CampaignId=:cam.id]; 
    system.assertEquals(testCampaignMemeber[0].ContactId, c.id);
    system.assertEquals(testCampaignMemeber[0].status, 'Responded');

   }
    
   static testMethod void testExistingCampaignMemberResponded() {	
    init();
    Test.startTest();
         //Update Opportunity Owner
       o.ownerid = '00533000003RbvNAAS';
       update o;
       //Create OpportunityContactRole
       oCR = TestUtil.createOpportunityContactRole(o.id,c.id,null,1,false)[0];	
       oCR.isPrimary = false;
       insert oCR;
       camM = TestUtil.createCampaignMember(cam.id,'sent',1,false)[0];
       camM.contactID = c.id;
       insert camM;
       o.campaignid = cam.id;
       update o;
       JobProcessOpportunity obj = new JobProcessOpportunity();
       DataBase.executeBatch(obj); 
    Test.stopTest();
    
    List <CampaignMember> testCampaignMemeber = [Select CampaignId,ContactId,status,IsIRDUpdatedByTrigger__c from CampaignMember where CampaignId=:cam.id]; 
    //system.assertEquals(testCampaignMemeber[0].ContactId, c.id);
    system.assertEquals(testCampaignMemeber[0].status, 'Responded');

   }
   //Test Account with Primary Contact and Campaign 
   /*static testMethod void testAccountPrimaryContact() {	
    init();
    Test.startTest();
       //Update Opportunity Owner
       o.ownerid = '00533000003RbvNAAS';
       update o;
       //Account with Primary Contact
       c.PrimaryContact__c=true;
       update c;
       //Create OpportunityContactRole
       camM = TestUtil.createCampaignMember(cam.id,'sent',1,false)[0];
       camM.contactID = c.id;
       insert camM;
       JobProcessOpportunity obj = new JobProcessOpportunity();
       DataBase.executeBatch(obj); 
    Test.stopTest();
    
    List <OpportunityContactRole> testOCR = [Select id,ContactId,OpportunityId from OpportunityContactRole where ContactId=:c.id]; 
    //system.assertEquals(testCampaignMemeber[0].ContactId, c.id);
    system.assertEquals(testOCR[0].OpportunityId, o.id);

   }
   /*static testMethod void testUpdateCampaignIDFromOCR() {	
    init();
    Test.startTest();
       //Update Opportunity Owner
       o.ownerid = '00533000003RbvNAAS';
       update o;
       //Create OpportunityContactRole
       oCR = TestUtil.createOpportunityContactRole(o.id,c.id,null,1,false)[0];	
       oCR.isPrimary = false;
       insert oCR;
       camM = TestUtil.createCampaignMember(cam.id,'sent',1,false)[0];
       camM.contactID = c.id;
       insert camM;
       JobProcessOpportunity obj = new JobProcessOpportunity();
       DataBase.executeBatch(obj); 
    Test.stopTest();
    
    List <Opportunity> testOpp = [Select CampaignId,id from Opportunity where id=:o.id]; 
    //system.assertEquals(testCampaignMemeber[0].ContactId, c.id);
    system.assertEquals(testOpp[0].CampaignId, cam.id);

    }*/
   /* static testMethod void testUpdateMQLDateFromOCR() {	
    init();
    Test.startTest();
       //Populate MQL status date on Contact
       c.MQL_Status_Date__c = System.today();
       update c;
       //Create OpportunityContactRole
       oCR = TestUtil.createOpportunityContactRole(o.id,c.id,null,1,true)[0];
       JobProcessOpportunity obj = new JobProcessOpportunity();
       DataBase.executeBatch(obj); 
    Test.stopTest();
    
    List <Opportunity> testOpp = [Select Lead_Contact_MQL_Status_Date__c,id from Opportunity where id=:o.id]; 
    //Check if MQL Date populdated from Contact
    //system.assertEquals(testOpp[0].Lead_Contact_MQL_Status_Date__c, c.MQL_Status_Date__c);

    }*/
}