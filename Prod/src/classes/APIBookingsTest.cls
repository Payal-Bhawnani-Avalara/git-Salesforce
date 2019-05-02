@isTest
private class APIBookingsTest {

    static testMethod void testCalculateBookings() {
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
      	// cpq.OPStatus__c = Constants.PROS_QUOTE_STATUS_COMPLETE;
      	 insert cpq;
      	// cpq.SentToZBillingDate__c=Date.today();
      	 //update cpq;
      	 TriggerHandler.clearAllBypasses();
        update oli;
        Test.stopTest();
        oli=[Select Id,Non_Estimated_Booked_Value__c,Estimated_Booked_Value__c From OpportunityLineItem Where Id=:oli.Id];
        //System.assertEquals(22,oli.Estimated_Booked_Value__c);
        //System.assertEquals(11,oli.Non_Estimated_Booked_Value__c);
    }
	
}