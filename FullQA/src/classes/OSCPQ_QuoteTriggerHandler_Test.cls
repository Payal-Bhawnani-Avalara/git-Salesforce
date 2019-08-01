/*------------------------------------------------------------------------+
Original Shift(developer@originalshift.com)
Purpose: Test Class for the OSCPQ_ContractTriggerHandler class
 
Details: Basic single-record (since mass approval submission shouldn't occur)
		tests.
 
History:
Feb 08/19 - Original Shift - Initial Implementation
------------------------------------------------------------------------+*/ 
@isTest
public class OSCPQ_QuoteTriggerHandler_Test {
	@testSetup static void setup() {
        Account acct = OSCPQ_TestFactory.createSingleAccount(true);
        Opportunity opp = OSCPQ_TestFactory.createSingleOpp(acct, true);
        SBQQ__Quote__c quote = OSCPQ_TestFactory.createSingleQuote(acct, opp, true, true);
    }
    
    @isTest static void testNewToDraftTransition() {
        Id cpqQuoteRecordTypeId_New = Schema.SObjectType.SBQQ__Quote__c.getRecordTypeInfosByDeveloperName().get('New').getRecordTypeId();
    	Id cpqQuoteRecordTypeId_Draft = Schema.SObjectType.SBQQ__Quote__c.getRecordTypeInfosByDeveloperName().get('Draft').getRecordTypeId();
    	//private Id cpqQuoteRecordTypeId_Submitted = Schema.SObjectType.SBQQ__Quote__c.getRecordTypeInfosByDeveloperName().get('Submitted').getRecordTypeId();
    	
        Account acct = [SELECT Id, Name FROM Account LIMIT 1];
        Opportunity opp = [SELECT Id FROM Opportunity LIMIT 1];
        SBQQ__Quote__c newQuote = OSCPQ_TestFactory.createSingleQuote(acct, opp, true, false);
        newQuote.RecordTypeId = cpqQuoteRecordTypeId_New;
        
        OSCPQ_QuoteTriggerHandler handler = new OSCPQ_QuoteTriggerHandler('Default');
        handler.settings.Quoting_Automate_Quote_Steps__c = true;
        handler.settings.TwinMapping_MapFromContractToQuote__c = false;
        
        List<SBQQ__Quote__c> newQuoteList = new List<SBQQ__Quote__c>{newQuote};
            
        Test.startTest();
        handler.onBeforeInsert(newQuoteList);
        Test.stopTest();
        
        system.assert(newQuoteList[0].RecordTypeId == cpqQuoteRecordTypeId_Draft);
    }
    
    @isTest static void testDraftToSubmittedTransition() {
    	Id cpqQuoteRecordTypeId_Draft = Schema.SObjectType.SBQQ__Quote__c.getRecordTypeInfosByDeveloperName().get('Draft').getRecordTypeId();
    	Id cpqQuoteRecordTypeId_Submitted = Schema.SObjectType.SBQQ__Quote__c.getRecordTypeInfosByDeveloperName().get('Submitted').getRecordTypeId();
    	
        Account acct = [SELECT Id, Name FROM Account LIMIT 1];
        Opportunity opp = [SELECT Id FROM Opportunity LIMIT 1];
        SBQQ__Quote__c newQuote = OSCPQ_TestFactory.createSingleQuote(acct, opp, true, false);
        newQuote.RecordTypeId = cpqQuoteRecordTypeId_Draft;
        newquote.ApprovalStatus__c = '';
        insert newQuote;

		SBQQ__Quote__c oldQuote = newQuote.clone();
		insert oldQuote;

		Map<Id, SBQQ__Quote__c> oldQuoteMap = new Map<Id, SBQQ__Quote__c>();
        oldQuoteMap.put(newQuote.Id, oldQuote);
        
        OSCPQ_QuoteTriggerHandler handler = new OSCPQ_QuoteTriggerHandler('Default');
        handler.settings.Quoting_Automate_Quote_Steps__c = true;
        handler.settings.TwinMapping_MapFromContractToQuote__c = false;
        
        
        
            
        Test.startTest();
        newQuote.ApprovalStatus__c = 'Pending';
        List<SBQQ__Quote__c> newQuoteList = new List<SBQQ__Quote__c>{newQuote};
        handler.onBeforeUpdate(newQuoteList, oldQuoteMap);
        Test.stopTest();
        
        system.assert(newQuoteList[0].RecordTypeId == cpqQuoteRecordTypeId_Submitted);
    }
    
