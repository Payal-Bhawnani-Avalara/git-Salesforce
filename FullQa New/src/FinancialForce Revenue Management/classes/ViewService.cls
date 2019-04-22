/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ViewService {
    global ViewService() {

    }
    global static List<String> getCurrencies() {
        return null;
    }
    global static List<ffrr.ViewService.Tab> getDefaultTabs() {
        return null;
    }
    global static List<ffrr.ViewService.Tab> getTabsForView(String viewName) {
        return null;
    }
    global static List<ffrr.ViewService.Tab> getTabs() {
        return null;
    }
    global static List<ffrr.ViewService.Tab> getTabs(ffrr.ViewService.ViewType viewType) {
        return null;
    }
    global static List<String> getViewNames() {
        return null;
    }
    global static List<ffrr.ViewService.Tab> getWorkingCopy() {
        return null;
    }
    global static List<ffrr.ViewService.Tab> getWorkingCopy(ffrr.ViewService.ViewType viewType) {
        return null;
    }
    global static void save(List<ffrr.ViewService.Tab> tabs) {

    }
    global static void save(List<ffrr.ViewService.Tab> tabs, String viewName) {

    }
    global static void save(List<ffrr.ViewService.Tab> tabs, String viewName, ffrr.ViewService.SaveOptions saveOptions) {

    }
    global static void save(List<ffrr.ViewService.Tab> tabs, String viewName, ffrr.ViewService.ViewType viewType) {

    }
    global static void save(List<ffrr.ViewService.Tab> tabs, ffrr.ViewService.ViewType viewType) {

    }
    global static ffrr.ViewService.SearchResult search(ffrr.ViewService.Tab tab, Schema.SObjectType objectType, String value) {
        return null;
    }
    global static ffrr.ViewService.SearchResult search(ffrr.ViewService.Tab tab, Schema.SObjectType objectType, String value, ffrr.ViewService.ViewType viewType) {
        return null;
    }
    global static List<Object> search(ffrr.ViewService.Tab tab, Schema.SObjectType objectType, Schema.SObjectField field, String value) {
        return null;
    }
    global static List<Object> search(ffrr.ViewService.Tab tab, Schema.SObjectType objectType, Schema.SObjectField field, String value, ffrr.ViewService.ViewType viewType) {
        return null;
    }
global class FieldIdentifier {
    global String fieldLabel {
        get;
        set;
    }
    global String fieldName {
        get;
        set;
    }
    global String objectLabel {
        get;
        set;
    }
    global String objectName {
        get;
        set;
    }
    global FieldIdentifier() {

    }
    global FieldIdentifier(String objectName, String objectLabel, String fieldName, String fieldLabel) {

    }
}
global virtual class Reference implements System.Comparable, ffrr.IRevRecReference {
    global Id id {
        get;
        set;
    }
    global String name {
        get;
        set;
    }
    global Reference() {

    }
}
global class SaveOptions {
    global Boolean SaveWorkingCopy {
        get;
        set;
    }
    global ffrr.ViewService.ViewType ViewType {
        get;
        set;
    }
    global SaveOptions() {

    }
}
global class SearchResult {
    global List<ffrr.ViewService.TabSelectorFilter> filters {
        get;
        set;
    }
    global List<ffrr.ViewService.Reference> records {
        get;
        set;
    }
    global SearchResult() {

    }
}
global class Tab {
    global List<ffrr.ViewService.FieldIdentifier> filterErrors {
        get;
        set;
    }
    global Boolean isActive {
        get;
        set;
    }
    global Schema.SObjectType objectType {
        get;
        set;
    }
    global List<ffrr.ViewService.TabSelector> selectors {
        get;
        set;
    }
    global ffrr.ViewService.TabFilter tabFilter {
        get;
        set;
    }
    global Tab() {

    }
}
global class TabFilter {
    global String currencyName {
        get;
        set;
    }
    global Boolean ProcessUseInContractRecords {
        get;
        set;
    }
    global Date recognitionDate {
        get;
        set;
    }
    global List<Id> years {
        get;
        set;
    }
    global TabFilter() {

    }
}
global class TabSelector {
    global List<ffrr.ViewService.TabSelectorFilter> filters {
        get;
        set;
    }
    global Schema.SObjectType objectType {
        get;
        set;
    }
    global TabSelector() {

    }
}
global class TabSelectorFilter implements System.Comparable {
    global Schema.SObjectField field {
        get;
        set;
    }
    global List<Object> values {
        get;
        set;
    }
    global TabSelectorFilter() {

    }
}
global enum ViewType {Actual, Forecast}
}
