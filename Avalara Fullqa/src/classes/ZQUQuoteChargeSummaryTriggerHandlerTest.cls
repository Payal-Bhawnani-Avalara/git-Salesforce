@isTest
private class ZQUQuoteChargeSummaryTriggerHandlerTest {
    
    @testSetup static void setup() {
        Account acc;
        Connector__c con;
        Opportunity opp;
        zqu__Quote__c qt;
        zqu__QuoteAmendment__c qtAmndmnt;
        List<zqu__QuoteRatePlan__c> qtRtPlanList;
        zqu__QuoteCharge__c qtChrg;
        zqu__QuoteRatePlanCharge__c qtRtPlanChrg;
        zqu__QuoteChargeSummary__c qtChrgSmry;
        List<zqu__QuoteChargeSummary__c> qtChrgSmryList;
        
        //Create an Account record
        Id customerAccountTypeId = [SELECT Id FROM RecordType WHERE DeveloperName = 'EMEA_Account' LIMIT 1].Id;
        acc = TestUtil.createAccount(customerAccountTypeId, 1, true)[0];
        
        //Create a Connector record
        con = TestUtil.createConnector(acc.Id, acc.Id, 1, true)[0];
        
        //Create an Opportunity record
        Id defaultOppRecTypeId = [SELECT Id FROM RecordType WHERE DeveloperName = 'Default_OppRecType' LIMIT 1].Id;
        opp = TestUtil.createOpportunity(acc.id, defaultOppRecTypeId, 1, false)[0];
        opp.Amount = 1000;
        //opp.Type='New';
        opp.SubType__c = 'Upgrade';
        opp.Connector__c = con.Id;
        opp.BookedValue__c = 1000;
       // opp.Year_1_Booking2__c=1000;
        insert opp;
        opp.BookedValue__c = 1000;
       // opp.Year_1_Booking2__c=1000;
        update opp;        
        opp=[select id,BookedValue__c From Opportunity Where Id=:opp.Id];
        system.debug('BookedValue__c===='+opp.BookedValue__c);
        //Create Quote and Quote Charge Summary Records along with other related records
        qt = TestUtil.createQuote(opp.Id, 1, true)[0];
        qtAmndmnt = TestUtil.createQuoteAmendment(qt.Id, 1, true)[0];
        qtRtPlanList = TestUtil.createQuoteRatePlan(qt.Id, qtAmndmnt.Id, 3, true);
        qtChrg = TestUtil.createQuoteCharge(qt.Id, null, con.Id, 1, true)[0];
        qtRtPlanChrg = TestUtil.createQuoteRatePlanCharge(qtRtPlanList[0].Id, con.Id, 1, true)[0];
        qtChrgSmryList = TestUtil.createQuoteChargeSummary(qt.Id, opp.Id, qtChrg.Id, qtRtPlanList, qtRtPlanChrg.Id, 3, true);
    }
    
