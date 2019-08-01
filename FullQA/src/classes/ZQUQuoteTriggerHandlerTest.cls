@isTest
private class ZQUQuoteTriggerHandlerTest {

    static testMethod void myUnitTest() {
	  //Create an account
    	   Id emeaAccountTypeId=[Select Id from RecordType where DeveloperName='EMEA_Account' limit 1].Id;
       Account a =TestUtil.createAccount(emeaAccountTypeId,1,true)[0];
       //create a contact 
       Contact c =TestUtil.createContact(a.Id,5,true)[0];
       //create Opportunity
       Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
       Opportunity o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,true)[0];
       //create prodcut
       Product2 prod = TestUtil.createProdcut(1,true)[0];
        //create prodcut line item 
       PriceBookEntry priceEntry = TestUtil.createPricebookEntry(prod.id,1,true)[0];
       //create Opportunity Line Item 
       OpportunityLineItem oli = TestUtil.createOpportunityLineItem(o.id,priceEntry.id,1,false)[0];
       oli.ItemType__c='One-Time';
       oli.AmendmentType__c='AddProduct';
       insert oli;
       for(Opportunity opp:[Select Id,Amount,(Select Id From OpportunityLineItems) From Opportunity Where Id=:o.Id]){
       		System.assertEquals(1,opp.OpportunityLineItems.size());
       }       
       zqu__Quote__c quote = TestFactory.makeQuote( o );
       quote.O_P_Status__c='Completed';
       update quote;
       for(Opportunity opp:[Select Id,Amount,(Select Id From OpportunityLineItems) From Opportunity Where Id=:o.Id]){
       		System.assertEquals(0,opp.OpportunityLineItems.size());
       }
    }
}