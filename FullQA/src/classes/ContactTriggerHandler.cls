public class ContactTriggerHandler extends TriggerHandler {
    
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

    private void beforeInsertUpdate(){} 

    protected override void afterDelete(){}

    protected override void afterUndelete(){}
    */
    //Helper Methods
    public void beforeInsertUpdate(){
        //Get partner rep email of all contacts where partner is not populated 
        Set<String> setPartnerContactEmails=new Set<String>();
        Set<Id> accountIdContactOwnerUpdate = new Set<ID>();
        String EloquaAvalaraCaseSafeID='';
        //this will only execute for test
        // TODO: Fix custom settin issue
      /*  if(KeyPairValue__c.getInstance('EloquaAvalaraCaseSafeID')==null){
            //Setup custom setting
            List<KeyPairValue__c> listKeyPairValue=new List<KeyPairValue__c>(); 
            listKeyPairValue.add(new KeyPairValue__c(Name='EloquaAvalaraCaseSafeID ',Values__c='00540000000yXrwAAE '));
            insert listKeyPairValue;            
        }     */   
       // EloquaAvalaraCaseSafeID =KeyPairValue__c.getInstance('EloquaAvalaraCaseSafeID').Values__c;  
        Set<String> contactEmails=new Set<String>();
        for(Contact c:(List<Contact>)Trigger.new){
            if(String.isNotBlank(c.Email)){
                contactEmails.add(c.Email);
            }           
            c.Partner_Connector_Assigned_Rep__c=null;
            if(c.Channel_Partner_Name__c!=null && Trigger.isInsert){
                c.Prior_Channel_Partner_Name_Change_Date__c = System.today();
            }
            if(
                c.Channel_Partner_Name__c==null && 
                c.Channel_Partner_Sales_Rep__c==null && 
                String.isNotBlank(c.Partner_Rep_Email__c) && 
                (Trigger.isInsert || (Trigger.isUpdate && c.Partner_Rep_Email__c.equalsIgnoreCase(((Contact)Trigger.oldMap.get(c.Id)).Partner_Rep_Email__c)==false))
            ){
                setPartnerContactEmails.add(c.Partner_Rep_Email__c.trim());
            }
            //https://jira.avalara.com/browse/IBST-8008
            //Devloper : Payal Bhawnani 01/23/2018
            if(!LeadTriggerHandler.isLeadConverted && Trigger.isUpdate ){
                Contact oldCon = (Contact)trigger.oldMap.get(c.Id);
                //https://jira.avalara.com/browse/IBST-11268
                if(c.ContactStatus__c != oldCon.ContactStatus__c  ) {
                    c.Status_Change_Date__c = system.now();
                    if(c.ContactStatus__c =='Working' || c.Cadence_Stage__c == 'Working' ){
                        c.Status_Change_Date_Working__c = system.now();
                    }
                }
                
            }
            // Contact oldCon  = (Contact)trigger.oldMap.get(c.Id);
            if(c.accountid != null ){  
                accountIdContactOwnerUpdate.add(c.AccountId);
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
        for(Individual i:[Select Email__c From Individual Where Email__c=:contactEmails AND ShouldForget=true]){
            forgottonEmails.add(i.Email__c.toLOwerCase());
        }            
        for(Contact c:(List<Contact>)Trigger.new){
            if(String.isNotBlank(c.Email) && forgottonEmails.contains(c.Email.toLowerCase())){
                c.addError(Constants.CONTACT_CANNOT_INSERT_UPDATE_CONTACT_FOR_GDPR);
            }           
            if(
                c.Channel_Partner_Name__c==null && 
                c.Channel_Partner_Sales_Rep__c==null && 
                String.isNotBlank(c.Partner_Rep_Email__c) &&
                mapPartnerContacts.containsKey(c.Partner_Rep_Email__c.toLowerCase())
            ){
                Contact con=mapPartnerContacts.get(c.Partner_Rep_Email__c.toLowerCase());
                c.Channel_Partner_Name__c=con.AccountId;
                c.Channel_Partner_Sales_Rep__c=con.Id;
                c.Prior_Channel_Partner_Name_Change_Date__c = System.today();
            }
            else if(
                c.Channel_Partner_Name__c==null && 
                c.Channel_Partner_Sales_Rep__c==null && 
                String.isNotBlank(c.Partner_Rep_Email__c) && 
                (Trigger.isInsert || (Trigger.isUpdate && c.Partner_Rep_Email__c.equalsIgnoreCase(((Contact)Trigger.oldMap.get(c.Id)).Partner_Rep_Email__c)==false))
            ){
                if(c.Partner_Contact_Not_Found_Email_Sent__c==null){
                    c.Partner_Contact_Not_Found_Email_Sent__c=0;
                }
                c.Partner_Contact_Not_Found_Email_Sent__c+=1;                         
            }
            if(c.Channel_Partner_Name__c!=null && c.Contact_Connector__c!=null){
                partnerIDs.add(c.Channel_Partner_Name__c);
                connectorIDs.add(c.Contact_Connector__c);
            }
            //https://jira.avalara.com/browse/IBST-7371
            //Devloper : Payal Bhawnani 02/20/2018
            if(c.Prior_Channel_Partner_Name_Change_Date__c != null && Trigger.isUpdate  ){
                Integer monthsBetween = c.Prior_Channel_Partner_Name_Change_Date__c.monthsBetween(system.today());
                if(c.Channel_Partner_Name__c!=null &&  c.Channel_Partner_Name__c != ((Contact)Trigger.oldMap.get(c.Id)).Channel_Partner_Name__c && monthsBetween>=6 && system.UserInfo.getUserId() ==EloquaAvalaraCaseSafeID){
                    c.Prior_Channel_Partner_Name_Change_Date__c = System.today();
                    c.PriorChannelPartnerName__c =  ((Contact)Trigger.oldMap.get(c.Id)).Channel_Partner_Name__c ;
                }
                else if(c.Channel_Partner_Name__c!=null && monthsBetween <6 && ((Contact)Trigger.oldMap.get(c.Id)).Channel_Partner_Name__c!=null && c.Channel_Partner_Name__c != ((Contact)Trigger.oldMap.get(c.Id)).Channel_Partner_Name__c&& system.UserInfo.getUserId() ==EloquaAvalaraCaseSafeID){
                    c.ChangedChannelPartnerName__c= c.Channel_Partner_Name__c;
                    c.Channel_Partner_Name__c = ((Contact)Trigger.oldMap.get(c.Id)).Channel_Partner_Name__c;
                    c.Channel_Partner_Name_Update_6__c = true;
                }else if (c.Channel_Partner_Name__c!=null &&  c.Channel_Partner_Name__c != ((Contact)Trigger.oldMap.get(c.Id)).Channel_Partner_Name__c ){
                    c.Prior_Channel_Partner_Name_Change_Date__c = System.today();
                    c.PriorChannelPartnerName__c =  ((Contact)Trigger.oldMap.get(c.Id)).Channel_Partner_Name__c ;
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
            for(Contact c:(List<Contact>)Trigger.new){
                
                if(c.Channel_Partner_Name__c!=null && c.Contact_Connector__c!=null){
                    c.Partner_Connector_Assigned_Rep__c=mapResellingPartnerRep.get(''+c.Channel_Partner_Name__c+c.Contact_Connector__c);
                }
            }
        }
        //Update Contact owner same as account owner
        //IBST-10175- Updated the login to include record type - Avalara Included 
        if(accountIdContactOwnerUpdate.size()>0){
            Id avalaraIncludedRecordTypeId=[select id From RecordType Where sObjectType='Account' and DeveloperName='Avalara_Included' limit 1].Id;
            Map<Id,Account> mapAccountIDs=new Map<Id,Account>([Select Id,OwnerId,ActiveCustomer__c,Owner.ProfileId, recordtypeId From Account 
                                                               Where Id=:accountIdContactOwnerUpdate AND ((ActiveCustomer__c = true AND Owner.ProfileId IN ('00e400000017J9dAAE','00e400000017BsLAAU','00e33000000x35xAAA')) OR RecordtypeId = :avalaraIncludedRecordTypeId)]);
            for(Contact c:(List<Contact>)Trigger.new){
                if( mapAccountIDs.containsKey(c.AccountId) && c.OwnerId != mapAccountIDs.get(c.AccountId).OwnerId){
                    c.OwnerId = mapAccountIDs.get(c.AccountId).OwnerId;
                }
            }
        }
        //BATS-748 Get CampaignMembers related to Contact 
        List<contact> updateCon = new  List<contact>();
        Set<Id> campID = new  Set<Id>();
        Set<Id> conId = new Set<Id>();
        for(Contact con : (List<Contact>)Trigger.new){
          if(con.Campaign_MostRecent__c != null){
             campID.add(con.Campaign_MostRecent__c);
             conId.add(con.id);
             system.debug('campID>>'+campID);
             system.debug('conId>>'+conId);
          }
        }
        List<CampaignMember> cmList = [SELECT contactid,CampaignId,Initial_Response_Date__c,MQL_Date__c FROM CampaignMember WHERE CampaignId IN :campId AND contactid IN: conId AND Initial_Response_Date__c=LAST_N_DAYS:5];
        Map<String,CampaignMember> mapCM=new Map<String,CampaignMember>();
  	    for(CampaignMember cm: cmList){
  		 if(cmList.size()>0 &&cm.CampaignId !=null &&cm.ContactId !=null){
  		       mapCM.put(''+cm.CampaignId+cm.ContactId,cm); 
               System.debug('mapCM>>'+mapCM);
  		 }
  	    }
        Map<Id,Contact> oldContactMap;
        if(Trigger.isUpdate){
            oldContactMap=(Map<Id,Contact>) Trigger.oldMap;
        }
        for(Contact l: (List<Contact>)Trigger.new) {
            if(String.isNotBlank(l.ContactStatus__c)){
            	//MQL
                if((Trigger.isInsert || (Trigger.isUpdate && oldContactMap.get(l.Id).ContactStatus__c!=Constants.CONTACT_STATUS_MQL)) && 
                    l.ContactStatus__c==Constants.CONTACT_STATUS_MQL ){
                    if(mapCM.containsKey(''+l.Campaign_MostRecent__c+l.id) && mapCM.get(''+l.Campaign_MostRecent__c+l.id).Initial_Response_Date__c.date() == Date.today()){
                      l.MQL_Date_Most_Recent__c = DateTime.now();
                      mapCM.get(''+l.Campaign_MostRecent__c+l.id).MQL_Date__c =  DateTime.now();
                      system.debug('con>>'+l);
                    }
                }
                //Working
                if((Trigger.isInsert || (Trigger.isUpdate && oldContactMap.get(l.Id).ContactStatus__c!=Constants.CONTACT_STATUS_WORKING)) && 
                    l.ContactStatus__c==Constants.CONTACT_STATUS_WORKING ){
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
    }
    protected override void afterUpdate(){
        Set<Id> contactId = new Set<Id>();
        for( Contact con : (List<Contact>)Trigger.new)
        {
            Contact oldCon = (Contact)trigger.oldMap.get(con.Id);
            if(con.Authorized_Identity_Contact__c != oldCon.Authorized_Identity_Contact__c ){
                contactId.add(con.Id);
            }
            /*if(contactId.size() > 100){
                con.addError('More than 100 Contacts are updated');
                return;
            }*/
        }     
        if(contactId.size() > 0 && contactId.size() <= 100 && !System.isFuture() && !System.isBatch() && !System.isScheduled()){
            // future method call
            sendFutureContactAuthorizedIdentityChanged(contactId);
        }
        if(!afterInsertUpdateExecuted){
            afterInsertUpdate();
        }        
    }  
    public void afterInsertUpdate(){
         afterInsertUpdateExecuted=true;
        String ContactResponseVelocityOwnerChange='';
        // try{
       /* if(Test.isRunningTest()){
          TestCreateMetadata tcm=new TestCreateMetadata();
        }*/
        ContactResponseVelocityOwnerChange =KeyPairValue__c.getInstance('LeadResponseVelocityOwnerChange').Values__c;     
        //}
        // catch(Exception ex){}           
        List<Contact> ContactList=(List<Contact>)Trigger.new;
        Map<Id,Contact> oldContactMap;
        if(Trigger.isUpdate){
            oldContactMap=(Map<Id,Contact>) Trigger.oldMap;
        }
        //Get all Response_Velocity records related to Contacts and keep only latest one in map
        Map<Id,Response_Velocity__c> mapContactRV=new Map<Id,Response_Velocity__c>();
        for(Response_Velocity__c rv:[Select Id,Contact__c,MQL_Date_Time__c,Assignment_Date_Time__c,Processing_Date_Time__c,Working_Date_Time__c, Opportunity_SubType__c,Nurture_Disqualified_Date_Time__c,Owner_at_Assignment__c,Nurture_Disqualified_Reason__c
                                         From Response_Velocity__c 
                                         Where Contact__c=:ContactList  order by createddate ASC]){
                                             mapContactRV.put(rv.Contact__c,rv);
                                         }
        List<Response_Velocity__c> listRV=new List<Response_Velocity__c>();
        
        
        //Get Opportunity related to Contact 
        Map<Id,Id> conOppMap = new  Map<Id,Id>();
        for(OpportunityContactRole oCR : [Select id,contactId,opportunityId from OpportunityContactRole where 
                                          contactId =:(Set<Id>)trigger.newMap.keySet() order by opportunity.createddate ASC ]){
                  conOppMap.put(oCR.contactId,ocr.OpportunityId);                                              
        }
        for(Contact l:ContactList) {
            if(String.isNotBlank(l.ContactStatus__c)){
                //create new Response Velocity when Contact status is MQL and Most Recent Conversion Date = Today
                if(
                    (Trigger.isInsert || (Trigger.isUpdate && oldContactMap.get(l.Id).ContactStatus__c!=Constants.CONTACT_STATUS_MQL)) && 
                    l.ContactStatus__c==Constants.CONTACT_STATUS_MQL 
                    /*&& l.Most_Recent_Conversion_Date__c==Date.today()*/
                ){ 
                    Response_Velocity__c newResVel = new Response_Velocity__c();
                    newResVel.Contact__c=l.Id;
                    newResVel.MQL_Date_Time__c = DateTime.now();
                    if(String.isNotBlank(l.Opportunity_Sub_Type__c)){
                         newResVel.Opportunity_SubType__c  = l.Opportunity_Sub_Type__c;
                         //newResVel.MK_Lead_Score__c = l.mk_lead_avatax_score__c;
                        if(l.Opportunity_Sub_Type__c=='AvaTax'){
                            if(l.mk_lead_avatax_score__c !=null){
                               newResVel.MK_Lead_Score__c = l.mk_lead_avatax_score__c;
                            }
                            if(l.mk_customer_fit_avatax_score__c !=null){
                             newResVel.MK_Customer_Fit_Score__c = l.mk_customer_fit_avatax_score__c;  
                            }
                        }
                        else if(l.Opportunity_Sub_Type__c=='CertCapture'){
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
                    if(String.isNotBlank(l.Method_of_Contact_Contact__c )){
                           newResVel.Method_of_Contact__c = l.Method_of_Contact_Contact__c;
                    }
                    if(conOppMap.containskey(l.id)){
                        newResVel.Opportunity_Created__c = conOppMap.get(l.Id);
                    }
                    listRV.add(newResVel);    
                }
                else if(
                    Trigger.isUpdate && 
                    (l.ContactStatus__c!=Constants.CONTACT_STATUS_MQL || 
                     (String.valueOf(oldContactMap.get(l.Id).OwnerId).startsWith('00G') && !String.valueOf(l.OwnerId).startsWith('00G') && !ContactResponseVelocityOwnerChange.contains(String.valueOf(l.OwnerId))) ||
                     (ContactResponseVelocityOwnerChange.contains(String.valueOf(oldContactMap.get(l.Id).OwnerId)) && !ContactResponseVelocityOwnerChange.contains(String.valueOf(l.OwnerId))  && !String.valueOf(l.OwnerId).startsWith('00G'))
                    )
                ){
                    Response_Velocity__c rv=mapContactRV.get(l.Id);
                    if(rv!=null){
                        listRV.add(rv); 
                        if(
                            Trigger.isUpdate && rv.Assignment_Date_Time__c==null &&
                            ((String.valueOf(oldContactMap.get(l.Id).OwnerId).startsWith('00G') && !String.valueOf(l.OwnerId).startsWith('00G') && !ContactResponseVelocityOwnerChange.contains(String.valueOf(l.OwnerId))) ||
                             (ContactResponseVelocityOwnerChange.contains(String.valueOf(oldContactMap.get(l.Id).OwnerId)) && !ContactResponseVelocityOwnerChange.contains(String.valueOf(l.OwnerId))  && !String.valueOf(l.OwnerId).startsWith('00G'))
                            )
                        ){
                            rv.Assignment_Date_Time__c=Datetime.now();
                            rv.Owner_at_Assignment__c = l.OwnerId;
                        }
                        if(rv.Processing_Date_Time__c==null && l.ContactStatus__c==Constants.CONTACT_STATUS_PROCESSING && oldContactMap.get(l.Id).ContactStatus__c!=Constants.CONTACT_STATUS_PROCESSING){
                            rv.Processing_Date_Time__c=Datetime.now();
                        }
                        if(rv.Working_Date_Time__c==null && l.ContactStatus__c==Constants.CONTACT_STATUS_WORKING && oldContactMap.get(l.Id).ContactStatus__c!=Constants.CONTACT_STATUS_WORKING){
                            rv.Working_Date_Time__c=Datetime.now();
                        }
                       // Nurture and disqulified both 
                        if(rv.Nurture_Disqualified_Date_Time__c==null && l.ContactStatus__c==Constants.LEAD_STATUS_NURTURE  && oldContactMap.get(l.Id).ContactStatus__c!=Constants.LEAD_STATUS_NURTURE  && ( oldContactMap.get(l.Id).ContactStatus__c==Constants.LEAD_STATUS_MQL || oldContactMap.get(l.Id).ContactStatus__c==Constants.LEAD_STATUS_WORKING ||  oldContactMap.get(l.Id).ContactStatus__c==Constants.LEAD_STATUS_PROCESSING)){
                             rv.Nurture_Disqualified_Date_Time__c=Datetime.now();
                             if( rv.Nurture_Disqualified_Reason__c == null){
                                     rv.Nurture_Disqualified_Reason_Text__c = l.Nurture_Reason__c;
                             }
                        }
                        //Disqualified
                        if(rv.Nurture_Disqualified_Date_Time__c==null &&  l.ContactStatus__c==Constants.LEAD_STATUS_DISQUALIFIED &&  oldContactMap.get(l.Id).ContactStatus__c!=Constants.LEAD_STATUS_DISQUALIFIED && ( oldContactMap.get(l.Id).ContactStatus__c==Constants.LEAD_STATUS_MQL || oldContactMap.get(l.Id).ContactStatus__c==Constants.LEAD_STATUS_WORKING ||  oldContactMap.get(l.Id).ContactStatus__c==Constants.LEAD_STATUS_PROCESSING)){
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
    }             
    @future(callout=true)
    public static void sendFutureContactAuthorizedIdentityChanged(Set<Id> conId){
        CC_AVA_BizTech_API.sendContactAuthorizedIdentityChanged(conId);
    }
    //CC_AVA_BizTech_API.sendContactAuthorizedIdentityChanged(contactId);
}