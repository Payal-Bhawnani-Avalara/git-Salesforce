global class JobOpportunityLock  implements Database.Batchable<sObject>, Schedulable, Database.Stateful{
//This class will make Opportunity Contact Role Primary if Opportunity has only one contact role 
/*CRON :JobOpportunityLock m = new JobOpportunityLock();
        String seconds = '0'; //Execute at Zero Seconds
        String minutes = '0'; //Execute at every 0 minute of hour
        String hours = '2'; // Execute at 1 AM
        String dayOfMonth = '*'; // Execute Every Day of the Month
        String month = '*'; //Execute every Month
        String dayOfWeek = '?'; //Execute on all 7 days of the Week
        
        //Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        String sch = seconds + ' ' + minutes + ' ' + hours + ' ' + dayOfMonth + ' ' + month + ' ' + dayOfWeek;
        //String sch = '0 0 01 * * ?';
        system.schedule('JobOpportunityLock Run Everyday 2am', sch, m);  */	
    global void execute(SchedulableContext sc) {
         JobOpportunityLock job = new JobOpportunityLock();
         ID batchprocessid = Database.executeBatch(job,20); 
    }
    global Database.QueryLocator start(Database.BatchableContext BC) {
    		String query='select Id,Locked__c,Was_Record_Locked__c,Booked_Date__c From Opportunity where Locked__c=false and Was_Record_Locked__c=true AND Booked_Date__c>=last_year';
        return Database.getQueryLocator(query);
    }
  
    global void execute(Database.BatchableContext BC, List<Opportunity> objList) {
    		if(objList!=null && objList.size()>0){
    			for(Opportunity o:objList){
    				o.Locked__c=true;
    			}
    			update objList;
    		}
    }    
    global void finish(Database.BatchableContext BC) { 
        
    }      
}