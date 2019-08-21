public class SSTWizardController {
	 @AuraEnabled
    public static string save(SST_Onboarding__c sstData,String signatureBody){
        try{ 
        	//sstData.SST_State_Selection__c=String.join(sstStatePicklistselected, ';');
        	if(sstData.Company_Corporate_Address_State__c =='AR'){
        	    sstData.ArkansasSSTVolunteer__c = 'False (SST Non-Volunteer)';
        	    sstData.Arkansas_NV_Reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='GA'){
        	   sstData.Georgia_SST_Volunteer__c = 'False (SST Non-Volunteer)';
        	    sstData.Georgia_NV_Reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='IN'){
        	   sstData.Indiana_v__c = 'False (SST Non-Volunteer)';
        	   sstData.Indiana_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='IA'){
        	   sstData.Iowa_v__c = 'False (SST Non-Volunteer)';
        	   sstData.Iowa_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='KS'){
        	   sstData.Kansas_V__c = 'False (SST Non-Volunteer)';
        	   sstData.Kansas_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='KY'){
        	   sstData.Kentucky_v__c = 'False (SST Non-Volunteer)';
        	   sstData.Kentucky_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='MI'){
        	   sstData.Michigan_v__c = 'False (SST Non-Volunteer)';
        	   sstData.Michigan_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='MN'){
        	   sstData.Minnesota_v__c = 'False (SST Non-Volunteer)';
        	   sstData.Minnesota_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='NE'){
        	   sstData.Nebraska_v__c = 'False (SST Non-Volunteer)';
        	   sstData.Nebraska_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='NV'){
        	   sstData.Nevada_v__c = 'False (SST Non-Volunteer)';
        	   sstData.Nevada_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='NJ'){
        	   sstData.New_Jersey_v__c = 'False (SST Non-Volunteer)';
        	   sstData.New_Jersey_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='NC'){
        	   sstData.North_Carolina_v__c = 'False (SST Non-Volunteer)';
        	   sstData.North_Carolina_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='ND'){
        	   sstData.North_Dakota_v__c = 'False (SST Non-Volunteer)';
        	   sstData.North_Dakota_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='OH'){
        	   sstData.Ohio_v__c = 'False (SST Non-Volunteer)';
        	   sstData.Ohio_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='OK'){
        	   sstData.Oklahoma_v__c = 'False (SST Non-Volunteer)';
        	   sstData.Oklahoma_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='RI'){
        	   sstData.Rhode_Island_v__c = 'False (SST Non-Volunteer)';
        	   sstData.Rhode_Island_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='SD'){
        	   sstData.South_Dakota_v__c = 'False (SST Non-Volunteer)';
        	   sstData.South_Dakota_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='TN'){
        	   sstData.Tennessee_v__c = 'False (SST Non-Volunteer)';
        	   sstData.Tennessee_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='UT'){
        	   sstData.Utah_v__c = 'False (SST Non-Volunteer)';
        	   sstData.Utah_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='VT'){
        	   sstData.Vermont_v__c = 'False (SST Non-Volunteer)';
        	   sstData.Vermont_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='WA'){
        	   sstData.Washington_v__c = 'False (SST Non-Volunteer)';
        	   sstData.Washington_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='WV'){
        	   sstData.West_Virginia_v__c = 'False (SST Non-Volunteer)';
        	   sstData.West_Virginia_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='WI'){
        	   sstData.Wisconsin_v__c = 'False (SST Non-Volunteer)';
        	   sstData.Wisconsin_nv_reason__c = 'Place of Business';
        	}if(sstData.Company_Corporate_Address_State__c =='WY'){
        	   sstData.Wyoming_v__c = 'False (SST Non-Volunteer)';
        	   sstData.Wyoming_nv_reason__c = 'Place of Business';
        	}
            insert sstData; 
            Blob content;
            Attachment a = new Attachment();
            a.ParentId = sstData.id; // record id of object.
            if (Test.IsRunningTest()){
                a.Body=Blob.valueOf('UNIT.TEST');
                a.Name = 'Signature Capture.png';
                insert a;  
             }
            else{
               a.Body = EncodingUtil.base64Decode(signatureBody);
               a.ContentType = 'image/png';
               a.Name = 'Signature Capture.png';
               insert a;  
            }
            
               
             
           /*  string signerEmail = 'payal.bhawnani@Avalara.com';
             string opportunityId = '0060b00000sJRre'; //Opportunity Id to which eContract object should be linked too.

            Sertifi2_0__TestContract__c contract = new Sertifi2_0__TestContract__c(
		    Name = 'Test Invites 1',
		    Sertifi2_0__Message__c = 'Custom invite message',
		    Sertifi2_0__Sign_Type__c = 'Electronically',
		    Sertifi2_0__Opportunity__c = opportunityId,
		    Sertifi2_0__Open__c = 1,
			//Setting the custom object id so that contract is linked to the object mentioned in the custom settings 
			//Sertifi2_0__CustomLinkID__c = sstData.id,
			SST_Onboarding__c =	sstData.id,
		    Sertifi2_0__Settings__c = 'SSTOnboaring');
            insert contract;

            Sertifi2_0__EDocument__c signDoc = new Sertifi2_0__EDocument__c(
            Sertifi2_0__TestContract__c = contract.id,
            Sertifi2_0__Name__c = 'Test doc',
            //Sertifi2_0__Sertifi_ID__c = 'qwerty',
            Sertifi2_0__Number_Signed__c = 0,
            Sertifi2_0__Document_Type__c = 'Signing Document');
            insert signDoc;

			//Creating test document on fly
			String pdfContent = 'This is a test string';
			Attachment attachmentPDF = new Attachment();
			attachmentPdf.parentId = signDoc.id;
			attachmentPdf.name = 'Generated.pdf';
			attachmentPdf.body = blob.toPDF(pdfContent);
			insert attachmentPDF;

            Contact tempContact = [select id,name,email from Contact where email = 'payal.bhawnani@Avalara.com'][0];
            Sertifi2_0__ContractContactJunction__c signer = new Sertifi2_0__ContractContactJunction__c(
            Sertifi2_0__Contact__c = tempContact.id,
            Sertifi2_0__TestContract__c = contract.id,
            Sertifi2_0__Signer_Order__c = 1,
            Sertifi2_0__Level_Name__c = '1st Signer',
            Sertifi2_0__Email__c = signerEmail);
            insert signer;
            System.debug(contract.id);     */       
        } 
        catch(Exception ex){
            return ex.getMessage();
        }
        return 'record successfully insert';  
    }   
	 @AuraEnabled
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
     
	
	 @AuraEnabled
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