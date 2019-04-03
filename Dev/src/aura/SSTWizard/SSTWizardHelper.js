({
    saveData : function(component, event, helper) {
        var sstStatePicklistselected;
        sstStatePicklistselected=component.find("sstStateId").get("v.value");
        var action = component.get("c.save");
        action.setParams({
            sstData : component.get("v.sstData"),
            sstStatePicklistselected : sstStatePicklistselected});
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
    },
    fetchInReturns : function(component, event, helper){
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.inRetunrs"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
                component.set("v.inRetunrsPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetcharSSTV : function(component, event, helper){
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.arSSTV"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
                component.set("v.arSSTVPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetcharNV : function(component, event, helper){
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.arNV"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
                component.set("v.arNVPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetchregSSTPicklist : function(component, event, helper){
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.regSST"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
                component.set("v.regSSTPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetchcomAffPicklist : function(component, event, helper){
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.comAff"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
                component.set("v.comAffPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetchtypeBusPicklist : function(component, event, helper){
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.typeBus"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
                component.set("v.typeBusPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetchsstProgPicklist : function(component, event, helper){
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.sstProg"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
                component.set("v.sstProgPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetchjoinSSTProgPicklist : function(component, event, helper){
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.joinSSTProg"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
                component.set("v.joinSSTProgPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetchsstRemotePicklist : function(component, event, helper){
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.sstRemote"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
                component.set("v.sstRemotePicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
    fetchwaBOCPicklist : function(component, event, helper){
        var action = component.get("c.getPicklistvalues");
        action.setParams({
            'objectName': component.get("v.ObjectName"),
            'field_apiname': component.get("v.waBOC"),
            'nullRequired': false
        });
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
                component.set("v.waBOCPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})