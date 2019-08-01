public with sharing class ZuoraAccountProcessNow {
	public List<Zuora_Account_Process__c> listZ {get;set;}
    public PageReference getRecords(){
    		 listZ= [Select Id,Status__c,Name From Zuora_Account_Process__c Where Status__c='New' limit 100];
    		for(Zuora_Account_Process__c z:listZ){
    			z.Status__c='Processed';
    		}
    		update listZ;
    		return null;
    }
}