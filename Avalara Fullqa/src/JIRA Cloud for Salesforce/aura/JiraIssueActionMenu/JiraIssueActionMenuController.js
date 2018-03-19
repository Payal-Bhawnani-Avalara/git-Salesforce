({
    handleMenuSelect: function (cmp, evt) {
        JCFS_LIGHTNING.JiraIssueActionMenuController.handleMenuSelect(cmp, evt.getParam("value"));
    },
    refreshIssues: function () {
        JCFS_LIGHTNING.Commands.refreshIssues($A.get("e.JCFS:AssociationsChanged"))
    },
    refreshIssuesAndComments: function () {
        JCFS_LIGHTNING.Commands.refreshIssuesAndComments($A.get("e.JCFS:AssociationsChanged"));
    },
});