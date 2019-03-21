public with sharing class ProcessBuilderAPI {
	//This code will only work if there are 100 or less than 100 opportunites records to be updated. because SFDC only allows 100 callouts per transaction
	@InvocableMethod(label='createBookingDeltaJiraTicket' description='Create Jira Ticket for specified Opportunity ID.')
    public static void createBookingDeltaJiraTicket(List<Id> opportunityIds){
    		//
    		System.debug('opportunityIds======'+opportunityIds);
    		if(opportunityIds!=null && opportunityIds.size()>0){
    			//JIRATicketURL__c
    			if(!System.isBatch() && !System.isFuture() && !System.isQueueable() && !System.isScheduled()){
		         JobCreateBookingDeltaJiraTicket job = new JobCreateBookingDeltaJiraTicket(opportunityIds);
		         ID batchprocessid = Database.executeBatch(job,22); 
    			}
    		}
    }
    
}