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
        if(KeyPairValue__c.getInstance('EloquaAvalaraCaseSafeID')==null){
            //Setup custom setting
            List<KeyPairValue__c> listKeyPairValue=new List<KeyPairValue__c>(); 
            listKeyPairValue.add(new KeyPairValue__c(Name='EloquaAvalaraCaseSafeID ',Values__c='00540000000yXrwAAE '));
            insert listKeyPairValue;            
        }        
        EloquaAvalaraCaseSafeID =KeyPairValue__c.getInstance('EloquaAvalaraCaseSafeID').Values__c;  
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
        //IBST-12051: Added condition in the Account SOQL Query to fetch Accounts containing '(FTO)' in Product_Summary__c along with 3 other filters
        if(accountIdContactOwnerUpdate.size()>0){
            Id avalaraIncludedRecordTypeId=[select id From RecordType Where sObjectType='Account' and DeveloperName='Avalara_Included' limit 1].Id;
            Map<Id,Account> mapAccountIDs=new Map<Id,Account>([Select Id,OwnerId,ActiveCustomer__c,Owner.ProfileId, recordtypeId From Account 
                                                               Where Id=:accountIdContactOwnerUpdate AND (((ActiveCustomer__c = true AND Owner.ProfileId IN ('00e400000017J9dAAE','00e400000017BsLAAU','00e33000000x35xAAA')) OR recordtypeId = :avalaraIncludedRecordTypeId) 
                                                               OR (Product_Summary__c LIKE '%(FTO)%' AND CARR__c = 0 AND (NOT SubType__c LIKE '%Partner%') AND (NOT Owner_Role__c LIKE '%CAM:%')))]);
            for(Contact c:(List<Contact>)Trigger.new){
                if( mapAccountIDs.containsKey(c.AccountId) && c.OwnerId != mapAccountIDs.get(c.AccountId).OwnerId){
                    c.OwnerId = mapAccountIDs.get(c.AccountId).OwnerId;
                }
            }
        }
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
        for(    Response_Velocity__c rv:[Select Id,Contact__c,MQL_Date_Time__c,Assignment_Date_Time__c,Processing_Date_Time__c,Working_Date_Time__c 
                                         From Response_Velocity__c 
                                         Where Contact__c=:ContactList  order by createddate ASC]){
                                             mapContactRV.put(rv.Contact__c,rv);
                                         }
        List<Response_Velocity__c> listRV=new List<Response_Velocity__c>();
        for(Contact l:ContactList) {
            if(String.isNotBlank(l.ContactStatus__c)){
                //create new Response Velocity when Contact status is MQL and Most Recent Conversion Date = Today
                if(
                    (Trigger.isInsert || (Trigger.isUpdate && oldContactMap.get(l.Id).ContactStatus__c!=Constants.CONTACT_STATUS_MQL)) && 
                    l.ContactStatus__c==Constants.CONTACT_STATUS_MQL && 
                    l.Most_Recent_Conversion_Date__c==Date.today()
                ){ 
                    listRV.add(new Response_Velocity__c(Contact__c=l.Id,MQL_Date_Time__c=DateTime.now()));
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
                        }
                        if(rv.Processing_Date_Time__c==null && l.ContactStatus__c==Constants.CONTACT_STATUS_PROCESSING && oldContactMap.get(l.Id).ContactStatus__c!=Constants.CONTACT_STATUS_PROCESSING){
                            rv.Processing_Date_Time__c=Datetime.now();
                        }
                        if(rv.Working_Date_Time__c==null && l.ContactStatus__c==Constants.CONTACT_STATUS_WORKING && oldContactMap.get(l.Id).ContactStatus__c!=Constants.CONTACT_STATUS_WORKING){
                            rv.Working_Date_Time__c=Datetime.now();
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