({
    fetchCaseHelper : function(component, event, helper) {
        component.set('v.mycolumns', [
            {label: 'Owner Name', fieldName: 'OwnerId', type: 'text'},
                {label: 'Case Number', fieldName: 'linkName', type: 'url',
                typeAttributes: {label: { fieldName: 'CaseNumber' }, target: '_blank'}},
                {label: 'Contact Name', fieldName: 'ContactId', type: 'text'},
                {label: 'Account Name', fieldName: 'AccountName', type: 'text '}
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
                     if (record.Account) record.AccountName = record.Account.Name;

                });
                component.set("v.caseList",records);
            }
        });
        $A.enqueueAction(action);
    }
})