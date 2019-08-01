@isTest
public class CampaignTriggerHandlerTest {
	private static Account a;
	private static Contact c;
	private static Opportunity o;
	private static List<Campaign> camList;
	
static testMethod void testOpenOpportunityWeightedValue() {
    	Test.startTest();
	  //Create an account
    	   Id emeaAccountTypeId=[Select Id from RecordType where DeveloperName='EMEA_Account' limit 1].Id;
       a =TestUtil.createAccount(emeaAccountTypeId,1,true)[0];
       //create a contact 
       c =TestUtil.createContact(a.Id,5,true)[0];
       
       //Create Campaign
    	   Id tradeshowTypeId=[Select Id from RecordType where DeveloperName='TradeshowType' limit 1].Id;
       camList =TestUtil.createCampaign(tradeshowTypeId,2,true);
       
       //create Opportunity
       Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
       o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,false)[0];
       o.CampaignId = camList[0].id;
       o.amount = 10000;
       insert o;
       
       //check Opportunity Weighted Value
       Opportunity opp = [Select Weighted_Value__c from Opportunity where id=:o.id];
       system.debug(o.Weighted_Value__c);
       
       //Update Campaign
       camList[0].BoothNumber__c='2';
       camList[0].ParentID=camList[1].id;
       update camList[0];
       Campaign cam1 = [Select id,Open_Opportunity_Weighted_Value__c,parentID from Campaign where id =:camList[0].id];
       
       //Check if Open_Opportunity_Weighted_Value__c field is populated on Campaign
       System.assertEquals(cam1.Open_Opportunity_Weighted_Value__c>0,true);
       cam1.ParentID=camList[1].id;
       update cam1;
       
       camList[1].BoothNumber__c='2';
	   update camList[1];
       Campaign cam2 = [Select id,Open_Opportunity_Weighted_Value__c,parentID from Campaign where id =:camList[1].id];
       System.assertEquals(cam2.Open_Opportunity_Weighted_Value__c>0,true);
       //camList[1].ParentID=camList[0].id;
       //update camList;
       
   }
}