@isTest
public class TestFactory {
    static {
        TestCreateMetadata tcm=new TestCreateMetadata();
    }
  public static final Date DEFAULT_EFFECTIVE_START_DATE = Date.today(); 
  public static final Date DEFAULT_EFFECTIVE_END_DATE = Date.today().addYears(1);
  public static final String DEFAULT_CURRENCY = 'USD';

  public static final String MODEL_F = 'Flat Fee Pricing';
  public static final String MODEL_P = 'Per Unit Pricing';
  public static final String MODEL_V = 'Volume Pricing';
  public static final String MODEL_T = 'Tiered Pricing';
  public static final String MODEL_O = 'Overage Pricing';
  public static final String MODEL_TO = 'Tiered with Overage Pricing';
  public static final String MODEL_FA = 'Discount-Fixed Amount';
  public static final String MODEL_FP = 'Discount-Percentage';

  public static zqu.zQuoteUtil.zBillingResult testZBillingResult{
    get;
    set;
  }

  public static List<Rule__c> createRules(List<zqu__ProductRatePlan__c> prpList){
    List<Rule__c> rules = new List<Rule__c>();
    for(integer i = 0; i < prpList.size()-1; i++){
      Rule__c r = new Rule__c();
      r.type__c = Math.mod(i,2) == 0 ? 'Inclusion' : 'Exclusion';
      r.StartDate__c  = DEFAULT_EFFECTIVE_START_DATE;
      r.EndDate__c = DEFAULT_EFFECTIVE_END_DATE;
      r.BaseProductName__c = getProductName(prpList[i].zqu__zProduct__c);
      r.TargetProductName__c = getProductName(prpList[i+1].zqu__zProduct__c);
      r.BaseProductRatePlanName__c = prpList[i].name;
      r.TargetProductRatePlanName__c = prpList[i+1].name;
      r.BaseProductRatePlan__c = prpList[i].Id;
      r.TargetProductRatePlan__c = prpList[i+1].Id;
      rules.add(r);
    }
    insert rules;
    return rules;
  }

  public static Connector__c makeConnector(){
    Connector__c con = new Connector__c(
      Name = 'Test Connector', 
      Pricing_Schedule__c = 'ERP1',
      ProductName__c = getNameFromConnectorPickList()
    );
    insert con;
    return con;
  }
  private static String getProductName(string productId){
    List<zqu__zProduct__c> product = [SELECT Name
                                      FROM zqu__zProduct__c
                                      WHERE id = :productId];
    return product[0].Name;
  }
  /**
   * Insert a test account in the db
   */
  public static Account makeAccount() {

    Account testAcc = new Account();

    testAcc.Name = 'my test account';
    testAcc.BillingState = 'CA';
    testAcc.ShippingState = 'CA';
    testAcc.Type__c = 'Customer';

    insert testAcc;
    return testAcc;
  }
  /**
   * Insert a test contact associated with an account in the db
   */
  public static Contact makeContact(Account testAcc) {

    Contact testContact = new Contact();

    testContact.FirstName = 'firstname';
    testContact.LastName = 'lastname';
    testContact.Email = 'email@mail.me';

    testContact.AccountId = testAcc.Id;

    insert testContact;
    return testContact;
  }
  /**
   * Insert a test opportunity associated with an account
   */
  public static Opportunity makeOpportunity(Account testAcc) {

    Opportunity testOpp = new Opportunity();

    testOpp.Name = 'my test opportunity';
    testOpp.StageName = 'Opportunity Identified';
    testOpp.ForecastCategoryName = 'Closed';
    testOpp.CloseDate = System.today();
    testOpp.Interest__c = true;
    testOpp.Budget__c = true;

    testOpp.AccountId = testAcc.Id;

    insert testOpp;
    return testOpp;
  }
  /**
   * Insert a test quote based on an opportunity in the db
   */
  public static zqu__Quote__c makeQuote(Opportunity testOpp) {

    zqu__Quote__c testQuote = new zqu__Quote__c();

    testQuote.Name = 'my test quote';

    testQuote.zqu__Opportunity__c = testOpp.Id;
    testQuote.zqu__Currency__c = 'USD';
    testQuote.zqu__Hidden_Subscription_Name__c = 'Boo';
    testQuote.zqu__Status__c = 'New';
    testQuote.zqu__SubscriptionTermStartDate__c = Date.today();
    testQuote.zqu__InitialTerm__c = 12;
    testQuote.zqu__SubscriptionTermEndDate__c = Date.today().addMonths(12);

    insert testQuote;
    return testQuote;
  }

