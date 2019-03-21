@isTest(SeeAllData=true)
public class RHX_TEST_NPX_Survey_Records {
	static testMethod void RHX_Testmethod() {
        List<sObject> sourceList = [SELECT Id 
			FROM NPX_Survey_Records__c LIMIT 1];
        if(sourceList.size() == 0) {
            sourceList.add(
                    new NPX_Survey_Records__c()
            );
        }
    	rh2.ParentUtil.UpsertRollupTestRecords( sourceList );
    }
}