/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class SelectionService {
    global SelectionService() {

    }
    global static void commitTransactions(List<Id> transactions) {

    }
    global static List<ffrr.SelectionService.RowDetail> getCalculateForPrimaryAndSecondaryRecords(List<SObject> primaryRecordList, List<SObject> secondaryRecordList, Date recognitionDate, String filterCurrency) {
        return null;
    }
    global static List<ffrr.SelectionService.TemplateLineData> getSelection(ffrr.SelectionService.SelectFilter selectionFilter) {
        return null;
    }
    global static Id runSaveBatchJob(List<ffrr.SelectionService.LineDataToSave> lineDataToSaveList, ffrr.SelectionService.HeaderDetails HeaderDetails, Boolean commitTransactions) {
        return null;
    }
global enum BatchObjectType {Primary, Secondary}
global class HeaderDetails {
    global String currencyHeader {
        get;
        set;
    }
    global String descriptionHeader {
        get;
        set;
    }
    global String findRevenueRecognitionInProgressHeader {
        get;
        set;
    }
    global String periodHeader {
        get;
        set;
    }
    global Id periodId {
        get;
        set;
    }
    global String recognitionDateHeader {
        get;
        set;
    }
    global HeaderDetails() {

    }
}
global class LineDataToSave {
    global String objectId {
        get;
        set;
    }
    global ffrr.SelectionService.BatchObjectType objectType {
        get;
        set;
    }
    global String parentId {
        get;
        set;
    }
    global String templateId {
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
global class PrimaryLineData extends ffrr.SelectionService.RowDetail {
    global List<ffrr.SelectionService.SecondaryLineData> secondaryLineData {
        get;
        set;
    }
    global PrimaryLineData() {

    }
}
global abstract class RowDetail {
    global String completedField {
        get;
        set;
    }
    global String currencyISOCode {
        get;
        set;
    }
    global String description {
        get;
        set;
    }
    global String endDate {
        get;
        set;
    }
    global String errorMessage {
        get;
        set;
    }
    global Id Id {
        get;
        set;
    }
    global String name {
        get;
        set;
    }
    global Decimal percentageComplete {
        get;
        set;
    }
    global Decimal prevRecognized {
        get;
        set;
    }
    global String rate {
        get;
        set;
    }
    global Decimal recognizedToDate {
        get;
        set;
    }
    global Boolean rowError {
        get;
        set;
    }
    global String startDate {
        get;
        set;
    }
    global Decimal toRecognizeThisPeriod {
        get;
        set;
    }
    global Decimal totalRevenue {
        get;
        set;
    }
    global String totalUnits {
        get;
        set;
    }
    global RowDetail() {

    }
}
global class SecondaryLineData extends ffrr.SelectionService.RowDetail {
    global SecondaryLineData() {

    }
}
global class SelectFilter {
    global String currencyFilter {
        get;
        set;
    }
    global String dateFormatted {
        get;
        set;
    }
    global String primaryFilter1String {
        get;
        set;
    }
    global String primaryFilter2String {
        get;
        set;
    }
    global String primaryFilter3String {
        get;
        set;
    }
    global Id primaryId {
        get;
        set;
    }
    global String secondaryFilter1String {
        get;
        set;
    }
    global String secondaryFilter2String {
        get;
        set;
    }
    global String secondaryFilter3String {
        get;
        set;
    }
    global Id secondaryId {
        get;
        set;
    }
    global Id templateId {
        get;
        set;
    }
    global SelectFilter() {

    }
}
global class TemplateLineData {
    global Id Id {
        get;
        set;
    }
    global String name {
        get;
        set;
    }
    global List<ffrr.SelectionService.PrimaryLineData> primaryLineData {
        get;
        set;
    }
    global String recognitionType {
        get;
        set;
    }
    global TemplateLineData() {

    }
}
}
