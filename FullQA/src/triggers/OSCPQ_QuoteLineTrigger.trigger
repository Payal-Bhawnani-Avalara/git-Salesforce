/*------------------------------------------------------------------------+
Original Shift(developer@originalshift.com)
Purpose: Trigger on the CPQ Quote Line Group

Details: - Performs Quote Line Group Cloning
 
History:
Mar 06/19 - Original Shift - Initial Implementation
------------------------------------------------------------------------+*/ 
trigger OSCPQ_QuoteLineTrigger on SBQQ__QuoteLine__c (after insert) { 
    OSCPQ_QuoteLineTriggerHandler handler = new OSCPQ_QuoteLineTriggerHandler('Default');

    if(Trigger.isAfter) {
        if(Trigger.isInsert) {
            handler.onAfterInsert(Trigger.new);
        }
    }
}