public with sharing class CommunityController {
     @AuraEnabled
    public static List <Case> fetchCustomerCases() {
        Set<Id> accID = new Set<Id>();
        for(User comUser : [Select id,Contact_Account_ID__c from user where id =:UserInfo.getUserID()]){
               accID.add(comUser.Contact_Account_ID__c);        
        }
        List<Case> caseList =  [SELECT Id, OwnerId, CaseNumber, account.name,
                                    ContactId, AccountId, Subject, Status,CreatedDate from Case WHERE AccountId In :accID];
        //return list of accounts
        return caseList;
    }
    @AuraEnabled
    public static List <Case> fetchPartnerCases() {
        Set<Id> accID = new Set<Id>();
        for(User comUser : [Select id,Contact_Account_ID__c from user where id =:UserInfo.getUserID()]){
               accID.add(comUser.Contact_Account_ID__c);        
        }
        List<Case> caseList =  [SELECT Id, OwnerId, CaseNumber, account.name,
                                    ContactId, AccountId, Subject,account.Affiliation__c, Status,CreatedDate from Case WHERE Account.Affiliation__c In :accID];
        //return list of accounts
        return caseList;
    }
    
}