    @isTest static void testSubmittedToRecalledTransition() {
    	Id cpqQuoteRecordTypeId_Draft = Schema.SObjectType.SBQQ__Quote__c.getRecordTypeInfosByDeveloperName().get('Draft').getRecordTypeId();
    	Id cpqQuoteRecordTypeId_Submitted = Schema.SObjectType.SBQQ__Quote__c.getRecordTypeInfosByDeveloperName().get('Submitted').getRecordTypeId();
    	
        Account acct = [SELECT Id, Name FROM Account LIMIT 1];
        Opportunity opp = [SELECT Id FROM Opportunity LIMIT 1];
        SBQQ__Quote__c newQuote = OSCPQ_TestFactory.createSingleQuote(acct, opp, true, false);
        newQuote.RecordTypeId = cpqQuoteRecordTypeId_Submitted;
        newquote.ApprovalStatus__c = 'Pending';
        insert newQuote;

		SBQQ__Quote__c oldQuote = newQuote.clone();
		insert oldQuote;

		Map<Id, SBQQ__Quote__c> oldQuoteMap = new Map<Id, SBQQ__Quote__c>();
        oldQuoteMap.put(newQuote.Id, oldQuote);
        
        OSCPQ_QuoteTriggerHandler handler = new OSCPQ_QuoteTriggerHandler('Default');
        handler.settings.Quoting_Automate_Quote_Steps__c = true;
        handler.settings.TwinMapping_MapFromContractToQuote__c = false;
        
        
        
            
        Test.startTest();
        newQuote.ApprovalStatus__c = 'Recalled';
        List<SBQQ__Quote__c> newQuoteList = new List<SBQQ__Quote__c>{newQuote};
        handler.onBeforeUpdate(newQuoteList, oldQuoteMap);
        Test.stopTest();
        
        system.assert(newQuoteList[0].RecordTypeId == cpqQuoteRecordTypeId_Draft);
    }
    
    @isTest static void testSubmittedToRejectedTransition() {
    	Id cpqQuoteRecordTypeId_Draft = Schema.SObjectType.SBQQ__Quote__c.getRecordTypeInfosByDeveloperName().get('Draft').getRecordTypeId();
    	Id cpqQuoteRecordTypeId_Submitted = Schema.SObjectType.SBQQ__Quote__c.getRecordTypeInfosByDeveloperName().get('Submitted').getRecordTypeId();
    	
        Account acct = [SELECT Id, Name FROM Account LIMIT 1];
        Opportunity opp = [SELECT Id FROM Opportunity LIMIT 1];
        SBQQ__Quote__c newQuote = OSCPQ_TestFactory.createSingleQuote(acct, opp, true, false);
        newQuote.RecordTypeId = cpqQuoteRecordTypeId_Submitted;
        newquote.ApprovalStatus__c = 'Pending';
        insert newQuote;

		SBQQ__Quote__c oldQuote = newQuote.clone();
		insert oldQuote;

		Map<Id, SBQQ__Quote__c> oldQuoteMap = new Map<Id, SBQQ__Quote__c>();
        oldQuoteMap.put(newQuote.Id, oldQuote);
        
        OSCPQ_QuoteTriggerHandler handler = new OSCPQ_QuoteTriggerHandler('Default');
        handler.settings.Quoting_Automate_Quote_Steps__c = true;
        handler.settings.TwinMapping_MapFromContractToQuote__c = false;
        
        
        
            
        Test.startTest();
        newQuote.ApprovalStatus__c = 'Rejected';
        List<SBQQ__Quote__c> newQuoteList = new List<SBQQ__Quote__c>{newQuote};
        handler.onBeforeUpdate(newQuoteList, oldQuoteMap);
        Test.stopTest();
        
        system.assert(newQuoteList[0].RecordTypeId == cpqQuoteRecordTypeId_Draft);
    }
    
