public with sharing class ChargeGroupsHelper {

  public static Boolean hasRun {
    get {
      if (hasRun == null) {
        hasRun = false;
      }
      return hasRun;
    }
    set;

  }

  public static Boolean deletePerformed {
    get {
      if (deletePerformed == null) {
        deletePerformed = false;
      }
      return deletePerformed;
    }
    set;

  }

  public static List < zqu.zChargeGroup > listOfChargeGroups {
    get {
      if (listOfChargeGroups == null) {
        listOfChargeGroups = new List < zqu.zChargeGroup > ();
      }
      return listOfChargeGroups;
    }
    set;
  }
  
  public static Set < String > ProductsWithFlag {
  	get {
      if (ProductsWithFlag == null) {
        ProductsWithFlag = new set < String > ();
      }
      return ProductsWithFlag;
    }
    set;
  }
  /*
  public Map < String, Set < String >> ProductMap {
    get {
      if (ProductMap == null) {
        ProductMap = new Map < String, Set < String >> ();
      }

      return ProductMap;
    }
    set;
  }*/
  
   /*
  *  Display a message on the VF page
  */
 public static void appendMessage(ApexPages.Severity severity, String message) {
   ApexPages.addMessage(new ApexPages.Message(severity, message));
 }

  public static List < zqu__QuoteAmendment__c > deleteExistingCredits(String QuoteId) {
    zqu__Quote__c Quote = [Select Id, zqu__Account__c, zqu__SubscriptionVersion__c from zqu__Quote__c where Id = : QuoteId];

    List < zqu__QuoteRatePlan__c > ListOfQuoteRatePlans = new List < zqu__QuoteRatePlan__c > ();
    List < zqu__QuoteAmendment__c > ListOfQuoteAmendments = new List < zqu__QuoteAmendment__c > ();
    Set < String > QRPIds = new Set < String > ();

    ActivationCreditSettings__c avalara = ActivationCreditSettings__c.getInstance(UserInfo.getOrganizationId());

    System.Debug('Avalara: ' + Avalara);

    if (Test.isRunningtest()) {
      zqu__ProductRatePlan__c testRatePlan = [Select Id from zqu__ProductRatePlan__c Limit 1];
      ListOfQuoteRatePlans = [Select Id, zqu__ProductRatePlanZuoraId__c, zqu__QuoteAmendment__r.Id from zqu__QuoteRatePlan__c where zqu__Quote__c = : QuoteId AND zqu__ProductRatePlanZuoraId__c = : testRatePlan.Id];

    }
    else {
      zqu__ProductRatePlan__c ConfigRatePlan = [Select Id, zqu__ZuoraId__c from zqu__ProductRatePlan__c where Id = : avalara.ActivationCreditRatePlanId__c];
      ListOfQuoteRatePlans = [Select Id, zqu__ProductRatePlanZuoraId__c, zqu__QuoteAmendment__r.Id from zqu__QuoteRatePlan__c where zqu__Quote__c = : QuoteId AND zqu__ProductRatePlanZuoraId__c = : ConfigRatePlan.zqu__ZuoraId__c];
    }

    System.Debug('ListofQuoteRatePlans: ' + ListofQuoteRatePlans);

    for (zqu__QuoteRatePlan__c qrp: ListofQuoteRatePlans) {
      QRPIds.add(qrp.zqu__QuoteAmendment__r.Id);
    }

    ListOfQuoteAmendments = [Select Id from zqu__QuoteAmendment__c where Id IN: QRPIds];

    System.Debug('ListOfQuoteAmendments: ' + ListOfQuoteAmendments);


    hasRun = true;

    return ListOfQuoteAmendments;
    //Delete ListOfQuoteRatePlans;



  }

  @future(callout = true)
  public static void getChargeGroups(String QuoteId, Set < String > Products, Boolean flag, Boolean createOnlyQCS) {
    System.debug('Running get chargegroups...' + System.today());
    //if (hasRun == false) {

    List < zqu__QuoteAmendment__c > amendmentsToDelete = new List < zqu__QuoteAmendment__c > ();
    amendmentsToDelete = deleteExistingCredits(QuoteId);
    
    List<zqu__QuoteChargeSummary__c> summariesToCreate = new List<zqu__QuoteChargeSummary__c>();
    
    List<zqu__QuoteChargeSummary__c> summariesToDelete = new List<zqu__QuoteChargeSummary__c>();
    
    summariesToDelete = [Select Id, CustomChargeSummary__c, Quote__c from zqu__QuoteChargeSummary__c where CustomChargeSummary__c = true AND Quote__c = :QuoteId];
    
    List<zqu.zChargeGroup> chargeGroupstoCreate = new List<zqu.zChargeGroup>();
    
    Map<String, zqu__QuoteRatePlan__c> qrpMap = new Map<String, zqu__QuoteRatePlan__c>();
    
    String theRatePlanId;
    
    zqu.zCharge theCharge = new zqu.zCharge();
    
    List<zqu__QuoteRatePlan__c> ratePlanList = [Select Id, zqu__ProductRatePlanZuoraId__c, zqu__SubscriptionRatePlanZuoraId__c, zqu__AmendmentType__c FROM zqu__QuoteRatePlan__c where zqu__Quote__c = :quoteId];
    
    for(zqu__QuoteRatePlan__c qrp : ratePlanList){
      if(qrp.zqu__AmendmentType__c == 'RemoveProduct'){
        qrpMap.put(qrp.zqu__SubscriptionRatePlanZuoraId__c, qrp);
      }
    }

    if (flag == true && !Test.isRunningtest()) {

      zqu__Quote__c Quote = [Select Id, zqu__Account__c, zqu__Opportunity__c from zqu__Quote__c where Id = : QuoteId];

      Decimal TotalAmount = 0;

      Set < String > RatePlanIds = new Set < String > ();

      System.Debug('QuoteId in Helper: ' + QuoteId);

      listOfChargeGroups = zqu.zQuoteUtil.getChargeGroups(QuoteId);

      System.Debug('listOfChargeGroups: ' + listOfChargeGroups);

      for (zqu.zChargeGroup cG: listOfChargeGroups) {
        RatePlanIds.add(cG.productRatePlanZuoraId);
      }

      System.Debug('RatePlanIds: ' + RatePlanIds);

      List < Zuora__SubscriptionProductCharge__c > SubProdAndCharges = new List < Zuora__SubscriptionProductCharge__c > ();

      SubProdAndCharges = [Select Id, Zuora__EffectiveStartDate__c, Zuora__Price__c, Zuora__Zuora_Id__c, Zuora__RatePlanId__c from Zuora__SubscriptionProductCharge__c where Zuora__Account__c = : Quote.zqu__Account__c];

      System.Debug('SubProdAndCharges : ' + SubProdAndCharges);

      Map < String, Zuora__SubscriptionProductCharge__c > SPCMap = new Map < String, Zuora__SubscriptionProductCharge__c > ();

      for (Zuora__SubscriptionProductCharge__c spc: SubProdAndCharges) {
        SPCMap.put(spc.Zuora__Zuora_Id__c, spc);
      }

      System.Debug('SPC Map: ' + SPCMAP);

      for (String P: Products) {
        TotalAmount = 0;

        for (zqu.zChargeGroup cG: listOfChargeGroups) {
          System.Debug('ChargeGroupType: ' + cG.groupType);

          if (cG.groupType == 6) {
            List < zqu.zCharge > charges = cG.zcharges;

            for (zqu.zCharge c: charges) {
              System.Debug('c.getQuoteRatePlanChargeZuoraId(): ' + c.getQuoteRatePlanChargeZuoraId());
              if (c.CHARGE_TYPE == 'One-Time' && cG.productName == P && (SPCMap.get(c.getQuoteRatePlanChargeZuoraId()) != null)) {
                TotalAmount = TotalAmount + SPCMap.get(c.getQuoteRatePlanChargeZuoraId()).Zuora__Price__c;
                theRatePlanId = qrpMap.get(SPCMap.get(c.getQuoteRatePlanChargeZuoraId()).Zuora__RatePlanId__c).Id;
                theCharge = c;
                //c.ChargeObject.put('zqu__QuoteRatePlan__r.Credited__c', true);
              }
              System.Debug('TotalAmount: ' + TotalAmount);
           	  
            }
          }
        }


        System.Debug('TotalAmount: ' + TotalAmount);
		if(createOnlyQCS)
		{  
			    summariesToCreate.add(makeQuoteChargeSummary(theCharge, theRatePlanId, Quote.zqu__Opportunity__c));
		}
		else
		{
        	chargeGroupstoCreate.addAll(makeQuoteCharge(TotalAmount, QuoteId));
		}
      }

      System.Debug('End of getChargeGroups');

    

	

    Delete amendmentsToDelete;

	Delete summariesToDelete;
    
    deletePerformed = true;
    
    hasRun = true;
    if (chargeGroupstoCreate.size() != 0) {
      zqu.zQuoteUtil.addChargeGroups(chargeGroupstoCreate);
    }
    if(summariesToCreate.size() > 0){
      insert summariesToCreate;
    }
    
    }

    //}

    System.Debug('DeletePerformed?: ' + deletePerformed);

    return;
  }
  
  /* 
    Build the quote charge summary based on the charge
  */
  public static zqu__QuoteChargeSummary__c makeQuoteChargeSummary(zqu.zCharge charge, String quoteRatePlanId, String oppId){
    zqu__QuoteChargeSummary__c output = new zqu__QuoteChargeSummary__c();
    output.Name = charge.Name;
    output.zqu__QuoteRatePlan__c = quoteRatePlanId;
    output.zqu__EffectivePrice__c = charge.EFFECTIVE_PRICE == '-' ? null : Decimal.valueOf(charge.EFFECTIVE_PRICE);
    output.zqu__TotalPrice__c = charge.Total == '-' ? null : -Decimal.valueOf(charge.TOTAL);
    output.zqu__Discount__c = charge.Discount == '-' ? null : Decimal.valueOf(charge.DISCOUNT);
    output.zqu__Quantity__c = charge.QUANTITY == '-' ? null : Decimal.valueOf(charge.QUANTITY);
    if(charge.Model == 'Flat Fee Pricing'){
      output.zqu__Quantity__c = -1; 
    }
    output.zqu__Model__c = charge.MODEL;
    output.zqu__Opportunity__c = oppId;
    output.zqu__Period__c = charge.PERIOD == '-' ? null : charge.PERIOD;
    output.zqu__Type__c = charge.CHARGE_TYPE;
    output.zqu__UOM__c = charge.UNIT_OF_MEASURE;
    output.zqu__ListTotal__c = charge.LIST_TOTAL == '-' ? null : -Decimal.valueOf(charge.LIST_TOTAL);
    output.zqu__ListPrice__c = charge.LIST_PRICE == '-' ? null : Decimal.valueOf(charge.LIST_PRICE);
    output.zqu__TCV__c = charge.TOTAL == '-' ? null : -Decimal.valueOf(charge.TOTAL);
    output.zqu__MRR__c = 0;
    output.CustomChargeSummary__c = true;

    return output;
  }

  public static Date getEarliestStartDate(zqu__Quote__c quote) {
  	
  	Date EarliestDate = Date.Today();
  	
  	system.debug('Earliest Date 1: ' + earliestDate);

    if (quote.zqu__SubscriptionType__c == 'Amend Subscription' && quote.zqu__Status__c == 'New') {

      List < zqu__QuoteAmendment__c > quoteAmendments = new List < zqu__QuoteAmendment__c > ();

      quoteAmendments = [Select Id, zqu__TotalAmount__c, zqu__TermStartDate__c from zqu__QuoteAmendment__c where zqu__Quote__c = : quote.Id AND zqu__Type__c = 'RemoveProduct'];

      List < zqu__QuoteRatePlan__c > quoteRatePlans = new List < zqu__QuoteRatePlan__c > ();

      quoteRatePlans = [Select Id, zqu__AmendmentType__c, zqu__QuoteProductName__c, zqu__SubscriptionRatePlanZuoraId__c from zqu__QuoteRatePlan__c where zqu__Quote__c = : quote.Id];

      List < zqu__QuoteRatePlanCharge__c > quoteRatePlanCharges = new List < zqu__QuoteRatePlanCharge__c > ();

      quoteRatePlanCharges = [Select Id, zqu__QuoteRatePlan__c from zqu__QuoteRatePlanCharge__c where zqu__QuoteRatePlan__r.zqu__Quote__c = : quote.Id AND zqu__ChargeType__c = 'One-Time'];

      Set < Id > ratePlanswithOneTimeCharges = new Set < Id > ();

      for (zqu__QuoteRatePlanCharge__c qrpc: quoteRatePlanCharges) {
        ratePlanswithOneTimeCharges.add(qrpc.zqu__QuoteRatePlan__c);
      }

      System.Debug('Map: ' + ratePlanswithOneTimeCharges);

      Set < String > Products = new Set < String > ();
      //public static Set < String > ProductsWithFlag = new Set < String > ();
      List < String > RatePlanIds = new List < String > ();
      List < zqu__ZProduct__c > ProductObjectsWithFlag = new List < zqu__ZProduct__c > ();
      List < Zuora__SubscriptionProductCharge__c > SubProdAndCharges = new List < Zuora__SubscriptionProductCharge__c > ();
      Map < String, Set < String >> ProductMap = new Map < String, Set < String >>();
      

      if (quoteRatePlans.size() > 0) {
        for (zqu__QuoteRatePlan__c qrp: quoteRatePlans) {

          if (qrp.zqu__AmendmentType__c == 'NewProduct' && ratePlanswithOneTimeCharges.contains(qrp.Id)) {
            if (ProductMap.get(qrp.zqu__QuoteProductName__c) == null) {
              ProductMap.put(qrp.zqu__QuoteProductName__c, new Set < String > {
                'NewProduct'
              });
            }
            else {
              (ProductMap.get(qrp.zqu__QuoteProductName__c)).add('NewProduct');
            }
          }

          if (qrp.zqu__AmendmentType__c == 'RemoveProduct') {
            RatePlanIds.add(qrp.zqu__SubscriptionRatePlanZuoraId__c);
            if (ProductMap.get(qrp.zqu__QuoteProductName__c) == null) {
              ProductMap.put(qrp.zqu__QuoteProductName__c, new Set < String > {
                'RemoveProduct'
              });
            }
            else {
              (ProductMap.get(qrp.zqu__QuoteProductName__c)).add('RemoveProduct');
            }
          }

        }

        for (String key: ProductMap.keySet()) {
          if (ProductMap.get(key).contains('NewProduct') && ProductMap.get(key).contains('RemoveProduct')) {
            Products.add(key);
          }
        }

		system.debug('Earliest Date 2: ' + earliestDate);

        System.debug('Products: ' + Products);

        ProductObjectsWithFlag = [Select Id, Name, ActivationCredit__c from zqu__ZProduct__c where Name IN: Products AND ActivationCredit__c = 'True'];

        if (ProductObjectsWithFlag.size() > 0) {

          for (zqu__ZProduct__c P: ProductObjectsWithFlag) {
            ProductsWithFlag.add(P.Name);
          }

          SubProdAndCharges = [Select Id, Zuora__EffectiveStartDate__c, Zuora__ProductName__c from Zuora__SubscriptionProductCharge__c where Zuora__RatePlanId__c IN: RatePlanIds AND Zuora__ProductName__c IN: ProductsWithFlag];

			system.debug('Earliest Date 3: ' + earliestDate);

		  if(SubProdAndCharges.size() == 0)
		  {
		  	 EarliestDate = null;
		  }
		  else{

          for (Zuora__SubscriptionProductCharge__c spc: SubProdAndCharges) {
            if (EarliestDate == null) {
              EarliestDate = spc.Zuora__EffectiveStartDate__c;
            }
            else {
              if (spc.Zuora__EffectiveStartDate__c < EarliestDate) {
                EarliestDate = spc.Zuora__EffectiveStartDate__c;
              }
            }

          }

          System.Debug('EarliestDate: ' + EarliestDate);

          System.Debug('StartDate: ' + quote.zqu__StartDate__c);

          //ChargeGroupsHelper.deleteExistingCredits(quote.Id);

		system.debug('Earliest Date 4: ' + earliestDate);
          
        	}
        
        }



      }
        if(earliestDate == null)
        {
        	//appendMessage(ApexPages.Severity.ERROR, 'Error occured, Zuora Subscription Data Needs to be Synchronized');    	
        }
        
        system.debug('Earliest Date 5: ' + earliestDate);
    }
    
    	system.debug('Earliest Date 6: ' + earliestDate);
    
    	return earliestDate;
  }

  private static List < zqu.zChargeGroup > makeQuoteCharge(Decimal Total, String QuoteId) {

    List < zqu.zChargeGroup > chargeGroups = new List < zqu.zChargeGroup > ();

    List < String > ratePlanList = new List < String > ();

    ActivationCreditSettings__c avalara = ActivationCreditSettings__c.getInstance(UserInfo.getOrganizationId());
    if (Test.isRunningtest()) {
      zqu__ProductRatePlan__c testRatePlan = [Select Id from zqu__ProductRatePlan__c Limit 1];
      ratePlanList.add(testRatePlan.Id);

    }
    else {
      ratePlanList.add(avalara.ActivationCreditRatePlanId__c);
    }

    chargeGroups = zqu.zQuoteUtil.getChargeGroups(QuoteId, ratePlanList);

    List < zqu.zCharge > ListofCs = new List < zqu.zCharge > ();

    //chargeGroups[0].zcharges[0].total = String.valueOf(Total);
    if (chargeGroups.size() != 0) {
      ListofCs = chargeGroups[0].zcharges;
    }

    Total = -Total;

    if (ListofCs.size() != 0) {
      ListofCs[0].EFFECTIVE_PRICE = String.valueOf(Total);
    }

    if (chargeGroups.size() != 0) {

      for (zqu.zChargeGroup cG: chargeGroups) {
        zqu.zQuoteUtil.calculateChargesOnEffectivePriceChange(cG.zCharges);
      }

    }

    //hasRun = true;
    //if (chargeGroups.size() != 0) {
      //zqu.zQuoteUtil.addChargeGroups(chargeGroups);
    //}

    System.Debug('End of MakeQuoteCharge');

    return chargeGroups;

  }


}