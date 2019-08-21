({
    fetchCaseHelper : function(component, event, helper) {
        component.set('v.mycolumns', [
                {label: 'Case Number', fieldName: 'linkName', type: 'url',
                typeAttributes: {label: { fieldName: 'CaseNumber' }, target: '_blank'}},
                {label: 'Account Name', fieldName: 'AccountName', type: 'text'},
                {label: 'Subject', fieldName: 'Subject', type: 'text'},
                {label: 'Status', fieldName: 'Status', type: 'text '},
                {label: 'Date Created', fieldName: 'CreatedDate', type: 'date '}
            ]);
        var action = component.get("c.fetchPartnerCases");
        action.setParams({
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
              var records =response.getReturnValue();
                records.forEach(function(record){
                    record.linkName = '/brazilsupport/s/case/'+record.Id;
                      if (record.Account) record.AccountName = record.Account.Name;
                });
                component.set("v.caseList",records);
            }
        });
        $A.enqueueAction(action);
    }
})