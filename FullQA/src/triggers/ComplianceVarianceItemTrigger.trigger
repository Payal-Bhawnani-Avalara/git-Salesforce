trigger ComplianceVarianceItemTrigger on Compliance_Item__c ( before insert,before update) {
    new ComplianceVarianceItemTriggerHandler().run();
}