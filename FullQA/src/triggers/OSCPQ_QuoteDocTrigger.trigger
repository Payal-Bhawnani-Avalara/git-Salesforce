trigger OSCPQ_QuoteDocTrigger on SBQQ__QuoteDocument__c (before update) {
    if(trigger.isBefore && trigger.isUpdate){
		(new OSCPQ_QuoteDocTriggerHandler('Default')).closeSignedQuotes(Trigger.NewMap, Trigger.OldMap);
    }
}