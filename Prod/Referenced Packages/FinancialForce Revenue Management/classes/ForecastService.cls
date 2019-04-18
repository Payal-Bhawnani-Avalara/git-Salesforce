/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ForecastService {
    global ForecastService() {

    }
    global static Id generateForecasts(ffrr.ViewService.Tab tab) {
        return null;
    }
    global static List<ffrr.ForecastService.Forecast> retrieveByForecastIds(List<Id> forecastIds) {
        return null;
    }
    global static List<ffrr.ForecastService.Forecast> retrieveByPrimaryRecordIds(List<Id> primaryRecordIds) {
        return null;
    }
    global static List<ffrr.ForecastService.ForecastLine> retrieveDrafts(Id parentRecordId, Integer parentLevel, ffrr.ViewService.Tab tab) {
        return null;
    }
    global static List<ffrr.ForecastService.ForecastLine> retrieveLatest(Id parentRecordId, Integer parentLevel, ffrr.ViewService.Tab tab, String category) {
        return null;
    }
    global static List<ffrr.ForecastService.ForecastLine> retrieveNew(Id parentRecordId, Integer parentLevel, ffrr.ViewService.Tab tab) {
        return null;
    }
    global static List<ffrr.ForecastService.ForecastLine> retrieveSpecific(Id parentRecordId, Integer parentLevel, ffrr.ViewService.Tab tab, Id forecastId) {
        return null;
    }
global class Forecast extends ffrr.ViewService.Reference {
    global String category {
        get;
        set;
    }
    global String description {
        get;
        set;
    }
    global Boolean locked {
        get;
        set;
    }
    global ffrr.ViewService.Reference record {
        get;
        set;
    }
    global Decimal totalForecast {
        get;
        set;
    }
    global Integer version {
        get;
        set;
    }
    global ffrr.ViewService.Reference year {
        get;
        set;
    }
    global Forecast() {

    }
    global Forecast(ffrr.ViewService.Reference forecast, ffrr.ViewService.Reference record, ffrr.ViewService.Reference year, Boolean locked, String description, String category, Integer version, Decimal totalForecast) {

    }
}
global class ForecastLine implements System.Comparable {
    global ffrr.ViewService.Reference account {
        get;
        set;
    }
    global List<ffrr.ForecastService.Forecast> forecasts {
        get;
        set;
    }
    global Boolean hasLockedForecasts {
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
    global List<ffrr.ForecastService.PeriodLine> periodLines {
        get;
        set;
    }
    global ffrr.ViewService.Reference record {
        get;
        set;
    }
    global ffrr.CalculationService.Template template {
        get;
        set;
    }
    global Decimal totalForecast {
        get;
        set;
    }
    global Decimal totalRevenue {
        get;
        set;
    }
    global Decimal unallocated {
        get;
        set;
    }
    global ForecastLine(List<ffrr.ForecastService.Forecast> forecasts, ffrr.ViewService.Reference record, ffrr.CalculationService.Template template, ffrr.ViewService.Reference account, Decimal totalRevenue, Decimal totalForecast, ffrr.CalculationService.LineType lineType, List<ffrr.ViewService.Reference> parentPath, List<ffrr.ForecastService.PeriodLine> periodLines) {

    }
    global ForecastLine(List<ffrr.ForecastService.Forecast> forecasts, ffrr.ViewService.Reference record, Id linkRecordId, ffrr.CalculationService.Template template, ffrr.ViewService.Reference account, Decimal totalRevenue, Decimal totalForecast, ffrr.CalculationService.LineType lineType, List<ffrr.ViewService.Reference> parentPath, List<ffrr.ForecastService.PeriodLine> periodLines) {

    }
}
global class PeriodLine extends ffrr.ViewService.Reference {
    global Id forecast {
        get;
        set;
    }
    global Id forecastLine {
        get;
        set;
    }
    global Decimal percentage {
        get;
        set;
    }
    global Decimal value {
        get;
        set;
    }
    global ffrr.ViewService.Reference year {
        get;
        set;
    }
    global PeriodLine() {

    }
    global PeriodLine(Id id, String name, Id forecast, Id forecastLine, Decimal percentage, Decimal value, ffrr.ViewService.Reference year) {

    }
}
}
