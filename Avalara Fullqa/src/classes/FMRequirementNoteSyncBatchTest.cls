@isTest
public class FMRequirementNoteSyncBatchTest {
    static testMethod void doTestAll(){
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
            Connector__c = c.Id
        );
        insert ver;

		Functional_Matrix_Requirements_Config__c cf = new Functional_Matrix_Requirements_Config__c(
			Core_Type__c = 'Core Sales Tax'
		);
		insert cf;


		Functional_Matrix__c fm = new Functional_Matrix__c(
			Version__c = ver.Id,
			RecordTypeId = Schema.SObjectType.Functional_Matrix__c.getRecordTypeInfosByName().get('Core Sales Tax').getRecordTypeId(),
			Sales_Tax__c = 'Certified'
		);
		insert fm;
        
        Functional_Matrix_Requirement__c fmr = new Functional_Matrix_Requirement__c(
            Name = 'testFM',
            CurrencyIsoCode = 'EUR-euro',
            Functional_Matrix__c = fm.Id
        );
        
        FMRequirementNoteSyncBatch.run();
        
        system.assertEquals(1, [SELECT Id, Note__c FROM Functional_Matrix_Requirement__c WHERE External_Id__c != NULL].size());
        
    }

}