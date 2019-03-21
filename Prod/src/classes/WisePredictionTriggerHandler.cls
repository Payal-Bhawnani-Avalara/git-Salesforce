public class WisePredictionTriggerHandler extends TriggerHandler  {
      //Trigger Handler Methods
    protected override void beforeInsert(){
        beforeInsertUpdate();
    }
    
   /* protected override void beforeUpdate(){
        //beforeInsertUpdate();
    }*/
     public void beforeInsertUpdate(){
     	Set<Id> caseID = new Set<Id>();
     	ApexTriggerHadler__mdt apexTriggerHandlerMdt =[Select Id,Active__c From ApexTriggerHadler__mdt Where SObject__c= 'wisespt__WisePrediction__c'];
     	if(apexTriggerHandlerMdt.Active__c || Test.isRunningTest()){
	     	for (wisespt__WisePrediction__c wisepredict : (List<wisespt__WisePrediction__c>)Trigger.new) {
	     	  	caseID.add(wisepredict.wisespt__CaseID__c);
	     	}
	     	Map<Id,Case> caseMap = new Map<Id,Case>([Select id,CX_911_Support_Category__c,CX_911_Support_Reason_Detail__c,CX_911_Support_Product__c,
	     	CX_911_Support_Business_Area__c,CX_911_Support_Reason__c,stopAssignmentRule__c from Case where id in :caseID AND Origin!='Chat' AND Origin!='Phone']);
	     	if(caseMap.values().size()>0){
	        for (wisespt__WisePrediction__c wiseprediction : (List<wisespt__WisePrediction__c>)Trigger.new){
	        	try{
		            if (wiseprediction.wisespt__WiseTags__c != null) {
		                Map<String, Object> m = (Map<String, Object>)JSON.deserializeUntyped(wiseprediction.wisespt__WiseTags__c);
		                for(String fieldName:m.keySet()){
		                	List<Object> fieldList = (List<Object>)m.get(fieldName);
			                	if(fieldList!=null){
			                		Map<String, Object> cat2 = (Map<String, Object>)fieldList[0];
				                	system.debug('fieldName======'+fieldName);
				                	system.debug('fieldList[0].getconfident======'+(Boolean)cat2.get('confident'));
				                	system.debug('fieldList[0].gettag======'+cat2.get('tag'));
				                	if((Boolean)cat2.get('confident') && cat2.get('tag')!=null && caseMap.get(wiseprediction.wisespt__CaseID__c).get(fieldName) == null){
				                		caseMap.get(wiseprediction.wisespt__CaseID__c).put(fieldName,cat2.get('tag'));
				                		caseMap.get(wiseprediction.wisespt__CaseID__c).stopAssignmentRule__c = true;
				                		System.debug('Field was null >>>'+caseMap.values());
				                	}	
		                	   }	
		                }
		               
		                update caseMap.values(); 
		                /*Database.DMLOptions dmo = new Database.DMLOptions();
	                    dmo.assignmentRuleHeader.useDefaultRule = false;
				         if(caseMap.values().size() > 0){
				         	TriggerHandler.bypass('CaseTriggerHandler');
						    database.update(caseMap.values(),dmo);
						    TriggerHandler.clearBypass('CaseTriggerHandler');
				         }*/
		            }
		          }catch(Exception e) {
		            System.debug('Error WiseTags_Populate_Trigger: ' + e.getMessage());
		            wiseprediction.wisespt__Wise_ParseJSON_Response_Error__c = true;
		            String err = e.getMessage() + ' WiseTag__c = ' + wiseprediction.wisespt__WiseTags__c;
		            System.debug('Error WiseTags_Populate_Trigger: ' + wiseprediction.wisespt__WiseTags__c);
		            Integer size_error = err.length();
		            if (size_error> 255){
		                err = err.substring(0,254);
		            }       
		            wiseprediction.wisespt__Wise_ParseJSON_Response_Error_Text__c = err;
		         }
	          } 
	     	}   
	     } 
     	}
}

/* JSON 
{CX_911_Support_Business_Area__c=({confident=true, tag=Sales & Use Tax}), 
CX_911_Support_Category__c=({confident=true, tag=AvaTax Tax Content}), 
CX_911_Support_Product__c=({confident=true, tag=Avatax}), 
CX_911_Support_Reason_Detail__c=({confident=true, tag=due to address}), 
CX_911_Support_Reason__c=({confident=true, tag=Rate})}
*/