@isTest
private class SubscriptionProductChargeTriggerTest {
  static zqu__Quote__c quote{
    get;
    set;
  }

  static zqu__zProduct__c product{
    get;
    set;
  }

  static List<zqu__ProductRatePlan__c> prpList{
    get;
    set;
  }
  static String subName{
    get;
    set;
  }  	
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
    spc.Zuora__Price__c = 123;
    spc.Zuora__Model__c = 'Flat Fee Pricing';
    spc.Zuora__Type__c = 'Recurring';
    spc.Zuora__Subscription__c = sub.Id;
    spc.Zuora__Account__c = acc.Id;
	spc.Zuora__ProductName__c='Avalara SalesTax II';
	spc.Zuora__Type__c='Recurring';
	spc.ConnectorLookup__c=c.Id;
	spc.Zuora__RatePlanName__c='Pre-Paid Returns Service';
	spc.Zuora__Quantity__c=123;
	spc.Opportunity__c=opp.Id;
	spc.Connector_Name__c='1111';
   // spc.Connector__c='Test Connector';
   // spc.Extended_List_Amount__c=123;
  //  spc.Zuora__ExtendedAmount__c=123;
    upsert spc;

    
   /* quote = TestFactory.makeQuote( opp );
    //add a charge group to the quote, this should insert a quote charge summary
    List<zqu.zChargeGroup> chargesOnQuote = zqu.zQuoteUtil.getChargeGroups(quote.Id, prpIdList);
    List<zqu.zChargeGroup> chargesToAdd = new List<zqu.zChargeGroup>();
    for(zqu.zChargeGroup cg : chargesOnQuote){
      System.Debug('CG Name: ' + cg.ratePlanName);        
      chargesToAdd.add(cg);
    }
    zqu.zQuoteUtil.addChargeGroups(chargesToAdd);*/
    
    
    }
    static testMethod void testupdateRollupsFuture() {
    	 	
    		Test.startTest();
    		createTestData();
	    Zuora__Subscription__c supTemp=[Select Id,Zuora__Status__c From Zuora__Subscription__c ];
	    System.debug('supTemp.Zuora__Status__c====='+supTemp.Zuora__Status__c);    
	    Zuora__SubscriptionProductCharge__c spcTemp=[Select Id,Subscription_Status__c,Zuora__ProductName__c From Zuora__SubscriptionProductCharge__c];
	    spcTemp.Zuora__ProductName__c='Avalara AvaTax';
    		update spcTemp;
    		spcTemp=[Select Id,Subscription_Status__c From Zuora__SubscriptionProductCharge__c Where Id=:spcTemp.Id];
        System.debug('spcTemp.Subscription_Status__c====='+spcTemp.Subscription_Status__c);
        Set<Id> sIDs=new Set<Id>();
        sIDs.add(spcTemp.Id);
        SubscriptionProductChargeTriggerHandler.updateRollupsFuture(sIDs);
        delete spcTemp;
        undelete spcTemp;
		List<Zuora__SubscriptionProductCharge__c> listZSPC=[select Id,Zuora__Account__c,Opportunity__c,Zuora__Subscription__c From Zuora__SubscriptionProductCharge__c Where Id=:sIDs];
    		System.debug('listZSPC====='+listZSPC);	        
        Test.stopTest();
        
    }
}