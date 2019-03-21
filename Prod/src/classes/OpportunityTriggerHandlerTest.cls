@isTest
public class OpportunityTriggerHandlerTest {
	private static Account a;
	private static Contact c;
	private static Opportunity o;
	private static CameleonCPQ__Quote__c cpq;
	private static User u;
    private static Product2 prod;
    private static PricebookEntry priceEntry;   
    private static OpportunityLineItem oli;	
   static testMethod void testDeleteProsQuoteOrderComplete() {
    	Test.startTest();
	  //Create an account
    	   Id emeaAccountTypeId=[Select Id from RecordType where DeveloperName='EMEA_Account' limit 1].Id;
       a =TestUtil.createAccount(emeaAccountTypeId,1,true)[0];
       //create a contact 
       c =TestUtil.createContact(a.Id,5,true)[0];
       
       //create Opportunity
       Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
       o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,true)[0];
       
       //create pros quote
       cpq = TestUtil.createProsQuote(a.id,o.id,c.id,1,true)[0];
 
       o.PROS_Order_Quote__c = cpq.id;
       update o;
       
        cpq.OPStatus__c = 'Complete';
       update cpq;
       
       //delete Opportunity
       try{
            Delete o;
        }
        catch(Exception e){
       	   Boolean expectedExceptionThrown =  e.getMessage().contains(Constants.Opportunity_CANNOT_DELETE_CLOSED_OPPORTUNITY) ? true : false;
           System.AssertEquals(expectedExceptionThrown, true);
        }
      Test.stopTest();
    }
   /* static testMethod void testCampaignRollup(){
    		Test.startTest();
    	   //Create an account
    	   Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
       a =TestUtil.createAccount(customerAccountTypeId,1,true)[0];
	    Connector__c con =TestUtil.createConnector(a.Id,a.Id,1,true)[0] ;           		
       //Create Campaign
    	   Id tradeshowTypeId=[Select Id from RecordType where DeveloperName='TradeshowType' limit 1].Id;
       List<Campaign> camList =TestUtil.createCampaign(tradeshowTypeId,2,true);  
       //create Opportunity
       Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
       o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,false)[0];
       o.CampaignId = camList[0].id;
       o.amount = 1000;
       o.Type='New';
       o.SubType__c='EMEA';
       o.Ding_Year__c=Date.today().year();
       o.Ding_Month__c=Date.today().month();
      // o.BookedValue__c=111;
      	//o.Ding_Value__c=1;
       o.Booked_Date__c=Date.today();
       o.Connector__c=con.Id;
       
       insert o;    
       o.StageName='Closed Won';
       update o;
       delete o;
       undelete o;
		Test.stopTest();
		Campaign c=[Select Id,TotalBookedValue__c,DingCount__c From Campaign Where Id=:camList[0].id]; 
		System.assertEquals(1000,c.TotalBookedValue__c); 
		System.assertEquals(1,c.DingCount__c);   	
    }  */
     static testMethod void testDSPSplit(){
    		Test.startTest();
	    	  //Create an account
	    	   Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
	       a =TestUtil.createAccount(customerAccountTypeId,1,true)[0];
	       //Create User
	       Id ava2MasterAdminProfileId = [Select Id from Profile where Name ='Ava2 Master Admin' limit 1].id;
	       u = TestUtil.createUSer(ava2MasterAdminProfileId,null,1,true)[0];
		   //Create connector
		   Connector__c con =TestUtil.createConnector(a.Id,a.Id,1,false)[0] ;   
		   con.SAM__c =  u.id;   
		   con.PPM__c= u.id;
		   con.Suppress_Partner_Split__c = false;
		   insert con; 		      
	       //create Opportunity
	       Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
	       o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,true)[0];
	       o.Type='New';
	       o.SubType__c='AvaTax';
	       o.Connector__c=con.Id;
          update o;    
          o.Booked_Date__c=Date.today();
         update o;
	   Test.stopTest();
		Opportunity opp=[Select Id,Initial_DSP_SAM_Split_Complete__c,Initial_DSP_PPM_Split_Complete__c From Opportunity Where Id=:o.id]; 
		 System.assertEquals(true,opp.Initial_DSP_SAM_Split_Complete__c); 
          System.assertEquals(true,opp.Initial_DSP_PPM_Split_Complete__c); 
		//System.assertEquals(1,c.DingCount__c);   	
    }  
    static testMethod void testMSPSplit(){
    		Test.startTest();
    		   //Create User
	       Id ava2MasterAdminProfileId = [Select Id from Profile where Name ='Ava2 Master Admin' limit 1].id;
	       u = TestUtil.createUSer(ava2MasterAdminProfileId,null,1,true)[0];
	    	   //Create an account
	    	   Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
	       a =TestUtil.createAccount(customerAccountTypeId,1,false)[0];
	       a.PartnerNumber__c = '123-456-789';
	       a.Partner_Category__c = 'Marketing & Sales Partner';
	       a.Secondary_CDM__c = u.id;
	       a.CDM__c = u.id;
	       insert a;
	            
	       //create Opportunity
	       Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
	       o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,true)[0];
	       o.Type='New';
	       o.SubType__c='AvaTax';
	       o.PartnerName__c=a.Id;
          update o;    
          o.Booked_Date__c=Date.today();
          update o;
	  Test.stopTest();
		Opportunity opp=[Select Id,Initial_MSP_PPM_Split_Complete__c,Initial_MSP_SAM_Split_Complete__c From Opportunity Where Id=:o.id]; 
		System.assertEquals(true,opp.Initial_MSP_PPM_Split_Complete__c); 
        System.assertEquals(true,opp.Initial_MSP_SAM_Split_Complete__c); 
		//System.assertEquals(1,c.DingCount__c); 	
    }  
  /*static testMethod void testBookedDateChange() {
        Test.startTest();
      //Create an account
           Id emeaAccountTypeId=[Select Id from RecordType where DeveloperName='EMEA_Account' limit 1].Id;
       a =TestUtil.createAccount(emeaAccountTypeId,1,true)[0];
       //create a contact 
       c =TestUtil.createContact(a.Id,5,true)[0];
       //create Opportunity
       Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
       o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,true)[0];
       //create prodcut
       prod = TestUtil.createProdcut(1,true)[0]; 
        //create prodcut line item 
       priceEntry = TestUtil.createPricebookEntry(prod.id,1,true)[0];
       //create Opportunity Line Item 
       oli = TestUtil.createOpportunityLineItem(o.id,priceEntry.id,1,false)[0];
       insert oli;
       
       o.Booked_Date__c = Date.toDay().addDays(50);
       TriggerHandler.clearBypass('OpportunityTriggerHandler');
       update o;
       
       OpportunityLineItem oppLI = [Select OpportunityId,CX911_Opportunity_Line_Item_Booked_Date__c from
                                      OpportunityLineItem  where OpportunityId = :o.id limit 1]; 
        System.assertEquals(oppLI.CX911_Opportunity_Line_Item_Booked_Date__c,o.Booked_Date__c);
       o.Booked_Date__c = null;
       TriggerHandler.clearBypass('OpportunityTriggerHandler');
       update o;  
        oppLI = [Select OpportunityId,CX911_Opportunity_Line_Item_Booked_Date__c from
                                      OpportunityLineItem  where OpportunityId = :o.id limit 1]; 
        System.assertEquals(oppLI.CX911_Opportunity_Line_Item_Booked_Date__c,o.Booked_Date__c);             
    } */   
}