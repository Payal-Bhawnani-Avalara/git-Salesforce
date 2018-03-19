({
	doInit : function(component) {
        try {
            if(component.get("v.contractStartDate")!=null) {
               component.set("v.contractStartDate", $A.localizationService.formatDateTime(component.get("v.contractStartDate"), $A.get("$Locale.dateFormat")));
            }
            if(component.get("v.contractEndDate")!=null) {
               component.set("v.contractEndDate", $A.localizationService.formatDateTime(component.get("v.contractEndDate"), $A.get("$Locale.dateFormat")));
            }
        }
        catch(e) {
            console.log(e);
        }
	},
    createContract: function(component, event, helper) {
        helper.validateContract(component);
    }
})