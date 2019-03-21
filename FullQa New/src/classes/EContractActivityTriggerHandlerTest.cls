@isTest
private class EContractActivityTriggerHandlerTest {
     
    static testMethod void insertDetail() {
     Test.startTest();
      //Create an account
	  Id emeaAccountTypeId=[Select Id from RecordType where DeveloperName='EMEA_Account' limit 1].Id;
      Account a =TestUtil.createAccount(emeaAccountTypeId,1,true)[0];
      //create a contact 
      Contact c =TestUtil.createContact(a.Id,5,false)[0];
      c.MailingStreet = '123';
      c.MailingCity='Seattle'; 
      c.MailingState='WA';
      c.MailingPostalCode='98000'; 
      c.MailingCountry='USA';
      insert c;
      //create Opportunity
      Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
      Opportunity o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,true)[0];
      //create pros quote
      CameleonCPQ__Quote__c cpq = TestUtil.createProsQuote(a.id,o.id,c.id,1,false)[0];
      cpq.BillToContact__c=c.id;
      cpq.ShipToContact__c=c.id;  
      insert cpq;
      //Create Contract
      Sertifi2_0__TestContract__c eCon =  TestUtil.createSertifiTestContract(cpq.id,1,true)[0];
      //create Contract ACtivity
      Sertifi2_0__EContractActivity__c eConAc = TestUtil.createSertifiTestContractActivity(eCon.id,1,false)[0];
      eConAc.Sertifi2_0__Details__c='Dan,  I am refreshing the original proposal (no changes in dollars or line items) but did need to update the expiration date to midnight on July 30th, 2018 and to move into your name.  This agreement will be ready to execute once we have our meeting on July 24th with your IT colleague.  Great speaking with you and looking forward to our conversation later this month.  Thank you,  Brian S. McNeely Dan,  I am refreshing the original proposal (no changes in dollars or line items) but did need to update the expiration date to midnight on July 30th, 2018 and to move into your name.  This agreement will be ready to execute once we have our meeting on July 24th with your IT colleague.  Great speaking with you and looking forward to our conversation later this month.  Thank you,  Brian S. McNeely Dan,  I am refreshing the original proposal (no changes in dollars or line items) but did need to update the expiration date to midnight on July 30th, 2018 and to move into your name.  This agreement will be ready to execute once we have our meeting on July 24th with your IT colleague.  Great speaking with you and looking forward to our conversation later this month.  Thank you,  Brian S. McNeely Dan,  I am refreshing the original proposal (no changes in dollars or line items) but did need to update the expiration date to midnight on July 30th, 2018 and to move into your name.  This agreement will be ready to execute once we have our meeting on July 24th with your IT colleague.  Great speaking with you and looking forward to our conversation later this month.  Thank you,  Brian S. McNeely ';
      Database.DMLOptions dmo = new Database.DMLOptions();
      dmo.allowFieldTruncation = true;
      Database.insert(eConAc, dmo);
      //insert eConAc;
     // eConAc.Sertifi2_0__Details__c='Dan,  I am refreshing the original proposal (no changes in dollars or line items) but did need to update the expiration date to midnight on July 30th, 2018 and to move into your name.  This agreement will be ready to execute once we have our meeting on July 24th with your IT colleague.  Great speaking with you and looking forward to our conversation later this month.  Thank you,  Brian S. McNeely Dan,  I am refreshing the original proposal (no changes in dollars or line items) but did need to update the expiration date to midnight on July 30th, 2018 and to move into your name.  This agreement will be ready to execute once we have our meeting on July 24th with your IT colleague.  Great speaking with you and looking forward to our conversation later this month.  Thank you,  Brian S. McNeely Dan,  I am refreshing the original proposal (no changes in dollars or line items) but did need to update the expiration date to midnight on July 30th, 2018 and to move into your name.  This agreement will be ready to execute once we have our meeting on July 24th with your IT colleague.  Great speaking with you and looking forward to our conversation later this month.  Thank you,  Brian S. McNeely Dan,  I am refreshing the original proposal (no changes in dollars or line items) but did need to update the expiration date to midnight on July 30th, 2018 and to move into your name.  This agreement will be ready to execute once we have our meeting on July 24th with your IT colleague.  Great speaking with you and looking forward to our conversation later this month.  Thank you,  Brian S. McNeely ';
      //update eConAc;
      Sertifi2_0__EContractActivity__c ecAccTest = [Select id,Details_Backup__c,Sertifi2_0__Details__c from Sertifi2_0__EContractActivity__c where id =: eConAc.id];
      system.assertEquals(ecAccTest.Details_Backup__c,ecAccTest.Sertifi2_0__Details__c);
      system.assertEquals( ecAccTest.Sertifi2_0__Details__c.length(),255);
     Test.stopTest();
    }
     static testMethod void updateDetail() {
     Test.startTest();
      //Create an account
	  Id emeaAccountTypeId=[Select Id from RecordType where DeveloperName='EMEA_Account' limit 1].Id;
      Account a =TestUtil.createAccount(emeaAccountTypeId,1,true)[0];
      //create a contact 
      Contact c =TestUtil.createContact(a.Id,5,false)[0];
      c.MailingStreet = '123';
      c.MailingCity='Seattle'; 
      c.MailingState='WA';
      c.MailingPostalCode='98000'; 
      c.MailingCountry='USA';
      insert c;
      //create Opportunity
      Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
      Opportunity o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,true)[0];
      //create pros quote
      CameleonCPQ__Quote__c cpq = TestUtil.createProsQuote(a.id,o.id,c.id,1,false)[0];
      cpq.BillToContact__c=c.id;
      cpq.ShipToContact__c=c.id;  
      insert cpq;
      //create Contract
      Sertifi2_0__TestContract__c eCon =  TestUtil.createSertifiTestContract(cpq.id,1,true)[0];
      Sertifi2_0__EContractActivity__c eConAc = TestUtil.createSertifiTestContractActivity(eCon.id,1,true)[0];
      eConAc.Sertifi2_0__Details__c='Dan,  I am refreshing the original proposal (no changes in dollars or line items) but did need to update the expiration date to midnight on July 30th, 2018 and to move into your name.  This agreement will be ready to execute once we have our meeting on July 24th with your IT colleague.  Great speaking with you and looking forward to our conversation later this month.  Thank you,  Brian S. McNeely Dan,  I am refreshing the original proposal (no changes in dollars or line items) but did need to update the expiration date to midnight on July 30th, 2018 and to move into your name.  This agreement will be ready to execute once we have our meeting on July 24th with your IT colleague.  Great speaking with you and looking forward to our conversation later this month.  Thank you,  Brian S. McNeely Dan,  I am refreshing the original proposal (no changes in dollars or line items) but did need to update the expiration date to midnight on July 30th, 2018 and to move into your name.  This agreement will be ready to execute once we have our meeting on July 24th with your IT colleague.  Great speaking with you and looking forward to our conversation later this month.  Thank you,  Brian S. McNeely Dan,  I am refreshing the original proposal (no changes in dollars or line items) but did need to update the expiration date to midnight on July 30th, 2018 and to move into your name.  This agreement will be ready to execute once we have our meeting on July 24th with your IT colleague.  Great speaking with you and looking forward to our conversation later this month.  Thank you,  Brian S. McNeely ';
      Database.DMLOptions dmo = new Database.DMLOptions();
      dmo.allowFieldTruncation = true;
      Database.update(eConAc, dmo);
      Sertifi2_0__EContractActivity__c ecAccTest = [Select id,Details_Backup__c,Sertifi2_0__Details__c from Sertifi2_0__EContractActivity__c where id =: eConAc.id];
      system.assertEquals(ecAccTest.Details_Backup__c,ecAccTest.Sertifi2_0__Details__c);
      system.assertEquals( ecAccTest.Sertifi2_0__Details__c.length(),255);
     Test.stopTest();
    }
}