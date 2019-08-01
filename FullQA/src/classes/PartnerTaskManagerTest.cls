@isTest
private class PartnerTaskManagerTest {    
 
    static testMethod void testManager(){
        PartnerTaskManager.create(new List<Version__c>{new Version__c()},new List<Version__c>{new Version__c()});
        PartnerTaskManager.isTaskCreateOnUpdate(new Version__c(),new Version__c());
    }
}