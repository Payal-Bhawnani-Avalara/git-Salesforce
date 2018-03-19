//Jira Ticket :https://jira.avalara.com/browse/IBST-4709?filter=-1
//TECHDEBT: PAYAL 9/15/2017
//This class will make Opportunity Contact Role Primary if Opportunity has only one contact role 
/*CRON :JobProcessOpportunity m = new JobProcessOpportunity();
        String seconds = '0'; //Execute at Zero Seconds
        String minutes = '0'; //Execute at every 0 minute of hour
        String hours = '01'; // Execute at 1 AM
        String dayOfMonth = '*'; // Execute Every Day of the Month
        String month = '*'; //Execute every Month
        String dayOfWeek = '?'; //Execute on all 7 days of the Week
        ID oppbatchprocessid = Database.executeBatch(m,200);  
        
        //Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        String sch = seconds + ' ' + minutes + ' ' + hours + ' ' + dayOfMonth + ' ' + month + ' ' + dayOfWeek;
        //String sch = '0 0 01 * * ?';
        system.schedule('JobProcessOpportunity Run Everyday at 1am', sch, m);  */
global class JobProcessOpportunity implements Database.Batchable<sObject>, Schedulable, Database.Stateful {

    //Variable Section
    global FINAL String strQuery;
    global List<String> errorMessages = new List<String>();
    
    global JobProcessOpportunity() { 
         this.strQuery = getBatchQuery();
    }
    
    //Returns the Query String to Batch constructor to fetch right records.
    // code for test run from navees 
    //how to schedule code from navees 
    
    private String getBatchQuery()  {
           //query related Opportunity Contact roles from Opportunity 
           //test.isRunningTest(){}
        String strQuery = 'Select Id,CreatedDate,CampaignId,(Select id, Contactid,IsPrimary From OpportunityContactRoles) From Opportunity where Type= \'New\''; 
        return strQuery;
    }
    
    //Batch Start method
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator(strQuery);
    }
  
    global void execute(Database.BatchableContext BC, List<Opportunity> oppList) {
    		Set<Id> oppCampaignIDSet = new Set<Id>();
    		Set<Id> contactIDSet = new Set<Id>();
        if(oppList!=null && oppList.size()>0){
            List <OpportunityContactRole> listOCR = new  List <OpportunityContactRole>();
            for(Opportunity opp: oppList) {
                if(opp.OpportunityContactRoles.size()==1 &&  !opp.OpportunityContactRoles[0].isPrimary)
               {
                   opp.OpportunityContactRoles[0].isPrimary = true;
                   listOCR.addAll(opp.OpportunityContactRoles) ;
               }
                if(opp.CampaignId !=null){
       		    oppCampaignIDSet.add(opp.campaignId);
               }  
               for(OpportunityContactRole oCR:opp.OpportunityContactRoles){
               	if(oCR.isPrimary)
               	{
               		contactIDSet.add(oCR.Contactid);
               	}        
               }     
           }
           
            update listOCR;
          //Developer: Payal Bhawnani
          //https://jira.avalara.com/browse/IBST-5831
          List<CampaignMember> cmList = [select CampaignId,ContactId,status,IsIRDUpdatedByTrigger__c from CampaignMember where campaignId IN  :oppCampaignIDSet AND ContactId IN :contactIDSet];
  	      Map<String,CampaignMember> mapCM=new Map<String,CampaignMember>();
  	      for(CampaignMember cm: cmList){
  		    if(cmList.size()>0 &&cm.CampaignId !=null &&cm.ContactId !=null && cm.status=='sent'){
  		       mapCM.put(''+cm.CampaignId+cm.ContactId,cm); 
  		    }
  	      }
  	      
  	       for(Opportunity opp: oppList) {
  	       	 if(opp.OpportunityContactRoles.size()==1 && opp.CampaignId!=null && cmList.size()>0 && mapCM.containsKey(''+opp.CampaignId+opp.OpportunityContactRoles[0].Contactid))
            {
            	 CampaignMember cm=	mapCM.get(''+opp.CampaignId+opp.OpportunityContactRoles[0].Contactid);
              cm.Status = 'Responded';
              cm.Initial_Response_Date__c = opp.CreatedDate.addMinutes(-1);  
               cm.IsIRDUpdatedByTrigger__c = true;
              //cmList.add(cm);              
            } 
            else if(opp.OpportunityContactRoles.size()==1 && opp.CampaignId!=null && cmList.size()<=0 && opp.OpportunityContactRoles[0].isPrimary)
          	{
                CampaignMember cmNew = new CampaignMember(CampaignId = opp.CampaignId,status='Responded',ContactId = opp.OpportunityContactRoles[0].Contactid,
                                               Initial_Response_Date__c = opp.CreatedDate.addMinutes(-1),IsIRDUpdatedByTrigger__c = true);
                cmList.add(cmNew);
            } 	
  	       }
  	      
  	       if(cmList.size()>0){
           database.upsert(cmList);
  	       }
        }
    }  

    //Batch Finish method for after execution of batch work custom object"ApexLog" for log fields  : log type,  : Object = ApexLog__c 
    //Utility class : utility method : pass parameters to that function create records on object 
    global void finish(Database.BatchableContext BC) { 
         AsyncApexJob aaj = [Select Id, Status, NumberOfErrors, JobItemsProcessed, MethodName, TotalJobItems, CreatedBy.Email from AsyncApexJob where Id =:BC.getJobId()];
        
        // Save logs in ApexLog__c Object 
         Utility.createApexLog('JobProcessOpportunity',aaj.Status,aaj.JobItemsProcessed,aaj.TotalJobItems,'BatchClass',aaj.NumberOfErrors);
        
    }
    
    //Method which schedules the JobProcessOpportunity 
    global void execute(SchedulableContext sc) {
         JobProcessOpportunity job = new JobProcessOpportunity();
         ID batchprocessid = Database.executeBatch(job,200); 
    }
}