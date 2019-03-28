({
    saveData : function(component, event, helper) {
        var action = component.get("c.save");
        action.setParams({
            accountData : component.get("v.accountData"),
            contactData : component.get("v.contactData"),
            opportunityData : component.get("v.opportunityData")}
                        );
        action.setCallback(this, function(response){
            var state = response.getState();
                var message = response.getReturnValue();
                console.log("message>>>>>>>>" +JSON.stringify(message));
                component.set("v.message", message);
            if(message == 'record successfully insert'){
                document.getElementById("showErrorrTractConfig").style.display = "none";
                document.getElementById("showMessageTractConfig").style.display = "block";
            }else{
                document.getElementById("showMessageTractConfig").style.display = "none";
                document.getElementById("showErrorrTractConfig").style.display = "block";
            }    
        });  
        $A.enqueueAction(action);
    },
    fetchbusinessEntityTypePicklist : function(component, event, helper){
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.businessEntityType"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
                component.set("v.businessEntityTypePicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
     fetchstateOfInPicklist : function(component, event, helper){
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.stateOfIn"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
                component.set("v.stateOfInPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
     fetchSStStatePicklist : function(component, event, helper){
        var action = component.get("c.getPicklistKeyPairValue");
        action.setParams({
            'fld': component.get("v.sstState")
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
             console.log('a.getReturnValue()'+a.getReturnValue());
                component.set("v.sstStatePicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
     fetcharRegisteredPicklist : function(component, event, helper){
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.arRegistered"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
                component.set("v.arRegisteredPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
     fetcharFilPicklist : function(component, event, helper){
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.arFil"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
                component.set("v.arFilPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
    })