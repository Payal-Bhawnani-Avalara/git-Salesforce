trigger OSCPQ_QuoteTrigger on SBQQ__Quote__c (before insert, before update, after insert, after update) {
    OSCPQ_QuoteTriggerHandler handler = new OSCPQ_QuoteTriggerHandler('Default');
    
    if(Trigger.isBefore) {
        if(trigger.isInsert) {
            handler.onBeforeInsert(Trigger.new);
        }
        else if(trigger.isUpdate) {
            handler.onBeforeUpdate(Trigger.new, Trigger.oldMap);
        }
    }
    else if(Trigger.isAfter) {
        if(Trigger.isInsert) {
            handler.onAfterInsert(Trigger.new);
        }
        else if(Trigger.isUpdate) {
            handler.onAfterUpdate(Trigger.new);
        }
    }
}