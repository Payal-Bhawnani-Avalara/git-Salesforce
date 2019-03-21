//Jira Ticket :IBST-10879
//TECHDEBT: PAYAL 5/29/2018
//This class will Update line item booked date stamping routing to be called 10 min after condition met
/*CRON :JobProcessOpportunityLineItem m = new JobProcessOpportunityLineItem();
        String seconds = '0'; //Execute at Zero Seconds
        String minutes = '15'; //Execute at every 10 minute of hour
        String hours = '*'; // Execute at 1 AM
        String dayOfMonth = '*'; // Execute Every Day of the Month
        String month = '*'; //Execute every Month
        String dayOfWeek = '?'; //Execute on all 7 days of the Week
        ID oppbatchprocessid = Database.executeBatch(m,200);  
        
        //Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        String sch = seconds + ' ' + minutes + ' ' + hours + ' ' + dayOfMonth + ' ' + month + ' ' + dayOfWeek;
        //String sch = '0 10 * * * ?';
        system.schedule('JobProcessOpportunityLineItem Run Every 15 minute', sch, m);  */
        
        /*CRON :JobProcessOpportunityLineItem m = new JobProcessOpportunityLineItem();
        String seconds = '0'; //Execute at Zero Seconds
        String minutes = '30'; //Execute at every 10 minute of hour
        String hours = '*'; // Execute at 1 AM
        String dayOfMonth = '*'; // Execute Every Day of the Month
        String month = '*'; //Execute every Month
        String dayOfWeek = '?'; //Execute on all 7 days of the Week
        ID oppbatchprocessid = Database.executeBatch(m,200);  
        
        //Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        String sch = seconds + ' ' + minutes + ' ' + hours + ' ' + dayOfMonth + ' ' + month + ' ' + dayOfWeek;
        //String sch = '0 10 * * * ?';
        system.schedule('JobProcessOpportunityLineItem Run Every 30 minute', sch, m);  */
        
           /*CRON :JobProcessOpportunityLineItem m = new JobProcessOpportunityLineItem();
        String seconds = '0'; //Execute at Zero Seconds
        String minutes = '45'; //Execute at every 10 minute of hour
        String hours = '*'; // Execute at 1 AM
        String dayOfMonth = '*'; // Execute Every Day of the Month
        String month = '*'; //Execute every Month
        String dayOfWeek = '?'; //Execute on all 7 days of the Week
        ID oppbatchprocessid = Database.executeBatch(m,200);  
        
        //Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        String sch = seconds + ' ' + minutes + ' ' + hours + ' ' + dayOfMonth + ' ' + month + ' ' + dayOfWeek;
        //String sch = '0 10 * * * ?';
        system.schedule('JobProcessOpportunityLineItem Run Every 45 minute', sch, m);  */
        
          /*CRON :JobProcessOpportunityLineItem m = new JobProcessOpportunityLineItem();
        String seconds = '0'; //Execute at Zero Seconds
        String minutes = '0'; //Execute at every 10 minute of hour
        String hours = '*'; // Execute at 1 AM
        String dayOfMonth = '*'; // Execute Every Day of the Month
        String month = '*'; //Execute every Month
        String dayOfWeek = '?'; //Execute on all 7 days of the Week
        ID oppbatchprocessid = Database.executeBatch(m,200);  
        
        //Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        String sch = seconds + ' ' + minutes + ' ' + hours + ' ' + dayOfMonth + ' ' + month + ' ' + dayOfWeek;
        //String sch = '0 10 * * * ?';
        system.schedule('JobProcessOpportunityLineItem Run Every 60 minute', sch, m);  */
        
