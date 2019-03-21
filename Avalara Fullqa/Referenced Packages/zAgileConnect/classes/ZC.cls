/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global abstract class ZC {
    global static zsfjira.ZC.IssueFactory IssueFactory;
    global static zsfjira.ZC.IssueApi Issues;
    global static zsfjira.ZC.ZSync SyncAPI;
global class IssueApi extends zsfjira.ZC {
    global List<zsfjira.ZCBeans.IssueUpsertResult> bulkCreateIssues(List<zsfjira.ZCBeans.IssueTemplate> lstIssues) {
        return null;
    }
    global List<zsfjira.ZCBeans.IssueUpsertResult> bulkUpdateIssues(List<zsfjira.ZCBeans.IssueTemplate> lstIssues) {
        return null;
    }
    global zsfjira.ZCBeans.IssueUpsertResult createIssue(zsfjira.ZCBeans.IssueTemplate issue) {
        return null;
    }
    global zsfjira.ZCBeans.IssueCommentResult createJIRAIssueComment(String issueKeyOrId, String comment) {
        return null;
    }
    global zsfjira.ZCBeans.IssueDeleteResult deleteIssue(String issueKey, Id entityId) {
        return null;
    }
    global List<zsfjira.ZCBeans.IssueDeleteResult> deleteIssues(Set<String> selectedIssueKeys, Id entityId) {
        return null;
    }
    global zsfjira.ZCBeans.IssueLinkUnlinkResult linkIssue(String issueKey, Id entityId) {
        return null;
    }
    global List<zsfjira.ZCBeans.IssueLinkUnlinkResult> linkIssues(Set<String> selectedIssueKeys, Id entityId) {
        return null;
    }
    global void postCreateIssueErrorMessage(zsfjira.ZCBeans.IssueUpsertResult issue) {

    }
    global void postCreateIssueErrorMessage(String errorMessage, zsfjira.ZCBeans.IssueUpsertResult issue) {

    }
    global void postCreateIssueErrorMessages(List<zsfjira.ZCBeans.IssueUpsertResult> lstIssues) {

    }
    global void postCreateIssueErrorMessages(String errorMessage, List<zsfjira.ZCBeans.IssueUpsertResult> lstIssues) {

    }
    global void postErrorMessage(Id entityId, zsfjira.ZCBeans.IssueLinkUnlinkDeleteResult iresults) {

    }
    global void postErrorMessageToEntity(Id entityId, zsfjira.ZCBeans.IssueUpsertResult issue) {

    }
    global void postErrorMessageToEntity(Id entityId, String errorMessage, zsfjira.ZCBeans.IssueUpsertResult issue) {

    }
    global void postErrorMessagesToEntity(Id entityId, List<zsfjira.ZCBeans.IssueUpsertResult> lstIssues) {

    }
    global void postErrorMessagesToEntity(Id entityId, String errorMessage, List<zsfjira.ZCBeans.IssueUpsertResult> lstIssues) {

    }
    global void postErrorMessages(Id entityId, List<zsfjira.ZCBeans.IssueLinkUnlinkDeleteResult> iresults) {

    }
    global void postErrorMessages(List<zsfjira.ZCBeans.GenericErrorMessage> errorMessages) {

    }
    global zsfjira.ZCBeans.AttachmentRequestResult sendAttachments(Id onErrorEntityID, List<zsfjira.ZCBeans.SalesforceAttachment> attachments) {
        return null;
    }
    global zsfjira.ZCBeans.IssueLinkUnlinkResult unLinkIssue(String issueKey, Id entityId) {
        return null;
    }
    global List<zsfjira.ZCBeans.IssueLinkUnlinkResult> unLinkIssues(Set<String> selectedIssueKeys, Id entityId) {
        return null;
    }
    global zsfjira.ZCBeans.IssueUpsertResult updateIssue(zsfjira.ZCBeans.IssueTemplate issue) {
        return null;
    }
    global zsfjira.ZCBeans.IssueCommentResult updateJIRAIssueComment(String issueKeyOrId, String issueCommentId, String comment) {
        return null;
    }
    global List<zsfjira.ZCBeans.IssueUpsertResult> validateAndSanitizeBulkCreateIssuesInput(List<zsfjira.ZCBeans.IssueTemplate> lstIssues) {
        return null;
    }
    global List<zsfjira.ZCBeans.IssueUpsertResult> validateAndSanitizeBulkUpdateIssuesInput(List<zsfjira.ZCBeans.IssueTemplate> lstIssues) {
        return null;
    }
    global List<zsfjira.ZCBeans.IssueUpsertResult> validateBulkCreateIssuesInput(List<zsfjira.ZCBeans.IssueTemplate> lstIssues) {
        return null;
    }
    global List<zsfjira.ZCBeans.IssueUpsertResult> validateBulkUpdateIssuesInput(List<zsfjira.ZCBeans.IssueTemplate> lstIssues) {
        return null;
    }
}
global class IssueFactory extends zsfjira.ZC {
    global zsfjira.ZCBeans.IssueTemplate buildCreateTemplateFromMapping(Id entityId) {
        return null;
    }
    global List<zsfjira.ZCBeans.IssueTemplate> buildCreateTemplateFromMapping(List<Id> entityIds) {
        return null;
    }
    global zsfjira.ZCBeans.IssueTemplate buildUpdateTemplateFromMapping(String issueKey) {
        return null;
    }
    global List<zsfjira.ZCBeans.IssueTemplate> buildUpdateTemplateFromMapping(Set<String> issueKeys) {
        return null;
    }
}
global class ZSync extends zsfjira.ZC {
    global ZSync() {

    }
    global List<zsfjira__ZIssue__c> retrieveZIssueDataByIdFromJIRA(List<String> lstIssueIds) {
        return null;
    }
    global List<zsfjira__ZIssue__c> retrieveZIssueDataByIdFromJIRA(List<String> lstIssueIds, Set<String> fields) {
        return null;
    }
    global List<zsfjira__ZIssue__c> retrieveZIssueDataByKeyFromJIRA(List<String> lstIssueKeys) {
        return null;
    }
    global List<zsfjira__ZIssue__c> retrieveZIssueDataByKeyFromJIRA(List<String> lstIssueKeys, Set<String> fields) {
        return null;
    }
}
}
