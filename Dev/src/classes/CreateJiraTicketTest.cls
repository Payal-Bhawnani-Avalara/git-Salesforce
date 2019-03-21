@isTest
public class CreateJiraTicketTest {
    public static testMethod void testCreateTicket(){
		Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
		Account a =TestUtil.createAccount(customerAccountTypeId,1,true)[0];
        //create Opportunity
        Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
        Opportunity o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,true)[0];  
		Test.StartTest(); 

        ApexPages.currentPage().getParameters().put('eid', o.Id);
        CreateJiraTicket  cjt = new CreateJiraTicket();
        cjt.createTicket();
		Test.StopTest();        
    }
}