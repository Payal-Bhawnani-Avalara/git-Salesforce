public class EventTriggerHandler extends TriggerHandler {
	
	 //Trigger Handler Methods
	 //customsetting : KeyPairValue__c KeyPairValue
	 
  	protected override void beforeInsert(){
  	 //TECHDEBT: PAYAL 9/15/2017
     //Trigger to Add Events to Opportunity Activity History
     //Jira Ticket : https://jira.avalara.com/browse/IBST-5148?filter=-1
     //create constnt class   
      Set<Id> contactId = new Set<Id>();
      for( Event e : (List<Event>)Trigger.new)
      {
         if (e.whoid!=null&&e.whoid.getsobjecttype()==Contact.sObjectType){
          	contactId.add(e.WhoId);   
         }
      }
      if(contactId.size()>0){
      	Map<Id,Id> mapContactOpp = new Map<Id,Id>();   	
      	String csOpportunitySubType;
        List<String> listOppSubType = new List<String>();
        csOpportunitySubType = KeyPairValue__c.getInstance('OpportunitySubType').Values__C; 
        listOppSubType=csOpportunitySubType.split('@@');  

      for(OpportunityContactRole oCR : [SELECT ContactId, OpportunityId, CreatedDate,Opportunity.Type,Opportunity.Connector__c,Opportunity.SubType__c,
      Opportunity.CloseDate FROM OpportunityContactRole WHERE Opportunity.Type = 'New' AND Opportunity.Connector__c != null AND 
      Opportunity.SubType__c = :listOppSubType
      AND Opportunity.isClosed=false AND ContactId = : contactId ORDER BY CreatedDate DESC]){
    
      mapContactOpp.put(oCR.ContactId,oCR.OpportunityId); 
      }
      
      for( Event e : (List<Event>)Trigger.new)
         {          
             if (e.WhoId != null && mapContactOpp.containsKey(e.WhoId))
             {         
                e.WhatID = mapContactOpp.get(e.WhoId);        
             }  
          }
      }
  	}

    /*
  	protected override void beforeUpdate(){}

    protected override void beforeDelete(){}

  	protected override void afterInsert(){}

  	protected override void afterUpdate(){}

  	protected override void afterDelete(){}

  	protected override void afterUndelete(){}
	*/
    //Helper Methods
  
}