public with sharing class QuoteChargeSummaryTriggerHelper {

    /* Class not currently required 


  //static variable used to make the trigger helper only execute once per context
  public static Boolean hasRun{
    get{
      if(hasRun == null){
        hasRun = false;
      }
      return hasRun;
    }
    set;
  }
  //highest discount level, determines what data to get
  private static String highestDiscountLevel;
  //list of the charges on the quote for new and amend quotes
  @TestVisible private static List<zqu.zChargeGroup> chargeGroupList{
    get{
      if(chargeGroupList == null)
        chargeGroupList = new List<zqu.zChargeGroup>();
      return chargeGroupList;
    }
    set;
  }
  //list of subscription products and charges that are on the quote opportunities account
  //used for the account level discount
  @TestVisible private static List<Zuora__SubscriptionProductCharge__c> subProdList{
    get{
      if(subProdList == null)
        subProdList = new List<Zuora__SubscriptionProductCharge__c>();
      return subProdList;
    }
    set;
  }
 
    //values that need to be set on the quote charge summary / are used to do the calculation
  
  @TestVisible private static Decimal effectivePrice = 0;
  @TestVisible private static Decimal listPrice = 0;
  @TestVisible private static Decimal listTotal = 0;
  @TestVisible private static Decimal totalPrice = 0;
  private static String discounLevel;
  @TestVisible private static Decimal discount;
  @TestVisible private static String productRatePlanChargeZuoraId; 
  @TestVisible private static Decimal chargeEffectivePrice;
  private static String subscriptionType;
  @TestVisible private static String subscriptionName;
  private static Boolean applyToOneTime{
    get{
      if(applyToOneTime == null)
        applyToOneTime = false;
      return applyToOneTime;
    }
    set;
  }
  private static Boolean applyToRecurring{
    get{
      if(applyToRecurring == null)
        applyToRecurring = false;
      return applyToRecurring;
    }
    set;
  }

  //constructor
  public QuoteChargeSummaryTriggerHelper(List<zqu__QuoteChargeSummary__c> qcsList) {
    System.Debug('Running quote charge summary trigger helper for qcsList: ' + qcsList.size());
    if(!QuoteChargeSummaryTriggerHelper.hasRun && qcsList.size() > 0 ){
      //MD 8/7 
      //process all the quote charge summaries for the quote
      String quoteId = qcsList[0].Quote__c;
      qcsList = [SELECT Id,
                  zqu__Model__c,
                  zqu__Apply_Discount_To_Recurring_Charges__c,
                  zqu__Apply_Discount_To_One_Time_Charges__c,
                  Quote__c,
                  zqu__Discount_Level__c,
                  zqu__Discount__c,
                  zqu__EffectivePrice__c,
                  zqu__ListPrice__c,
                  zqu__TotalPrice__c,
                  zqu__QuoteRatePlanCharge__c,
                  zqu__Quote_Charge__c
                 FROM zqu__QuoteChargeSummary__c
                 WHERE Quote__c = :quoteId
                ];
      System.Debug('All qcLsist: ' + qcsList.size());
      doFutureLogic(JSON.serialize(qcsList));
      QuoteChargeSummaryTriggerHelper.hasRun = true;
    }
  }
  @future(callout=true)
  private static void doFutureLogic(String jsonStr){
    System.Debug('Running future method, has run: ' + QuoteChargeSummaryTriggerHelper.hasRun );
    List<zqu__QuoteChargeSummary__c> qcsList = (List<zqu__QuoteChargeSummary__c>) JSON.deserialize(jsonStr, List<zqu__QuoteChargeSummary__c>.class);
    //check for discount type summaries
    if(hasDiscountCharge(qcsList)){
      //get data needed
      getData(qcsList);
      //do the calculations of the discoun for each quote charge summary
      doCalculations(qcsList);
      //before
      System.Debug('Updating! ');
      QuoteChargeSummaryTriggerHelper.hasRun = true;
      update qcsList;
    }
  }
  //get the necessary data
  private static void getData(List<zqu__QuoteChargeSummary__c> qcsList){
    //quoteId to get chargeGroups
    String quoteId = qcsList[0].Quote__c;
    
    List<zqu__Quote__c> quoteList = [SELECT Id,
                                       zqu__Opportunity__r.AccountId,
                                       zqu__SubscriptionType__c,
                                       zqu__Hidden_Subscription_Name__c
                                     FROM zqu__Quote__c
                                     WHERE Id = :quoteId];
    String accountId = quoteList[0].zqu__Opportunity__r.AccountId;
    subscriptionType = quoteList[0].zqu__SubscriptionType__c;
    subscriptionName = quoteList[0].zqu__Hidden_Subscription_Name__c;
    //charge groups will pull up everything on a quote and in zuora sub
    if(quoteId != null){  
      chargeGroupList = zqu.zQuoteUtil.getChargeGroups(quoteId);
    }
    //based on highest discount get the data needed
    if(highestDiscountLevel == 'Account'){
      //get subscription product and charges
      subProdList = [SELECT Id,
                      Zuora__Price__c,
                      Zuora__Model__c,
                      Zuora__Type__c,
                      Name,
                      Zuora__Subscription__r.Name
                     FROM Zuora__SubscriptionProductCharge__c
                     WHERE Zuora__Account__c = :accountId];
    }
  }
  //clear that values between new ccharge summary calcs
  private static void clearChargeSummaryValues(){
    effectivePrice = 0;
    listPrice = 0;
    listTotal = 0;
    totalPrice = 0;
    productRatePlanChargeZuoraId = null;
  }
  //calculates the values for the quote charge summaries
  private static void doCalculations(List<zqu__QuoteChargeSummary__c> qcsList){
    //get the quote id to get the charge groups for the quote or can i use the quote charges from the quote
    for(zqu__QuoteChargeSummary__c qcs : qcsList){
      applyToRecurring = qcs.zqu__Apply_Discount_To_Recurring_Charges__c;
      applyToOneTime = qcs.zqu__Apply_Discount_To_One_Time_Charges__c;
      if(qcs.zqu__Model__c == 'Discount-Fixed Amount'){
        doFlatFeeCalc(qcs);
      }
      else if(qcs.zqu__Model__c == 'Discount-Percentage'){
        doPercentageCalc(qcs);
      }
    }
  }
  //List Price: The non-discounted sum of all qualifying charges
  //Effective Price: Inherit from the QuoteCharge/QuoteRatePlanCharge Effective Price
  //Discount: The calculated discount percent (Effective Price/ List Price 
  //List Total: The non-discounted sum of all qualifying charges
  //Total Price: The calculated summed discount amount (List Price – Effective Price) 
  //does the calculation for Discount Fixed Amount
  private static zqu__QuoteChargeSummary__c doFlatFeeCalc(zqu__QuoteChargeSummary__c qcs){
    clearChargeSummaryValues();
    //find the level
    discounLevel = qcs.zqu__Discount_Level__c;
    //get the discount and charge effectice price and prpc id
    getChargeInfo(qcs);
    //rate plan level discount
    if(discounLevel == 'RatePlan'){
      //find the chargeGroups under the related rate plan
      doRatePlanFlatDiscountCalc();
    }
    //subscription level discount
    else if(discounLevel == 'Subscription'){
      //discount all chargeGroups on quote
      doSubscriptionFlatDiscountCalc();
    }
    //account level discount
    else if(discounLevel == 'Account'){
      //get the subscription product and charges for the account 
      //include the chargeGroups
      doAccountFlatDiscountCalc();
    }
    listTotal = listPrice;
    //set all the calculated values
    qcs.zqu__Discount__c = discount;
    qcs.zqu__EffectivePrice__c = effectivePrice;
    qcs.zqu__ListPrice__c = listPrice;
    qcs.zqu__ListTotal__c = listTotal;
    qcs.zqu__TotalPrice__c = totalPrice;
    System.Debug('Setting values for qcs: ' + qcs.Name);
    System.Debug('discount: ' + discount);
    System.Debug('effectivePrice: ' + effectivePrice);
    System.Debug('listPrice: ' + listPrice);
    System.Debug('listTotal: ' + listTotal);
    System.Debug('totalPrice: ' + totalPrice);

    return qcs;
  }
   @TestVisible private static void doAccountFlatDiscountCalc(){
    //current quote and whats on the account
    doSubscriptionFlatDiscountCalc();
    //subscription products and charges 
    doSubscriptionProductFlatDiscountCalc();
  }
  @TestVisible private static void doSubscriptionProductFlatDiscountCalc(){
    //check if the subscription # from the quote matches the subProdList subscription
    System.Debug('subscription products flat fee discount: ' + subProdList.size());
    //don't get the count the exisiting ones for the quote
    for(Zuora__SubscriptionProductCharge__c spc : subProdList){
      if(spc.zuora__model__c != 'Discount-Percentage' && 
         spc.zuora__model__c != 'Discount-Fixed Amount' && 
         spc.Zuora__Type__c != 'Usage' &&
         spc.Zuora__Subscription__r.Name != subscriptionName){
        System.Debug('Got non discount sub product charge: ' + spc.Name);
        if(spc.zuora__Price__c != null){
          //only add if the discount should apply to it
          //List Price: The non-discounted sum of all qualifying charges
          //if((spc.Zuora__Type__c == 'One-Time' && applyToOneTime) || (spc.Zuora__Type__c == 'Recurring' && applyToRecurring)){
            listPrice += spc.zuora__Price__c;
          //}
          //Effective Price: Inherit from the QuoteCharge/QuoteRatePlanCharge Effective Price
          effectivePrice = chargeEffectivePrice;   
        }
      }
    }
    //total price = list total - effective price
    //MD 8/6
    //Fix account level fixed fee discount
    totalPrice = listPrice - effectivePrice;
    //Discount: The calculated discount percent (Effective Price/ List Price)
    //divide by zero error...
    if(listPrice != 0)
      //MD 8/6
      //Fix account level fixed fee discount 
      discount = 100 - ((totalPrice / listPrice) * 100);
  }
  private static void doSubscriptionFlatDiscountCalc(){
    System.Debug('Got Sub evel Flat fee Discount, need to do calculations for: ' + chargeGroupList.size());
    //do the calculation all the charges on the quote/subscription
    for(zqu.zChargeGroup cg : chargeGroupList){
      for(zqu.zCharge c : cg.zCharges){
        if(c.MODEL != 'Discount-Percentage' && 
           c.MODEL != 'Discount-Fixed Amount' && 
           c.CHARGE_TYPE != 'Usage'){

          //if((c.CHARGE_TYPE == 'One-Time' && applyToOneTime) || (c.CHARGE_TYPE == 'Recurring' && applyToRecurring)){
            totalPrice += listPrice;
          //}
          //List Price: The non-discounted sum of all qualifying charges
          //effective price can be - for some charges
          try{
            listPrice += Decimal.valueOf(c.EFFECTIVE_PRICE);
          }
          catch(Exception e){
            System.Debug(e);
          }
          //Effective Price: Inherit from the QuoteCharge/QuoteRatePlanCharge Effective Price
          effectivePrice = chargeEffectivePrice;        
        }
      }

    }
    //total price = list total - effective price
    totalPrice = listPrice - effectivePrice;
    //Discount: The calculated discount percent (Effective Price/ List Price)
    //divide by zero error...
    if(listPrice != 0) 
      discount = (effectivePrice / listPrice) * 100;  
  }
  //calculate the values for a flat fee rate plan level discount
  @TestVisible private static void doRatePlanFlatDiscountCalc(){
    //find the chargeGroups under the related rate plan
    System.Debug('Got Rate Plan Level Flat fee Discount, need to find related chargeGroup in: ' + chargeGroupList.size());
    zqu.zChargeGroup matchingChargeGroup;
    for(zqu.zChargeGroup cg : chargeGroupList){
      for(zqu.zCharge c : cg.zCharges){
        //match the quote rate plan charge summary to the correct zCharge by the product rate plan charge sfdc id
        if(productRatePlanChargeZuoraId == c.PRODUCT_RATE_PLAN_CHARGE_ZUORA_ID){
          matchingChargeGroup = cg;
          break;
        }
      }
    }
    //do the calculation for the other charges in the current chargeGroup that dont have the quote charge id
    for(zqu.zCharge c : matchingChargeGroup.zCharges){
      System.Debug('matchingChargeGroups size: ' + matchingChargeGroup.zCharges.size());
      if(c.MODEL != 'Discount-Percentage' && 
        c.MODEL != 'Discount-Fixed Amount' && 
        c.CHARGE_TYPE != 'Usage'){
        //only if the discount should apply to the correct type
        if((c.CHARGE_TYPE == 'One-Time' && applyToOneTime) || (c.CHARGE_TYPE == 'Recurring' && applyToRecurring)){
          //Total Price: The calculated summed discount amount (List Price – Effective Price) 
          //use case 4 fix
          totalPrice += listPrice;
        }
        //List Price: The non-discounted sum of all qualifying charges
        if(c.EFFECTIVE_PRICE != '-'){
          listPrice += Decimal.valueOf(c.EFFECTIVE_PRICE);
        }
        //Effective Price: Inherit from the QuoteCharge/QuoteRatePlanCharge Effective Price
        effectivePrice = chargeEffectivePrice;        
      }
    }
    //use case 4 fix
    totalPrice = listPrice - effectivePrice;
    //Discount: The calculated discount percent (Effective Price/ List Price
    if(listPrice != 0) 
      discount = (effectivePrice / listPrice)*100;     
  }

  //does the calculation for Discount Percentage Amount
  //example from doc
  //Discount = Inherit from QuoteCharge/RatePlanCharge Effective Price
  //Effective Price = Sum of discounted amounts (100 - (100 x .10)) + (130 – (130 x .10))
  //List Price = Sum of non discounted amounts (100 + 130) 
  //List Total = Sum of non discounted amounts (100 + 130)
  //Total Price = Sum of discounted amounts (100 - (100 x .10)) + (130 – (130 x .10))
  private static zqu__QuoteChargeSummary__c doPercentageCalc(zqu__QuoteChargeSummary__c qcs){
    clearChargeSummaryValues();
    //find the level
    discounLevel = qcs.zqu__Discount_Level__c;
    //this should come from the quote charge / quote rate plan charge
    discount = qcs.zqu__EffectivePrice__c;
    //get the discount and product rate plan charge id from different objects based on quote type
    getChargeInfo(qcs);
    //rate plan level discount
    if(discounLevel == 'RatePlan'){
      doRatePlanPercentageDiscountCalc();
    }
    //subscription level discount
    else if(discounLevel == 'Subscription'){
      doSubscriptionPercentageDiscountCalc();
    }
    //account level discount
    else if(discounLevel == 'Account'){
      doAccountPercentageDiscountCalc();
    }
    //these are always the same as the others 
    listTotal = listPrice;   
    totalPrice = effectivePrice;
    //set all the calculated values
    qcs.zqu__Discount__c = discount;
    qcs.zqu__EffectivePrice__c = effectivePrice;
    qcs.zqu__ListPrice__c = listPrice;
    qcs.zqu__ListTotal__c = listTotal;
    qcs.zqu__TotalPrice__c = totalPrice;
    System.Debug('Setting values for qcs: ' + qcs.Name);
    System.Debug('discount: ' + discount);
    System.Debug('effectivePrice: ' + effectivePrice);
    System.Debug('listPrice: ' + listPrice);
    System.Debug('listTotal: ' + listTotal);

    return qcs;
  }
  //calculate the values for the account level discount quote charge summary
  private static void doAccountPercentageDiscountCalc(){
    System.Debug('Got Subscription Level Discount, need to find calculate discounts for chargeGroups in: ' + chargeGroupList.size());
    System.Debug('Got Subscription Level Discount, need to find calculate discounts for subProdList in: ' + subProdList.size());
    //current quote / sub
    doSubscriptionPercentageDiscountCalc();
    //all other subscription products in sfdc for this account
    doSubscriptionProductPercentageDiscountCalc();
  }
  //calculate effective price and list price for subscription products and charges 
  //percent discount
  private static void doSubscriptionProductPercentageDiscountCalc(){
    System.Debug('subProdList' + subProdList.size());
    for(Zuora__SubscriptionProductCharge__c spc : subProdList){
      if(spc.zuora__model__c != 'Discount-Percentage' && 
         spc.zuora__model__c != 'Discount-Fixed Amount' && 
         spc.Zuora__Type__c != 'Usage'
         && spc.Zuora__Subscription__r.Name != subscriptionName){
        System.Debug('Got non discount sub product charge: ' + spc.Name);
        System.Debug('Discount: ' + discount);
        System.Debug('spc.zuora__Price__c: ' + spc.zuora__Price__c);
        System.Debug('effectivePrice: ' + effectivePrice);
        if(spc.zuora__Price__c != null){
          if((spc.Zuora__Type__c == 'One-Time' && applyToOneTime) || (spc.Zuora__Type__c == 'Recurring' && applyToRecurring)){
            //effective price += charge effective price by discountsiscount % amount
            effectivePrice += spc.zuora__Price__c - (spc.zuora__Price__c * (discount/100));
          }
          //list ignores the discount
          //list price += charge effective price
          listPrice += spc.zuora__Price__c;
        }
      }
    }
  }
  //calculate the values for subscription level charges
  private static void doSubscriptionPercentageDiscountCalc(){
    //discount all chargeGroups on quote
    System.Debug('Got Subscription Level Discount, need to find calculate discounts for chargeGroups in: ' + chargeGroupList.size());
    for(zqu.zChargeGroup cg : chargeGroupList){
      for(zqu.zCharge c : cg.zCharges){
        //if the charge model is not discount type and not usage
        calculateEffectiveAndListForPercentage(c);
      }
    }
  }
  //does the calculation of effective and list price for rate plan % discount product
  private static void doRatePlanPercentageDiscountCalc(){
    //find the chargeGroups under the related rate plan
    System.Debug('Got Rate Plan Level Discount, need to find related chargeGroup in: ' + chargeGroupList.size());
    zqu.zChargeGroup matchingChargeGroup;
    for(zqu.zChargeGroup cg : chargeGroupList){
      for(zqu.zCharge c : cg.zCharges){
        //match the quote rate plan charge summary to the correct zCharge by the product rate plan charge sfdc id
        if(productRatePlanChargeZuoraId == c.PRODUCT_RATE_PLAN_CHARGE_ZUORA_ID){
          matchingChargeGroup = cg;
          break;
        }
      }
    }
    //do the calculation for the other charges in the current chargeGroup that dont have the quote charge id
    for(zqu.zCharge c : matchingChargeGroup.zCharges){
      if(productRatePlanChargeZuoraId != c.PRODUCT_RATE_PLAN_CHARGE_ZUORA_ID){
        calculateEffectiveAndListForPercentage(c);
      }
    }    
  }
  //calculate effective and list price for percentage charges
  //for non discount and non usage charges
  private static void calculateEffectiveAndListForPercentage(zqu.zCharge c){
    if(c.MODEL != 'Discount-Percentage' && c.MODEL != 'Discount-Fixed Amount' && c.CHARGE_TYPE != 'Usage'){
      System.Debug('Got non discount charge.');
      //apply if discount applies to the charge type
      if((c.CHARGE_TYPE == 'One-Time' && applyToOneTime) || (c.CHARGE_TYPE == 'Recurring' && applyToRecurring)){
        //effective price += charge effective price by discountsiscount % amount
        //effective price can be - for some charges
        try{
          effectivePrice += Decimal.valueOf(c.EFFECTIVE_PRICE) - (Decimal.valueOf(c.EFFECTIVE_PRICE) * (discount/100));
        }
        catch(Exception e){
          System.Debug(e);
        }
        //list price += charge effective price
      }
      //list ignores the discount
      try{
        listPrice += Decimal.valueOf(c.EFFECTIVE_PRICE);
      }
      catch(Exception e){
        System.Debug(e);
      }
    }
  }
  //if its being updated the will be a quote quote charge / quote rate plan charge
  //gets the discount and product rate plan charge sfdc id for new and amend quotes
  //if amendment sub
  private static void getChargeInfo(zqu__QuoteChargeSummary__c qcs){
    //TODO
    //IF ITS A NEW SUBSCRIPTION USE QUOTE CHARGE
    //IFS ITS AN AMEND/RENEW SUBSCRIPTION USE QUOTE RATE PLAN CHARGE
    //to get the discount % and sfdc product charge id
    if(subscriptionType == 'New Subscription' && qcs.zqu__Quote_Charge__c != null){
      System.Debug('Charge Populated.  Querying the quote charge. ');
      //guery the quote charge
      //this will need to be bulkafied
      List<zqu__QuoteCharge__c> qcList = [SELECT zqu__EffectivePrice__c,
                                            zqu__ProductRatePlanCharge__r.zqu__ZuoraId__c,
                                            zqu__ProductName__c,
                                            zqu__ProductRatePlanName__c
                                          FROM zqu__QuoteCharge__c
                                          WHERE id = :qcs.zqu__Quote_Charge__c];
      if(qcList.size() > 0){
        productRatePlanChargeZuoraId = qcList[0].zqu__ProductRatePlanCharge__r.zqu__ZuoraId__c;
        discount = qcList[0].zqu__EffectivePrice__c;
        chargeEffectivePrice = qcList[0].zqu__EffectivePrice__c;
      }
    }
    //amend / renew quote rate plan charge not null
    else if(qcs.zqu__QuoteRatePlanCharge__c != null){
      //query the quote rate plan charge
      //this will need to be bulkafied
      List<zqu__QuoteRatePlanCharge__c> qrpcList = [SELECT zqu__EffectivePrice__c,
                                                      zqu__ProductRatePlanChargeZuoraId__c
                                                    FROM zqu__QuoteRatePlanCharge__c
                                                    WHERE id = :qcs.zqu__QuoteRatePlanCharge__c];
      if(qrpcList.size() > 0){
        productRatePlanChargeZuoraId = qrpcList[0].zqu__ProductRatePlanChargeZuoraId__c;
        discount = qrpcList[0].zqu__EffectivePrice__c;
        chargeEffectivePrice = qrpcList[0].zqu__EffectivePrice__c;
      }
    }
  }
  //returns true if one of the charges is discount
  //and determines the highest level of the discount
  private static boolean hasDiscountCharge(List<zqu__QuoteChargeSummary__c> qcsList){
    Boolean hasDiscountCharge = false;
    for(zqu__QuoteChargeSummary__c qcs : qcsList){
      if(qcs.zqu__Model__c == 'Discount-Fixed Amount' || qcs.zqu__Model__c == 'Discount-Percentage'){
        hasDiscountCharge = true;
        if(String.isEmpty(highestDiscountLevel)){
          highestDiscountLevel = qcs.zqu__Discount_Level__c;
        }
        else{
          if(highestDiscountLevel == 'RatePlan' && qcs.zqu__Discount_Level__c == 'Subscription'){
            highestDiscountLevel = 'Subscription';
          }
          else if(highestDiscountLevel == 'RatePlan' && qcs.zqu__Discount_Level__c == 'Account'){
            highestDiscountLevel = 'Account';
          }
          else if(highestDiscountLevel == 'Subscription' && qcs.zqu__Discount_Level__c == 'Account'){
            highestDiscountLevel = 'Account';
          }
        }
      }
    }
    System.Debug('Has discount charge? ' + highestDiscountLevel);
    return hasDiscountCharge;
  }
  
  */
}