public class SSTWizardController {
	 @AuraEnabled(cacheable=true)
     public static List<KeyPairValue> getKeyPairValue(String objectName, String field_apiname,Boolean nullRequiredd) {
        List<KeyPairValue> output = new List <KeyPairValue> ();
        
        Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
        Map<String, Schema.SObjectField> field_map = gd.get(objectName.toLowerCase()).getDescribe().fields.getMap(); 
        // Get the list of picklist values for this field.
        List < Schema.PicklistEntry > values = field_map.get(field_apiname).getDescribe().getPickListValues();
        // Add these values to the selectoption list.
        for (Schema.PicklistEntry a: values) {
            output.add(new KeyPairValue(a.getValue(),a.getValue()));
        }
        return output;
    }    
     
	 @AuraEnabled(cacheable=true)
    public static string save(SST_Onboarding__c sstData,String signatureBody){
        try{ 
        	//sstData.SST_State_Selection__c=String.join(sstStatePicklistselected, ';');
            insert sstData; 
             Attachment a = new Attachment();
             a.ParentId = sstData.id; // record id of object.
             a.Body = EncodingUtil.base64Decode(signatureBody);
             a.ContentType = 'image/png';
             a.Name = 'Signature Capture.png';
             insert a;     
        } 
        catch(Exception ex){
            return ex.getMessage();
        }
        return 'record successfully insert';  
    }   
	 @AuraEnabled(cacheable=true)
    public static List<String> getPicklistvalues(String objectName, String field_apiname,Boolean nullRequired){
    	
        List<String> optionlist = new List<String>();
        
        Map<String,Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
        Map<String, Schema.SObjectField> field_map = gd.get(objectName.toLowerCase()).getDescribe().fields.getMap(); 
        
        List<Schema.PicklistEntry> picklistValues = field_map.get(field_apiname).getDescribe().getPickListValues();
        
        for (Schema.PicklistEntry pv : picklistValues) {
            optionlist.add(pv.getValue());
        }
        return optionlist;
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