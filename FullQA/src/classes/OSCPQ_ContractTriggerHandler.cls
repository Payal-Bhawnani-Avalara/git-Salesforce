/*------------------------------------------------------------------------+
Original Shift(developer@originalshift.com)
Purpose: Handles the CPQ Contract Trigger
 
Details: - Deforecasts Orphaned Renewal Opportunties
		 - Twin maps from the Quote/Opp/Order as Apporpriate
 
History:
Feb 12/19 - Original Shift - Initial Implementation
July 11/19 - Original Shift - Added onBeforeUpdate method for Avalara to fix twin fielding
           - Original Shift - Added contractTwinMapping method for Avalara to fix twin fielding
------------------------------------------------------------------------+*/ 
public class OSCPQ_ContractTriggerHandler {
    @testVisible private CPQ_Setting__mdt settings; //Testvisible so that test classes can inject special settings.
    private Id cpqContractRecordType = Schema.SObjectType.Contract.getRecordTypeInfosByDeveloperName().get('CPQ').getRecordTypeId();
    
    /*
     * Constructor - takes a metadata record API name, so that
     *  more scenarios can be accomodated as needed in an implemenation.
     *  For example, Partner quotes may not have the same level of automation
     */
    public OSCPQ_ContractTriggerHandler(String settingsAPIName){
        if(settingsAPIName != null && settingsAPIName != ''){
            CPQ_Setting__mdt tmpSettings = OSCPQ_Utils.getContractSettings(settingsAPIName);
            if(tmpSettings != null){
                settings = tmpSettings;
            }
        }
        else{
            settings = OSCPQ_Utils.getContractSettings('Default');
        }
    }
    
    /*
     * Primary method; identifies which renewal Opps are orphaned by the fact that the co-term + renewal process
     * 		will point re-point the renewal opps of any non-master contracts over to the master
     */
    public void deforecastOrphanedOpps (List<Contract> updatedContractList, Map<Id, Contract> oldContractMap){
        //Only execute the function's logic if the settings are enabled
        if(settings.RenewCoTerm_DeforecastOrphans__c != 'No'){
            //Isolate only contracts that should have opportunities zero'd out (have had their renewal opp lookup changed)
            List<Contract> childContractsCoTermList = new List<Contract>();
            for(Contract c : updatedContractList){
                if(c.RecordTypeId == cpqContractRecordType && 
                   c.SBQQ__RenewalOpportunity__c != null && 
                   c.SBQQ__RenewalOpportunity__c != oldContractMap.get(c.Id).SBQQ__RenewalOpportunity__c && 
                   oldContractMap.get(c.Id).SBQQ__RenewalOpportunity__c != null){
                       
                    childContractsCoTermList.add(c);
                }
            }
            
            //If there are non-master contracts being co-termed, then call the  deforecastOpps or deforecastOpps_future method as appropriate
            if(!childContractsCoTermList.isEmpty()){
                Set<Id> childContractsCoTermIds = (new Map<Id, Contract>(childContractsCoTermList)).keySet();
                if(!settings.RenewalCoTerm_DeforecastAsync__c){ //Synchronous
                        deforecastOpps(childContractsCoTermIds, settings.RenewCoTerm_DeforecastOrphans__c);
                }
                else{ //Async
                    deforecastOrphanedOpps_future(childContractsCoTermIds, settings.RenewCoTerm_DeforecastOrphans__c);
                }
            }
        }
    }
    
    @future
    private static void deforecastOrphanedOpps_future(Set<ID> contractIds, String DeforecastSettings){
        //First clear any opportunities that are forecast-only (no primary quotes)
        List<Opportunity> forecastOnlyOpportunitiesCleared = deforecastOpps(contractIds, DeforecastSettings);
    }
    
