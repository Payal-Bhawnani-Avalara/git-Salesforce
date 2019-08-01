/*------------------------------------------------------------------------+
Original Shift(developer@originalshift.com)
Purpose: Handles the CPQ Opportunity Trigger
 
Details: Twin Maps from the Primary Quote on Closed Won, if the setting is enabled
 
History:
Feb 02/19 - Original Shift - Initial Implementation
------------------------------------------------------------------------+*/ 
public class OSCPQ_OpportunityTriggerHandler {
	@testVisible private CPQ_Setting__mdt settings; //Testvisible so that test classes can inject special settings.
    
    /*
     * Constructor - takes a metadata record API name, so that
     *  more scenarios can be accomodated as needed in an implemenation.
     *  For example, Partner quotes may not have the same level of automation
     */
    public OSCPQ_OpportunityTriggerHandler(String settingsAPIName) {
        if(settingsAPIName != null && settingsAPIName != '') {
            CPQ_Setting__mdt tmpSettings = OSCPQ_Utils.getContractSettings(settingsAPIName);
            if(tmpSettings != null){
                settings = tmpSettings;
            }
        }
    }
    
    public void onBeforeUpdate(List<Opportunity> newOppList, Map<Id, Opportunity> oldOppMap) {
        if(settings.TwinMapping_PrimaryQuoteToOpp__c == 'ON_CLOSED_WON'){
            List<Opportunity> oppsToMapList = new List<Opportunity>();
            
            for(Opportunity newOpp : newOppList) {
                system.debug('debuggin:');
                system.debug(newOpp.StageName);
                system.debug(newOpp.SBQQ__PrimaryQuote__c);
                system.debug(oldOppMap.containskey(newOpp.Id));
                system.debug(oldOppMap.get(newOpp.Id).StageName);
                if(newOpp.StageName == 'Closed Won' && newOpp.SBQQ__PrimaryQuote__c != null && oldOppMap.containskey(newOpp.Id) && oldOppMap.get(newOpp.Id).StageName != 'Closed Won') {
                    oppsToMapList.add(newOpp);
                }
            }
            
            if(!oppsToMapList.isEmpty()) {
                OSCPQ_Utils.twinMapFieldsPull(oppsToMapList, 'SBQQ__Quote__c', 'SBQQ__PrimaryQuote__c', false);
            }
        }
    }
    
}