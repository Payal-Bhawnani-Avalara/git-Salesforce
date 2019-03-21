@isTest
private Class AvalaraCommunityWizardCtrlTest{

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

        Version__c ver = new Version__c(
            Name = 'Text version',
            Connector__c = c.Id
        );
        insert ver;

        Connector_KB__kav knowledge = new Connector_KB__kav(Version__c = ver.Id,Title = 'TestArticle',UrlName = 'TestArticle');
        insert knowledge;

        Draft_Knowledge__c cKnowledge = new Draft_Knowledge__c(Version__c =ver.Id);
        insert cKnowledge;
    }


    static testMethod void testAll(){
        Draft_Knowledge__c ck = [
            SELECT Id,Name,Sales_Tax_Matrix__r.Timing_For_Tax_Calculation__c,
                Company_Code__c,Address_Validation_Click_Path__c,Product_Mapping_Click_Path__c,
                Client_Exemption_Click_Path__c,Location_Code_Click_Path__c,Line_Level_Addressing__c,Sales_Tax_Matrix__c
            FROM Draft_Knowledge__c
            LIMIT 1
        ];
        String accId = [SELECT Id FROM Account LIMIT 1].Id;
        String versionId = [SELECT Id FROM Version__c LIMIT 1].Id;
        AvalaraCommunityWizardCtrl.accountIdOverride = accId;
        AvalaraCommunityWizardCtrl.fetchVersionNote(versionId);
        AvalaraCommunityWizardCtrl.insertVersionNote(versionId,'Test Note');
        AvalaraCommunityWizardCtrl.getToolTips();
        AvalaraCommunityWizardCtrl ctrl = new AvalaraCommunityWizardCtrl();
        ctrl.updateAccountDetail();
        ctrl.selectConnector();
        ctrl.selectVersion();
        ctrl.getActiveConnectors();
        ctrl.getVersions();
        try{
            ctrl.saveRecord();
        }
        catch(exception ex){}
        ctrl.att.Name = 'Test.txt';
        ctrl.att.ParentId = accId;
        ctrl.att.Body = Blob.valueOf('Test');
        ctrl.uploadAttachment();
        ctrl.getVersionAttachment();
        ctrl.getOpenOpportunitiesMap();
        ctrl.saveAndRedirect();
        AvalaraCommunityWizardCtrl.getKnowledge(versionId);
        AvalaraCommunityWizardCtrl.getConnectorKB(versionId);
        ctrl.updateConnector();
        ctrl.toFunctionalMatrix(ck);
        ctrl.getAssociates();
        System.assertEquals(1,[SELECT Id FROM Attachment WHERE ParentId =:accId].size());
    }
}