@isTest
private class JobProcessRollupTest {
	 @testSetup static void setup() {
        Account acc;
        Opportunity opp;    	
        Id customerAccountTypeId = [SELECT Id FROM RecordType WHERE DeveloperName = 'EMEA_Account' LIMIT 1].Id;
        acc = TestUtil.createAccount(customerAccountTypeId, 1, true)[0];
        //Create an Opportunity record
        Id defaultOppRecTypeId = [SELECT Id FROM RecordType WHERE DeveloperName = 'Default_OppRecType' LIMIT 1].Id;
        opp = TestUtil.createOpportunity(acc.id, defaultOppRecTypeId, 1, false)[0];
        opp.Amount = 1000;
        opp.PartnerName__c=acc.Id;
        opp.SubType__c = 'Upgrade';
        opp.BookedValue__c = 1000;
        insert opp;    
        Rollup__c r=new Rollup__c(Object_API_Name__c='Account',Relationship_Id_Field__c='PartnerName__c',Destination_Field_API_Name__c='Total_Revenue__c',Aggregate_Field_Alias__c='Total_Revenue__c',Batch_Size__c=50,SOQL_Query__c='select PartnerName__c,sum(BookedValue__c) Total_Revenue__c from Opportunity Where PartnerName__c!=null Group By PartnerName__c',Child_Object_API_Name__c='Opportunity');
        insert r; 	 	
	 }
    static testMethod void test1() {
 
        Test.startTest();
        JobProcessRollup.runJobNow(); 
         Test.stopTest();      
    }
    static testMethod void test2() {
 
        Test.startTest();
       
		JobProcessRollup m = new JobProcessRollup('Select Name,count(Id) from User group by Name limit 0',null,null,null,null,null);
        String seconds = '0'; //Execute at Zero Seconds
        String minutes = '0'; //Execute at every 0 minute of hour
        String hours = '02'; // Execute at 1 AM
        String dayOfMonth = '*'; // Execute Every Day of the Month
        String month = '*'; //Execute every Month
        String dayOfWeek = '?'; //Execute on all 7 days of the Week
        ID oppbatchprocessid = Database.executeBatch(m,200);  
        
        //Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        String sch = seconds + ' ' + minutes + ' ' + hours + ' ' + dayOfMonth + ' ' + month + ' ' + dayOfWeek;
        //String sch = '0 0 01 * * ?';
        system.schedule('JobProcessRollup Run Everyday at 2am', sch, m);  
         Test.stopTest();      
    }    
}