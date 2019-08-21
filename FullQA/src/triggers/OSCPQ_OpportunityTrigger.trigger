trigger OSCPQ_OpportunityTrigger on Opportunity (before update) {
    OSCPQ_OpportunityTriggerHandler handler = new OSCPQ_OpportunityTriggerHandler('Default');
    
    if(Trigger.isBefore) {
        if(Trigger.isUpdate) {
            handler.onBeforeUpdate(Trigger.New, Trigger.OldMap);
        }
    }
}