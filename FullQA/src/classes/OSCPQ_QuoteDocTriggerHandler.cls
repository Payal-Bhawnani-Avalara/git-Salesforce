/*
 * Class Responsible for logic related to Quote Document records
 */
public class OSCPQ_QuoteDocTriggerHandler {
    @testVisible private CPQ_Setting__mdt settings; //Testvisible so that test classes can inject special settings.
    
    /*
     * Constructor - takes a metadata record API name, so that
     *  more scenarios can be accomodated as needed in an implemenation.
     *  For example, Partner quotes may not have the same level of automation
     */
	public OSCPQ_QuoteDocTriggerHandler(String settingsAPIName){
        if(settingsAPIName != null && settingsAPIName != ''){
            CPQ_Setting__mdt tmpSettings = OSCPQ_Utils.getContractSettings(settingsAPIName);
            if(tmpSettings != null){
                settings = tmpSettings;
            }
        }
    }
    
    /*
     * Method that will take any Quote Documents that have moved to a Signed status and
     *    automatically mark its quote as Accepted, close/win the Opp, and move the document to the specified object
     *    as applicable in the CPQ Metadata settings
     */
    public void closeSignedQuotes(Map<Id, SBQQ__QuoteDocument__c> newUpdatedDocMap, Map<Id, SBQQ__QuoteDocument__c> oldDocMap){
        if(settings.DocAccept_QuoteStage__c != '' || settings.DocAccept_OpptyStage__c != '' || settings.DocAccept_MoveDocumentTo__c != ''){
        	List<Id> docsToMove = new List<Id>();
            List<Id> quotesToUpdateIds = new List<Id>();
            List<Id> oppsToUpdateIds = new List<Id>();

            for(SBQQ__QuoteDocument__c doc : newUpdatedDocMap.values()){
                SBQQ__QuoteDocument__c oldDoc = oldDocMap.get(doc.Id);
                
                //Only perform the logic if one of the udpates was changing to Signed
                if(doc.SBQQ__SignatureStatus__c == 'Signed' && (oldDoc == null || oldDoc.SBQQ__SignatureStatus__c != 'Signed')){
                    quotesToUpdateIds.add(doc.SBQQ__Quote__c);
                    oppsToUpdateIds.add(doc.SBQQ__Opportunity__c);
                }
            }
            
            //Update Quote Status as necessessary
            if(!quotesToUpdateIds.isEmpty() && settings.DocAccept_QuoteStage__c != ''){
                updateQuoteStatus(quotesToUpdateIds);
            }
            //Update Opp Stage as necessessary
            if(!oppsToUpdateIds.isEmpty() && settings.DocAccept_OpptyStage__c != ''){
                updateOppStage(oppsToUpdateIds);
            }
            //Move file as note & attachment as necessary
            if(settings.DocAccept_MoveDocumentTo__c != ''){
                
            }
        }
    }
    
    /*
     * Private helper method that handles the heavy lifting of updating the quote status and doing relevant error logging
     */
    private void updateQuoteStatus(List<Id> quotesToUpdateIds){
        if(!quotesToUpdateIds.isEmpty() && settings.DocAccept_QuoteStage__c != ''){
            Database.SaveResult[] updateList = new Database.SaveResult[]{};
            try{
                List<SBQQ__Quote__c> quoteList = [Select Id, SBQQ__Status__c FROM SBQQ__Quote__c WHERE Id IN :quotesToUpdateIds AND SBQQ__Status__c <> :settings.DocAccept_QuoteStage__c];
                if(!quoteList.isEmpty()){
                    for(SBQQ__Quote__c q : quoteList){
                        q.SBQQ__Status__c = settings.DocAccept_QuoteStage__c;
                    }
                        
                    updateList = Database.update(quoteList, false);
                }
            }
            finally{ //Log errors as necessary
                OSCPQ_Utils.createQTCErrorFromDMLSave('CPQ_QuoteDocTriggerHandler Failed to update quotes', //Subject
                                                    'CPQ', //targetPackage
                                                    'Document Acceptance', //process
                                                    'CPQ_QuoteDocTriggerHandler.closeSignedQuotes', //classMethodName
                                                    UserInfo.getUserId(), //runningUserId
                                                    updateList, //srList
                                                    false, //createMultipleRecords
                                                    true //performDML
                                                    
                                                   );
            }
        }
    }
    
    /*
     * Private helper method that handles the heavy lifting of updating the opportunity stage and doing relevant error logging
	 */
    private void updateOppStage(List<Id> oppsToUpdateIds){
        Database.SaveResult[] updateList = new Database.SaveResult[]{};
        try{
            List<Opportunity> oppList = [Select Id, StageName FROM Opportunity WHERE Id IN :oppsToUpdateIds AND StageName <> :settings.DocAccept_OpptyStage__c];
            if(!oppList.isEmpty()){
                for(Opportunity o : oppList){
                    o.StageName = settings.DocAccept_OpptyStage__c;
                }
                    
                updateList = Database.update(oppList, false);
            }
        }
        finally{ //Log errors as necessary
            OSCPQ_Utils.createQTCErrorFromDMLSave('CPQ_QuoteDocTriggerHandler Failed to update quotes', //Subject
                                                'CPQ', //targetPackage
                                                'Document Acceptance', //process
                                                'CPQ_QuoteDocTriggerHandler.closeSignedQuotes', //classMethodName
                                                UserInfo.getUserId(), //runningUserId
                                                updateList, //srList
                                                false, //createMultipleRecords
                                                true //performDML
                                                
                                               );
        }
    }
    
}