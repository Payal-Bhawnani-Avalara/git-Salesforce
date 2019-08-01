@isTest
private class FunctionalMatrixRequirementListEditTest 
{

@testSetup
  private static void setupData()
  {
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
  }

  @isTest static void test_FunctionalMatrixRequirementListEditTestFunctionalMatrixRequirementListEdit()
  {
	Functional_Matrix__c fm=[select id from Functional_Matrix__c];

    Test.startTest();

    ApexPages.StandardController std = new ApexPages.StandardController(fm);
    FunctionalMatrixRequirementListEdit  ext = new FunctionalMatrixRequirementListEdit(std);

    Test.stopTest();

    System.assertEquals(0, ext.ZERO);
    System.assertEquals(0, ext.removeChildList.size());
    System.assertEquals(1, ext.childList.size());
  }

 @isTest static void test_getChildren()
  {

Functional_Matrix__c fm=[select id from Functional_Matrix__c];
    ApexPages.StandardController std = new ApexPages.StandardController(fm);
    FunctionalMatrixRequirementListEdit ext = new FunctionalMatrixRequirementListEdit(std);
    
    Test.startTest();

    System.assert(ext.getChildren() instanceof List<Functional_Matrix_Requirement__c>);

    Test.stopTest();    
  }

  @isTest static void test_initChildRecord()
  {

Functional_Matrix__c fm=[select id from Functional_Matrix__c];
    ApexPages.StandardController std = new ApexPages.StandardController(fm);
    FunctionalMatrixRequirementListEdit ext = new FunctionalMatrixRequirementListEdit(std);

    Test.startTest();

    System.assert(ext.initChildRecord() instanceof Functional_Matrix_Requirement__c);
    Functional_Matrix_Requirement__c myFunctional_Matrix_Requirement = (Functional_Matrix_Requirement__c)ext.initChildRecord();
    
    Test.stopTest();

    System.assertEquals(fm.Id, myFunctional_Matrix_Requirement.Functional_Matrix__c);
  }
}