/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class StagingTableService {
    global StagingTableService() {

    }
    global static void abortStagingTableJob(List<Id> idList) {

    }
    global static ffrr.StagingTableService.Job getJob(Schema.SObjectType groupName) {
        return null;
    }
    global static ffrr.StagingTableService.Job getJob(Schema.SObjectType groupName, ffrr.StagingTableService.JobTransactionType transactionType) {
        return null;
    }
global class Job {
    global String errorMessage {
        get;
        set;
    }
    global Schema.SObjectType groupName {
        get;
        set;
    }
    global Id id {
        get;
        set;
    }
    global Datetime lastDataCreation {
        get;
        set;
    }
    global Datetime lastDataDeletion {
        get;
        set;
    }
    global Datetime lastDataUpdated {
        get;
        set;
    }
    global Integer processedRecords {
        get;
        set;
    }
    global Date recognitionDate {
        get;
        set;
    }
    global ffrr.StagingTableService.JobStatus status {
        get;
        set;
    }
    global Integer totalRecords {
        get;
        set;
    }
    global ffrr.StagingTableService.JobTransactionType transactionType {
        get;
        set;
    }
    global ffrr.StagingTableService.JobType type {
        get;
        set;
    }
    global Job() {

    }
}
global enum JobStatus {Aborted, Completed, Failed, Holding, Preparing, Processing, Queued}
global enum JobTransactionType {Actual, Forecast, Manage}
global enum JobType {Creating, Deleting, Updating}
}
