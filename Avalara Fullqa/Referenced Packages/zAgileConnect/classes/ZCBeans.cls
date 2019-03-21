/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class ZCBeans {
    global ZCBeans() {

    }
global class AttachmentRequestResult {
    global AttachmentRequestResult() {

    }
    global AttachmentRequestResult(String errorMessage) {

    }
    global String getErrorMessage() {
        return null;
    }
    global Boolean hasError() {
        return null;
    }
}
global class GenericErrorMessage {
    global GenericErrorMessage(Id entityId, List<String> errorMessages) {

    }
    global GenericErrorMessage(Id entityId, String errorMessage) {

    }
    global void addErrorMessage(String errorMessage) {

    }
    global List<String> getErrorMessages() {
        return null;
    }
}
global class IdIssueFieldValue implements zsfjira.ZCBeans.KeyOrIdIssueFieldValue, zsfjira.ZCBeans.NameOrIdIssueFieldValue {
    global IdIssueFieldValue(String id) {

    }
    global String getId() {
        return null;
    }
    global void setId(String id) {

    }
    global override String toString() {
        return null;
    }
}
global class IssueCommentResult {
    global String issueKeyOrId;
    global IssueCommentResult(String issueKeyOrId, String issueCommentId) {

    }
    global IssueCommentResult(String issueKeyOrId, String issueCommentId, String errorMessage) {

    }
    global String getErrorMessage() {
        return null;
    }
    global String getIssueCommentId() {
        return null;
    }
    global Boolean hasError() {
        return null;
    }
}
global class IssueDeleteResult extends zsfjira.ZCBeans.IssueLinkUnlinkDeleteResult {
    global IssueDeleteResult(String issueKey) {

    }
    global IssueDeleteResult(String issueKey, String errorMessage) {

    }
}
global virtual class IssueLinkUnlinkDeleteResult {
    global String errorMessage;
    global String issueKey;
    global Boolean hasError() {
        return null;
    }
}
global class IssueLinkUnlinkResult extends zsfjira.ZCBeans.IssueLinkUnlinkDeleteResult {
    global IssueLinkUnlinkResult(String issueKey) {

    }
    global IssueLinkUnlinkResult(String issueKey, String errorMessage) {

    }
}
global class IssueTemplate {
    global IssueTemplate(Id entityId) {

    }
    global IssueTemplate(String issueKey) {

    }
    global void addAffectVersion(zsfjira.ZCBeans.NameOrIdIssueFieldValue version) {

    }
    global void addComponent(zsfjira.ZCBeans.NameOrIdIssueFieldValue component) {

    }
    global void addCustomField(String field, Object value) {

    }
    global void addFixVersion(zsfjira.ZCBeans.NameOrIdIssueFieldValue fixVersion) {

    }
    global void addLabel(String label) {

    }
    global List<zsfjira.ZCBeans.NameOrIdIssueFieldValue> getAffectVersions() {
        return null;
    }
    global zsfjira.ZCBeans.NameIssueFieldValue getAssignee() {
        return null;
    }
    global List<zsfjira.ZCBeans.NameOrIdIssueFieldValue> getComponents() {
        return null;
    }
    global Map<String,Object> getCustomFields() {
        return null;
    }
    global String getDescription() {
        return null;
    }
    global String getDuedate() {
        return null;
    }
    global String getEnvironment() {
        return null;
    }
    global List<zsfjira.ZCBeans.NameOrIdIssueFieldValue> getFixVersions() {
        return null;
    }
    global zsfjira.ZCBeans.NameOrIdIssueFieldValue getIssueType() {
        return null;
    }
    global List<String> getLabels() {
        return null;
    }
    global zsfjira.ZCBeans.NameOrIdIssueFieldValue getPriority() {
        return null;
    }
    global zsfjira.ZCBeans.KeyOrIdIssueFieldValue getProject() {
        return null;
    }
    global zsfjira.ZCBeans.NameIssueFieldValue getReporter() {
        return null;
    }
    global String getSummary() {
        return null;
    }
    global void setAffectVersions(List<zsfjira.ZCBeans.NameOrIdIssueFieldValue> versions) {

    }
    global void setAssignee(zsfjira.ZCBeans.NameIssueFieldValue assignee) {

    }
    global void setComponents(List<zsfjira.ZCBeans.NameOrIdIssueFieldValue> components) {

    }
    global void setCustomFields(Map<String,Object> customFields) {

    }
    global void setDescription(String description) {

    }
    global void setDuedate(Date duedate) {

    }
    global void setDuedateString(String duedate) {

    }
    global void setEntityId(Id entityId) {

    }
    global void setEnvironment(String environment) {

    }
    global void setFixVersions(List<zsfjira.ZCBeans.NameOrIdIssueFieldValue> fixVersions) {

    }
    global void setIssueType(zsfjira.ZCBeans.NameOrIdIssueFieldValue issueType) {

    }
    global void setLabels(List<String> labels) {

    }
    global void setPriority(zsfjira.ZCBeans.NameOrIdIssueFieldValue priority) {

    }
    global void setProject(zsfjira.ZCBeans.KeyOrIdIssueFieldValue project) {

    }
    global void setReporter(zsfjira.ZCBeans.NameIssueFieldValue reporter) {

    }
    global void setSummary(String summary) {

    }
}
global class IssueUpsertResult {
    global Id getEntityId() {
        return null;
    }
    global List<String> getErrorMessages() {
        return null;
    }
    global String getIssueId() {
        return null;
    }
    global String getIssueKey() {
        return null;
    }
    global List<String> getWarningMessages() {
        return null;
    }
    global Boolean hasError() {
        return null;
    }
    global Boolean hasWarnings() {
        return null;
    }
}
global class KeyIssueFieldValue implements zsfjira.ZCBeans.KeyOrIdIssueFieldValue {
    global KeyIssueFieldValue(String key) {

    }
    global String getKey() {
        return null;
    }
    global void setKey(String key) {

    }
    global override String toString() {
        return null;
    }
}
global interface KeyOrIdIssueFieldValue {
    String toString();
}
global class NameIssueFieldValue implements zsfjira.ZCBeans.NameOrIdIssueFieldValue {
    global NameIssueFieldValue(String name) {

    }
    global String getName() {
        return null;
    }
    global void setName(String name) {

    }
    global override String toString() {
        return null;
    }
}
global interface NameOrIdIssueFieldValue {
    String toString();
}
global class SalesforceAttachment {
    global SalesforceAttachment(Id salesforceFileID, String issueKey) {

    }
}
global class ZIssueCreateParameters {
    @InvocableVariable( required=false)
    global String affectVersionName;
    @InvocableVariable( required=false)
    global String assigneeName;
    @InvocableVariable( required=false)
    global String componentName;
    @InvocableVariable( required=false)
    global String customfieldsJSON;
    @InvocableVariable( required=false)
    global String description;
    @InvocableVariable( required=false)
    global Date duedate;
    @InvocableVariable( required=true)
    global Id entityId;
    @InvocableVariable( required=false)
    global String environment;
    @InvocableVariable( required=false)
    global String fixVersionName;
    @InvocableVariable( required=false)
    global String issueTypeName;
    @InvocableVariable( required=false)
    global String label;
    @InvocableVariable( required=false)
    global String priorityName;
    @InvocableVariable( required=false)
    global String projectKey;
    @InvocableVariable( required=false)
    global String reporterName;
    @InvocableVariable( required=false)
    global String summary;
    global ZIssueCreateParameters() {

    }
}
global class ZIssueLinkUnlinkDeleteParameters {
    @InvocableVariable( required=true)
    global Id entityId;
    @InvocableVariable( required=true)
    global String issueKey;
    global ZIssueLinkUnlinkDeleteParameters() {

    }
}
global class ZIssueProcessResult {
    @InvocableVariable( required=false)
    global Boolean error;
    @InvocableVariable( required=false)
    global String errorMessage;
    @InvocableVariable( required=false)
    global String identifier;
    global ZIssueProcessResult() {

    }
}
global class ZIssueUpdateParameters {
    @InvocableVariable( required=false)
    global String affectVersionName;
    @InvocableVariable( required=false)
    global String assigneeName;
    @InvocableVariable( required=false)
    global String componentName;
    @InvocableVariable( required=false)
    global String customfieldsJSON;
    @InvocableVariable( required=false)
    global String description;
    @InvocableVariable( required=false)
    global Date duedate;
    @InvocableVariable( required=false)
    global String environment;
    @InvocableVariable( required=false)
    global String fixVersionName;
    @InvocableVariable( required=true)
    global String issueKey;
    @InvocableVariable( required=false)
    global String issueTypeName;
    @InvocableVariable( required=false)
    global String label;
    @InvocableVariable( required=false)
    global String priorityName;
    @InvocableVariable( required=false)
    global String reporterName;
    @InvocableVariable( required=false)
    global String summary;
    global ZIssueUpdateParameters() {

    }
}
}
