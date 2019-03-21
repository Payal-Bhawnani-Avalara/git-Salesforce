trigger FinanceOperationsCloseEventTrigger on Finance_Operations_Close_Event__c (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
    new FinanceOperationCloseEventTriggerHandler().run();
}