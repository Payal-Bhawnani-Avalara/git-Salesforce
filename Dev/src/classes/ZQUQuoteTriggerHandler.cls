public with sharing class ZQUQuoteTriggerHandler extends TriggerHandler{
  //protected override void beforeInsert(){}

    //protected override void beforeUpdate(){}

  //  protected override void beforeDelete(){}

  // protected override void afterInsert(){} 
    
    protected override void afterUpdate(){
    		//https://jira.avalara.com/browse/ITBSE-969
    		if(Trigger.new!=null){	
    			List<zqu__Quote__c> listQ=(List<zqu__Quote__c>) Trigger.new;
    			Set<Id> oppIDs=new Set<Id>();
    			Map<Id,zqu__Quote__c> mapOppQuotes=new Map<Id,zqu__Quote__c>();
    			for(zqu__Quote__c q:listQ){
    				if(String.isNotBlank(q.O_P_Status__c) && q.O_P_Status__c.equalsIgnoreCase('Completed') && q.zqu__Opportunity__c!=null){
    					oppIDs.add(q.zqu__Opportunity__c);
    					mapOppQuotes.put(q.zqu__Opportunity__c,q);
    				}
    			}
    			if(oppIDs!=null && oppIDs.size()>0){
    				List<Opportunity> listOpps=new List<Opportunity>();
    				List<OpportunityLineItem> listOLIs=new List<OpportunityLineItem>();
    				for(Opportunity o:[Select Id,Amount,(Select Id From OpportunityLineItems) From Opportunity Where Id=:oppIDs]){
    					if(o.OpportunityLineItems.size()>0){
    						o.Amount=mapOppQuotes.get(o.Id).ExtendedActual__c;
    						listOLIs.addAll(o.OpportunityLineItems);
    						listOpps.add(o);
    					}
    				}
    				delete listOLIs;
    				update listOpps;
    			}
    		}
    		
    }

   // protected override void afterDelete(){}

   // protected override void afterUndelete(){}     
}