trigger SubscriptionProductChargeTrigger on Zuora__SubscriptionProductCharge__c (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
    new SubscriptionProductChargeTriggerHandler().run();
}