trigger NewTaskUpdateParentCaseLastActivity on Task (after insert, after update) {
    //Put these in maps to ensure that each object is only in there once
    /*Map<Id,Case> casesToUpdate = new Map<Id,Case>();

    for (Task tsk:System.Trigger.new) {
        Task beforeUpdate = new Task(Status='Not Started');
        
        if (trigger.isUpdate)
        {
            beforeUpdate = System.Trigger.oldMap.get(tsk.Id);
        }


         if (tsk.WhatId!=null && tsk.Status=='Completed' && beforeUpdate.Status!='Completed') {
                String whatId = tsk.WhatId;
                String whatIdPrefix = whatId.substring(0,3);
   
             //If What is a case then update last activity
                if (whatIdPrefix.equalsIgnoreCase('500') && !tsk.Type.Contains('Internal') && tsk.FirstCompleted__c==false) {
                    Case cs = new Case(Id=tsk.WhatId, Last_Case_Activity__c=System.now());
                    casesToUpdate.put(tsk.WhatId, cs);
                }
            }
        }

        if (CasesToUpdate.size()>0) {
            List<Case> cases = CasesToUpdate.values();
            update cases;
        }*/

}