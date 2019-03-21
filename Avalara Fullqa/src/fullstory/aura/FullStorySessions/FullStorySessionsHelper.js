({
	getUserSessions : function(component, event) {
		var self = this;
        var id=component.get('v.recordId');
        var objName = component.get('v.sObjectName');
        var action = component.get('c.getFSSessions');
        action.setParams({
            inId : component.get('v.recordId'),
            objectName : objName
        });
        action.setCallback(this, function(res) {
           var resState = res.getState();
            if(resState === 'SUCCESS') {
                var response = res.getReturnValue();
                if(response.isSuccess === true) {
                    component.set('v.userSessions',response.userSessions);
                	component.set('v.userEmail',response.emailValue);
                }
                else {
                    component.set('v.hasError', true);
                    component.set('v.errorMsg', response.errorMessage);
                }
            }
            else if(resState === 'Error') {
                component.set('v.hasError', true);
                component.set('v.errorMsg', res.getError()[0].message);
            }
        });
        $A.enqueueAction(action);
	}
})