public class SendNotificationOnOppWonTest {
 
    static testMethod void testTrigger(){
      
        RecordType customerType= [select id,name from RecordType where name='Customer Account Type' limit 1];
        Account acct = new Account(Name='Test Account',RecordType=customerType,Type__c='Customer');
        insert acct;
        User usr= [select id,name from User where IsActive=True limit 1];
 
        Opportunity opp = new Opportunity(Type='New',Amount=123,CloseDate=date.newInstance(2070, 12, 31), Name = 'TestOpp',StageName = 'Closed Lost',ClosedLostReason__c='Other');
        insert opp;
         opp.AccountId = acct.Id;
        opp.OwnerId=usr.Id;
        opp.StageName = 'Closed Won';
        update opp;
        //Account wonAccount = [select name from account where id=:opp.AccountId limit 1];
        //User wonUser = [select name from User where id=:opp.OwnerId limit 1];
        //Decimal dollars= opp.Amount.intValue();
    }
}