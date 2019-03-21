public class CMTD_ParentWrapper {
   @AuraEnabled
    public static String getAccountId(String caseId){
        String result='';
        System.debug('caseId>>'+caseId);
        Case c = [Select AccountID from Case where id = :caseId];
        if(c.accountID !=null){
            result = c.AccountID;
        }
        return result;
    } 
}