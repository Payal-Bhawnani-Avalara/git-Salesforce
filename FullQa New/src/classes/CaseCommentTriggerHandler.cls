public class CaseCommentTriggerHandler  extends TriggerHandler {
    
    //Trigger Handler Methods
     //protected override void beforeInsert(){}
     //protected override void beforeUpdate(){}
     //protected override void beforeDelete(){}
    protected override void afterInsert(){
            afterInsertUpdateDelete((List<CaseComment>) Trigger.new);
    }

    protected override void afterUpdate(){
    	       afterInsertUpdateDelete((List<CaseComment>) Trigger.new);
    }

    protected override void afterDelete(){
          afterInsertUpdateDelete((List<CaseComment>) Trigger.old);
    }

    //protected override void afterUndelete(){}
    
    //Helper Methods
     public void afterInsertUpdateDelete(List<CaseComment> lstCaseComment){
     	//TECHDEBT: Payal 01/10/2017
        //This code will send Email notiifcation to Case Onwer when Attachemnt is Inserted,Updated,Deleted IBST-6263
        Set<Id> caseIds = new Set<Id>(); 
          for(CaseComment a:lstCaseComment){
             String keyPrefix = String.valueOf(a.ParentId).substring(0, 3); 
             if(keyPrefix == '500'){
              caseIds.add(a.ParentId);
              }
            }
     
         Id zytaxCaseRecTypeId=[Select Id from RecordType where DeveloperName='Zytax_Case_v1' limit 1].Id;
         if(caseIds.size()>0){
         List<Case> caseList = [Select id,SendCommenttEmail__c,ownerid from Case where id in :caseIds AND RecordTypeId =: zytaxCaseRecTypeId ];
         
         for(Case c: caseList){
          if(UserInfo.getUserId() != c.ownerid && string.valueOf(c.OwnerId).startsWith('005'))
           c.SendCommenttEmail__c=true;
         }
         
         if(caseList.size() > 0){
         update caseList;
         }
        }
     } 
}