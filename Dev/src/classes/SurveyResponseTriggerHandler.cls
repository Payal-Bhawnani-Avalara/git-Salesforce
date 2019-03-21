public with sharing class SurveyResponseTriggerHandler extends TriggerHandler {
    //Trigger Handler Methods
 //  protected override void beforeInsert(){}

  //  protected override void beforeUpdate(){}

  
  //  protected override void beforeDelete(){}

    protected override void afterInsert(){
    		afterInsertUpdate();
    }

    protected override void afterUpdate(){
    		afterInsertUpdate();
    }

    //protected override void afterDelete(){}

    //protected override void afterUndelete(){}
    
    //Helper Methods    
    public void afterInsertUpdate(){
    		if(Trigger.newMap!=null && Trigger.newMap.size()>0){
    			if(!System.isBatch() && !System.isFuture() && !System.isScheduled()){
    				updateSurveyResponse(Trigger.newMap.keySet());
    			}
    		}
    }
    @future
    public static void updateSurveyResponse(Set<Id> setSurveyResponseIDs){
    		//Future method is updating same record again. To avoid recursion by pass trigger
    		//This code is assuming that there will never be more than 199(futur method limit is 200) business rules in AvaConfig because it is running SOQL within loop
    		TriggerHandler.bypass('SurveyResponseTriggerHandler');
    		if(setSurveyResponseIDs!=null && setSurveyResponseIDs.size()>0){
    			Set<Id> setSurveyResponseIDsTemp=setSurveyResponseIDs;
    			Map<Id,AvaConfig__c> mapSurveyActionRules=new Map<Id,AvaConfig__c>([Select Id,Value1__c,Value2__c From AvaConfig__c Where Type__c='Survey Action Rule' AND Active__c=true Order By Sort_Order__c ASC]);
    			Map<Id,Map<Id,SurveyResponse__c>> mapACSurveyResponse=new Map<Id,Map<Id,SurveyResponse__c>>();
    			for(Id acID:mapSurveyActionRules.keySet()){
    				AvaConfig__c ac=mapSurveyActionRules.get(acID);
    				if(String.isNotBlank(ac.Value1__c) && String.isNotBlank(ac.Value2__c)){
    					List<SurveyResponse__c> listSR=Database.query(ac.Value1__c+' AND Id=:setSurveyResponseIDsTemp');
    					Map<Id,SurveyResponse__c> mapSR=new Map<Id,SurveyResponse__c>(listSR);
    					mapACSurveyResponse.put(acID,mapSR);
    				}
    			}
    			List<SurveyResponse__c> listSurveyResponse=[Select Id,Call_to_Action__c,Evaluation_Status__c From SurveyResponse__c Where Id=:setSurveyResponseIDsTemp];
    			for(SurveyResponse__c sr:listSurveyResponse){
    				sr.Call_to_Action__c='';
    				sr.Evaluation_Status__c='Complete';
    				for(Id acID:mapACSurveyResponse.keySet()){
    					Map<Id,SurveyResponse__c> mapSR=mapACSurveyResponse.get(acId);
    					if(mapSR.containsKey(sr.Id)){
    						sr.Call_to_Action__c+=mapSurveyActionRules.get(acID).Value2__c+'\r\n';
    					}
    				}
    			}
    			update listSurveyResponse;
    		}
    }
}