@isTest(SeeAllData=true)
public class TEST_RHXASS{
    
    static testMethod void AssetCreation() {
        
        List<sObject> sourceList = [SELECT Id
FROM Asset
                                LIMIT 1];

        if(sourceList.size() == 0) {
            sourceList.add(
                    new Asset()
                );
        }
    Database.upsert(sourceList);        
    }

}