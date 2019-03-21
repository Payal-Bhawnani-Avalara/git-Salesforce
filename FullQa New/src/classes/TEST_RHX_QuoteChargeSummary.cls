@isTest(SeeAllData=true)
public class TEST_RHX_QuoteChargeSummary{
    
    static testMethod void zqu_QuoteChargeSummary() {
        
        List<sObject> sourceList = [SELECT Id
FROM zqu__QuoteChargeSummary__c WHERE Quote__c != '' AND Quote__r.O_P_Status__c = 'New' ORDER BY CreatedDate Desc
                                LIMIT 1];

        if(sourceList.size() == 0) {
            sourceList.add(
                    new zqu__QuoteChargeSummary__c()
                );
        }
    Database.upsert(sourceList);        
    }

}