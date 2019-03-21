@isTest
private class EditMatrixRequirementsCtrlTest{
	static{
	TestUtil t=new TestUtil();
	}    
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
            Name = 'Text version 11211222',
            Connector__c = c.Id
        );
        insert ver;
        Functional_Matrix__c fm = new Functional_Matrix__c(
            Version__c = ver.Id,
            RecordTypeId = Schema.SObjectType.Functional_Matrix__c.getRecordTypeInfosByName().get('Core Sales Tax').getRecordTypeId(),
            Sales_Tax__c = 'Certified'
        );
        insert fm;
        List<Functional_Matrix_Requirement__c> req = new List<Functional_Matrix_Requirement__c>();
        req.add(new Functional_Matrix_Requirement__c(Name='test req',Functional_Matrix__c=fm.Id));
        insert req;
        EditMatrixRequirementsCtrl.getUserTimeZone();
        EditMatrixRequirementsCtrl.getRequirements(null);
        EditMatrixRequirementsCtrl.updateRequirement(req);
    }
}