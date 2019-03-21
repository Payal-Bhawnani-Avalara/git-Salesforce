@isTest
private class cc_Ava_ctrl_ConfigFlowTest {

	/*@testSetup static void createData() {
		cc_ava_testUtils.initData();
	}

	@isTest static void testProductConfiguration() {

		ccrz.cc_RemoteActionContext context = cc_ava_testUtils.createRemoteActionContext();
		ccrz.cc_RemoteActionResult result = ccrz.cc_CallContext.init(context);
        System.debug('ctx in testProductConfiguration: ' + context);
        
        Map<String, Object> productsToFetch = new Map<String, Object>{
            ccrz.ccapi.API_VERSION => ccrz.ccApi.CURRENT_VERSION,
            ccrz.ccApiProduct.PRODUCTSKULIST => new List<String>{'testsku'},
            ccrz.ccapi.SIZING => new Map<String, Object>{
            	ccrz.ccApiProduct.ENTITYNAME => new Map<String, Object>{
            		ccrz.ccApi.SZ_DATA => ccrz.ccApi.SZ_L
            	}
            },
            ccrz.ccApiProduct.PARAM_INCLUDE_PRICING => true
        };
        System.debug('product fetch request: ' + productsToFetch);
    	Map<String, Object> productData = ccrz.ccApiProduct.fetch(productsToFetch);
    	System.debug('productData: ' + productData);

	}
	
	@isTest static void testAvaCtrlConfigFlow_fetchCompositeProducts() {
		//signature: ccrz.cc_RemoteActionResult fetchCompositeProducts(ccrz.cc_RemoteActionContext ctx, List<String> productSkus) {

		ccrz.cc_RemoteActionContext context = cc_ava_testUtils.createRemoteActionContext();

		List<String> skuList = new List<String>();
		skuList.add(cc_ava_testUtils.myDynamicKitSku);

		//for debugging
		//List<ccrz__E_PriceListItem__c> plfordk = [select id, ccrz__Product__r.ccrz__SKU__c from ccrz__E_PriceListItem__c where ccrz__Product__r.ccrz__SKU__c = :cc_ava_testUtils.myDynamicKitSku];
		//System.debug('how many pricelistitems for dynamic kit: ' + plfordk.size());
		//List<ccrz__E_PriceListItem__c> plforbs = [select id, ccrz__Product__r.ccrz__SKU__c from ccrz__E_PriceListItem__c where ccrz__Product__r.ccrz__SKU__c = :cc_ava_testUtils.myBasicSOHOSku];
		//System.debug('how many pricelistitems for basic/soho: ' + plforbs.size());
		//List<ccrz__E_PriceListItem__c> plforr = [select id, ccrz__Product__r.ccrz__SKU__c, ccrz__Pricelist__r.Name, ccrz__Price__c, ccrz__SubProdTerm__r.ccrz__Name__c, ccrz__RecurringPrice__c, ccrz__Pricelist__r.ccrz__CurrencyISOCode__c, ccrz__Pricelist__r.ccrz__Enabled__c, ccrz__Pricelist__r.ccrz__StartDate__c, ccrz__Pricelist__r.ccrz__EndDate__c, ccrz__Pricelist__r.ccrz__Storefront__c from ccrz__E_PriceListItem__c where ccrz__Product__r.ccrz__SKU__c = :cc_ava_testUtils.myReturnsSku];
		//System.debug('how many pricelistitems for returns: ' + plforr.size());
		//System.debug('all pricelistitems for returns: ' + JSON.serialize(plforr));
		//List<ccrz__E_PriceListItem__c> plfori1 = [select id, ccrz__Product__r.ccrz__SKU__c from ccrz__E_PriceListItem__c where ccrz__Product__r.ccrz__SKU__c = :cc_ava_testUtils.myIntegrationSku1];
		//System.debug('how many pricelistitems for integration 1: ' + plfori1.size());
		//List<ccrz__E_PriceListItem__c> plfori2 = [select id, ccrz__Product__r.ccrz__SKU__c from ccrz__E_PriceListItem__c where ccrz__Product__r.ccrz__SKU__c = :cc_ava_testUtils.myIntegrationSku2];
		//System.debug('how many pricelistitems for integration 2: ' + plfori2.size());

		ccrz.cc_RemoteActionResult myCompositeProducts = cc_Ava_ctrl_ConfigFlow.fetchCompositeProducts(context, skuList);
		List<cc_Ava_ctrl_ConfigFlow.groupWithProducts> groups = (List<cc_Ava_ctrl_ConfigFlow.groupWithProducts>)myCompositeProducts.data;

		//there should be four groups: Product, Integrations, Add-ons, Tier
		System.assertEquals(4,groups.size());

		//maxSubPrice for each product should be $10
		for(cc_Ava_ctrl_ConfigFlow.groupWithProducts g : groups) {
			for(cc_Ava_ctrl_ConfigFlow.groupableProduct gp : g.productsThisGroupOnly) {
				Map<String,Object> piMap = (Map<String,Object>)gp.productInfo;
				System.assertEquals(10,piMap.get('maxSubPrice'));
			}
		}

	}

	@isTest static void testAvaCtrlConfigFlow_addConfiguredProductToCart() {
		//signature: ccrz.cc_RemoteActionResult addConfiguredProductToCart(ccrz.cc_RemoteActionContext ctx, String dynamicKitSku, String componentProducts, String selectedTierId, String selectedBillingFrequency, String leadInfoJSON)
	
		User guestUser = [select Id from User where Email=:cc_ava_testUtils.myGuestEmail];
		System.runAs(guestUser){
		
				ccrz.cc_RemoteActionContext context = cc_ava_testUtils.createRemoteActionContext();
				ccrz.cc_RemoteActionResult myCompositeProducts = cc_Ava_ctrl_ConfigFlow.fetchCompositeProducts(context, new List<String>{cc_ava_testUtils.myDynamicKitSku});
		
				List<cc_Ava_ctrl_ConfigFlow.groupWithProducts> componentProducts = (List<cc_Ava_ctrl_ConfigFlow.groupWithProducts>)myCompositeProducts.data;
				System.debug('componentProducts: ' + componentProducts);
				//this is not *quite* what the object looks like on the actual page; TO DO: reconstruct that object slightly differently
				String componentProductString = JSON.serialize(myCompositeProducts.data);
				System.debug('componentproductstring return from fetch: ' + componentProductString);
				String mySelectedTierId;
		
				List<groupWithProductsLocal> myProducts = new List<groupWithProductsLocal>();
				//transform into format expected by addConfiguredProductToCart
				//we HAVE a List<groupWithProducts> where productsThisGroupOnly is a LIST
				//we WANT a List<groupWithProducts> where productsThisGroupOnly is an OBJECT
				//so for each groupWithProducts, i need to transform a LIST into an OBJECT..so just create a wrapper object replace List<groupableProduct> with with groupableProduct?
				for(cc_Ava_ctrl_ConfigFlow.groupWithProducts g : componentProducts) {
					groupWithProductsLocal temp = new groupWithProductsLocal(); 
						temp.groupName = g.groupName;
						temp.productsThisGroupOnly = g.productsThisGroupOnly[0];
					myProducts.add(temp);
				}
				System.debug('resulting mock myProducts: ' + myProducts);
				String myProductsString = JSON.serialize(myProducts);
				System.debug('stringified: ' + myProductsString);
		
				//grab any tier
				for(cc_Ava_ctrl_ConfigFlow.groupWithProducts g : componentProducts) {
					if(g.groupName=='Tier') {
						for(cc_Ava_ctrl_ConfigFlow.groupableProduct gp : g.productsThisGroupOnly) {
							mySelectedTierId = gp.sfid;
						}
					}
				}
		
		
				System.debug('selectedtierid: ' + mySelectedTierId);
		
				String selectedBillingFrequency = 'Yearly';
				String leadInfoJSON = '{\"Lead_Interest_Prod_Services__c\" : \"AvaTax\",\"Lead_MethodContact__c\" : \"Webform T1\",\"Lead_Source_Most_Recent__c\" : \"Unknown Inbound\",\"Lead_Offer__c\" : \"Online Buying\",\"Lead_OpptSubType__c\" : \"SOHO\",\"Lead_WebProperty__c\" : \"store.avalara.com\",\"Lead_Source__c\" : \"Unknown Inbound\",\"Lead_CampaignId__c\" : \"70133000000e59bAAA\",\"Lead_PartnerId__c\" : \"\"}';
		
		
				ccrz.cc_RemoteActionResult result = cc_Ava_ctrl_ConfigFlow.addConfiguredProductToCart(context, cc_ava_testUtils.myDynamicKitSku, myProductsString, mySelectedTierId, selectedBillingFrequency, leadInfoJSON);
											//addConfiguredProductToCart(ccrz.cc_RemoteActionContext ctx, String dynamicKitSku, String componentProducts, String selectedTierId, String selectedBillingFrequency, String leadInfoJSON)
				System.debug('addconfiguredproducttocart result:' + result);

				System.assert(result.success);

				//only one cart
				List<Object> cartList = (List<Object>)result.data;
				Map<String,Object> onlyCart = (Map<String,Object>)cartList[0];
				//Map<String,Object> onlyCart = (Map<String,Object>)cartList2[0];
				List<Object> cartItems = (List<Object>)onlyCart.get('ECartItemsS');

				//check whether cart got all items in proper (major and minor) manner corresponding to avalara product model
				Integer majorCount=0;
				Integer minorCount=0;
				for(Object ci : cartItems) {
					Map<String,Object> thisCi = (Map<String,Object>)ci;
					if(thisCi.get('cartItemType')=='Major'){
						majorCount++;
					} else if(thisCi.get('cartItemType')=='Minor') {
						minorCount++;
					}
				}

				//there should be two majoritems (one for dynamic kit, one for returns) and three minoritems (one for the selecdted tier, one for each of the two integrations create in test data setup)
				//System.assertEquals(2, majorCount);
				//System.assertEquals(3, minorCount);

		
		
		//BEGIN WORKING SIMPLE ADDTOCART
		//		ccrz__E_Product__c selectedTier = [select Id, Name, Corresponding_Price_Group__r.Id, Number_of_Transactions__c, ccrz__SKU__c from ccrz__E_Product__c where Id = :mySelectedTierId];
		//	    String selectedPriceGroupId = (String)selectedTier.Corresponding_Price_Group__r.Id;
		//	    System.debug('selectedPriceGroupId: ' + selectedPriceGroupId);
		
		//		//we'll add the tier sku to the cart in order to convert it to an opportunityproduct later
		//		String selectedTierSku = (String)selectedTier.ccrz__SKU__c;
		//		context.priceGroupId = selectedPriceGroupId;
		
		//		ccrz.cc_RemoteActionResult result = ccrz.cc_CallContext.init(context);
		
		
		//		ccrz.ccApiCart.LineData lineItemPlain = new ccrz.ccApiCart.LineData();
		//		lineItemPlain.quantity = 1;
		//		lineItemPlain.sku = cc_ava_testUtils.myReturnsSku;
		
		//		//ccrz.ccApiCart.LineData lineItemReturns = new ccrz.ccApiCart.LineData();
		//		//lineItemReturns.quantity = 1;
		//		//lineItemReturns.sku = cc_ava_testUtils.myReturnsSku;
		
		//		//lineItemPlain.minorItems = new List<ccrz.ccApiCart.LineData>();
		//		//lineItemPlain.minorItems.add(lineItemReturns);
		
		
		
		//		//initialize list of cccart line items
		//		List<ccrz.ccApiCart.LineData> lineItemsToAdd = new List<ccrz.ccApiCart.LineData>();
				
		//		lineItemsToAdd.add(lineItemPlain);
		
		//		Map<String,Object> addToCartRequest = new Map<String,Object>{
		//		ccrz.ccapi.API_VERSION => ccrz.ccApi.CURRENT_VERSION,
		//			ccrz.ccApiCart.LINE_DATA => lineItemsToAdd,
		//			ccrz.ccApi.SIZING => new Map<String,Object>{
		//				ccrz.ccApiCart.ENTITYNAME => new Map<String,Object>{
		//					ccrz.ccApi.SZ_REFETCH => TRUE
		//				}
		//			}
		//		};
		
		//		System.debug('addToCartRequest: ' + addToCartRequest);
		//		Map<String,Object> newCartLineItems = ccrz.ccApiCart.addTo(addToCartRequest);
		//		system.debug('newCartLineItems for just plain product: ' + newCartLineItems);
		////END WORKING SIMPLE ADDTOCART
}

	}

	public class groupWithProductsLocal {
		public String groupName;
		public cc_Ava_ctrl_ConfigFlow.groupableProduct productsThisGroupOnly;
	}

	//2017-05-31 commenting out market template tests for now
	@isTest static void testAvaCtrlConfigFlow_verifyAddress() {
		//signature: ccrz.cc_RemoteActionResult verifyAddress(ccrz.cc_RemoteActionContext ctx, avaVerifiableAddress addressToVerify) {

		ccrz.cc_RemoteActionContext context = cc_ava_testUtils.createRemoteActionContext();

Map<String, Object> module = new Map<String, Object> { 'Name'=>'CC Avalara', 'APIName'=>'ccava' };
List<Map<String,Object>> metas = new List<Map<String,Object>>();
// ccava.credentials
metas.add(new Map<String, Object> {
    'Name'=>'AvaTax 15 API Named Credentials',
    'Description'=>'test',
    'APIName'=>'credentials',
    'ExternallySafe'=>false,
    'Configurations'=> new List<Map<String, Object>> {
        new Map<String,Object> {
            'TextValue'=>'Avalara_Development',
            'Storefront'=>'Global',
            'PageName'=>'all',
            'Name'=>'Global.all.ccava.credentials'
        }
    }
});
// ccava.companycode
metas.add(new Map<String, Object> {
    'Name'=>'Avalara CompanyCode',
    'Description'=>'test',
    'APIName'=>'companycode',
    'ExternallySafe'=>false,
    'Configurations'=> new List<Map<String, Object>> {
        new Map<String,Object> {
            'TextValue'=>'Ava',
            'Storefront'=>'Global',
            'PageName'=>'all',
            'Name'=>'Global.all.ccava.companycode'
        }
    }
});
module.put('ConfigurationMetas', metas);

ccrz.ccApiConfig.setBulk(new Map<String,Object> { 'version'=>1, 'configJSON'=>JSON.serialize(new List<Object> { module }) });

		Map<String,Object> config = ccrz.ccApiConfig.fetch(new Map<String,Object>{
			ccrz.ccAPIConfig.STORE_NAME => 'AvalaraStore',
			ccrz.ccAPIConfig.CONFIG_MODULE => 'ccava',
			'version' => 1,
			ccrz.ccAPIConfig.USE_CACHE => false
		});

		System.debug('config: ' + config);

		cc_Ava_ctrl_ConfigFlow.avaVerifiableAddress addressReal = new cc_Ava_ctrl_ConfigFlow.avaVerifiableAddress();
		addressReal.Line1 = '124 Fidelity Street';
		addressReal.Line2 = 'Apt. 5';
		addressReal.City = 'Carrboro';
		addressReal.Region = 'NC';
		addressReal.PostalCode = '27510';
		addressReal.Country = 'US';

				Test.setMock(HttpCalloutMock.class, new cc_ava_AddressMockValid());
			Test.startTest();
				ccrz.cc_RemoteActionResult verifyResultReal = cc_Ava_ctrl_ConfigFlow.verifyAddress(context, addressReal);
				System.debug('verifyResultReal: ' + verifyResultReal);
				//Test.setMock(HttpCalloutMock.class, new cc_avalara_AvaTax1InvalidAddrMock());
				//System.assertEquals(verifyResultReal);
				//ccrz.cc_RemoteActionResult verifyResultFake = cc_Ava_ctrl_ConfigFlow.verifyAddress(context, addressFake);
				//System.debug('verifyResultFake: ' + verifyResultFake);
			Test.stopTest();

	}
	
	@isTest static void testAvaCtrlConfigFlow_calculateTax() {
		//signature: ccrz.cc_RemoteActionResult calculateTax(ccrz.cc_RemoteActionContext ctx, String cartId)
	
		User guestUser = [select Id from User where Email=:cc_ava_testUtils.myGuestEmail];
		System.runAs(guestUser){

			testAvaCtrlConfigFlow_addConfiguredProductToCart();

			ccrz.cc_RemoteActionContext context = cc_ava_testUtils.createRemoteActionContext();

				//ccrz__E_ContactAddr__c addr = new ccrz__E_ContactAddr__c(
				//	ownerId = guestUser.Id,
				//	ccrz__AddressFirstline__c = '124 Fidelity Street',
				//	ccrz__AddressSecondline__c = 'Apt. 5',
				//	ccrz__AddressThirdline__c = '',
				//	ccrz__City__c = 'Carrboro',
				//	ccrz__State__c = 'NC',
				//	ccrz__Country__c = 'United States',
				//	ccrz__PostalCode__c = '27510'
				//);
				//insert addr;

				//Account anonAccount = [select Id, Name from Account where Name = 'CCAnonymous'][0];
				//System.debug('anon account in calculatetax test: ' + anonAccount);
				//Contact contact = [select Id, Email from Contact limit 1][0];
				//System.debug('random contact in calculatetax test: ' + contact);

				//ccrz__E_Cart__c cart = new ccrz__E_Cart__c(
				//	ccrz__ActiveCart__c = true,
				//	ccrz__CartStatus__c = 'Open',
				//	ccrz__CartType__c = 'Cart',
				//	ccrz__Name__c = 'My Cart',
				//	ccrz__Storefront__c = cc_ava_testUtils.TEST_AVALARASTORE_STOREFRONT,
		  //          ccrz__CurrencyISOCode__c = 'USD',
				//	ccrz__User__c = guestUser.Id,
				//	//ccrz__BillTo__c = addr.Id,
				//	//ccrz__ShipTo__c = addr.Id,
				//	ccrz__BuyerFirstName__c = 'Some',
				//	ccrz__BuyerLastName__c = 'Name',
				//	ccrz__ValidationStatus__c = 'CartAuthUserValidated',
				//	ccrz__Account__c = anonAccount.Id,
				//	ccrz__AnonymousId__c = true,
				//	ccrz__Contact__c = contact.Id
				//);
				//insert cart;

				//ccrz__E_Product__c rt = [select Id, ccrz__SKU__c, ccrz__ProductType__c, ccrz__Taxable__c from ccrz__E_Product__c where ccrz__SKU__c =:cc_ava_testUtils.myReturnsSku];
				//System.debug('returns product info in calculatetaxtest: ' + rt);

				//ccrz__E_CartItem__c cartItem = new ccrz__E_CartItem__c(
				//	ccrz__Cart__c = cart.Id,
				//	ccrz__Price__c = 10,
				//	ccrz__Quantity__c = 1,
				//	ccrz__SubAmount__c = 10,
				//	ccrz__CartItemType__c = 'Major',
				//	ccrz__ProductType__c = rt.ccrz__ProductType__c,
				//	ccrz__Product__c = rt.Id,
				//	ccrz__UnitOfMeasure__c = 'Each',
				//	ccrz__ItemStatus__c = 'Available',
				//	ccrz__StoreID__c = cc_ava_testUtils.TEST_AVALARASTORE_STOREFRONT
				//);
				//insert cartItem;

			ccrz__E_Cart__c cart = [select Id, ccrz__EncryptedId__c from ccrz__E_Cart__c limit 1][0];
			String cartEncId = (String)cart.ccrz__EncryptedId__c;

			//Map<String,Object> repriceCartRequest = new Map<String,Object>{
	  //          ccrz.ccapi.API_VERSION => ccrz.ccApi.CURRENT_VERSION,
			//	ccrz.ccApiCart.CART_ENCID => cartEncId
			//};

			//Map<String,Object> repricedCart = ccrz.ccApiCart.price(repriceCartRequest);
			//System.debug('repricedCart return: ' + repricedCart);

				Test.setMock(HttpCalloutMock.class, new cc_ava_TaxMock());
			Test.startTest();
				ccrz.cc_RemoteActionResult taxAmount = cc_Ava_ctrl_ConfigFlow.calculateTax(context, cart.Id);
	            ccrz__E_Cart__c myCart = [SELECT Id, ccrz__ValidationStatus__c, ccrz__SubtotalAmount__c, ccrz__TotalAmount__c, ccrz__TaxAmount__c, ccrz__TaxSubTotalAmount__c, ccrz__ShipTo__c, ccrz__BillTo__c, ccrz__Contact__c, ccrz__Account__c FROM ccrz__E_Cart__c WHERE Id=:cart.Id];
				List<ccrz__E_CartItem__c> myCartItems = [select Id, Name, ccrz__Cart__c, ccrz__ItemTotal__c from ccrz__E_CartItem__c where ccrz__Cart__c=:cart.Id];
				System.debug('return from calculateTax controller method: ' + taxAmount);
				System.debug('myCart after tax calculated: ' + myCart);
				System.debug('and its cartitems:' + myCartItems);
				//amount is from mock definition
            	//System.assertEquals(14.27, myCart.ccrz__TaxAmount__c);
			Test.stopTest();
		}
	}
	
	@isTest static void testAvaCtrlConfigFlow_placeOrder() {
		try{
		//signature: ccrz.cc_RemoteActionResult placeOrder(ccrz.cc_RemoteActionContext ctx, String cartEncId, String priceGroupId, String billingAddressJSON, String paymentToken)

		User guestUser = [select Id from User where Email=:cc_ava_testUtils.myGuestEmail];
		System.runAs(guestUser){


			ccrz.cc_RemoteActionContext context = cc_ava_testUtils.createRemoteActionContext();

			ccrz__E_ContactAddr__c addr = new ccrz__E_ContactAddr__c(
				ownerId = guestUser.Id,
				ccrz__AddressFirstline__c = '124 Fidelity Street',
				ccrz__AddressSecondline__c = 'Apt. 5',
				ccrz__AddressThirdline__c = '',
				ccrz__City__c = 'Carrboro',
				ccrz__State__c = 'NC',
				ccrz__Country__c = 'United States',
				ccrz__PostalCode__c = '27510'
			);
			insert addr;
			Test.setMock(HttpCalloutMock.class, new TestMockHttpResponseGenerator() );
			Account anonAccount = [select Id, Name from Account where Name = 'CCAnonymous'][0];
			System.debug('anon account in placeorder test: ' + anonAccount);
			Contact contact = [select Id, Email from Contact limit 1][0];
			System.debug('random contact in placeorder test: ' + contact);

			ccrz__E_Cart__c cart = new ccrz__E_Cart__c(
				ccrz__ActiveCart__c = true,
				ccrz__CartStatus__c = 'Open',
				ccrz__CartType__c = 'Cart',
				ccrz__Name__c = 'My Cart',
				ccrz__Storefront__c = cc_ava_testUtils.TEST_AVALARASTORE_STOREFRONT,
	            ccrz__CurrencyISOCode__c = 'USD',
				ccrz__User__c = guestUser.Id,
				ccrz__BillTo__c = addr.Id,
				ccrz__ShipTo__c = addr.Id,
				ccrz__BuyerFirstName__c = 'Some',
				ccrz__BuyerLastName__c = 'Name',
				ccrz__BuyerEmail__c = 'someplace@thing.com',
				ccrz__BuyerCompanyName__c = 'my company',
				ccrz__ValidationStatus__c = 'CartAuthUserValidated',
				ccrz__Account__c = anonAccount.Id,
				ccrz__AnonymousId__c = true,
				ccrz__Contact__c = contact.Id
			);
			insert cart;

			ccrz__E_Product__c dk = [select Id, ccrz__SKU__c, ccrz__ProductType__c from ccrz__E_Product__c where ccrz__SKU__c =:cc_ava_testUtils.myDynamicKitSku];
			ccrz__E_Product__c tierProd = [select Id, ccrz__SKU__c, ccrz__ProductType__c from ccrz__E_Product__c where Name = 'Tier 1'];

			ccrz__E_CartItem__c cartItemDk = new ccrz__E_CartItem__c(
				ccrz__Cart__c = cart.Id,
				ccrz__Price__c = 13.5,
				ccrz__Quantity__c = 1,
				ccrz__SubAmount__c = 13.5,  
				ccrz__CartItemType__c = 'Major',
				ccrz__ProductType__c = dk.ccrz__ProductType__c,
				ccrz__Product__c = dk.Id,
				ccrz__UnitOfMeasure__c = 'Each',
				ccrz__ItemStatus__c = 'Available',
				TransactionLevelId__c = tierProd.Id,
				ccrz__StoreID__c = cc_ava_testUtils.TEST_AVALARASTORE_STOREFRONT
			);
			insert cartItemDk;

			ccrz__E_CartItem__c cartItemTier = new ccrz__E_CartItem__c(
				ccrz__Cart__c = cart.Id,
				ccrz__Price__c = 0,
				ccrz__Quantity__c = 1,
				ccrz__SubAmount__c = 0,  
				ccrz__CartItemType__c = 'Minor',
				ccrz__ProductType__c = tierProd.ccrz__ProductType__c,
				ccrz__Product__c = tierProd.Id,
				ccrz__UnitOfMeasure__c = 'Each',
				ccrz__ItemStatus__c = 'Available',
				ccrz__StoreID__c = cc_ava_testUtils.TEST_AVALARASTORE_STOREFRONT,
				ccrz__ParentCartItem__c = cartItemDk.Id
			);
			insert cartItemTier;

	        System.debug('full cart: ' + cart);

	        ccrz__E_Cart__c thisCart = [select Id, ccrz__EncryptedId__c from ccrz__E_Cart__c where Id=:cart.Id];
			String cartEncId = (String)thisCart.ccrz__EncryptedId__c;
			System.debug('cartencid in placeorder test: ' + cartEncId);

			Map<String,Object> repriceCartRequest = new Map<String,Object>{
	            ccrz.ccapi.API_VERSION => ccrz.ccApi.CURRENT_VERSION,
				ccrz.ccApiCart.CART_ENCID => cartEncId
			};

			Map<String,Object> repricedCart = ccrz.ccApiCart.price(repriceCartRequest);
			System.debug('repricedCart return: ' + repricedCart);

			//check tier 1
			ccrz__E_PriceGroupPricelist__c pgpl = [select Id, Name, ccrz__PriceGroup__c, ccrz__Pricelist__r.Name, ccrz__PriceGroup__r.ccrz__GroupName__c from ccrz__E_PriceGroupPricelist__c where ccrz__Pricelist__r.Name = 'AvaTax Tier 1 Pricelist' limit 1];
			String priceGroupId = pgpl.ccrz__PriceGroup__c;
			System.debug('pricegroupis in placeorder test: ' + priceGroupId);

			String billingAddressJSON = '{\"FirstName\" : \"Robo\",\"LastName\" : \"Cop\",\"Company\" : \"Supercool Company Inc\",\"Address1\" : \"1234 Blah Street\",\"Address2\" : \"Suite 999\",\"Country\" : \"US\",\"Region\" : \"NC\",\"City\" : \"Chapel Hill\",\"PostalCode\" : \"27514\",\"Email\" : \"john.esposito@6st.robocop\",\"Phone\" : \"919-945-6789\"}';
			String paymentToken = 'oijerotjeoitjw54tiow5jrtowu346g3n948w9t';

			//ccrz.cc_util_Reflection.updatePageConfigurationEntry('Global.All.CO.cnfurl','ccrz__CCPage?pageKey=orderconfirmava', true);

			ccrz.cc_RemoteActionResult placeOrderResult = cc_Ava_ctrl_ConfigFlow.placeOrder(context, cartEncId, priceGroupId, billingAddressJSON, paymentToken);

			System.debug('PLACEORDER RETURN: ' + placeOrderResult);

			System.assertEquals(true, placeOrderResult.success);

			ccrz__E_Order__c myOrder = [select Id, ccrz__EncryptedId__c, ccrz__BuyerEmail__c, ccrz__CCEmailAddress__c, ccrz__TotalAmount__c from ccrz__E_Order__c limit 1][0];
			List<ccrz__E_OrderItem__c> itemsJustOrdered = [select ccrz__Order__r.ccrz__OriginatedCart__c, ccrz__Product__c, ccrz__Product__r.Name, ccrz__Product__r.ccrz__SKU__c, ccrz__SubProdTerm__c, CPQ_Quantity__c from ccrz__E_OrderItem__c where ccrz__Order__c = :myOrder.Id];
			System.debug('placed ccorder after placeOrder success:' + myOrder);

			System.assertEquals(13.5,myOrder.ccrz__TotalAmount__c);

		}
		}
		catch(Exception ex){}		
	}
	
	@isTest static void testAvaCtrlConfigFlow_removeItemFromCart() {
		//signature: ccrz.cc_RemoteActionResult removeItemFromCart(ccrz.cc_RemoteActionContext ctx, String cartEncId, String itemToRemoveId)
	}

	@isTest static void testAvaCtrlConfigFlow_matchEmail() {
		//signature: ccrz.cc_RemoteActionResult matchEmail(ccrz.cc_RemoteActionContext ctx, String emailAddress, String encCartId)

		User guestUser = [select Id from User where Email=:cc_ava_testUtils.myGuestEmail];
		System.runAs(guestUser){
		testAvaCtrlConfigFlow_addConfiguredProductToCart();

			ccrz.cc_RemoteActionContext context = cc_ava_testUtils.createRemoteActionContext();
			ccrz__E_Cart__c cart = [select Id, ccrz__EncryptedId__c from ccrz__E_Cart__c limit 1][0];
			String cartEncId = (String)cart.ccrz__EncryptedId__c;

			String emailContactExisting = 'contact@email.com';
			String emailLeadExists = 'this@isalead.com';
			String emailNotExists = 'this@person.doesnotexist.com';

			ccrz.cc_RemoteActionResult resultContactExisting = cc_Ava_ctrl_ConfigFlow.matchEmail(context, emailContactExisting, cartEncId);
			cc_Ava_ctrl_ConfigFlow.matchInfo myMatchContact = (cc_Ava_ctrl_ConfigFlow.matchInfo)resultContactExisting.data;
			System.debug('resultContactExisting data: ' + resultContactExisting.data);
			System.assertNotEquals(null,myMatchContact.matchedContact);
			//ccrz.cc_RemoteActionResult resultContactNew = cc_Ava_ctrl_ConfigFlow.matchEmail(context, emailContactNew, cartEncId);

			ccrz.cc_RemoteActionResult resultLeadExisting = cc_Ava_ctrl_ConfigFlow.matchEmail(context, emailLeadExists, cartEncId);
			System.debug('resultleadexisting: ' + resultLeadExisting);
			cc_Ava_ctrl_ConfigFlow.matchInfo myMatchLead = (cc_Ava_ctrl_ConfigFlow.matchInfo)resultLeadExisting.data;
			System.assertNotEquals(null,myMatchLead.matchedLead);

			ccrz.cc_RemoteActionResult resultNotExists = cc_Ava_ctrl_ConfigFlow.matchEmail(context, emailNotExists, cartEncId);
			System.debug('resultnotexists: ' + resultNotExists);
			System.assertEquals('no matched contacts', resultNotExists.data);

		}
	}

	@isTest static void testAvaCtrlConfigFlow_addContactInfoToCart() {
		//signature:  ccrz.cc_RemoteActionResult addContactInfoToCart(ccrz.cc_RemoteActionContext ctx, String cartEncId, String matchedContactJSON, String matchedLeadJSON, String shippingAddressJSON)

		ccrz.cc_RemoteActionContext context = cc_ava_testUtils.createRemoteActionContext();
		String cartEncId = cc_ava_testUtils.createCartAnonymous();
		
		Contact contact = [select Id, Email from Contact limit 1][0];
		Lead lead = [select Id, Email from Lead limit 1][0];
		String matchedContactId = contact.Id;
		String matchedLeadId = lead.Id;
		System.debug('contact: ' + contact);
		System.debug('lead: ' + lead);

		String shippingAddressJSON = '{\"FirstName\" : \"Robo\",\"LastName\" : \"Cop\",\"Company\" : \"Supercool Company Inc\",\"Address1\" : \"1234 Blah Street\",\"Address2\" : \"Suite 999\",\"Country\" : \"US\",\"Region\" : \"NC\",\"City\" : \"Chapel Hill\",\"PostalCode\" : \"27514\",\"Email\" : \"john.esposito@6st.robocop\",\"Phone\" : \"919-945-6789\"}';

		//scenario: user has previously matched email address to contact
		ccrz.cc_RemoteActionResult resultContact = cc_Ava_ctrl_ConfigFlow.addContactInfoToCart(context, cartEncId, matchedContactId, '', shippingAddressJSON);

		ccrz__E_Cart__c newCartContact = [select Id, ccrz__EncryptedId__c, ccrz__BuyerFirstName__c, ccrz__BuyerLastName__c, ccrz__BuyerEmail__c, ccrz__Contact__c, ccrz__Account__c from ccrz__E_Cart__c where ccrz__EncryptedId__c =:cartEncId][0];

		System.assertEquals('Test',newCartContact.ccrz__BuyerFirstName__c);
		System.assertEquals('User',newCartContact.ccrz__BuyerLastName__c);
		System.assertEquals('contact@email.com',newCartContact.ccrz__BuyerEmail__c);

		//scenario: user has previously matched email address to lead
		ccrz.cc_RemoteActionResult resultLead = cc_Ava_ctrl_ConfigFlow.addContactInfoToCart(context, cartEncId, '', matchedLeadId, shippingAddressJSON);

		ccrz__E_Cart__c newCartLead = [select Id, ccrz__EncryptedId__c, ccrz__BuyerFirstName__c, ccrz__BuyerLastName__c, ccrz__BuyerEmail__c from ccrz__E_Cart__c where ccrz__EncryptedId__c =:cartEncId][0];

		System.assertEquals('Thisperson',newCartLead.ccrz__BuyerFirstName__c);
		System.assertEquals('Isalead',newCartLead.ccrz__BuyerLastName__c);
		System.assertEquals('this@isalead.com',newCartLead.ccrz__BuyerEmail__c);

		//scenario: user has input email address that matches neither existing lead nor existing contact
		ccrz.cc_RemoteActionResult matchEmailResult = cc_Ava_ctrl_ConfigFlow.matchEmail(context,'john.esposito@6st.robocop',cartEncId);
		ccrz.cc_RemoteActionResult resultNoMatch = cc_Ava_ctrl_ConfigFlow.addContactInfoToCart(context, cartEncId, '', '', shippingAddressJSON);

		ccrz__E_Cart__c newCartNewContact = [select Id, ccrz__EncryptedId__c, ccrz__BuyerFirstName__c, ccrz__BuyerLastName__c, ccrz__BuyerEmail__c from ccrz__E_Cart__c where ccrz__EncryptedId__c =:cartEncId][0];

		System.assertEquals('Robo',newCartNewContact.ccrz__BuyerFirstName__c);
		System.assertEquals('Cop',newCartNewContact.ccrz__BuyerLastName__c);
		System.assertEquals('john.esposito@6st.robocop',newCartNewContact.ccrz__BuyerEmail__c);

	}

	@isTest static void testAvaCtrlConfigFlow_removeCart() {
		//signature: ccrz.cc_RemoteActionResult removeCart(ccrz.cc_RemoteActionContext ctx, String cartEncId)

		ccrz.cc_RemoteActionContext context = cc_ava_testUtils.createRemoteActionContext();
		ccrz__E_Cart__c cart = [select Id, ccrz__EncryptedId__c from ccrz__E_Cart__c limit 1][0];
		String cartEncId = (String)cart.ccrz__EncryptedId__c;

		ccrz.cc_RemoteActionResult removeCartResult = cc_Ava_ctrl_ConfigFlow.removeCart(context, cartEncId);

		List<ccrz__E_Cart__c> cartGones = [select Id, ccrz__EncryptedId__c from ccrz__E_Cart__c where Id = :cart.Id];

		System.assertEquals(0, cartGones.size());

	}

	@isTest static void testAvaCtrlConfigFlow_fetchProductsTieredPricing() {
		ccrz.cc_RemoteActionContext context = cc_ava_testUtils.createRemoteActionContext();

		List<String> skuList = new List<String>();
		skuList.add(cc_ava_testUtils.myReturnsSku);
		ccrz.cc_RemoteActionResult myProducts = cc_Ava_ctrl_ConfigFlow.fetchProductsTieredPricing(context, skuList);
		System.assert(myProducts.success);


	}*/
}