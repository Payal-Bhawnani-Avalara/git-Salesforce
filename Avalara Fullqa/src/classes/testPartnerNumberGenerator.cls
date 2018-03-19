@isTest
public class testPartnerNumberGenerator{
     static testMethod void GeneratePartnerNumberOnSignup(){
        
        PartnerNumberGenerator myGenerator = new PartnerNumberGenerator();
         
        Account a = new Account();
        a.Name='Test Account for GeneratePartnerNumber trigger';
        a.Industry = 'Automotive';
        a.Type__c='Customer';
        insert a;
        
        Account testAccount = [select Id, Name, PartnerNumber__c, Partner_Contract_Signed_Date__c from Account where Name='Test Account for GeneratePartnerNumber trigger' limit 1]; 
        System.assert(testAccount.Id != null,'test account not inserted');
        System.assert(testAccount.PartnerNumber__c == null,'test Account should have blank partner number');
    
        testAccount.Partner_Contract_Signed_Date__c = DATE.TODAY();
         
        update testAccount;
         
         
        Account testAfter = [select Id, Name, PartnerNumber__c, Partner_Contract_Signed_Date__c from Account where Name='Test Account for GeneratePartnerNumber trigger' limit 1]; 
        System.assert(testAfter.Id != null,'test account after update not found');
        System.assert(testAfter.PartnerNumber__c != null,'test Account should bot have blank partner number');
 
    }
    
}