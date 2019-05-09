@isTest
public class QQButton_ControllerTest {
	 private static Account a;
	 private static Contact c;
     private static Opportunity o;
    
     static testMethod void testQQAddSOWItem() {
    	Test.startTest();
		  //Create an account
	       Id emeaAccountTypeId=[Select Id from RecordType where DeveloperName='EMEA_Account' limit 1].Id;
	       a =TestUtil.createAccount(emeaAccountTypeId,1,true)[0];
	       //create a contact 
	       c =TestUtil.createContact(a.Id,5,true)[0];
	       
	       //create Opportunity
	       Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
	       o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,true)[0];
	       
	       QQButton_Controller.qqAddSOWItem('o.id');
	       
	       Opportunity oppTest = [SELECT Id, QQ_Add_On_Professional_Services_LI__c FROM Opportunity WHERE Id=:o.id];
	       System.AssertEquals(oppTest.QQ_Add_On_Professional_Services_LI__c, true);
      
      Test.stopTest();
    }
     static testMethod void testQQAddSOW() {
    	Test.startTest();
		  //Create an account
	       Id emeaAccountTypeId=[Select Id from RecordType where DeveloperName='EMEA_Account' limit 1].Id;
	       a =TestUtil.createAccount(emeaAccountTypeId,1,true)[0];
	       //create a contact 
	       c =TestUtil.createContact(a.Id,5,true)[0];
	       
	       //create Opportunity
	       Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
	       o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,true)[0];
	       
	       QQButton_Controller.qqAddSOW('o.id');
	       
	       Opportunity oppTest = [SELECT Id, QQ_Add_On_Professional_Services__c FROM Opportunity WHERE Id=:o.id];
	       System.AssertEquals(oppTest.QQ_Add_On_Professional_Services__c, true);
      
      Test.stopTest();
    }
     static testMethod void testQQBCRet() {
    	Test.startTest();
		  //Create an account
	       Id emeaAccountTypeId=[Select Id from RecordType where DeveloperName='EMEA_Account' limit 1].Id;
	       a =TestUtil.createAccount(emeaAccountTypeId,1,true)[0];
	       //create a contact 
	       c =TestUtil.createContact(a.Id,5,true)[0];
	       
	       //create Opportunity
	       Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
	       o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,true)[0];
	       
	       QQButton_Controller.qqBCRet('o.id');
	       
	       Opportunity oppTest = [SELECT Id, QQ_Big_Commerce_Returns__c FROM Opportunity WHERE Id=:o.id];
	       System.AssertEquals(oppTest.QQ_Big_Commerce_Returns__c, true);
      
      Test.stopTest();
    }
     static testMethod void testQQBOConnectPromo() {
    	Test.startTest();
		  //Create an account
	       Id emeaAccountTypeId=[Select Id from RecordType where DeveloperName='EMEA_Account' limit 1].Id;
	       a =TestUtil.createAccount(emeaAccountTypeId,1,true)[0];
	       //create a contact 
	       c =TestUtil.createContact(a.Id,5,true)[0];
	       
	       //create Opportunity
	       Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
	       o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,true)[0];
	       
	       QQButton_Controller.qqQBOConnectPromo('o.id');
	       
	       Opportunity oppTest = [SELECT Id, QQ_QBO_Promo__c FROM Opportunity WHERE Id=:o.id];
	       System.AssertEquals(oppTest.QQ_QBO_Promo__c, true);
      
      Test.stopTest();
    }
     static testMethod void testQQSandboxExt() {
    	Test.startTest();
		  //Create an account
	       Id emeaAccountTypeId=[Select Id from RecordType where DeveloperName='EMEA_Account' limit 1].Id;
	       a =TestUtil.createAccount(emeaAccountTypeId,1,true)[0];
	       //create a contact 
	       c =TestUtil.createContact(a.Id,5,true)[0];
	       
	       //create Opportunity
	       Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
	       o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,true)[0];
	       
	       QQButton_Controller.qqSandboxExt('o.id');
	       
	       Opportunity oppTest = [SELECT Id, QQ_Sandbox_Extension__c FROM Opportunity WHERE Id=:o.id];
	       System.AssertEquals(oppTest.QQ_Sandbox_Extension__c, true);
      
      Test.stopTest();
    }static testMethod void testQQNFR() {
    	Test.startTest();
		  //Create an account
	       Id emeaAccountTypeId=[Select Id from RecordType where DeveloperName='EMEA_Account' limit 1].Id;
	       a =TestUtil.createAccount(emeaAccountTypeId,1,true)[0];
	       //create a contact 
	       c =TestUtil.createContact(a.Id,5,true)[0];
	       
	       //create Opportunity
	       Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
	       o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,true)[0];
	       
	       QQButton_Controller.qqNFR('o.id');
	       
	       Opportunity oppTest = [SELECT Id, QQ_NFR__c FROM Opportunity WHERE Id=:o.id];
	       System.AssertEquals(oppTest.QQ_NFR__c, true);
      
      Test.stopTest();
    }
}