@isTest
public class SSTWizardControllerTest {
	private static SST_Onboarding__c sstOnb;
	
	 //Test for Account Client Type
    static testMethod void testSSTPicklistCheck() {
       Test.startTest();
	       //Create SST 
	       //developer name and schema to get piclist value 
	       sstOnb =TestUtil.createSSTOnboarding(1,false)[0];
	       //List<String> stateSelection= SSTWizardController.getPicklistKeyPairValue(SST_State_Selection__c);
	       //SSTWizardController.save(sstOnb,stateSelection );
       Test.stopTest();
       
    } 
}