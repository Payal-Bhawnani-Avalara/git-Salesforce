public class CampaignTriggerHandler extends TriggerHandler {
	 //Trigger Handler Methods
     //protected override void beforeInsert(){}
     //protected override void beforeUpdate(){}
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
     	//TECHDEBT: Payal 01/10/2017
        //This code will check VAT number IBST-4412
        Set<Id> parentCampaignIds=new Set<Id>();
     	Set<Id> campaignIds=new Set<Id>();
         Map<Id,Campaign> mapCampaigns=new Map<Id,Campaign>();
         for(Campaign c:(List<Campaign>)Trigger.new){
        		//if(c.NumberOfOpportunities>0){
        			campaignIds.add(c.id);
        			parentCampaignIds.add(c.ParentId);
        			mapCampaigns.put(c.Id,new Campaign(Id=c.id,Open_Opportunity_Weighted_Value__c=0));
        		//}
         }
         
         //Rollup Open_Opportunity_Weighted_Value__c from Opportunity to Campaign
     	AggregateResult[] groupedResults= [select CampaignId,sum(Weighted_Value__c) OpenOppWeightedValue 
     										From Opportunity Where Weighted_Value__c>0 AND CampaignId=:campaignIds group by CampaignId]; 
		
		for (AggregateResult ar : groupedResults){
			mapCampaigns.put(String.valueOf(ar.get('CampaignId')),new Campaign(Id=String.ValueOf(ar.get('CampaignId')),Open_Opportunity_Weighted_Value__c=Integer.valueOf(ar.get('OpenOppWeightedValue'))));
		}
		
		//Rollup Open_Opportunity_Weighted_Value__c from Child Campaign to Prent Campaign
		AggregateResult[] groupedResultsParent = [select ParentId,sum(Open_Opportunity_Weighted_Value__c) OpenOppWeightedValueChild
     										From Campaign Where Open_Opportunity_Weighted_Value__c>0 AND ParentId=:campaignIds And ParentId!=null group by ParentId]; 
		
		for (AggregateResult agInstance : groupedResultsParent){
			
			Id parentId = (Id)agInstance.get('ParentId');
			if(mapCampaigns.containsKey(parentId)){
			   mapCampaigns.get(parentId).Open_Opportunity_Weighted_Value__c+= Integer.valueOf(agInstance.get('OpenOppWeightedValueChild'));
			}
		}
		//by pass account trigger 
		TriggerHandler.bypass('CampaignTriggerHandler');
		TriggerHandler.bypass('OpportunityTriggerHandler');
		database.update(mapCampaigns.values(),true);
		TriggerHandler.clearBypass('CampaignTriggerHandler');
		TriggerHandler.clearBypass('OpportunityTriggerHandler');		 
		
		
     }
}