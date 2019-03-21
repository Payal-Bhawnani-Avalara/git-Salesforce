@isTest
private class FunctionalMatrixRequirementHandlerTest {
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
            Managed_By__c = acc.Id,
            Connector_Description__c = 'test',
            Connector_EcoSystem_Test__c = 'test'
        );
        insert c;

        Version__c ver = new Version__c(
            Name = 'Text version 11211222',
            Connector__c = c.Id,
            Version_KB__c = sol.Id
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
		fm.Configuration_Click_Path__c = 'test';
		update fm;
        
        FunctionalMatrixHandler.syncToConnectorKB(new List<Functional_Matrix__c>{fm});

	}
}