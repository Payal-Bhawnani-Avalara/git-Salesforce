//@isTest(seeAllData=true)
@isTest
public class ChargeGroupsHelperTest {
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
  
   static testMethod void testChargeGroupHelper() {
   	
   		createTestData();
   		
   		Set<String> Prod = new Set<String>();
   		
   		Prod.add('testing');
   		
   		System.Debug('QuoteId: ' + quote.Id);
   		
   		ChargeGroupsHelper.getChargeGroups((String)quote.Id, Prod, True, False);
   		
   		List < zqu__QuoteRatePlanCharge__c > QRPCharges = new List < zqu__QuoteRatePlanCharge__c>();
   		
   		QRPCharges = [Select Id from zqu__QuoteRatePlanCharge__c where zqu__QuoteRatePlan__r.zqu__Quote__c = :quote.Id];
   		
   		System.Debug('QRPCharges: ' + QRPCharges);
   }

	static void createTestData(){
		
	   ActivationCreditSettings__c CustomSettings = new ActivationCreditSettings__c();
		
	   List<String> prpIds = TestFactory.makeAvaProductCatalog();
	   System.Debug('Got prpIds: ' + prpIds.size() );
	   Account acc = TestFactory.makeAccount();
	   Contact con = TestFactory.makeContact( acc );
	   Opportunity opp = TestFactory.makeOpportunity( acc );
		
		
		/*

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
    Contact con = TestFactory.makeContact( acc );
    Opportunity opp = TestFactory.makeOpportunity( acc );
    
    Zuora__Subscription__c sub =  new Zuora__Subscription__c();
    sub.name = 'Test123';
    
    SubName = sub.name;
    
    sub.Zuora__Account__c = acc.Id;
    Zuora__SubscriptionProductCharge__c spc = new Zuora__SubscriptionProductCharge__c();
	spc.Zuora__Price__c = 123;
    spc.Zuora__Model__c = 'Flat Fee Pricing';
    spc.Zuora__Type__c = 'Recurring';
    spc.Zuora__Subscription__c = sub.Id;
    spc.Zuora__Account__c = acc.Id;
    
    upsert sub;
    
    upsert spc;
    
    */

   //quote = TestFactory.makeAmendmentQuote( opp );
   
   quote = TestFactory.makeQuote( opp );

   List<zqu.zChargeGroup> charges = zqu.zQuoteUtil.getChargeGroups(quote.Id, prpIds);
   //cgList = charges;
    List<zqu.zChargeGroup> chargesToAdd = new List<zqu.zChargeGroup>();
 
    for(zqu.zChargeGroup cg : charges){
    	
    	 System.Debug('CG Name: ' + cg.ratePlanName);        
        
         System.Debug('CG GroupType: ' + cg.groupType);   
    	
    	 chargesToAdd.add(cg);
    }
   zqu.zQuoteUtil.addChargeGroups(chargesToAdd);
   

   zqu__QuoteAmendment__c qa = new zqu__QuoteAmendment__c(
     Name = 'Test',
     zqu__Quote__c = quote.Id,
     zqu__Type__c = QuoteSplit.REMOVEPRODUCT,
     zqu__Status__c = 'Draft',
     zqu__DeltaTCV__c = 123
                                                         );

   insert qa;

   zqu__QuoteRatePlan__c qrp = new zqu__QuoteRatePlan__c(
     zqu__AmendmentType__c = QuoteSplit.REMOVEPRODUCT,
     zqu__ProductRatePlanZuoraId__c = '154657',
     zqu__Quote__c = quote.Id,
     zqu__QuoteAmendment__c = qa.Id
                                                        );
                                                        
   insert qrp;
   
   CustomSettings.ActivationCreditRatePlanId__c = qrp.Id;

   zqu__QuoteAmendment__c qa2 = new zqu__QuoteAmendment__c(
     Name = 'Test',
     zqu__Quote__c = quote.Id,
     zqu__Type__c = QuoteSplit.REMOVEPRODUCT,
     zqu__Status__c = 'Draft',
     zqu__DeltaTCV__c = 123
                                                         );

   insert qa2;

   zqu__QuoteRatePlan__c qrp2 = new zqu__QuoteRatePlan__c(
     zqu__AmendmentType__c = QuoteSplit.REMOVEPRODUCT,
     zqu__ProductRatePlanZuoraId__c = '154659',
     zqu__Quote__c = quote.Id,
     zqu__QuoteAmendment__c = qa2.Id
                                                        );

   insert qrp2;
   
	}
	
	
    
    /*
    
    quote = TestFactory.makeQuote( opp );
    
    List<zqu.zChargeGroup> chargesOnQuote = zqu.zQuoteUtil.getChargeGroups(quote.Id, prpIdList);

    List<zqu.zChargeGroup> chargesToAdd = new List<zqu.zChargeGroup>();
 
    for(zqu.zChargeGroup cg : chargesOnQuote){

        System.Debug('CG Name: ' + cg.ratePlanName);        
        
        System.Debug('CG GroupType: ' + cg.groupType);        
      
          chargesToAdd.add(cg);

    }
    zqu.zQuoteUtil.addChargeGroups(chargesToAdd);
   
	
	
	*/

}