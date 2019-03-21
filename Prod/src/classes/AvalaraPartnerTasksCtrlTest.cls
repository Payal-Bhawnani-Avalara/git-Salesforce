@isTest
private class AvalaraPartnerTasksCtrlTest{
    
    @testSetup
    static void setup(){
        Account acc = new Account(
            Name = 'Test Account'
        );
        insert acc;
        
        Connector__c c = new Connector__c(
            Name = 'Test Connector',
            Author__c = acc.Id,
            Managed_By__c = acc.Id
        );
        insert c;
        
        Solution sol = new Solution(
            SolutionName = 'Solution 1',
            Solution_Type__c  = 'FAQ',
            Description__c = 'Solution Description',
            Product__c = 'Avalara AvaTax'
        );
        insert sol;
        
        Version__c ver = new Version__c(
            Name = 'Text version',
            Connector__c = c.Id,
            Version_KB__c = sol.Id
        );
        insert ver;
         
        Partner_Launch_Task__c tsk = new Partner_Launch_Task__c(Name = 'tsak 1',Version__c = ver.Id,Type__c = 'Administration');
        insert tsk;
    }
    static testMethod void testAll(){
        AvalaraPartnerTasksCtrl ctrl =  new AvalaraPartnerTasksCtrl();
        ctrl.sVersionId = [select Id FROM Version__c LIMIT 1].Id;
        ctrl.getMapTasksByType();
    }
}