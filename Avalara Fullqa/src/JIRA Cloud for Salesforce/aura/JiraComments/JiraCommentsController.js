({
    doInit: function (cmp, evt) {
        if (evt && evt.getParam("shouldRefreshComments") === false) {
            return;
        }
        JCFS_LIGHTNING.JiraCommentsController.render(cmp);
    },
    toggleCommentSortOrder: function (cmp) {
        JCFS_LIGHTNING.JiraCommentsController.toggleCommentSortOrder(cmp);
    },
});