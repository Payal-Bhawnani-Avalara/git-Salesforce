trigger SurveyResponseTrigger on SurveyResponse__c (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
    new SurveyResponseTriggerHandler().run();
}