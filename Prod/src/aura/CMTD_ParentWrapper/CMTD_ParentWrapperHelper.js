({
retrieveDetail : function(component, event) {
    var action = component.get("c.getAccountId");
    action.setParams({
        caseId : component.get("v.recordId")
    })
    action.setCallback(this, function(response) {
        var state = response.getState();
        if (state === "SUCCESS") {
            var result = response.getReturnValue();
            if(result != ''){
                 component.set("v.accountId", response.getReturnValue());
                component.set("v.showComponent", true);
            }else 
            {
                 component.set("v.showComponent", false);
            }
           
        } else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                if (errors[0] && errors[0].message) {
                console.log("Error message: " + errors[0].message);
            }
            } else {
                console.log("Unknown error");
            }
        }
     });
    $A.enqueueAction(action);
   }
})