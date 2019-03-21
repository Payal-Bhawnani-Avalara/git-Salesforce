@isTest
public class JobProcessSObjectTest {
    static String subName{get;set;}  	
    @isTest
    public static void testJobProcessSObject(){ 	
	    Account acc = TestFactory.makeAccount();
	    acc.ActiveCustomer__c=true;
	    update acc;
	    Contact con = TestFactory.makeContact( acc );
	    Opportunity opp = TestFactory.makeOpportunity( acc );
	    //opp.SubType__c='Included';
	    //update opp;
	    Connector__c c = new Connector__c(
	        Name = 'Test Connector',
	        Author__c = acc.Id,
	        Managed_By__c = acc.Id
	    );
	    insert c;    
	    Zuora__Subscription__c sub =  new Zuora__Subscription__c();
	    sub.name = 'Test123';
	    subName = sub.name;
	    sub.Zuora__Account__c = acc.Id;
	    sub.Zuora__Status__c='Active';
	    sub.Opportunity__c=opp.Id;
	    sub.Ding__c='true';
	    sub.Zuora__ContractEffectiveDate__c=Date.today();
		upsert sub;
		Test.startTest();
         JobProcessSObject job = new JobProcessSObject('Select id from Account');
         ID batchprocessid = Database.executeBatch(job,50);         
		Test.stopTest();        
    }
}