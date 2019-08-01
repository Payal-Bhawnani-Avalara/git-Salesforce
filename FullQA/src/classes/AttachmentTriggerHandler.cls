public class AttachmentTriggerHandler extends TriggerHandler{
     //Trigger Handler Methods
     //protected override void beforeInsert(){}
     //protected override void beforeUpdate(){}
     //protected override void beforeDelete(){}
    protected override void afterInsert(){
            afterInsertUpdateDelete((List<Attachment>) Trigger.new);
    }

    protected override void afterUpdate(){
    	       afterInsertUpdateDelete((List<Attachment>) Trigger.new);
    }

    protected override void afterDelete(){
          afterInsertUpdateDelete((List<Attachment>) Trigger.old);
    }

    //protected override void afterUndelete(){}
    
    //Helper Methods
     public void afterInsertUpdateDelete(List<Attachment> lstAttachment){
     	//TECHDEBT: Payal 01/10/2017
        //This code will send Email notiifcation to Case Onwer when Attachemnt is Inserted,Updated,Deleted IBST-6263
        Set<Id> caseIds = new Set<Id>();
         Id zytaxCaseRecTypeId=[Select Id from RecordType where DeveloperName='Zytax_Case_v1' limit 1].Id; 
          for(Attachment a:lstAttachment){
             String keyPrefix = String.valueOf(a.ParentId).substring(0, 3); 
             if(keyPrefix == '500'){
              caseIds.add(a.ParentId);
              }
            }
     
        
         if(caseIds.size()>0){
         List<Case> caseList = [Select id,SendAttachmentEmail__c,ownerid from Case where id in :caseIds AND RecordTypeId =: zytaxCaseRecTypeId ];
         
         for(Case c: caseList){
          if(UserInfo.getUserId() != c.ownerid && string.valueOf(c.OwnerId).startsWith('005'))
           c.SendAttachmentEmail__c=true;
           c.stopAssignmentRule__c = true;
         }
         Database.DMLOptions dmo = new Database.DMLOptions();
         dmo.assignmentRuleHeader.useDefaultRule = false;
         if(caseList.size() > 0){
         	TriggerHandler.bypass('CaseTriggerHandler');
		    database.update(caseList,dmo);
		    TriggerHandler.clearBypass('CaseTriggerHandler');
         }
        }
     } 
}