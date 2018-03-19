({
	validateContract : function(component) {
        var contractStartDate = null;
        var contractEndDate = null;
        
		var dateStr = component.get("v.contractStartDate");
        try {
            contractStartDate = (dateStr==null || dateStr.length == 0) ? new Date() : new Date(dateStr);
        }
        catch(e) {
            console.log(e);
        }
         
        dateStr = component.get("v.contractEndDate");
        if(dateStr != null && dateStr.length >0) {
           try {
               contractEndDate = new Date(dateStr);            
           }
           catch(e) {
               console.log(e);
           }
        }
                                    
        if(contractEndDate!=null && contractStartDate!=null && contractStartDate>contractEndDate) {
           alert($A.get('$Label.cameleoncpq.MSG_CLM_INVALID_DATES'));
		}
		else {
           this.createContract(
               component, 
               contractStartDate!=null ? contractStartDate.getFullYear()+"-"+(contractStartDate.getMonth()+1)+"-"+contractStartDate.getDate() : null,
               contractEndDate!=null ? contractEndDate.getFullYear()+"-"+(contractEndDate.getMonth()+1)+"-"+contractEndDate.getDate() : null);
		}

	},
	createContract : function(component, contractStartDate, contractEndDate) {
 		var createContractAction = component.get("c.createContractFromQuoteLex");

        createContractAction.setParams({
            "quoteID": component.get("v.recordId"),
            "contractStartDate": contractStartDate,
            "contractEndDate": contractEndDate
        });
        createContractAction.setCallback(this, function(response) {
            var returnUrl = '/'+component.get("v.recordId");
            if (response.getState() === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        alert(errors[0].message);
                    }
                } else {
                    alert("Unknown error");
                }
			}
            else if (response.getState() === "SUCCESS") {
                var clmInfos = response.getReturnValue();
                if(clmInfos.errorMessage!=null && clmInfos.errorMessage.length>0) {
                    alert(clmInfos.errorMessage);
                }
                else {
                    returnUrl = '/'+clmInfos.objectId;
                }
			}
            var navEvt = $A.get("e.CameleonCPQ:navigateToURL");
            navEvt.setParams({
               "url": returnUrl
            });
            navEvt.fire();
        });
        var spinner = component.find("ccSpinner");
        $A.util.toggleClass(spinner, "slds-hide");

        $A.enqueueAction(createContractAction);
	}
})