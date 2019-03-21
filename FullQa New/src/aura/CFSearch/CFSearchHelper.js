({
	getConnectorList : function(component) {
        var action = component.get('c.searchConnectors');
        action.setParams({  searchString : component.get("v.searchText") });
        console.log('Call apex contoller ');
        console.log('searchString=== '+component.get("v.searchText"));
        // Set up the callback
        var self = this;
        action.setStorable();
        action.setCallback(this, function(actionResult) {
         component.set('v.connectors', actionResult.getReturnValue());
            console.log('data==='+JSON.stringify(actionResult.getReturnValue()));
        });
        $A.enqueueAction(action);		
	}
})