  public static zqu__Quote__c makeAmendmentQuote(Opportunity testOpp) {

    zqu__Quote__c testQuote = new zqu__Quote__c();

    testQuote.Name = 'my test quote';

    testQuote.zqu__Opportunity__c = testOpp.Id;
    testQuote.zqu__Currency__c = 'USD';
    testQuote.zqu__SubscriptionType__c = 'Amend Subscription';

    insert testQuote;
    return testQuote;
  }
  private static String getNameFromConnectorPickList(){
    List < String > output = new List < String > ();
    // Get the object type of the SObject.
    Schema.sObjectType objType = Connector__c.getSObjectType();
    // Describe the SObject using its object type.
    Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
    // Get a map of fields for the SObject
    Map < String, Schema.SObjectField > fieldMap = objDescribe.fields.getMap();
    // Get the list of picklist values for this field.
    List < Schema.PicklistEntry > values = fieldMap.get('ProductName__c').getDescribe().getPickListValues();
    // Add these values to the selectoption list.
    for (Schema.PicklistEntry a: values) {
      output.add(a.getValue());
    }
    return output[0];
  
  }
  private static ID preparedProductID {
    get;
    set;
  }
  private static List < String > rateplannames = new List < String > {
    'Plan for Flat Fee charges',
    'Plan for Per Unit charges',
    'Plan for Volume charges',
    'Plan for Overage charges',
    'Plan for Tiered charges',
    'Plan for Discount-Fixed Amount charges',
    'Plan for Discount-Percentage charges'
  };
  private static Map<String, List<List<String>>> PLAN_CHARGE_MAPPING_OLD
      = new  Map<String, List<List<String>>> {
    'Plan for Flat Fee charges' => new List < List < String >> {
      new List < String > {
        'Flat Fee Pricing', 'One-Time'
      }, new List < String > {
        'Flat Fee Pricing', 'Recurring'
      }, new List < String > {
        'Flat Fee Pricing', 'Usage'
      }
    }, 'Plan for Per Unit charges' => new List < List < String >> {
      new List < String > {
        'Per Unit Pricing', 'One-Time'
      }, new List < String > {
        'Per Unit Pricing', 'Recurring'
      }, new List < String > {
        'Per Unit Pricing', 'Usage'
      }
    }, 'Plan for Volume charges' => new List < List < String >> {
      new List < String > {
        'Volume Pricing', 'One-Time'
      }, new List < String > {
        'Volume Pricing', 'Recurring'
      }, new List < String > {
        'Volume Pricing', 'Usage'
      }
    }, 'Plan for Overage charges' => new List < List < String >> {
      new List < String > {
        'Overage Pricing', 'Usage'
      }, new List < String > {
        'Tiered with Overage Pricing', 'Usage'
      }
    }, 'Plan for Tiered charges' => new List < List < String >> {
      new List < String > {
        'Tiered Pricing', 'One-Time'
      }, new List < String > {
        'Tiered Pricing', 'Recurring'
      }, new List < String > {
        'Tiered Pricing', 'Usage'
      }
    }, 'Plan for Discount-Fixed Amount charges' => new List < List < String >> {
      new List < String > {
        'Discount-Fixed Amount', 'Recurring'
      }, new List < String > {
        'Per Unit Pricing', 'One-Time'
      }, new List < String > {
        'Per Unit Pricing', 'Recurring'
      }
    }, 'Plan for Discount-Percentage charges' => new List < List < String >> {
      new List < String > {
        'Discount-Percentage', 'Recurring'
      }, new List < String > {
        'Per Unit Pricing', 'One-Time'
      }, new List < String > {
        'Per Unit Pricing', 'Recurring'
      }
    }
  };

