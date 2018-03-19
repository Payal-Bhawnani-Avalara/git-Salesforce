@isTest
public class testUpdateContactOwnerFromAccount {
    
      static testMethod void validateUpdateContactOwnerFromAccountTrg() {

        User[] JeffO = [select  Id from User where FirstName='Jeff' and LastName='Orr' order by CreatedDate desc limit 1];
        User[] Clay = [select  Id from User where FirstName='Clay'  order by CreatedDate desc limit 1];
        Id contextUserId = Userinfo.getUserId(); 
       
          Account a = new Account();
        a.Name='Test Account Owner Update';
        a.Industry = 'Automotive';
        a.Type__c='Customer';
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