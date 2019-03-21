trigger ComplianceVarianceItemTrigger on Compliance_Item__c (before insert, before update, before delete, after insert, after update, after delete,after undelete) {
    new ComplianceVarianceItemTriggerHandler().run();
}