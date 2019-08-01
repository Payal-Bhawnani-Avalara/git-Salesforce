({
    qqNFR : function(component, event, helper) {
        var id = component.get("v.recordId");
        var action = component.get("c.qqNFR"); 
        
        action.setParams({
            "opportunityId" : id
        });
        
      action.setCallback(this,
            //We define what to do inside a function that gets the response from the Apex controller as a parameter
            function(response){
                //This saves the state of the response (successful or not).
            	var state = response.getState();
            	if(state === "SUCCESS"){
                    var resultsToast = $A.get("e.force:showToast");
                    resultsToast.setParams({
                        "title" : "Success",
                        "message" : "The opportunity was updated.",
                        "type" : "success"
                    });
                    resultsToast.fire();
                	var refreshPageAction = $A.get("e.force:refreshView").fire();
                	var closeModalAction = $A.get("e.force:closeQuickAction").fire();
            	} else if (state === "ERROR") {
                  var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " + errors[0].message);
                            component.set("v.message", errors[0].message);
                        }else if (errors[0] && errors[0].pageErrors) {
                           component.set("v.message", errors[0].pageErrors[0].message);

                       }  
                    }               
                }
   			});
        //This executes the function in the APEX controller
        $A.enqueueAction(action);
	},
    
    cancel : function(component, event, helper){
        $A.get("e.force:closeQuickAction").fire();
    }
})