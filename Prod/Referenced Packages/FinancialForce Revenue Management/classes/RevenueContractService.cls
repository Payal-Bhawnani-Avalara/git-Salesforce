/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class RevenueContractService {
    global static Map<String,String> getSourceObjectInfo() {
        return null;
    }
    global static List<Id> populateFromControllingPoliFromContract(List<Id> contractIds) {
        return null;
    }
    global static List<Id> populateFromControllingPoli(List<Id> performanceObligationIds) {
        return null;
    }
    global static ffrr.RevenueContractService.PopulateResult populateFromSourceRecords(ffrr.RevenueContractService.PopulateContext context) {
        return null;
    }
    global static Id populateFromSourceRecordsAsync(ffrr.RevenueContractService.PopulateContext context) {
        return null;
    }
    global static ffrr.RevenueContractService.PopulateResult populatePerformanceObligationLineItems(List<Id> performanceObligationLineItemIds) {
        return null;
    }
    global static ffrr.RevenueContractService.PopulateResult populateRelatedPerformanceObligationLineItems(List<Id> performanceObligationIds) {
        return null;
    }
    global static ffrr.RevenueContractService.PopulateResult populate(List<Id> contractIds) {
        return null;
    }
    global static void reallocate(List<Id> contractIds) {

    }
    global static Map<Id,List<ffrr.RevenueContractService.PerformanceObligation>> retrievePerformanceObligations(List<Id> contractIds) {
        return null;
    }
    global static List<ffrr.RevenueContractService.RevenueContract> retrieve(List<Id> contractIds) {
        return null;
    }
    global static List<ffrr.RevenueContractService.RevenueContract> retrieve(List<Id> contractIds, ffrr.RevenueContractService.RetrieveOptions options) {
        return null;
    }
    global static ffrr.RevenueContractService.POSaveResult savePerformanceObligations(ffrr.RevenueContractService.POSaveContext saveContext) {
        return null;
    }
    global static Map<Schema.SObjectType,List<ffrr.ViewService.Reference>> searchRecords(String searchTerm) {
        return null;
    }
    global static Map<Schema.SObjectType,List<ffrr.ViewService.Reference>> searchRecords(String searchTerm, ffrr.RevenueContractService.RecordSearchOptions options) {
        return null;
    }
    global static Set<ffrr.RevenueContractService.SourceReference> searchRecords(String searchTerm, String objectName, List<String> filterPath, String currCode, ffrr.RevenueContractService.RecordSearchOptions options) {
        return null;
    }
    global static List<ffrr.ViewService.Reference> searchTemplates(String searchTerm) {
        return null;
    }
    global static List<ffrr.ViewService.Reference> searchTemplates(String searchTerm, ffrr.RevenueContractService.RecordSearchOptions options) {
        return null;
    }
    global static Id transferPreviouslyRecognizedAsync(ffrr.RevenueContractService.TransferContext context) {
        return null;
    }
    global static List<ffrr.RevenueContractService.TransferResult> transferPreviouslyRecognized(ffrr.RevenueContractService.TransferContext context) {
        return null;
    }
global abstract class DeleteContext {
    global List<Id> ContractsToDelete {
        get;
        set;
    }
    global List<Id> PerformanceObligationsToDelete {
        get;
        set;
    }
    global List<Id> POLIsToDelete {
        get;
        set;
    }
    global DeleteContext() {

    }
}
global class Filter {
    global Schema.SObjectField Field {
        get;
        set;
    }
    global Object Value {
        get;
        set;
    }
    global Filter() {

    }
}
global class POLISaveResult extends ffrr.RevenueContractService.SaveResult {
}
global class POSaveContext extends ffrr.RevenueContractService.DeleteContext {
    global List<ffrr.RevenueContractService.PerformanceObligation> PerformanceObligations {
        get;
        set;
    }
    global POSaveContext() {

    }
}
global class POSaveResult extends ffrr.RevenueContractService.SaveResult {
    global ffrr.RevenueContractService.POLISaveResult POLISaveResult {
        get;
        set;
    }
}
global class PathItem {
    global String ItemLabel {
        get;
    }
    global String RecordName {
        get;
    }
}
global class PerformanceObligation {
    global String AccountName {
        get;
        set;
    }
    global Boolean Active {
        get;
        set;
    }
    global Decimal AllocatedRevenue {
        get;
    }
    global Decimal AllocatedRevenueOverride {
        get;
        set;
    }
    global Decimal AmortizedToDate {
        get;
        set;
    }
    global String BalanceSheet {
        get;
        set;
    }
    global Boolean Complete {
        get;
        set;
    }
    global Id ContractId {
        get;
        set;
    }
    global Decimal Cost {
        get;
    }
    global String CostBalanceSheet {
        get;
        set;
    }
    global String CostCenter {
        get;
        set;
    }
    global String CostCostCenter {
        get;
        set;
    }
    global String CostIncomeStatement {
        get;
        set;
    }
    global String CurrencyIsoCode {
        get;
        set;
    }
    global String Description {
        get;
        set;
    }
    global Date EndDate {
        get;
        set;
    }
    global Id Id {
        get;
        set;
    }
    global String IncomeStatement {
        get;
        set;
    }
    global String Name {
        get;
    }
    global Decimal PercentComplete {
        get;
        set;
    }
    global List<ffrr.RevenueContractService.PerformanceObligationLineItem> PerformanceObligationLineItems {
        get;
        set;
    }
    global Boolean ReadyForRevRec {
        get;
    }
    global Decimal RecognizedToDate {
        get;
        set;
    }
    global Decimal Revenue {
        get;
    }
    global Boolean RevRecComplete {
        get;
        set;
    }
    global Decimal SSP {
        get;
    }
    global Decimal SSPOverride {
        get;
        set;
    }
    global Date StartDate {
        get;
        set;
    }
    global ffrr.ViewService.Reference Template {
        get;
        set;
    }
    global Decimal TotalSSP {
        get;
    }
    global PerformanceObligation() {

    }
}
global class PerformanceObligationLineItem {
    global String AccountName {
        get;
        set;
    }
    global Boolean Active {
        get;
        set;
    }
    global String BalanceSheetAccount {
        get;
        set;
    }
    global Boolean Completed {
        get;
        set;
    }
    global Decimal Cost {
        get;
        set;
    }
    global String CostBalanceSheetAccount {
        get;
        set;
    }
    global String CostCenterAccount {
        get;
        set;
    }
    global String CostCostCenterAccount {
        get;
        set;
    }
    global String CostIncomeStatementAccount {
        get;
        set;
    }
    global String CurrencyIsoCode {
        get;
        set;
    }
    global String Description {
        get;
        set;
    }
    global Date EndDate {
        get;
        set;
    }
    global ffrr.ViewService.Reference FieldMapping {
        get;
        set;
    }
    global Id Id {
        get;
        set;
    }
    global String IncomeStatementAccount {
        get;
        set;
    }
    global Boolean IsControllingCostPOLI {
        get;
        set;
    }
    global Boolean IsControllingPOLI {
        get;
        set;
    }
    global String Name {
        get;
    }
    global Decimal PercentageComplete {
        get;
        set;
    }
    global Id PerformanceObligationId {
        get;
        set;
    }
    global Decimal Revenue {
        get;
        set;
    }
    global ffrr.ViewService.Reference SourceRecord {
        get;
        set;
    }
    global ffrr.ViewService.Reference SourceRecordSetting {
        get;
        set;
    }
    global Decimal SSP {
        get;
        set;
    }
    global Date StartDate {
        get;
        set;
    }
    global String ValueType {
        get;
    }
    global PerformanceObligationLineItem() {

    }
}
global class PopulateContext {
    global List<Id> SourceRecordIDs {
        get;
        set;
    }
    global PopulateContext() {

    }
}
global class PopulateResult {
    global List<Id> UpdatedPolis {
        get;
    }
    global List<Id> UpdatedPos {
        get;
    }
}
global class RecordSearchOptions {
    global Integer NumberOfRows {
        get;
        set;
    }
    global RecordSearchOptions() {

    }
}
global class RetrieveOptions {
    global Boolean IncludePerformanceObligations {
        get;
        set;
    }
    global RetrieveOptions() {

    }
}
global class RevenueContract {
    global String AccountName {
        get;
        set;
    }
    global Boolean Active {
        get;
        set;
    }
    global Decimal AllocationRatio {
        get;
    }
    global String AllocationStatus {
        get;
    }
    global String CurrencyIsoCode {
        get;
        set;
    }
    global String Description {
        get;
        set;
    }
    global Date EndDate {
        get;
        set;
    }
    global Id Id {
        get;
        set;
    }
    global String Name {
        get;
    }
    global List<ffrr.RevenueContractService.PerformanceObligation> PerformanceObligations {
        get;
    }
    global Decimal PerformanceObligationsCount {
        get;
    }
    global Decimal Revenue {
        get;
        set;
    }
    global Boolean RevenueAllocated {
        get;
    }
    global Boolean RevenueRecognitionComplete {
        get;
        set;
    }
    global Date StartDate {
        get;
        set;
    }
    global Decimal TotalAllocatedRevenue {
        get;
    }
    global Decimal TotalAllocatedRevenueOverride {
        get;
    }
    global Decimal TotalAmortizedToDate {
        get;
    }
    global Decimal TotalCost {
        get;
    }
    global Decimal TotalRecognizedToDate {
        get;
    }
    global Decimal TotalSSP {
        get;
    }
    global RevenueContract() {

    }
}
global abstract class SaveResult {
    global List<Id> AllRecordIds {
        get;
        set;
    }
    global List<Id> NewRecordIds {
        get;
        set;
    }
    global List<Id> UpdatedRecordIds {
        get;
        set;
    }
    global SaveResult() {

    }
}
global class SourceReference {
    global String AccountName {
        get;
    }
    global String Description {
        get;
    }
    global String Id {
        get;
    }
    global List<ffrr.RevenueContractService.PathItem> SelectPath {
        get;
    }
    global List<ffrr.RevenueContractService.PathItem> SettingsPath {
        get;
    }
    global String ValueType {
        get;
    }
}
global class TransferContext {
    global Date CutoffDate {
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
    global List<Id> PerformanceObligationLineItems {
        get;
        set;
    }
    global String Period {
        get;
        set;
    }
    global Date RecognitionDate {
        get;
        set;
    }
    global List<ffrr.RevenueContractService.Filter> RevenueContractFilters {
        get;
        set;
    }
    global List<Id> TransactionIds {
        get;
        set;
    }
    global TransferContext() {

    }
}
global class TransferResult {
    global Id ActiveTransaction {
        get;
    }
    global String CurrencyCode {
        get;
    }
    global Exception error {
        get;
    }
    global String GroupName {
        get;
    }
    global List<Id> TransactionIds {
        get;
    }
}
}