  private static Map<String, List<List<String>>> PLAN_CHARGE_MAPPING
      = new  Map<String, List<List<String>>> {
    'Plan for Flat Fee charges' => new List < List < String >> {
      new List < String > {
        'Flat Fee Pricing', 'One-Time'
      }, new List < String > {
        'Flat Fee Pricing', 'Recurring'
      }
    }, 'Plan for Per Unit charges' => new List < List < String >> {
      new List < String > {
        'Per Unit Pricing', 'One-Time'
      }, new List < String > {
        'Per Unit Pricing', 'Recurring'
      }
    }, 'Plan for Volume charges' => new List < List < String >> {
      new List < String > {
        'Volume Pricing', 'One-Time'
      }, new List < String > {
        'Volume Pricing', 'Recurring'
      }
    }, 'Plan for Overage charges' => new List < List < String >> {
      new List < String > {
        'Overage Pricing', 'Usage'
      }
    }, 'Plan for Tiered charges' => new List < List < String >> {
      new List < String > {
        'Tiered Pricing', 'One-Time'
      }, new List < String > {
        'Tiered Pricing', 'Recurring'
      }
    }, 'Plan for Discount-Fixed Amount charges' => new List < List < String >> {
      new List < String > {
        'Discount-Fixed Amount', 'Recurring'
      }, new List < String > {
        'Per Unit Pricing', 'One-Time'
      }, new List < String > {
        'Per Unit Pricing', 'Recurring'
      }
    }, 'Plan for Discount-Percentage charges' => new List < List < String >> {
      new List < String > {
        'Discount-Percentage', 'Recurring'
      }, new List < String > {
        'Per Unit Pricing', 'One-Time'
      }, new List < String > {
        'Per Unit Pricing', 'Recurring'
      }
    }
  };

  private static Map < String, List < Decimal >> TIER_MAPPING = new Map < String, List < Decimal >> {
    'One-Time_Flat Fee Pricing' => new List < Decimal > {
      1000
    }, 'One-Time_Per Unit Pricing' => new List < Decimal > {
      1000
    }, 'One-Time_Volume Pricing' => new List < Decimal > {
      0, 0, 500, 0, 800, 1, 1000, 0
    }, 'One-Time_Tiered Pricing' => new List < Decimal > {
      500, 0, 400, 1, 200, 0
    }, 'Recurring_Flat Fee Pricing' => new List < Decimal > {
      1500
    }, 'Recurring_Per Unit Pricing' => new List < Decimal > {
      1000
    }, 'Recurring_Volume Pricing' => new List < Decimal > {
      0, 1, 800, 1, 1200, 0, 1500, 1
    }, 'Recurring_Tiered Pricing' => new List < Decimal > {
      800, 0, 400, 0, 300, 1
    }, 'Usage_Flat Fee Pricing' => new List < Decimal > {
      0
    }, 'Usage_Per Unit Pricing' => new List < Decimal > {
      0
    }, 'Usage_Volume Pricing' => new List < Decimal > {
    }, 'Usage_Tiered Pricing' => new List < Decimal > {
    }, 'Usage_Overage Pricing' => new List < Decimal > {
      0
    }, 'Usage_Tiered with Overage Pricing' => new List < Decimal > {
      8, 100, 200
    }, 'Recurring_Discount-Fixed Amount' => new List < Decimal > {
      598, 400, 500
    }, 'Recurring_Discount-Percentage' => new List < Decimal > {
      7
    }, '_Flat Fee Pricing' => new List < Decimal > {
      0
    }, '_Per Unit Pricing' => new List < Decimal > {
      0
    }, '_Volume Pricing' => new List < Decimal > {
      0, 0, 0, 0, 10, 0, 0, 1, 0, 1, 10, 1, 0, 0, 0, 0, 10, 0
    }, '_Tiered Pricing' => new List < Decimal > {
      0, 1, 0, 0, 10, 0, 0, 1, 0, 1, 10, 1, 0, 0, 0, 0, 10, 0
    }
  };

