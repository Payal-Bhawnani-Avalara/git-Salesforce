public class Utility {
	
	public static List<ApexLog__c> createApexLog(String jobName, String status, Integer JobItemsProcessed, Integer TotalJobItems,String LogType, Integer NumberOfErrors){
		 List<ApexLog__c> listApexLogs = new List<ApexLog__c>();
		 ApexLog__c aL = new ApexLog__c();
		 aL.JobName__c=jobName;
		 aL.Status__c = status;
		 aL.NumberofRecordsPassed__c = JobItemsProcessed;
		 aL.TotalRecordsAffected__c = TotalJobItems;
		 aL.LogType__c = LogType;
		 aL.NumberOfErrors__c = NumberOfErrors;
		 
		 listApexLogs.add(aL);
		 insert listApexLogs;
		 return listApexLogs;
	}
	public static ApexLog__c createApexLog(String className, String status, Integer JobItemsProcessed, Integer TotalJobItems,String LogType, Integer NumberOfErrors,String message,Boolean insertObj){
		 ApexLog__c aL = new ApexLog__c();
		 aL.JobName__c=className;
		 aL.Status__c = status;
		 aL.NumberofRecordsPassed__c = JobItemsProcessed;
		 aL.TotalRecordsAffected__c = TotalJobItems;
		 aL.LogType__c = LogType;
		 aL.NumberOfErrors__c = NumberOfErrors;
		 aL.Message__c=message;
		 if(insertObj){
		 	insert aL;
		 }
		 return aL;
	}
	public static List<ApexLog__c> createApexLog(String className, List<Database.SaveResult> listDSR,Boolean insertObj){
		 List<ApexLog__c> aList = new List<ApexLog__c>();
		 if(listDSR!=null && listDSR.size()>0){
			 for (Database.SaveResult sr : listDSR) {
			 	if(!sr.isSuccess()){
				 	for(Database.Error err : sr.getErrors()) {
				 		aList.add(createApexLog(className, 'Failed', 1, 1,sr.getId(), 1,err.getMessage(),false));
				 	}
				}
			 }
			 if(insertObj){
			 	insert aList;
			 }
		 }
		 return aList;
	}		
	public static String vatNumberVerification(String Country, String vatNumber,String vatStatus){
		 vatStatus = 'INVALID';
        /* String VATRegax = VATNumberRegex__c.getInstance(Country).Regex__c;
	     Pattern VATPattern = Pattern.compile(VATRegax);
		 Matcher VATMAatcher = VATPattern.matcher(vatNumber);
		 system.debug(VATMAatcher.matches());
	     if(VATMAatcher!=null && VATMAatcher.matches()){
	   	           vatStatus = 'VALID';
	   	 }	 */       
	  return vatStatus;
	}
    public static String getSObjectFields(String sObjectName)
    {
        String sObjectFields='';
        SObjectType objToken = Schema.getGlobalDescribe().get(sObjectName);
        DescribeSObjectResult objDef = objToken.getDescribe();
        Map<String, SObjectField> fields = objDef.fields.getMap(); 
        Set<String> fieldSet = fields.keySet();
        for(String s:fieldSet)
        {
            SObjectField fieldToken = fields.get(s);
            DescribeFieldResult selectedField = fieldToken.getDescribe();
           // if(selectedField.isCreateable() && selectedField.isAccessible() && String.isNotBlank(selectedField.getLabel()) && !selectedField.getName().contains('Preferences'))
            {
                //System.debug(selectedField.getName());
                if(String.isNotBlank(sObjectFields))
                {
                    sObjectFields+=',';
                }
                sObjectFields+=selectedField.getName();
            }
        }
        return sObjectFields;
    } 
    public static Map<String,String> getSObjectFieldsAndLabels(String sObjectName)
    {
        Map<String,String> sObjectFields=new Map<String,String>();
        SObjectType objToken = Schema.getGlobalDescribe().get(sObjectName);
        DescribeSObjectResult objDef = objToken.getDescribe();
        Map<String, SObjectField> fields = objDef.fields.getMap(); 
        Set<String> fieldSet = fields.keySet();
        for(String s:fieldSet)
        {
            SObjectField fieldToken = fields.get(s);
            DescribeFieldResult selectedField = fieldToken.getDescribe();
            sObjectFields.put(selectedField.getName(),selectedField.getLabel());
           // if(selectedField.isCreateable() && selectedField.isAccessible() && String.isNotBlank(selectedField.getLabel()) && !selectedField.getName().contains('Preferences'))
            /*{
                //System.debug(selectedField.getName());
                if(String.isNotBlank(sObjectFields))
                {
                    sObjectFields+=',';
                }
                sObjectFields+=selectedField.getName();
            }*/
        }
        return sObjectFields;
    }     
}