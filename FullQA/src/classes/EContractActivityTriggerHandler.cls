public class EContractActivityTriggerHandler extends TriggerHandler {
  //Trigger Handler Methods
     protected override void beforeInsert(){
     beforeInsertUpdate();
     }

  	protected override void beforeUpdate(){
  	 beforeInsertUpdate();
  	 }
    
  	 public void beforeInsertUpdate(){
  	     for(Sertifi2_0__EContractActivity__c eConAc: (List<Sertifi2_0__EContractActivity__c>) Trigger.new){
  	     	//System.debug('eConAc.Sertifi2_0__Details__c.length() >>>'+eConAc.Sertifi2_0__Details__c.length());
  	     	if(String.isNotBlank(eConAc.Sertifi2_0__Details__c) && eConAc.Sertifi2_0__Details__c.length() >= 255){
  	     	    eConAc.Sertifi2_0__Details__c =  eConAc.Sertifi2_0__Details__c.substring(0,255);
                eConAc.Details_Backup__c = eConAc.Sertifi2_0__Details__c;
  	     	    System.debug('eConAc.Details_Backup__c  >>>'+eConAc.Details_Backup__c );
  	     	    System.debug('eConAc.Sertifi2_0__Details__c  >>>'+ eConAc.Sertifi2_0__Details__c);
  	     	}
  	     }
  	 }
}