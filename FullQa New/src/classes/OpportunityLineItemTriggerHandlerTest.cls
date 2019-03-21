@isTest
private class OpportunityLineItemTriggerHandlerTest {
  static zqu__Quote__c quote{get;set;}

  static zqu__zProduct__c product{get;set;}
	private static Product2 prod;
	private static PricebookEntry priceEntry;  
	private static OpportunityLineItem oli;
  static List<zqu__ProductRatePlan__c> prpList{get;set;}
  static String subName{get;set;}  	
    static void createTestData(){
	    //need to enable this in the Zuora Config
	    //Enable_Summary_Reporting__c
	    product = TestFactory.prepareProductCatalog(false);
	
	    prpList = [SELECT Id, 
	                      Name,
	                      TransactionTier__c,
	                      Display__c,
	                      ServiceLevel__c,
	                      AddOnConnector__c,
	                      PriceSchedule__c,
	                      zqu__zProduct__c 
	               FROM zqu__ProductRatePlan__c 
	               WHERE zqu__ZProduct__c = :product.Id];
	    List<String> prpIdList = new List<String>();
	    for(zqu__ProductRatePlan__c prp : prpList){
	      prpIdList.add(prp.Id);
	    }
	
	    Account acc = TestFactory.makeAccount();
	    acc.ActiveCustomer__c=true;
	    update acc;
	    Contact con = TestFactory.makeContact( acc );
	    Opportunity opp = TestFactory.makeOpportunity( acc );
	    //opp.SubType__c='Included';
	    //update opp;
	    Connector__c c = new Connector__c(
	        Name = 'Test Connector',
	        Author__c = acc.Id,
	        Managed_By__c = acc.Id
	    );
	    insert c;    
	    Zuora__Subscription__c sub =  new Zuora__Subscription__c();
	    sub.name = 'Test123';
	    subName = sub.name;
	    sub.Zuora__Account__c = acc.Id;
	    sub.Zuora__Status__c='Active';
		upsert sub;
	    Zuora__SubscriptionProductCharge__c spc = new Zuora__SubscriptionProductCharge__c();
	    spc.Zuora__Account__c=acc.Id;
	    spc.Zuora__RatePlanId__c='123';
	    spc.Zuora__Price__c = -10;
	    spc.Zuora__Model__c = 'Discount-Percentage';
	 //  spc.Zuora__Type__c = 'Recurring';
	    spc.Zuora__Subscription__c = sub.Id;
	  //  spc.Zuora__Account__c = acc.Id;
		spc.Zuora__ProductName__c='Avalara SalesTax II';
		spc.Zuora__Type__c='Recurring';
		spc.ConnectorLookup__c=c.Id;
		spc.Zuora__RatePlanName__c='Pre-Paid Returns Service';
		spc.Zuora__Quantity__c=123;
		spc.Opportunity__c=opp.Id;
		spc.Connector_Name__c='1111';
	
	    upsert spc;

       //create prodcut
       prod = TestUtil.createProdcut(1,true)[0]; 
        //create prodcut line item 
       priceEntry = TestUtil.createPricebookEntry(prod.id,1,true)[0];
       //create Opportunity Line Item 
       List<OpportunityLineItem> listOLI = TestUtil.createOpportunityLineItem(opp.id,priceEntry.id,5,false); 
       oli=listOLI[0];
       oli.PRPId__c='123';
       oli.Model__c='test';
       oli.EffectivePrice__c=123;
       oli.CPQ_Quantity__c=1;
       oli.BillingFrequency__c='Monthly';
       oli=listOLI[1];
       oli.PRPId__c='123';
       oli.Model__c='test';
       oli.EffectivePrice__c=123;
       oli.CPQ_Quantity__c=1;
       oli.BillingFrequency__c='Quarterly';
       oli=listOLI[2];
       oli.PRPId__c='123';
       oli.Model__c='test';
       oli.EffectivePrice__c=123;
       oli.CPQ_Quantity__c=1;
       oli.BillingFrequency__c='Semi-Annual';
       oli=listOLI[3];
       oli.PRPId__c='123';
       oli.Model__c='test';
       oli.EffectivePrice__c=123;
       oli.CPQ_Quantity__c=1;
       oli.BillingFrequency__c='Annual';       
       oli=listOLI[4];
       oli.PRPId__c='123';
       oli.Model__c='Discount-Percentage';
       oli.EffectivePrice__c=123;
       oli.CPQ_Quantity__c=1;       
       
       insert listOLI; 
    
    }
    static testMethod void testbeforeInsertUpdate() { 
    		Test.startTest();
    		createTestData();
   		Opportunity opp=[Select Id,Amount, (Select Id,UnitPrice,EffectivePrice__c,TotalPrice__c From OpportunityLineItems Where Model__c!='Discount-Percentage') From Opportunity];
   		system.debug('opp===='+opp);
   		for(OpportunityLineItem oli:opp.OpportunityLineItems){
   			System.assertEquals(135.3,oli.EffectivePrice__c);
   		}
    		Test.stopTest();
        
    }
    static testMethod void testbeforeUpdate() { 
    		Test.startTest();
    		createTestData();
   		Opportunity opp=[Select Id,Amount, (Select Id,ItemType__c,ProductFamily__c,PRPCId__c,PRPId__c,RPTCId__c From OpportunityLineItems limit 1) From Opportunity];
		OpportunityLineItem oli=opp.OpportunityLineItems[0];
		oli.ItemType__c='Usage';
		oli.ProductFamily__c='Avalara Professional Services';
		oli.PRPCId__c='2c92a0ff5876eea8015877f7700713ba';
		oli.PRPId__c='2c92a0fd5876e49c015877f76ebf1f1a';
		oli.RPTCId__c='2c92a0ff5876eea8015877f7700913bd';
		update oli;
		oli.ItemType__c='One-Time';
		TriggerHandler.clearAllBypasses();
		update oli;
		opp=[Select Id,Amount, (Select Id,ItemType__c,ProductFamily__c,PRPCId__c,PRPId__c,RPTCId__c From OpportunityLineItems where id=:oli.Id) From Opportunity];
		oli=opp.OpportunityLineItems[0];
		system.assertEquals('2c92a0fd59b56b850159b957444e14e5',oli.PRPCId__c);
		system.assertEquals('2c92a0ff59b56b9b0159b95743131239',oli.PRPId__c);
		system.assertEquals('2c92a0fd59b56b850159b957444f14e6',oli.RPTCId__c);
    		Test.stopTest();
        
    }    
}