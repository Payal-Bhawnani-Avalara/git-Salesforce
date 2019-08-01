public with sharing class Rules {

  public static List<Rule__c> rules{
    get{
      if( rules == null ){
        //get the rules filtered by date
        rules =[SELECT Id, 
                        BaseProductRatePlan__c, 
                        TargetProductRatePlan__c,
                        BaseProductName__c,
                        BaseProductRatePlanName__c,
                        TargetProductName__c,
                        TargetProductRatePlanName__c, 
                        Type__c,
                        BaseProductRatePlan__r.Name,
                        TargetProductRatePlan__r.Name,
                        BaseProductRatePlan__r.zqu__ZProduct__r.Name,
                        TargetProductRatePlan__r.zqu__ZProduct__r.Name
                 FROM Rule__c
                 WHERE StartDate__c <= :Date.today()
                 AND EndDate__c >= :Date.today()];
        System.Debug('Got Rules: ' + rules);
      }
      return rules;
    }
    set;
  }

  //map used to link the product and rate plan name to a charge group
  private static Map<string, zqu.zChargeGroup> productAndRatePlanToChargeGroupMap{
    get;
    set;
  }

  public static List<string> runRules( List<zqu.zChargeGroup> chargeGroups ){
    System.Debug('The rules are: ' + rules);
    List<string> output = new List<string>();
    getData(chargeGroups);
    output.addAll(runInclusionRules( chargeGroups ));
    output.addAll(runExclusionRules( chargeGroups ));
    return output;
  }
  
  public static List<string> runExclusionRules( List<zqu.zChargeGroup> chargeGroups ){
    getData(chargeGroups);
    List<string> output = new List<string>();
    //for each rule check if the cg.product name and cg.product rate plan name match the rules
    for( Rule__c r : rules ){
      //check if the base of the rule is in the map, the target is in the map and the rule is exclusion
      if( productAndRatePlanToChargeGroupMap.containsKey(r.BaseProductName__c + r.BaseProductRatePlanName__c) &&
          productAndRatePlanToChargeGroupMap.containsKey(r.TargetProductName__c+r.TargetProductRatePlanName__c) &&
          r.type__c == 'Exclusion' ){
            
            output.add( 'Product: ' + r.BaseProductName__c + 
                        ' and Rate Plan: ' + r.BaseProductRatePlanName__c + 
                        ' must NOT be bought with Product: ' + r.TargetProductName__c + 
                        ' and Rate Plan: ' + r.TargetProductRatePlanName__c );
      }
    }
    return output;
  }
  
  public static List<string> runInclusionRules( List<zqu.zChargeGroup> chargeGroups ){
    getData(chargeGroups);
    List<string> output = new List<string>();
    //for each rule check if the cg.product name and cg.product rate plan name match the rules
    for( Rule__c r : rules ){
      //check if the base of the rule is in the map, the target is in the map and the rule is exclusion
      if( productAndRatePlanToChargeGroupMap.containsKey(r.BaseProductName__c + r.BaseProductRatePlanName__c) &&
          !productAndRatePlanToChargeGroupMap.containsKey(r.TargetProductName__c+r.TargetProductRatePlanName__c) &&
          r.type__c == 'Inclusion' ){
            output.add( 'Product: ' + r.BaseProductName__c + 
                        ' and Rate Plan: ' + r.BaseProductRatePlanName__c + 
                        ' must be bought with Product: ' + r.TargetProductName__c + 
                        ' and Rate Plan: ' + r.TargetProductRatePlanName__c );

      }
    }
    return output;
  }


  private static void getData(List<zqu.zChargeGroup> chargeGroups){

    if( productAndRatePlanToChargeGroupMap == null ){
      productAndRatePlanToChargeGroupMap = getProductAndRatePlanToChargeGroupMap(chargeGroups);
    }
    System.Debug('productAndRatePlanToChargeGroupMap: ' + productAndRatePlanToChargeGroupMap);

  }

  private static Map<String, zqu.zChargeGroup> getProductAndRatePlanToChargeGroupMap(List<zqu.zChargeGroup> input){
    Map<String, zqu.zChargeGroup> output = new Map<String, zqu.zChargeGroup>();
    for(zqu.zChargeGroup cg : input){
      output.put( cg.productName + cg.ratePlanName, cg);
    }
    return output;
  }
}