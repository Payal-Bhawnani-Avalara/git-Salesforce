@isTest
private class SyncToConnectorKBCtrlTest{
    static testMethod void testController(){
        ApexPages.StandardController ap = new ApexPages.StandardController(new Functional_Matrix__c());
        SyncToConnectorKBCtrl ctrl = new SyncToConnectorKBCtrl(ap);
        ctrl.sync();
    }
}