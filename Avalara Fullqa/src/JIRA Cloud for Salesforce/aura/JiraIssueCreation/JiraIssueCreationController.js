({
    initAndOpenModal: function (cmp) {
        cmp.set("v.formLayout", "basicForm");
        JCFS_LIGHTNING.JiraIssueCreationController.init(cmp);
        JCFS_LIGHTNING.Commands.openModal(cmp);
    },
    createIssue: function (cmp) {
        JCFS_LIGHTNING.JiraIssueCreationController.createIssue(cmp);
    },
    changeLayoutToReviewAndCreate: function (cmp) {
        JCFS_LIGHTNING.JiraIssueCreationController.changeLayoutToReviewAndCreate(cmp);
    },
    advancedCreateIssue: function (cmp) {
        JCFS_LIGHTNING.JiraIssueCreationController.advancedCreateIssue(cmp);
    },
    onProjectChange: function (cmp) {
        JCFS_LIGHTNING.JiraIssueCreationController.projectChanged(cmp);
    },
    syncSettingsChanged: function (cmp) {
        JCFS_LIGHTNING.JiraIssueCreationController.syncSettingsChanged(cmp);
    },
    viewOnlyChanged: function (cmp) {
        JCFS_LIGHTNING.JiraIssueCreationController.viewOnlyChanged(cmp);
    },
    updateHelpfulMessage: function (cmp) {
        JCFS_LIGHTNING.JiraIssueCreationController.updateHelpfulMessage(cmp);
    },
    closeModal: function (cmp) {
        JCFS_LIGHTNING.Commands.closeModal(cmp);
    },
    refreshIssuesAndComments: function () {
        JCFS_LIGHTNING.Commands.refreshIssuesAndComments($A.get("e.JCFS:AssociationsChanged"));
    },
});