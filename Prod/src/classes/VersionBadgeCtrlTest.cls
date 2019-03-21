@IsTest
private class VersionBadgeCtrlTest{

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
        VersionBadgeCtrl.getSettings();
        VersionBadgeCtrl.getBadges(ver.Id);
        VersionBadgeCtrl.getRequirements(ver.Id,'VAT');
    }
}