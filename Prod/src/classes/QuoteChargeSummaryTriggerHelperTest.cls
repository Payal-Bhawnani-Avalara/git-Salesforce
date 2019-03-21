//Enable_Summary_Reporting needs to be enabled in the config
//@isTest(seeAllData=true)



@isTest
public class QuoteChargeSummaryTriggerHelperTest {

  
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

  static testMethod void testChargeSummaryTriggerHelper() {
    createTestData();
    
    List<zqu__QuoteChargeSummary__c> ListofDiscountQCS = new List<zqu__QuoteChargeSummary__c>();
    
    List<zqu__QuoteChargeSummary__c> qcsList = [SELECT Id,
                                                 zqu__Apply_Discount_To_One_Time_Charges__c,
                                                 zqu__Apply_Discount_To_Recurring_Charges__c,
                                                 zqu__Discount_Level__c,
                                                 Name,
                                                 Quote__c
                                                FROM zqu__QuoteChargeSummary__c 
                                                WHERE Quote__c = :quote.Id];
    upsert qcsList; 
    
    
    /*
    
    QuoteChargeSummaryTriggerHelper qcsth = new QuoteChargeSummaryTriggerHelper(qcsList);
    //find the discounts
    for(zqu__QuoteChargeSummary__c qcs : qcsList)
    {
        if(qcs.Name.contains('Discount'))
        {
            ListofDiscountQCS.add(qcs);
        }
    }
    //subscription level
    for(zqu__QuoteChargeSummary__c qcs : ListofDiscountQCS)
      {
          qcs.zqu__Discount_Level__c = 'Subscription';
      }

    upsert ListofDiscountQCS;
    QuoteChargeSummaryTriggerHelper.hasRun = false;
    qcsth = new QuoteChargeSummaryTriggerHelper(qcsList);
      //account level
    for(zqu__QuoteChargeSummary__c qcs : ListofDiscountQCS)
    {
        qcs.zqu__Discount_Level__c = 'Account';
    }
    
      upsert ListofDiscountQCS;
    QuoteChargeSummaryTriggerHelper.hasRun = false;
      qcsth = new QuoteChargeSummaryTriggerHelper(qcsList);
        
    }
    
    */
    
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
    Contact con = TestFactory.makeContact( acc );
    Opportunity opp = TestFactory.makeOpportunity( acc );
    
    Zuora__Subscription__c sub =  new Zuora__Subscription__c();
    sub.name = 'Test123';
    subName = sub.name;
    sub.Zuora__Account__c = acc.Id;

    Zuora__SubscriptionProductCharge__c spc = new Zuora__SubscriptionProductCharge__c();
      spc.Zuora__Price__c = 123;
    spc.Zuora__Model__c = 'Flat Fee Pricing';
    spc.Zuora__Type__c = 'Recurring';
    spc.Zuora__Subscription__c = sub.Id;
    spc.Zuora__Account__c = acc.Id;
    
    upsert sub;
    
    upsert spc;
    
    quote = TestFactory.makeQuote( opp );
    //add a charge group to the quote, this should insert a quote charge summary
    List<zqu.zChargeGroup> chargesOnQuote = zqu.zQuoteUtil.getChargeGroups(quote.Id, prpIdList);
    List<zqu.zChargeGroup> chargesToAdd = new List<zqu.zChargeGroup>();
    for(zqu.zChargeGroup cg : chargesOnQuote){
      System.Debug('CG Name: ' + cg.ratePlanName);        
      chargesToAdd.add(cg);
    }
    zqu.zQuoteUtil.addChargeGroups(chargesToAdd);
    
    
    }
   
}