@isTest
private class SurveyResponseTriggerHandlerTest {

    static testMethod void testUpdateSurveyResponse() {
        AvaConfig__c ac=new AvaConfig__c(Type__c='Survey Action Rule',Active__c=true,Value1__c='Select Id From SurveyResponse__c Where Name=\'Test Survey\' ',Value2__c='Test');
        insert ac;
        Test.startTest();
        SurveyResponse__c sr=new SurveyResponse__c(Name='Test Survey');
        insert sr;
        TriggerHandler.clearBypass('SurveyResponseTriggerHandler');
         update sr; 
        Test.stopTest();
        sr=[Select Id, Call_to_Action__c From SurveyResponse__c Where Id=:sr.Id];
        System.assertEquals('Test',sr.Call_to_Action__c);
              
    }
}