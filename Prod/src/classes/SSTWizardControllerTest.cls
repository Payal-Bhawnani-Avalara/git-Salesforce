@isTest
public class SSTWizardControllerTest {
	private static SST_Onboarding__c sstOnb;
	
	 //Test for Save data
    static testMethod void testSSTPicklistSave() {
       Test.startTest();
	       //Create SST 
	       //developer name and schema to get piclist value 
	       sstOnb =TestUtil.createSSTOnboarding(1,false)[0];
           List<String> sstState = new List<String>();
           Schema.DescribeFieldResult fieldResultATS = SST_Onboarding__c.SST_State_Selection__c.getDescribe();
		   List<Schema.PicklistEntry> sstStateSelected = fieldResultATS.getPicklistValues();
		   for( Schema.PicklistEntry pickListVal : sstStateSelected){
			  sstState.add(pickListVal.getLabel());
		   }    
	       SSTWizardController.save(sstOnb,null);
       Test.stopTest();
       
    } 
    static testMethod void testSSTPicklistCheck() {
       Test.startTest();
	       //Create an account
	       //developer name and schema to get piclist value 
	       sstOnb =TestUtil.createSSTOnboarding(1,false)[0];
	       sstOnb.Business_Entity_Type__c = SSTWizardController.getPicklistvalues('SST_Onboarding__c','Business_Entity_Type__c',false)[0];
	       insert sstOnb;
       Test.stopTest();
       
    }
}