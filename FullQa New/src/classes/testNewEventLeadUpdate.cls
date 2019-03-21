@isTest 

private class testNewEventLeadUpdate {
    
    static testMethod void testNewEventLeadUpdate(){
        TestUtil t=new TestUtil();//this will create all custom settings
        Lead l = new Lead();
        l.FirstName =  'NewEventLeadUpdateTest';
        l.LastName = 'NewEventLeadUpdateTest';
        l.Company = 'NewEventLeadUpdateTest';
        l.LeadSource = 'Marketing';
        insert l;
        
        Lead testLead = [select Id, FirstName, LastName, Company, LeadSource, ISEvent_Date__c from Lead where FirstName='NewEventLeadUpdateTest' order by CreatedDate desc LIMIT 1];
      
        System.assertNotEquals(testLead, null, 'Test Lead was null and not inserted correctly');
        System.assertEquals(testLead.IsEvent_Date__c, null,'Test Lead Event Date was not null on original insert');
        
        User jeffoUser = [select Id, FirstName, LastName from User where LastName='Wiggins' and FirstName='Clay' LIMIT 1];
        Event e = new Event();
        e.Subject = 'NewEventLeadUpdateTest';
        e.WhoId = testLead.Id;
        e.OwnerId = jeffoUser.Id;
        e.DurationInMinutes = 60;
        e.ActivityDateTime = datetime.Now();
        insert e;
      
        testLead = [select Id, FirstName, LastName, Company, LeadSource, ISEvent_Date__c from Lead where FirstName='NewEventLeadUpdateTest' order by CreatedDate desc LIMIT 1];
        System.assertNotEquals(testLead.IsEvent_Date__c, null,'Test lead Event Date was null after event added');     
        
    }
}