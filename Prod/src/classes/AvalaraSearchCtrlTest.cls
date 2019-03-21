@isTest
private Class AvalaraSearchCtrlTest{

    static testMethod void testAll(){
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

        Connector_KB__kav knowledge = new Connector_KB__kav(
            Version__c = ver.Id,
            Title = 'TestArticle',
            UrlName = 'TestArticle'
        );
        insert knowledge;

        Badge__c b = new Badge__c(Version__c = ver.Id);
        insert b;
        AvalaraSearchCtrl.getConnectors('Test');
        AvalaraSearchCtrl.getSettings();
        AvalaraSearchCtrl.getArticle(ver.Id);
        AvalaraSearchCtrl.getRequirements(ver.Id,'Sales Tax');
        AvalaraSearchCtrl.createTask(
            new Task(
                WhatId = ver.Id,
                Subject = 'Test'
            )
        );
        AvalaraSearchCtrl.getUser(UserInfo.getUserId());
        AvalaraSearchCtrl.getContacts('test');
        AvalaraSearchCtrl.getCases('011');
    }
}