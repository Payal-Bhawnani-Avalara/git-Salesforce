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
		Test.startTest();
         JobProcessSObject job = new JobProcessSObject('Select id from Account',opp.Id);
         ID batchprocessid = Database.executeBatch(job,1);          
		Test.stopTest();        
    }
}