  public static zqu__ZProduct__c prepareProductCatalog(boolean setProductNameAsConnector) {
    List < zqu__ZProduct__c > listOFzprod = new List < zqu__ZProduct__c > ();
    zqu__ZProduct__c zprod = null;
    try {
      // Following cases will return list size as 0 and thus new product catalog will be created.
      // 1. null == preparedProductID 
      // 2. preparedProductID is expired 
      listOFzprod = [
        SELECT
          name,
          zqu__effectivestartdate__c,
          zqu__effectiveenddate__c,
          zqu__sku__c,
          zqu__zuoraid__c,
          zqu__deleted__c
        FROM
          zqu__ZProduct__c
        WHERE
          id = : preparedProductID
      ];
    } catch (Exception e) {
      System.assert(false, 'Exception occured while querying ZProduct__c. '
          +'Exception Details: ' + e.getMessage());
    }
    if (listOFzprod.size() == 0) {
      //generate ProductCatalog in Salesforce
      zprod = new zqu__ZProduct__c();
      zprod.Name = setProductNameAsConnector ? getNameFromConnectorPickList() : 'Test Product';
      zprod.zqu__EffectiveStartDate__c = DEFAULT_EFFECTIVE_START_DATE;
      zprod.zqu__EffectiveEndDate__c = DEFAULT_EFFECTIVE_END_DATE;
      zprod.zqu__SKU__c = 'testingsku0001';
      zprod.zqu__ZuoraId__c = 'zuoraid0000000001';
      zprod.zqu__Deleted__c = false;
      try {
        insert zprod;
      } catch (Exception e) {
        System.assert(false, 'ZQTestDataSetup.prepareProductCatalog: '
            +'Exception occured while inserting ZProduct__c. Exception Details: '
            + e.getMessage());
      }
      System.assert(null != zprod.Id, 'Product record preparation failed '
          +'when prepare for testing product catalog.');

      preparedProductID = zprod.Id;

      List < zqu__ProductRatePlan__c > p_rateplans = new List < zqu__ProductRatePlan__c > ();
      Integer rpzuoraid = 1;
      for (String rpname: rateplannames) {
        zqu__ProductRatePlan__c p_rateplan = new zqu__ProductRatePlan__c();
        p_rateplan.Name = rpname;
        p_rateplan.zqu__EffectiveStartDate__c = DEFAULT_EFFECTIVE_START_DATE;
        p_rateplan.zqu__EffectiveEndDate__c = DEFAULT_EFFECTIVE_END_DATE;
        p_rateplan.zqu__ZProduct__r = zprod;
        p_rateplan.zqu__ZProduct__c = zprod.Id;
        p_rateplan.zqu__ZuoraId__c = String.valueOf(rpzuoraid);
        p_rateplan.zqu__Deleted__c = false;
        p_rateplan.Display__c = 'true';
	    p_rateplan.PriceSchedule__c = 'test';
	    p_rateplan.TransactionTier__c = '100T';
	    p_rateplan.ServiceLevel__c = 'Basic';
    	p_rateplan.AddOnConnector__c = 'TRUE';
        p_rateplan.PriceSchedule__c = 'ERP1';
        p_rateplans.add(p_rateplan);
        rpzuoraid++;
      }

      try {
        insert p_rateplans;
      } catch (Exception e) {
        System.assert(false, 'ZQTestDataSetup.prepareProductCatalog: '
            +'Exception occured while inserting ProductRatePlan__c '
            + 'records. Exception Details: ' + e.getMessage());
      }

      System.assert(p_rateplans.size() > 0, 'Product Rateplan records '
          +'prepare failed when prepare for testing product catalog.');

      List < zqu__ProductRatePlanCharge__c > p_all_charges =
          new List < zqu__ProductRatePlanCharge__c > ();
      for (zqu__ProductRatePlan__c p_rateplan: p_rateplans) {
        List < zqu__ProductRatePlanCharge__c > rp_charges = getProductRatePlanCharges(p_rateplan);
        p_all_charges.addAll(rp_charges);
      }
      try {
        insert p_all_charges;
      } catch (Exception e) {
        System.assert(false, 'ZQTestDataSetup.prepareProductCatalog: '
            + 'Exception occured while inserting ProductRatePlanCharge__c '
            + 'records. Exception Details: ' + e.getMessage());
      }
      System.assert(p_all_charges.size() > 0, 'Product Rateplan charge '
          +'records prepare failed when prepare for testing product catalog.');

      List < zqu__ProductRatePlanChargeTier__c > p_all_tiers =
          new List < zqu__ProductRatePlanChargeTier__c > ();
      for (zqu__ProductRatePlanCharge__c charge: p_all_charges) {
        List < zqu__ProductRatePlanChargeTier__c > p_chargetiers =
            getProductRatePlanChargeTiers(charge);
        p_all_tiers.addAll(p_chargetiers);
      }
      try {
        insert p_all_tiers;
      } catch (Exception e) {
        System.assert(false, 'ZQTestDataSetup.prepareProductCatalog: '
            + 'Exception occured while inserting ProductRatePlanChargeTier__c '
            + 'records. Exception Details: ' + e.getMessage());
      }
      System.assert(p_all_tiers.size() > 0, 'Product Rateplan charge tier '
          +'records prepare failed when prepare for testing product catalog.');
    }
    return zprod;
  }

