global class AjaxUtility {
    webservice static String getPlaceOrderError(String cpqId){
    		String result='';
    		if(String.isNotBlank(cpqId)){
			CameleonCPQ__Quote__c q=[select Id,SOPReady__c from CameleonCPQ__Quote__c where id=:cpqId];
			q.SOPReady__c=true;
			if(Test.isRunningTest()){
				 q.Finance_Status__c='11. Customer Requested Cancellation';
				 q.Finance_Comments__c='';				
			}
			Savepoint sp = Database.setSavepoint();
			try{
			    update q;
			}
			catch(DMLException e){
			    for (Integer i = 0; i < e.getNumDml(); i++) {
			        result+=e.getDmlMessage(i)+'\n';
			    }
			}
			catch(Exception e){
			    result+=e.getMessage();
			}
			System.debug('errorMessage====='+result);
			Database.rollback(sp);
    		}
    		return result;
    }
}