    /*
     * Primary helper function that does all the heavy lifting & DML operations
     */
    private static List<Opportunity> deforecastOpps(Set<Id> childContractsCoTermList, String DeforecastSettings){
        List<Opportunity> oppsToDeforecast = new List<Opportunity>();
        
        //Deforecast-only block
        if(DeforecastSettings == 'Deforecast'){
	        oppsToDeforecast = [SELECT Id FROM Opportunity WHERE SBQQ__RenewedContract__c IN :childContractsCoTermList];
        	List<OpportunityLineItem> lineItemsToDelete = [SELECT Id FROM OpportunityLineItem WHERE Opportunity.Id IN :oppsToDeforecast];
        	List<SBQQ__Quote__c> quotesToUnprimary = [SELECT Id, SBQQ__Primary__c FROM SBQQ__Quote__c WHERE SBQQ__Primary__c = true AND SBQQ__Opportunity2__c IN :oppsToDeforecast];
            
            System.debug(lineItemsToDelete.size() + ' Opp Lines will be deleted');
            if(!lineItemsToDelete.isEmpty()){
            	System.debug('Deleteing Lines: ' + lineItemsToDelete);
        		Database.DeleteResult[] deleteList = Database.delete(lineItemsToDelete, false);
                System.debug(deleteList);
            }
            
            System.debug(quotesToUnprimary.size() + ' quotes will be unmarked as primary');
            if(!quotesToUnprimary.isEmpty()){
                for(SBQQ__Quote__c quote : quotesToUnprimary){
                    quote.SBQQ__Primary__c = false;
                }
               	System.debug('Un-Primarying Lines: ' + lineItemsToDelete);
                SBQQ.TriggerControl.disable();
                try{
	        		Database.SaveResult[] updateList = Database.update(quotesToUnprimary, false);
                    System.debug(updateList); 
                }
                finally{
                    SBQQ.TriggerControl.enable();
                }
            }
        }
        //Deforecast+Delete block
        else if(DeforecastSettings == 'DeforecastAndDelete'){
	        oppsToDeforecast = [SELECT Id FROM Opportunity WHERE SBQQ__RenewedContract__c IN :childContractsCoTermList];
        	
            
            System.debug(oppsToDeforecast.size() + ' Opps will be deleted');
            if(!oppsToDeforecast.isEmpty()){
            	System.debug('Deleteing Opps: ' + oppsToDeforecast);
        		Database.DeleteResult[] deleteList = Database.delete(oppsToDeforecast, false);
                System.debug(deleteList);
            }
            
            //Package should handle deletion of Quotes when the Opp was deleted, but we'll make sure it's done
            List<SBQQ__Quote__c> quotesToDelete = [SELECT Id, SBQQ__Primary__c FROM SBQQ__Quote__c WHERE SBQQ__Opportunity2__c IN :oppsToDeforecast];
            System.debug(quotesToDelete.size() + ' quotes will be deleted on top of what the CPQ managed package already did');
            if(!quotesToDelete.isEmpty()){
               	System.debug('Deleteing Quotes: ' + quotesToDelete);
        		Database.DeleteResult[] deleteList = Database.delete(quotesToDelete, false);
                System.debug(deleteList);
            }
        }
        
        return oppsToDeforecast;
    }    
    
    /*
     * onBeforeInsert method. Used to twin map from the appropriate object
     */
    public void onBeforeInsert(List<Contract> newContractList) {
        List<Contract> contractsToTwinMapList = new List<Contract>();
        
        if(settings.TwinMapping_MapToContract__c != 'NEVER') {
            for(Contract newContract : newContractList) {
                if(settings.TwinMapping_MapToContract__c == 'FROM_QUOTE' && newContract.SBQQ__Quote__c != null){
                    contractsToTwinMapList.add(newContract);
                }
                else if(settings.TwinMapping_MapToContract__c == 'FROM_OPP' && newContract.SBQQ__Opportunity__c != null){
                    contractsToTwinMapList.add(newContract);
                }
                else if(settings.TwinMapping_MapToContract__c == 'FROM_ORDER' && newContract.SBQQ__Order__c != null){
                    contractsToTwinMapList.add(newContract);
                }
            }
            contractTwinMapping(contractsToTwinMapList);
        }
    }

    /*
    * onBeforeUpdate method. Used to twin map from the appropriate object
    */
    public void onBeforeUpdate(List<Contract> newContractList, Map<Id, Contract> oldContractMap) {
        List<Contract> contractsToTwinMapList = new List<Contract>();

        if(settings.TwinMapping_MapToContract__c != 'NEVER') {
            for(Contract newContract : newContractList) {
                if(settings.TwinMapping_MapToContract__c == 'FROM_QUOTE' &&
                        newContract.SBQQ__Quote__c != null &&
                        oldContractMap.get(newContract.Id).SBQQ__Quote__c == null){
                    contractsToTwinMapList.add(newContract);
                }
                else if(settings.TwinMapping_MapToContract__c == 'FROM_OPP' &&
                        newContract.SBQQ__Opportunity__c != null &&
                        oldContractMap.get(newContract.Id).SBQQ__Opportunity__c == null){
                    contractsToTwinMapList.add(newContract);
                }
                else if(settings.TwinMapping_MapToContract__c == 'FROM_ORDER' &&
                        newContract.SBQQ__Order__c != null &&
                        oldContractMap.get(newContract.Id).SBQQ__Order__c == null){
                    contractsToTwinMapList.add(newContract);
                }
            }
            contractTwinMapping(contractsToTwinMapList);
        }
    }

    /*
    * contractTwinMapping method. Used to twin map from the appropriate object
    */
    public void contractTwinMapping(List<Contract> contractsToTwinMapList) {
        if(!contractsToTwinMapList.isEmpty()) {
            if(settings.TwinMapping_MapToContract__c == 'FROM_QUOTE'){
                OSCPQ_Utils.twinMapFieldsPull(contractsToTwinMapList, 'SBQQ__Quote__c', 'SBQQ__Quote__c', false);
            }
            else if(settings.TwinMapping_MapToContract__c == 'FROM_OPP'){
                OSCPQ_Utils.twinMapFieldsPull(contractsToTwinMapList, 'Opportunity', 'SBQQ__Opportunity__c', false);
            }
            else if(settings.TwinMapping_MapToContract__c == 'FROM_ORDER'){
                OSCPQ_Utils.twinMapFieldsPull(contractsToTwinMapList, 'Order', 'SBQQ__Order__c', false);
            }
        }
    }

}