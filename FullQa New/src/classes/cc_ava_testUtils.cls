public with sharing class cc_ava_testUtils {
	// test
	/*public static final String DEFAULT_STOREFRONT = 'DefaultStore';
    //public static final String DEFAULT_COMMUNITY_PROFILE = 'CloudCraze Customer Community User';
	public static final String DEFAULT_COMMUNITY_PROFILE = 'Avalara Customer Community User';
    public static User globalFooterTestUser;

    public static final String ACCOUNT_GROUP_ID = '1';


    public static final String TEST_AVALARASTORE_STOREFRONT = 'AvalaraStore';

    public static final String AVA_GUEST_USER_COMMUNITY_PROFILE = 'AvalaraStore Profile';

   public static final String AVA_GUEST_USERNAME='avalarastoreTESTGUEST@ccjohn-avalaracommunity.cs52.force.com';

	//make dates available to the whole test class and make sure that they are before and after creationdate(=currendate)
    public static final Date myStartDate = Date.newInstance(Date.today().year(),01,01);
    public static final Date myEndDate = Date.newInstance(Date.today().year(),12,31);
    public static final String myStoreFrontName = 'AvalaraStore';
    public static final string myRootCategoryId = 'ava_products';
    public static final List<String> mySubscriptionIntervals = new List<String>{'Monthly','Yearly'};
    public static final List<String> myRelatedProductGroups = new List<String>{'Product','Tier','Integrations','Add-ons'};
    public static final List<String> myPriceLists = new List<String>{'Avalara General Pricelist','AvaTax Tier 1 Pricelist','AvaTax Tier 2 Pricelist'};
    public static final Map<String, Integer> myTiers = new Map<String,Integer>{'AvaTax Tier 1 Pricelist Now Price Group'=>250,'AvaTax Tier 2 Pricelist Now Price Group'=>500};
    public static final String myPriceGroupType = 'AvaTaxTier';
    public static final List<Boolean> myRecurringValues = new List<Boolean>{true, false};
    public static final String myDynamicKitSku = 'masterproduct-01';
    public static final String myBasicSOHOSku = 'basicsoho-01';
    public static final String myReturnsSku = 'returns-01';
    public static final String myIntegrationSku1 = 'integration-01';
    public static final String myIntegrationSku2 = 'integration-02';
    public static final String myGuestEmail = 'john.esposito@6st.coguest';


    /**
	* Initialize test data and return a map of objects created
	*
	* @return Map of objects inserted
	
	public static void setupCustomSetting(){
       //Setup custom setting
       List<CC_AVA_KeyPairValue__c> listCC_AVA_KeyPairValue=new List<CC_AVA_KeyPairValue__c>(); 
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_URL_Sandbox',Value__c='http://api.salesforce.com/'));
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_APIKEY_Sandbox',Value__c='123456'));
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_URL_Production',Value__c='http://api.salesforce.com/'));
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_APIKEY_Production',Value__c='123456'));
       insert listCC_AVA_KeyPairValue;		
	}	
    public static Map<String, SObject> initData() {

       //Setup custom setting
     setupCustomSetting();

        //create storefront and other basic cloudcraze settings

        Map<String,Map<String,Object>> testData = new Map<String,Map<String,Object>>{
            ccrz.ccApiTestData.STOREFRONT_SETTINGS => new Map<String,Object>{
                myStoreFrontName => new Map<String,Object>{
                    'Root_Category_Id__c' => myRootCategoryId,
                    'Allow_Anonymous_Browsing__c' => true,
                    'Allow_Anonymous_Checkout__c' => true,
                    'Allow_Sort_By_Price__c' => true,
                    'DefaultLanguage__c' => 'en_US',
                    'QuickOrderEnabled__c' => true,
                    'UseGatingCart__c' => true,
                    'ProductSpotlightEnabled__c' => true,
                    'UseUPSShipping__c' => true,
                    'MyOrdersEnabled__c' => true,
                    'Show_All_Countries__c' => true,
                    'FeaturedProductsEnabled__c' => true
                }
            },
            ccrz.ccApiTestData.SERVICE_SETTINGS => new Map<String,Object>{
                myStoreFrontName => new Map<String,Object>{
                    'ccServiceProduct' => 'c.cc_Ava_ProductService',
                    'ccServiceCategory' => 'c.cc_Ava_CategoryService'
                }
            },
            ccrz.ccApiTestData.LOGIC_SETTINGS => new Map<String,Object>{
                myStoreFrontName => new Map<String,Object>{
                    'ccLogicValidateAddress' => 'ccava.ccLogicValidateAddress'
                }
            },
            ccrz.ccApiTestData.HOOK_SETTINGS => new Map<String,Object>{
                myStoreFrontName => new Map<String,Object>{
                    ccrz.cc_hk_Pricing.HK_ID => 'c.cc_hk_PricingAva',
                    ccrz.cc_hk_Order.HK_ID => 'c.cc_hk_OrderAva',
                    ccrz.cc_hk_TaxCalculation.HK_ID => 'ccava.cc_avalara_AvaTax15TaxCalculation'
                }
            },
            ccrz.ccApiTestData.CONFIG_SETTINGS => new Map<String,Object>{
                'Global.All.PRG.Enabled' => 'true',
                'Global.All.PRG.Types' => myPriceGroupType,
                'AvalaraStore.all.co.cnfurl' => 'ccrz__CCPage?pageKey=orderconfirmava',
                'Global.all.ccava.companycode' => 'Ava',
                'Global.all.ccava.credentials' => 'Avalara_Development'
            }
        };
        ccrz.ccApiTestData.setupData(testData);

        ccrz.cc_util_Reflection.addFactoryEntry(TEST_AVALARASTORE_STOREFRONT+':OrderHK', 'ccrz.cc_hlpr_GenericHKFactory', 'OrderHKApi', null, null);
        ccrz.cc_util_Reflection.addReflection(TEST_AVALARASTORE_STOREFRONT+':OrderHKApi', 'ccrz.cc_hk_Order:cc_hk_OrderAva');

        Profile userProfile = cc_ava_testUtils.getCustomerCommunityProfile();
        /*
    	* Account Group
    	
        ccrz__E_AccountGroup__c userAccountGroup = cc_ava_testUtils.createAccountGroup('accountGroup');
        insert userAccountGroup;
        /*
    	* Account
    
        Account userAccount = cc_ava_testUtils.createAccount(userAccountGroup);
        insert userAccount;
        /*
    	* Contact
    	
        Contact userContact = cc_ava_testUtils.createContact(userAccount, 'contact@email.com');
        insert userContact;
        /*
    	* Portal User
    	
        User portalUser = cc_ava_testUtils.createUser(userProfile, userContact, 'username@email.com', 'contact@email.com', 'firstName', 'lastName', 'alias');
        insert portalUser;

        /*
    	* Contact Address
    	
        ccrz__E_ContactAddr__c address = cc_ava_testUtils.createContactAddress(
            portalUser,
            'line1',
            'line2',
            'line3',
            'city',
            'state',
            'country',
            '11111'
        );
        insert address;

        /*
    	* Account Address Book
    	
    	List<ccrz__E_AccountAddressBook__c> addrBookList = new List<ccrz__E_AccountAddressBook__c>();
        ccrz__E_AccountAddressBook__c shippingAddressBook = cc_ava_testUtils.createAccountAddressBook(userAccount,'Shipping', address, portalUser, true);
        ccrz__E_AccountAddressBook__c billingAddressBook = cc_ava_testUtils.createAccountAddressBook(userAccount,'Billing', address, portalUser, true);
        addrBookList.add(shippingAddressBook);
        addrBookList.add(billingAddressBook);
        insert addrBookList;

        /*
    	* CCRZ Call Context
    	
        //SETTING ANONYMOUS CONTEXT
        //ccrz.cc_CallContext.currAccount = userAccount;
        //ccrz.cc_CallContext.currUserId = portalUser.id;
        //ccrz.cc_CallContext.currUser = portalUser;
        //ccrz.cc_CallContext.storefront = cc_ava_testUtils.TEST_AVALARASTORE_STOREFRONT;

        Lead lead = cc_ava_testUtils.createLead('this@isalead.com');
        insert lead;


        /*
    	* Product
    	
        ccrz__E_Product__c parentProduct = cc_ava_testUtils.createProduct('AvaTax Basic/SOHO Dynamic Kit', myDynamicKitSku, 'Dynamic Kit', TEST_AVALARASTORE_STOREFRONT);

        /*
    	* Parent Product
    	
        ccrz__E_Product__c product = cc_ava_testUtils.createProduct('AvaTax Basic/SOHO', myBasicSOHOSku, 'Product', TEST_AVALARASTORE_STOREFRONT);

        /*
        * Other Products
       
        ccrz__E_Product__c addon = cc_ava_testUtils.createProduct('Avalara Returns', myReturnsSku, 'Product', TEST_AVALARASTORE_STOREFRONT);
        ccrz__E_Product__c integration1 = cc_ava_testUtils.createProduct('Integration 1', myIntegrationSku1, 'Product', TEST_AVALARASTORE_STOREFRONT);
        ccrz__E_Product__c integration2 = cc_ava_testUtils.createProduct('Integration 2', myIntegrationSku2, 'Product', TEST_AVALARASTORE_STOREFRONT);

        List<ccrz__E_Product__c> productList = new List<ccrz__E_Product__c>();
        productList.add(product);
        productList.add(addon);
        productList.add(parentProduct);
        productList.add(integration1);
        productList.add(integration2);
        insert productList;
        System.debug('productList: ' + productList);
        System.debug('how many products: ' + productList.size());

        /*
    	* Category
    	
        ccrz__E_Category__c category = cc_ava_testUtils.createCategory(myRootCategoryId);
        insert category;

        /*
    	* Product Category
    	
        ccrz__E_ProductCategory__c productCategory = cc_ava_testUtils.createProductCategory(product, '1001', category);
        insert productCategory;

        /*
    	* Related Product Groups
    	* product group names are part of product model
    	
        	List<ccrz__E_RelatedProductGroup__c> relatedProductGroups = cc_ava_testUtils.createRelatedProductGroups(myRelatedProductGroups);       
        	insert relatedProductGroups;
            System.debug('relartedProductGRoups: ' + relatedProductGroups);
        

        /*
    	* Price List
    	
        List<ccrz__E_PriceList__c> priceLists = cc_ava_testUtils.createPriceLists(myPriceLists, TEST_AVALARASTORE_STOREFRONT);
        insert priceLists;
        System.debug('how many pricelists: ' + priceLists.size());

        List<ccrz__E_AccountGroupPriceList__c> agrpPriceLists =  cc_ava_testUtils.createAccountGroupPriceLists(userAccountGroup, priceLists);
        insert agrpPriceLists;
        System.debug('account group pricelists: ' + agrpPriceLists);

        List<ccrz__E_PriceGroupPricelist__c> priceGroupPricelists = cc_ava_testUtils.createPriceGroupsAndPriceGroupPricelists(priceLists);
        insert priceGroupPricelists;

        List<ccrz__E_Product__c> tiers = createTiers(productList);
        insert tiers;
        System.debug('tiers inserted: ' + tiers);

        /*
    	* Product Media
    	*/
    	/*
        ccrz__E_ProductMedia__c productMedia = cc_ava_testUtils.createProductMedia(product,'Product Image Thumbnail');
        insert productMedia;
        */

        /*
    	* Attachment
    	*/
    	/*
        Attachment attachment = cc_ava_testUtils.createAttachment('Product Image', productMedia);
        insert attachment;
        */

        /*
        * SubProdTerms
        
        List<ccrz__E_SubProdTerm__c> subProdTerms = cc_ava_testUtils.createSubProdTerms(productList, mySubscriptionIntervals);
        insert subProdTerms;

        /*
    	* Price List Item
    	
        List<ccrz__E_PriceListItem__c> priceListItems = cc_ava_testUtils.createPriceListItems(productList, priceLists, subProdTerms);
        insert priceListItems;
        System.debug('how many pricelistitems were created? ' + priceListItems.size());

        /*
    	* Composite Products
    	
        System.debug('productList before creating compositeProducts: ' + productList);
        List<ccrz__E_CompositeProduct__c> compositeProducts = cc_ava_testUtils.createCompositeProducts(productList, parentProduct, relatedProductGroups);
        insert compositeProducts;
        System.debug('how many compositeproduct records: ' + compositeProducts.size());

        /*
    	* Cart
    	
        ccrz__E_Cart__c cart = cc_ava_testUtils.createCart(userAccount, address, address, portalUser, userContact, 'Cart', cc_ava_testUtils.TEST_AVALARASTORE_STOREFRONT);
        insert cart;

        /*
    	* Cart Item
    	* - Normal Cart

        ccrz__E_CartItem__c cartItem = cc_ava_testUtils.createCartItem(cart, 9.99, 1, product, null);
        insert cartItem;

        //normal, not dynamic kit component
        ccrz__E_Product__c plainProduct = cc_ava_testUtils.createProduct('test product', 'testsku', 'Product', TEST_AVALARASTORE_STOREFRONT);
        insert plainProduct;
        List<ccrz__E_PriceListItem__c> plainPlis = createPriceListItems(new List<ccrz__E_Product__c>{plainProduct}, priceLists);
        insert plainPlis;


/*create guest info
        Profile gpAnon = getGuestCommunityProfile();

        ccrz__E_AccountGroup__c agAnon = createAccountGroup('Anonymous');
        insert agAnon;

        Account aAnon = new Account(
            Name='CCAnonymous',
            ccrz__E_AccountGroup__c=agAnon.Id
        );
        System.debug('account anonymous: ' + aAnon);
        insert aAnon;

        List<ccrz__E_AccountGroupPriceList__c> grpPriceListsAnon =  cc_ava_testUtils.createAccountGroupPriceLists(agAnon, priceLists);
        insert grpPriceListsAnon;
        System.debug('anonymous account group pricelists: ' + grpPriceListsAnon);

        List<ccrz__E_PriceGroupAccount__c> pgaAnon = cc_ava_testUtils.createPriceGroupAccounts(priceGroupPriceLists, aAnon);
        insert pgaAnon;
        System.debug('anonymous pricegroup accounts:' + pgaAnon);


        User uAnon = new User(
            FirstName         = 'Someguest',
            LastName          = 'Userhere',
            Email             = myGuestEmail,
            Alias             = 'guest',
            Username          = AVA_GUEST_USERNAME,
            LocaleSidKey      = 'en_US',
            TimeZoneSidKey    = 'GMT',
            ProfileID         = gpAnon.id,
            LanguageLocaleKey = 'en_US',
            EmailEncodingKey  = 'UTF-8'
        );
        insert uAnon;

        //use anonymous context
        ccrz.cc_CallContext.currAccount = aAnon;
        ccrz.cc_CallContext.currUserId = uAnon.id;
        ccrz.cc_CallContext.currUser = uAnon;
        ccrz.cc_CallContext.storefront = cc_ava_testUtils.TEST_AVALARASTORE_STOREFRONT;
        ccrz.cc_CallContext.storeFrontSettings = new Map<String,Object> {'DefaultLocale__c' => 'en_US' };

        /*
        * Order
        *
        */
        /*
        ccrz__E_Order__c theOrder = createOrder(cart.Id, userAccount.Id, userContact.Id, portalUser.Id, address.Id, address.Id);
        insert theOrder;
        */

        /*
        * Order Item
        *
        */
        /*
        ccrz__E_OrderItem__c parentOrderItem = createOrderItem(theOrder.Id, 'oi1', 'Major', parentProduct.Id, null, null, 1.00, 1, 1.00);
        insert parentOrderItem;
        ccrz__E_OrderItem__c childOrderItem = createOrderItem(theOrder.Id, 'oi2', 'Minor', product.Id, parentOrderItem.Id, parentProduct.Id, 1.00, 1, 1.00);
        insert childOrderItem;
        */


        /*
		ccrz__E_TransactionPayment__c tp = createTransactionPayment(theOrder.Id, 'uid');
		insert tp;
	

        Map<String,SObject> resultMap = new Map<String,SObject>();
        //resultMap.put('order', theOrder);
        resultMap.put('cart', cart);
        resultMap.put('cartItem', cartItem);
        resultMap.put('product', product);
        resultMap.put('address', address);
        resultMap.put('portalUser', portalUser);
        resultMap.put('userAccount', userAccount);
        resultMap.put('userContact', userContact);
        resultMap.put('category', category);
        resultMap.put('shippingAddressBook', shippingAddressBook);
        resultMap.put('billingAddressBook', billingAddressBook);
        //resultMap.put('transactionPayment', tp);

        return resultMap;
    }


    /**
	* Initialize test data with a page reference
	*
	* @return Map of objects inserted
	
    public static Map<String, SObject> initData(PageReference pageRef) {
        Map<String,SObject> initResult = initData();

        ccrz__E_Cart__c cart = (ccrz__E_Cart__c)initResult.get('cart');

        List<ccrz__E_Cart__c> cartEnc = [
            SELECT
                id,
                ccrz__EncryptedId__c
            FROM
                ccrz__E_Cart__c
            WHERE
            	id = :cart.id
        ];

        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('cartId', cartEnc.get(0).ccrz__EncryptedId__c);

        return initResult;
    }

	public static Profile getCustomerCommunityProfile(){
		Profile p;
		try {
		p = [
			SELECT
				Id
				,Name
			FROM
				Profile
			WHERE
				Name = :DEFAULT_COMMUNITY_PROFILE
			LIMIT
			1
		];
		}catch(Exception e){
			System.assertNotEquals(null, p, 'You must create a profile named ' + DEFAULT_COMMUNITY_PROFILE + ' or modify this test case.');
		}
		return p;
	}

    public static Profile getGuestCommunityProfile(){
        Profile p;
        try {
        p = [
            SELECT
                Id
                ,Name
            FROM
                Profile
            WHERE
                Name = :AVA_GUEST_USER_COMMUNITY_PROFILE
            LIMIT
            1
        ];
        }catch(Exception e){
            System.assertNotEquals(null, p, 'You must create a profile named ' + AVA_GUEST_USER_COMMUNITY_PROFILE + ' or modify this test case.');
        }
        return p;
    }


	public static Account createAccount(ccrz__E_AccountGroup__c accountGroup){
    	Account a1 = new Account  (Name='Test Account');
    	if(accountGroup != null){
    		a1.ccrz__E_AccountGroup__c = accountGroup.Id;
    	}
    	return a1;
	}

	public static ccrz__E_AccountGroup__c createAccountGroup(String grpName){
		ccrz__E_AccountGroup__c actGrp = new ccrz__E_AccountGroup__c(
			Name = grpName,
			ccrz__PriceListSelectionMethod__c = 'Sequence Order'
		);
		return actGrp;
	}

	public static List<ccrz__E_PriceList__c> createPriceLists(List<String> plNames, String storefront){
		List<ccrz__E_PriceList__c> pls = new List<ccrz__E_PriceList__c>();
		for(String pln: plNames) {
			ccrz__E_PriceList__c pl = new ccrz__E_PriceList__c(
					Name = pln,
					ccrz__CurrencyISOCode__c = 'USD',
					ccrz__Enabled__c = true,
					ccrz__StartDate__c = Date.today(),
					ccrz__EndDate__c = Date.today().addDays(30),
					ccrz__Storefront__c = storefront
			);
			pls.add(pl);
		}
		return pls;
	}

	public static List<ccrz__E_AccountGroupPriceList__c> createAccountGroupPriceLists(ccrz__E_AccountGroup__c accountGroup, List<ccrz__E_Pricelist__c> priceLists){
		List<ccrz__E_AccountGroupPriceList__c> agpls = new List<ccrz__E_AccountGroupPriceList__c>();
		Integer sequence = 0;
		for(ccrz__E_Pricelist__c pl : priceLists) {
			ccrz__E_AccountGroupPriceList__c agpl = new ccrz__E_AccountGroupPriceList__c (
				ccrz__AccountGroup__c = accountGroup.Id,
	            ccrz__Pricelist__c = pl.Id,
	            ccrz__Sequence__c = sequence + 1,
				ccrz__Enable__c = true,
				ccrz__StartDate__c = Date.today(),
				ccrz__EndDate__c = Date.today().addDays(30)
			);
			agpls.add(agpl);
			sequence++;
		}
		return agpls;
	}

    public static List<ccrz__E_PriceGroupAccount__c> createPriceGroupAccounts(List<ccrz__E_PriceGroupPricelist__c> pgpls, Account account) {
        List<ccrz__E_PriceGroupAccount__c> pgas = new List<ccrz__E_PriceGroupAccount__c>();
        for(ccrz__E_PriceGroupPricelist__c pgpl : pgpls) {
            ccrz__E_PriceGroupAccount__c pga = new ccrz__E_PriceGroupAccount__c(
                ccrz__PriceGroup__c = pgpl.ccrz__PriceGroup__c,
                ccrz__Account__c = account.Id,
                ccrz__Enabled__c = true,
                ccrz__EffectiveStart__c = Date.today(),
                ccrz__EffectiveEnd__c = Date.today().addDays(30),
                ccrz__Storefront__c = TEST_AVALARASTORE_STOREFRONT
            );
            pgas.add(pga);
        }
        return pgas;
    } 

    public static List<ccrz__E_PriceGroupPriceList__c> createPriceGroupsAndPriceGroupPricelists(List<ccrz__E_PriceList__c> priceLists) {
        List<ccrz__E_PriceGroupPriceList__c> priceGroupPriceLists = new List<ccrz__E_PriceGroupPriceList__c>();
        for(ccrz__E_PriceList__c pl : priceLists) {
            ccrz__E_PriceGroup__c pg = new ccrz__E_PriceGroup__c(
                ccrz__GroupName__c = pl.Name + ' Now Price Group',
                ccrz__GroupType__c = myPriceGroupType,
                ccrz__EffectiveStart__c = Date.today(),
                ccrz__EffectiveEnd__c = date.today().addDays(30)
            );
            insert pg;
            ccrz__E_PriceGroupPriceList__c pgpl = new ccrz__E_PriceGroupPriceList__c(
                ccrz__PriceGroup__c = pg.Id,
                ccrz__Pricelist__c = pl.Id,
                ccrz__Enabled__c = true,
                ccrz__Storefront__c = TEST_AVALARASTORE_STOREFRONT,
                ccrz__EffectiveEnd__c = Date.today().addDays(30),
                ccrz__EffectiveStart__c = Date.today()
            );
            priceGroupPriceLists.add(pgpl);
        }
        return priceGroupPriceLists;
    }

	public static List<ccrz__E_SubProdTerm__c> createSubProdTerms(List<ccrz__E_Product__c> products, List<String> subscriptionIntevals) {
		List<ccrz__E_SubProdTerm__c> subProdTerms = new List<ccrz__E_SubProdTerm__c>();
		for(ccrz__E_Product__c prod : products) {
			for(String s : subscriptionIntevals) {
				ccrz__E_SubProdTerm__c spt = new ccrz__E_SubProdTerm__c(
					Name = prod.Name + ' ' + s + ' Subscription',
					ccrz__CCProduct__c = prod.Id,
					ccrz__Storefront__c = myStoreFrontName,
					ccrz__EffectiveStart__c = myStartDate,
					ccrz__EffectiveEnd__c = myEndDate,
					ccrz__Enabled__c = true,
					ccrz__IgnoreInstallmentFrequencyFields__c = true,
					ccrz__InstallmentCount__c = 1,
					ccrz__InstallmentFrequency__c = 1,
					ccrz__InstallmentFrequencyUOM__c = s,
					ccrz__OrderCount__c = 1,
					ccrz__OrderFrequency__c = 1,
					ccrz__OrderFrequencyUOM__c = s
				);
				subProdTerms.add(spt);
			}
		}
		return subProdTerms;
	}

	public static List<ccrz__E_PriceListItem__c> createPriceListItems(List<ccrz__E_Product__c> products, List<ccrz__E_PriceList__c> priceLists, List<ccrz__E_SubProdTerm__c> subProdTerms) {
		List<ccrz__E_PriceListItem__c> pliList = new List<ccrz__E_PriceListItem__c>();
		for(ccrz__E_Product__c prod : products){
            for(ccrz__E_PriceList__c pl : priceLists) {
                for(ccrz__E_SubProdTerm__c spt : subProdTerms) {
                    if(spt.ccrz__CCProduct__c == prod.Id) {
                        //add two pricelistitems (one recurring, one not) for each subprodterm
                        for(Boolean b : myRecurringValues) {
                            ccrz__E_PriceListItem__c item = new ccrz__E_PriceListItem__c(
                                    ccrz__EndDate__c = Date.today().addDays(30),
                                    ccrz__PriceList__c = pl.Id,
                                    ccrz__Product__c = prod.Id,
                                    ccrz__StartDate__c = Date.today(),
                                    ccrz__UnitOfMeasure__c = 'Each',
                                    ccrz__SubProdTerm__c = spt.Id,
                                    ccrz__RecurringPrice__c = b
                            );
                            if(b) {
                                item.ccrz__Price__c = 0;
                            } else {
                                item.ccrz__Price__c = 10;
                            }
                            //sample zuora value
                            item.Opportunity_LI_Rate_Plan_Charge_Tier_ID__c='TESTDATAHERE';
                            pliList.add(item);
                        }                        
                    }
                }
                //add fallback pricelistitem without subprodterm
                ccrz__E_PriceListItem__c itemFallback = new ccrz__E_PriceListItem__c(
                        ccrz__EndDate__c = Date.today().addDays(30),
                        ccrz__Price__c = 10,
                        ccrz__PriceList__c = pl.Id,
                        ccrz__Product__c = prod.Id,
                        ccrz__StartDate__c = Date.today(),
                        ccrz__UnitOfMeasure__c = 'Each',
                        Opportunity_LI_Rate_Plan_Charge_Tier_ID__c = 'TESTGENERALDATAHERE'
                );
                pliList.add(itemFallback);
            }
		}
		return pliList;
	}

    public static List<ccrz__E_PriceListItem__c> createPriceListItems(List<ccrz__E_Product__c> products, List<ccrz__E_PriceList__c> priceLists) {
        List<ccrz__E_PriceListItem__c> pliList = new List<ccrz__E_PriceListItem__c>();
        for(ccrz__E_Product__c prod : products){
            for(ccrz__E_PriceList__c pl : priceLists) {
                //add two pricelistitems (one recurring, one not) for each subprodterm
                ccrz__E_PriceListItem__c item = new ccrz__E_PriceListItem__c(
                    ccrz__EndDate__c = Date.today().addDays(30),
                    ccrz__PriceList__c = pl.Id,
                    ccrz__Product__c = prod.Id,
                    ccrz__StartDate__c = Date.today(),
                    ccrz__UnitOfMeasure__c = 'Each',
                    ccrz__Price__c = 10
                );
                pliList.add(item);
            }
        }
        return pliList;
    }
	public static Contact createContact(Account a, String emailAddress){
		Contact con = new Contact(
			FirstName='Test',
			Lastname='User',
			Accountid=a.id,
			Email=emailAddress
		);
		return con;
    }

	public static User createUser(Profile p, Contact c, String username, String emailAddress, String firstName, String lastName, String alias){
		User u = new User(
			FirstName         = firstName,
			LastName          = lastName,
			Email             = emailAddress,
			Alias             = alias,
			Username          = username,
			LocaleSidKey      = 'en_US',
			TimeZoneSidKey    = 'GMT',
			ProfileID         = p.id,
			LanguageLocaleKey = 'en_US',
			EmailEncodingKey  = 'UTF-8',
			ContactId         = c.id
		);
		return u;
	}

    public static Lead createLead(String emailAddress) {
        Lead l = new Lead(
            FirstName = 'Thisperson',
            LastName = 'Isalead',
            Email = emailAddress,
            Company = 'Some Lead Company'
        );
        return l;
    }

	
	public static List<ccrz__E_CompositeProduct__c> createCompositeProducts(List<ccrz__E_Product__c> componentProducts, ccrz__E_Product__c parentProduct, List<ccrz__E_RelatedProductGroup__c> relatedGroups){
		List<ccrz__E_CompositeProduct__c> compositeProductList = new List<ccrz__E_CompositeProduct__c>();
		for(ccrz__E_Product__c compProd :componentProducts){
                String groupName;
                if(compProd.Name == 'AvaTax Basic/SOHO') {
                    groupName = 'Product';
                } else if(compProd.Name == 'Avalara Returns') {
                    groupName = 'Add-ons';
                } else if(compProd.Name == 'Integration 1' || compProd.Name == 'Integration 2') {
                    groupName = 'Integrations';
                } else if(compProd.Name == 'Tier 1' || compProd.Name == 'Tier 2') {
                    groupName = 'Tier';
                }
            for(ccrz__E_RelatedProductGroup__c rpg : relatedGroups) {
                if(rpg.Name == groupName) {
                    ccrz__E_CompositeProduct__c newCompProd = new ccrz__E_CompositeProduct__c(
                        ccrz__Composite__c = parentProduct.Id,
                        ccrz__Component__c = compProd.Id,
                        ccrz__ProductGroup__c = rpg.Id,
                        ccrz__Quantity__c = 1
                    );                    
                    compositeProductList.add(newCompProd);
                }
            }
		}
		return compositeProductList;
	}
	

	public static ccrz__E_Product__c createProduct(String name, String sku, String productType, String storefront){
		if(productType == null){
			productType = 'Product';
		}
		// Create Product
		ccrz__E_Product__c prod = new ccrz__E_Product__c(
            Name = name,
            ccrz__SKU__c = sku,
            ccrz__ProductType__c = productType,
            ccrz__ProductStatus__c = 'Released',
            ccrz__Storefront__c = storefront,
            ccrz__StartDate__c = Date.today(),
            ccrz__EndDate__c = Date.today().addDays(30),
            ccrz__Taxable__c = true
        );
		return prod;
	}

	public static ccrz__E_Product__c createProduct(String name, String sku, String storefront){
		return createProduct(name, sku, 'Product', storefront);
	}

    public static List<ccrz__E_Product__c> createTiers(List<ccrz__E_Product__c> existingProducts){
        List<ccrz__E_Product__c> tiers = new List<ccrz__E_Product__c>();
        List<ccrz__E_PriceGroup__c> priceGroups = [select Id, Name, ccrz__GroupName__c from ccrz__E_PriceGroup__c];
        Integer tierNameNumber = 1;
        for (ccrz__E_PriceGroup__c pg : priceGroups) {
            ccrz__E_Product__c prod = new ccrz__E_Product__c(
                Name = 'Tier ' + String.valueOf(tierNameNumber),
                ccrz__SKU__c = 'tier-0'+String.valueOf(tierNameNumber),
                ccrz__ProductType__c = 'Product',
                ccrz__ProductStatus__c = 'Released',
                Number_of_Transactions__c = myTiers.get(pg.ccrz__GroupName__c),
                Corresponding_Price_Group__c = pg.Id,
                ccrz__Storefront__c = TEST_AVALARASTORE_STOREFRONT,
                ccrz__StartDate__c = Date.today(),
                ccrz__EndDate__c = Date.today().addDays(30)
            );
            tiers.add(prod);   
            existingProducts.add(prod);            
            tierNameNumber++;
        }
        return tiers;
    }

	public static ccrz__E_Spec__c createSpec(String name, String description, String displayName, Integer dv2000, Integer dv2500, Integer recommendedValue, Integer sequence, String uom, String specGroup, Boolean isVisible, Boolean displayInFooter, Boolean displayInLimit, Boolean displayInEnough){
		ccrz__E_Spec__c spec = new ccrz__E_Spec__c();
		spec.Name = name; 
		spec.ccrz__Desc__c = description;
		spec.ccrz__DisplayName__c = displayName; 
		spec.ccrz__IsVisibleInCatalog__c = false;
		spec.ccrz__Sequence__c = 10;
		spec.ccrz__SpecGroup__c = specGroup;
		return spec;
	}

	public static List<ccrz__E_ProductSpec__c> createProductSpecs(ccrz__E_Product__c product, Map<ccrz__E_Spec__c, String> specToValueMap){
		List<ccrz__E_ProductSpec__c> prodSpecList = new List<ccrz__E_ProductSpec__c>();
		ccrz__E_ProductSpec__c newProdSpec;
		for(ccrz__E_Spec__c theSpec :specToValueMap.keySet()){
			newProdSpec = new ccrz__E_ProductSpec__c(
				ccrz__Product__c = product.Id,
				ccrz__Spec__c = theSpec.Id,
				ccrz__SpecValue__c = specToValueMap.get(theSpec)
			);
			prodSpecList.add(newProdSpec);
		}
		return prodSpecList;
	}

	
	public static List<ccrz__E_RelatedProductGroup__c> createRelatedProductGroups(List<String> groupNames){
		List<ccrz__E_RelatedProductGroup__c> groups = new List<ccrz__E_RelatedProductGroup__c>();
		Integer i = 0;
		for(String gn : groupNames) {
			ccrz__E_RelatedProductGroup__c tempGroup = new ccrz__E_RelatedProductGroup__c(
				Name = gn,
				ccrz__GroupId__c = String.valueOf(i+1)
			);
			groups.add(tempGroup);
			i++;
		}
		return groups;
	}
	


	// Create contact address - owner is the portal user or guest (Site Guest User)
	// cart and order link to CC Contact Address for billto/shipto.
	public static ccrz__E_ContactAddr__c createContactAddress(User portalUser, String line1, String line2, String line3, String city, String state, String country, String postalCode ){
		String msg = 'PORTAL ID !!!' + portalUser.Id;
		System.debug(msg);

		ccrz__E_ContactAddr__c addr = new ccrz__E_ContactAddr__c(
			ownerId = portalUser.Id,
			ccrz__AddressFirstline__c = line1,
			ccrz__AddressSecondline__c = line2,
			ccrz__AddressThirdline__c = line3,
			ccrz__City__c = city,
			ccrz__State__c = state,
			ccrz__Country__c = country,
			ccrz__PostalCode__c = postalCode
		);
		return addr;

	}

	public static ccrz__E_AccountAddressBook__c createAccountAddressBook(Account acct, String addrType, ccrz__E_ContactAddr__c contactAddr, User portalUser, Boolean isDefault){
		ccrz__E_AccountAddressBook__c addrBook = new ccrz__E_AccountAddressBook__c(
			ccrz__Account__c = acct.Id,
			ccrz__AccountId__c = acct.Id,
			ccrz__AddressType__c = addrType, // Billing/Shipping
			ccrz__E_ContactAddress__c = contactAddr.Id,
			ccrz__Default__c = isDefault,
			ccrz__Owner__c = portalUser.Id
		);
		return addrBook;
	}

	// Type = Cart/Wishlist
	public static ccrz__E_Cart__c createCart(Account acct, ccrz__E_ContactAddr__c billToAddr, ccrz__E_ContactAddr__c shipToAddr, User portalUser, Contact portalContact, String cartType, String storefront){
		String cartName = 'Shopping Cart';

		ccrz__E_Cart__c cart = new ccrz__E_Cart__c(
			ccrz__Account__c = acct.Id,
			ccrz__ActiveCart__c = true,
			ccrz__BillTo__c = billToAddr.Id,
			ccrz__CartStatus__c = 'Open',
			ccrz__CartType__c = cartType,
			ccrz__Contact__c = portalContact.Id,
			ccrz__BuyerFirstName__c = portalContact.Firstname,
			ccrz__BuyerLastName__c = portalContact.Lastname,
			ccrz__Name__c = cartName,
			ccrz__ShipTo__c = shipToAddr.Id,
			ccrz__Storefront__c = storefront,
            ccrz__CurrencyISOCode__c = 'USD',
			ccrz__User__c = portalUser.Id
		);

		return cart;
	}

	public static ccrz__E_CartItem__c createCartItem(ccrz__E_Cart__c cart, Decimal price, Decimal quantity, ccrz__E_Product__c product, ccrz__E_CartItem__c parentCartItem){
		ccrz__E_CartItem__c cartItem = new ccrz__E_CartItem__c(
			ccrz__Cart__c = cart.Id,
			ccrz__Price__c = price,
			ccrz__Quantity__c = quantity,
			ccrz__SubAmount__c = price * quantity,  
			ccrz__CartItemType__c = product.ccrz__ProductType__c, // Major/Minor/Coupon
			ccrz__ProductType__c = product.ccrz__ProductType__c, // Major/Minor/Coupon
			ccrz__Product__c = product.Id,
			ccrz__UnitOfMeasure__c = 'Each',
			ccrz__ItemStatus__c = 'Available'
		);
		if(parentCartItem != null){
			cartItem.ccrz__ParentCartItem__c = parentCartItem.Id;
		}
		return cartItem;
	}

	/*
	public static ccrz__E_ProductMedia__c createProductMedia(Id parentId, Boolean enabled, String description, String alt_message, String media_type, String product_media_source){
	    	ccrz__E_ProductMedia__c pm = new ccrz__E_ProductMedia__c  ();

	    	if(parentId != null){
	    		pm.ccrz__Product__c = parentId;
	    		pm.ccrz__AltMessage__c = alt_message;
	    		pm.ccrz__Enabled__c = enabled;
	    		pm.ccrz__MediaType__c = media_type;
	    		pm.ccrz__ProductMediaSource__c = product_media_source;
	    		pm.ccrz__ProductDescription__c = description;
	    	}
	    	return pm;
	}
	*/
	/*
	public static ccrz__E_ProductMedia__c createProductMedia(ccrz__E_Product__c product, String mediaType) {
		ccrz__E_ProductMedia__c productMedia = new ccrz__E_ProductMedia__c(
			ccrz__Enabled__c = true,
			ccrz__MediaType__c = mediaType,
			ccrz__Product__c = product.id
			// ccrz__ProductMediaId__c = ''
		);
		return productMedia;
	}
	*/

	/*
	public static Attachment createAttachment(Id parentId, Blob body, String title, String description, String content_type){
	    	Attachment a = new Attachment(ParentId = parentId, Name = title);

	    	if(parentId != null){
	    		a.Description = description;
	    		a.ContentType = content_type;
	    		a.Body = body;
	    	}
	    	return a;
	}
	*/

	/*
	public static Attachment createAttachment(String name, SObject parent) {
		Attachment attachment = new Attachment(
			Body = Blob.valueOf('attachment body'),
			Name = name,
			ParentId = parent.id
		);
		return attachment;
	}
	

	public static User createAndInsertUserObjects(){
		Profile p = getCustomerCommunityProfile();

        ccrz__E_AccountGroup__c ag = createAccountGroup('grpName');
        insert ag;

        Account a = createAccount(ag);
        insert a;

		Contact c = createContact(a, 'testuser@bearnaked.com');
		insert c;

		User u = createUser(p, c, 'testuser@bearnaked.com', 'testuser@bearnaked.com', 'Test', 'User', 'tusr');
		insert u;

		return u;
	}

	public static ccrz__E_Category__c createCategory(String categoryId) {
		ccrz__E_Category__c category = new ccrz__E_Category__c(
			ccrz__CategoryID__c = categoryId
		);
		return category;
	}

	public static ccrz__E_ProductCategory__c createProductCategory(ccrz__E_Product__c product, String productCategoryId, ccrz__E_Category__c category) {
		ccrz__E_ProductCategory__c productCategory = new ccrz__E_ProductCategory__c (
			ccrz__Category__c = category.id,
			ccrz__Product__c = product.id,
			ccrz__ProductCategoryId__c = productCategoryId
		);
		return productCategory;
	}

	/*
	public static ccrz__E_OrderItem__c createOrderItem(Id orderId, String orderItemId, String lineType, Id productId, Id parentOrderItemId, Id parentProductId, Decimal price, Decimal quantity, Decimal subAmount){
		ccrz__E_OrderItem__c oi = new ccrz__E_OrderItem__c();
		oi.ccrz__Order__c = orderId;
		oi.ccrz__OrderItemId__c = orderItemId;
		oi.ccrz__OrderLineType__c = lineType;
		oi.ccrz__Product__c = productId;
		oi.ccrz__ParentOrderItem__c = parentOrderItemId;
		oi.ccrz__ParentProduct__c = parentProductId;
		oi.ccrz__Price__c = price;
		oi.ccrz__Quantity__c = quantity;
		oi.ccrz__SubAmount__c = subAmount;
		return oi;
	}
	

	public static ccrz__E_Order__c createOrder(Id cartId, Id accountId, Id contactId, Id ownerId, Id shipToId, Id billToId){
		ccrz__E_Order__c theOrder = new ccrz__E_Order__c();
		theOrder.ccrz__OriginatedCart__c = cartId;
		theOrder.ccrz__Account__c = accountId;
		theOrder.ccrz__Contact__c = contactId;
		theOrder.OwnerId = ownerId;
		theOrder.ccrz__ShipTo__c = shipToId;
		theOrder.ccrz__BillTo__c = billToId;
		return theOrder;

	}
	
	public static ccrz__E_TransactionPayment__c createTransactionPayment(Id orderId, String uid){
		ccrz__E_TransactionPayment__c tp = new ccrz__E_TransactionPayment__c();
		tp.ccrz__CCOrder__c = orderId;
		tp.ccrz__TransactionPaymentId__c = uid;

//		tp.Transaction_End__c = '';
		tp.ccrz__Amount__c = 1.0;
		tp.ccrz__AccountNumber__c = 'abc';
		tp.ccrz__AccountType__c = 'abc';
//		tp.Approval_Code__c = 'abc';
//		tp.Credit_Card_Type__c = 'Visa';
		tp.ccrz__TransactionCode__c = 'tcode';
		tp.ccrz__ExpirationMonth__c = 12;
		tp.ccrz__ExpirationYear__c = 2016;
//		tp.CVV_Match__c = 'M';
//		tp.AVS_Match__c = 'M';

		return tp;
	}

	/*
    public static void globalFooterSetupTestData() {
        ccrz__E_AccountGroup__c testAccountGroup = cc_ava_testUtils.createAccountGroup('testAccountGroup');

        Account testAccount = new Account(
            Name                    = 'TEST_ACCOUNT',
            ccrz__E_AccountGroup__c = testAccountGroup.Id,
            OwnerId                 = UserInfo.getUserId(),
            Type                    = 'Customer',
            BillingStreet           = globalFooterGenerateRandomString(32),
            BillingCity             = globalFooterGenerateRandomString(32)
        );
        insert testAccount;

        Contact contactCC = new Contact(
            FirstName            = 'CloudCraze',
            LastName             = 'TestUser',
            AccountId            = testAccount.Id
        );
        insert contactCC;

        Profile profile = [SELECT
                                Id
                            FROM
                                Profile
                            WHERE
                                Name = :DEFAULT_COMMUNITY_PROFILE LIMIT 1];

        User testOwner = [SELECT
                                TimeZoneSidKey
                                , UserRoleId
                            FROM
                                User
                            WHERE
                                Id = :UserInfo.getUserId()];

        String emailAddress = String.valueOf(System.now().getTime() + '@cc-test.mail');
        globalFooterTestUser = new User(
            Alias                    = 'cctest',
            Email                    = emailAddress,
            EmailEncodingKey         = 'UTF-8',
            LastName                 = 'TestUser',
            LanguageLocaleKey        = 'en_US',
            LocaleSidKey             = 'en_US',
            ProfileId                = profile.Id,
            TimeZoneSidKey           = testOwner.TimeZoneSidKey,
            Username                 = emailAddress,
            isActive                 = true,
            ContactId                = contactCC.Id,
            Contact                  = contactCC,
            ccrz__CC_CurrencyCode__c = 'USD'
        );
        insert globalFooterTestUser;
    }
    */

    /*
    public static String globalFooterGenerateRandomString(Integer len) {
        final String RANDOM_CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        String returnValue = '';
        Integer random;
        do {
            random = Math.mod(Math.abs(Crypto.getRandomInteger()),RANDOM_CHARS.length());
            returnValue += RANDOM_CHARS.substring(random,random + 1);
        } while (returnValue.length() < len);

        return returnValue;
    }
    


	public static ccrz__E_Order__c emailOrderTestOrder;
	/*
	public static void emailOrdersetupTestData() {
		cc_ava_testUtils.initData();

		ccrz__E_ContactAddr__c shippingAddress = new ccrz__E_ContactAddr__c(
			ccrz__FirstName__c         = 'firstname'
			, ccrz__LastName__c          = 'lastname'
			, ccrz__AddressFirstline__c  = 'firstline'
			, ccrz__AddressSecondline__c = 'secondline'
			, ccrz__City__c              = 'Chicago'
			, ccrz__State__c             = 'Illinois'
			, ccrz__StateISOCode__c      = 'IL'
			, ccrz__PostalCode__c        = '55555'
			, ccrz__Country__c           = 'US'
			, ccrz__HomePhone__c         = '555-555-5555'
		);
		insert shippingAddress;

		emailOrderTestOrder = new ccrz__E_Order__c(
			ccrz__EncryptedId__c = 'encryptedorderid'
			, ccrz__ShipTo__c    = shippingAddress.Id
		);
		insert emailOrderTestOrder;

		List<ccrz__E_OrderItem__c> orderItems = new List<ccrz__E_OrderItem__c> {
			new ccrz__E_OrderItem__c(
				ccrz__Quantity__c    = 1
				, ccrz__Price__c     = 9.99
				, ccrz__SubAmount__c = 9.99
				, ccrz__Order__c     = emailOrderTestOrder.Id
				, ccrz__ProductType__c = 'Bundle'
			),
			new ccrz__E_OrderItem__c(
				ccrz__Quantity__c    = 1
				, ccrz__Price__c     = 9.99
				, ccrz__SubAmount__c = 9.99
				, ccrz__Order__c     = emailOrderTestOrder.Id
				, ccrz__ProductType__c = 'Dynamic Kit'
			)
		};
		insert orderItems;
	}
	*/


	/*
	public static void checkoutTestSetupTestData() {
        ccrz__E_AccountGroup__c checkoutTest_testAccountGroup = cc_ava_testUtils.createAccountGroup('testAccountGroup');

        checkoutTest_testAccount = new Account(
            Name                    = 'TEST_ACCOUNT',
            ccrz__E_AccountGroup__c = checkoutTest_testAccountGroup.Id,
            OwnerId                 = UserInfo.getUserId(),
            Type                    = 'Customer',
            BillingStreet           = checkoutTestGenerateRandomString(32),
            BillingCity             = checkoutTestGenerateRandomString(32)
        );
        insert checkoutTest_testAccount;

        checkoutTest_testContact = new Contact(
            FirstName            = 'CloudCraze',
            LastName             = 'TestUser',
            AccountId            = checkoutTest_testAccount.Id
        );
        insert checkoutTest_testContact;

        Profile profile = [SELECT
                                Id
                            FROM
                                Profile
                            WHERE
                                Name = :DEFAULT_COMMUNITY_PROFILE LIMIT 1];

        User testOwner = [SELECT
                                TimeZoneSidKey
                                , UserRoleId
                            FROM
                                User
                            WHERE
                                Id = :UserInfo.getUserId()];

        checkoutTest_emailAddress = String.valueOf(System.now().getTime() + '@cc-test.mail');
        checkoutTest_testUser = new User(
            Alias                    = 'cctest',
            Email                    = checkoutTest_emailAddress,
            EmailEncodingKey         = 'UTF-8',
            LastName                 = 'TestUser',
            LanguageLocaleKey        = 'en_US',
            LocaleSidKey             = 'en_US',
            ProfileId                = profile.Id,
            TimeZoneSidKey           = testOwner.TimeZoneSidKey,
            Username                 = checkoutTest_emailAddress,
            isActive                 = true,
            ContactId                = checkoutTest_testContact.Id,
            Contact                  = checkoutTest_testContact,
            ccrz__CC_CurrencyCode__c = 'USD'
        );
        insert checkoutTest_testUser;
    }
    */

    /*
    public static String checkoutTestGenerateRandomString(Integer len) {
        final String RANDOM_CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        String returnValue = '';
        Integer random;
        do {
            random = Math.mod(Math.abs(Crypto.getRandomInteger()),RANDOM_CHARS.length());
            returnValue += RANDOM_CHARS.substring(random,random + 1);
        } while (returnValue.length() < len);

        return returnValue;
    }
    */

    /*
	public static ccrz__E_ContactAddr__c checkoutTestGetContactAddress() {
        return new ccrz__E_ContactAddr__c(
            ccrz__AddressFirstline__c = '100 Pine Street',
            ccrz__City__c             = 'SmallTown',
            ccrz__DaytimePhone__c     = '(847) 555-1212',
            ccrz__FirstName__c        = 'Test',
            ccrz__HomePhone__c        = '(847) 555-1212',
            ccrz__LastName__c         = 'User',
            ccrz__PostalCode__c       = '60601',
            ccrz__State__c            = 'Idaho',
            ccrz__StateISOCode__c     = 'ID',
            ccrz__CountryISOCode__c   = 'USA'
        );
    }
    

	public static String checkoutTest_emailAddress;
	public static Account checkoutTest_testAccount;
	public static Contact checkoutTest_testContact;
    public static User checkoutTest_testUser;



//TEMPORARILY HIDE
  //  public static cc_imp_StorefrontSettings__c createAvalaraCustomSetting()
  //  {
  //  	cc_imp_StorefrontSettings__c avalaraCustomSetting = new cc_imp_StorefrontSettings__c(
  //  		Name='AvalaraStore',
		//  	Profile_Name__c = AVA_GUEST_USER_COMMUNITY_PROFILE,
		//  	Default_CSR_Queue_Name__c = 'Customer_Portal_Support',
		//  	ProspectSalesOrg__c = 'Portal Sales Org',
		//  	Division__c = 'Portal Division',
		//  	DistributionChannel__c = 'Portal Distribution Channel',
		//  	SalesDistrict__c = 'Portal Sales District',
		//  	SalesOffice__c = 'Portal Sales Office',
		//  	SalesGroup__c = 'Portal Sales Group',
  //          RecordTypeName__c = 'Portal_Prospect',
		//	ContactRecordTypeName__c = 'Portal_Contact',
		//	ViewCreditHistoryURLPath__c = 'sap/bc/zsd_credit_hist',
		//	MyInvoiceEndpointURLPath__c = 'sap/bc/zsd_invoice',
		//	VATValidatorEndpointURLPath__c = 'http://ec.europa.eu/taxation_customs/vies/services/checkVatTestService'
		//	);

  //  	return avalaraCustomSetting;
  //  }


  //public static cc_imp_StorefrontSettings__c createAvalaraCustomSetting()
  //  {
  //  	cc_imp_StorefrontSettings__c avalaraCustomSetting = new cc_imp_StorefrontSettings__c( name='avalara',
		//  	Profile_Name__c = AVA_GUEST_USER_COMMUNITY_PROFILE,
		//  	VATValidatorEndpointURLPath__c = 'http://ec.europa.eu/taxation_customs/vies/services/checkVatTestService',
  //          RecordTypeName__c = 'Portal_Prospect',
  //          ContactRecordTypeName__c = 'Portal_Contact'
  //          );

  //  	return avalara3DCustomSetting;
  //  }



  //public static List<cc_imp_StorefrontSettings__c> createAvalaraCustomSettingList()
  //  {
  //  	List <cc_imp_StorefrontSettings__c > storeFrontSettingsList = new List <cc_imp_StorefrontSettings__c>();

  //  	storeFrontSettingsList.add(createAvalaraCustomSetting());
  //  	storeFrontSettingsList.add(createAvalaraCustomSetting());
    	
  //  	return storeFrontSettingsList;
  //  }


    public static void clearContext()
	{
	   ccrz.cc_CallContext.currAccountId = null;
	   ccrz.cc_CallContext.currContact = null;
	   ccrz.cc_CallContext.storefront = null;
    }

    public static ccrz.cc_RemoteActionContext createRemoteActionContext() {
        ccrz.cc_RemoteActionContext myRemoteContext = new ccrz.cc_RemoteActionContext();
        myRemoteContext.storefront = TEST_AVALARASTORE_STOREFRONT;
        myRemoteContext.userLocale = 'en_US';
        myRemoteContext.userIsoCode='USD';
        //myRemoteContext.storeFrontSettings = new Map<String,Object>{'DefaultLocale__c' => 'en_US'};
        //myRemoteContext.currAccount = userAccount;
        //myRemoteContext.currUserId = portalUser.id;
        //myRemoteContext.currUser = portalUser;
        //myRemoteContext.currentCartId = '';
        //myRemoteContext.currentPageName = 'ccrz__CCPage';
        ////myRemoteContext.currentPageURL = 'https://ccjohn-avalaracommunity.cs52.force.com/AvalaraStore/ccrz__CCPage?pageKey=configflow&sku=' + myDynamicKitSku + '&refURL=http%3A%2F%2Fccjohn-avalaracommunity.cs52.force.com%2FAvalaraStore%2Fccrz__CCPage';
        //myRemoteContext.effAccountId = '';
        //myRemoteContext.priceGroupId = '';
        Map<String,String> myQueryParamMap = new Map<String,String>{
            //'pageKey' => 'configflow',
            'sku' => myDynamicKitSku
        };
        myRemoteContext.queryParams = myQueryParamMap;
        //myRemoteContext.storefront = myStorefront;
        //myRemoteContext.userIsoCode = 'USD';
        //myRemoteContext.userLocale = 'en_US';

        return myRemoteContext;
    }

    public static String createCartAnonymous() {

        String cartEncId = 'NO CART ID';

        Savepoint sp = Database.setSavepoint();
        Boolean wasSuccessful = false;
         
        // The parent.
        ccrz.ccApiCart.LineData pLine = new ccrz.ccApiCart.LineData();
        pLine.quantity = 1;
        pLine.sku = myDynamicKitSku;
        pLine.label = 'OddKit';
         
        // Kit items.
        ccrz.ccApiCart.LineData pLine1 = new ccrz.ccApiCart.LineData();
        pLine1.quantity = 1;
        pLine1.sku = myBasicSOHOSku;
        pLine1.parentSku = myDynamicKitSku;
         
        ccrz.ccApiCart.LineData pLine2 = new ccrz.ccApiCart.LineData();
        pLine2.quantity = 1;
        pLine2.sku = myReturnsSku;
        pLine2.parentSku = myDynamicKitSku;
         
        ccrz.ccApiCart.LineData pLine3 = new ccrz.ccApiCart.LineData();
        pLine3.quantity = 1;
        pLine3.sku = myIntegrationSku1;
        pLine3.parentSku = myDynamicKitSku;
         
         
        //Add the Kit Items to the parent as minor items
        pLine.minorItems = new List<ccrz.ccApiCart.LineData>{ pLine1, pLine3 };
         
         
          Map<String,Object> inputData = new Map<String,Object>{
              ccrz.ccApi.API_VERSION => 4, // Version 1,2,3 support dynamic kits in a different format.
              ccrz.ccApiCart.LINE_DATA => new List<ccrz.ccApiCart.LineData>{ pLine }
          };
         
            Map<String,Object> addResults = ccrz.ccApiCart.addTo(inputData);
          
            //General check, since the cart id will be blank if not successful we technically do not need this.
            wasSuccessful = (Boolean) addResults.get(ccrz.ccApi.SUCCESS);

            cartEncId = (String)addResults.get(ccrz.ccApiCart.CART_ENCID);
            
            return cartEncId;
    }*/


}