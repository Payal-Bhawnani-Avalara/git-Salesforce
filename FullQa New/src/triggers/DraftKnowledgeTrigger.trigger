trigger DraftKnowledgeTrigger on Draft_Knowledge__c (after insert, after update) {
    ArticleApprovalManager.process(Trigger.New, Trigger.Old);
}