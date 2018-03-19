({
    openModal: function (cmp, evt) {
        JCFS_LIGHTNING.JiraConfigureAssociationController.init(cmp, evt);
        JCFS_LIGHTNING.Commands.openModal(cmp);
    },
    closeModal: function (cmp) {
        JCFS_LIGHTNING.Commands.closeModal(cmp);
    },
    configureAssociation: function (cmp) {
        JCFS_LIGHTNING.JiraConfigureAssociationController.configureAssociation(cmp);
    },
    viewOnlyChanged: function (cmp) {
        JCFS_LIGHTNING.JiraConfigureAssociationController.viewOnlyChanged(cmp);
    },
    refreshIssues: function () {
        JCFS_LIGHTNING.Commands.refreshIssues($A.get("e.JCFS:AssociationsChanged"))
    },
});