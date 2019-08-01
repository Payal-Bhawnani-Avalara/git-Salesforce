/*------------------------------------------------------------------------+
Original Shift(developer@originalshift.com)
Purpose: Tests the OSCPQ Quote Line Trigger & Handler
 
Details: - Tests a negative scenario, simple positive Amendment, and a renewal with a bundle
 
History:
Mar 20/19 - Original Shift - Initial Implementation
------------------------------------------------------------------------+*/ 
@isTest
public class OSCPQ_QuoteLineTriggerHandler_Test {

    @testSetup static void setup() {
        Product2 renewableProd = OSCPQ_TestFactory.createBasicRenewableProduct(1, true);
        Product2 renewableParent = OSCPQ_TestFactory.createBasicRenewableProduct(2, true);

        List<PricebookEntry> PBEList = OSCPQ_TestFactory.createPBEntries(new List<Product2>{renewableProd}, true);
        Account acct = OSCPQ_TestFactory.createSingleAccount(true);
        Opportunity opp = OSCPQ_TestFactory.createSingleOpp(acct, true);
        SBQQ__Quote__c quote = OSCPQ_TestFactory.createSingleQuote(acct, opp, true, true);
        SBQQ__QuoteLineGroup__c qlGroup = OSCPQ_TestFactory.createSingleQuoteLineGroup(acct, quote, true);


        SBQQ__QuoteLine__c ql1 = OSCPQ_TestFactory.createSingleQuoteLine(quote, renewableProd, false);
        ql1.SBQQ__Group__c = qlGroup.Id;
        SBQQ__QuoteLine__c ql2 = OSCPQ_TestFactory.createSingleQuoteLine(quote, renewableParent, false);
        ql2.SBQQ__Group__c = qlGroup.Id;
        insert new List<SBQQ__QuoteLine__c>{ql1, ql2};

        Contract contr = OSCPQ_TestFactory.createSingleContract(acct, false);
        contr.SBQQ__Quote__c = quote.Id;
        insert contr;

        SBQQ__Subscription__c sub = OSCPQ_TestFactory.createSingleSubscription(contr, renewableProd, false);
        sub.OSCPQ_Quote_Line_Group_Id__c = qlGroup.Id;
        sub.SBQQ__OriginalQuoteLine__c = ql1.Id;

        SBQQ__Subscription__c sub2 = OSCPQ_TestFactory.createSingleSubscription(contr, renewableParent, false);
        sub2.OSCPQ_Quote_Line_Group_Id__c = qlGroup.Id;
        sub2.SBQQ__OriginalQuoteLine__c = ql2.Id;
        insert new List<SBQQ__Subscription__c>{sub, sub2};
        
    }

    /*
     * Test that runs when settings are set to 'Never'
     */
    @isTest
    static void simpleNegativeTest() {
        OSCPQ_QuoteLineTriggerHandler handler = new OSCPQ_QuoteLineTriggerHandler('Default');
        handler.settings.TwinMapping_CloneQuoteGroups__c = 'Never';
        

        //Fetch Data from Setup
        Account acct = [SELECT Id, Name FROM Account LIMIT 1];
        SBQQ__Subscription__c sub = [SELECT Id, OSCPQ_Quote_Line_Group_Id__c FROM SBQQ__Subscription__c LIMIT 1];
        Product2 renewableProd = [SELECT Id FROM Product2 LIMIT 1];
        List<SBQQ__QuoteLineGroup__c> origQLGList = [SELECT Id FROM SBQQ__QuoteLineGroup__c];
        system.assert(origQLGList.size() == 1, 'Original Quote Line Group Does not exist');

        //Create Amendment-type opp/quote
        Opportunity amendmentOpp = OSCPQ_TestFactory.createSingleOpp(acct, true);
        SBQQ__Quote__c amendmentQuote = OSCPQ_TestFactory.createSingleQuote(acct, amendmentOpp, true, false);
        amendmentQuote.SBQQ__Type__c = 'Amendment';
        insert amendmentQuote;
        
        //Instantiate Quote Line
        SBQQ__QuoteLine__c ql = OSCPQ_TestFactory.createSingleQuoteLine(amendmentQuote, renewableProd, false);
        ql.SBQQ__UpgradedSubscription__c = sub.Id;

        Test.startTest();
        handler.onAfterInsert(new List<SBQQ__QuoteLine__c>{ql});
        Test.stopTest();

        List<SBQQ__QuoteLineGroup__c> newQLGList = [SELECT Id FROM SBQQ__QuoteLineGroup__c];
        system.assert(newQLGList.size() == origQLGList.size(), 'New QLGs were created when they should not have been');
        
    }

