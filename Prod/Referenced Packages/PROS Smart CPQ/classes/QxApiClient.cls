/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class QxApiClient {
    global QxApiClient() {

    }
    global static CameleonCPQ.QxApiClient.CloneQuoteResponse cloneQuote(CameleonCPQ.QxApiClient.CloneQuoteRequest request) {
        return null;
    }
    global static CameleonCPQ.QxApiClient.CloseSessionResponse closeSession(CameleonCPQ.QxApiClient.CloseSessionRequest request) {
        return null;
    }
    global static CameleonCPQ.QxApiClient.CreateQuoteResponse createQuote(CameleonCPQ.QxApiClient.CreateQuoteRequest request) {
        return null;
    }
    global static CameleonCPQ.QxApiClient.GenerateQuoteReportResponse generateQuoteReport(CameleonCPQ.QxApiClient.GenerateQuoteReportRequest request) {
        return null;
    }
    global static CameleonCPQ.QxApiClient.PushContextRequest getCrmContextRequest(Id entityId, CameleonCPQ.QxApiClient.QxSetup qSetup) {
        return null;
    }
    @Deprecated
    global static CameleonCPQ.QxApiClient.PushContextRequest getCrmContextRequest(Id entityId, String mappingSetName) {
        return null;
    }
    global static CameleonCPQ.QxApiClient.PullExportResponse getExportTrunk(CameleonCPQ.QxApiClient.PullExportRequest request) {
        return null;
    }
    global static CameleonCPQ.QxApiClient.GetQuoteActionsResponse getQuoteActions(CameleonCPQ.QxApiClient.GetQuoteActionsRequest request) {
        return null;
    }
    global static CameleonCPQ.QxApiClient.GetQuoteReportResponse getQuoteReport(CameleonCPQ.QxApiClient.GetQuoteReportRequest request) {
        return null;
    }
    @Deprecated
    global static CameleonCPQ.QxApiClient.GetQuoteReportActionsResponse getQuoteReportActions(CameleonCPQ.QxApiClient.GetQuoteReportActionsRequest wrappedRequest) {
        return null;
    }
    global static CameleonCPQ.QxApiClient.GetQuoteReportStatusResponse getQuoteReportStatus(CameleonCPQ.QxApiClient.GetQuoteReportStatusRequest request) {
        return null;
    }
    global static CameleonCPQ.QxApiClient.GetQuoteStateResponse getQuoteState(CameleonCPQ.QxApiClient.GetQuoteStateRequest request) {
        return null;
    }
    global static CameleonCPQ.QxApiClient.QxApiException getQxException(String qxException) {
        return null;
    }
    global static CameleonCPQ.QxApiClient.QxSetup getQxSetup(String quoteId) {
        return null;
    }
    global static CameleonCPQ.QxApiClient.GetStepsResponse getSteps(CameleonCPQ.QxApiClient.GetStepsRequest request) {
        return null;
    }
    global static CameleonCPQ.QxApiClient.GetQuoteUIContentResponse getUIContent(CameleonCPQ.QxApiClient.GetQuoteUIContentRequest request) {
        return null;
    }
    global static CameleonCPQ.QxApiClient.InitSessionResponse initSession(CameleonCPQ.QxApiClient.InitSessionRequest request) {
        return null;
    }
    global static CameleonCPQ.QxApiClient.LogMessageResponse logMessage(CameleonCPQ.QxApiClient.LogMessageRequest request) {
        return null;
    }
    global static CameleonCPQ.QxApiClient.PushDataResponse pushData(CameleonCPQ.QxApiClient.PushDataRequest request) {
        return null;
    }
global class CloneQuoteRequest {
    global CameleonCPQ.QxApiClient.QxRequestContext qxReqCtx {
        get;
        set;
    }
    global CameleonCPQ.QxApiClient.CloneQuoteRequestBody requestBody {
        get;
        set;
    }
    global CloneQuoteRequest() {

    }
}
global class CloneQuoteRequestBody {
    global String description {
        get;
        set;
    }
    global CloneQuoteRequestBody() {

    }
}
global class CloneQuoteResponse extends CameleonCPQ.QxApiClient.QxResponse {
    global String id {
        get;
    }
    global CloneQuoteResponse() {

    }
}
global class CloseSessionRequest {
    global CameleonCPQ.QxApiClient.QxRequestContext qxReqCtx {
        get;
        set;
    }
    global CloseSessionRequest() {

    }
}
global class CloseSessionResponse extends CameleonCPQ.QxApiClient.QxResponse {
    global CloseSessionResponse() {

    }
}
global class ContextValue {
    global String key {
        get;
        set;
    }
    global CameleonCPQ.QxApiClient.value value {
        get;
        set;
    }
    global ContextValue(String key, CameleonCPQ.QxApiClient.value value) {

    }
}
global class CreateQuoteRequest {
    global CameleonCPQ.QxApiClient.QxRequestContext qxReqCtx {
        get;
        set;
    }
    global Boolean updQxQuoteId {
        get;
        set;
    }
    global CreateQuoteRequest() {

    }
}
global class CreateQuoteResponse extends CameleonCPQ.QxApiClient.QxResponse {
    global String id {
        get;
    }
    global CreateQuoteResponse() {

    }
}
global class DebugFactory {
    global DebugFactory() {

    }
}
global class GenerateQuoteReportBody {
    global String actionName {
        get;
        set;
    }
    global GenerateQuoteReportBody() {

    }
}
global class GenerateQuoteReportRequest {
    global CameleonCPQ.QxApiClient.QxRequestContext qxReqCtx {
        get;
        set;
    }
    global CameleonCPQ.QxApiClient.GenerateQuoteReportBody requestBody {
        get;
        set;
    }
    global GenerateQuoteReportRequest() {

    }
}
global class GenerateQuoteReportResponse extends CameleonCPQ.QxApiClient.QxResponse {
    global String reportId {
        get;
    }
    global GenerateQuoteReportResponse() {

    }
}
global class GetQuoteActionsRequest {
    global CameleonCPQ.QxApiClient.QuoteActionType actionType {
        get;
        set;
    }
    global CameleonCPQ.QxApiClient.QxRequestContext qxReqCtx {
        get;
        set;
    }
    global GetQuoteActionsRequest() {

    }
}
global class GetQuoteActionsResponse extends CameleonCPQ.QxApiClient.QxResponse {
    global List<CameleonCPQ.QxApiClient.QuoteAction> actions {
        get;
    }
    global GetQuoteActionsResponse() {

    }
}
global class GetQuoteReportActionsRequest {
    global String country {
        get;
        set;
    }
    global String language {
        get;
        set;
    }
    global CameleonCPQ.QxApiClient.QxRequestContext qxReqCtx {
        get;
        set;
    }
    global GetQuoteReportActionsRequest() {

    }
}
global class GetQuoteReportActionsResponse extends CameleonCPQ.QxApiClient.QxResponse {
    global List<CameleonCPQ.QxApiClient.QuoteReportAction> actions {
        get;
    }
    global GetQuoteReportActionsResponse() {

    }
}
global class GetQuoteReportRequest {
    global CameleonCPQ.QxApiClient.QxRequestContext qxReqCtx {
        get;
        set;
    }
    global String reportId {
        get;
        set;
    }
    global GetQuoteReportRequest() {

    }
}
global class GetQuoteReportResponse extends CameleonCPQ.QxApiClient.QxResponse {
    global String fileType {
        get;
    }
    global Blob reportBody {
        get;
    }
    global GetQuoteReportResponse() {

    }
}
global class GetQuoteReportStatusRequest {
    global CameleonCPQ.QxApiClient.QxRequestContext qxReqCtx {
        get;
        set;
    }
    global String reportId {
        get;
        set;
    }
    global GetQuoteReportStatusRequest() {

    }
}
global class GetQuoteReportStatusResponse extends CameleonCPQ.QxApiClient.QxResponse {
    global String status {
        get;
    }
    global GetQuoteReportStatusResponse() {

    }
}
global class GetQuoteStateRequest {
    global CameleonCPQ.QxApiClient.QxRequestContext qxReqCtx {
        get;
        set;
    }
    global GetQuoteStateRequest() {

    }
}
global class GetQuoteStateResponse extends CameleonCPQ.QxApiClient.QxResponse {
    global String status {
        get;
    }
    global GetQuoteStateResponse() {

    }
}
global class GetQuoteUIContentRequest {
    global CameleonCPQ.QxApiClient.QxRequestContext qxReqCtx {
        get;
        set;
    }
    global String returnUrl {
        get;
        set;
    }
    global String stepId {
        get;
        set;
    }
    global GetQuoteUIContentRequest() {

    }
}
global class GetQuoteUIContentResponse extends CameleonCPQ.QxApiClient.QxResponse {
    global String qxUIContent {
        get;
    }
    global GetQuoteUIContentResponse() {

    }
}
global class GetStepsRequest {
    global CameleonCPQ.QxApiClient.QxRequestContext qxReqCtx {
        get;
        set;
    }
    global GetStepsRequest() {

    }
}
global class GetStepsResponse extends CameleonCPQ.QxApiClient.QxResponse {
    global String description {
        get;
    }
    global String quoteId {
        get;
    }
    global String quoteModelName {
        get;
    }
    global List<CameleonCPQ.QxApiClient.QuoteStep> steps {
        get;
    }
    global GetStepsResponse() {

    }
}
global interface IDebug {
    void debug(String param0);
    void debug(String param0, String param1);
    String getLoggingFileName(Id param0);
    String getLoggingLevel();
}
global class InitSessionRequest {
    global InitSessionRequest() {

    }
}
global class InitSessionResponse extends CameleonCPQ.QxApiClient.QxResponse {
    global String authToken {
        get;
        set;
    }
    global String sessionId {
        get;
        set;
    }
    global InitSessionResponse() {

    }
}
global enum LogLevel {ERROR, INFO, WARN}
global class LogMessageRequest {
    global CameleonCPQ.QxApiClient.QxLogMessageRequest qxLogMsgRequest {
        get;
        set;
    }
    global CameleonCPQ.QxApiClient.QxRequestContext qxReqCtx {
        get;
        set;
    }
    global LogMessageRequest() {

    }
}
global class LogMessageResponse extends CameleonCPQ.QxApiClient.QxResponse {
    global LogMessageResponse() {

    }
}
global class PullExportRequest {
    global String exportId {
        get;
        set;
    }
    global Integer partNumber {
        get;
        set;
    }
    global CameleonCPQ.QxApiClient.QxRequestContext qxReqCtx {
        get;
        set;
    }
    global PullExportRequest() {

    }
}
global class PullExportResponse extends CameleonCPQ.QxApiClient.QxResponse {
    global Map<String,Object> spreadsheetExport {
        get;
    }
    global PullExportResponse() {

    }
}
global class PushContextRequest {
    global List<CameleonCPQ.QxApiClient.ContextValue> context {
        get;
        set;
    }
    global String dataProviderName {
        get;
        set;
    }
    global String modelName {
        get;
        set;
    }
    global String quoteId {
        get;
        set;
    }
    global PushContextRequest() {

    }
}
global class PushDataRequest {
    global CameleonCPQ.QxApiClient.QxRequestContext qxReqCtx {
        get;
        set;
    }
    global PushDataRequest() {

    }
}
global class PushDataResponse extends CameleonCPQ.QxApiClient.QxResponse {
    global PushDataResponse() {

    }
}
global class QuoteAction {
    global String label {
        get;
    }
    global String name {
        get;
        set;
    }
    global QuoteAction() {

    }
}
global enum QuoteActionType {REFRESH, REPORT, SYNCHRONIZE}
global class QuoteReportAction {
    global String label {
        get;
    }
    global String name {
        get;
        set;
    }
}
global enum QuoteStatus {Failed, InProgress, Ready}
global class QuoteStep {
    global String description {
        get;
    }
    global String id {
        get;
    }
    global QuoteStep() {

    }
}
global class QxApiClientException extends Exception {
}
global class QxApiException extends Exception {
    global Integer code {
        get;
    }
    global Integer logId {
        get;
    }
    global String message {
        get;
    }
    global String serviceName {
        get;
    }
}
global class QxCreateQuoteRequest {
    global String country {
        get;
        set;
    }
    global String description {
        get;
        set;
    }
    global String language {
        get;
        set;
    }
    global String modelName {
        get;
        set;
    }
    global String qxCurrency {
        get;
        set;
    }
    global QxCreateQuoteRequest() {

    }
}
global class QxLogMessageRequest {
    global String logLevel {
        get;
        set;
    }
    global String message {
        get;
        set;
    }
    global QxLogMessageRequest() {

    }
}
global class QxRequestContext {
    global String authToken {
        get;
        set;
    }
    global String crmQuoteId {
        get;
        set;
    }
    global String locale {
        get;
        set;
    }
    global String qxQuoteId {
        get;
        set;
    }
    global String requestId {
        get;
        set;
    }
    global String sessionId {
        get;
        set;
    }
    global QxRequestContext() {

    }
}
global abstract class QxResponse {
    global CameleonCPQ.QxApiClient.QxApiException qxException {
        get;
    }
    global Integer statusCode {
        get;
    }
    global QxResponse() {

    }
}
global class QxSetup {
    global QxSetup() {

    }
}
global enum ReportStatus {Failed, InProgress, Ready}
global class value {
    global value(String value, String qxCurrency) {

    }
}
}
