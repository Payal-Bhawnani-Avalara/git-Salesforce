@isTest(SeeAllData=true)
public class TEST_RHXSub {
    
    static testMethod void ZuoraSubscriptionc() {
        
        List<sObject> sourceList = [SELECT Id
FROM Zuora__Subscription__c
                                LIMIT 1];

        if(sourceList.size() == 0) {
            sourceList.add(
                    new Zuora__Subscription__c()
                );
        }
    Database.upsert(sourceList);        
    }

}