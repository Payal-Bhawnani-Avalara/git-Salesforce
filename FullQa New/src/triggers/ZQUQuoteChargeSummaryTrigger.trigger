trigger ZQUQuoteChargeSummaryTrigger on zqu__QuoteChargeSummary__c (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
	new ZQUQuoteChargeSummaryTriggerHandler().run();
}