  private static List < zqu__ProductRatePlanCharge__c > getProductRatePlanCharges(zqu__ProductRatePlan__c rp) {

    List < List < String >> chargedefines = PLAN_CHARGE_MAPPING.get(rp.Name);
    List < zqu__ProductRatePlanCharge__c > charges = new List < zqu__ProductRatePlanCharge__c > ();
    Integer zuoraid = Integer.valueOf(rp.zqu__ZuoraId__c) * 1000;
    for (List < String > chargedefine: chargedefines) {
      zqu__ProductRatePlanCharge__c p_charge = new zqu__ProductRatePlanCharge__c();
      p_charge.Name = chargedefine.get(1) + ' ' + chargedefine.get(0);
      p_charge.zqu__Model__c = chargedefine.get(0);
      p_charge.zqu__Type__c = chargedefine.get(1);
      p_charge.zqu__UOM__c = 'UOM tesing';
      p_charge.zqu__DefaultQuantity__c = 1;
      p_charge.zqu__MinQuantity__c = 0;
      p_charge.zqu__MaxQuantity__c = 500;
      p_charge.zqu__RecurringPeriod__c = 'Monthly';
      p_charge.zqu__ZuoraId__c = String.valueOf(zuoraid);
      p_charge.zqu__ProductRatePlan__c = rp.Id;
      p_charge.zqu__ProductRatePlan__r = rp;
      p_charge.zqu__Deleted__c = false;
      if (p_charge.zqu__Model__c == 'Discount-Fixed Amount' || p_charge.zqu__Model__c == 'Discount-Percentage') {
        p_charge.zqu__Discount_Apply_Type__c = 3;
        p_charge.zqu__Upto_How_Many_Periods__c = 5;
        p_charge.zqu__Discount_Level__c = 'RatePlan';
      }
      zuoraid++;
      charges.add(p_charge);
    }
    return charges;
  }

  private static List < zqu__ProductRatePlanChargeTier__c > getProductRatePlanChargeTiers(zqu__ProductRatePlanCharge__c charge) {
    List < Decimal > tierprices = TIER_MAPPING.get(charge.zqu__Type__c + '_' + charge.zqu__Model__c);
    List < zqu__ProductRatePlanChargeTier__c > p_tiers = new List < zqu__ProductRatePlanChargeTier__c > ();
    Integer tiernumber = 0;
    if (MODEL_V.equals(charge.zqu__Model__c) || MODEL_T.equals(charge.zqu__Model__c)) {
      for (Integer i = 0; i < tierprices.size(); i++) {
        zqu__ProductRatePlanChargeTier__c p_tier = new zqu__ProductRatePlanChargeTier__c();
        p_tier.zqu__Price__c = tierprices[i];
        if (0 == tierprices[i + 1]) {
          //changed this
          //p_tier.zqu__PriceFormat__c = MODEL_F;
          p_tier.zqu__PriceFormat__c = 'Per Unit';
        } else {
          //changed this
          p_tier.zqu__PriceFormat__c = 'Flat Fee';
        }
        p_tier.zqu__Tier__c = tiernumber + 1;
        p_tier.zqu__Currency__c = DEFAULT_CURRENCY;
        if (0 == tiernumber) {
          p_tier.zqu__StartingUnit__c = 0;
        } else {
          p_tier.zqu__StartingUnit__c = 100 * tiernumber + 1;
        }
        if (tiernumber <= tierprices.size() - 1) {
          p_tier.zqu__EndingUnit__c = 100 * (tiernumber + 1);
        }
        p_tier.zqu__ProductRatePlanCharge__r = charge;
        p_tier.zqu__ProductRatePlanCharge__c = charge.Id;
        p_tier.zqu__Deleted__c = false;
        p_tiers.add(p_tier);
        i++;
        tiernumber++;
      }
    } else {
      for (Decimal tierprice: tierprices) {
        zqu__ProductRatePlanChargeTier__c p_tier = new zqu__ProductRatePlanChargeTier__c();
        p_tier.zqu__Price__c = tierprice;
        p_tier.zqu__Tier__c = tiernumber + 1;
        p_tier.zqu__Currency__c = DEFAULT_CURRENCY;
        p_tier.zqu__StartingUnit__c = 100 * tiernumber + 1;
        if (tiernumber <= tierprices.size() - 1) {
          p_tier.zqu__EndingUnit__c = 100 * (tiernumber + 1);
        }
        p_tier.zqu__ProductRatePlanCharge__r = charge;
        p_tier.zqu__ProductRatePlanCharge__c = charge.Id;
        p_tier.zqu__Deleted__c = false;
        p_tiers.add(p_tier);
      }
    }
    return p_tiers;
  }



