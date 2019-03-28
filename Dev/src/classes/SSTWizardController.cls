public class SSTWizardController {
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
     @AuraEnabled
      public static List<KeyPairValue> getPicklistKeyPairValue(String fld) {
        List<KeyPairValue> output = new List <KeyPairValue> ();
       
        // Get the object type of the SObject.
        Schema.sObjectType objType = SST_Onboarding__c.getSObjectType();
        // Describe the SObject using its object type.
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
        // Get a map of fields for the SObject
        Map < String, Schema.SObjectField > fieldMap = objDescribe.fields.getMap();
        // Get the list of picklist values for this field.
        List < Schema.PicklistEntry > values = fieldMap.get(fld).getDescribe().getPickListValues();
        // Add these values to the selectoption list.
        for (Schema.PicklistEntry a: values) {
            output.add(new KeyPairValue(a.getValue(),a.getValue()));
        }
        return output;
    }    
    public class KeyPairValue{
        @AuraEnabled
        public String label {get; set;}  
        @AuraEnabled
        public String value {get; set;} 
        public KeyPairValue(String label,String value){
            this.label=label;
            this.value=value;
        }
    }      
   
}