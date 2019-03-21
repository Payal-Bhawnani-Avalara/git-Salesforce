@isTest
private class JobProcessOpportunityLineItemTest {
    private static Account a;
  private static Contact c;
  private static User u;
  private static Opportunity o;
  private static OpportunityLineItem oli;
  private static Product2 prod;
    private static PricebookEntry priceEntry;  
    
    static testMethod void testBookedDateChange() {
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
         update o;
         
         JobProcessOpportunityLineItem obj = new JobProcessOpportunityLineItem();
         DataBase.executeBatch(obj); 
       Test.stopTest();
       
       OpportunityLineItem oppLI = [Select OpportunityId,CX911_Opportunity_Line_Item_Booked_Date__c from
                                      OpportunityLineItem  where OpportunityId = :o.id limit 1]; 
       System.assertEquals(oppLI.CX911_Opportunity_Line_Item_Booked_Date__c,o.Booked_Date__c);         
    }    
}