    /*
     * Test that runs when settings are set to 'Amendment'
     */
    @isTest
    static void simpleAmendmentTest() {
        OSCPQ_QuoteLineTriggerHandler handler = new OSCPQ_QuoteLineTriggerHandler('Default');
        handler.settings.TwinMapping_CloneQuoteGroups__c = 'On Amendment';

        //Fetch Data from Setup
        Account acct = [SELECT Id, Name FROM Account LIMIT 1];
        SBQQ__Subscription__c sub = [SELECT Id, OSCPQ_Quote_Line_Group_Id__c FROM SBQQ__Subscription__c LIMIT 1];
        
        Product2 renewableProd = [SELECT Id FROM Product2 LIMIT 1];
        List<SBQQ__QuoteLineGroup__c> origQLGList = [SELECT Id FROM SBQQ__QuoteLineGroup__c];
        system.assert(origQLGList.size() == 1, 'Original Quote Line Group Does not exist');

        //Create Amendment-type opp/quote
        Opportunity amendmentOpp = OSCPQ_TestFactory.createSingleOpp(acct, true);
        SBQQ__Quote__c amendmentQuote = OSCPQ_TestFactory.createSingleQuote(acct, amendmentOpp, true, false);
        amendmentQuote.SBQQ__Type__c = 'Quote';
        insert amendmentQuote;
        
        //Instantiate Quote Line
        SBQQ__QuoteLine__c ql = OSCPQ_TestFactory.createSingleQuoteLine(amendmentQuote, renewableProd, false);
        ql.SBQQ__UpgradedSubscription__c = sub.Id;
        
        insert ql; //Insert first with a non-amendment/quote version
        ql = [SELECT Id, SBQQ__UpgradedSubscription__c, OSCPQ_Original_Quote_Line_Group_Id__c, SBQQ__Quote__c, SBQQ__Product__c, SBQQ__Group__c, SBQQ__RequiredBy__c FROM SBQQ__QuoteLine__c WHERE Id = :ql.Id];
        amendmentQuote.SBQQ__Type__c = 'Amendment';
        update amendmentQuote;

        Test.startTest();
        handler.onAfterInsert(new List<SBQQ__QuoteLine__c>{ql});
        Test.stopTest();

        List<SBQQ__QuoteLineGroup__c> newQLGList = [SELECT Id FROM SBQQ__QuoteLineGroup__c];
        system.assert(newQLGList.size() > origQLGList.size(), 'No new QLGs were created when they should have been');
        
    }

    /*
     * Test that runs when settings are set to 'Renewal' and we have several options and a product hierarchy
     */
    @isTest
    static void simpleRenewalHierarchyTest() {
        OSCPQ_QuoteLineTriggerHandler handler = new OSCPQ_QuoteLineTriggerHandler('Default');
        handler.settings.TwinMapping_CloneQuoteGroups__c = 'On Renewal';

        //Fetch Data from Setup
        Account acct = [SELECT Id, Name FROM Account LIMIT 1];
        Contract contr = [SELECT Id FROM Contract LIMIT 1];
        List<SBQQ__Subscription__c> subList = [SELECT Id, OSCPQ_Quote_Line_Group_Id__c, SBQQ__ProductName__c FROM SBQQ__Subscription__c];
        
        Product2 childProd = [SELECT Id FROM Product2 WHERE Name = 'Simple Renewable Product 1'];
        Product2 parentProd = [SELECT Id FROM Product2 WHERE Name = 'Simple Renewable Product 2'];

        List<SBQQ__QuoteLineGroup__c> origQLGList = [SELECT Id FROM SBQQ__QuoteLineGroup__c];
        system.assert(origQLGList.size() == 1, 'Original Quote Line Group Does not exist');

        //Create Amendment-type opp/quote
        Opportunity amendmentOpp = OSCPQ_TestFactory.createSingleOpp(acct, true);
        SBQQ__Quote__c amendmentQuote = OSCPQ_TestFactory.createSingleQuote(acct, amendmentOpp, true, false);
        amendmentQuote.SBQQ__Type__c = 'Quote';
        insert amendmentQuote;
        
        //Instantiate Quote Line
        SBQQ__QuoteLine__c childQL = OSCPQ_TestFactory.createSingleQuoteLine(amendmentQuote, childProd, false);
        SBQQ__QuoteLine__c parentQL = OSCPQ_TestFactory.createSingleQuoteLine(amendmentQuote, parentProd, false);
        for(SBQQ__Subscription__c sub : subList) {
            if(sub.SBQQ__ProductName__c == 'Simple Renewable Product 1') {
                childQL.SBQQ__UpgradedSubscription__c = sub.Id;
            }
            else {
                parentQL.SBQQ__UpgradedSubscription__c = sub.Id;
            }
        }

        parentQL.SBQQ__Number__c = 1;
        insert parentQL; //Insert first with a non-amendment/quote version
        childQL.SBQQ__Number__c = 2;
        childQL.SBQQ__RequiredBy__c = parentQL.Id;
        insert childQL;
        List<SBQQ__QuoteLine__c> qlList = new List<SBQQ__QuoteLine__c>{parentQL, childQL};

        amendmentQuote.SBQQ__Type__c = 'Renewal';
        update amendmentQuote;
 
        qlList = [SELECT Id, SBQQ__Quote__r.SBQQ__Type__c, SBQQ__UpgradedSubscription__c, OSCPQ_Original_Quote_Line_Group_Id__c, SBQQ__Quote__c, SBQQ__Product__c, SBQQ__Group__c, SBQQ__RequiredBy__c FROM SBQQ__QuoteLine__c WHERE Id IN :qlList];

        Test.startTest();
        handler.onAfterInsert(qlList);
        Test.stopTest();

        List<SBQQ__QuoteLineGroup__c> newQLGList = [SELECT Id FROM SBQQ__QuoteLineGroup__c];
        system.assert(newQLGList.size() > origQLGList.size(), 'No new QLGs were created when they should have been');
        
    }
}