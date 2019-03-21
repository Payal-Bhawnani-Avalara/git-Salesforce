({
 	doinit : function(component, event, helper) {    //  component, event, helper are parameter                                                                                                of doinit function
        var action = component.get('c.getSubVersions');
        action.setParams({  vId : component.get("v.idVersion") });
        // Set up the callback
        //var self = this;
        action.setStorable();
        action.setCallback(this, function(actionResult) {
         component.set('v.subVersions', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
        /////
        var badgesAction = component.get('c.getBadges');
        badgesAction.setParams({  vId : component.get("v.idVersion") });
        // Set up the callback
        //var self = this;
        badgesAction.setStorable();
        badgesAction.setCallback(this, function(actionResult) {
         component.set('v.badges', actionResult.getReturnValue());
        });
        $A.enqueueAction(badgesAction);
 }
})