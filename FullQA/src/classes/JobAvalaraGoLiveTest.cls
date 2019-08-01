@isTest
private class JobAvalaraGoLiveTest{

    @testSetup
    static void setUp(){
        createCustomSetting();

        Account acc = new Account(
            Name = 'Test acc',
            PROD_AvaTax_Account__c = '51095'
        );
        insert acc;

        Account_Statistics__c aStat = new Account_Statistics__c(
            Account__c = acc.Id
        );
        insert aStat;

        Case c0 = new Case(
            RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Implementation').getRecordTypeId(),
            Implementation_Product__c = 'Avalara Avatax',
            AccountId = acc.Id,
            AvaTax_PX_Data_Feed_Dev__c =  aStat.Id,
            PX_Data_Feed__c = aStat.Id,
            Status = 'Active',
            Priority = 'Medium',
            Subject = 'Test',
            Origin = 'Phone'
        );
        insert c0;

        Case c1 = new Case(
            RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Implementation').getRecordTypeId(),
            Implementation_Product__c = 'Avalara CertCapture',
            AccountId = acc.Id,
            AvaTax_PX_Data_Feed_Dev__c =  aStat.Id,
            PX_Data_Feed__c = aStat.Id,
            Status = 'Active',
            Priority = 'Medium',
            Subject = 'Test',
            Origin = 'Phone'
        );
        insert c1;

        Case c2 = new Case(
            RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Implementation').getRecordTypeId(),
            Implementation_Product__c = 'Avalara Returns',
            AccountId = acc.Id,
            AvaTax_PX_Data_Feed_Dev__c =  aStat.Id,
            PX_Data_Feed__c = aStat.Id,
            Status = 'Active',
            Priority = 'Medium',
            Subject = 'Test',
            Origin = 'Phone'
        );
        insert c2;
    }

    private static void createCustomSetting(){
     //Setup custom setting
       List<KeyPairValue__c> listKeyPairValue=new List<KeyPairValue__c>();
       listKeyPairValue.add(new KeyPairValue__c(Name='Boomi_API_URL_Sandbox',Values__c='http://api.salesforce.com/'));
       listKeyPairValue.add(new KeyPairValue__c(Name='Boomi_API_Key',Values__c='123456'));
       listKeyPairValue.add(new KeyPairValue__c(Name='Boomi_API_URL_Production',Values__c='http://api.salesforce.com/'));
       listKeyPairValue.add(new KeyPairValue__c(Name='ZTBuyAPICaseSafeID ',Values__c='00533000003RbvNAAS '));
       insert listKeyPairValue;
    }

    static testMethod void testAvaTax(){
        Test.setMock(HttpCalloutMock.class, new JobAvalaraGoLiveMock());
        Test.startTest();
        Database.executeBatch(new JobAvalaraGoLive('Avalara AvaTax'));
        Test.stopTest();
        system.assertEquals(1, [SELECT Id FROM Account_Statistics__c WHERE CX_911_Account_Activation_Date__c <> NULL].size());
    }

    static testMethod void testCertcapture(){
        Test.setMock(HttpCalloutMock.class, new JobAvalaraGoLiveMock());
        Test.startTest();
        Database.executeBatch(new JobAvalaraGoLive('Avalara CertCapture'));
        Test.stopTest();
        system.assertEquals(1, [SELECT Id FROM Account_Statistics__c WHERE CC_1st_Certificate_Creation_Date__c <> NULL].size());
    }

    static testMethod void testReturns(){
        Test.setMock(HttpCalloutMock.class, new JobAvalaraGoLiveMock());
        Test.startTest();
        Database.executeBatch(new JobAvalaraGoLive('Avalara Returns'));
        Test.stopTest();
        //system.assertEquals(1, [SELECT Id FROM Account_Statistics__c WHERE CX_911_Funding_POA_Complete__c <> NULL].size());
    }
    
    static testMethod void testithAdditionalWhereAvaTax(){
            
        Test.setMock(HttpCalloutMock.class, new JobAvalaraGoLiveMock());
        Test.startTest();
        Database.executeBatch(new JobAvalaraGoLive('Avalara AvaTax', NULL));
        Test.stopTest();        
    }
    
    static testMethod void testithAdditionalWhereReturns(){
            
        Test.setMock(HttpCalloutMock.class, new JobAvalaraGoLiveMock());
        Test.startTest();
        Database.executeBatch(new JobAvalaraGoLive('Avalara Returns', NULL));
        Test.stopTest();        
    }
    
    static testMethod void testithAdditionalWhereCertCapture(){
            
        Test.setMock(HttpCalloutMock.class, new JobAvalaraGoLiveMock());
        Test.startTest();
        Database.executeBatch(new JobAvalaraGoLive('Avalara CertCapture', NULL));
        Test.stopTest();        
    }
    
    static testMethod void testSchedule(){
        Test.setMock(HttpCalloutMock.class, new JobAvalaraGoLiveMock());
        JobAvalaraGoLive.schedule();
    }
}