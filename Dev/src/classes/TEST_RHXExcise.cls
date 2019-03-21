@isTest(SeeAllData=true)
public class TEST_RHXExcise {
    
    static testMethod void Excise_Division_Product_c() {
        
        List<sObject> sourceList = [SELECT Id
FROM Excise_Division_Product__c
                                LIMIT 1];

        if(sourceList.size() == 0) {
            sourceList.add(
                    new Excise_Division_Product__c()
                );
        }
    Database.upsert(sourceList);        
    }

}