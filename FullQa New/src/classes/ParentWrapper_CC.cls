public class ParentWrapper_CC {
   @AuraEnabled
    public static list<Case> getCases(String caseId){
        System.debug('caseId>>'+caseId);
        Case CaseAccountId = [Select AccountID from Case where id = :caseId];
        System.debug('accountid>>'+CaseAccountId.AccountID);
        Id implemetationCaseRecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Implementation').getRecordTypeId();
        List<Case> implementationCase = [Select id,CaseNumber,ownerid,subject,status,accountid from Case where accountid=: CaseAccountId.AccountID and recordtypeid =:implemetationCaseRecordTypeId AND isClosed=false];
        System.debug('implementationCase>>>'+implementationCase);
        return implementationCase;
    } 
}