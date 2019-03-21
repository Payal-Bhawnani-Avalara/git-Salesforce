@isTest(SeeAllData=true)
public class TEST_RHXQ {
    
    static testMethod void zqu_Quote() {
        
        List<sObject> sourceList = [SELECT Id
FROM zqu__Quote__c
                                LIMIT 1];

        if(sourceList.size() == 0) {
            sourceList.add(
                    new zqu__Quote__c()
                );
        }
    Database.upsert(sourceList);        
    }

}