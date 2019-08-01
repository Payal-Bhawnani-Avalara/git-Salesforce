public with sharing class CommunityController {
     @AuraEnabled
    public static List <Case> fetchCases() {
        //Qyery 10 accounts
        List<Case> caseList = [SELECT Id, OwnerId, CaseNumber, account.name,
                                    ContactId, AccountId, Subject, Status,CreatedDate from Case LIMIT 10];
        //return list of accounts
        return caseList;
    }
}