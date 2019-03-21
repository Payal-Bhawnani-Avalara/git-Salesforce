@isTest
private class ArticleApprovalManagerTest{

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

        Version__c ver = new Version__c(
            Name = 'Text version',
            Connector__c = c.Id
        );
        insert ver;

        Connector_KB__kav knowledge = new Connector_KB__kav(Version__c = ver.Id,Title = 'TestArticle',UrlName = 'TestArticle');
        insert knowledge;

        Draft_Knowledge__c ck = new Draft_Knowledge__c(Version__c = ver.Id);
        insert ck;
        ck.Approved__c = true;
        update ck;
        ArticleApprovalManager.assignValueFromCustomerKnowledge(ck,knowledge);
    }
}