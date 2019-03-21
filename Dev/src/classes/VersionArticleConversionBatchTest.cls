@isTest
private Class VersionArticleConversionBatchTest{

    static testMethod void testProcess(){
        Solution sol = new Solution(
            SolutionName = 'Test Solution'
        );
        insert sol;
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

        Version__c ver = new Version__c(
            Name = 'Text version 11211222',
            Connector__c = c.Id,
            Version_KB__c = sol.Id
        );
        insert ver;
        Connector_KB__kav knowledge = new Connector_KB__kav(
            Version__c = ver.Id,
            Title = 'TestArticle',
            UrlName = 'TestArticle-1123',
            Unique_Identifier__c = sol.Id + '||' + ver.Id
        );
        insert knowledge;
        Test.startTest();
        System.debug([SELECT Unique_Identifier__c FROM Connector_KB__kav]);
        VersionArticleConversionBatch.run();
        Test.stopTest();
    }
}