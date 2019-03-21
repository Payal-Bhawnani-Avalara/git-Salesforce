@isTest
public class testUpdateContactOwnerFromAccount {
    @testSetup static void setup() {
       //Setup custom setting
       List<CC_AVA_KeyPairValue__c> listCC_AVA_KeyPairValue=new List<CC_AVA_KeyPairValue__c>(); 
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_URL_Sandbox',Value__c='http://api.salesforce.com/'));
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_APIKEY_Sandbox',Value__c='123456'));
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_URL_Production',Value__c='http://api.salesforce.com/'));
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_APIKEY_Production',Value__c='123456'));
       insert listCC_AVA_KeyPairValue;
       //Setup custom setting
       List<KeyPairValue__c> listKeyPairValue=new List<KeyPairValue__c>(); 
       listKeyPairValue.add(new KeyPairValue__c(Name='Boomi_API_URL_Sandbox',Values__c='http://api.salesforce.com/'));
       listKeyPairValue.add(new KeyPairValue__c(Name='Boomi_API_Key',Values__c='123456'));
       listKeyPairValue.add(new KeyPairValue__c(Name='Boomi_API_URL_Production',Values__c='http://api.salesforce.com/'));
       listKeyPairValue.add(new KeyPairValue__c(Name='ZTBuyAPICaseSafeID',Values__c='00533000003RbvNAAS'));
       listKeyPairValue.add(new KeyPairValue__c(Name='EloquaAvalaraCaseSafeID',Values__c='00540000000yXrwAAE'));
       listKeyPairValue.add(new KeyPairValue__c(Name='LeadResponseVelocityOwnerChange',Values__c='00533000003hat0AAA,00540000001eFBmAAM,00540000002fhW6AAI'));
       listKeyPairValue.add(new KeyPairValue__c(Name='EContractActivityTriggerHandler',Values__c='False'));
       listKeyPairValue.add(new KeyPairValue__c(Name='LogOpportunityProductHistory',Values__c='TRUE'));
       listKeyPairValue.add(new KeyPairValue__c(Name='NonConnectorFees',Values__c='a0n3300000FTiWlAAL'));
       listKeyPairValue.add(new KeyPairValue__c(Name='OpportunitySubType',Values__c='AvaTax@@BizDev@@SOHO'));
       insert listKeyPairValue;
     }
      static testMethod void validateUpdateContactOwnerFromAccountTrg() {

        User[] JeffO = [select  Id from User where FirstName='Jeff' and LastName='Orr' order by CreatedDate desc limit 1];
        User[] Clay = [select  Id from User where FirstName='Clay'  order by CreatedDate desc limit 1];
        Id contextUserId = Userinfo.getUserId(); 
       
          Account a = new Account();
        a.Name='Test Account Owner Update';
        a.Industry = 'Automotive';
        //a.Type__c='Customer';
        a.OwnerId = contextUserId;
        //a.Owner = JeffO[0];
        insert a;
        
        Contact contact1 = new Contact();
        contact1.FirstName = 'FirstOwnerTest';
        contact1.LastName = 'Last';
        contact1.AccountId = a.Id;
        contact1.OwnerId = contextUserId;
        insert contact1;
      
       System.assert(a.OwnerId ==contextUserId,'Initital Owner Set to ContextUserId');
       
       contact TestContact =  [select Id, Name, OwnerId from Contact where FirstName = 'FirstOwnerTest' order by CreatedDate desc LIMIT 1];
       System.assert(TestContact.OwnerId == contextUserId,'Account Owner initially Context User');

       account TestAccount = [select Id, Name, OwnerId from Account where Name = 'Test Account Owner Update' order by CreatedDate desc LIMIT 1];          
       TestAccount.OwnerId = Clay[0].Id;
       update TestAccount;

      }
}