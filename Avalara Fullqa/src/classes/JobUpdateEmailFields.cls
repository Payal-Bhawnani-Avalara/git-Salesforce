global class JobUpdateEmailFields implements Database.Batchable<sObject>, Schedulable, Database.Stateful {
/*CRON :JobUpdateEmailFields m = new JobUpdateEmailFields();
        String seconds = '0'; //Execute at Zero Seconds
        String minutes = '0'; //Execute at every 0 minute of hour
        String hours = '01'; // Execute at 1 AM
        String dayOfMonth = '*'; // Execute Every Day of the Month
        String month = '*'; //Execute every Month
        String dayOfWeek = '?'; //Execute on all 7 days of the Week
        ID oppbatchprocessid = Database.executeBatch(m,100);  
        
        //Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        String sch = seconds + ' ' + minutes + ' ' + hours + ' ' + dayOfMonth + ' ' + month + ' ' + dayOfWeek;
        //String sch = '0 0 01 * * ?';
        system.schedule('JobUpdateEmailFields Run Everyday at 1am', sch, m);  */	
	global Set<Id> setIDs;
	global ObjectEmailField__mdt objOEF{get;set;}
	public String query {get;set;}
	public JobUpdateEmailFields(String q,ObjectEmailField__mdt tempObj,Set<Id> tempsetIDs){
		query=q;
		objOEF=tempObj;
		if(tempsetIDs!=null){
			if(setIDs==null){
				setIDs=new Set<Id>();
			}
			setIDs.addAll(tempsetIDs);
		}
	}
    //Method which schedules the JobProcessOpportunity 
    global void execute(SchedulableContext sc) {
         JobUpdateEmailFields job = new JobUpdateEmailFields('Select id from User limit 0',null,null);
         ID batchprocessid = Database.executeBatch(job,100); 
    }	
    //Batch Start method
    global Database.QueryLocator start(Database.BatchableContext BC) {
    		System.debug('query==='+query);
        
        return Database.getQueryLocator(query);
    }
  
    global void execute(Database.BatchableContext BC, List<sObject> objList) {
        if(objList!=null && objList.size()>0 && objOEF!=null && (Test.isRunningTest() || [Select isSandbox from Organization].isSandbox)){
        		String sandboxName=sandboxName();
    			List<String> emailFieldList=new List<String>();
    			if(String.isNotBlank(objOEF.Email_Field_API_Name__c)){
	    			for(String emailfield:objOEF.Email_Field_API_Name__c.split(',')){
	    				emailFieldList.add(emailField); 
	    			}
    			}
    			List<String> emailFieldEndsWithList=new List<String>();
    			//emailFieldEndsWithList.add('.'+sandboxName);
    			
    			emailFieldEndsWithList.add('@example.com');
    			if(String.isNotBlank(objOEF.Exclude_Email_Ends_With__c)){
	    			for(String endsWith:objOEF.Exclude_Email_Ends_With__c.split(',')){
	    				emailFieldEndsWithList.add(endsWith);
	    			}
    			}
    			//system.debug('emailFieldEndsWithList===='+emailFieldEndsWithList);
    			for(sObject obj:objList){
    				for(String fieldName:emailFieldList){
    					Object objValue;
    					try{objValue=obj.get(fieldName);}
    					catch(Exception ex){}
    					if(objValue!=null)
    					{
	    					String fieldValue=String.valueOf(obj.get(fieldName));
	    					if(String.isNotBlank(fieldValue)){ 
	    						Boolean updateField=true;
		    					for(String emailEndsWith:emailFieldEndsWithList){
		    						//system.debug('emailEndsWith===='+emailEndsWith);
		    						if(fieldValue.endsWithIgnoreCase(emailEndsWith)){
		    							updateField=false;
		    							break;
		    						}
		    					}
		    					if(updateField){
		    						//fieldValue+='.'+sandboxName;
		    						//String email='abc@xyz.com';
								fieldValue=fieldValue.replace('@','-')+'@example.com';
								//system.debug('====='+email);
		    						obj.put(fieldName,fieldValue);
		    					}	    					
	    					}
    					}
    				}
    			}
			if(String.isNotBlank(objOEF.ByPassTrigger__c)){	
				TriggerHandler.bypass(objOEF.ByPassTrigger__c);
			}
			Database.SaveResult[] dsrList=Database.update(objList,false);
			Utility.createApexLog('JobUpdateEmailFields', dsrList,true);
			if(String.isNotBlank(objOEF.ByPassTrigger__c)){
				TriggerHandler.clearBypass(objOEF.ByPassTrigger__c);
			}	    					        	
        }
    }  

    global void finish(Database.BatchableContext BC) { 
    		if(Test.isRunningTest() || [Select isSandbox from Organization].isSandbox){
	    		Set<Id> tempIds=new Set<Id>();
	    		if(setIDs!=null){
	    			tempIds.addAll(setIDs);
	    		}
	    		else
	    		{
	    			setIDs=new Set<Id>();
	    		}
	    		for(ObjectEmailField__mdt o:[Select Id,Object_API_Name__c,Batch_Size__c,Email_Field_API_Name__c,Exclude_Email_Ends_With__c,Exclude_User_ID__c,ByPassTrigger__c from ObjectEmailField__mdt Where Active__c=true AND Id!=:tempIds limit 1]){
	    			if(!tempIds.contains(o.Id)){
		    			tempIds.add(o.Id);
		    			setIDs.addAll(tempIds);
		    			List<String> emailFieldList=new List<String>();
		    			for(String emailfield:o.Email_Field_API_Name__c.split(',')){
		    				if(String.isNotBlank(emailField)){
		    					emailFieldList.add(emailField);
		    				}
		    			}
		    			String query='Select Id,'+String.join(emailFieldList,',')+' from '+o.Object_API_Name__c;
		    			system.debug('query===='+query);
                        query+= ' where email!=null AND (NOT(email like \'%@example%\'))';
			         JobUpdateEmailFields job = new JobUpdateEmailFields(query,o,setIDs);
			         ID batchprocessid = Database.executeBatch(job,Integer.valueOf(o.Batch_Size__c)); 
	    			}    			
	    		} 
	    		system.debug('setIDs===='+setIDs);
    		}
    }
    public static void runJobNow(){
    		/*DateTime dt=Datetime.now();
		String hour = String.valueOf(dt.hour()); 
		String min = String.valueOf(dt.minute() + 2); 
		String ss = String.valueOf(dt.second());
		String year = String.valueOf(dt.year());
		String month = String.valueOf(dt.month() ); 
		String day = String.valueOf(dt.day());		
		//parse to cron expression
		String nextFireTime = ss + ' ' + min + ' ' + hour + ' ' + day +' '+month+' ? ' + year;
		
		JobUpdateEmailFields s = new JobUpdateEmailFields('Select id from User limit 0',null,null); 
		System.schedule('JobUpdateEmailFields Started At ' + String.valueOf(Datetime.now()), nextFireTime, s);   
		*/  	
         JobUpdateEmailFields job = new JobUpdateEmailFields('Select id from User limit 0',null,null);
         ID batchprocessid = Database.executeBatch(job,100); 		
    }
    public static String sandboxName(){
		String sandboxName=UserInfo.getUserName();
	    sandboxName=sandboxName.substringAfterLast('.');
		sandboxName=sandboxName.toLowerCase();	
 		if(sandboxName=='com'){
 			sandboxName='';
		}      	

	  return sandboxName;   	
    }    
}
//vpn.avalara.com
//gp-se3.avalara.com