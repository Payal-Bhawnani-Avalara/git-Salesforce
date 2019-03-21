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
        String strQuery = 'Select Id,Lead_Contact_MQL_Status_Date__c,AccountID,CreatedDate,CampaignId,ownerId,(Select id, Contactid,IsPrimary From OpportunityContactRoles ORDER BY IsPrimary DESC) From Opportunity where Type= \'New\' and isclosed=false' ; 
        return strQuery;
    }
    
    //Batch Start method
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator(strQuery);
    }
  
    global void execute(Database.BatchableContext BC, List<Opportunity> oppList) {
		Set<Id> oppCampaignIDSet = new Set<Id>();
		Set<Id> contactIDSet = new Set<Id>();
		Set<Id> accountIdSet = new Set<Id>();
		Set<Id> oppContactIDSet = new Set<Id>();
		String ZTBuyAPICaseSafeID='';
        ZTBuyAPICaseSafeID =KeyPairValue__c.getInstance('ZTBuyAPICaseSafeID').Values__c;  
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
               //IBST-10221 - Automation should only run if owner is ZTBUY Api
               if(opp.AccountID !=null && opp.ownerid ==ZTBuyAPICaseSafeID){
	       		     accountIdSet.add(opp.AccountID);
	       		     System.debug('AccountID'+opp.AccountID);
               }  
               for(OpportunityContactRole oCR:opp.OpportunityContactRoles){
	               	if(oCR.isPrimary)
	               	{
	               		contactIDSet.add(oCR.Contactid);
	               	}  
	               	    oppContactIDSet.add(oCR.Contactid);
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
  	  
		      /*List<Contact> ConList = [Select id, PrimaryContact__c,Campaign_MostRecent__c,AccountId from Contact where AccountId IN:accountIdSet ];
	  System.debug('ConList'+ConList);
	  Map<Id,List<Contact>> mapCon=new  Map<Id,List<Contact>>();
  	    for(Contact conAcc: ConList){ 
	  	    	if(!mapCon.containsKey(conAcc.AccountId)){
	  	    	   mapCon.pur(conAcc.AccountId,new List<Contact>());
	  	    	}
  		       mapCon.get(conAcc.AccountId).add(conAcc);    
  	    	
  	    }*/
  	  //TECHDEBT: PAYAL 5/21/2018
  	  //https://jira.avalara.com/browse/IBST-10221
  	  //Only if owner is ZTBUY Api
  	  //Even if Contact doest have Campaign 
  	  //Contact is more important than campaign 
  	 /* Map<Id,Account> accMap = new  Map<Id,Account>([Select id,(Select id, PrimaryContact__c from Contacts ORDER BY PrimaryContact__c DESC ) from Account where id IN:accountIdSet]);
  	  List<Contact> conList = new  List<Contact>();
  	  for( Account acc : accMap.values()){
  	      conList.addAll(acc.Contacts);
  	  }
  	  List<CampaignMember> allContactCmList = [select CampaignId,ContactId,status,IsIRDUpdatedByTrigger__c from CampaignMember where ContactId IN :conList ORDER BY LastModifiedDate DESC];    
	  Map<Id,List<CampaignMember>> conCM = new  Map<Id,List<CampaignMember>>();
	  for(CampaignMember cm : allContactCmList ){
	     if(!conCM.containsKey(cm.ContactId)){
	       conCM.put(cm.ContactId,new  List<CampaignMember>());
	     }
	      conCM.get(cm.ContactId).add(cm);
	  }
	  if(accMap!=null && accMap.size()>0){
	    //List <OpportunityContactRole> listOCRAccount = new  List <OpportunityContactRole>();
	    for(Opportunity opp: oppList){
	      if(opp.AccountId!=null && accMap.containsKey(opp.AccountId)){
	      	 if(opp.OpportunityContactRoles.size()<=0 && accMap.get(opp.AccountId).Contacts.size() >0 && accMap.get(opp.AccountId).Contacts[0].PrimaryContact__c==true){
		       //Create OCR as Preimary Contact with Contact from Account with PrimaryContact = true
		      	OpportunityContactRole ocr = new OpportunityContactRole(ContactId=accMap.get(opp.AccountId).Contacts[0].Id,OpportunityId=opp.Id,Role='Decision Maker',IsPrimary=true);
				listOCR.add(ocr);
				System.debug('Create new Account>>>'+opp.OpportunityContactRoles.size());
	         }
            /*Update CampaignId on Opporutnity from Contacts present in OCR 
	      	if(opp.CampaignId ==null){
	          for(OpportunityContactRole oCR:opp.OpportunityContactRoles){
	      		if(conCM.containsKey(ocr.contactId)){
	      		    //opp.CampaignId = conCM.get(ocr.contactId)[0].CampaignId;
	      		    break;
	      		}
	          }     
	      }
          //Update CampaignId on Opporutnity from Contacts present in Account related to Opportunity
	      if(opp.CampaignId ==null){
	      	if(accMap.get(opp.AccountId).Contacts.size() >0 && accMap.get(opp.AccountId).Contacts[0].PrimaryContact__c==true  && conCM.containsKey(accMap.get(opp.AccountId).Contacts[0].Id)){
	      	   //opp.CampaignId = conCM.get(accMap.get(opp.AccountId).Contacts[0].Id)[0].CampaignId;
             
	      	}
	     }*/
	     
  		/* System.debug('ConList'+ConList);
        OpportunityContactRole ocr = new OpportunityContactRole(ContactId=mapCon.get(opp.AccountId).id,OpportunityId=opp.Id,Role='Decision Maker',IsPrimary=true);
        listOCR.add(ocr);
        if(mapCon.get(opp.AccountId).Campaign_MostRecent__c !=null && opp.CampaignId ==null){
         opp.CampaignId = mapCon.get(opp.AccountId).Campaign_MostRecent__c;
        }
	    }
	   }
	  if(listOCR.size()>0){
           database.upsert(listOCR,false);         
      }
	 }*/
      //IBST-10186 MQL Date Logic 
  	  //check mapping also
	 /* Map<Id,Contact> conMQLList =new Map<Id,Contact>([Select id,MQL_Status_Date__c from Contact where id IN: oppContactIDSet AND MQL_Status_Date__c!=null ORDER By MQL_Status_Date__c ASC ]);
	   for(Opportunity opp: oppList){
	   	if(opp.Lead_Contact_MQL_Status_Date__c == null){
	   	 for(OpportunityContactRole oCR:opp.OpportunityContactRoles){
	   	 	if(conMQLList.containsKey(ocr.contactId)){
	   	 	    opp.Lead_Contact_MQL_Status_Date__c = conMQLList.get(ocr.contactId).MQL_Status_Date__c;
	   	 	    break;
	   	 	}
	   	 }
	   	}
	   }
  	  if(oppList.size()>0){
  	   	 try{
  	   	 database.update(oppList,false);
  	  	}catch(Exception ex){
      		  // Save logs in ApexLog__c Object 
               Utility.createApexLog('JobProcessOpportunity','failed',1,oppList.size(),'BatchClass',1,ex.getmessage()+oppList,true);
               //String className, String status, Integer JobItemsProcessed, Integer TotalJobItems,String LogType, Integer NumberOfErrors,String message,Boolean insertObj
         } 
  	   } */
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
         ID batchprocessid = Database.executeBatch(job,50); 
    }
}