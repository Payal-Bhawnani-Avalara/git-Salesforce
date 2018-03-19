({
    onInit: function (cmp) {
        JCFS_LIGHTNING.JiraLookupController.onInit(cmp);
    },
    handleInputClick: function (cmp, evt) {
        JCFS_LIGHTNING.JiraLookupController.handleInputClick(evt);
    },
    handleSearchingClick: function (cmp) {
        JCFS_LIGHTNING.JiraLookupController.handleSearchingClick(cmp);
    },
    handleInputFocus: function (cmp) {
        JCFS_LIGHTNING.JiraLookupController.handleInputFocus(cmp);
    },
    cancelLookup: function (cmp) {
        JCFS_LIGHTNING.JiraLookupController.cancelLookup(cmp);
    },
    handleInputKeyDown: function (cmp, evt) {
        JCFS_LIGHTNING.JiraLookupController.handleInputKeyDown(cmp, evt);
    },
    handleInputKeyUp: function (cmp, evt) {
        JCFS_LIGHTNING.JiraLookupController.handleInputKeyUp(cmp, evt);
    },
    handleRecordClick: function (cmp, evt) {
        JCFS_LIGHTNING.JiraLookupController.handleRecordClick(cmp, evt);
    },
    handlePillClick: function (cmp, evt) {
        JCFS_LIGHTNING.JiraLookupController.handlePillClick(cmp, evt);
    },
    handleFocusIndexChange: function (cmp) {
        JCFS_LIGHTNING.JiraLookupController.handleFocusIndexChange(cmp);
    },
    handleValueChange: function (cmp) {
        JCFS_LIGHTNING.JiraLookupController.handleValueChange(cmp);
    },
    showError: function (cmp, event) {
        JCFS_LIGHTNING.JiraLookupController.showError(cmp, event.getParam("arguments").errorMessage);
    },
    hideError: function (cmp) {
        JCFS_LIGHTNING.JiraLookupController.hideError(cmp);
    },
});