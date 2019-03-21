trigger ActivactionCredit on zqu__Quote__c(after insert, after update) {

  System.Debug('hasrun: ' + ChargeGroupsHelper.hasRun);
  if (ChargeGroupsHelper.hasRun == true) {
    return;
  }
  if (ChargeGroupsHelper.deletePerformed == true) {
    return;
  }
  public Map < String, Set < String >> ProductMap {
    get {
      if (ProductMap == null) {
        ProductMap = new Map < String, Set < String >> ();
      }

      return ProductMap;
    }
    set;
  }

  zqu__Quote__c quote = Trigger.new[0];

  Date earliestDate = Date.Today();

    system.debug('Earliest Date 1: ' + earliestDate);

  earliestDate = ChargeGroupsHelper.getEarliestStartDate(quote);

    system.debug('Earliest Date 2: ' + earliestDate);

  if(earliestDate == null)
  {
    for (zqu__Quote__c q : Trigger.new) {
    
       q.addError('Error occured, Zuora subscriptions need to be synchronized.  Unable to compare Quote Start Date to the start date of the earliest One time charge being removed.');
    
    }
    
  }
  

  if (earliestDate != null && quote.zqu__StartDate__c != null && quote.zqu__StartDate__c.daysBetween(EarliestDate) != 0) {
    if (ChargeGroupsHelper.deletePerformed == false) {
      System.Debug('Running with adding');
      ChargeGroupsHelper.getChargeGroups(quote.Id, ChargeGroupsHelper.ProductsWithFlag, true, false);
      ChargeGroupsHelper.hasRun = true;
    }

  }
  else if(earliestDate != null && quote.zqu__StartDate__c != null && quote.zqu__StartDate__c == EarliestDate) {
    if (ChargeGroupsHelper.deletePerformed == false) {
      System.Debug('Running with just QCS');
      ChargeGroupsHelper.getChargeGroups(quote.Id, ChargeGroupsHelper.ProductsWithFlag, true, true);
      ChargeGroupsHelper.hasRun = true;
    }
  }
  else {
    if (ChargeGroupsHelper.deletePerformed == false) {
      System.Debug('Running...');
      ChargeGroupsHelper.getChargeGroups(quote.Id, ChargeGroupsHelper.ProductsWithFlag, false, false);
    }
  }


  System.Debug('hasrun: ' + ChargeGroupsHelper.hasRun);
}