global class JobProcessOpportunityLineItem implements Database.Batchable<sObject>,Schedulable, Database.Stateful {
   //Variable Section
   //global Set<Id> oppIds;
   public String strQuery {get;set;}
   
   //Constructor
   public JobProcessOpportunityLineItem(){
         this.strQuery=getBatchQuery();
       /*if(tempsetIDs!=null){
      if(oppIds==null){
        oppIds=new Set<Id>();
      }
      oppIds.addAll(tempsetIDs);
    }*/
    }
    
    //Returns the Query String to Batch constructor to fetch right records.
    private String getBatchQuery()  {
        //query related Opportunity Contact roles from Opportunity 
        //test.isRunningTest(){}
        //System.debug('oppId==='+oppIDs);
        //Sort by Oppid 
        String strQuery = 'Select Id,OpportunityId,ConnectorID__c,Opportunity.PROS_Order_Quote__r.BillToContact__c,Opportunity.PROS_Order_Quote__c,Opportunity.AccountID,Opportunity.Booked_Date__c,CX911_Opportunity_Line_Item_Booked_Date__c From OpportunityLineItem where Opportunity.Booked_Date__c >= YESTERDAY ORDER BY Opportunity.Booked_Date__c DESC '; 
        return strQuery;
    }
    //Batch Start method
    global Database.QueryLocator start(Database.BatchableContext BC) {
         //System.debug('oppId==='+oppIDs);
       System.debug('query==='+strQuery);
       return Database.getQueryLocator(strQuery);
    }
    
    global void execute(Database.BatchableContext BC, List<OpportunityLineItem> oppLineItemList) {
      List<OpportunityLineItem> lstOLIToUpdate = new  List<OpportunityLineItem>();
        Map<String,Connector_of_Interest__c> mapOppCOI =new Map<String,Connector_of_Interest__c>();
        List<Connector_of_Interest__c> cOIListToUpdate = new   List<Connector_of_Interest__c>();
        Set<Id> oppIds = new Set<Id>();
        for(OpportunityLineItem oli:oppLineItemList){
            oppIds.add(oli.OpportunityId);
        }
        for(Connector_of_Interest__c cOI :[Select id,Account__c,Connector__c,Contact__c,Lead__c,Opportunity__c,Order__c from Connector_of_Interest__c where Opportunity__c =:oppIds AND  Connector__c != null]){
                 mapOppCOI.put(''+cOI.Connector__c+cOI.Opportunity__c,cOI); 
         }
        
         if(oppLineItemList!=null && oppLineItemList.size()>0){
          for(OpportunityLineItem oli:oppLineItemList){
             if(oli.CX911_Opportunity_Line_Item_Booked_Date__c!=oli.Opportunity.Booked_Date__c){
                oli.CX911_Opportunity_Line_Item_Booked_Date__c=oli.Opportunity.Booked_Date__c;
                lstOLIToUpdate.add(oli);
             }
              if( oli.ConnectorID__c != null && mapOppCOI.containsKey(''+oli.ConnectorID__c+oli.OpportunityID) && oli.Opportunity.PROS_Order_Quote__c != null){
                 if(mapOppCOI.containsKey(''+oli.ConnectorID__c+oli.OpportunityID)){
                    mapOppCOI.get(''+oli.ConnectorID__c+oli.OpportunityID).Order__c=oli.Opportunity.PROS_Order_Quote__c;
                    cOIListToUpdate.add( mapOppCOI.get(''+oli.ConnectorID__c+oli.OpportunityID));
                 }else{
                    Connector_of_Interest__c cOIOrderNew = new Connector_of_Interest__c(Account__c =oli.Opportunity.AccountID,Connector__c =oli.ConnectorID__c,Opportunity__c= oli.OpportunityID,Contact__c=oli.Opportunity.PROS_Order_Quote__r.BillToContact__c,Order__c = oli.Opportunity.PROS_Order_Quote__c);
                     cOIListToUpdate.add(cOIOrderNew);        
                 }   
              }
          }
         Database.SaveResult[] dsrList=Database.update(lstOLIToUpdate,false);
         //Database.UpsertResult[] dsrListCOI = Database.upsert(cOIListToUpdate,false);
         Utility.createApexLog('JobProcessOpportunityLineItem ', dsrList,true);
        }
    }
    //Batch Finish method for after execution of batch work custom object"ApexLog" for log fields  : log type,  : Object = ApexLog__c 
    //Utility class : utility method : pass parameters to that function create records on object 
    global void finish(Database.BatchableContext BC) { 
         AsyncApexJob aaj = [Select Id, Status, NumberOfErrors, JobItemsProcessed, MethodName, TotalJobItems, CreatedBy.Email from AsyncApexJob where Id =:BC.getJobId()];
        // Save logs in ApexLog__c Object 
        Utility.createApexLog('JobProcessOpportunityLineItem',aaj.Status,aaj.JobItemsProcessed,aaj.TotalJobItems,'BatchClass',aaj.NumberOfErrors);
    }
     //Method which schedules the JobProcessOpportunityLineItem 
     global void execute(SchedulableContext sc) {
         JobProcessOpportunityLineItem job = new JobProcessOpportunityLineItem();
         ID batchprocessid =Database.executeBatch(job,100);
    }
}