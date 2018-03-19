@isTest
private Class AvalaraNewUserCtrlTest{
    
    static testMethod void testAll(){
        AvalaraNewUserCtrl ctrl = new AvalaraNewUserCtrl();
        ctrl.req.First_Name__c = 'First';
        ctrl.req.Last_Name__c = 'Last';
        ctrl.req.Email__c = 'email000@gmail.com';
        ctrl.insertRequest();
        
        system.assertEquals(1,[SELECT Id FROM Contact].size());
    }
}