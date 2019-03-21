@isTest
public class testNewTaskUpdateParentCaseLastActivity {
    /*
    static testMethod void NewTaskUpdateParentCaseLastActivityTrg() {

           Account a = new Account();
        a.Name='Test Account';
        a.Industry = 'Automotive';
        a.Type__c='Customer';
        a.Type__c='Customer';
        insert a;
        
        Contact contact1 = new Contact();
        contact1.FirstName = 'First';
        contact1.LastName = 'Last';
        contact1.AccountId = a.Id;
        insert contact1; 
        
        Case testnewcase = new Case(
         Subject='NewTaskUpdateParentCaseLastActivityTest',
         RecordTypeId=[select Id, name from RecordType where name='Support Case v1' and SObjectType='Case' limit 1].Id,
         Type='Technical Support',
         ContactId=contact1.Id,
         AccountId = a.Id,
         Product_Category__c='AvaTax Service',
         Avalara_Product__c='AvaTax Calc',
         Primary_Reason__c='Documentation Request',
         Description='CSITeamCopyTest',
         Status='New',
         Origin='Email',
         OwnerId=[Select Id, name From Group where Name like'%Notices%' limit 1].Id
        );

        insert testnewcase;
          
        case testcase = [select id,Subject,OwnerCSITeam__c,AccountId,Last_Case_Activity__c from case where Subject = 'NewTaskUpdateParentCaseLastActivityTest' order by CreatedDate desc LIMIT 1];
        System.assertNotEquals(testcase, null, 'Test 0 object was null and not inserted correctly');
        System.Assert(testcase.Last_Case_Activity__c==null,'Last_Case_Activity__c on case should be null');
        
        Task t = new Task(WhatId = testcase.Id,Subject='Test',CallType='Inbound',Status='Not Started');
        insert t;

        Case c = [select Last_Case_Activity__c from Case where Id=:testcase.Id]; 
        System.assertEquals(c.Last_Case_Activity__c,null,'Last_Case_Activity__c on case should still be null');
 
        
     
        
    }*/

    }