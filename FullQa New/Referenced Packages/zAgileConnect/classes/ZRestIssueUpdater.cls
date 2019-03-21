/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
@RestResource(urlMapping='/ZRestIssueUpdater/*')
global class ZRestIssueUpdater {
    global ZRestIssueUpdater() {

    }
    @HttpPost
    global static zsfjira.ZRestContext.ResponseHandler updateLastUpdatedIssues(List<zsfjira.ZRestIssueUpdater.IssueInfoUpdate> updates, List<zsfjira.ZRestIssueUpdater.IssueInfoDelete> deletes) {
        return null;
    }
global virtual class IssueInfo {
    global IssueInfo() {

    }
}
global class IssueInfoDelete extends zsfjira.ZRestIssueUpdater.IssueInfo {
    global IssueInfoDelete() {

    }
}
global class IssueInfoUpdate extends zsfjira.ZRestIssueUpdater.IssueInfo {
    global IssueInfoUpdate() {

    }
}
}
