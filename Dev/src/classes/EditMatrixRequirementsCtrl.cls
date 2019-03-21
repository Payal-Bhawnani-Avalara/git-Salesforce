public class EditMatrixRequirementsCtrl {

    public EditMatrixRequirementsCtrl(ApexPages.StandardController controller) {

    }

    @RemoteAction
    public static Object getUserTimeZone(){
        TimeZone tz = UserInfo.getTimeZone();
        return new Map<String,Object>{
            'name' => tz.getDisplayName(),
            'id' => tz.getID(),
            'offset' => tz.getOffset(DateTime.newInstance(2012,11,23,12,0,0))
        };
    }

    @RemoteAction
    public static List<SObject> getRequirements(String fid){
        return [
            SELECT Id,Name,Date__c,Note__c,Functional_Requirement_Name__c,
                Functional_Matrix_Requirements_Config__r.Section__c,
                Functional_Matrix_Requirements_Config__r.SubHeader__c,Functional_Matrix_Requirements_Config__r.Tool_Tip__c,
                Functional_Matrix_Requirements_Config__r.Requirement_Type__c
            FROM Functional_Matrix_Requirement__c
            WHERE Functional_Matrix_Requirements_Config__r.Section__c <> NULL AND Functional_Matrix__c =:fid
            ORDER BY Functional_Matrix_Requirements_Config__r.Certification_Type_Sort_Order__c ASC,
                Functional_Matrix_Requirements_Config__r.Subheader_Sort__c ASC,
                Functional_Matrix_Requirements_Config__r.Sort_Order__c ASC  NULLS LAST
        ];
    }
    
    @RemoteAction
    public static List<Functional_Matrix_Requirement__c> updateRequirement(List<Functional_Matrix_Requirement__c> req){
        update req;
        return req;   
    } 
}