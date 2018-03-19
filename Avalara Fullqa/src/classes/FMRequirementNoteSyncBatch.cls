public with sharing class FMRequirementNoteSyncBatch implements Database.batchable<SObject>{

    public Database.QueryLocator start(Database.BatchableContext info){
        return Database.getQueryLocator([
            SELECT Id, Note__c, Functional_Matrix__c
            FROM Functional_Matrix_Requirement__c
            WHERE Functional_Matrix__c <> NULL
        ]);
    }

    public void execute(Database.BatchableContext info, List<Functional_Matrix_Requirement__c> scope){
        FunctionalMatrixRequirementHandler.processNotes([
            SELECT Id, RecordTypeId, Version__c
            FROM Functional_Matrix__c
            WHERE Id IN:filter(scope)
        ]);
    }

    public void finish(Database.BatchableContext info){

    }

    private static Set<Id> filter(List<Functional_Matrix_Requirement__c> scope){
        Set<Id> fmIds = new Set<Id>();
        for(Functional_Matrix_Requirement__c fmr : scope){
            if(String.isBlank(fmr.Note__c)){
                fmIds.add(fmr.Functional_Matrix__c);
            }
        }
        return fmIds;
    }

    public static void run(){
        Database.executeBatch(new FMRequirementNoteSyncBatch(), 10);
    }

}