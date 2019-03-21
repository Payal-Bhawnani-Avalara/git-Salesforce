@isTest
private class UtilityTest {

    static testMethod void testcreateApexLog() {
        Utility.createApexLog('Test', 'Test', 1, 1,'Test', 1);
    }
    static testMethod void testcreateApexLog1() {
        Utility.createApexLog('Test', 'Test', 1, 1,'Test', 1,'Test',true);
    }   
    static testMethod void testcreateApexLog2() {
    		ApexLog__c al=Utility.createApexLog('Test', 'Test', 1, 1,'Test', 1,'Test',false);
    		List<ApexLog__c> aList=new List<ApexLog__c>();
    		List<Database.SaveResult> listDSR=Database.insert(aList,false);
        Utility.createApexLog('Test',listDSR,true);
    }
    static testMethod void vatNumberVerification() {
        Utility.vatNumberVerification('USA', '123','test');
    }   
    static testMethod void testGetSObjectFields() {
        Utility.getSObjectFields('User');
    }     
}