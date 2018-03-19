@isTest(seeAllData=true)
public class AvaSendToZbillingControllerTest {

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
                                                   'ListPrice__c',
                                                   'TiersEdited__c'
                                                 };
      }
      return quoteChargeCustomFields;
    }
    set;
  }

  public static List<zqu.zQuoteUtil.zBillingResult> mockSendToZbillingRes{
    get{
      if(mockSendToZbillingRes == null){
        mockSendToZbillingRes = new List<zqu.zQuoteUtil.zBillingResult>();
        zqu.zQuoteUtil.zBillingResult mockSucessRes = new zqu.zQuoteUtil.zBillingResult();
        mockSucessRes.success = true;
        mockSendToZbillingRes.add(mockSucessRes);
        zqu.zQuoteUtil.zBillingResult mockFakeRes = new zqu.zQuoteUtil.zBillingResult();
        mockFakeRes.success = false;
        mockSendToZbillingRes.add(mockSucessRes);
      }
      return mockSendToZbillingRes;
    }
    set;
  }
  public static List<zuora.zObject> ratePlanQueryRes{
    get{
      if(ratePlanQueryRes == null){
        ratePlanQueryRes = new List<zuora.zObject>();
      }
      return ratePlanQueryRes;
    }
    set;
  }

  public static List<zuora.zObject> subQueryRes{
    get{
      if(subQueryRes == null){
        subQueryRes = new List<zuora.zObject>();
        Zuora.zObject zo = new Zuora.zObject('Subscription');
        zo.setValue('Id', '123');
      }
      return subQueryRes;
    }
    set;
  }

  public static List<Zuora.zApi.SaveResult> createRes{
    get{
      if(createRes == null){
        createRes = new List<zuora.zapi.SaveResult>();
      }
      return createRes;
    } 
    set;
  }



  public static List<Zuora.zObject> origSubQueryRes{
    get{
      if(origSubQueryRes == null){
        origSubQueryRes = new List<Zuora.zObject>();
      }
      return origSubQueryRes;
    } 
    set;
  }


  public static List<Zuora.zObject> ratePlanChargeQueryRes{
    get{
      if(ratePlanChargeQueryRes == null){
        ratePlanChargeQueryRes = new List<Zuora.zObject>();
      }
      return ratePlanChargeQueryRes;
    } 
    set;
  }

  static zqu__Quote__c quote;

  public static TestMethod void canWeSendAQuoteToZuora(){
    quote = setupTestData();

    //show the existing charges load normally
    ApexPages.StandardController std = new ApexPages.StandardController(quote);
    AvaSendToZbillingController stzc = new AvaSendToZbillingController(std);

    //user presses send to zbilling button
    stzc.sendSuccess = true;
    PageReference pr = stzc.createOrderInZuora();
    //pr should have quote id and subquote id set
    System.Debug('pr: ' + pr.getParameters());
    Map<String, String> params = pr.getParameters();
    System.assertEquals(true, params.containsKey('sendToZBilling'));
    System.assertEquals(true, params.containsKey('subQuoteId'));
    System.assertEquals(true, params.containsKey('id')); 
    Test.setCurrentPageReference(pr);
    pr = stzc.onload();
    params = pr.getParameters();
    //should have update sub quote set
    System.assertEquals(true, params.containsKey('updateSubQuote'));
    System.assertEquals(true, params.containsKey('subQuoteId'));
    System.assertEquals(true, params.containsKey('id')); 
    System.Debug('pr 2: ' + pr.getParameters());
    Test.setCurrentPageReference(pr);
    pr = stzc.onload();
    params = pr.getParameters();
    System.Debug('pr 3: ' + pr.getParameters());
    //should have send second quote to zbilling
    System.assertEquals(true, params.containsKey('sendToZBillingSecond'));
    System.assertEquals(true, params.containsKey('subQuoteId'));
    System.assertEquals(true, params.containsKey('id')); 
    Test.setCurrentPageReference(pr);
    pr = stzc.onload();
    params = pr.getParameters();
    System.Debug('pr 4: ' + pr.getParameters());
    //should send usage next 
    System.assertEquals(true, params.containsKey('doUsage'));
    System.assertEquals(true, params.containsKey('subQuoteId'));
    System.assertEquals(true, params.containsKey('id'));
    Test.setCurrentPageReference(pr);
    pr = stzc.onload(); 
    /*
     VF Stuff
    */
    stzc.goBack();
    stzc.toQuoteDetail();
    stzc.cghList = null;
    List<ProductSelectorController.ChargeGroupHolder> cghList = stzc.cghList;

    /*
    error
    */
    ApexPages.StandardController std2 = new ApexPages.StandardController(new zqu__Quote__c(name = 'test'));
    AvaSendToZbillingController stzc2 = new AvaSendToZbillingController(std2);
    pr = stzc.createOrderInZuora();

    String accId = '1234';
    String subId = '13467';
    String chargeNumber = 'C-00000001';
    String uomType = 'Each';
    Integer quantity = 1;


    String subQuoteId = params.get('subQuoteId');

    AvalaraSendToZBillingExtension testControl = new AvalaraSendToZBillingExtension(quote.Id,subQuoteId);
    Zuora.zObject testUsageObj = testControl.createUsageObject(accId,subId,chargeNumber,uomType,quantity);


    List<Zuora.zObject> usageList = new List<Zuora.zObject>();
    Zuora.zObject uObj = new Zuora.zObject('Usage');
    uObj.setValue('Quantity',10.00);
    usageList.add(uObj);

    Integer usageCount = testControl.countUpUsageQuantity(usageList);

  }
  
  public static zqu__Quote__c setupTestData(){

    origSubQueryRes = new List<zuora.zObject>();
    Zuora.zObject testSub = new Zuora.zObject('Subscription');
    testSub.setValue('Id','123');
    testSub.setValue('AccountId','123');
    testSub.setValue('OriginalId','123');
    origSubQueryRes.add(testSub); 

    ratePlanQueryRes = new List<zuora.zObject>();
    Zuora.zObject testRP = new Zuora.zObject('RatePlan');
    testRP.setValue('Id','123abc');
    ratePlanQueryRes.add(testRP);


    ratePlanChargeQueryRes = new List<zuora.zObject>();
    Zuora.zObject testRPC = new Zuora.zObject('RatePlanCharge');
    testRPC.setValue('Id','123def');
    testRPC.setValue('ChargeNumber','C-00000000');
    testRPC.setValue('UOM','Each');
    ratePlanChargeQueryRes.add(testRPC);


    createRes = new List<Zuora.zApi.SaveResult>();
    Zuora.zApi.SaveResult sr1 = new Zuora.zApi.SaveResult();
    sr1.Id = '1482982dsafas';
    sr1.Success = true;
    createRes.add(sr1);
     Zuora.zApi.SaveResult sr2 = new Zuora.zApi.SaveResult();
    sr2.Id = null;
    sr2.Success = false;
    Zuora.zObject err = new Zuora.zObject('Error');
    err.setValue('Code', '666');
    err.setValue('Message', 'Evil message');
    sr2.errors = new Zuora.zObject[] { err };
    createRes.add(sr2);        

    List<String> prpIds = TestFactory.makeAvaProductCatalog();
    System.Debug('Got prpIds: ' + prpIds.size() );
    Account acc = TestFactory.makeAccount();
    Contact con = TestFactory.makeContact( acc );
    Opportunity opp = TestFactory.makeOpportunity( acc );
    quote = TestFactory.makeQuote( opp );

    quote.zqu__BillToContact__c = con.Id;
    quote.zqu__SoldToContact__c = con.Id;
    update quote;

    zqu.GlobalCustomFieldDefinition.CHARGE_FIELDS = quoteChargeCustomFields;
    List<zqu.zChargeGroup> charges = zqu.zQuoteUtil.getChargeGroups(quote.Id, prpIds);
    System.Debug('Charges on quote : ' + charges.size());
    List<zqu.zChargeGroup> addedCharges = zqu.zQuoteUtil.addChargeGroups(charges);
    for(zqu.zChargeGroup cg : charges){
      System.Debug('cg chargeObject: ' + cg.zCharges[0].chargeObject);
      System.Debug('cg name is: ' + cg.ratePlanName);
      System.Debug('cg prpId: ' + cg.productRateplanZuoraID);
      for(zqu.zCharge c : cg.zCharges){
        System.Debug('charge name: ' + c.Name);
        System.Debug('charge type: ' + c.CHARGE_TYPE);

      }
    }
    ProductSelectorControllerTest.existingChargeGroupsTest = addedCharges;
    //ChargeGroupsHelper.hasRun = true;
    zqu__QuoteAmendment__c qa = new zqu__QuoteAmendment__c(
      Name = 'Test',
      zqu__Quote__c = quote.Id,
      zqu__Type__c = QuoteSplit.REMOVEPRODUCT,
      zqu__Status__c = 'Draft'
                                                          );

    insert qa;

    zqu__QuoteRatePlan__c qrp = new zqu__QuoteRatePlan__c(
      zqu__AmendmentType__c = QuoteSplit.REMOVEPRODUCT,
      zqu__ProductRatePlanZuoraId__c = '154659',
      zqu__Quote__c = quote.Id,
      zqu__QuoteAmendment__c = qa.Id
                                                         );
    insert qrp;

    zqu__QuoteAmendment__c qa2 = new zqu__QuoteAmendment__c(
      Name = 'Test',
      zqu__Quote__c = quote.Id,
      zqu__Type__c = QuoteSplit.REMOVEPRODUCT,
      zqu__Status__c = 'Draft'
                                                          );

    insert qa2;

    zqu__QuoteRatePlan__c qrp2 = new zqu__QuoteRatePlan__c(
      zqu__AmendmentType__c = QuoteSplit.REMOVEPRODUCT,
      zqu__ProductRatePlanZuoraId__c = '154657',
      zqu__Quote__c = quote.Id,
      zqu__QuoteAmendment__c = qa2.Id
                                                         );

    insert qrp2;

    List<zqu__ProductRatePlan__c> prpList = [SELECT Id, Name,
                                                    zqu__ZuoraId__c,
                                                    Display__c
                                             FROM zqu__ProductRatePlan__c
                                             LIMIT 200];
    System.Debug('All Rate Plans: ' + prpList);

    List<zqu__ProductRatePlanCharge__c> prpcList = [SELECT Id,
                                                           SubQuote__c,
                                                           zqu__ProductRatePlan__c
                                                    FROM zqu__ProductRatePlanCharge__c
                                                    LIMIT 200];

    System.Debug('All Rate Plans charges: ' + prpcList);
    return quote;
  }
}