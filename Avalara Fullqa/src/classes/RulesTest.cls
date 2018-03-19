@isTest
private class RulesTest {

  private static zqu__Quote__c quote{
    get;
    set;
  }

  private static List<string> prpIdList{
    get{
      if(prpIdList == null){
        prpIdList = new List<string>();
      }
      return prpIdList;
    }
    set;
  }

  public static void createTestData(){
    zqu__zProduct__c product = TestFactory.prepareProductCatalog(false);

    List<zqu__ProductRatePlan__c> prpList = [SELECT Id, 
                                                    Name,
                                                    zqu__ZProduct__c
                                             FROM zqu__ProductRatePlan__c 
                                             WHERE zqu__ZProduct__c = :product.Id];

    System.AssertEquals( 7, prpList.size() );

    List<Rule__c> ruleList = TestFactory.createRules( prpList );
    System.Debug( 'Making rules: ' + ruleList);
    System.AssertEquals( 6, ruleList.size() );

    Account acc = TestFactory.makeAccount();
    Contact con = TestFactory.makeContact( acc );
    Opportunity opp = TestFactory.makeOpportunity( acc );
    quote = TestFactory.makeQuote( opp );

    //this is for using with getChargeGroups global method
    for( zqu__ProductRatePlan__c prp : prpList ){
      prpIdList.add(prp.Id);
    }
  }

  public static testMethod void runRules(){
    createTestData();

    List<zqu.zChargeGroup> cgList = new List<zqu.zChargeGroup>();
    cgList = zqu.zQuoteUtil.getChargeGroups( quote.Id, prpIdList );
    System.AssertNotEquals( 0, cgList.size() );
    Test.startTest();
    List<String> results = Rules.runRules( cgList );
    System.AssertNotEquals( 0, results.size() );
    Test.stopTest();
  }
}