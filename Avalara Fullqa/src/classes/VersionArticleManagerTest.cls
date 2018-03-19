@isTest
private class VersionArticleManagerTest{
    
    static testMethod void testProcess(){   
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
        
        Solution sol = new Solution(SolutionName = 'test sol');
        insert sol;
        Version__c ver = new Version__c(
            Name = 'Text version',
            Connector__c = c.Id,
            Version_Kb__c = sol.Id
        );
        insert ver;
    }
}