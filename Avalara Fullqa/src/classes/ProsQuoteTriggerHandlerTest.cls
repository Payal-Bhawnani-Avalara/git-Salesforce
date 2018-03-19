@isTest
public class ProsQuoteTriggerHandlerTest {
	private static Account a;
	private static Contact c;
	private static Opportunity o;
	private static CameleonCPQ__Quote__c cpq;
	private static OpportunityLineItem oli;
	private static Product2 prod;
	private static PricebookEntry priceEntry;
	
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
       cpq = TestUtil.createProsQuote(a.id,o.id,c.id,1,false)[0];
       cpq.OPStatus__c = 'Complete';
       insert cpq;
       //delete cpq
       try{
            Delete cpq;
        }
        catch(Exception e){
       	   Boolean expectedExceptionThrown =  e.getMessage().contains('You cannot delete the Pros Quote if Order Status is Complete.') ? true : false;
           System.AssertEquals(expectedExceptionThrown, true);
        }
      Test.stopTest();
    }  
    //Testing for item type one-Time
    static testMethod void testUpdatePorsQuoteEOBOneTime() {
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
       oli.ItemType__c='One-Time';
       oli.AmendmentType__c='AddProduct';
       insert oli;
       //create pros quote
       cpq = TestUtil.createProsQuote(a.id,o.id,c.id,1,false)[0];
       cpq.OPStatus__c = 'Complete';
       insert cpq;
       
       o.PROS_Order_Quote__c = cpq.id;
       update o;
       
       //update cpq End of Behaviour
       cpq.End_of_Agreement_Behavior__c = 'Renew with lock for 1 term, subject to an annual increase of 5% then catalog pricing';
       /*cpq.ContractEffectiveDate__c = System.today();
       cpq.ServiceActivationDate__c = System.today();*/
       update cpq;
       
       OpportunityLineItem oppLI = [Select OpportunityId,End_of_Agreement_Behavior__c, ItemType__c from
                                      OpportunityLineItem  where OpportunityId = :o.id limit 1]; 
        System.assertNotEquals(oppLI.End_of_Agreement_Behavior__c,cpq.End_of_Agreement_Behavior__c);
        /*System.assertEquals(oppLI.Access_Start__c,cpq.ContractEffectiveDate__c);
        System.assertEquals(oppLI.Term_Start__c,cpq.ServiceActivationDate__c);*/
    }   
    
    //Testing for item type Recurring
    static testMethod void testUpdatePorsQuoteEOB() {
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
       oli.ItemType__c='Recurring';
       oli.AmendmentType__c='AddProduct';
       insert oli;
       //create pros quote
       cpq = TestUtil.createProsQuote(a.id,o.id,c.id,1,false)[0];
       cpq.OPStatus__c = 'Complete';
       insert cpq;
       
       o.PROS_Order_Quote__c = cpq.id;
       update o;
       
       //update cpq End of Behaviour
       cpq.End_of_Agreement_Behavior__c = 'Renew with lock for 1 term, subject to an annual increase of 5% then catalog pricing';
       /*cpq.ContractEffectiveDate__c = System.today();
       cpq.ServiceActivationDate__c = System.today();*/
       update cpq;
       
       OpportunityLineItem oppLI = [Select OpportunityId,End_of_Agreement_Behavior__c, ItemType__c from
                                      OpportunityLineItem  where OpportunityId = :o.id limit 1]; 
        System.assertEquals(oppLI.End_of_Agreement_Behavior__c,cpq.End_of_Agreement_Behavior__c);
        /*System.assertEquals(oppLI.Access_Start__c,cpq.ContractEffectiveDate__c);
        System.assertEquals(oppLI.Term_Start__c,cpq.ServiceActivationDate__c);*/
    }   
}