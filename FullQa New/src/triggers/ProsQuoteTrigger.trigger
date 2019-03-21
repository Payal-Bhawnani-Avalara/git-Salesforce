trigger ProsQuoteTrigger on CameleonCPQ__Quote__c (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
    new ProsQuoteTriggerHandler().run();
}