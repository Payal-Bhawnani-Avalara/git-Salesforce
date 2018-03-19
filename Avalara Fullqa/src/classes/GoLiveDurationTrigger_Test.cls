//
// (c) 2017 Avalara, Inc.
//
// Apex Test Class Name: GoLiveDurationTrigger_Test
// Description: This test class validates the GoLive Duration Trigger for Data insert and Code Coverage.
//
// 10th Apr 2017 RajaSekhara Chellari - Created for code coverage.
//

@isTest
public class GoLiveDurationTrigger_Test {
    
    static testMethod void triggerTestMethOne() {
        
        /*
         Crete Account Data with limited info with covering no validtions.
         Fields Used: Name, Type__c, Industry__c
        */
        Account accRec = new Account();
        accRec.Name='Test Account';
        accRec.Industry = 'Automotive';
        accRec.Type__c='Customer';
        insert accRec;
        
        /*
         Crete GoLive_Implementation Data with limited info with covering no validtions.
         Fields Used: Name, Account__c
        */
        GoLive_Implementation__c GLImplRec = new GoLive_Implementation__c ();
        GLImplRec.name='Go Live Implementation';
        GLImplRec.account__c=accRec.id;
        insert GLImplRec;
        
        /*
         Crete GoLive_Implementation_Duration Data with limited info with covering no validtions.
         Fields used: Parent__c
        */
        GoLive_Implementation_Duration__c  GLImplDRec = new GoLive_Implementation_Duration__c();
        GLImplDRec.parent__c=GLImplRec.id;
        insert GLImplDRec;
    }
}