trigger QuoteUpdateOppTerms on Quote (after insert, after update) {
for (Quote quo : Trigger.new) 
    {
        if (quo.PaymentTerms__c != null && quo.IsSyncing)
        {
          Opportunity[] opp = [select Name, Quote_Payment_Terms__c from Opportunity where id=:quo.OpportunityId limit 1];
          if (opp.size()==1)
          {
              Opportunity updateOpp = opp[0];
              updateOpp.Quote_Payment_Terms__c = quo.PaymentTerms__c;
              update updateOpp;
          }
        }
    }
}