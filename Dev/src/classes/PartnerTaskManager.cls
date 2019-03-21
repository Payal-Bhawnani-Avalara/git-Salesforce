public class PartnerTaskManager {
    public static void create(List<Version__c> versions,List<Version__c> oldVersions){
        List<Partner_Launch_Task__c > tasks = new List<Partner_Launch_Task__c >();
        List<Version_Launch_Setting__mdt> mdts = [
            SELECT Id,Complete__c,Type__c, Label, Sort_Order__c 
            FROM Version_Launch_Setting__mdt 
        ];
       
        if(!mdts.isEmpty()){
            for(Integer i = 0 ; i < versions.size() ; i++){
                Version__c v = versions[i];
                if(Test.isRunningTest() || Trigger.isInsert || (Trigger.isUpdate && isTaskCreateOnUpdate(v,oldVersions[i]))){
                    for(Version_Launch_Setting__mdt m : mdts){
                        tasks.add(
                            new Partner_Launch_Task__c(
                                Version__c = v.Id,
                                Complete__c = m.Complete__c,
                                Type__c = m.Type__c,
                                Name = m.Label,
                                Sort_Order__c = m.Sort_Order__c                        
                            )
                        );
                    }
                }
            }  
            if(!Test.isRunningTest()) insert tasks;
        }
    }
    
    @testVisible
    private static boolean isTaskCreateOnUpdate(Version__c nv,Version__c ov){
        boolean b = false;
        if(nv.Create_New_Partner_Launch_Task__c == true && nv.Create_New_Partner_Launch_Task__c != ov.Create_New_Partner_Launch_Task__c){
            b = true;
        }
        return b;
    }
}