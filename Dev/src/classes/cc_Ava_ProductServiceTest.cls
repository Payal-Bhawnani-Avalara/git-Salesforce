@isTest
private class cc_Ava_ProductServiceTest {
	
	/*@testSetup static void createData() {
		Map<String,Object> initData = cc_ava_testUtils.initData();
	}

	@isTest static void testAvaProductService_getFieldsMap() {
		/*we added a bunch of new fields to CCProduct, so make sure they are added to the list of CCProduct fields to return
		input parameter looks like this: 
		{baseFieldsMap={sz_l=Id,Name,OwnerId,SKU__c,AlternateName__c,Storefront__c,ProductStatus__c,ProductType__c,Sequence__c,ShortDesc__c,ShortDescRT__c,UnitOfMeasure__c,AvailabilityMessage__c,AvailabilityMessageRT__c,EndDate__c,AverageRating__c,LongDesc__c,LongDescRT__c,ParentProduct__c,Quantityperunit__c,SEODescription__c,SEOKeywords__c,SEOTitle__c,StartDate__c,SupersedeProduct__c,TaxRateId__c,Taxable__c,InventoryType__c, sz_m=Id,Name,OwnerId,SKU__c,AlternateName__c,Storefront__c,ProductStatus__c,ProductType__c,Sequence__c,ShortDesc__c,ShortDescRT__c,UnitOfMeasure__c, sz_s=Id,Name,OwnerId,SKU__c,AlternateName__c,Storefront__c, sz_xl=Id,Name,OwnerId,SKU__c,AlternateName__c,Storefront__c,ProductStatus__c,ProductType__c,Sequence__c,ShortDesc__c,ShortDescRT__c,UnitOfMeasure__c,AvailabilityMessage__c,AvailabilityMessageRT__c,EndDate__c,AverageRating__c,LongDesc__c,LongDescRT__c,ParentProduct__c,Quantityperunit__c,SEODescription__c,SEOKeywords__c,SEOTitle__c,StartDate__c,SupersedeProduct__c,TaxRateId__c,Taxable__c,InventoryType__c,RecordTypeId,Available_Subscription_Frequencies__c,CoolerpakFlag__c,DryiceFlag__c,DryiceWeight__c,Employment_Level__c,FilterData__c,GroundFlag__c,HazardousFlag__c,HazardousOutside48Flag__c,Industry__c,LeadTime__c,OvernightFlag__c,ProductId__c,ProductWeight__c,RequiredItemDialogText__c,ReviewFlag__c,ServiceFlag__c,ShipSeparately__c,ShippedIndividually__c,ShippingWeight__c,NumberOfReviews__c,TotalRating__c}, sizing={product={sz_data=sz_xl}}, version=5}
		
		//initialize input parameter
		Map<String,Object> myInputData = new Map<String,Object>();
		//get skus for products just added
		List<ccrz__E_Product__c> productsJustAdded = [select ccrz__SKU__c from ccrz__E_Product__c];
		String mySku1 = productsJustAdded[0].ccrz__SKU__c;
		String mySku2 = productsJustAdded[1].ccrz__SKU__c;
		//nothing just two tiny db inputs for this input parameter so just using mostly literal example
		String jsonInput = '{"defaultLocale":"en_US","fullLocale":"en_US","langLocale":"en","byNullsLast":false,"bySequence":false,"byAsc":false,"prodDateFilter":true,"includeBlocked":false,"storefront":"AvalaraStore","sizing":{"product":{"sz_rel":["Product_Item_I18Ns__r","FILTERED_ProductMedias","Product_Inventory_Items__r","CompositeProducts__r"],"sz_assc":false,"sz_data":"sz_m"}},"mediaFilter":["Product Search Image"],"includeSellers":true,"includePricing":true,"version":5,"productSkuList":["' + mySku1 + '","' + mySku2 + '"]}';
		myInputData = (Map<String,Object>)JSON.deserializeUntyped(jsonInput);

		ccrz.ccServiceProduct myOOTBService = new ccrz.ccServiceProduct();
		cc_Ava_ProductService myService = new cc_Ava_ProductService();

		//expect OOTB fields plus additional fields
		Map<String,Object> ootbFields = myOOTBService.getFieldsMap(myInputData);
		//String ootbFields = 'Id,OwnerId,Name,CurrencyIsoCode,RecordTypeId,ConnectionReceivedId,ConnectionSentId,ccrz__AlternateName__c,ccrz__AvailabilityMessageRT__c,ccrz__AvailabilityMessage__c,ccrz__Available_Subscription_Frequencies__c,ccrz__AverageRating__c,ccrz__CoolerpakFlag__c,ccrz__DryiceFlag__c,ccrz__DryiceWeight__c,ccrz__Employment_Level__c,ccrz__EndDate__c,ccrz__FilterData__c,ccrz__GroundFlag__c,ccrz__HazardousFlag__c,ccrz__HazardousOutside48Flag__c,ccrz__Industry__c,ccrz__InventoryType__c,ccrz__Is_Subscription_Auto_Renewal__c,ccrz__Is_Subscription_Available__c,ccrz__Is_Subscription_Only__c,ccrz__LeadTime__c,ccrz__LongDescRT__c,ccrz__LongDesc__c,ccrz__OvernightFlag__c,ccrz__ParentProduct__c,ccrz__PortalSiteURL__c,ccrz__ProductId__c,ccrz__ProductStatus__c,ccrz__ProductType__c,ccrz__ProductWeight__c,ccrz__Quantityperunit__c,ccrz__RequiredItemDialogText__c,ccrz__ReviewFlag__c,ccrz__SEODescription__c,ccrz__SEOKeywords__c,ccrz__SEOTitle__c,ccrz__SKU__c,ccrz__Sequence__c,ccrz__ServiceFlag__c,ccrz__ShipSeparately__c,ccrz__ShippedIndividually__c,ccrz__ShippingWeight__c,ccrz__ShortDescRT__c,ccrz__ShortDesc__c,ccrz__StartDate__c,ccrz__Storefront__c,ccrz__Subscription_Disclaimer__c,ccrz__Subscription_Duration__c,ccrz__Subscription_Frequency__c,ccrz__SupersedeProduct__c,ccrz__TaxRateId__c,ccrz__Taxable__c,ccrz__UnitOfMeasure__c,ccrz__NumberOfReviews__c,ccrz__TotalRating__c';
		String additionalFields = ',TestLongDesc__c,PDP_Image_Width__c,Product_Features__c,Product_Name_After_Icon__c, Tagline__c,Number_of_Transactions__c,Connector_Id__c';
		String expectedFields = (String)ootbFields.get('objectFields') + additionalFields;

		System.debug('expectedFields: ' + expectedFields);

		Map<String,Object> actualFields = myService.getFieldsMap(myInputData);

		System.debug('actualFields: ' + actualFields);
		System.debug('get actualfields objectfields: ' + actualFields.get('objectFields'));



		//String expectedFields = (String)ootbFields.get('objectFields');

		System.assertEquals(expectedFields, actualFields.get('objectFields'));

	}
	
	@isTest static void testAvaProductService_getSubQueryMap() {
		// Implement test code
	}*/
	
}