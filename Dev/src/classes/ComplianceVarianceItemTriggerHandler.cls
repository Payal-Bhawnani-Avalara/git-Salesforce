public class ComplianceVarianceItemTriggerHandler extends TriggerHandler {
      //Trigger Handler Methods
    protected override void beforeInsert(){
    	 beforeInsertUpdate();
    }
    	
      protected override void beforeUpdate(){
            beforeInsertUpdate();
    }
    public void beforeInsertUpdate(){
    	    Map<Decimal,Compliance_Item__c> mapComplianceAccountIDs=new  Map<Decimal,Compliance_Item__c>();
            for(Compliance_Item__c cVI :(List<Compliance_Item__c>)Trigger.new){
            	if(/*String.isNotBlank(cVI.name) &&*/ cVI.AvaTaxAccountIdNew__c!=null && cVI.Account__c==null){
            	    mapComplianceAccountIDs.put(cVI.AvaTaxAccountIdNew__c,cVI);
            	}
            }
        
	            Map<Decimal,Id> mapAccountIDs=new Map<Decimal,Id>();
	            for(Account_Statistics__c accStat:[Select Id,Account__c,AvaTaxAccountID__c,AccountID__c
	                                From Account_Statistics__c Where AccountID__c=:mapComplianceAccountIDs.keySet() AND Account__r.ActiveCustomer__c=true 
	                                AND System_SubType__c != 'TRUSTFILE' AND System__c='PROD']){
	                mapAccountIDs.put(accStat.AccountID__c,accStat.Account__c);
	            }
	            for(Compliance_Item__c cVI :(List<Compliance_Item__c>)Trigger.new){
	               if(mapAccountIDs.containsKey(cVI.AvaTaxAccountIdNew__c)){
	            	   mapComplianceAccountIDs.get(cVI.AvaTaxAccountIdNew__c).Account__c=mapAccountIDs.get(cVI.AvaTaxAccountIdNew__c);
	            	}
	            }
           
    }
    /*
    protected override void beforeUpdate(){
            beforeInsertUpdate();
    }
    protected override void afterInsert(){
        if(!afterInsertUpdateExecuted){
            afterInsertUpdate();
        }
    }
    
    protected override void beforeDelete(){}

    protected override void afterDelete(){}

    protected override void afterUndelete(){}
    */
}