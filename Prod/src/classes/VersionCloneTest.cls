@isTest
private class VersionCloneTest {
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
        
        Solution sol = new Solution(
            SolutionName = 'Solution 1',
            Solution_Type__c  = 'FAQ',
            Description__c = 'Solution Description',
            Product__c = 'Avalara AvaTax'
        );
        insert sol;
        
        Version__c ver = new Version__c(
            Name = 'Text version',
            Connector__c = c.Id,
            Version_KB__c = sol.Id
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
		//Functional_Matrix_Requirements_Config__c cf = new Functional_Matrix_Requirements_Config__c(
		//	Core_Type__c = 'Core Sales Tax'
		//);
		//insert cf;
		Functional_Checklist__c fc=new Functional_Checklist__c(Name='fc',Version__c=ver.Id);
        insert fc;
        Badge__c b = new Badge__c(Version__c = ver.Id);
        insert b;        
    }
    static testMethod void myUnitTest() {
        Version__c v = [SELECT Id FROM Version__c LIMIT 1];
		PageReference pageRef = Page.VersionClone;
        Test.setCurrentPage(pageRef);
		ApexPages.currentPage().getParameters().put('Id',v.id);
		ApexPages.StandardController stdV = new ApexPages.StandardController(v);        
        VersionClone vc=new VersionClone(stdV);
        vc.subVersion.Name='Test';
        vc.subVersion.Sort_Order__c=1.1;
        vc.saveSubVersion();
        Version__c subV = [SELECT Id,Name FROM Version__c Where Parent_Version__c=:v.Id];
        system.assertEquals('Test', subV.Name);
    }
}