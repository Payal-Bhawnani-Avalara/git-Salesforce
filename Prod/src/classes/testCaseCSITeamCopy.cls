@isTest
public class testCaseCSITeamCopy {
    
   /* static testMethod void validateCaseCSITeamCopyTrg() {

        Account a = new Account();
        a.Name='Test Account';
        a.Industry = 'Automotive';
        a.Type__c='Customer';
        insert a;
        
        Contact contact1 = new Contact();
        contact1.FirstName = 'First';
        contact1.LastName = 'Last';
        contact1.AccountId = a.Id;
        insert contact1; 
        
        Case testnewcase = new Case(
         Subject='CSITeamCopyTest',
         RecordTypeId=[select Id, name from RecordType where name='Support Case v1' and SObjectType='Case' limit 1].Id,
         Type='Technical Support',
         ContactId=contact1.Id,
         AccountId = a.Id,
         Product_Category__c='AvaTax Software',
         Avalara_Product__c='Dynamics AX',
         Primary_Reason__c='Documentation Request',
         Description='CSITeamCopyTest',
         OwnerId=[Select Id, name From Group where Name like'%Notices%' and Type='Queue' limit 1].Id
        );
        
              Case testnewcase2 = new Case(
         Subject='CSITeamCopyTest2',
         RecordTypeId=[select Id, name from RecordType where name='Support Case v1' and SObjectType='Case' limit 1].Id,
         Type='Technical Support',
        ContactId=contact1.Id,
         AccountId = a.Id,
         Product_Category__c='AvaTax Software',
         Avalara_Product__c='Dynamics AX',
         Primary_Reason__c='Documentation Request',
         Description='CSITeamCopyTest',
         OwnerId=[Select Id, name From Group where Name like'%Onsite%' and Type='Queue' limit 1].Id
        );
        
         Case testnewcase3 = new Case(
         Subject='CSITeamCopyTest3',
         RecordTypeId=[select Id, name from RecordType where name='Support Case v1' and SObjectType='Case' limit 1].Id,
         Type='Technical Support',
         ContactId=contact1.Id,
         AccountId = a.Id,
         Product_Category__c='AvaTax Software',
         Avalara_Product__c='Dynamics AX',
         Primary_Reason__c='Documentation Request',
         Description='CSITeamCopyTest',
         OwnerId=[Select Id, name From Group where Name like'%Customer Support%' and Type='Queue' limit 1].Id
        );
     
      Case testnewcase4 = new Case(
         Subject='CSITeamCopyTest4',
         RecordTypeId=[select Id, name from RecordType where name='Support Case v1' and SObjectType='Case' limit 1].Id,
         Type='Technical Support',
         ContactId=contact1.Id,
         AccountId = a.Id,
         Product_Category__c='AvaTax Software',
         Avalara_Product__c='Dynamics AX',
         Primary_Reason__c='Documentation Request',
         Description='CSITeamCopyTest',
         OwnerId=[Select Id, name From Group where Name like'%Shift%' and Type='Queue' limit 1].Id
        );
        
        //Case testnewcase5 = new Case(
        // Subject='CSITeamCopyTest5',
         //RecordTypeId=[select Id, name from RecordType where name='Support Case v1' and SObjectType='Case' limit 1].Id,
         //Type='Technical Support',
         //ContactId=contact1.Id,
         //AccountId = a.Id,
         //Product_Category__c='AvaTax Software',
         //Avalara_Product__c='Dynamics AX',
         //Primary_Reason__c='Documentation Request',
         //Description='CSITeamCopyTest',
         //OwnerId=[Select Id, name From Group where Name like'%SDK%' limit 1].Id
        //);
        
         Case testnewcase6 = new Case(
         Subject='CSITeamCopyTest6',
         RecordTypeId=[select Id, name from RecordType where name='Support Case v1' and SObjectType='Case' limit 1].Id,
         Type='Technical Support',
         ContactId=contact1.Id,
         AccountId = a.Id,
         Product_Category__c='AvaTax Software',
         Avalara_Product__c='Dynamics AX',
         Primary_Reason__c='Documentation Request',
         Description='CSITeamCopyTest',
         OwnerId=[Select Id, name From Group where Name like'%Compliance%' and Type='Queue' limit 1].Id
        );
        
         Case testnewcase7 = new Case(
         Subject='CSITeamCopyTest7',
         RecordTypeId=[select Id, name from RecordType where name='Support Case v1' and SObjectType='Case' limit 1].Id,
         Type='Technical Support',
         ContactId=contact1.Id,
         AccountId = a.Id,
         Product_Category__c='AvaTax Software',
         Avalara_Product__c='Dynamics AX',
         Primary_Reason__c='Documentation Request',
         Description='CSITeamCopyTest',
         OwnerId=[Select Id, name From Group where Name like'%Delete%' and Type='Queue' limit 1].Id
        );
        
         Case testnewcase8 = new Case(
         Subject='CSITeamCopyTest8',
         RecordTypeId=[select Id, name from RecordType where name='Support Case v1' and SObjectType='Case' limit 1].Id,
         Type='Technical Support',
         ContactId=contact1.Id,
         AccountId = a.Id,
         Product_Category__c='AvaTax Software',
         Avalara_Product__c='Dynamics AX',
         Primary_Reason__c='Documentation Request',
         Description='CSITeamCopyTest',
         OwnerId=[Select Id, name From Group where Name like'%Feedback%' and Type='Queue' limit 1].Id
        );
        
         Case testnewcase9 = new Case(
         Subject='CSITeamCopyTest9',
         RecordTypeId=[select Id, name from RecordType where name='Support Case v1' and SObjectType='Case' limit 1].Id,
         Type='Technical Support',
         ContactId=contact1.Id,
         AccountId = a.Id,
         Product_Category__c='AvaTax Software',
         Avalara_Product__c='Dynamics AX',
         Primary_Reason__c='Documentation Request',
         Description='CSITeamCopyTest',
         OwnerId=[Select Id, name From Group where Name like'%EFile%' and Type='Queue' limit 1].Id
        );
        
         Case testnewcase10 = new Case(
         Subject='CSITeamCopyTest10',
         RecordTypeId=[select Id, name from RecordType where name='Support Case v1' and SObjectType='Case' limit 1].Id,
         Type='Technical Support',
         ContactId=contact1.Id,
         AccountId = a.Id,
         Product_Category__c='AvaTax Software',
         Avalara_Product__c='Dynamics AX',
         Primary_Reason__c='Documentation Request',
         Description='CSITeamCopyTest',
         OwnerId=[Select Id, name From Group where Name like '%Sage%' and Type='Queue' limit 1].Id
        );
         Case testnewcase11 = new Case(
         Subject='CSITeamCopyTest11',
         RecordTypeId=[select Id, name from RecordType where name='Support Case v1' and SObjectType='Case' limit 1].Id,
         Type='Technical Support',
         ContactId=contact1.Id,
         AccountId = a.Id,
         Product_Category__c='AvaTax Software',
         Avalara_Product__c='Dynamics AX',
         Primary_Reason__c='Documentation Request',
         Description='CSITeamCopyTest',
         OwnerId=[Select Id, name From Group where Name like '%Microsoft%' and Type='Queue' limit 1].Id
        );
         Case testnewcase12 = new Case(
         Subject='CSITeamCopyTest12',
         RecordTypeId=[select Id, name from RecordType where name='Support Case v1' and SObjectType='Case' limit 1].Id,
         Type='Technical Support',
         ContactId=contact1.Id,
         AccountId = a.Id,
         Product_Category__c='AvaTax Software',
         Avalara_Product__c='Dynamics AX',
         Primary_Reason__c='Documentation Request',
         Description='CSITeamCopyTest',
         OwnerId=[Select Id, name From Group where Name like '%Recon%' and Type='Queue' limit 1].Id
        );
        
        Case testnewcase13 = new Case(
        Subject='CSITeamCopyTest13',
        RecordTypeId=[select Id, name from RecordType where name='Support Case v1' and SObjectType='Case' limit 1].Id,
        Type='Technical Support',
        ContactId=contact1.Id,
        AccountId = a.Id,
        Product_Category__c='AvaTax Software',
        Avalara_Product__c='Dynamics AX',
        Primary_Reason__c='Documentation Request',
        Description='CSITeamCopyTest',
        OwnerId=[Select Id, name From Group where Name like '%Treasury%' and Type='Queue' limit 1].Id
        );

        Case testnewcase14 = new Case(
        Subject='CSITeamCopyTest14',
        RecordTypeId=[select Id, name from RecordType where name='Support Case v1' and SObjectType='Case' limit 1].Id,
        Type='Technical Support',
        ContactId=contact1.Id,
        AccountId = a.Id,
        Product_Category__c='AvaTax Software',
        Avalara_Product__c='Dynamics AX',
        Primary_Reason__c='Documentation Request',
        Description='CSITeamCopyTest',
        OwnerId=[Select Id, name From Group where Name like '%SAS Queue%' and Type='Queue' limit 1].Id
        );


        
        insert testnewcase;
        insert testnewcase2;
        insert testnewcase3;
        insert testnewcase4;
        //insert testnewcase5;
        insert testnewcase6;
        insert testnewcase7;
        insert testnewcase8;
        insert testnewcase9;
        insert testnewcase10;
        insert testnewcase11;
        insert testnewcase12;
        insert testnewcase13;
        insert testnewcase14;
        
  
        case testcase = [select id,Subject,OwnerCSITeam__c,AccountId from case where Subject = 'CSITeamCopyTest' order by CreatedDate desc LIMIT 1];
        System.assertNotEquals(testcase, null, 'Test 0 object was null and not inserted correctly');
        System.assert(testcase.OwnerCSITeam__c == 'Compliance','Trigger fired successfully');

        case testcase2 = [select id,Subject,OwnerCSITeam__c,AccountId from case where Subject = 'CSITeamCopyTest2' order by CreatedDate desc LIMIT 1];
        System.assertNotEquals(testcase2, null, 'Test 0 object2 was null and not inserted correctly');
        System.assert(testcase2.OwnerCSITeam__c == 'Onsite','Trigger2 fired successfully');

        case testcase3 = [select id,Subject,OwnerCSITeam__c,AccountId from case where Subject = 'CSITeamCopyTest3' order by CreatedDate desc LIMIT 1];
        System.assertNotEquals(testcase3, null, 'Test 0 object3 was null and not inserted correctly');
        System.assert(testcase3.OwnerCSITeam__c == 'Customer Support','Trigger3 fired successfully');

        case testcase4 = [select id,Subject,OwnerCSITeam__c,AccountId from case where Subject = 'CSITeamCopyTest4' order by CreatedDate desc LIMIT 1];
        System.assertNotEquals(testcase4, null, 'Test 0 object was null and not inserted correctly');
        System.assert(testcase4.OwnerCSITeam__c == 'Shift Queue','Trigger fired successfully');

        //case testcase5 = [select id,Subject,OwnerCSITeam__c,AccountId from case where Subject = 'CSITeamCopyTest5' order by CreatedDate desc LIMIT 1];
        //System.assertNotEquals(testcase5, null, 'Test 0 object5 was null and not inserted correctly');
        //System.assert(testcase5.OwnerCSITeam__c == 'SDK','Trigger5 fired successfully');

        case testcase6 = [select id,Subject,OwnerCSITeam__c,AccountId from case where Subject = 'CSITeamCopyTest6' order by CreatedDate desc LIMIT 1];
        System.assertNotEquals(testcase6, null, 'Test 0 object6 was null and not inserted correctly');
        System.assert(testcase6.OwnerCSITeam__c == 'Compliance','Trigger6 fired successfully');

        case testcase7 = [select id,Subject,OwnerCSITeam__c,AccountId from case where Subject = 'CSITeamCopyTest7' order by CreatedDate desc LIMIT 1];
        System.assertNotEquals(testcase7, null, 'Test 0 object7 was null and not inserted correctly');
        System.assert(testcase7.OwnerCSITeam__c == 'Delete','Trigger7 fired successfully');

        case testcase8 = [select id,Subject,OwnerCSITeam__c,AccountId from case where Subject = 'CSITeamCopyTest8' order by CreatedDate desc LIMIT 1];
        System.assertNotEquals(testcase8, null, 'Test 0 object8 was null and not inserted correctly');
        System.assert(testcase8.OwnerCSITeam__c == 'Feedback Form','Trigger8 fired successfully');

        case testcase9 = [select id,Subject,OwnerCSITeam__c,AccountId from case where Subject = 'CSITeamCopyTest9' order by CreatedDate desc LIMIT 1];
        System.assertNotEquals(testcase9, null, 'Test 0 object9 was null and not inserted correctly');
        System.assert(testcase9.OwnerCSITeam__c == 'Compliance','Trigger9 fired successfully');

        case testcase10 = [select id,Subject,OwnerCSITeam__c,AccountId from case where Subject = 'CSITeamCopyTest10' order by CreatedDate desc LIMIT 1];
        System.assertNotEquals(testcase10, null, 'Test 0 object10 was null and not inserted correctly');
        System.assert(testcase10.OwnerCSITeam__c == 'Sage / Intuit','Trigger10 fired successfully');
        
        case testcase11 = [select id,Subject,OwnerCSITeam__c,AccountId from case where Subject = 'CSITeamCopyTest11' order by CreatedDate desc LIMIT 1];
        System.assertNotEquals(testcase11, null, 'Test 0 object11 was null and not inserted correctly');
        System.assert(testcase11.OwnerCSITeam__c == 'Microsoft / Netsuite','Trigger11 fired successfully');
        
        case testcase12 = [select id,Subject,OwnerCSITeam__c,AccountId from case where Subject = 'CSITeamCopyTest12' order by CreatedDate desc LIMIT 1];
        System.assertNotEquals(testcase12, null, 'Test 0 object12 was null and not inserted correctly');
        System.Debug('team case 12:');
        System.Debug(testcase12.OwnerCSITeam__c);
        //System.assert(testcase12.OwnerCSITeam__c == 'Compliance','Trigger12 fired successfully');
        
        case testcase13 = [select id,Subject,OwnerCSITeam__c,AccountId from case where Subject = 'CSITeamCopyTest13' order by CreatedDate desc LIMIT 1];
        System.assertNotEquals(testcase13, null, 'Test 0 object13 was null and not inserted correctly');
        System.Debug('team case 13:');
        System.Debug(testcase13.OwnerCSITeam__c);
        //System.assert(testcase13.OwnerCSITeam__c == 'Treasury Team','Trigger13 fired successfully');
 
        case testcase14 = [select id,Subject,OwnerCSITeam__c,AccountId from case where Subject = 'CSITeamCopyTest14' order by CreatedDate desc LIMIT 1];
        System.assertNotEquals(testcase14, null, 'Test 0 object14 was null and not inserted correctly');       
        //System.assert(testcase14.OwnerCSITeam__c == 'SAS Team','Trigger14 fired successfully');

   
    }
*/
    }