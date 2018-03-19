public class ProsQuoteTriggerHandler extends TriggerHandler  {
    
    //Trigger Handler Methods
    /*
  	protected override void beforeInsert(){}

  	protected override void beforeUpdate(){}

    protected override void beforeDelete(){}

  	protected override void afterInsert(){}

  	protected override void afterDelete(){}

  	protected override void afterUndelete(){}
  	
	*/
    //IBST-6703
    //PROS Order Line Item Information Population Trigger
    protected override void afterUpdate(){
    	 afterInsertUpdate();
    }
    	
    	protected override void afterInsert(){
    	 afterInsertUpdate();
    	}
    	
    public void afterInsertUpdate(){
     Set<Id> oppIDSet = new Set<Id>();
     Map<CameleonCPQ__Quote__c,OpportunityLineItem> mapProsOpp=new Map<CameleonCPQ__Quote__c,OpportunityLineItem>();
     Set<Id> prosQuoteIDSet = new Set<Id>();  
        for( CameleonCPQ__Quote__c cpq : (List<CameleonCPQ__Quote__c>)Trigger.new){
             prosQuoteIDSet.add(cpq.Id);
             oppIDSet.add(cpq.OpportunityId__c);
        }
        Map<Id,Opportunity> mapOpps=new Map<Id,Opportunity>([Select Id,(Select OpportunityId,End_of_Agreement_Behavior__c,
        ItemType__c,AmendmentType__c  from OpportunityLineItems) From Opportunity Where Id=:oppIDSet]);
     // List<OpportunityLineItem> listOppLI = [Select OpportunityId,End_of_Agreement_Behavior__c, ItemType__c,Access_Start__c, Term_Start__c, Term_End__c,Term_Length__c  from
                                //      OpportunityLineItem  where OpportunityId IN :oppIDSet]; 
                                List<OpportunityLineItem> listOppLI =new List<OpportunityLineItem>  ();
        for( CameleonCPQ__Quote__c cpq : (List<CameleonCPQ__Quote__c>)Trigger.new)
        {
          if(String.isNotBlank(cpq.End_of_Agreement_Behavior__c) && String.isNotBlank(cpq.OpportunityId__c) &&
             oppIDSet.contains(cpq.OpportunityId__c) && mapOpps.containsKey(cpq.OpportunityId__c))
          {
              for(OpportunityLineItem OppLI : mapOpps.get(cpq.OpportunityId__c).OpportunityLineItems)
              {
                  if(String.isNotBlank( oppLI.ItemType__c)&& String.isNotBlank(OppLI.AmendmentType__c) && OppLI.AmendmentType__c == 'AddProduct' )
                  {
                  if(oppLI.ItemType__c =='One-Time' || oppLI.ItemType__c =='OneTime' ){
                       oppLI.End_of_Agreement_Behavior__c = 'Terminate';
                  }else{
                       oppLI.End_of_Agreement_Behavior__c = cpq.End_of_Agreement_Behavior__c;
                  }
                 
                 /* oppLI.Access_Start__c = cpq.ContractEffectiveDate__c;
                  oppLI.Term_Start__c = cpq.ServiceActivationDate__c ;
                  oppLI.Term_End__c = oppLI.Term_Start__c.addMonths(Integer.valueOf(oppLI.Term_Length__c ));*/
                  listOppLI.add(oppLI);
              }
             } 
          }
     }
          update listOppLI;  
    }
    
    //IBST-6181
    //Disable Delete on ProsQuote when Order is Complete
    protected override void beforeDelete(){
      for( CameleonCPQ__Quote__c cpq : (List<CameleonCPQ__Quote__c>)Trigger.old){
      	if(cpq.OPStatus__c == 'Complete'){
      		cpq.addError(' You cannot delete the Pros Quote if Order Status is Complete.');
      	}
      }
    }
}