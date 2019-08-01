public with sharing class CreateJiraTicket {
    public PageReference createTicket(){
        String OppId=ApexPages.currentPage().getParameters().get('eid');
        Opportunity o=[Select Id,HasBookingsDelta__c,JIRATicketURL__c,Amount,BookedValue__c from Opportunity Where Id=:OppId]; 
        if(String.isBlank(o.JIRATicketURL__c)){
            List<Id> opportunityIds=new List<Id>();
            opportunityIds.add(o.Id);
            JobCreateBookingDeltaJiraTicket job = new JobCreateBookingDeltaJiraTicket(opportunityIds);
            ID batchprocessid = Database.executeBatch(job,22); 
            BookingsDelta__c bd=new BookingsDelta__c(Opportunity__c =o.Id,	OLD_Amount_SF__c=o.Amount,OLD_Booked_Value_EDW__c=o.BookedValue__c);
            insert bd;            
        }
        PageReference pr=new PageReference('/'+o.Id);
        pr.setRedirect(true);
        return pr;
    }
}