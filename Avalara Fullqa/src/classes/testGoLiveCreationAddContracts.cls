@isTest
public class testGoLiveCreationAddContracts {
    
    static testMethod void validateGOLiveCreationAddContractsTrigger() {

      Account a = new Account();
      a.Name='Test Account for GoLiveCreationAddContracts trigger';
      a.Industry = 'Automotive';
      a.Type__c='Customer';
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