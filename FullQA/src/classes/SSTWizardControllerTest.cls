@isTest
public class SSTWizardControllerTest {
	private static SST_Onboarding__c sstOnb;
	
	 //Test for Save data
    static testMethod void testSSTPicklistSave() {
       Test.startTest();
	       //Create SST 
	       //developer name and schema to get piclist value 
	       sstOnb =TestUtil.createSSTOnboarding(1,false)[0];
           /*List<String> sstState = new List<String>();
           Schema.DescribeFieldResult fieldResultATS = SST_Onboarding__c.SST_State_Selection__c.getDescribe();
		   List<Schema.PicklistEntry> sstStateSelected = fieldResultATS.getPicklistValues();
		   for( Schema.PicklistEntry pickListVal : sstStateSelected){
			  sstState.add(pickListVal.getLabel());
		   }  */
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
    static testMethod void testKeyPairValue() {
    
	     //Create an account
	      
        List<SSTWizardController.KeyPairValue> test= SSTWizardController.getKeyPairValue('SST_Onboarding__c','Business_Entity_Type__c',false);
    }
     static testMethod void testARCorporateAddressState() {
       Test.startTest();
	       //Create an account
	       //developer name and schema to get piclist value 
	       sstOnb =TestUtil.createSSTOnboarding(1,false)[0];
	       sstOnb.Company_Corporate_Address_State__c = 'AR';
	       SSTWizardController.save(sstOnb,null);
       Test.stopTest();
       SST_Onboarding__c sst = [Select ArkansasSSTVolunteer__c,Arkansas_NV_Reason__c from SST_Onboarding__c where id =:sstOnb.id];
       
     system.assertEquals(sst.ArkansasSSTVolunteer__c, 'False (SST Non-Volunteer)');
       system.assertEquals(sst.Arkansas_NV_Reason__c, 'Place of Business');
    }
     static testMethod void testGACorporateAddressState() {
       Test.startTest();
	       //Create an account
	       //developer name and schema to get piclist value 
	       sstOnb =TestUtil.createSSTOnboarding(1,false)[0];
	       sstOnb.Company_Corporate_Address_State__c = 'GA';
	       SSTWizardController.save(sstOnb,null);
       Test.stopTest();
       SST_Onboarding__c sst = [Select Georgia_SST_Volunteer__c,Georgia_NV_Reason__c from SST_Onboarding__c where id =:sstOnb.id];
       
     system.assertEquals(sst.Georgia_SST_Volunteer__c, 'False (SST Non-Volunteer)');
       system.assertEquals(sst.Georgia_NV_Reason__c, 'Place of Business');
    }
      static testMethod void testINCorporateAddressState() {
       Test.startTest();
	       //Create an account
	       //developer name and schema to get piclist value 
	       sstOnb =TestUtil.createSSTOnboarding(1,false)[0];
	       sstOnb.Company_Corporate_Address_State__c = 'IN';
	       SSTWizardController.save(sstOnb,null);
       Test.stopTest();
       SST_Onboarding__c sst = [Select Indiana_v__c,Indiana_nv_reason__c from SST_Onboarding__c where id =:sstOnb.id];
       
     system.assertEquals(sst.Indiana_v__c, 'False (SST Non-Volunteer)');
       system.assertEquals(sst.Indiana_nv_reason__c, 'Place of Business');
    }
    static testMethod void testIACorporateAddressState() {
       Test.startTest();
	       //Create an account
	       //developer name and schema to get piclist value 
	       sstOnb =TestUtil.createSSTOnboarding(1,false)[0];
	       sstOnb.Company_Corporate_Address_State__c = 'IA';
	       SSTWizardController.save(sstOnb,null);
       Test.stopTest();
       SST_Onboarding__c sst = [Select Iowa_v__c,Iowa_nv_reason__c from SST_Onboarding__c where id =:sstOnb.id];
       
     system.assertEquals(sst.Iowa_v__c, 'False (SST Non-Volunteer)');
       system.assertEquals(sst.Iowa_nv_reason__c, 'Place of Business');
    }
     static testMethod void testKSCorporateAddressState() {
       Test.startTest();
	       //Create an account
	       //developer name and schema to get piclist value 
	       sstOnb =TestUtil.createSSTOnboarding(1,false)[0];
	       sstOnb.Company_Corporate_Address_State__c = 'KS';
	       SSTWizardController.save(sstOnb,null);
       Test.stopTest();
       SST_Onboarding__c sst = [Select Kansas_V__c,Kansas_nv_reason__c from SST_Onboarding__c where id =:sstOnb.id];
       
       system.assertEquals(sst.Kansas_V__c, 'False (SST Non-Volunteer)');
       system.assertEquals(sst.Kansas_nv_reason__c, 'Place of Business');
    }static testMethod void testKYCorporateAddressState() {
       Test.startTest();
	       //Create an account
	       //developer name and schema to get piclist value 
	       sstOnb =TestUtil.createSSTOnboarding(1,false)[0];
	       sstOnb.Company_Corporate_Address_State__c = 'KY';
	       SSTWizardController.save(sstOnb,null);
       Test.stopTest();
       SST_Onboarding__c sst = [Select Kentucky_v__c,Kentucky_nv_reason__c from SST_Onboarding__c where id =:sstOnb.id];
       
        system.assertEquals(sst.Kentucky_v__c, 'False (SST Non-Volunteer)');
       system.assertEquals(sst.Kentucky_nv_reason__c, 'Place of Business');
    }static testMethod void testMICorporateAddressState() {
       Test.startTest();
	       //Create an account
	       //developer name and schema to get piclist value 
	       sstOnb =TestUtil.createSSTOnboarding(1,false)[0];
	       sstOnb.Company_Corporate_Address_State__c = 'MI';
	       SSTWizardController.save(sstOnb,null);
       Test.stopTest();
       SST_Onboarding__c sst = [Select Michigan_v__c,Michigan_nv_reason__c from SST_Onboarding__c where id =:sstOnb.id];
       
        system.assertEquals(sst.Michigan_v__c, 'False (SST Non-Volunteer)');
       system.assertEquals(sst.Michigan_nv_reason__c, 'Place of Business');
    }static testMethod void testMNCorporateAddressState() {
       Test.startTest();
	       //Create an account
	       //developer name and schema to get piclist value 
	       sstOnb =TestUtil.createSSTOnboarding(1,false)[0];
	       sstOnb.Company_Corporate_Address_State__c = 'MN';
	       SSTWizardController.save(sstOnb,null);
       Test.stopTest();
       SST_Onboarding__c sst = [Select Minnesota_v__c,Minnesota_nv_reason__c from SST_Onboarding__c where id =:sstOnb.id];
       
        system.assertEquals(sst.Minnesota_v__c, 'False (SST Non-Volunteer)');
       system.assertEquals(sst.Minnesota_nv_reason__c, 'Place of Business');
    }static testMethod void testNECorporateAddressState() {
       Test.startTest();
	       //Create an account
	       //developer name and schema to get piclist value 
	       sstOnb =TestUtil.createSSTOnboarding(1,false)[0];
	       sstOnb.Company_Corporate_Address_State__c = 'NE';
	       SSTWizardController.save(sstOnb,null);
       Test.stopTest();
       SST_Onboarding__c sst = [Select Nebraska_v__c,Nebraska_nv_reason__c from SST_Onboarding__c where id =:sstOnb.id];
       
        system.assertEquals(sst.Nebraska_v__c, 'False (SST Non-Volunteer)');
       system.assertEquals(sst.Nebraska_nv_reason__c, 'Place of Business');
    }static testMethod void testNVCorporateAddressState() {
       Test.startTest();
	       //Create an account
	       //developer name and schema to get piclist value 
	       sstOnb =TestUtil.createSSTOnboarding(1,false)[0];
	       sstOnb.Company_Corporate_Address_State__c = 'NV';
	       SSTWizardController.save(sstOnb,null);
       Test.stopTest();
       SST_Onboarding__c sst = [Select Nevada_v__c,Nevada_nv_reason__c from SST_Onboarding__c where id =:sstOnb.id];
       
        system.assertEquals(sst.Nevada_v__c, 'False (SST Non-Volunteer)');
       system.assertEquals(sst.Nevada_nv_reason__c, 'Place of Business');
    }static testMethod void testNJCorporateAddressState() {
       Test.startTest();
	       //Create an account
	       //developer name and schema to get piclist value 
	       sstOnb =TestUtil.createSSTOnboarding(1,false)[0];
	       sstOnb.Company_Corporate_Address_State__c = 'NJ';
	       SSTWizardController.save(sstOnb,null);
       Test.stopTest();
       SST_Onboarding__c sst = [Select New_Jersey_v__c,New_Jersey_nv_reason__c from SST_Onboarding__c where id =:sstOnb.id];
       
        system.assertEquals(sst.New_Jersey_v__c, 'False (SST Non-Volunteer)');
       system.assertEquals(sst.New_Jersey_nv_reason__c, 'Place of Business');
    }static testMethod void testNCCorporateAddressState() {
       Test.startTest();
	       //Create an account
	       //developer name and schema to get piclist value 
	       sstOnb =TestUtil.createSSTOnboarding(1,false)[0];
	       sstOnb.Company_Corporate_Address_State__c = 'NC';
	       SSTWizardController.save(sstOnb,null);
       Test.stopTest();
       SST_Onboarding__c sst = [Select North_Carolina_v__c,North_Carolina_nv_reason__c from SST_Onboarding__c where id =:sstOnb.id];
       
        system.assertEquals(sst.North_Carolina_v__c, 'False (SST Non-Volunteer)');
       system.assertEquals(sst.North_Carolina_nv_reason__c, 'Place of Business');
    }static testMethod void testNDCorporateAddressState() {
       Test.startTest();
	       //Create an account
	       //developer name and schema to get piclist value 
	       sstOnb =TestUtil.createSSTOnboarding(1,false)[0];
	       sstOnb.Company_Corporate_Address_State__c = 'ND';
	       SSTWizardController.save(sstOnb,null);
       Test.stopTest();
       SST_Onboarding__c sst = [Select North_Dakota_v__c,North_Dakota_nv_reason__c from SST_Onboarding__c where id =:sstOnb.id];
       
        system.assertEquals(sst.North_Dakota_v__c, 'False (SST Non-Volunteer)');
       system.assertEquals(sst.North_Dakota_nv_reason__c, 'Place of Business');
    }static testMethod void testOHCorporateAddressState() {
       Test.startTest();
	       //Create an account
	       //developer name and schema to get piclist value 
	       sstOnb =TestUtil.createSSTOnboarding(1,false)[0];
	       sstOnb.Company_Corporate_Address_State__c = 'OH';
	       SSTWizardController.save(sstOnb,null);
       Test.stopTest();
       SST_Onboarding__c sst = [Select Ohio_v__c,Ohio_nv_reason__c from SST_Onboarding__c where id =:sstOnb.id];
       
        system.assertEquals(sst.Ohio_v__c, 'False (SST Non-Volunteer)');
       system.assertEquals(sst.Ohio_nv_reason__c, 'Place of Business');
    }
}