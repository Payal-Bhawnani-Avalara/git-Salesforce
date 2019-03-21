public class FunctionalMatrixRequirementHandler{
    /*
    * Description : creates the requirements based on Functional_Matrix_Requirements_Config__c
    **/
    public static void process(List<Functional_Matrix__c> triggerNew){
        process(triggerNew, false);
    }


    public static void processNotes(List<Functional_Matrix__c> triggerNew){
        process(triggerNew, true);
    }


    private static void process(List<Functional_Matrix__c> triggerNew, Boolean notesOnly){
        List<Functional_Matrix_Requirement__c> requirements = new List<Functional_Matrix_Requirement__c>();
        List<String> recordTypeIds = new List<String>();
        Set<String> versionIds = new Set<String>();
        for(Functional_Matrix__c fm : triggerNew){
            recordTypeIds.add(fm.RecordTypeId);
            versionIds.add(fm.Version__c);
        }
        Map<String,String> recordTypeMap = getRecordTypes(recordTypeIds);
        Map<String,List<Functional_Matrix_Requirements_Config__c>> configMap = getconfigs(recordTypeMap.values());
        Map<String,Map<String,Object>> versionMap = versionMap(versionIds);

        for(Functional_Matrix__c fm : triggerNew){
            if(configMap.get(recordTypeMap.get(fm.RecordTypeId)) != NULL){
                for(Functional_Matrix_Requirements_Config__c obj : configMap.get(recordTypeMap.get(fm.RecordTypeId))){
                    Map<String,Object> chk = versionMap.containsKey(fm.Version__c) ? versionMap.get(fm.Version__c) : new Map<String, Object>();
                    Functional_Matrix_Requirement__c fmr = new Functional_Matrix_Requirement__c(
                        Note__c = String.valueOf(chk.get(obj.CheckList_RecordType__c + '||' + obj.CheckList_Note_Field_Api__c)),
                        External_Id__c = fm.Id + '||' + obj.Id + '||' + obj.Core_Type__c,
                        // added to sync missing notes and date
                        Date__c = Date.valueOf(chk.get(obj.CheckList_RecordType__c + '||' + obj.CheckList_Field_Api__c))
                    );

                    if(notesOnly == false){
                        fmr.Date__c = Date.valueOf(chk.get(obj.CheckList_RecordType__c + '||' + obj.CheckList_Field_Api__c));
                        fmr.Name = recordTypeMap.get(fm.RecordTypeId);
                        fmr.Functional_Matrix__c = fm.Id;
                        fmr.Functional_Matrix_Requirements_Config__c = obj.Id;
                    }
                    else{
                        fmr.Note_Migrated__c = true;
                    }

                    requirements.add(fmr);
                }
            }
        }
        if(!requirements.isEmpty()){
            if(notesOnly == true){
                Database.upsert(requirements, Functional_Matrix_Requirement__c.External_Id__c, false);
            }
            else{
                upsert requirements External_Id__c;
            }
        }
    }

    // collect all the requirements based on core type
    private static Map<String,List<Functional_Matrix_Requirements_Config__c>> getConfigs(List<String> rTypes){
        Map<String,List<Functional_Matrix_Requirements_Config__c>> configMap = new Map<String,List<Functional_Matrix_Requirements_Config__c>>();
        for(Functional_Matrix_Requirements_Config__c config : [
            SELECT Id,Core_Type__c,CheckList_RecordType__c,CheckList_Field_Api__c,CheckList_Note_Field_Api__c
            FROM Functional_Matrix_Requirements_Config__c
            WHERE Core_Type__c != NULL AND Core_Type__c IN:rTypes
        ]){
            if(!configMap.containsKey(config.Core_Type__c)){
                configMap.put(config.Core_Type__c,new List<Functional_Matrix_Requirements_Config__c>());
            }

            configMap.get(config.Core_Type__c).add(config);
        }
        return configMap;
    }

    private static Map<String,String> getRecordTypes(List<String> rTypeIds){
        Map<String,String> recordtypeMap = new Map<String,String>();
        for(RecordType rt : [
            SELECT Id, Name
            FROM RecordType
            WHERE Id IN:rTypeIds
        ]){
            recordtypeMap.put(rt.Id, rt.Name);
        }
        return recordtypeMap;
    }

    // fetch all the fields that needds to be moved
    private static Map<String,Map<String,Object>> versionMap(Set<String> versionIds){
        Map<String,Map<String,Object>> versionMap = new Map<String,Map<String,Object>>();
        Set<String> checkListFields = getCheckListFields();
        checkListFields.add('RecordType.DeveloperName');
        List<Version__c> versions = Database.query('SELECT Id,(SELECT '+ String.join(new List<String>(checkListFields), ',') + ' FROM Functional_Checklists__r) FROM Version__c WHERE Id IN :versionIds');
        for(Version__c v : versions){
            Map<String,Object> ckListMap = new Map<String, Object>();
            for(Functional_Checklist__c fc : v.Functional_Checklists__r){
                Map<String,Object> fieldMap = fc.getPopulatedFieldsAsMap();
                for(String s : fieldMap.keySet()){
                    ckListMap.put(fc.RecordType.DeveloperName + '||' + s,fieldMap.get(s));
                }
            }
            versionMap.put(v.Id,ckListMap);
        }
        return versionMap;
    }

    private static Set<String> getCheckListFields(){
        List<String> fields = new List<String>();
        Schema.sObjectType objType = Functional_Checklist__c.sObjectType;
        Schema.DescribeSObjectResult r1 = objType.getDescribe();
        return new Set<String>(r1.fields.getMap().keySet());
    }

}