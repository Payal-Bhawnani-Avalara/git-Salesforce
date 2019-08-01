/*------------------------------------------------------------------------+
Original Shift(developer@originalshift.com)
Purpose: Handles the CPQ Quote Trigger
 
Details: - Performs record type transition for the quote record for New-->Draft-->Submitted
		 - Twin maps from the Quote to Opp on Insert/Update as appropriate
 
History:
Feb 08/19 - Original Shift - Initial Implementation
------------------------------------------------------------------------+*/ 
public with sharing class OSCPQ_QuoteTriggerHandler {
    // Removed references to "New" Quote Record Type per BATS-1190
    // private Id cpqQuoteRecordTypeId_New = Schema.SObjectType.SBQQ__Quote__c.getRecordTypeInfosByDeveloperName().get('New').getRecordTypeId();
    private Id cpqQuoteRecordTypeId_Draft = Schema.SObjectType.SBQQ__Quote__c.getRecordTypeInfosByDeveloperName().get('Draft').getRecordTypeId();
    private Id cpqQuoteRecordTypeId_Submitted = Schema.SObjectType.SBQQ__Quote__c.getRecordTypeInfosByDeveloperName().get('Submitted').getRecordTypeId();
	
    @testVisible private CPQ_Setting__mdt settings; //Testvisible so that test classes can inject special settings.
    
    /*
     * Constructor - takes a metadata record API name, so that
     *  more scenarios can be accomodated as needed in an implemenation.
     *  For example, Partner quotes may not have the same level of automation
     */
    public OSCPQ_QuoteTriggerHandler(String settingsAPIName) {
        if(settingsAPIName != null && settingsAPIName != '') {
            CPQ_Setting__mdt tmpSettings = OSCPQ_Utils.getContractSettings(settingsAPIName);
            if(tmpSettings != null){
                settings = tmpSettings;
            }
        }
    }
    
    /*
     * Before Insert Method
     *   - Moves quotes from new to draft record type & Status
     *   - Twin Maps in from Contract as appropriate
     */
    public void onBeforeInsert(List<SBQQ__Quote__c> newQuoteList) {
        Set<Id> oppIdSet = new Set<Id>(); //set of opportunity Ids for the set of quotes
        List<SBQQ__Quote__c> renewedQuotesToMapList = new List<SBQQ__Quote__c>(); //For twin mapping. List of quotes that are renewals
        List<SBQQ__Quote__c> amendedQuotesToMapList = new List<SBQQ__Quote__c>(); //For twin mapping. List of quotes that are amendments
        
        //First loop - build Opp Id Set, and do logic that is independent of Opp
        for(SBQQ__Quote__c quote : newQuoteList){
            oppIdSet.add(quote.SBQQ__Opportunity2__c);

            /* Removed references to "New" Quote Record Type per BATS-1190           
            //Quote step transition block
            if(settings.Quoting_Automate_Quote_Steps__c == true) {
                //Convert all new quotes to Draft after the quote is first saved
                if(cpqQuoteRecordTypeId_Draft != null) {
                    if(quote.RecordTypeId == cpqQuoteRecordTypeId_New) {
                        quote.RecordTypeId = cpqQuoteRecordTypeId_Draft;
                    }
                }
                else { //No record type found
                    OSCPQ_Error__c err = OSCPQ_Utils.createQTCError('No Quote Draft record type exists', //Subject 
                                                                    'CPQ', //Package
                                                                    'Quote Step Transition', //Process
                                                                    'OSCPQ_QuoteTriggerHandler.onBeforeInsert', //Class-Method
                                                                    'Could not find a Draft record type on quote to transition to from New.', //Description
                                                                    UserInfo.getUserId(), //Running User
                                                                    true); //InsertDML
                    quote.addError('No Record Type of \'Draft\' Found');
                }
            }
*/   

        }
        
    
        //Query relevant Opp fields
        Map<Id, Opportunity> oppIdToRecordMap = new Map<Id, Opportunity>([SELECT Id, SBQQ__RenewedContract__c, SBQQ__AmendedContract__c FROM Opportunity WHERE Id IN:oppIdSet]);
		
        //Second Loop - apply any logic dependant on the Opps
        if(!oppIdToRecordMap.isEmpty()) {
            for(SBQQ__Quote__c quote : newQuoteList) {
                if(quote.SBQQ__Opportunity2__c != null && oppIdToRecordMap.containsKey(quote.SBQQ__Opportunity2__c)) {
                    Opportunity opp = oppIdToRecordMap.get(quote.SBQQ__Opportunity2__c);
                    if(opp.SBQQ__AmendedContract__c != null) {
                        quote.OSCPQ_Amended_Contract__c = opp.SBQQ__AmendedContract__c;
                        amendedQuotesToMapList.add(quote);
                    }
                    else if(opp.SBQQ__RenewedContract__c != null) {
                        quote.OSCPQ_Renewed_Contract__c = opp.SBQQ__RenewedContract__c;
                        renewedQuotesToMapList.add(quote);
                    }
                }
            }
        }
        if(settings.TwinMapping_MapFromContractToQuote__c == true) {
            if(!amendedQuotesToMapList.isempty()) {
                OSCPQ_Utils.twinMapFieldsPull(amendedQuotesToMapList, 'Contract', 'OSCPQ_Amended_Contract__c', false);
            }
            else if(!renewedQuotesToMapList.isempty()) {
                OSCPQ_Utils.twinMapFieldsPull(renewedQuotesToMapList, 'Contract', 'OSCPQ_Renewed_Contract__c', false);
            }
        }
    }
    
    /*
     * Before Update Method
     *   - Moves quotes between draft and submitted record types and the appropriate status based on the ApprovalStatus__c field
     */
    public void onBeforeUpdate(List<SBQQ__Quote__c> newQuoteList, Map<Id, SBQQ__Quote__c> oldQuoteMap) {
        if(settings.Quoting_Automate_Quote_Steps__c == true){
            for(SBQQ__Quote__c quote : newQuoteList) {
                SBQQ__Quote__c oldQuote = oldQuoteMap.get(quote.id);
                //On Approval Submission
                if(quote.ApprovalStatus__c == 'Pending' && quote.ApprovalStatus__c != oldQuote.ApprovalStatus__c) {
                    quote.SBQQ__Status__c = 'In Review';
                    if(cpqQuoteRecordTypeId_Submitted != null && quote.recordTypeId != cpqQuoteRecordTypeId_Submitted) {
                        quote.RecordTypeId = cpqQuoteRecordTypeId_Submitted;
                    }
                }
                //On Recall
                else if(quote.ApprovalStatus__c == 'Recalled' && quote.ApprovalStatus__c != oldQuote.ApprovalStatus__c) {
                    quote.SBQQ__Status__c = 'Draft';
                    if(cpqQuoteRecordTypeId_Draft != null && quote.recordTypeId != cpqQuoteRecordTypeId_Draft) {
                        quote.RecordTypeId = cpqQuoteRecordTypeId_Draft;
                    }
                }
                //On Approval Rejection
                else if(quote.ApprovalStatus__c == 'Rejected' && quote.ApprovalStatus__c != oldQuote.ApprovalStatus__c) {
                    quote.SBQQ__Status__c = 'Denied';
                    if(cpqQuoteRecordTypeId_Draft != null && quote.recordTypeId != cpqQuoteRecordTypeId_Draft) {
                    	quote.RecordTypeId = cpqQuoteRecordTypeId_Draft;
                    }
                }
                //On Approval
                else if(quote.ApprovalStatus__c == 'Approved' && quote.ApprovalStatus__c != oldQuote.ApprovalStatus__c) {
                    quote.SBQQ__Status__c = 'Approved';
                    if(cpqQuoteRecordTypeId_Submitted != null && quote.recordTypeId != cpqQuoteRecordTypeId_Submitted) {
                        quote.RecordTypeId = cpqQuoteRecordTypeId_Submitted;
                   		
                    }
                }
            }
        }
    }
	
    /*
     * After Insert Method
     *   - Twin Maps from Quote to Opp
     */
    public void onAfterInsert(List<SBQQ__Quote__c> newQuoteList) {
        this.twinMapToOpp(newQuoteList);
    }
    
    /*
     * After Update Method
     *   - Twin Maps from Quote to Opp
     */
    public void onAfterUpdate(List<SBQQ__Quote__c> newQuoteList) {
        this.twinMapToOpp(newQuoteList);
    }
    
    /*
     * Helper method that actually performs the twin mapping
     */
    private void twinMapToOpp(List<SBQQ__Quote__c> newQuoteList){
        List<SBQQ__Quote__c> quotesToMap = new List<SBQQ__Quote__c>();
        if(settings.TwinMapping_PrimaryQuoteToOpp__c == 'ALWAYS' || settings.TwinMapping_PrimaryQuoteToOpp__c == 'ON_ACCEPTED') {
            for(SBQQ__Quote__c newQuote : newQuoteList){
                if(newQuote.SBQQ__Primary__c == true &&
                  (settings.TwinMapping_PrimaryQuoteToOpp__c == 'ALWAYS' ||
                  (settings.TwinMapping_PrimaryQuoteToOpp__c == 'ON_ACCEPTED' && newQuote.SBQQ__Status__c == 'Accepted'))) {
                    quotesToMap.add(newQuote);
                }
            }
        }
        
        if(!quotesToMap.isEmpty()){
            OSCPQ_Utils.twinMapFieldsPush(newQuoteList, 'Opportunity', 'SBQQ__Opportunity2__c', false);
        }
    }

}