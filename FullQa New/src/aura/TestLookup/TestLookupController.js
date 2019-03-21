({
	performSaveOperation : function(component, event, helper) {
		var formAccountLookup=component.find("formAccountLookup");
        console.log('formAccountLookup===='+formAccountLookup);
        var AccountId=component.find("AccountId").get("v.value");
        console.log('AccountId===='+AccountId);
	}
})