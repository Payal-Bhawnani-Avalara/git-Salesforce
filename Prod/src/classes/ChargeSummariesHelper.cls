public with sharing class ChargeSummariesHelper {
  @future(callout=true)
  public static void checkForCreate(String jsonStr){
    List<zqu__QuoteRatePlan__c> ratePlanList = (List<zqu__QuoteRatePlan__c>)JSON.deserialize(jsonStr, List<zqu__QuoteRatePlan__c>.class);
    //make a map of the quote rate plan zuora id to the quote rate plan
    Map<String, zqu__QuoteRatePlan__c> qrpMap = new Map<String, zqu__QuoteRatePlan__c>();
    for(zqu__QuoteRatePlan__c qrp : ratePlanList){
      if(qrp.zqu__AmendmentType__c == 'RemoveProduct'){
        qrpMap.put(qrp.zqu__ProductRatePlanZuoraId__c, qrp);
      }
    }
    System.Debug('Checking for creating of quote charge summaries.');
    string quoteId = ratePlanList[0].zqu__Quote__c;

    //get the opportunity from the quote
    List<zqu__Quote__c> quoteList = [SELECT Id, zqu__Opportunity__c
                                     FROM zqu__Quote__c
                                     WHERE Id = :quoteId]; 

    if(needToMakeChargeSummaries(quoteId)){
      makeQuoteChargeSummaries(qrpMap, quoteId, quoteList[0].zqu__Opportunity__c);
    }
  }
  /*
    Make the quote charge summaries  
  */
  private static void makeQuoteChargeSummaries(Map<String, zqu__QuoteRatePlan__c> qrpMap, String quoteId, String oppId){
    System.Debug('Need to create charge summaries for quote: ' + quoteId);
    List<zqu.zChargeGroup> chargeGroups = !Test.isRunningTest() ? zqu.zQuoteUtil.getChargeGroups(quoteId) : QuoteSplitTest.cgList;
    List<zqu__QuoteChargeSummary__c> summariesToCreate = new List<zqu__QuoteChargeSummary__c>();
    //make a map of the product rate plan id to the related charge group
    Map<String, zqu.zChargeGroup> cgMap = getChargeGroupMap(chargeGroups);
    List<String> rpIds = new List<String>();
    if(cgMap.size() > 0){
      rpIds = new List<String>(cgMap.keySet());
    }
    //just go through the charge groups if its deleted and has a one time add a quote charge summary
    for(String rpId : rpIds){
      zqu.zChargeGroup cg = cgMap.get(rpId);
      if(cg.groupType != 6 && cg.groupType != 10){
        continue;//onto the next charge group
      }
      else{
        for(zqu.zCharge c : cg.zCharges){
          if(c.CHARGE_TYPE == 'One-Time'){
            zqu__QuoteChargeSummary__c qcs = makeQuoteChargeSummary(c, qrpMap.get(rpId).Id, oppId);
            summariesToCreate.add(qcs);
          }
        }
      }
    }
    if(summariesToCreate.size() > 0){
      //11-10-14 MD: Future method cannot be called from a future method
      ChargeGroupsHelper.hasRun = true;
      insert summariesToCreate;
    }
  }
  /* 
    Build the quote charge summary based on the charge
  */
  public static zqu__QuoteChargeSummary__c makeQuoteChargeSummary(zqu.zCharge charge, String quoteRatePlanId, String oppId){
    zqu__QuoteChargeSummary__c output = new zqu__QuoteChargeSummary__c();
    output.Name = charge.Name;
    output.zqu__QuoteRatePlan__c = quoteRatePlanId;
    output.zqu__EffectivePrice__c = Decimal.valueOf(charge.EFFECTIVE_PRICE);
    output.zqu__TotalPrice__c = -Decimal.valueOf(charge.TOTAL);
    output.zqu__Discount__c = Decimal.valueOf(charge.DISCOUNT);
    output.zqu__Quantity__c = charge.QUANTITY == '-' ? null : Decimal.valueOf(charge.QUANTITY);
    if(charge.Model == 'Flat Fee Pricing'){
      output.zqu__Quantity__c = -1; 
    }
    output.zqu__Model__c = charge.MODEL;
    output.zqu__Opportunity__c = oppId;
    output.zqu__Period__c = charge.PERIOD == '-' ? null : charge.PERIOD;
    output.zqu__Type__c = charge.CHARGE_TYPE;
    output.zqu__UOM__c = charge.UNIT_OF_MEASURE;
    output.zqu__ListTotal__c = -Decimal.valueOf(charge.LIST_TOTAL);
    output.zqu__ListPrice__c = Decimal.valueOf(charge.LIST_PRICE);
    output.zqu__TCV__c = -Decimal.valueOf(charge.TOTAL);
    output.zqu__MRR__c = 0;
    output.CustomChargeSummary__c = true;

    return output;
  }
  /*
      Makes a map of the product rate plan to the charge group. This field is not populated for existing charge groups
  */
  private static Map<String, zqu.zChargeGroup> getChargeGroupMap(List<zqu.zChargeGroup> cgList){
    Map<String, zqu.zChargeGroup> output = new Map<String, zqu.zChargeGroup>();
    List<String> prpcSfdcIds = new List<String>();
    //make a list of all the charge sfdc id to query
    for(zqu.zChargeGroup cg : cgList){
      for(zqu.zCharge c : cg.zCharges){
        prpcSfdcIds.add(c.PRODUCT_RATE_PLAN_CHARGE_SFDC_ID);
      }
    }
    //query the charges from sfdc and get the product rate plan z id
    Map<String, zqu__ProductRatePlanCharge__c> prpMap = new Map<String, zqu__ProductRatePlanCharge__c>(
                                                  [SELECT Id, 
                                                          Name, 
                                                          zqu__ProductRatePlan__r.zqu__ZuoraId__c,
                                                          zqu__ZuoraId__c
                                                   FROM zqu__ProductRatePlanCharge__c
                                                   WHERE Id IN :prpcSfdcIds]);

    if(prpMap.size() > 0){
      //for each charge group find the sfdc prp id from the prp map and add the charge group to the map
      for(zqu.zChargeGroup cg : cgList){
        String prpSfdcId = '';
        for(zqu.zCharge c : cg.zCharges){
          if(prpMap.containsKey(c.PRODUCT_RATE_PLAN_CHARGE_SFDC_ID)){
            prpSfdcId = prpMap.get(c.PRODUCT_RATE_PLAN_CHARGE_SFDC_ID).zqu__ProductRatePlan__r.zqu__ZuoraId__c;
          }
          else{
            System.Debug('Prp id not found.');
          }
        }
        output.put(prpSfdcId, cg);
      }
    }
    else{
      System.Debug('No product rate plan charges found. Exiting...');
      return output;
    }

    return output;
  }

  /*
   Charges need to be made if there is a remove product amendment on the quote
  */
  private static boolean needToMakeChargeSummaries(String quoteId){
    //get the quote
    List<zqu__Quote__c> quoteList = [SELECT Id, zqu__Previewed_Delta_TCV__c
                                     FROM zqu__Quote__c
                                     WHERE Id = :quoteId 
                                     LIMIT 1];
    //get the quote amendments
    List<zqu__QuoteAmendment__c> qaList = [SELECT Id, zqu__DeltaTCV__c, zqu__Type__c 
                                           FROM zqu__QuoteAmendment__c
                                           WHERE zqu__Quote__c = :quoteId];

    for(zqu__QuoteAmendment__c qa : qaList){
      if(qa.zqu__Type__c == QuoteSplit.REMOVEPRODUCT){
        return true;
      }
    }
    return false;
  }
}