@isTest
public class cc_Ava_UnitTestHelper {
	//use this class to create test data for all tests
	
	//make dates available to the whole test class and make sure that they are before and after creationdate(=currendate)
    static Date myStartDate = Date.newInstance(Date.today().year(),01,01);
    static Date myEndDate = Date.newInstance(Date.today().year(),12,31);
    static String myStoreFrontName = 'AvalaraStore';
    static string myRootCategoryId = 'ava_products';
    static List<String> mySubscriptionIntervals = new List<String>{'Monthly','Yearly'};

	public static void createBasicDataAvalara() {

		//create storefront and other basic cloudcraze settings

		Map<String,Map<String,Object>> testData = new Map<String,Map<String,Object>>{
			ccrz.ccApiTestData.STOREFRONT_SETTINGS => new Map<String,Object>{
				myStoreFrontName => new Map<String,Object>{
					'Root_Category_Id__c' => myRootCategoryId
				}
			},
			ccrz.ccApiTestData.SERVICE_SETTINGS => new Map<String,Object>{
				myStoreFrontName => new Map<String,Object>{
					'ccServiceProduct' => 'c.cc_Ava_ProductService',
					'ccServiceCategory' => 'c.cc_Ava_CategoryService'
				}
			}
		};
		ccrz.ccApiTestData.setupData(testData);

		////create profile, user, accountgroup, useraccountgroup, contact, portaluser data

     //   Profile userProfile = ccrz.cc_imp_testUtils.getCustomerCommunityProfile();
     //   /*
    	//* Account Group
    	//*/
     //   ccrz__E_AccountGroup__c userAccountGroup = ccrz.cc_imp_testUtils.createAccountGroup('accountGroup');
     //   insert userAccountGroup;
     //   /*
    	//* Account
    	//*/
     //   Account userAccount = ccrz.cc_imp_testUtils.createAccount(userAccountGroup);
     //   insert userAccount;
     //   /*
    	//* Contact
    	//*/
     //   Contact userContact = ccrz.cc_imp_testUtils.createContact(userAccount, 'contact@email.com');
     //   insert userContact;
     //   /*
    	//* Portal User
    	//*/
     //   User portalUser = ccrz.cc_imp_testUtils.createUser(userProfile, userContact, 'username@email.com', 'contact@email.com', 'firstName', 'lastName', 'alias');
     //   insert portalUser;


     //STEP 0: CREATE TEST USER/CONTACT/ACCOUNT INFO
     	//create test account group, account, contact, profile, user (later will associate pricelists with this accountgroup)
		ccrz__E_AccountGroup__c testAccountGroup = new ccrz__E_AccountGroup__c();
		testAccountGroup.ccrz__AccountGroupID__c = '1';
		testAccountGroup.ccrz__PriceListSelectionMethod__c = 'Sequence Order';
		insert testAccountGroup;

		Account testAccount = new Account();
		testAccount.Name = 'Test Account';
		testAccount.ccrz__E_AccountGroup__c = testAccountGroup.Id;
		insert testAccount;

		Contact testContact = new Contact();
		testContact.FirstName = 'Tester';
		testContact.LastName = 'Contactman';
		testContact.AccountId = testAccount.Id;
		testContact.CurrencyIsoCode = 'USD';

		insert testContact;

		Profile testProfile = [select Id from Profile where Name = 'Avalara Customer Community User'][0];

		User testUser = new User();
		testUser.LastName = 'Contactman';
		testUser.Alias = 'testcon';
		testUser.Email = 'test@test.com';
		testUser.Username = testContact.LastName + Math.random() + System.currentTimeMillis() + '@blah.com';
		testUser.CommunityNickname = 'testcon';
		testUser.ContactId = testContact.Id;
		testUser.ProfileId = testProfile.Id;
		testUser.EmailEncodingKey = 'UTF-8';
		testUser.LanguageLocaleKey = 'en_US';
		testUser.LocaleSidKey = 'en_US';
		testUser.TimeZoneSidKey = 'America/Los_Angeles';

		insert testUser;


	//STEP 1: MODEL THE PRODUCTS	
		//initialize list of products to insert
		List<ccrz__E_Product__c> testProducts = new List<ccrz__E_Product__c>();

		//need at least one dynamic kit, one product that is a component of that dynamic kit, and one product that is not a dynamic kit and not a component of a dynamic kit

		//create dynamic kit
		ccrz__E_Product__c testDynamicKit = new ccrz__E_Product__c();
		testDynamicKit.Name = 'Test Dynamic Kit';
		testDynamicKit.ccrz__SKU__c = 'TEST0001';
		testDynamicKit.ccrz__StartDate__c = myStartDate;
		testDynamicKit.ccrz__EndDate__c = myEndDate;
		testDynamicKit.ccrz__Quantityperunit__c = 1;
		testDynamicKit.ccrz__ProductStatus__c = 'Released';
		testDynamicKit.ccrz__ProductType__c = 'Dynamic Kit';

		//create component of this dynamic kit
		ccrz__E_Product__c testComponentProduct = new ccrz__E_Product__c();
		testComponentProduct.Name = 'Test Component Product';
		testComponentProduct.ccrz__SKU__c = 'TEST0002';
		testComponentProduct.ccrz__StartDate__c = myStartDate;
		testComponentProduct.ccrz__EndDate__c = myEndDate;
		testComponentProduct.ccrz__Quantityperunit__c = 1;
		testComponentProduct.ccrz__ProductStatus__c = 'Released';
		testComponentProduct.ccrz__ProductType__c = 'Product';

		//create independent product (not component of dynamic kit)
		ccrz__E_Product__c testNormalProduct = new ccrz__E_Product__c();
		testNormalProduct.Name = 'Test Normal Product';
		testNormalProduct.ccrz__SKU__c = 'TEST003';
		testNormalProduct.ccrz__StartDate__c = myStartDate;
		testNormalProduct.ccrz__EndDate__c = myEndDate;
		testNormalProduct.ccrz__Quantityperunit__c = 1;
		testNormalProduct.ccrz__ProductStatus__c = 'Released';
		testNormalProduct.ccrz__ProductType__c = 'Product';

		testProducts.add(testDynamicKit);
		testProducts.add(testComponentProduct);
		testProducts.add(testNormalProduct);

		insert testProducts;

		//now associate the component product with the dynamic kit

		//composite product requires a related product group, so create that first
		ccrz__E_RelatedProductGroup__c testProductGroup = new ccrz__E_RelatedProductGroup__c();
		testProductGroup.Name = 'Test Group';

		insert testProductGroup;

		//now create the composite product
		ccrz__E_CompositeProduct__c testCompositeProduct = new ccrz__E_CompositeProduct__c();
		testCompositeProduct.ccrz__Component__c = testComponentProduct.Id;
		testCompositeProduct.ccrz__Composite__c = testDynamicKit.Id;
		testCompositeProduct.ccrz__ProductGroup__c = testProductGroup.Id;
		testCompositeProduct.ccrz__Sequence__c = 200;

		insert testCompositeProduct;

		//now add the composite product to a product guide
		ccrz__E_ProductGuide__c testProductGuide = new ccrz__E_ProductGuide__c();
		testProductGuide.ccrz__Product__c = testComponentProduct.Id;
		testProductGuide.ccrz__RelatedProductGroup__c = testProductGroup.Id;
		testProductGuide.ccrz__Required__c = false;
		testProductGuide.ccrz__Sequence__c = 200;

		insert testProductGuide;

		//now create a product media record for each product
		List<ccrz__E_ProductMedia__c> testProductMedias = new List<ccrz__E_ProductMedia__c>();
		for(ccrz__E_Product__c prod : testProducts) {
			ccrz__E_ProductMedia__c tempProdMed = new ccrz__E_ProductMedia__c();
			tempProdMed.ccrz__Product__c = prod.Id;
			tempProdMed.ccrz__StartDate__c = myStartDate;
			tempProdMed.ccrz__EndDate__c = myStartDate;
			tempProdMed.ccrz__MediaType__c = 'Product Search Image';
			tempProdMed.ccrz__Enabled__c = true;
			testProductMedias.add(tempProdMed);
		}

	//STEP 2: GIVE THE PRODUCTS PRICES
		//now add pricelists, suprodterms, and pricelistitems for each product
		
		//we need at least two pricelists, so that we can test the pricelist selection code in configflow controller
		List<ccrz__E_PriceList__c> testPriceLists = new List<ccrz__E_PriceList__c>();

		ccrz__E_PriceList__c testPriceList1 = new ccrz__E_PriceList__c();
		testPriceList1.Name = 'Test Price List 1';
		testPriceList1.ccrz__CurrencyISOCode__c = 'USD';
		testPriceList1.ccrz__Storefront__c = myStoreFrontName;
		testPriceList1.ccrz__StartDate__c = myStartDate;
		testPriceList1.ccrz__EndDate__c = myEndDate;
		testPriceList1.ccrz__Enabled__c = true;

		ccrz__E_PriceList__c testPriceList2 = new ccrz__E_PriceList__c();
		testPriceList2.Name = 'Test Price List 2';
		testPriceList2.ccrz__CurrencyISOCode__c = 'USD';
		testPriceList2.ccrz__Storefront__c = myStoreFrontName;
		testPriceList2.ccrz__StartDate__c = myStartDate;
		testPriceList2.ccrz__EndDate__c = myEndDate;
		testPriceList2.ccrz__Enabled__c = true;

		testPriceLists.add(testPriceList1);
		testPriceLists.add(testPriceList2);

		insert testPriceLists;

		//interlude: associate these pricelists with our testAccountGroup
		List<ccrz__E_AccountGroupPriceList__c> testAccountGroupPricelists = new List<ccrz__E_AccountGroupPriceList__c>();
		Integer tempSequence = 200;
		for(ccrz__E_PriceList__c pl : testPriceLists) {
			ccrz__E_AccountGroupPriceList__c tempAccountGroupPricelist = new ccrz__E_AccountGroupPriceList__c();
			tempAccountGroupPricelist.ccrz__AccountGroup__c = testAccountGroup.Id;
			tempAccountGroupPricelist.ccrz__Pricelist__c = pl.Id;
			tempAccountGroupPricelist.ccrz__StartDate__c = myStartDate;
			tempAccountGroupPricelist.ccrz__EndDate__c = myEndDate;
			tempAccountGroupPricelist.ccrz__Enable__c = true;
			tempAccountGroupPricelist.ccrz__Sequence__c = tempSequence;
			testAccountGroupPricelists.add(tempAccountGroupPricelist);
			tempSequence = tempSequence + 20;
		}

		insert testAccountGroupPricelists;

		//now insert subprodterms (we'll need these AND pricelists in order to insert pricelistitems correctly)
		List<ccrz__E_SubProdTerm__c> testSubProdTerms = new List<ccrz__E_SubProdTerm__c>();

		//two subprodterms for each product: monthly and yearly
		for(ccrz__E_Product__c prod : testProducts) {
			for(String s : mySubscriptionIntervals) {
				ccrz__E_SubProdTerm__c tempSPT = new ccrz__E_SubProdTerm__c();
				tempSPT.Name = prod.Name + ' ' + s + ' Subscription';
				tempSPT.ccrz__CCProduct__c = prod.Id;
				tempSPT.ccrz__Storefront__c = myStoreFrontName;
				tempSPT.ccrz__EffectiveStart__c = myStartDate;
				tempSPT.ccrz__EffectiveEnd__c = myEndDate;
				tempSPT.ccrz__Enabled__c = true;
				tempSPT.ccrz__IgnoreInstallmentFrequencyFields__c = true;
				tempSPT.ccrz__InstallmentCount__c = 1;
				tempSPT.ccrz__InstallmentFrequency__c = 1;
				tempSPT.ccrz__InstallmentFrequencyUOM__c = s;
				tempSPT.ccrz__OrderCount__c = 1;
				tempSPT.ccrz__OrderFrequency__c = 1;
				tempSPT.ccrz__InstallmentFrequencyUOM__c = s;
				testSubProdTerms.add(tempSPT);
			}
		}

		insert testSubProdTerms;

		//now that we have pricelists and subprodterms for each product, we can add pricelistitems for each product
		List<ccrz__E_PriceListItem__c> testPriceListItems = new List<ccrz__E_PriceListItem__c>();

		for(ccrz__E_Product__c prod : testProducts) {
			for(ccrz__E_PriceList__c pl : testPriceLists) {
				for(ccrz__E_SubProdTerm__c spt : testSubProdTerms) {
					ccrz__E_PriceListItem__c tempPriceListItem = new ccrz__E_PriceListItem__c();
					tempPriceListItem.ccrz__Product__c = prod.Id;
					tempPriceListItem.ccrz__Pricelist__c = pl.Id;
					tempPriceListItem.ccrz__SubProdTerm__c = spt.Id;
					tempPriceListItem.ccrz__StartDate__c = myStartDate;
					tempPriceListItem.ccrz__EndDate__c = myEndDate;
					tempPriceListItem.ccrz__Price__c = Math.random()*10;
					testPriceListItems.add(tempPriceListItem);
					//TO DO: add a recurring pricelistitem with 0 price
				}
				//TO DO: also add a fallback pricelistitem to each pricelist w/no subprodterm and price=0
			}
		}

		insert testPriceListItems;

	//STEP 3: CATEGORIZE PRODUCTS
		//next create category
		ccrz__E_Category__c testCategory = new ccrz__E_Category__c();
		testCategory.Name = 'Test Category';
		testCategory.ccrz__CategoryID__c = myRootCategoryId;
		testCategory.ccrz__StartDate__c = myStartDate;
		testCategory.ccrz__EndDate__c = myEndDate;

		//add previously-created products as featured product and featured addon
		testCategory.FeaturedAddon__c = testDynamicKit.Id;
		testCategory.FeaturedProduct__c = testComponentProduct.Id;

		insert testCategory;

		//add previously-created products to this category as CC Product Category records
		List<ccrz__E_ProductCategory__c> testProductCategories = new List<ccrz__E_ProductCategory__c>();

		ccrz__E_ProductCategory__c testProductCategory1 = new ccrz__E_ProductCategory__c();
		testProductCategory1.ccrz__StartDate__c = myStartDate;
		testProductCategory1.ccrz__EndDate__c = myEndDate;
		testProductCategory1.ccrz__Product__c = testDynamicKit.Id;
		testProductCategory1.ccrz__Category__c = testCategory.Id;
		testProductCategory1.ccrz__Sequence__c = 200;

		ccrz__E_ProductCategory__c testProductCategory2 = new ccrz__E_ProductCategory__c();
		testProductCategory2.ccrz__StartDate__c = myStartDate;
		testProductCategory2.ccrz__EndDate__c = myEndDate;
		testProductCategory2.ccrz__Product__c = testComponentProduct.Id;
		testProductCategory2.ccrz__Category__c = testCategory.Id;
		testProductCategory2.ccrz__Sequence__c = 300;

		testProductCategories.add(testProductCategory1);
		testProductCategories.add(testProductCategory2);

		insert testProductCategories;

	}
	
}