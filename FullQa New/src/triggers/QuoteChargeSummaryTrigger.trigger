trigger QuoteChargeSummaryTrigger on zqu__QuoteChargeSummary__c (after insert, after update) {
    if(ChargeGroupsHelper.hasRun == true)
        return;
    //need to make sure all the quote charge summaries are on the same quote
  System.Debug('Entering quote charge summary trigger');
  String quoteId = Trigger.new[0].Quote__c;

  for(zqu__QuoteChargeSummary__c qcs : Trigger.new){
    System.Debug('QuoteId: ' + quoteId); 
    System.Debug('qcs.QuoteId: ' + qcs.Quote__c); 
    if(qcs.Quote__c != quoteId){
      System.Debug('Quote charge summaries are from different quotes.');
      return;
    }
    if(String.isBlank(qcs.Quote__c)){
      System.Debug('Quote charge summaries doesnt have quoteId set skipping.');
      return;
    }
  }
  QuoteChargeSummaryTriggerHelper qcsth = new QuoteChargeSummaryTriggerHelper(Trigger.new);
  System.Debug('Exiting quote charge summary trigger');
}