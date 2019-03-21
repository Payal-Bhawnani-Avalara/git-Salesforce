@isTest
public class JobProcessAccountsTest {
    static String subName{get;set;}    
    @isTest
    public static void testJobProcessSObject(){   
      Account acc = TestFactory.makeAccount();
      acc.ActiveCustomer__c=true;
      update acc;
      Account acc1 = TestFactory.makeAccount();
      update acc1;      
      Contact con = TestFactory.makeContact( acc );
      Opportunity opp = TestFactory.makeOpportunity( acc );
      opp.SubType__c='Included';
      opp.Type='New';
      update opp;
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
     // sub.Opportunity__c=opp.Id;
      sub.Ding__c='true';
      sub.Zuora__ContractEffectiveDate__c=Date.today();
      sub.Zuora__SubscriptionEndDate__c=Date.today().addDays(20);
        upsert sub;
        
sub =  new Zuora__Subscription__c();
      sub.name = 'Test123';
      subName = sub.name;
      sub.Zuora__Account__c = acc.Id;
      sub.Zuora__Status__c='Active';
     // sub.Opportunity__c=opp.Id;
      sub.Ding__c='true';
      sub.Zuora__ContractEffectiveDate__c=Date.today();
      sub.Zuora__SubscriptionEndDate__c=Date.today().addDays(20);
        upsert sub;        
                system.debug('====='+[Select Id,Zuora__Account__c,Opportunity__c, Opportunity__r.Type,Zuora__Status__c,Zuora__SubscriptionEndDate__c From Zuora__Subscription__c]);
        Test.startTest();

         JobProcessAccounts job = new JobProcessAccounts('Select id from Account');
         ID batchprocessid = Database.executeBatch(job,50);    
         delete sub;  
          job = new JobProcessAccounts('Select id from Account');
          batchprocessid = Database.executeBatch(job,50);
        
JobProcessAccounts m = new JobProcessAccounts('Select id from Account');
        String seconds = '0'; //Execute at Zero Seconds
        String minutes = '5'; //Execute at every 0 minute of hour
        String hours = '12'; // Execute at 1 AM
        String dayOfMonth = '*'; // Execute Every Day of the Month
        String month = '*'; //Execute every Month
        String dayOfWeek = '?'; //Execute on all 7 days of the Week
        //ID oppbatchprocessid = Database.executeBatch(m,200);  
        
        //Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        String sch = seconds + ' ' + minutes + ' ' + hours + ' ' + dayOfMonth + ' ' + month + ' ' + dayOfWeek;
        //String sch = '0 0 01 * * ?';
        system.schedule('JobProcessAccounts TEST Run Everyday at 12:05pm', sch, m);        
        
    Test.stopTest();        
    }
}