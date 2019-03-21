@isTest
public with sharing class QuoteSplitTest {
  private static zqu__Quote__c quote;

  public static List<zqu.zChargeGroup> cgList{
    get{
      if(cgList == null){
        cgList = new List<zqu.zChargeGroup>();
      }
      return cgList;
    }
    set;
  }

  public static testMethod void QuoteSplitTest(){
    setupTestData();
    //make sure that the test data makes the split run
    System.AssertEquals(true, QuoteSplit.shouldCreateTwoQuotes(quote.Id));
    Test.startTest();
    QuoteSplit.doQuoteSplit(quote.Id);
    Test.stopTest();
    //make sure there are two quotes
    System.AssertNotEquals(null, QuoteSplit.quote);
    System.AssertNotEquals(null, QuoteSplit.subQuote);
    //makes sure the quote has 3 quote rate plan charges, the usage should have been deleted
    Map<Id, zqu__QuoteRatePlan__c> qrpMap = new Map<Id, zqu__QuoteRatePlan__c>([SELECT Id, Name
                                                                                FROM zqu__QuoteRatePlan__c
                                                                                WHERE zqu__Quote__c = :QuoteSplit.quote.Id]);
    System.Debug('After quoteSplit quote qrpMap: ' + qrpMap.values());
    List<zqu__QuoteRatePlanCharge__c> qrpcList = [SELECT Id, Name, zqu__QuoteRatePlan__c 
                                                  FROM zqu__QuoteRatePlanCharge__c 
                                                  WHERE zqu__QuoteRatePlan__c IN :qrpMap.keySet()];

    System.Debug('After quoteSplit quote qrpcList: ' + qrpcList);
    System.AssertEquals(6, qrpcList.size());

  }


  public static zqu__Quote__c setupTestData(){
    List<String> prpIds = TestFactory.makeAvaProductCatalog();
    System.Debug('Got prpIds: ' + prpIds.size() );
    Account acc = TestFactory.makeAccount();
    Contact con = TestFactory.makeContact( acc );
    Opportunity opp = TestFactory.makeOpportunity( acc );
    quote = TestFactory.makeAmendmentQuote( opp );
    //quote = TestFactory.makeQuote( opp );

    List<zqu.zChargeGroup> charges = zqu.zQuoteUtil.getChargeGroups(quote.Id, prpIds);
    cgList = charges;
    zqu.zQuoteUtil.addChargeGroups(charges);

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

    List<zqu__ProductRatePlan__c> prpList = [SELECT Id,
                                                    zqu__ZuoraId__c
                                             FROM zqu__ProductRatePlan__c
                                             ];
    System.Debug('All Rate Plans: ' + prpList);

    List<zqu__ProductRatePlanCharge__c> prpcList = [SELECT Id,
                                                           SubQuote__c,
                                                           zqu__ProductRatePlan__c
                                                    FROM zqu__ProductRatePlanCharge__c];

    System.Debug('All Rate Plans charges: ' + prpcList);

    ChargeSummariesHelper.makeQuoteChargeSummary(cgList[0].zCharges[0], String.valueOf(qrp.Id), String.valueOf(opp.Id));

    return quote;
  }
}