  public static List<string> makeAvaProductCatalog(){
    zqu__zProduct__c avaProd = makeProduct();
    
    zqu__ProductRatePlan__c oneTimeRecPlan1 = makeProductRatePlan( avaProd.Id, 'Plan 1');
    zqu__ProductRatePlan__c oneTimeRecPlan2 = makeProductRatePlan( avaProd.Id, 'Plan 2');
    zqu__ProductRatePlan__c usagePlan1 = makeProductRatePlan( avaProd.Id, 'Plan 1 ( Usage )');
    zqu__ProductRatePlan__c usagePlan2 = makeProductRatePlan( avaProd.Id, 'Plan 2 ( Usage )');

    zqu__ProductRatePlanCharge__c oneTimeCharge1 = makeProductRatePlanCharge( oneTimeRecPlan1.Id, 'One-Time', 'Flat Fee Pricing');
    zqu__ProductRatePlanCharge__c oneTimeCharge2 = makeProductRatePlanCharge( oneTimeRecPlan2.Id, 'One-Time', 'Flat Fee Pricing');

    zqu__ProductRatePlanCharge__c recCharge1 = makeProductRatePlanCharge( oneTimeRecPlan1.Id, 'Recurring', 'Flat Fee Pricing');
    zqu__ProductRatePlanCharge__c recCharge2 = makeProductRatePlanCharge( oneTimeRecPlan2.Id, 'Recurring', 'Flat Fee Pricing');

    zqu__ProductRatePlanCharge__c usageCharge1 = makeProductRatePlanCharge( usagePlan1.Id, 'Usage', 'Per Unit Pricing');
    zqu__ProductRatePlanCharge__c usageCharge2 = makeProductRatePlanCharge( usagePlan2.Id, 'Usage', 'Per Unit Pricing');

    zqu__ProductRatePlanChargeTier__c oneTimeChargeTier1 = makeProductRatePlanChargeTier(oneTimeCharge1.Id);
    zqu__ProductRatePlanChargeTier__c oneTimeChargeTier2 = makeProductRatePlanChargeTier(oneTimeCharge2.Id);

    zqu__ProductRatePlanChargeTier__c recTier1 = makeProductRatePlanChargeTier(recCharge1.Id);
    zqu__ProductRatePlanChargeTier__c recTier2 = makeProductRatePlanChargeTier(recCharge2.Id);

    zqu__ProductRatePlanChargeTier__c usageTier1 = makeProductRatePlanChargeTier(usageCharge1.Id);
    zqu__ProductRatePlanChargeTier__c usageTier2 = makeProductRatePlanChargeTier(usageCharge2.Id);


    return new List<String>{ oneTimeRecPlan1.Id, usagePlan1.Id, oneTimeRecPlan2.Id, usagePlan2.Id };
  }

