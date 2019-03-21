public class EventTriggerHandler extends TriggerHandler {
	
	 //Trigger Handler Methods
	 //customsetting : KeyPairValue__c KeyPairValue
	 
  	protected override void beforeInsert(){
  	 //TECHDEBT: PAYAL 9/15/2017
     //Trigger to Add Events to Opportunity Activity History
     //Jira Ticket : https://jira.avalara.com/browse/IBST-5148?filter=-1
     //create constnt class   
      Set<Id> contactId = new Set<Id>();
      Set<Id> accountID = new Set<Id>();
      Map<Id,Id> accConMap = new Map<Id,Id>(); 
      for( Event e : (List<Event>)Trigger.new)
      {
         if (e.whoid!=null&&e.whoid.getsobjecttype()==Contact.sObjectType){
          	contactId.add(e.WhoId);   
          	//accountID.add(e.WhoId.AccountID);
         }
      }
      for(Contact con : [Select AccountID from Contact where Id IN :contactId]){
         accountID.add(con.AccountID);
         accConMap.put(con.AccountID,con.id);
      }
      if(contactId.size()>0){
      	Map<Id,Id> mapContactOpp = new Map<Id,Id>();  
      	Map<Id,Id> mapContactJX = new Map<Id,Id>();
      	String csOpportunitySubType;
        List<String> listOppSubType = new List<String>();
        csOpportunitySubType = KeyPairValue__c.getInstance('OpportunitySubType').Values__C; 
        listOppSubType=csOpportunitySubType.split('@@');  

        for(OpportunityContactRole oCR : [SELECT ContactId, OpportunityId, CreatedDate,Opportunity.Type,Opportunity.Connector__c,Opportunity.SubType__c,
                                         Opportunity.CloseDate FROM OpportunityContactRole WHERE Opportunity.Type = 'New' AND Opportunity.Connector__c != null AND 
                                         Opportunity.SubType__c = :listOppSubType AND Opportunity.isClosed=false AND ContactId = : contactId ORDER BY CreatedDate DESC]){
    
              mapContactOpp.put(oCR.ContactId,oCR.OpportunityId); 
        }
        Id implementationCaseRecTypeId=[Select Id from RecordType where DeveloperName='Activation' limit 1].Id;
        for(JX_Data_Feed__c jx: [Select id,Account__c from JX_Data_Feed__c where Account__c=:accountID ]){
             mapContactJX.put(accConMap.get(jx.Account__c),jx.id);      
             //System.debug('Contact and Case '+ c.contactid +','+c.id);
        }
      
        for( Event e : (List<Event>)Trigger.new)
         {          
             if (e.WhoId != null && mapContactOpp.containsKey(e.WhoId))
             {         
                e.WhatID = mapContactOpp.get(e.WhoId);        
             }
             //BATS-729
             else if(e.WhoId != null && mapContactJX.containsKey(e.WhoId)/*&& Meeting_Type_CP__c*/){
                 e.WhatID =mapContactJX.get(e.WhoId);
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