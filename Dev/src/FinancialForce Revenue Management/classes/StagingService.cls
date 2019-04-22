/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class StagingService {
    global StagingService() {

    }
    global static ffrr.StagingService.CreateResult create(List<ffrr.StagingService.RecordCreateContext> recordContexts, ffrr.StagingService.CreateOptions createOptions) {
        return null;
    }
    global static ffrr.StagingService.CreateResult create(List<ffrr.StagingService.TabCreateContext> tabContexts, ffrr.StagingService.CreateOptions createOptions) {
        return null;
    }
    global static ffrr.StagingService.DeleteResult deleteRecords(List<ffrr.StagingService.DeleteCriteria> criteria, ffrr.StagingService.DeleteOptions options) {
        return null;
    }
    global static Map<Id,ffrr.StagingService.RetrieveResult> retrieve(ffrr.StagingService.RetrieveContext context) {
        return null;
    }
global abstract class CreateContext {
    global List<ffrr.GroupingService.GroupingCriteria> GroupingCriteria {
        get;
        set;
    }
    global Id VersionId {
        get;
        set;
    }
    global CreateContext() {

    }
}
global class CreateOptions {
    global Boolean ProcessUseInContractRecords {
        get;
        set;
    }
    global ffrr.CommonService.ApexTransactionType TransactionType {
        get;
        set;
    }
    global CreateOptions() {

    }
}
global class CreateResult {
    global Id BatchId {
        get;
        set;
    }
    global List<Id> OrphanIds {
        get;
        set;
    }
    global List<Id> VersionIds {
        get;
        set;
    }
    global CreateResult() {

    }
}
global class DeleteCriteria {
    global Boolean KeepLatestVersions {
        get;
        set;
    }
    global Boolean UpdateLastDeleteDate {
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
global class Detail extends ffrr.StagingService.StagingRecord {
    global Boolean Amended {
        get;
    }
    global Boolean AmendedCost {
        get;
    }
    global Boolean IsLeaf {
        get;
    }
    global Decimal OriginalToAmortizeThisPeriod {
        get;
    }
    global Decimal OriginalToRecognizeThisPeriod {
        get;
    }
    global Decimal PreviouslyAmortized {
        get;
    }
    global Decimal PreviouslyRecognized {
        get;
    }
    global Id Summary {
        get;
    }
    global ffrr.ViewService.Reference Template {
        get;
    }
    global Decimal ToAmortizeThisPeriod {
        get;
    }
    global Decimal ToRecognizeThisPeriod {
        get;
    }
    global Decimal TotalCost {
        get;
    }
    global Decimal TotalRevenue {
        get;
    }
    global Detail() {

    }
}
global class RecordCreateContext extends ffrr.StagingService.CreateContext {
    global String CurrencyIsoCode {
        get;
        set;
    }
    global Date RecognitionDate {
        get;
        set;
    }
    global List<Id> RecordIds {
        get;
        set;
    }
    global RecordCreateContext() {

    }
}
global class RetrieveContext {
    global Id GroupingRecordId {
        get;
        set;
    }
    global List<Id> Summaries {
        get;
        set;
    }
    global ffrr.ViewService.Tab Tab {
        get;
        set;
    }
    global RetrieveContext() {

    }
}
global class RetrieveResult {
    global List<ffrr.StagingService.Detail> Details {
        get;
        set;
    }
    global List<ffrr.StagingService.Summary> Summaries {
        get;
        set;
    }
    global RetrieveResult() {

    }
}
global virtual class StagingRecord {
    global ffrr.ViewService.Reference Account;
    global String Error;
    global Id Id;
    global Id OriginalRecord;
    global Id SourceRecord;
    global String SourceRecordName;
    global Id Version;
    global StagingRecord() {

    }
}
global class Summary extends ffrr.StagingService.StagingRecord {
    global Integer AmendedCostDetailCount {
        get;
    }
    global Integer AmendedCostLeafCount {
        get;
    }
    global Integer AmendedDetailCount {
        get;
    }
    global Integer AmendedLeafCount {
        get;
    }
    global Decimal DetailCost {
        get;
    }
    global Integer DetailCount {
        get;
    }
    global Integer DetailErrorCount {
        get;
    }
    global Decimal DetailPreviouslyAmortized {
        get;
    }
    global Decimal DetailPreviouslyRecognized {
        get;
    }
    global Decimal DetailRevenue {
        get;
    }
    global Decimal DetailToAmortizeThisPeriod {
        get;
    }
    global Decimal DetailToRecognizeThisPeriod {
        get;
    }
    global Decimal LeafCost {
        get;
    }
    global Integer LeafCount {
        get;
    }
    global Integer LeafErrorCount {
        get;
    }
    global Decimal LeafPreviouslyAmortized {
        get;
    }
    global Decimal LeafPreviouslyRecognized {
        get;
    }
    global Decimal LeafRevenue {
        get;
    }
    global Decimal LeafToAmortizeThisPeriod {
        get;
    }
    global Decimal LeafToRecognizeThisPeriod {
        get;
    }
    global Id ParentSummary {
        get;
    }
    global Integer TotalAmendedCostDetailCount {
        get;
    }
    global Integer TotalAmendedCostLeafCount {
        get;
    }
    global Integer TotalAmendedDetailCount {
        get;
    }
    global Integer TotalAmendedLeafCount {
        get;
    }
    global Decimal TotalDetailCost {
        get;
    }
    global Integer TotalDetailCount {
        get;
    }
    global Integer TotalDetailErrorCount {
        get;
    }
    global Decimal TotalDetailPreviouslyAmortized {
        get;
    }
    global Decimal TotalDetailPreviouslyRecognized {
        get;
    }
    global Decimal TotalDetailRevenue {
        get;
    }
    global Decimal TotalDetailToAmortizeThisPeriod {
        get;
    }
    global Decimal TotalDetailToRecognizeThisPeriod {
        get;
    }
    global Decimal TotalLeafCost {
        get;
    }
    global Integer TotalLeafCount {
        get;
    }
    global Integer TotalLeafErrorCount {
        get;
    }
    global Decimal TotalLeafPreviouslyAmortized {
        get;
    }
    global Decimal TotalLeafPreviouslyRecognized {
        get;
    }
    global Decimal TotalLeafRevenue {
        get;
    }
    global Decimal TotalLeafToAmortizeThisPeriod {
        get;
    }
    global Decimal TotalLeafToRecognizeThisPeriod {
        get;
    }
    global Summary() {

    }
}
global class TabCreateContext extends ffrr.StagingService.CreateContext {
    global ffrr.ViewService.Tab Tab {
        get;
        set;
    }
    global TabCreateContext() {

    }
}
}
