trigger OpportunityRoleSplitTrigger on Opportunity_Role_Split__c (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
    new OpportunityRoleSplitTriggerHandler().run();
}