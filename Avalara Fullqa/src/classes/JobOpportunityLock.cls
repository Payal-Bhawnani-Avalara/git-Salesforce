global class JobOpportunityLock  implements Database.Batchable<sObject>, Schedulable, Database.Stateful{
	global Set<Id> setFOCE;
    public JobOpportunityLock(Set<Id> tempsetFOCE){
        setFOCE=tempsetFOCE;
    }	
    global void execute(SchedulableContext sc) {
         JobOpportunityLock job = new JobOpportunityLock(null);
         ID batchprocessid = Database.executeBatch(job,1); 
    }
    global Database.QueryLocator start(Database.BatchableContext BC) {
    		Set<Id> tempsetFOCE=setFOCE;
    		String query='Select Id from Opportunity where Finance_Operations_Close_Event__c=:tempsetFOCE AND (Locked__c=false OR EDW_Booking_Freeze_Date__c=NULL)';
        return Database.getQueryLocator(query);
    }
  
    global void execute(Database.BatchableContext BC, List<Opportunity> objList) {
    		if(objList!=null && objList.size()>0){
    			objList=[Select Id,Locked__c,EDW_Booking_Freeze_Date__c,Finance_Operations_Close_Event__r.EDW_Booking_Freeze_Date__c from Opportunity where Id=:objList AND (Locked__c=false OR EDW_Booking_Freeze_Date__c=NULL)];
    			for(Opportunity o:objList){
    				o.Locked__c=true;
    				o.EDW_Booking_Freeze_Date__c=o.Finance_Operations_Close_Event__r.EDW_Booking_Freeze_Date__c;
    			}
    			update objList;
    		}
    }    
    global void finish(Database.BatchableContext BC) { 
        
    }      
}