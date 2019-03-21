trigger EContractActivityTrigger on Sertifi2_0__EContractActivity__c (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
   if(KeyPairValue__c.getInstance('EContractActivityTriggerHandler').Values__c=='True'){ 
    new EContractActivityTriggerHandler().run();
   }
}