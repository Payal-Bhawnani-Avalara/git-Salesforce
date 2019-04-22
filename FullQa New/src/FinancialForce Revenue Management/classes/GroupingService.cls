/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class GroupingService {
    global GroupingService() {

    }
    global static ffrr.GroupingService.GroupingResult create(ffrr.GroupingService.GroupingContext context, ffrr.GroupingService.GroupingOptions options) {
        return null;
    }
    global static ffrr.GroupingService.DeleteResult deleteRecords(List<ffrr.GroupingService.DeleteCriteria> criteria, ffrr.GroupingService.DeleteOptions options) {
        return null;
    }
    global static List<ffrr.GroupingService.GroupingSummary> retrieve(Id groupingRecordId, Id versionId) {
        return null;
    }
global class DeleteCriteria {
    global Boolean KeepLatestVersions {
        get;
        set;
    }
    global List<Id> Users {
        get;
        set;
    }
    global List<Id> Versions {
        get;
        set;
    }
    global DeleteCriteria() {

    }
}
global class DeleteOptions {
    global ffrr.CommonService.ApexTransactionType TransactionType {
        get;
        set;
    }
    global DeleteOptions() {

    }
}
global class DeleteResult {
    global Id BatchId {
        get;
        set;
    }
    global DeleteResult() {

    }
}
global class GroupingContext {
    global List<ffrr.GroupingService.GroupingCriteria> GroupingCriteria {
        get;
        set;
    }
    global List<Id> GroupingRecordIds {
        get;
        set;
    }
    global List<Id> StagingDetailIds {
        get;
        set;
    }
    global List<Id> StagingSummaryIds {
        get;
        set;
    }
    global Id VersionId {
        get;
        set;
    }
    global GroupingContext() {

    }
}
global class GroupingCriteria {
    global Integer Level;
    global List<Schema.SObjectField> SObjectFields;
    global Schema.SObjectType SObjectType;
    global GroupingCriteria() {

    }
    global GroupingCriteria(Integer level, Schema.SObjectType SObjectType, List<Schema.SObjectField> SObjectFields) {

    }
}
global class GroupingOptions {
    global ffrr.CommonService.ApexTransactionType TransactionType {
        get;
        set;
    }
    global GroupingOptions() {

    }
}
global class GroupingResult {
    global Id BatchId {
        get;
        set;
    }
    global List<Id> GroupingRecordIds {
        get;
        set;
    }
}
global class GroupingSummary {
    global Id BatchTrackingControlId {
        get;
        set;
    }
    global Boolean Expanded {
        get;
        set;
    }
    global Id Id {
        get;
        set;
    }
    global Boolean IsExpandable {
        get;
        set;
    }
    global Integer Order {
        get;
        set;
    }
    global Id ParentGroupingId {
        get;
        set;
    }
    global Decimal PreviouslyAmortized {
        get;
        set;
    }
    global Decimal PreviouslyRecognized {
        get;
        set;
    }
    global Schema.SObjectField SObjectField {
        get;
        set;
    }
    global Schema.SObjectType SObjectType {
        get;
        set;
    }
    global Decimal ToAmortizeThisPeriod {
        get;
        set;
    }
    global Decimal ToRecognizeThisPeriod {
        get;
        set;
    }
    global Decimal TotalCost {
        get;
        set;
    }
    global Integer TotalLeafRecordCount {
        get;
        set;
    }
    global Decimal TotalRevenue {
        get;
        set;
    }
    global Object Value {
        get;
        set;
    }
    global Id VersionId {
        get;
        set;
    }
    global GroupingSummary() {

    }
}
}
