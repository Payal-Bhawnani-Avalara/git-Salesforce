//This class will make Opportunity Contact Role Primary if Opportunity has only one contact role 
/*CRON :JobCreateFinanceOperationsCloseEvents m = new JobCreateFinanceOperationsCloseEvents();
        String seconds = '0'; //Execute at Zero Seconds
        String minutes = '30'; //Execute at every 0 minute of hour
        String hours = '*'; // Execute at 1 AM
        String dayOfMonth = '15'; // Execute Every 15 Day of the Month
        String month = '*'; //Execute every Month
        String dayOfWeek = '?'; //Execute on all 7 days of the Week
        //ID oppbatchprocessid = Database.executeBatch(m,200);  
        
        //Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        String sch = seconds + ' ' + minutes + ' ' + hours + ' ' + dayOfMonth + ' ' + month + ' ' + dayOfWeek;
        //String sch = '0 0 01 * * ?';
        system.schedule('JobCreateFinanceOperationsCloseEvents Run Every Month on 15th', sch, m);  */
global class JobCreateFinanceOperationsCloseEvents implements Database.Batchable<sObject>, Schedulable, Database.Stateful {
    global void execute(SchedulableContext sc) {
         JobCreateFinanceOperationsCloseEvents job = new JobCreateFinanceOperationsCloseEvents();
         ID batchprocessid = Database.executeBatch(job,1); 
    }
    global Database.QueryLocator start(Database.BatchableContext BC) {
        //Make sure job executes atleast once
    	String query='select id from user limit 1';
        return Database.getQueryLocator(query);
    }
  
    global void execute(Database.BatchableContext BC, List<SObject> objList) {
    	List<Finance_Operations_Close_Event__c> listFOCE=[Select Id,Booking_Period_Start_Date__c 
                                                          From Finance_Operations_Close_Event__c 
                                                          Where Booking_Period_Start_Date__c>=THIS_MONTH];
        if(listFOCE.size()<5){
            Id recordTypeId =Schema.SObjectType.Finance_Operations_Close_Event__c.getRecordTypeInfosByDeveloperName().get('Monthly_Bookings_Close').getRecordTypeId();
            List<Finance_Operations_Close_Event__c> listFOCENew=new List<Finance_Operations_Close_Event__c>();
            for(Integer i=listFOCE.size();i<5;i++){
                listFOCENew.add(
                                    new Finance_Operations_Close_Event__c( recordTypeId=recordTypeId,
                                                                            Booking_Period_Start_Date__c=Date.today().addMonths(i).toStartofMonth(),
                                                                            Booking_Period_End_Date__c=Date.today().addMonths(i).addMonths(1).toStartofMonth().addDays(-1)
                                                                         )
                                );
            }
            insert listFOCENew;
        }
    }
    global void finish(Database.BatchableContext BC) { 
        
    }    
}