public class AvaSendToZbillingController {

  private ApexPages.StandardController stdController{
    get;
    set;
  }

  private string quoteId{
    get;
    set;
  }

  private string subQuoteId{
    get;
    set;
  }

  public List<ProductSelectorController.ChargeGroupHolder> cghList{
    get{
      if(cghList == null){
        cghList = new List<ProductSelectorController.ChargeGroupHolder>();
      }
      return cghList;
    }
    set;
  }

  public string doUsage{
    get;
    set;
  }

  public boolean sendSuccess{
    get{
      if(sendSuccess == null){
        sendSuccess = false;
      }
      return sendSuccess;
    }
    set;
  }
  Map<String,String> params;

  // Constructor
  public AvaSendToZbillingController(ApexPages.StandardController stdController) {
    this.stdController = stdController;
    quoteId = stdController.getId();
    if(String.isEmpty(quoteId)){
      ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, 'Please specify quoteId'));
      return;
    }
    params = ApexPages.currentPage().getParameters();
    if(!params.containsKey('doUsage') && 
       !params.containsKey('sendToZBilling') && 
       !params.containsKey('updateSubQuote') &&
       !params.containsKey('sendToZBillingSecond')){
      System.Debug('Loading charges');
      //get charge groups holders to display the same as the product selector page
      ProductSelectorController psc = new ProductSelectorController(stdController);
      cghList = psc.existingChargeGroupHolders;
    }
  }
  public PageReference onload(){
    params = ApexPages.currentPage().getParameters();
    if(params.containsKey('id')){
      quoteId = params.get('id');
    }
    if(params.containsKey('subQuoteId')){
      subQuoteId = params.get('subQuoteId');
    }

    if(params.containsKey('doUsage')){
      doUsage = params.get('doUsage');
      //catch up usage
      AvalaraSendToZBillingExtension asze = new AvalaraSendToZBillingExtension(quoteId, subQuoteId);
    }
    else if(params.containsKey('sendToZBilling')){
      System.Debug('Sending first quote to zuora');
      //there could be only one
      //send the two quotes to zuora
      if(!String.isEmpty(quoteId)){
        List<zqu.zQuoteUtil.zBillingResult> sendRes = sendQuote(quoteId);
        System.Debug('sendRes: ' + sendRes);
        //rolling refresh to send the last quote
        if(sendSuccess || Test.isRunningTest()){
          return rollingRefreshDoUpdateSubQuote();
        }
      }
    }
    else if(params.containsKey('updateSubQuote')){
      System.Debug('Updating sub quote');
      //update the subquote rate plan with the most recent sub Id and the rate plan charge
      updateSubQuoteWithRecentZuoraData(subQuoteId);
      return rollingRefreshDoSecondSend();
    }
    else if(params.containsKey('sendToZBillingSecond')){
      System.Debug('Send second quote');        
      //send the second quote
      List<zqu.zQuoteUtil.zBillingResult> sendRes = sendQuote(subQuoteId);
      System.Debug('sendRes 2: ' + sendRes);
      //rolling refresh to do the usage
      if(sendSuccess || Test.isRunningTest()){
        return rollingRefreshDoUsage();
      }
    }
    return null;
  }

  public PageReference goBack(){
    PageReference pr = new PageReference('/'+quoteId);
    pr.setRedirect(true);
    return pr;
  }

  public PageReference rollingRefreshDoUpdateSubQuote(){
    PageReference pr = Page.AvaSendToZbilling;
    pr.setRedirect(true);
    pr.getParameters().put('updateSubQuote', 'true');
    pr.getParameters().put('id', quoteId);
    pr.getParameters().put('subQuoteId', subQuoteId);
    return pr;
  }

  public PageReference rollingRefreshDoSecondSend(){
    PageReference pr = Page.AvaSendToZbilling;
    pr.setRedirect(true);
    pr.getParameters().put('sendToZBillingSecond', 'true');
    pr.getParameters().put('id', quoteId);
    pr.getParameters().put('subQuoteId', subQuoteId);
    return pr;
  }
  //split quote and send to zuora
  public PageReference createOrderInZuora(){
    //run the logic to seperate the charges into two quote
    //only do this if necessary, the check is build in, 
    //its set the boolean create two if its cloned the quote
    List<string> quoteIds = QuoteSplit.doQuoteSplit(quoteId);
    System.Debug('QuoteIds: ' + quoteIds);
    if(!QuoteSplit.createTwo){
      System.Debug('Sending normal quote');
      //send the quote and stay on this page
      List<zqu.zQuoteUtil.zBillingResult> sendRes = sendQuote(quoteId);
      //apex pages messages to show the results handled by the sendQuote method
      return null;
    }
    System.Debug('Sending two quotes');
    return rollingRefreshDoSendToZBilling(quoteId, QuoteSplit.subQuote.Id);
  }
  // Method to return to quote's detail page from notification popup
  public PageReference toQuoteDetail() {
    return new PageReference('/' + quoteId);
  }
  //rolling refresh
  public PageReference rollingRefreshDoUsage(){
    PageReference pr = Page.AvaSendToZbilling;
    pr.setRedirect(true);
    pr.getParameters().put('doUsage', 'true');
    pr.getParameters().put('id', quoteId);
    pr.getParameters().put('subQuoteId', subQuoteId);
    return pr;
  }

  //rolling refresh
  public PageReference rollingRefreshDoSendToZBilling(String quote, String subQuote){
    PageReference pr = Page.AvaSendToZbilling;
    pr.setRedirect(true);
    pr.getParameters().put('sendToZBilling', 'true');
    pr.getParameters().put('id', quote);
    pr.getParameters().put('subQuoteId', subQuote);
    return pr;
  }
  // Send To Z-Billing
  public List<zqu.zQuoteUtil.zBillingResult> sendQuote(String quoteId){
    System.Debug('Sending quote: ' + quoteId);
    zqu__Quote__c quote, subQuote;
    //get the quotes after the reload
    Set<String> quoteIds = new Set<String>();
    quoteIds.add(quoteId);

    Map<Id,zqu__Quote__c> quoteMap = new Map<Id, zqu__Quote__c> ([SELECT Id, 
                                                                         zqu__ZuoraAccountID__c,
                                                                         zqu__Opportunity__r.AccountId
                                                                  FROM zqu__Quote__c
                                                                  WHERE Id IN :quoteIds]);
    quote = quoteMap.get(quoteId);
    System.Debug('got quote: ' + quote);
    List<zqu.zQuoteUtil.ZBillingQuoteCollection> quoteCollections = new List<zqu.zQuoteUtil.ZBillingQuoteCollection>();
    
    zqu.zQuoteUtil.ZBillingQuoteCollection quoteCollection = new zqu.zQuoteUtil.ZBillingQuoteCollection();
    quoteCollection.sfdcAccountId = quote.zqu__Opportunity__r.AccountId; // SFDC CRM Account ID
    
    if(String.isEmpty(quote.zqu__ZuoraAccountID__c)){
      quoteCollection.zAccountId = 'New'; // Zuora Billing Account ID
    } 
    else {
      quoteCollection.zAccountId = quote.zqu__ZuoraAccountID__c;
    }
    quoteCollection.quoteRequests = new List<zqu.zQuoteUtil.ZBillingQuoteRequest>();
    zqu.zQuoteUtil.ZBillingQuoteRequest req = new zqu.zQuoteUtil.ZBillingQuoteRequest();
    req.sfdcQuoteId = quote.Id; // SFDC Quote ID
    quoteCollection.quoteRequests.add(req);

    quoteCollections.add(quoteCollection);
        
    List<zqu.zQuoteUtil.zBillingResult> results = Test.isRunningTest() ? AvaSendToZbillingControllerTest.mockSendToZbillingRes : zqu.zQuoteUtil.sendToZBilling(quoteCollections);
    System.Debug('sent to zbilling ' + results);
    for ( zqu.zQuoteUtil.zBillingResult result : results ) {
      if(result.success){
        appendMessage('CONFIRM', 'Subscription successfully created.');
        sendSuccess = true;
      } else {
        appendMessage('ERROR', result.message);
        sendSuccess = false;
      }
    }
    return results;
  }

  public void updateSubQuoteWithRecentZuoraData(String subQuoteId){
    Zuora.zApi zApi = new Zuora.zApi();

    List<zqu__Quote__c> quoteList = [SELECT Id, 
                                            zqu__ZuoraAccountID__c,
                                            zqu__Opportunity__r.AccountId,
                                            zqu__ExistSubscriptionId__c,
                                            zqu__Hidden_Subscription_Name__c
                                     FROM zqu__Quote__c
                                     WHERE Id = :subQuoteId];

    zqu__Quote__c subQuote = quoteList[0];

    string zSubscriptionQuery = 'SELECT Id ' + 
                                'FROM Subscription ' + 
                                'WHERE Status=\'Active\' ' + 
                                'AND Name = \'' + subQuote.zqu__Hidden_Subscription_Name__c + '\'';

    System.Debug('zSubscriptionQuery: ' + zSubscriptionQuery);
    //login
    if(!Test.isRunningTest())zApi.zLogin(); 
    //query the subscription
    List<Zuora.zObject> subQueryRes = !Test.isRunningTest() ? zapi.zQuery(zSubscriptionQuery) : AvaSendToZbillingControllerTest.subQueryRes;

    //get the quote rate plan for the quote, there should only be one
    List<zqu__QuoteRatePlan__c> qrpList = [SELECT Id, 
                                                  zqu__ProductRatePlanZuoraId__c,
                                                  zqu__QuoteProductName__c,
                                                  zqu__SubscriptionRatePlanZuoraId__c,
                                                  zqu__AmendmentType__c
                                           FROM zqu__QuoteRatePlan__c
                                           WHERE zqu__Quote__c = :subQuoteId
                                           LIMIT 1];

    string zRatePlanQuery = '';

    if(qrpList.size() > 0){
      zqu__QuoteRatePlan__c ratePlan = qrpList[0];
      //query the rate plan from zuora, using sub id, product rate plan id, rate plan name from the quote rate plan
      zRatePlanQuery = 'SELECT Id ' + 
                       'FROM RatePlan ' + 
                       'WHERE ProductRatePlanId = \'' + ratePlan.zqu__ProductRatePlanZuoraId__c + '\' ' +  
                       'AND SubscriptionId = \'' + subQuote.zqu__ExistSubscriptionId__c + '\'';
      System.Debug('zRatePlanQuery: ' + zRatePlanQuery);
      //update the id of the quote rate plan with the latest one from zuora
      List<Zuora.zObject> ratePlanQueryRes = !Test.isRunningTest() ? zapi.zQuery(zRatePlanQuery) : AvaSendToZbillingControllerTest.ratePlanQueryRes;
      if(ratePlanQueryRes.size() > 0){
        ratePlan.zqu__SubscriptionRatePlanZuoraId__c = (String)ratePlanQueryRes[0].getValue('Id');
        update ratePlan;
      }
    }

    //need to do both callouts before doing the update 
    if(subQueryRes.size() > 0){
      subQuote.zqu__ExistSubscriptionId__c = (String)subQueryRes[0].getValue('Id');
      //update the quote with the new id
      update subQuote;
    }

  }

  public void appendMessage(String severity, String message) {
    ApexPages.Severity messageType = severity(severity);
    ApexPages.addMessage(new ApexPages.Message(messageType, message));
  }

  public ApexPages.Severity severity(String severity) {
    ApexPages.Severity messageType;
    if(severity=='ERROR'){
      messageType = ApexPages.Severity.ERROR;
    } 
    // else if (severity=='WARNING'){
    //   messageType = ApexPages.Severity.WARNING;       
    // } else if (severity=='INFO'){
    //   messageType = ApexPages.Severity.INFO;        
    // }
    else if (severity=='CONFIRM'){
       messageType = ApexPages.Severity.CONFIRM;       
    } else {
       messageType = ApexPages.Severity.INFO;
    }
    return messagetype;
  } 
}