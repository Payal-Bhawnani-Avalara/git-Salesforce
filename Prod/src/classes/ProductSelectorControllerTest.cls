@isTest
public class ProductSelectorControllerTest {
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
  static Connector__c connector{
    get;
    set;
  }

  public static List<zqu.zChargeGroup> existingChargeGroupsTest{
    get;
    set;
  }

  public static Set<String> quoteChargeCustomFields{
    get{
      if(quoteChargeCustomFields == null){
        quoteChargeCustomFields = new Set<String>{ 
                                                   'PriceSchedule__c', 
                                                   'TransactionTier__c', 
                                                   'ServiceLevel__c', 
                                                   'Display__c',
                                                   'ConnectorName__c',
                                                   'Connector__c',
                                                   'AddOnConnector__c',
                                                   'DiscountFromList__c',
                                                   'ListPrice__c'
                                                 };
      }
      return quoteChargeCustomFields;
    }
    set;
  }

  static String productRatePlanChargeSFDCID{
    get;
    set;
  }

  static void createTestData(boolean setProductNameAsConnector){
    product = TestFactory.prepareProductCatalog(setProductNameAsConnector);

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
        prp.TransactionTier__c = '123';
        prp.Display__c = 'True';
        prp.ServiceLevel__c = 'ABC';
        prp.AddOnConnector__c = 'False';
        prp.PriceSchedule__c = 'Basic';
    }
    update prpList;

    System.AssertEquals( 7, prpList.size() );

    List<Rule__c> ruleList = TestFactory.createRules( prpList );
    System.AssertEquals( 6, ruleList.size() );

    Account acc = TestFactory.makeAccount();
    Contact con = TestFactory.makeContact( acc );
    Opportunity opp = TestFactory.makeOpportunity( acc );
    quote = TestFactory.makeQuote( opp );
    //add a charge group to the quote
    zqu.GlobalCustomFieldDefinition.CHARGE_FIELDS = quoteChargeCustomFields;
    zqu.zChargeGroup chargeOnQuote = zqu.zQuoteUtil.getChargeGroup(quote.Id, prpList[0].Id);
    zqu.zQuoteUtil.addChargeGroup(chargeOnQuote);

    existingChargeGroupsTest = zqu.zQuoteUtil.getChargeGroups(quote.Id, prpIdList);
    productRatePlanChargeSFDCID = existingChargeGroupsTest[0].zCharges[0].PRODUCT_RATE_PLAN_CHARGE_SFDC_ID;
    
    connector = TestFactory.makeConnector();

