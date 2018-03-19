({
    doInit: function(component, event, helper) {
      var entityType = component.get("v.entityType");
      component.set("v.btnLabel", ((typeof entityType != 'undefined') && (entityType != null)) ? ('Back to '+entityType) : 'Close');
    },
    redirect: function(component, event, helper) {
      helper.redirect(component);
    }
})