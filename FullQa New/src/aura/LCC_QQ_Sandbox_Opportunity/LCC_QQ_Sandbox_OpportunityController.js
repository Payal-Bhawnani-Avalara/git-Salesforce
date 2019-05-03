({
    qqSandbox : function(component, event, helper) {
        var id = component.get("v.recordId");
        var action = component.get("c.qqSandboxExt"); 
        
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
            	}else{
                    //This is a common way to handle possible errors.
                	var errors = response.getError();
                    if(errors){
                        if(errors[0] && errors[0].message){
                            console.log("Error Message: " + errors[0].message);
                        }else{
                            console.log("Unknown error");
                        }
                    }
            	}
        	}
        );
        //This executes the function in the APEX controller
        $A.enqueueAction(action);
	},
    
    cancel : function(component, event, helper){
        $A.get("e.force:closeQuickAction").fire();
    }
    
})