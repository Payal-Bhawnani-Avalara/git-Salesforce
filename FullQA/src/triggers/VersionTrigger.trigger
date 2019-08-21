trigger VersionTrigger on Version__c (after insert,after update) {  
    PartnerTaskManager.create(trigger.New,Trigger.Old);
    if(Trigger.isInsert){
        VersionArticleManager.process(Trigger.New);
    }
}