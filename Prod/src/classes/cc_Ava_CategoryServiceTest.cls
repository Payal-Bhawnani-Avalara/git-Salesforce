@isTest
private class cc_Ava_CategoryServiceTest {

	/*@testSetup static void createData() {
		Map<String,Object> initData = cc_ava_testUtils.initData();
	}

	@isTest static void testAvaCategoryService_getFieldsMap() {
		/*only testing one method: getFieldsMap
		we added CCCategory.Featured_Product__c and Featured_Addon__c to the CCCategory object, so make sure they are added to the map of CCCategory fields to return
		getFieldsMap expects one parameter: a Map<String,Object> that looks like this:
		{categoryIdList=(a855B0000008OhFQAU), defaultLocale=en_US, fullLocale=en_US, langLocale=en, sizing={category={sz_data=sz_m}}, version=5}
		

		//initialize input parameter
		Map<String,Object> myInputData = new Map<String,Object>();

		//get categoryid just created
		ccrz__E_ProductCategory__c myTestCategory = [select Id from ccrz__E_ProductCategory__c][0];
		Id myTestCategoryId = myTestCategory.Id;
		//turn it into a list because that's the expected value for key==categoryIdList
		List<Id> myTestCategoryIdList = new List<Id>();
		myTestCategoryIdList.add(myTestCategoryId);

		//build input parameter
		myInputData.put('categoryIdList', myTestCategoryIdList);
		myInputData.put('defaultLocale','en_US');
		myInputData.put('fullLocale','en_US');
		myInputData.put('langLocale','en');
		//setup sizing map
			Map<String,Object> mySizingMapCategory = new Map<String, Object>();
			Map<String,Object> mySizingMapCategoryDatasize = new Map<String, Object>();
			mySizingMapCategoryDatasize.put('sz_data','sz_m');
			mySizingMapCategory.put('category',mySizingMapCategoryDatasize);
		//now add sizing map to inputdata
		myInputData.put('sizing',mySizingMapCategory);
		myInputData.put('version',5);

		System.debug('what does my test input data look like? ' + myInputData);

		//instantiate the service and call the method
		cc_Ava_CategoryService myService = new cc_Ava_CategoryService();
		Map<String,Object> myFields = myService.getFieldsMap(myInputData);

		//returned objectFields should include normal SZ_M values plus two new avalara fields: FeaturedProduct__c and FeaturedAddon__c
		System.assertEquals('Id,OwnerId,Name,LongDesc__c,LongDescRT__c,Sequence__c,ShortDesc__c,ShortDescRT__c,FeaturedProduct__c,FeaturedAddon__c',myFields.get('objectFields'));

	}*/
	
}