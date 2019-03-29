public with sharing class FinanceOperationCloseEventTriggerHandler  extends TriggerHandler{
    protected override void afterUpdate(){
    		if(Trigger.new!=null && Trigger.new.size()>0){
    			Set<Id> setIDs=new Set<Id>();
    			for(Finance_Operations_Close_Event__c foce:(List<Finance_Operations_Close_Event__c>)Trigger.new){
    				if(foce.EDW_Booking_Freeze_Date__c!=null){
    					setIDs.add(foce.Id);
    				}
    			}
		    if(setIDs!=null && setIDs.size()>0 && !System.isBatch() && !System.isFuture() && !System.isQueueable() && !System.isScheduled()){
		         JobOpportunityFreeze job = new JobOpportunityFreeze(setIDs);
		         ID batchprocessid = Database.executeBatch(job,20); 		    	
		    }     			
    		}
   		
    }

}