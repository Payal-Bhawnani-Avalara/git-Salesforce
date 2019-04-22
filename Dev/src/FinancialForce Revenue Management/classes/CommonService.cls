/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class CommonService {
    global CommonService() {

    }
    global static ffrr.CommonService.FormattedDate formatDateToUserLocale(String dateToFormat) {
        return null;
    }
    global static List<ffrr.CommonService.FilterItems> getAllFilterRecords(List<ffrr.CommonService.AllFilterObjects> filtersToGet, ffrr.SelectionService.SelectFilter selectionFilter) {
        return null;
    }
    global static List<ffrr.CommonService.LabelInfo> getLabels(List<ffrr.CommonService.LabelObjects> labelsToGet) {
        return null;
    }
    global static List<ffrr.CommonService.RequiredFilterRecords> getRequiredFilterRecords(List<ffrr.CommonService.RequiredFilterObjects> objectsToGet, ffrr.SelectionService.SelectFilter selectionFilter) {
        return null;
    }
    global static List<ffrr.CommonService.TransactionSummary> getTransactionSummary(Id templateID, Id primaryID, Id secondaryID, Integer maximumRecords) {
        return null;
    }
global enum AllFilterObjects {Currencies, Primary, PrimaryFilter1, PrimaryFilter2, PrimaryFilter3, Secondary, SecondaryFilter1, SecondaryFilter2, SecondaryFilter3, Template}
global enum ApexTransactionType {Asynchronous, Dynamic, Synchronous}
global class FilterItem {
    global String name {
        get;
        set;
    }
    global String value {
        get;
        set;
    }
    global FilterItem() {

    }
}
global class FilterItems {
    global List<ffrr.CommonService.FilterItem> filterItems {
        get;
        set;
    }
    global ffrr.CommonService.AllFilterObjects filterObject {
        get;
        set;
    }
    global FilterItems() {

    }
}
global class FormattedDate {
    global String dateFormat {
        get;
        set;
    }
    global String dateFormatted {
        get;
        set;
    }
    global FormattedDate() {

    }
}
global class LabelInfo {
    global String fieldLabel {
        get;
        set;
    }
    global String fieldName {
        get;
        set;
    }
    global ffrr.CommonService.LabelObjects labelEnum {
        get;
        set;
    }
    global LabelInfo() {

    }
}
global enum LabelObjects {Currencies, Primary, PrimaryFilter1, PrimaryFilter2, PrimaryFilter3, Secondary, SecondaryFilter1, SecondaryFilter2, SecondaryFilter3, Template}
global class RecordData {
    global Id Id {
        get;
        set;
    }
    global String name {
        get;
        set;
    }
    global RecordData() {

    }
}
global enum RequiredFilterObjects {Currencies, Primary, Secondary, Template}
global class RequiredFilterRecords {
    global ffrr.CommonService.RequiredFilterObjects requiredFilterObject {
        get;
        set;
    }
    global List<ffrr.CommonService.RecordData> requiredFilterRecords {
        get;
        set;
    }
    global RequiredFilterRecords() {

    }
}
global class TransactionSummary {
    global String amount {
        get;
        set;
    }
    global String currencyName {
        get;
        set;
    }
    global Id headerID {
        get;
        set;
    }
    global String headerName {
        get;
        set;
    }
    global Id Id {
        get;
        set;
    }
    global String status {
        get;
        set;
    }
    global String summaryDateFormatted {
        get;
        set;
    }
    global TransactionSummary() {

    }
}
}