    zqu__ZUnitOfMeasure__c chargeUOM = new zqu__ZUnitOfMeasure__c();
    chargeUOM.zqu__Uom_precision__c = 0;
    chargeUOM.zqu__Uom_rounding_mode__c = 'Up';
    chargeUOM.zqu__Active__c = true;
    chargeUOM.name = existingChargeGroupsTest[0].zCharges[0].UNIT_OF_MEASURE;
    chargeUOM.zqu__ZuoraId__c = '1234';
    insert chargeUOM;

  }
  
  static testMethod void productSelectorRemoveChargeGroup(){
    createTestData(false);
    //load the page
    ApexPages.StandardController sc = new ApexPages.StandardController(quote);
    ProductSelectorController psc = new ProductSelectorController(sc);
    Test.startTest();
    //Make sure there are existing charge groups loaded
    System.AssertNotEquals(0,psc.existingChargeGroupHolders.size());

    psc.selectedChargeGroupId = '0';
    psc.removeChargeGroup();
    
    Test.stopTest();
    List<zqu.zChargeGroup> chargeGroups = zqu.zQuoteUtil.getChargeGroups(quote.Id);
    //System.AssertEquals(0, chargeGroups.size());
  }


  static testMethod void productSelectorConnector() {
    createTestData(true);

    //load the page
    ApexPages.StandardController sc = new ApexPages.StandardController(quote);
    ProductSelectorController psc = new ProductSelectorController(sc);
    //pick a product
    psc.selectedProductId = product.Id;
    psc.selectedProductName = product.Name;
    psc.pickProduct();
      
    ///connector
    System.Debug('connector.Id: ' + connector.Id);
    System.Debug('connector.Name: ' + connector.Name);
    System.Debug('connector.ProductName__c: ' + connector.ProductName__c);
    System.Debug('connector.Pricing_Schedule__c: ' + connector.Pricing_Schedule__c);
      
    psc.selectedConnector = connector.Id;
      
    psc.pickConnector();
    //pick service level
    psc.selectedServiceLevel = psc.serviceLevelValues[0].getLabel();
    psc.pickServiceLevel();
    //pick rate plan
    psc.selectedproductRatePlanMap.put(prpList[0].Id, true);
    psc.selectedproductRatePlan = prpList[0].Id;
    psc.pickRatePlan();
    //make sure there are charges added
    System.AssertNotEquals(0, psc.cghList.size());
    //edit charges
    psc.selectedChargeGroupId = '1';

    psc.effectivePriceChange();
    psc.quantityChange();
    psc.discountChange();
    //validate / save
    psc.validateQuote();
    //there should be errors due to the rules
    System.AssertNotEquals(0, ApexPages.getMessages().size());
    psc.validateAndSaveQuote();
    //other actions
    psc.productRatePlanSearchText = '';
    psc.doSearch();
    psc.doClearSearch();
    psc.next();
    psc.previous();
    integer setSize = psc.selectedproductRatePlanSet.size();
    psc.selectedproductRatePlanMap.put(prpList[0].Id, false);
    psc.doRemoveRatePlan();
    //make sure it was removed from the set, ie the size < setSize
    System.AssertEquals(setSize-1, psc.selectedproductRatePlanSet.size());
    psc.saveAndClose();
    psc.saveAndNew();
    psc.pickTransactionTier();
    psc.pickAddOnConnector();
    //vf variables
    ApexPages.StandardSetController productRatePlanSet = psc.productRatePlanSet;
    Integer productRatePlanSetPageSize = psc.productRatePlanSetPageSize;
    Integer productRatePlanSetPageNumber = psc.productRatePlanSetPageNumber;
    Integer productRatePlanSetMaxPage = psc.productRatePlanSetMaxPage;
    Integer productRatePlanSetResultSize = psc.productRatePlanSetResultSize;
    Boolean productRatePlanSetHasNext = psc.productRatePlanSetHasNext;
    Boolean productRatePlanSetHasPrevious = psc.productRatePlanSetHasPrevious;
    List < zqu__productRatePlan__c > productRatePlanSetRecords = psc.productRatePlanSetRecords;
    List < zqu__productRatePlan__c > selectedproductRatePlanList = psc.selectedproductRatePlanList;
    boolean productSelected = psc.productSelected;
    boolean showExistingCharges = psc.showExistingCharges;
    boolean productRatePlanSelected = psc.productRatePlanSelected;
    boolean showRatePlans = psc.showRatePlans;
    List < zqu.zChargeGroup > ratePlanChargeGroups = psc.ratePlanChargeGroups;
    List < SelectOption > priceScheduleValues = psc.priceScheduleValues;
    List < SelectOption > availableConnectorValues = psc.availableConnectorValues;
    boolean showConnectors = psc.showConnectors;
    boolean showPriceSchedules = psc.showPriceSchedules;
    List < ProductSelectorController.ChargeGroupHolder > existingChargeGroupHolders = psc.existingChargeGroupHolders;
    boolean showServiceLevel = psc.showServiceLevel;
    List<SelectOption> addOnConnectorValues = psc.addOnConnectorValues;
    List<SelectOption> tierPriceFormats = psc.tierPriceFormats;
  }
  
  static testMethod void productSelectorNonConnector() {
    createTestData(false);

    //load the page
    ApexPages.StandardController sc = new ApexPages.StandardController(quote);
    ProductSelectorController psc = new ProductSelectorController(sc);
    //pick a product
    psc.selectedProductId = product.Id;
    psc.selectedProductName = product.Name;
    psc.pickProduct();
    ///non connector
    //pick price schedule
    psc.selectedPriceSchedule = psc.priceScheduleValues[0].getLabel();
    psc.pickPriceSchedule();
    //pick service level
    psc.selectedServiceLevel = psc.serviceLevelValues[0].getLabel();
    psc.pickServiceLevel();
    //pick rate plan
    psc.selectedproductRatePlanMap.put(prpList[0].Id, true);
    psc.selectedproductRatePlan = prpList[0].Id;
    psc.pickRatePlan();
    //edit charges
    psc.selectedChargeGroupId = '1';
    psc.effectivePriceChange();
    psc.quantityChange();
    psc.discountChange();
    //edit tiers
    psc.selectedTierChargeGroupId = '1';
    //pick the charge
    psc.pickCharge();
    //edit the charge
    psc.selectedTier = '1';
    psc.selectedChargeProductId = productRatePlanChargeSFDCID;

    integer tiersBefore = 0;
    integer tiersAfter = 0;
    ProductSelectorController.ChargeGroupHolder cg = psc.chargeGroupHolderMap.get(Integer.valueOf(psc.selectedTierChargeGroupId)); 
    for(zqu.zCharge charge : cg.allCharges){
      if(charge.PRODUCT_RATE_PLAN_CHARGE_SFDC_ID == productRatePlanChargeSFDCID){
        tiersBefore = charge.chargeTiersObjects.size();
      }
    }    
    psc.addTier();
    //make sure tier # went up
    cg = psc.chargeGroupHolderMap.get(Integer.valueOf(psc.selectedTierChargeGroupId)); 
    for(zqu.zCharge charge : cg.allCharges){
      if(charge.PRODUCT_RATE_PLAN_CHARGE_SFDC_ID == productRatePlanChargeSFDCID){
        tiersAfter = charge.chargeTiersObjects.size();
      }
    }
    //System.assertEquals(tiersAfter > tiersBefore, true);
    psc.removeTier();
    psc.changeTierEndingUnit();
    psc.changeTierDiscount();
    psc.changeTierPriceFormat();
    psc.changeTierEffectivePrice();
    //validate / save
    psc.validateQuote();
    psc.validateAndSaveQuote();
    //other actions
    psc.productRatePlanSearchText = '';
    psc.doSearch();
    psc.doClearSearch();
    psc.next();
    psc.previous();
    //psc.removeChargeGroup();
    psc.selectedproductRatePlanMap.put(prpList[0].Id, false);
    psc.doRemoveRatePlan();
    psc.saveAndClose();
    psc.saveAndNew();
    System.Debug('PageMessages: ' + ApexPages.getMessages() );
    //there should be errors due to the rules
    System.AssertNotEquals(0, ApexPages.getMessages().size());

  }
 
}