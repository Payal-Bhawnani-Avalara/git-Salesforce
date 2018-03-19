({
    initAndOpenModal: function (cmp) {
        JCFS_LIGHTNING.JiraAssociationController.init(cmp);
        JCFS_LIGHTNING.Commands.openModal(cmp);
    },
    closeModal: function (cmp) {
        JCFS_LIGHTNING.Commands.closeModal(cmp);
    },
    createAssociation: function (cmp) {
        JCFS_LIGHTNING.JiraAssociationController.createAssociation(cmp);
    },
    syncSettingsChanged: function (cmp) {
        JCFS_LIGHTNING.JiraAssociationController.syncSettingsChanged(cmp);
    },
    viewOnlyChanged: function (cmp) {
        JCFS_LIGHTNING.JiraAssociationController.viewOnlyChanged(cmp);
    },
    updateHelpfulMessage: function (cmp) {
        JCFS_LIGHTNING.JiraAssociationController.updateHelpfulMessage(cmp);
    },
    refreshIssuesAndComments: function () {
        JCFS_LIGHTNING.Commands.refreshIssuesAndComments($A.get("e.JCFS:AssociationsChanged"));
    },
});