    @isTest static void testQuoteRollup(){
    		Test.startTest();
        List<zqu__QuoteChargeSummary__c> qcsList = new List<zqu__QuoteChargeSummary__c>();
        Decimal Sum_ExtendedActualAnnual1 = 0;
        
        qcsList = [SELECT ExtendedActualAnnual__c, Quote__r.ExtendedActualAnnual_CAM__c FROM zqu__QuoteChargeSummary__c WHERE isDeleted = false AND (CAMBookingLogic1__c = TRUE OR CAMBookingLogic2__c = TRUE OR CAMBookingLogic3__c = TRUE OR CAMBookingLogic4__c = TRUE OR CAMBookingLogic5__c = TRUE) ORDER BY Id DESC NULLS LAST];
        if (!qcsList.isEmpty()){
            for (zqu__QuoteChargeSummary__c qcs: qcsList){
                Sum_ExtendedActualAnnual1 += qcs.ExtendedActualAnnual__c;
            }
            System.assertEquals(Sum_ExtendedActualAnnual1, qcsList[0].Quote__r.ExtendedActualAnnual_CAM__c);
            delete qcsList;
            undelete qcsList;
        }
        
        Decimal Sum_ExtendedActualAnnual2 = 0;
        
        qcsList = [SELECT ExtendedActualAnnual__c, Quote__r.ExtendedActualAnnual__c FROM zqu__QuoteChargeSummary__c WHERE isDeleted = false AND ExtendedActualAnnual__c > 0 ORDER BY Id DESC NULLS LAST];
        if (!qcsList.isEmpty()){
            for (zqu__QuoteChargeSummary__c qcs: qcsList){
                Sum_ExtendedActualAnnual2 += qcs.ExtendedActualAnnual__c;
            }
            System.assertEquals(Sum_ExtendedActualAnnual2, qcsList[0].Quote__r.ExtendedActualAnnual__c);
        }
    
        String Sum_ConnectorID = '';
        
        qcsList = [SELECT ConnectorID__c, Quote__r.Quote_Primary_Connector__c FROM zqu__QuoteChargeSummary__c WHERE isDeleted = false AND (zqu__Product_Rate_Plan_Name__c LIKE '%Connector%' OR zqu__Product_Rate_Plan_Name__c LIKE '%platform%') ORDER BY zqu__TotalPrice__c DESC NULLS LAST, Connector_Name__c ASC NULLS LAST LIMIT 1];
        if (!qcsList.isEmpty()){
            System.assertEquals(qcsList[0].ConnectorID__c, qcsList[0].Quote__r.Quote_Primary_Connector__c);
        }
    
        Decimal Sum_ExtendedActual1 = 0;
        
        qcsList = [SELECT ExtendedActual__c, Quote__r.ExtendedActual_CAM__c FROM zqu__QuoteChargeSummary__c WHERE isDeleted = false AND (CAMBookingLogic1__c = TRUE OR CAMBookingLogic2__c = TRUE OR CAMBookingLogic3__c = TRUE OR CAMBookingLogic4__c = TRUE OR CAMBookingLogic5__c = TRUE) ORDER BY Id DESC NULLS LAST];
        if (!qcsList.isEmpty()){
            for (zqu__QuoteChargeSummary__c qcs: qcsList){
                Sum_ExtendedActual1 += qcs.ExtendedActual__c;
            }
            System.assertEquals(Sum_ExtendedActual1, qcsList[0].Quote__r.ExtendedActual_CAM__c);
        }
    
        Decimal Sum_ExtendedList1 = 0;
        
        qcsList = [SELECT ExtendedList__c, Quote__r.ExtendedList__c FROM zqu__QuoteChargeSummary__c WHERE isDeleted = false AND ExtendedList__c > 0 ORDER BY Id DESC NULLS LAST];
        if (!qcsList.isEmpty()){
            for (zqu__QuoteChargeSummary__c qcs: qcsList){
                Sum_ExtendedList1 += qcs.ExtendedList__c;
            }
            System.assertEquals(Sum_ExtendedList1, qcsList[0].Quote__r.ExtendedList__c);
        }
    
        Decimal Sum_ExtendedList2 = 0;
        
        qcsList = [SELECT ExtendedList__c, Quote__r.ExtendedList_CAM__c FROM zqu__QuoteChargeSummary__c WHERE isDeleted = false AND (CAMBookingLogic1__c = TRUE OR CAMBookingLogic2__c = TRUE OR CAMBookingLogic3__c = TRUE OR CAMBookingLogic4__c = TRUE OR CAMBookingLogic5__c = TRUE) ORDER BY Id DESC NULLS LAST];
        if (!qcsList.isEmpty()){
            for (zqu__QuoteChargeSummary__c qcs: qcsList){
                Sum_ExtendedList2 += qcs.ExtendedList__c;
            }
            System.assertEquals(Sum_ExtendedList2, qcsList[0].Quote__r.ExtendedList_CAM__c);
        }
    
        Decimal Sum_ExtendedActual2 = 0;
        
        qcsList = [SELECT ExtendedActual__c, Quote__r.ExtendedActual__c FROM zqu__QuoteChargeSummary__c WHERE (isDeleted = false AND Quote__r.BillingFrequency__c != 'Monthly' AND zqu__Type__c != 'Usage') OR (isDeleted = false AND Quote__r.BillingFrequency__c = 'Monthly' AND ProductName_TypeConcat__c != 'Avalara AvaTax Recurring' AND ProductName_TypeConcat__c != 'Avalara CertCapture Recurring' AND zqu__Type__c != 'Usage' AND ProductName_TypeConcat__c != 'Avalara AvaTax Global Recurring' AND ProductName_TypeConcat__c != 'Avalara Returns Recurring' AND ProductName_TypeConcat__c != 'Avalara TrustFile Recurring') OR (isDeleted = false AND Quote__r.BillingFrequency__c = 'Monthly' AND zqu__Type__c != 'Usage' AND Quote__r.FreeMonths__c = 0) ORDER BY Id DESC NULLS LAST];
        if (!qcsList.isEmpty()){
            for (zqu__QuoteChargeSummary__c qcs: qcsList){
                Sum_ExtendedActual2 += qcs.ExtendedActual__c;
            }
            System.assertEquals(Sum_ExtendedActual2, qcsList[0].Quote__r.ExtendedActual__c);
        }
    
        Decimal Sum_CorpBookedValue = 0;
        
        qcsList = [SELECT Corp_Booked_Value__c, zqu__Opportunity__r.ARR__c FROM zqu__QuoteChargeSummary__c WHERE isDeleted = false AND zqu__Type__c = 'Recurring' AND Quote_Status__c = 'Sent to Z-Billing' AND OPStatus__c = 'Complete' AND zqu__Opportunity__r.BookedValue__c > 0 AND Corp_Booked_Value__c > 0 ORDER BY Id DESC NULLS LAST];
        if (!qcsList.isEmpty()){
            for (zqu__QuoteChargeSummary__c qcs: qcsList){
                Sum_CorpBookedValue += qcs.Corp_Booked_Value__c;
            }
            System.assertEquals(Sum_CorpBookedValue, qcsList[0].zqu__Opportunity__r.ARR__c);
        }
    
        Decimal Sum_ContainsDropsZuora = 0;
        
        qcsList = [SELECT Count__c, zqu__Opportunity__r.Contains_Drops_Zuora__c FROM zqu__QuoteChargeSummary__c WHERE isDeleted = false AND Amendment_Type__c = 'RemoveProduct' ORDER BY Id DESC NULLS LAST];
        if (!qcsList.isEmpty()){
            for (zqu__QuoteChargeSummary__c qcs: qcsList){
                Sum_ContainsDropsZuora += qcs.Count__c;
            }
            System.assertEquals(Sum_ContainsDropsZuora, qcsList[0].zqu__Opportunity__r.Contains_Drops_Zuora__c);
        }
    
        String Sum_RollupOpportunityProductSummary = '';
        
        qcsList = [SELECT Rollup_Opportunity_Product_Summary__c, zqu__Opportunity__r.Product_Summary__c FROM zqu__QuoteChargeSummary__c WHERE isDeleted = false AND Amendment_Type__c = 'RemoveProduct' ORDER BY Id DESC NULLS LAST];
        if (!qcsList.isEmpty()){
            for (zqu__QuoteChargeSummary__c qcs: qcsList){
                Sum_RollupOpportunityProductSummary += ' ' + qcs.Rollup_Opportunity_Product_Summary__c;
            }
            System.assertEquals(Sum_RollupOpportunityProductSummary, qcsList[0].zqu__Opportunity__r.Product_Summary__c);
        }
        
        zqu__QuoteRatePlan__c qrp = [SELECT zqu__AmendmentType__c FROM zqu__QuoteRatePlan__c LIMIT 1][0];
        qrp.zqu__AmendmentType__c = 'RemoveProduct';
        update qrp;
        
        zqu__QuoteChargeSummary__c qcs = [SELECT zqu__Period__c, Corp_Booked_Value__c, zqu__Type__c, Quote_Status__c, Opstatus__c, zqu__Opportunity__r.BookedValue__c FROM zqu__QuoteChargeSummary__c WHERE zqu__QuoteRatePlan__c = :qrp.Id][0];
        System.assertEquals(qcs.zqu__Period__c, 'Month');
        System.assert(qcs.Corp_Booked_Value__c > 0 );
        System.assertEquals(qcs.zqu__Type__c, 'Recurring');
        System.assertEquals(qcs.Quote_Status__c, 'Sent to Z-Billing');
        System.assertEquals(qcs.Opstatus__c, 'Completed');
        System.assert(qcs.zqu__Opportunity__r.BookedValue__c > 0);
        qcs.zqu__Period__c = 'Month';
        TriggerHandler.clearBypass('ZQUQuoteChargeSummaryTriggerHandler'); 
        update qcs;
        Test.stopTest();
    }
}