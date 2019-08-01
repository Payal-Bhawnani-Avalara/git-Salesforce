/*------------------------------------------------------------------------+
Original Shift(developer@originalshift.com)
Purpose: Test the Opportunity Trigger and its handler
 
History:
Feb 12/19 - Original Shift - Initial Implementation
------------------------------------------------------------------------+*/ 
@isTest
public class OSCPQ_OpportunityTriggerHandler_Test {
    @testSetup static void setup() {
        Account acct = OSCPQ_TestFactory.createSingleAccount(true);
        Opportunity opp = OSCPQ_TestFactory.createSingleOpp(acct, true);
        SBQQ__Quote__c quote = OSCPQ_TestFactory.createSingleQuote(acct, opp, true, false);
        quote.SBQQ__OrderGroupID__c = 'test123'; //This field exists on both Opp and Quote;
		insert quote;
    }
    
    @isTest static void simpleClosedWonHandlerTest() {
        OSCPQ_OpportunityTriggerHandler handler = new OSCPQ_OpportunityTriggerHandler('Default');
        
        
        Opportunity opp = [Select Id, SBQQ__OrderGroupID__c, SBQQ__PrimaryQuote__c, StageName FROM Opportunity LIMIT 1];
        Opportunity oldOpp = opp.clone();
        oldOpp.CloseDate = Date.today();
        oldOpp.Name = 'old opp';
        insert oldOpp;
        Map<Id, Opportunity> oldOppMap = new Map<Id, Opportunity>();
        oldOppMap.put(opp.Id, oldOpp);
        
        Test.startTest();
        handler.settings.TwinMapping_PrimaryQuoteToOpp__c = 'ON_CLOSED_WON';
        opp.StageName = 'Closed Won';
        opp.SBQQ__OrderGroupID__c = ''; //reset this field
		List<Opportunity> newOppList = new List<Opportunity>{opp};
            
        handler.onBeforeUpdate(newOppList, oldOppMap);
        Test.stopTest();
        
        //opp = [Select Id, SBQQ__OrderGroupID__c FROM Opportunity LIMIT 1];
        system.assert(opp.SBQQ__OrderGroupID__c == 'test123');
    }
    
    @isTest static void testTrigger() {
        Opportunity opp = [Select Id, SBQQ__OrderGroupID__c, SBQQ__PrimaryQuote__c, StageName FROM Opportunity LIMIT 1];
        
        Test.startTest();
        opp.StageName = 'Closed Won';
        opp.SBQQ__OrderGroupID__c = ''; //reset this field
        update opp;
        Test.stopTest();
        
        opp = [Select Id, SBQQ__OrderGroupID__c FROM Opportunity LIMIT 1];
    }
}