  public static zqu__ZProduct__c makeProduct()
  {
    zqu__ZProduct__c testProduct = new zqu__ZProduct__c();
    testProduct.Name = 'testing';
    testProduct.zqu__SKU__c = 'testSKU';
    testProduct.zqu__ZuoraId__c = '12';
    testProduct.zqu__EffectiveStartDate__c = date.newinstance(2000, 1, 1);
    testProduct.zqu__EffectiveEndDate__c = date.newinstance(2050, 1, 1);
    testProduct.zqu__Deleted__c = false;
    
    insert testProduct;
    return testProduct;
  }

  private static integer ratePlanId = 154657;
 
  public static zqu__ProductRatePlan__c makeProductRatePlan(String zproduct, String name)
  {
    zqu__ProductRatePlan__c testrp = new zqu__ProductRatePlan__c();
    testrp.name = 'test rp';
    testrp.zqu__ZProduct__c = zproduct;
    testrp.zqu__ZuoraId__c = String.valueOf(ratePlanId);
    testrp.Display__c = 'true';
    testrp.PriceSchedule__c = 'test';
    testrp.TransactionTier__c = '100T';
    testrp.ServiceLevel__c = 'Basic';
    testrp.AddOnConnector__c = 'TRUE';
    ratePlanId++;
    testrp.zqu__Deleted__c = false;
    //set custom fields 

    //Needed for pricing queries
    testrp.zqu__EffectiveStartDate__c = Date.newInstance(2010, 1, 1);
    testrp.zqu__EffectiveEndDate__c = Date.newInstance(2020, 1, 1);
   
    insert testrp;
    return testrp;
  }

  private static integer ratePlanChargeId = 125481;

  public static zqu__ProductRatePlanCharge__c makeProductRatePlanCharge(String prp, String type, String model)
  {
    zqu__ProductRatePlanCharge__c testprpc = new zqu__ProductRatePlanCharge__c();
    testprpc.zqu__ProductRatePlan__c = prp;
    testprpc.name=type+model+ratePlanChargeId;
    testprpc.zqu__ZuoraId__c = String.valueOf(ratePlanChargeId);
    ratePlanChargeId++;
    testprpc.zqu__UOM__c = 'test UOM';
    testprpc.zqu__Type__c = type;
    testprpc.zqu__RecurringPeriod__c = 'Month';
    testprpc.zqu__PrepaymentPeriods__c = 1;
    testprpc.zqu__Model__c = model;
    testprpc.zqu__MinQuantity__c = 0;
    testprpc.zqu__MaxQuantity__c = 1000;
    testprpc.zqu__ListPrice__c = 5;
    testprpc.zqu__Description__c = 'Test charge';
    testprpc.zqu__DefaultQuantity__c = 5;
    testprpc.zqu__Discount_Apply_Type__c = 0;
    testprpc.zqu__Discount_Level__c = 'RatePlan';
    testprpc.zqu__Upto_How_Many_Periods__c = 0;
    testprpc.zqu__Deleted__c = false;
    testprpc.SubQuote__c = type == 'Usage' ? 'True' : 'False';

    insert testprpc;
    return testprpc;
  }
  private static integer tierId = 0;

  public static zqu__ProductRatePlanChargeTier__c makeProductRatePlanChargeTier(String prpc)
  {
    zqu__ProductRatePlanChargeTier__c testprpct = new zqu__ProductRatePlanChargeTier__c();

    //testprpct.Name = 'Test tier';
    testprpct.zqu__Currency__c = 'USD';
    testprpct.zqu__Deleted__c = false;
    testprpct.zqu__StartingUnit__c = 0;
    //testprpct.zqu__EndingUnit__c = 100;//Leave null to have this tier be for all quantities
    testprpct.zqu__IsOveragePrice__c = false;
    testprpct.zqu__ProductRatePlanCharge__c = prpc;
    //testprpct.zqu__ProductRatePlanChargeId__c = '123';//?
    testprpct.zqu__Tier__c = 1;
    testprpct.zqu__ZuoraId__c = String.valueOf(tierId);
    tierId++;
    testprpct.zqu__Price__c = 100;
    testprpct.zqu__PriceFormat__c = 'Per Unit';
   
    insert testprpct;
    return testprpct;
  }



}