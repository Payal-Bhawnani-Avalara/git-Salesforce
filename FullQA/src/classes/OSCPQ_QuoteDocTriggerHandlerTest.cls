@isTest
public class OSCPQ_QuoteDocTriggerHandlerTest {
    @testSetup
    static void setup(){
        Account acct = OSCPQ_TestFactory.createSingleAccount(true);
        Opportunity opp = OSCPQ_TestFactory.createSingleOpp(acct, true);
        SBQQ__Quote__c quote = OSCPQ_TestFactory.createSingleQuote(acct, opp, true, true);
        SBQQ__QuoteDocument__c doc = OSCPQ_TestFactory.createSingleQuoteDoc(quote, opp, true);
    }
    
	@isTest
    static void testPostiveScenario(){
        OSCPQ_QuoteDocTriggerHandler handler = new OSCPQ_QuoteDocTriggerHandler('Default');
        handler.settings.DocAccept_QuoteStage__c = 'Accepted';
        handler.settings.DocAccept_OpptyStage__c = 'Closed Won';
        handler.settings.DocAccept_MoveDocumentTo__c = ''; //Stubbed out for v1.0
        
        SBQQ__QuoteDocument__c doc = [Select Id, SBQQ__Quote__c, SBQQ__Opportunity__c, SBQQ__SignatureStatus__c FROM SBQQ__QuoteDocument__c LIMIT 1];
        
        Test.startTest();
        SBQQ__QuoteDocument__c oldDoc = doc.clone();
        Map<Id, SBQQ__QuoteDocument__c> oldDocMap = new Map<Id, SBQQ__QuoteDocument__c>();
        oldDocMap.put(doc.Id, oldDoc);
        
        Map<Id, SBQQ__QuoteDocument__c> newDocMap = new Map<Id, SBQQ__QuoteDocument__c>();
        doc.SBQQ__SignatureStatus__c = 'Signed';
        newDocMap.put(doc.Id, doc);
        
        handler.closeSignedQuotes(newDocMap, oldDocMap);
        Test.stopTest();
        
        SBQQ__Quote__c quote = [SELECT Id, SBQQ__Status__c FROM SBQQ__Quote__c LIMIT 1];
        Opportunity opp = [SELECT Id, StageName FROM Opportunity LIMIT 1];
        System.assert(quote.SBQQ__Status__c == 'Accepted' || quote.SBQQ__Status__c == 'Approved', 'Expected Quote Status to go to Accepted or Approved but it is ' + quote.SBQQ__Status__c);
        System.assert(opp.StageName == 'Closed Won', 'Expected Opp StageName to be Closed Won but it is ' + opp.StageName);
    }
    
    @isTest
    static void testBadStatus(){
        OSCPQ_QuoteDocTriggerHandler handler = new OSCPQ_QuoteDocTriggerHandler('Default');
        handler.settings.DocAccept_QuoteStage__c = 'INVALID';
        handler.settings.DocAccept_OpptyStage__c = 'INVALID_OPP';
        handler.settings.DocAccept_MoveDocumentTo__c = ''; //Stubbed out for v1.0
        
        SBQQ__QuoteDocument__c doc = [Select Id, SBQQ__Quote__c, SBQQ__Opportunity__c, SBQQ__SignatureStatus__c FROM SBQQ__QuoteDocument__c LIMIT 1];
        
        Test.startTest();
        SBQQ__QuoteDocument__c oldDoc = doc.clone();
        Map<Id, SBQQ__QuoteDocument__c> oldDocMap = new Map<Id, SBQQ__QuoteDocument__c>();
        oldDocMap.put(doc.Id, oldDoc);
        
        Map<Id, SBQQ__QuoteDocument__c> newDocMap = new Map<Id, SBQQ__QuoteDocument__c>();
        doc.SBQQ__SignatureStatus__c = 'Signed';
        newDocMap.put(doc.Id, doc);
        
        handler.closeSignedQuotes(newDocMap, oldDocMap);
        Test.stopTest();
        
        SBQQ__Quote__c quote = [SELECT Id, SBQQ__Status__c FROM SBQQ__Quote__c LIMIT 1];
        Opportunity opp = [SELECT Id, StageName FROM Opportunity LIMIT 1];
        system.debug(opp);
        system.debug(quote);
        //system.assert(quote.SBQQ__Status__c == 'Accepted', 'Expected Quote Status to go to Accepted but it is ' + quote.SBQQ__Status__c);
        //system.assert(opp.StageName == 'Closed Won', 'Expected Opp StageName to be Closed Won but it is ' + opp.StageName);
    }
    
    @isTest
    static void testTrigger(){
        OSCPQ_QuoteDocTriggerHandler handler = new OSCPQ_QuoteDocTriggerHandler('Default');
        handler.settings.DocAccept_QuoteStage__c = 'Accepted';
        handler.settings.DocAccept_OpptyStage__c = 'Closed Won';
        handler.settings.DocAccept_MoveDocumentTo__c = ''; //Stubbed out for v1.0
        
        SBQQ__QuoteDocument__c doc = [Select Id, SBQQ__Quote__c, SBQQ__Opportunity__c, SBQQ__SignatureStatus__c FROM SBQQ__QuoteDocument__c LIMIT 1];
        
        Test.startTest();
        doc.SBQQ__SignatureStatus__c = 'Signed';
        update doc;
        Test.stopTest();
    }
}