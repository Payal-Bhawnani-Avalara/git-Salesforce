trigger WisePredictionTrigger on wisespt__WisePrediction__c (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
     new WisePredictionTriggerHandler().run();
}