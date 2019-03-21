@isTest
private class ProcessBuilderAPITest {

    static testMethod void testCreateBookingDeltaJiraTicket() {
		Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
		Account a =TestUtil.createAccount(customerAccountTypeId,1,true)[0];
        //create Opportunity
        Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
        Opportunity o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,true)[0];  
        User talendProductionUser=[Select id from User Where Id='00533000003lfbJ'];    
        Test.startTest();
        System.runAs(talendProductionUser){
            o.Amount=1000;
            o.BookedValue__c=2000;
            o.Booked_Date__c=Date.today();
            o.Locked__c=true;
            o.Type='Existing';
            update o;
            ProcessBuilderAPI.createBookingDeltaJiraTicket(new List<Id>{o.Id});
            System.debug('o.Amount======== '+o.Amount);
            System.debug('o.BookedValue__c======== '+o.BookedValue__c);
            System.debug('o.Booked_Delta__c======== '+o.Booked_Delta__c);             
        }
      
        Test.stopTest();
        o=[Select Id,Booked_Delta__c,Amount,BookedValue__c,JIRATicketURL__c,(Select Id,Notes__c From BookingsDelta__r) From Opportunity Where Id=:o.Id];
        System.assertNotEquals(null, o.JIRATicketURL__c);
        System.assertEquals(1, o.BookingsDelta__r.size());
        JobUpdateBookingDeltaRecords job = new JobUpdateBookingDeltaRecords();
        ID batchprocessid = Database.executeBatch(job,99);      
        o=[Select Id,Booked_Delta__c,Amount,BookedValue__c,JIRATicketURL__c,(Select Id,Notes__c,Booking_Issue_Resolved_By__c,Booking_Issue_Resolved_Date__c From BookingsDelta__r) From Opportunity Where Id=:o.Id];
    }
}