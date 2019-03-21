({
	handleSearch : function(component, event, helper) {
        var inputCmp = component.find("txtSearch");
        var value = inputCmp.get("v.value");
        var errorsOnPage=false;
        // is input valid text?
        if (value === "" || value.length<3) {
            inputCmp.setCustomValidity("Please enter atleast 3 characters to search");
            errorsOnPage=true;
        } 
        else {
            inputCmp.setCustomValidity(""); // if there was a custom error before, reset it
        }
        inputCmp.reportValidity();
        if(!errorsOnPage){
            console.log('Call getConnectorList ');
			helper.getConnectorList(component);
        }
	},
    toggle: function(component, event, helper) {
        var items = component.get("v.connectors");
        var index = event.getSource().get("v.value");
        items[index].Expanded__c = !items[index].Expanded__c;
        
        component.set("v.connectors", items);
    }    
})