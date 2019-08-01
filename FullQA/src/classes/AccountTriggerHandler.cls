public class AccountTriggerHandler extends TriggerHandler {
    
    //Trigger Handler Methods
    protected override void beforeInsert(){
        beforeInsertUpdate();
    }
    
    protected override void beforeUpdate(){
        //beforeInsertUpdate();
    }
    protected override void beforeDelete(){
        //BATS-189
        Boolean usersWithMergePermit = false;
        for(User users : [Select id From User Where Special_Permission__c includes ('Merge_Account') AND id =: UserInfo.getUserId()]) {
            usersWithMergePermit= true;
        }
        //ITBSX-185
        for( Account acc : (List<Account>)Trigger.old){
            if(acc.Do_Not_Merge__c){
                acc.addError('You cant delete this account, because it is marked as dont merge. Please contact salesforce administrator for more help.');
            }
            if(!usersWithMergePermit){
                acc.addError(Constants.MERGE_PERMISSION);
            }
        }   
    }
    /*

    protected override void afterDelete(){}

    protected override void afterUndelete(){}
    */
    //Helper Methods
    
    public void beforeInsertUpdate(){
        /*Map<String,VATNumberRegex__c> vatNumber = VATNumberRegex__c.getAll();
        Id emeaAccountTypeId=[Select Id from RecordType where DeveloperName='EMEA_Account' limit 1].Id;
        for(Account acc : (List<Account>)Trigger.new ){
        acc.VAT_Number_Format_Status__c = 'INVALID';
        if(
        String.isNotBlank(acc.EMEA_Resident_Country__c) && 
        vatNumber.containsKey(acc.EMEA_Resident_Country__c) && 
        String.isNotBlank(acc.VAT_Number__c)
        && acc.RecordTypeId==emeaAccountTypeId){
        /*String VATRegax = VATNumberRegex__c.getInstance(acc.EMEA_Resident_Country__c).Regex__c;
        Pattern VATPattern = Pattern.compile(VATRegax);
        Matcher VATMAatcher = VATPattern.matcher(acc.VAT_Number__c);
        system.debug(VATMAatcher.matches());

        if(VATMAatcher!=null && VATMAatcher.matches()){
        acc.VAT_Number_Format_Status__c = 'VALID';
        }
        acc.VAT_Number_Format_Status__c= Utility.vatNumberVerification(acc.EMEA_Resident_Country__c,acc.VAT_Number__c,acc.VAT_Number_Format_Status__c)	;        
        }
        }*/
        /* Id emeaAccountTypeId=[Select Id from RecordType where DeveloperName='EMEA_Account' limit 1].Id;
        Id emeaAccountTypeId=  Schema.SObjectType.Account.getRecordTypeInfosByName().get('EMEA_Account').getRecordTypeId();
        //Id emeaImplementationPartnerAccountTypeId=  Schema.SObjectType.Account.getRecordTypeInfosByName().get(Constants.ACCOUNT_EMEA_IMPLEMENTATION_PARTNER_RECORD_TYPE).getRecordTypeId();
        //Id brazilAccountTypeId=  Schema.SObjectType.Account.getRecordTypeInfosByName().get(Constants.ACCOUNT_BRAZIL_RECORD_TYPE).getRecordTypeId();
        System.debug('emeaAccountTypeId>>' + emeaAccountTypeId);
        //System.debug('emeaImplementationPartnerAccountTypeId>>' + emeaImplementationPartnerAccountTypeId);
        //System.debug('brazilAccountTypeId>>' + brazilAccountTypeId);

        for(Account acc : (List<Account>)Trigger.new ){
        if( acc.RecordTypeId==emeaAccountTypeId /*|| acc.RecordTypeId==emeaImplementationPartnerAccountTypeId || acc.RecordTypeId==brazilAccountTypeId){
        acc.CleanStatus='Skipped';
        System.debug('acc.CleanStatus>>' + acc.CleanStatus);
        }
        }*/
    }
    protected override void afterUpdate(){
        Set<Id> accountId = new Set<Id>();
        Set<Id> accountIdContactOwnerUpdate = new Set<ID>();
        for(Account acc : (List<Account>)Trigger.new)
        {
            Account oldAcc = (Account)trigger.oldMap.get(acc.Id);
            if(acc.CUP_User__c != oldAcc.CUP_User__c || !acc.Name.equalsIgnoreCase(oldAcc.Name)){ 
                accountId.add(acc.Id);
            }
            /*if(contactId.size() > 100){
            con.addError('More than 100 Contacts are updated');
            return;
            }*/
            //Process Builder " AccountCamEligibleUSSyncContactOwner" logic
            if(acc.ownerid != oldAcc.ownerid){  
                accountIdContactOwnerUpdate.add(acc.id);
            }
        }
        if(accountIdContactOwnerUpdate.size()>0){
            List<Contact> lstContact = [Select id, accountid from Contact where accountid=:accountIdContactOwnerUpdate];
            update lstContact;
        } 
        //Exclude Navees's user for mass updated
        if(accountId.size() > 0 /*&& accountId.size() <= 100*/ && !System.isFuture() && !System.isBatch() && !System.isScheduled() && (Test.isRunningTest() || Userinfo.getUserId()!='0050b0000030QZWAA2')){
            // future method call
            sendFutureCPUUserChanged(accountId);
        }
        // TriggerHandler.bypass('AccountTriggerHandler');
    }
    @future(callout=true)
    public static void sendFutureCPUUserChanged(Set<Id> accId){
        if(!Test.isRunningTest()){
            try{
                CC_AVA_BizTech_API.sendCPUUserChanged(accId);
            }catch(Exception ex){
                // Save logs in ApexLog__c Object 
                Utility.createApexLog('AccountTriggerHandler','failed',1,accid.size(),'FutureMethod',1,ex.getmessage()+accid,true);
                //String className, String status, Integer JobItemsProcessed, Integer TotalJobItems,String LogType, Integer NumberOfErrors,String message,Boolean insertObj
            }
        }
    }
    
    protected override void afterInsert(){
        Set<Id> accountId = new Set<Id>();
        for(Account acc: (List<Account>) Trigger.new){
            accountId.add(acc.Id);
        }
        if(accountId.size() > 0 && !System.isFuture() && !System.isBatch() && !System.isScheduled()){
            createDataFeedRecords(accountId);
        }
    }
    
    @future(callout=true)
    public static void createDataFeedRecords(Set<Id> accId){
        if(accId != null && !accId.isEmpty()){
            List<Account> lstAccount = [Select id,CX_Data_Feed__c,JX_Data_Feed__c from Account where id In: accId];
            //add everything in map
            Map<Id,CX_Data_Feed__c> accCXDataFeed = new Map<Id,CX_Data_Feed__c>();
            Map<Id,JX_Data_Feed__c> accJXDataFeed = new Map<Id,JX_Data_Feed__c>();
            for(Account acc : lstAccount){
                if(!accCXDataFeed.containsKey(acc.id)){
                    accCXDataFeed.put(acc.id, new CX_Data_Feed__c(Account__c = acc.id));
                }
                if(!accJXDataFeed.containsKey(acc.id)){
                    accJXDataFeed.put(acc.id, new JX_Data_Feed__c(Account__c = acc.id));
                }
            }
            
            if(accCXDataFeed.size()>0){
                insert accCXDataFeed.values();
                System.debug('accCXDataFeed.values()>>>'+accCXDataFeed.values());
            }
            if(accJXDataFeed.size()>0){
                insert accJXDataFeed.values();
                System.debug('accJXDataFeed.values()>>>'+accJXDataFeed.values());
            }
            for(Account acc : lstAccount ){
                if(accCXDataFeed.containsKey(acc.id)){
                    acc.CX_Data_Feed__c = accCXDataFeed.get(acc.id).id;
                    System.debug('acc.CX_Data_Feed__c>>'+ acc.CX_Data_Feed__c);
                }
                if(accJXDataFeed.containsKey(acc.id)){
                    acc.JX_Data_Feed__c = accJXDataFeed.get(acc.id).id;
                    System.debug('acc.JX_Data_Feed__c>>'+ acc.JX_Data_Feed__c);
                } 
            }
            update lstAccount;
        }
    }  	  	
}