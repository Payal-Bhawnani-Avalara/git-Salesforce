@isTest(SeeAllData=true)
public class TEST_RHXSubItem {
    
    static testMethod void ZuoraSubscriptionc2() {
        
        List<sObject> sourceList = [SELECT Id
FROM Zuora__SubscriptionProductCharge__c
                                LIMIT 1];

        if(sourceList.size() == 0) {
            sourceList.add(
                    new Zuora__SubscriptionProductCharge__c()
                );
        }
    Database.upsert(sourceList);        
    }

}