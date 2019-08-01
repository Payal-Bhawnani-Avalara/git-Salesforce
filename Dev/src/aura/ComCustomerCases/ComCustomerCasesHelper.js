({
    fetchAccHelper : function(component, event, helper) {
        component.set('v.mycolumns', [
            {label: 'Owner Name', fieldName: 'OwnerId', type: 'text'},
                {label: 'Case Number', fieldName: 'linkName', type: 'url',
                typeAttributes: {label: { fieldName: 'CaseNumber' }, target: '_blank'}},
                {label: 'Contact Name', fieldName: 'ContactId', type: 'text'},
                {label: 'Account Name', fieldName: 'AccountId', type: 'text '}
            ]);
        var action = component.get("c.fetchCases");
        action.setParams({
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
              var records =response.getReturnValue();
                records.forEach(function(record){
                    record.linkName = '/'+record.Id;
                });
                component.set("v.acctList",records);
            }
        });
        $A.enqueueAction(action);
    }
})