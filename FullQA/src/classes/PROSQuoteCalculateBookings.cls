public with sharing class PROSQuoteCalculateBookings {
	private CameleonCPQ__Quote__c cpq;
	
    public PROSQuoteCalculateBookings(ApexPages.StandardController stdController) {
        this.cpq = (CameleonCPQ__Quote__c)stdController.getRecord();
    }  
    public void calculateBookings(){
    		if(this.cpq!=null){
    			this.cpq=[Select Id,OpportunityId__c,OpportunityId__r.Locked__c from CameleonCPQ__Quote__c Where Id=:this.cpq.Id];
    			if(!this.cpq.OpportunityId__r.Locked__c){
    				Set<Id> oppIDs=new Set<Id>();
    				oppIDs.add(this.cpq.OpportunityId__c);
    				APIBookings.calculateBookings(oppIDs);
    			}
    		}
    }  
}