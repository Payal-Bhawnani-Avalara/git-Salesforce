public with sharing class CommunityController {
     @AuraEnabled
    public static List <Case> fetchCustomerOpenCases() {
        Set<Id> accID = new Set<Id>();
        for(User comUser : [Select id,Contact_Account_ID__c from user where id =:UserInfo.getUserID() AND  Contact_Account_ID__c != null ]){
               accID.add(comUser.Contact_Account_ID__c);        
        }
        List<Case> caseList =  [SELECT Id, OwnerId, CaseNumber, account.name,
                                    ContactId, AccountId, Subject, Status,CreatedDate from Case WHERE AccountId In :accID AND IsClosed= false];
        //return list of accounts
        return caseList;
    }
    @AuraEnabled
    public static List <Case> fetchPartnerOpenCases() {
        Set<Id> accID = new Set<Id>();
        for(User comUser : [Select id,Contact_Account_ID__c from user where id =:UserInfo.getUserID() AND  Contact_Account_ID__c != null ]){
               accID.add(comUser.Contact_Account_ID__c);        
        }
        List<Case> caseList =  [SELECT Id, OwnerId, CaseNumber, account.name,
                                    ContactId, AccountId, Subject,account.Affiliation__c, Status,CreatedDate from Case WHERE Account.Affiliation__c In :accID AND IsClosed= false];
        //return list of accounts
        return caseList;
    }
      @AuraEnabled
    public static List <Case> fetchPartnerClosedCases() {
        Set<Id> accID = new Set<Id>();
        for(User comUser : [Select id,Contact_Account_ID__c from user where id =:UserInfo.getUserID() AND  Contact_Account_ID__c != null ]){
               accID.add(comUser.Contact_Account_ID__c);        
        }
        List<Case> caseList =  [SELECT Id, OwnerId, CaseNumber, account.name,
                                    ContactId, AccountId, Subject,account.Affiliation__c, Status,CreatedDate from Case WHERE Account.Affiliation__c In :accID AND IsClosed= true AND CreatedDate = THIS_YEAR ];
        //return list of accounts
        return caseList;
    }
      @AuraEnabled
    public static List <Case> fetchCustomerClosedCases() {
        Set<Id> accID = new Set<Id>();
        for(User comUser : [Select id,Contact_Account_ID__c from user where id =:UserInfo.getUserID() AND  Contact_Account_ID__c != null ]){
               accID.add(comUser.Contact_Account_ID__c);        
        }
        List<Case> caseList =  [SELECT Id, OwnerId, CaseNumber, account.name,
                                    ContactId, AccountId, Subject, Status,CreatedDate from Case WHERE AccountId In :accID AND IsClosed= true AND CreatedDate = THIS_YEAR];
        //return list of accounts
        return caseList;
    }
}