/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class SubObjectBatchableForCrmId implements Database.Batchable<SObject>, Database.Stateful {
    global SubObjectBatchableForCrmId() {

    }
    global SubObjectBatchableForCrmId(Schema.SObjectType sobjType, List<Zuora__CustomerAccount__c> billingAccounts, List<Zuora__CustomerAccount__c> billingAccountsFailedToProcess, Zuora__Sync_History__c firstFailedHistory, Zuora__Sync_History__c syncHistory, String operationType, Integer batchNum) {

    }
    global abstract void afterFinishJob(Database.BatchableContext param0);
    global abstract void executeBatch(Database.BatchableContext param0, List<SObject> param1);
    global virtual void execute(Database.BatchableContext BC, List<SObject> scope) {

    }
    global virtual void finish(Database.BatchableContext bc) {

    }
    global void processNextBatch() {

    }
    global abstract Database.QueryLocator start(Database.BatchableContext param0);
}
