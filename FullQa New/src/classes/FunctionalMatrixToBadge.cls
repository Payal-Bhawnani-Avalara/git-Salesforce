public class FunctionalMatrixToBadge {

    private static Map<String, Schema.SObjectField> fieldMap;
    /*
    * Description : creates the badges based on core type from the Functional_Matrix_Badge_Mapping__mdt
    **/
    public static void processBadge(Map<Id,Functional_Matrix__c> newMap,Map<Id,Functional_Matrix__c> oldMap) {
        List<Badge__c> badges = new List<Badge__c>();
        List<String> delBadges = new List<String>();
        List<Functional_Matrix_Badge_Mapping__mdt> settings = getData();
        for(Functional_Matrix__c obj : newMap.values()){
            for(Functional_Matrix_Badge_Mapping__mdt s : settings){
                if(
                    (Trigger.isInsert == TRUE && obj.get(s.Status_Field__c) != null)
                    || (Trigger.isUpdate == TRUE && obj.get(s.Status_Field__c) != null && oldMap.get(obj.Id).get(s.Status_Field__c) != obj.get(s.Status_Field__c))
                ){
                    String label = getLabel(s.Type_Field__c);
                    Badge__c b = new Badge__c(
                        Functional_Matrix_Ext_Id__c = label + '||' + obj.Id,
                        Type__c = label,
                        Version__c = obj.Version__c,
                        Functional_Matrix__c = obj.Id
                    );
                    b.put('Status__c', obj.get(s.Status_Field__c));
                    b.put('Date_Achieved__c', obj.get(s.Date_Achieved_Field__c));
                    System.debug(' obj.get(s.Date_Achieved_Field__c)>>>>>'+ obj.get(s.Date_Achieved_Field__c));
                    badges.add(b);
                }
                else if(Trigger.isUpdate && obj.get(s.Status_Field__c) == null && oldMap.get(obj.Id).get(s.Status_Field__c) != obj.get(s.Status_Field__c)){
                    delBadges.add(getLabel(s.Type_Field__c) + '||' + obj.Id);
                }
            }
        }
        // delete any mismatching badges
        if(!delBadges.isEmpty()){
            delete [
                SELECT id
                FROM Badge__c
                WHERE Functional_Matrix_Ext_Id__c IN :delBadges
            ];
        }
        if(!badges.isEmpty()){
            upsert badges Functional_Matrix_Ext_Id__c;
        }
    }

    private static List<Functional_Matrix_Badge_Mapping__mdt> getData(){
        return[
            SELECT Id,Type_Field__c,Status_Field__c,Date_Achieved_Field__c
            FROM Functional_Matrix_Badge_Mapping__mdt
        ];
    }

    private static String getLabel(String fieldApi){
        if(fieldMap == NULL){
            fieldMap = Schema.SObjectType.Functional_Matrix__c.fields.getMap();
        }
        return fieldMap.get(fieldApi).getDescribe().getLabel();
    }
}