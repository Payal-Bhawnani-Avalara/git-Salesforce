@isTest
public class testGoLiveCreationAddContracts {
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
    static testMethod void validateGOLiveCreationAddContractsTrigger() {

      Account a = new Account();
      a.Name='Test Account for GoLiveCreationAddContracts trigger';
      a.Industry = 'Automotive';
      //a.Type__c='Customer';
      insert a;
        
      Contact contact1 = new Contact();
      contact1.FirstName = 'First';
      contact1.LastName = 'Last';
      contact1.AccountId = a.Id;
      insert contact1; 
        
        
      Asset asst = new Asset();
      asst.Name = 'Test';
      asst.AccountId = a.Id;
      insert asst;
       
      System.Debug('AssetId:');
      System.Debug(asst.Id);
       
      Contract prodCon = new Contract();
      prodCon.AccountId=a.Id;
      prodCon.ProductId__c = 'P12345';
      insert prodCon;
        
      Contract devCon = new Contract();
      devCon.AccountId = a.Id;
      devCon.ProductId__c = 'D12345';
      insert devCon;
        
      GoLive__C golive = new GoLive__C();
      golive.RecordTypeId = [select Id, name from RecordType where name='AvaTax GoLive' and SObjectType='GoLive__c' limit 1].Id;
      golive.Asset__c = asst.Id;
      golive.Related_to_Account__c = a.id;
       
      golive.Ava_GoLive_Coordinator__c = [select Id from User limit 1].Id;
      golive.Ava_Original_Sales_Rep__c = [select Id from User limit 1].Id;
      insert golive;
      
      GoLive__c testGoLive = [select Id, Link_to_Production_Account__c, Link_to_Dev_Contract__c from GoLive__c where Id= :golive.Id];
    
      System.assert(testGoLive.Link_to_Production_Account__c == prodCon.Id);
      System.assert(testGoLive.Link_to_Dev_Contract__c == devCon.Id);
        
    }
    
}