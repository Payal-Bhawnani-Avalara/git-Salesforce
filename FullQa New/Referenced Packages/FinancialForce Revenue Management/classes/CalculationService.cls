/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class CalculationService {
    global CalculationService() {

    }
    global static ffrr.CalculationService.Calculation calculateDeliverable(Decimal totalRevenue, Decimal prevRecognized) {
        return null;
    }
    global static ffrr.CalculationService.Calculation calculateEqualSplit(Decimal totalRevenue, Decimal prevRecognized, Date startDate, Date endDate, Date recognitionDate) {
        return null;
    }
    global static ffrr.CalculationService.Calculation calculateEqualSplit445(Decimal totalRevenue, Decimal prevRecognized, Date startDate, Date endDate, Date recognitionDate) {
        return null;
    }
    global static ffrr.CalculationService.Calculation calculateEqualSplitDays(Decimal totalRevenue, Decimal prevRecognized, Date startDate, Date endDate, Date recognitionDate) {
        return null;
    }
    global static ffrr.CalculationService.Calculation calculateEqualSplitMonthsPartPeriods(Decimal totalRevenue, Decimal prevRecognized, Date startDate, Date endDate, Date recognitionDate) {
        return null;
    }
    global static ffrr.CalculationService.Calculation calculatePercentageComplete(Decimal totalRevenue, Decimal prevRecognized, Decimal percentageComplete) {
        return null;
    }
    global static ffrr.CalculationService.Calculation calculateRevenue(SObject record, Date recognitionDate, String currencyFilter) {
        return null;
    }
    global static Id deleteAllLines() {
        return null;
    }
    global static Id deleteLines(Schema.SObjectType groupName, Boolean loadLines, Date recognitionDate) {
        return null;
    }
    global static Id loadLines(Schema.SObjectType groupName, Date recognitionDate) {
        return null;
    }
    global static List<ffrr.CalculationService.LineDetail> retrieveLines(Id parentID, Integer parentLevel, ffrr.ViewService.Tab filters) {
        return null;
    }
    global static ffrr.CalculationService.Record retrieveRecordDetails(Id recordId) {
        return null;
    }
    global static ffrr.CalculationService.Record retrieveRecordDetails(Id recordId, ffrr.ViewService.ViewType viewType) {
        return null;
    }
global virtual class Calculation extends ffrr.ViewService.Reference {
    global Decimal calculatedTotalRevenue {
        get;
        set;
    }
    global List<String> errors {
        get;
        set;
    }
    global Decimal previouslyRecognized {
        get;
        set;
    }
    global Decimal recognizedToDate {
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
    global Calculation() {

    }
}
global virtual class CalculationPart {
    global Decimal calculatedThisPeriod {
        get;
        set;
    }
    global Decimal calculatedToDate {
        get;
        set;
    }
    global Decimal calculatedTotal {
        get;
        set;
    }
    global Decimal previouslyCalculated {
        get;
        set;
    }
    global Decimal total {
        get;
        set;
    }
    global CalculationPart() {

    }
}
global class CalculationResult extends ffrr.ViewService.Reference {
    global ffrr.CalculationService.CalculationPart cost {
        get;
        set;
    }
    global List<String> errors {
        get;
        set;
    }
    global ffrr.CalculationService.CalculationPart revenue {
        get;
        set;
    }
    global CalculationResult() {

    }
}
global class LineDetail extends ffrr.CalculationService.Calculation {
    global ffrr.ViewService.Reference account {
        get;
        set;
    }
    global String itemHyperlink {
        get;
        set;
    }
    global ffrr.CalculationService.LineType lineType {
        get;
        set;
    }
    global Id linkRecordId {
        get;
        set;
    }
    global List<ffrr.ViewService.Reference> parentPath {
        get;
        set;
    }
    global Id stagingRecordId {
        get;
        set;
    }
    global ffrr.CalculationService.Template template {
        get;
        set;
    }
    global Integer totalChildren {
        get;
        set;
    }
    global Integer totalDirectChildren {
        get;
        set;
    }
    global LineDetail() {

    }
}
global enum LineType {Detail, Summary}
global class Record extends ffrr.ViewService.Reference {
    global String delivered {
        get;
        set;
    }
    global String description {
        get;
        set;
    }
    global Date endDate {
        get;
        set;
    }
    global List<ffrr.ViewService.TabSelectorFilter> filters {
        get;
        set;
    }
    global Decimal percentageComplete {
        get;
        set;
    }
    global Decimal rate {
        get;
        set;
    }
    global Date startDate {
        get;
        set;
    }
    global Decimal totalUnits {
        get;
        set;
    }
    global Decimal vsoePercent {
        get;
        set;
    }
    global Decimal vsoeRate {
        get;
        set;
    }
}
global class Template extends ffrr.ViewService.Reference {
    global String calculationType {
        get;
        set;
    }
    global String revenueBasis {
        get;
        set;
    }
    global String templateType {
        get;
        set;
    }
    global Template() {

    }
}
}