    @isTest static void testTwinMapRenewal() {
    	Id cpqQuoteRecordTypeId_Draft = Schema.SObjectType.SBQQ__Quote__c.getRecordTypeInfosByDeveloperName().get('Draft').getRecordTypeId();
    	
        Account acct = [SELECT Id, Name FROM Account LIMIT 1];
        Opportunity opp = [SELECT Id FROM Opportunity LIMIT 1];
        Contract cont = OSCPQ_TestFactory.createSingleContract(acct, false);
        cont.SBQQ__RenewalForecast__c = true;
        cont.SBQQ__RenewalQuoted__c = true;
        cont.SBQQ__RenewalTerm__c = 36;
        insert cont;
        
        opp.SBQQ__RenewedContract__c = cont.Id;
        update opp;
        
        SBQQ__Quote__c newQuote = OSCPQ_TestFactory.createSingleQuote(acct, opp, true, false);
        newQuote.SBQQ__RenewalTerm__c = 12;
        newQuote.RecordTypeId = cpqQuoteRecordTypeId_Draft;

        OSCPQ_QuoteTriggerHandler handler = new OSCPQ_QuoteTriggerHandler('Default');
        handler.settings.Quoting_Automate_Quote_Steps__c = false;
        handler.settings.TwinMapping_MapFromContractToQuote__c = true;
            
        Test.startTest();
        List<SBQQ__Quote__c> newQuoteList = new List<SBQQ__Quote__c>{newQuote};
        handler.onBeforeInsert(newQuoteList);
        Test.stopTest();
        
        system.assert(newQuoteList[0].SBQQ__RenewalTerm__c == 36);
    }
    
    @isTest static void testTwinMapAmendment() {
    	Id cpqQuoteRecordTypeId_Draft = Schema.SObjectType.SBQQ__Quote__c.getRecordTypeInfosByDeveloperName().get('Draft').getRecordTypeId();
    	
        Account acct = [SELECT Id, Name FROM Account LIMIT 1];
        Opportunity opp = [SELECT Id FROM Opportunity LIMIT 1];
        Contract cont = OSCPQ_TestFactory.createSingleContract(acct, false);
        cont.SBQQ__RenewalForecast__c = true;
        cont.SBQQ__RenewalQuoted__c = true;
        cont.SBQQ__RenewalTerm__c = 36;
        insert cont;
        
        opp.SBQQ__AmendedContract__c = cont.Id;
        update opp;
        
        SBQQ__Quote__c newQuote = OSCPQ_TestFactory.createSingleQuote(acct, opp, true, false);
        newQuote.SBQQ__RenewalTerm__c = 12;
        newQuote.RecordTypeId = cpqQuoteRecordTypeId_Draft;

        OSCPQ_QuoteTriggerHandler handler = new OSCPQ_QuoteTriggerHandler('Default');
        handler.settings.Quoting_Automate_Quote_Steps__c = false;
        handler.settings.TwinMapping_MapFromContractToQuote__c = true;
            
        Test.startTest();
        List<SBQQ__Quote__c> newQuoteList = new List<SBQQ__Quote__c>{newQuote};
        handler.onBeforeInsert(newQuoteList);
        Test.stopTest();
        
        system.assert(newQuoteList[0].SBQQ__RenewalTerm__c == 36);
    }
}