/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class TransactionService {
    global TransactionService() {

    }
    global static ffrr.TransactionService.CommitResult bulkCommit(List<Id> transactions) {
        return null;
    }
    global static ffrr.TransactionService.SaveResult bulkSave(List<ffrr.TransactionService.HeaderDetails> headerDetails) {
        return null;
    }
    global static Id commitTransactions(List<Id> transactionList) {
        return null;
    }
    global static void discard(Set<Id> transactionIds) {

    }
    global static List<ffrr.TransactionService.TransactionLine> retrieve(Id elementId) {
        return null;
    }
    global static Id save(ffrr.TransactionService.HeaderDetails headerDetails) {
        return null;
    }
    global static ffrr.TransactionService.StagingSaveResult save(ffrr.TransactionService.StagingSaveContext context, ffrr.TransactionService.StagingSaveOptions options) {
        return null;
    }
global class CommitResult {
    global List<Id> Transactions {
        get;
    }
}
global class HeaderDetails {
    global Boolean commitTransaction {
        get;
        set;
    }
    global String currencyName {
        get;
        set;
    }
    global String description {
        get;
        set;
    }
    global String GroupingValue {
        get;
        set;
    }
    global String groupName {
        get;
        set;
    }
    global String legislationType {
        get;
        set;
    }
    global ffrr.TransactionService.LineAction lineAction {
        get;
        set;
    }
    global Map<Id,ffrr.TransactionService.LineDataToSave> lineDetailsMap {
        get;
        set;
    }
    global String originatingProcess {
        get;
        set;
    }
    global String period {
        get;
        set;
    }
    global Id periodId {
        get;
        set;
    }
    global Date recognitionDate {
        get;
        set;
    }
    global Id transactionId {
        get;
        set;
    }
    global HeaderDetails() {

    }
}
global enum LineAction {Ignore, Replace}
global class LineDataToSave {
    global List<Id> recordIdList {
        get;
        set;
    }
    global Id templateID {
        get;
        set;
    }
    global Decimal toAmortizeThisPeriod {
        get;
        set;
    }
    global Decimal toRecognizeThisPeriod {
        get;
        set;
    }
    global LineDataToSave() {

    }
}
global class SaveResult {
    global List<Id> transactions {
        get;
    }
}
global class StagingSaveContext {
    global List<Id> Details {
        get;
        set;
    }
    global List<Id> ExcludedDetails {
        get;
        set;
    }
    global List<Id> ExcludedSummaries {
        get;
        set;
    }
    global List<Id> Groupings {
        get;
        set;
    }
    global List<ffrr.TransactionService.StagingTransactionDetails> StagingTransactionDetails {
        get;
        set;
    }
    global List<Id> Summaries {
        get;
        set;
    }
    global List<Id> Versions {
        get;
        set;
    }
    global StagingSaveContext() {

    }
}
global class StagingSaveOptions {
    global ffrr.CommonService.ApexTransactionType TransactionType;
    global StagingSaveOptions() {

    }
}
global class StagingSaveResult {
    global Id AsyncJob {
        get;
    }
    global Map<Id,List<Id>> CreatedTransactionsByVersion {
        get;
    }
    global StagingSaveResult() {

    }
}
global class StagingTransactionDetails {
    global Boolean CommitTransaction {
        get;
        set;
    }
    global Boolean CreateGroupedTransactions {
        get;
        set;
    }
    global String Description {
        get;
        set;
    }
    global String LegislationType {
        get;
        set;
    }
    global ffrr.TransactionService.LineAction LineAction {
        get;
        set;
    }
    global Id PeriodId {
        get;
        set;
    }
    global String PeriodName {
        get;
        set;
    }
    global Id TransactionId {
        get;
        set;
    }
    global Id Version {
        get;
        set;
    }
    global StagingTransactionDetails() {

    }
}
global enum Status {Committed, InProgress}
global class TransactionLine extends ffrr.ViewService.Reference {
    global Decimal amount {
        get;
        set;
    }
    global Decimal amountAmortized {
        get;
        set;
    }
    global String recognitionCurrency {
        get;
        set;
    }
    global Date recognitionDate {
        get;
        set;
    }
    global ffrr.TransactionService.Status status {
        get;
        set;
    }
    global TransactionLine() {

    }
}
}
