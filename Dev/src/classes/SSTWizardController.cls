public class SSTWizardController {
	 @AuraEnabled
    public static string save(SST_Onboarding__c sstData){
        try{ 
        	//sstData.SST_State_Selection__c=String.join(sstStatePicklistselected, ';');
            insert sstData;      
        } 
        catch(Exception ex){
            return ex.getMessage();
        }
        return 'record successfully insert';  
    }   
	 @AuraEnabled
    public static List<String> getPicklistvalues(String objectName, String field_apiname,Boolean nullRequired){
        List<String> optionlist = new List<String>();
        
        Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
        Map<String, Schema.SObjectField> field_map = gd.get(objectName.toLowerCase()).getDescribe().fields.getMap(); 
        
        List<Schema.PicklistEntry> picklistValues = field_map.get(field_apiname).getDescribe().getPickListValues();
        
        if(nullRequired == true){
            optionlist.add('--None--');
        }
        
        for (Schema.PicklistEntry pv : picklistValues) {
            optionlist.add(pv.getValue());
        }
        return optionlist;
    }  
}