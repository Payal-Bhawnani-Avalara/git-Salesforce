public class LeadTriggerHandler extends TriggerHandler {
    //https://jira.avalara.com/browse/IBST-8008
    public static boolean isLeadConverted= false;
    public static boolean afterInsertUpdateExecuted= false;
    //Trigger Handler Methods
    protected override void beforeInsert(){
            beforeInsertUpdate();
    }

    protected override void beforeUpdate(){
            beforeInsertUpdate();
    }
    protected override void afterInsert(){
        if(!afterInsertUpdateExecuted){
            afterInsertUpdate();
        }
    }
    /*
    protected override void beforeDelete(){}

    protected override void afterDelete(){}

    protected override void afterUndelete(){}
    */
   //Helper Methods
  //https://jira.avalara.com/browse/SFCOM-8722?filter=-1
    public void beforeInsertUpdate(){
            //Get partner rep email of all leads where partner is not populated 
            Set<String> setPartnerContactEmails=new Set<String>();
             String EloquaAvalaraCaseSafeID='';
         EloquaAvalaraCaseSafeID =KeyPairValue__c.getInstance('EloquaAvalaraCaseSafeID').Values__c;  
         Set<String> leadEmails=new Set<String>();
        for(Lead l:(List<Lead>)Trigger.new){
                if(String.isNotBlank(l.Email)){
                    leadEmails.add(l.Email);
                }
                l.Partner_Connector_Assigned_Rep__c=null;
             if(l.PartnerName__c!=null && Trigger.isInsert){
               l.Prior_Channel_Partner_Name_Change_Date__c = System.today();  
            }
            if(
                    l.PartnerName__c==null && 
                    l.Portal_Contact__c==null && 
                    String.isNotBlank(l.Partner_Rep_Email__c) && 
                    (Trigger.isInsert || (Trigger.isUpdate && l.Partner_Rep_Email__c.equalsIgnoreCase(((Lead)Trigger.oldMap.get(l.Id)).Partner_Rep_Email__c)==false))
                    ){
                    setPartnerContactEmails.add(l.Partner_Rep_Email__c.trim());
            }
        }
        //get most recent contact where email match with partner rep email
        //if(setPartnerContactEmails.size()>0){
        Set<Id> partnerIDs=new Set<Id>();
        Set<Id> connectorIDs=new Set<Id>();
                Map<String,Contact> mapPartnerContacts=new Map<String,Contact>();
                for(Contact c:[Select Id,AccountId,Email From Contact 
                                Where Email!=null AND AccountId!=null AND Email=:setPartnerContactEmails 
                                Order By CreatedDate DESC]){
                String key=c.Email.toLowerCase();
                if(!mapPartnerContacts.containsKey(key)){
                        mapPartnerContacts.put(key,c);
                }
                }
                Set<String> forgottonEmails=new Set<String>();
                for(Individual i:[Select Email__c From Individual Where Email__c=:leadEmails AND ShouldForget=true]){
                    forgottonEmails.add(i.Email__c.toLOwerCase());
                }
            for(Lead l:(List<Lead>)Trigger.new){
                if(String.isNotBlank(l.Email) && forgottonEmails.contains(l.Email.toLowerCase())){
                    l.addError(Constants.LEAD_CANNOT_INSERT_UPDATE_LEAD_FOR_GDPR);
                }            	
                if(
                        String.isNotBlank(l.Partner_Rep_Email__c) &&
                        mapPartnerContacts.containsKey(l.Partner_Rep_Email__c.toLowerCase())
                        ){
                            Contact c=mapPartnerContacts.get(l.Partner_Rep_Email__c.toLowerCase());
                            l.PartnerName__c=c.AccountId;
                            l.Portal_Contact__c=c.Id;
                            l.Prior_Channel_Partner_Name_Change_Date__c = System.today();
                        }
                        else if(
                                String.isNotBlank(l.Partner_Rep_Email__c) && 
                                (Trigger.isInsert || (Trigger.isUpdate && l.Partner_Rep_Email__c.equalsIgnoreCase(((Lead)Trigger.oldMap.get(l.Id)).Partner_Rep_Email__c)==false))
                                ){
                                    if(l.Partner_Contact_Not_Found_Email_Sent__c==null){
                                        l.Partner_Contact_Not_Found_Email_Sent__c=0;
                                    }
                                    l.Partner_Contact_Not_Found_Email_Sent__c+=1;                                   
                                }
                    if(l.PartnerName__c!=null && l.Connector__c!=null){
                        partnerIDs.add(l.PartnerName__c);
                        connectorIDs.add(l.Connector__c);
                    }
                    //https://jira.avalara.com/browse/IBST-7371
                //Devloper : Payal Bhawnani 02/20/2018
                    if(l.Prior_Channel_Partner_Name_Change_Date__c != null && Trigger.isUpdate  ){
                   Integer monthsBetween = l.Prior_Channel_Partner_Name_Change_Date__c.monthsBetween(system.today());
                   if(l.PartnerName__c!=null &&  l.PartnerName__c != ((Lead)Trigger.oldMap.get(l.Id)).PartnerName__c && monthsBetween>=6 && system.UserInfo.getUserId() ==EloquaAvalaraCaseSafeID){
                     l.Prior_Channel_Partner_Name_Change_Date__c = System.today();
                     l.PriorChannelPartnerName__c =  ((Lead)Trigger.oldMap.get(l.Id)).PartnerName__c ;
                    }
                else if(l.PartnerName__c!=null && monthsBetween <6 && ((Lead)Trigger.oldMap.get(l.Id)).PartnerName__c !=null && l.PartnerName__c != ((Lead)Trigger.oldMap.get(l.Id)).PartnerName__c && system.UserInfo.getUserId() ==EloquaAvalaraCaseSafeID){
                     l.ChangedChannelPartnerName__c= l.PartnerName__c;
                     l.PartnerName__c = ((Lead)Trigger.oldMap.get(l.Id)).PartnerName__c;
                     l.Channel_Partner_Name_Update_6__c = true;
                   }else if(l.PartnerName__c!=null &&  l.PartnerName__c != ((Lead)Trigger.oldMap.get(l.Id)).PartnerName__c ){
                     l.Prior_Channel_Partner_Name_Change_Date__c = System.today();
                     l.PriorChannelPartnerName__c =  ((Lead)Trigger.oldMap.get(l.Id)).PartnerName__c ;
                    }
                 }
            }
            if(partnerIDs.size()>0){
                    Map<String,Id> mapResellingPartnerRep=new Map<String,Id>();
                    for(Reselling_Partner__c rp:[Select Id,Assigned_Sales_Rep__c,Reselling_Partner__c,Connector__c 
                                                From Reselling_Partner__c 
                                                Where Assigned_Sales_Rep__c!=null AND Reselling_Partner__c=:partnerIDs AND Connector__c=:connectorIDs]){
                        mapResellingPartnerRep.put(''+rp.Reselling_Partner__c+rp.Connector__c,rp.Assigned_Sales_Rep__c);
                    }
                    for(Lead l:(List<Lead>)Trigger.new){
                        if(l.PartnerName__c!=null && l.Connector__c!=null){
                            l.Partner_Connector_Assigned_Rep__c=mapResellingPartnerRep.get(''+l.PartnerName__c+l.Connector__c);
                        }
                    }
            }   
            //BATS-748 Get CampaignMembers related to Contact 
	        List<Lead> updateCon = new  List<Lead>();
	        Set<Id> campID = new  Set<Id>();
	        Set<Id> conId = new Set<Id>();
	        for(Lead con : (List<Lead>)Trigger.new){
	          if(con.Campaign_MostRecent__c != null){
	             campID.add(con.Campaign_MostRecent__c);
	             conId.add(con.id);
	             system.debug('campID>>'+campID);
	             system.debug('conId>>'+conId);
	          }
	        }
	        List<CampaignMember> cmList = [SELECT leadid,contactid,CampaignId,Initial_Response_Date__c,MQL_Date__c FROM CampaignMember WHERE CampaignId IN :campId AND leadid IN: conId AND Initial_Response_Date__c=LAST_N_DAYS:5];
	        Map<String,CampaignMember> mapCM=new Map<String,CampaignMember>();
	  	    for(CampaignMember cm: cmList){
	  		 if(cmList.size()>0 &&cm.CampaignId !=null &&cm.LeadId !=null){
	  		       mapCM.put(''+cm.CampaignId+cm.LeadId,cm); 
	               System.debug('mapCM>>'+mapCM);
	  		 }
	  	    }
	        Map<Id,Lead> oldContactMap;
	        if(Trigger.isUpdate){
	            oldContactMap=(Map<Id,Lead>) Trigger.oldMap;
	        }
	        for(Lead l: (List<Lead>)Trigger.new) {
	            if(String.isNotBlank(l.Status)){
	            	//MQL
	                if((Trigger.isInsert || (Trigger.isUpdate && oldContactMap.get(l.Id).Status!=Constants.LEAD_STATUS_MQL)) && 
	                    l.Status==Constants.LEAD_STATUS_MQL ){
	                    if(mapCM.containsKey(''+l.Campaign_MostRecent__c+l.id) && mapCM.get(''+l.Campaign_MostRecent__c+l.id).Initial_Response_Date__c.date() == Date.today()){
	                      l.MQL_Date_Most_Recent__c = DateTime.now();
	                      mapCM.get(''+l.Campaign_MostRecent__c+l.id).MQL_Date__c =  DateTime.now();
	                      system.debug('con>>'+l);
	                    }
	                }
	                //Working
	                if((Trigger.isInsert || (Trigger.isUpdate && oldContactMap.get(l.Id).Status!=Constants.LEAD_STATUS_WORKING)) && 
	                    l.Status==Constants.LEAD_STATUS_WORKING ){
	                    if(mapCM.containsKey(''+l.Campaign_MostRecent__c+l.id) && mapCM.get(''+l.Campaign_MostRecent__c+l.id).Initial_Response_Date__c.date()>=Date.today().addDays(-5) ){
	                      System.debug('Within 5 days>> '+ Date.today().addDays(-5));
	                      l.Working_Date_Most_Recent__c = DateTime.now();
	                      mapCM.get(''+l.Campaign_MostRecent__c+l.id).Working_Date__c =  DateTime.now();
	                      system.debug('con>>'+l);
	                    }
	                }
	            }
	        }
	        update mapCM.values();                         
        //}
    }
     //https://jira.avalara.com/browse/IBST-8008
     //Devloper : Payal Bhawnani 01/23/2018
     //https://jira.avalara.com/browse/ITBSE-941?filter=-1
     protected override void afterUpdate(){
        //Set<Id> convertedAccIDs=new Set<Id>();
        Map<Id,Lead> oldLeadMap=(Map<Id,Lead>) Trigger.oldMap;
        Map<Id,Lead> mapConvertedAccountLeads=new Map<Id,Lead>();
      for(Lead l:(List<Lead>)Trigger.new) 
       {
          if (l.IsConverted)
          {
            isLeadConverted = true;
          } 
          if (
                l.IsConverted && 
                l.ConvertedAccountId!=null && 
                !oldLeadMap.get(l.Id).IsConverted && 
                ((String.isNotBlank(l.Opportunity_Type__c) && 
                l.Opportunity_Type__c.equalsIgnoreCase('Partner') &&
                String.isNotBlank(l.OpportunitySubType__c)) ||
                String.isNotBlank(l.Partner_Territory__c))
            )
          {
                mapConvertedAccountLeads.put(l.ConvertedAccountId,l);
          }           
       }
       if(mapConvertedAccountLeads!=null && mapConvertedAccountLeads.size()>0){ 
            List<Account> accList=[Select Id,Partner_Category__c,Partner_Territory__c From Account Where Id=:mapConvertedAccountLeads.keySet() AND (Partner_Category__c=null OR Partner_Territory__c=null)];
            for(Account a:accList){
                Lead l=mapConvertedAccountLeads.get(a.Id);
                if(l!=null){
                    if(String.isBlank(a.Partner_Category__c) && (String.isNotBlank(l.OpportunitySubType__c))){
                        if(l.OpportunitySubType__c.equalsIgnoreCase('ACP')){
                            a.Partner_Category__c='Accounting & Consulting Partner';
                        }
                        else if(l.OpportunitySubType__c.equalsIgnoreCase('DSP')){
                            a.Partner_Category__c='Development & Solutions Partner';
                        }
                        else if(l.OpportunitySubType__c.equalsIgnoreCase('MSP')){
                            a.Partner_Category__c='Marketing & Sales Partner';
                        }
                    }
                    if(String.isBlank(a.Partner_Territory__c) && String.isNotBlank(l.Partner_Territory__c)){
                        a.Partner_Territory__c=l.Partner_Territory__c;
                    }                                           
                }
            }
            update accList;
       }
        if(!afterInsertUpdateExecuted){
            afterInsertUpdate();
        }
     } 
     public void afterInsertUpdate(){
        afterInsertUpdateExecuted=true;
        String LeadResponseVelocityOwnerChange='';
     // try{
        LeadResponseVelocityOwnerChange =KeyPairValue__c.getInstance('LeadResponseVelocityOwnerChange').Values__c;     
      //}
     // catch(Exception ex){}           
        List<Lead> leadList=(List<Lead>)Trigger.new;
        Map<Id,Lead> oldLeadMap;
        if(Trigger.isUpdate){
            oldLeadMap=(Map<Id,Lead>) Trigger.oldMap;
        }
        //Get all Response_Velocity records related to leads and keep only latest one in map
        Map<Id,Response_Velocity__c> mapLeadRV=new Map<Id,Response_Velocity__c>();
        for(Response_Velocity__c rv:[Select Id,Lead__c,MQL_Date_Time__c,Assignment_Date_Time__c,Processing_Date_Time__c,Working_Date_Time__c,Opportunity_SubType__c,Nurture_Disqualified_Date_Time__c,Owner_at_Assignment__c,Nurture_Disqualified_Reason__c 
                                    From Response_Velocity__c 
                                    Where Lead__c=:leadList  AND Contact__c=null order by createddate ASC]){
            mapLeadRV.put(rv.Lead__c,rv);
        }
        
        List<Response_Velocity__c> listRV=new List<Response_Velocity__c>();
        for(Lead l:leadList) { 
            if(String.isNotBlank(l.Status)){
                //create new Response Velocity when lead status is MQL and Most Recent Conversion Date = Today
                if(
                    (Trigger.isInsert || (Trigger.isUpdate && oldLeadMap.get(l.Id).Status!=Constants.LEAD_STATUS_MQL)) && 
                    l.Status==Constants.LEAD_STATUS_MQL 
                    /*&&  l.Most_Recent_Conversion_Date__c==Date.today()*/
                  ){ 
                     //listRV.add(new Response_Velocity__c(Lead__c=l.Id,MQL_Date_Time__c=DateTime.now()));
                    Response_Velocity__c newResVel = new Response_Velocity__c();
                    newResVel.Lead__c=l.Id;
                    newResVel.MQL_Date_Time__c = DateTime.now();
                    if(String.isNotBlank(l.OpportunitySubType__c )){
                         newResVel.Opportunity_SubType__c  = l.OpportunitySubType__c ;
                          if(l.OpportunitySubType__c=='AvaTax'){
                            if(l.mk_lead_avatax_score__c !=null){
                               newResVel.MK_Lead_Score__c = l.mk_lead_avatax_score__c;
                            }
                            if(l.mk_customer_fit_avatax_score__c !=null){
	                         newResVel.MK_Customer_Fit_Score__c = l.mk_customer_fit_avatax_score__c;  
                            }
	                    }
	                    else if(l.OpportunitySubType__c=='CertCapture'){
                             newResVel.MK_Lead_Score__c = l.MK_Lead_Score_CC__c;
                            if(l.MK_Lead_Score_CC__c!= null){
                                newResVel.MK_Lead_Score__c = l.MK_Lead_Score_CC__c;
                            }
	                      	if(l.MK_Customer_Fit_Score_CC__c !=null){
	                        newResVel.MK_Customer_Fit_Score__c = l.MK_Customer_Fit_Score_CC__c;
	                       }
	                    }
                    }
                    if(l.Most_Recent_Conversion_Date__c !=null){
                       newResVel.Most_Recent_Conversion_Date__c = l.Most_Recent_Conversion_Date__c;
                    }
                    if(String.isNotBlank(l.Campaign_Most_Recent_ID__c )){
                    	   newResVel.Campaign_Most_recent__c = l.Campaign_Most_Recent_ID__c;
                    }
                     if(String.isNotBlank(l.Offer__c )){
                    	   newResVel.Offer__c = l.Offer__c;
                    }
                    if(String.isNotBlank(l.Method_of_Contact_Lead__c )){
                    	   newResVel.Method_of_Contact__c = l.Method_of_Contact_Lead__c;
                    }
                    listRV.add(newResVel);
                }
                else if(
                        Trigger.isUpdate && 
                        (l.Status!=Constants.LEAD_STATUS_MQL || 
                        (String.valueOf(oldLeadMap.get(l.Id).OwnerId).startsWith('00G') && !String.valueOf(l.OwnerId).startsWith('00G') && !LeadResponseVelocityOwnerChange.contains(String.valueOf(l.OwnerId))) ||
                        (LeadResponseVelocityOwnerChange.contains(String.valueOf(oldLeadMap.get(l.Id).OwnerId)) && !LeadResponseVelocityOwnerChange.contains(String.valueOf(l.OwnerId))  && !String.valueOf(l.OwnerId).startsWith('00G'))
                        )
                        ){
                            Response_Velocity__c rv=mapLeadRV.get(l.Id);
                            if(rv!=null){
                                listRV.add(rv); 
                                if(
                                    Trigger.isUpdate && rv.Assignment_Date_Time__c==null &&
                                    ((String.valueOf(oldLeadMap.get(l.Id).OwnerId).startsWith('00G') && !String.valueOf(l.OwnerId).startsWith('00G') && !LeadResponseVelocityOwnerChange.contains(String.valueOf(l.OwnerId))) ||
                                    (LeadResponseVelocityOwnerChange.contains(String.valueOf(oldLeadMap.get(l.Id).OwnerId)) && !LeadResponseVelocityOwnerChange.contains(String.valueOf(l.OwnerId))  && !String.valueOf(l.OwnerId).startsWith('00G'))
                                )
                                ){
                                    rv.Assignment_Date_Time__c=Datetime.now();
                                    rv.Owner_at_Assignment__c = l.OwnerId;
                                }
                                if(rv.Processing_Date_Time__c==null && l.Status==Constants.LEAD_STATUS_PROCESSING && oldLeadMap.get(l.Id).Status!=Constants.LEAD_STATUS_PROCESSING){
                                    rv.Processing_Date_Time__c=Datetime.now();
                                }
                                if(rv.Working_Date_Time__c==null && l.Status==Constants.LEAD_STATUS_WORKING && oldLeadMap.get(l.Id).Status!=Constants.LEAD_STATUS_WORKING){
                                    rv.Working_Date_Time__c=Datetime.now();
                                } 
                                //Nurture
                                if(rv.Nurture_Disqualified_Date_Time__c==null && l.Status==Constants.LEAD_STATUS_NURTURE  && oldLeadMap.get(l.Id).Status!=Constants.LEAD_STATUS_NURTURE  && ( oldLeadMap.get(l.Id).Status==Constants.LEAD_STATUS_MQL || oldLeadMap.get(l.Id).Status==Constants.LEAD_STATUS_WORKING || oldLeadMap.get(l.Id).Status==Constants.LEAD_STATUS_PROCESSING)){
                                    rv.Nurture_Disqualified_Date_Time__c=Datetime.now();
                                    if( rv.Nurture_Disqualified_Reason__c == null){
                                     rv.Nurture_Disqualified_Reason_Text__c = l.Nurture_Reason__c;
                                    }   
                                } 
                                //disqualified
                                if(rv.Nurture_Disqualified_Date_Time__c==null && l.Status==Constants.LEAD_STATUS_DISQUALIFIED && oldLeadMap.get(l.Id).Status!=Constants.LEAD_STATUS_DISQUALIFIED && ( oldLeadMap.get(l.Id).Status==Constants.LEAD_STATUS_MQL || oldLeadMap.get(l.Id).Status==Constants.LEAD_STATUS_WORKING || oldLeadMap.get(l.Id).Status==Constants.LEAD_STATUS_PROCESSING)){
                                    rv.Nurture_Disqualified_Date_Time__c=Datetime.now();
                                    if( rv.Nurture_Disqualified_Reason__c == null){
                                     rv.Nurture_Disqualified_Reason_Text__c = l.Disqualified_Reason__c;
                                    }   
                                } 
                            }
                }
            }
        }
        upsert listRV;
        List<Response_Velocity__c> listLeadRV=new List<Response_Velocity__c>();
        for(Response_Velocity__c rv:[Select Id,Lead__c,Lead__r.ConvertedContactId,Lead__r.ConvertedOpportunityId
                                    From Response_Velocity__c 
                                    Where Lead__c=:leadList AND Contact__c=null AND Lead__r.IsConverted=true AND Lead__r.ConvertedContactId!=null]){
            rv.Contact__c=rv.Lead__r.ConvertedContactId;
            if(rv.Lead__r.ConvertedOpportunityId !=null){
              rv.Opportunity_Created__c = rv.Lead__r.ConvertedOpportunityId;    
            }                        
            listLeadRV.add(rv);
        }   
        update listLeadRV;      
     } 
}