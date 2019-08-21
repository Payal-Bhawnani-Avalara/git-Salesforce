trigger QuoteRatePlanTrigger on zqu__QuoteRatePlan__c (after insert) {
    if(ChargeGroupsHelper.hasRun == true)
        return;
  string quoteId = Trigger.new[0].zqu__Quote__c;
  //get the quote amendments for the quote
  boolean hasDelete = false;
  for(zqu__QuoteRatePlan__c qrp : Trigger.new){
    System.Debug('Got qrp: ' + qrp.zqu__AmendmentType__c);
    //make sure all the quote rate plans are from the same quote, break other wise
    //theres 6 callouts used by the getChargeGroups for amendment quotes
    if(qrp.zqu__Quote__c != quoteId){
      System.Debug('Quotes on quote rate plan are not the same. Exiting...');
      return;
    }
  }
  //hand it off to the helper which will figure out what charge summaries need to be created
  ChargeSummariesHelper.checkForCreate(JSON.serialize(Trigger.new));
  System.Debug('QuoteRatePlanTrigger Done');
}