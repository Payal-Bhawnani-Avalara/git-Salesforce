@isTest
private class AjaxUtilityTest {

    static testMethod void test_getPlaceOrderError() {
    		Test.startTest();
	  	//Create an account
    	  	 Id emeaAccountTypeId=[Select Id from RecordType where DeveloperName='EMEA_Account' limit 1].Id;
      	 Account a =TestUtil.createAccount(emeaAccountTypeId,1,true)[0];
       	//create a contact 
      	 Contact c =TestUtil.createContact(a.Id,5,true)[0];
      	 //create Opportunity
      	 Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
       	//create prodcut
       	Product2 	prod = TestUtil.createProdcut(1,true)[0];      	 
      	 PricebookEntry priceEntry = TestUtil.createPricebookEntry(prod.id,1,true)[0];
      	 Opportunity o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,true)[0];
		   OpportunityLineItem oli = TestUtil.createOpportunityLineItem(o.id,priceEntry.id,1,false)[0];
		   oli.ItemType__c='Recurring';
		   oli.AmendmentType__c='AddProduct';
		   oli.UnitPrice=111;
		   insert oli;      	 
      	 //create pros quote
      	 CameleonCPQ__Quote__c cpq = TestUtil.createProsQuote(a.id,o.id,c.id,1,false)[0];
      	 insert cpq;
      	 String result=AjaxUtility.getPlaceOrderError(cpq.Id);
      	 System.assert(String.isNotBlank(result));
        update oli;
        Test.stopTest();
        
    }
}