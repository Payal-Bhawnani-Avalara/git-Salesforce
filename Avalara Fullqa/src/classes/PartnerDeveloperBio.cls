public class PartnerDeveloperBio {
 	@AuraEnabled public String accountName {get;set;}
    @AuraEnabled public String website {get;set;}
    @AuraEnabled public String street {get;set;}
    @AuraEnabled public String city {get;set;}
    @AuraEnabled public String state {get;set;}
    @AuraEnabled public String country {get;set;}
    @AuraEnabled public String postalcode {get;set;}
    @AuraEnabled public String firstname {get;set;}
    @AuraEnabled public String lastname {get;set;}
    @AuraEnabled public String email {get;set;}
    @AuraEnabled public String phone {get;set;}
   // @AuraEnabled public String notes {get;set;}         
    @AuraEnabled public String errorMessage {get;set;}
    @AuraEnabled public String companyInformation {get;set;}
	@AuraEnabled public String servicesOffered {get;set;}
	@AuraEnabled public String referenceClients {get;set;}
    @AuraEnabled public List<KeyPairValue> empoptions {get;set;}
    @AuraEnabled public String empvalue {get;set;}
    @AuraEnabled public List<KeyPairValue> clienttypeoptions {get;set;}
    @AuraEnabled public List<String> clienttypeselected {get;set;}
    @AuraEnabled public List<KeyPairValue> programmingoptions {get;set;}
    @AuraEnabled public List<String> programmingselected {get;set;}
    @AuraEnabled public List<KeyPairValue> apptypeoptions {get;set;}
    @AuraEnabled public List<String> apptypeselected {get;set;}
    
	@AuraEnabled
    public static PartnerDeveloperBio initPartnerDeveloperBio(String cId){
        PartnerDeveloperBio obj=new PartnerDeveloperBio();
        obj.errorMessage='';
        if(String.isNotBlank(cId)){
            System.debug('cId====='+cId);
            List<Contact> listContact=getContact(cId);
            if(listContact.size()==1){
                Contact c=listContact[0];
            	obj.accountName=c.Account.Name;
                obj.website=c.Account.Website;
                obj.street=c.Account.BillingStreet;
                obj.city=c.Account.BillingCity;
                obj.state=c.Account.BillingState;
                obj.country=c.Account.BillingCountry;
                obj.postalcode=c.Account.BillingPostalCode;
				obj.firstname=c.FirstName;
                obj.lastname=c.LastName;
                obj.email=c.Email;
                obj.phone=c.Phone;
              //  obj.notes=c.Account.Description;   
                obj.companyInformation=c.Account.Company_Information__c;
                obj.servicesOffered=c.Account.Services_Offered__c;
                obj.referenceClients=c.Account.Reference_Clients__c;
                //{'label': 'ApexSalesforce', 'value': 'apex'},{'label': 'Java', 'value': 'Java'},{'label': 'iOs', 'value': 'iOS'}
                //obj.empoptions=new List<KeyPairValue>();
                obj.empvalue=c.Account.Number_of_Employees__c;
                obj.empoptions=getPicklistKeyPairValue('choose one...','','Number_of_Employees__c');//.add(new KeyPairValue('lllll','vvvvv'));
                obj.clienttypeoptions=getPicklistKeyPairValue('','','Client_Type__c');
                obj.clienttypeselected=new List<String>();
                if(String.isNotBlank(c.Account.Client_Type__c)){
                    obj.clienttypeselected=c.Account.Client_Type__c.split(';');
                }
                obj.programmingoptions=getPicklistKeyPairValue('','','Programming_Languages_Supported__c');
                obj.programmingselected=new List<String>();
                if(String.isNotBlank(c.Account.Programming_Languages_Supported__c)){
                    obj.programmingselected=c.Account.Programming_Languages_Supported__c.split(';');
                }                
                obj.apptypeoptions=getPicklistKeyPairValue('','','Application_Types_Supported__c');
                obj.apptypeselected=new List<String>();
                if(String.isNotBlank(c.Account.Application_Types_Supported__c)){
                    obj.apptypeselected=c.Account.Application_Types_Supported__c.split(';');
                }                        
            }
            else{
                obj.errorMessage='Invalid Record Id. Please contact administrator.';
            }
    	}
        else{
            obj.errorMessage='Invalid Record Id. Please contact administrator.';
        }
        return obj;
    }  
    @AuraEnabled
    public static PartnerDeveloperBio saveData(String cId,String companyInformation,String servicesOffered,
                                               String referenceClients,String empvalue,
                                               List<String> clienttypeselected,
                                               List<String> programmingselected,
                                               List<String> apptypeselected){
        PartnerDeveloperBio obj=new PartnerDeveloperBio();
        obj.errorMessage='';
		if(String.isNotBlank(cId)){
            List<Contact> listContact=getContact(cId);
            if(listContact.size()==1){
                Contact c=listContact[0];
                if(String.isBlank(companyInformation) || String.isBlank(servicesOffered) || String.isBlank(referenceClients) ||
                  String.isBlank(empvalue) || clienttypeselected==null || clienttypeselected.size()==0 ||
                  programmingselected==null || programmingselected.size()==0 ||
                   apptypeselected==null || apptypeselected.size()==0){
		                obj.errorMessage='Please fill in all required fields.';                       
                   }
                else{
                    	Account a=new Account(
                        					Id=c.AccountId,
                                            Application_Types_Supported__c=String.join(apptypeselected, ';'),
                                            Client_Type__c=String.join(clienttypeselected, ';'),
                                            Company_Information__c=companyInformation,
                                            Number_of_Employees__c=empvalue,
                                            Programming_Languages_Supported__c=String.join(programmingselected, ';'),
                                            Reference_Clients__c=referenceClients,
                                            Services_Offered__c=servicesOffered
                    					 );
                    try{
                        update a;
                    }
                    catch(Exception ex){
						obj.errorMessage=ex.getMessage();                       
                    }
                }
            } 
            else{
                obj.errorMessage='Invalid Record Id. Please contact administrator.';
            }            
        }
        else{
            obj.errorMessage='Invalid Record Id. Please contact administrator.';
        }                                                   
		return obj;
    }
    public static List<Contact> getContact(String cId){
       return [Select Id,Account.Name,Account.Website,FirstName,LastName,Email,Phone,Account.BillingStreet,
         Account.BillingCity,Account.BillingState,Account.BillingPostalCode,Account.BillingCountry,
         Account.Application_Types_Supported__c,Account.Client_Type__c,
         Account.Company_Information__c,Account.Number_of_Employees__c,
         Account.Programming_Languages_Supported__c,Account.Reference_Clients__c,
         Account.Services_Offered__c,Account.Description 
         From Contact Where Id=:cId];        
    }
    public static List<KeyPairValue> getPicklistKeyPairValue(String defaultLabel,String defaultValue,String fld) {
        List<KeyPairValue> output = new List <KeyPairValue> ();
        if(String.isNotBlank(defaultLabel)){
            output.add(new KeyPairValue(defaultLabel,defaultValue));
        }
        // Get the object type of the SObject.
        Schema.sObjectType objType = Account.getSObjectType();
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