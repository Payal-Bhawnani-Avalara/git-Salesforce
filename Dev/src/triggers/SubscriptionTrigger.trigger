trigger SubscriptionTrigger on Zuora__Subscription__c (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
    new SubscriptionTriggerHandler().run();
}