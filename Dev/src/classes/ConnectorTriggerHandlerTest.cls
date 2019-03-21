@isTest
private class ConnectorTriggerHandlerTest {
    private static Solution sol;
	private static Connector__c con;
	private static Connector_KB__kav conKB;
	private static Version__c ver;
	private static Account a;
    static testMethod void connectorUpdate() {
        	Test.startTest();
	        	 //Create User
		     //Create an account
	    	     Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
	         a =TestUtil.createAccount(customerAccountTypeId,1,false)[0];
		     //create solution
		     sol = TestUtil.createSolution(1,true)[0];
		     //Create Connector
	         con = TestUtil.createConnector(a.id,a.id,1,false)[0];
	         con.Connector_EcoSystem_Test__c='Test';   
	         insert con;
	         //Create Version
	         ver = TestUtil.createVersion(con.id,sol.id,1,true)[0];
	         //Create ConnectorKB
	         conKB = TestUtil.createConnectorKB(ver.id,sol.id,1,false)[0];
	         conKB.Selling_Information__c = 'Test Knowledge';
	         insert conKB;
	         //Update connectro field 
	         con.Connector_EcoSystem_Test__c='Test Connector';        
	         update con; 
        	Test.stopTest();
	        	Connector_KB__kav knowledge = [SELECT Id,Unique_Identifier__c,Selling_Information__c,Connector__c FROM Connector_KB__kav WHERE Connector__c=:con.id AND  Language = 'en_US' AND PublishStatus ='online' limit 1];
	        	Version__c v=[Select id,Connector__r.Connector_EcoSystem_Test__c from Version__c where id=:ver.id];
	        	System.assertEquals(knowledge.Selling_Information__c,v.Connector__r.Connector_EcoSystem_Test__c );
    }
}