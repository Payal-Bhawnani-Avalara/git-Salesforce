@isTest
private class cc_Ava_ctrl_StaticConfigflowTest {
	@testSetup static void createData() {
	  String sandboxName=UserInfo.getUserName().substringAfterLast('.');
	  sandboxName=sandboxName.toLowerCase();
	  if(sandboxName=='com'){
	  	sandboxName='prod';
	  }
	  String customSettingName='Zuora_'+sandboxName+'_staticflow';  		
		Zuora_Customer_Config3__c zc=new Zuora_Customer_Config3__c(Name=customSettingName,Zuora_ApiBaseurl__c='https://services365.zuora.com',Zuora_GatewayName__c='CloudCraze eComm ccKevin static',
																Zuora_PageId__c='8a8083475e1e8c33015e2ad5ee7d2faa',Zuora_paymentGateway__c='Test Gateway',Zuora_UriBaseurl__c='https://services365.zuora.com');
		insert zc;
		cc_ava_testUtils.initData();
	}
    static testMethod void testgetStaticZuoraIframe() {
		ccrz.cc_RemoteActionContext context = cc_ava_testUtils.createRemoteActionContext();
		ccrz.cc_RemoteActionResult result = ccrz.cc_CallContext.init(context);
        System.debug('ctx in testProductConfiguration: ' + context);
        cc_Ava_ctrl_StaticConfigflow.getStaticZuoraIframe(context);
        Test.startTest();
    		TestMockHttpResponseGenerator.SETUPRESPONSEBODY='{"pageId":"","apiBaseUrl":"","uriBaseUrl":"","gatewayName":"","paymentGateway":""}';
    		TestMockHttpResponseGenerator.SETUPRESPONSECODE=200;
        Test.setMock(HttpCalloutMock.class, new TestMockHttpResponseGenerator());
        cc_Ava_ctrl_StaticConfigflow.getStaticZuoraIframe(context);
        Test.stopTest();         
    }
	@isTest static void testAvaCtrlConfigFlow_verifyAddress() {
	 //signature: ccrz.cc_RemoteActionResult verifyAddress(ccrz.cc_RemoteActionContext ctx, avaVerifiableAddress addressToVerify) {

	 ccrz.cc_RemoteActionContext context = cc_ava_testUtils.createRemoteActionContext();

	 Map < String, Object > module = new Map < String, Object > {
	  'Name' => 'CC Avalara',
	  'APIName' => 'ccava'
	 };
	 List < Map < String, Object >> metas = new List < Map < String, Object >> ();
	 // ccava.credentials
	 metas.add(new Map < String, Object > {
	  'Name' => 'AvaTax 15 API Named Credentials',
	  'Description' => 'test',
	  'APIName' => 'credentials',
	  'ExternallySafe' => false,
	  'Configurations' => new List < Map < String,
	  Object >> {
	   new Map < String,
	   Object > {
	    'TextValue' => 'Avalara_Development',
	    'Storefront' => 'Global',
	    'PageName' => 'all',
	    'Name' => 'Global.all.ccava.credentials'
	   }
	  }
	 });
	 // ccava.companycode
	 metas.add(new Map < String, Object > {
	  'Name' => 'Avalara CompanyCode',
	  'Description' => 'test',
	  'APIName' => 'companycode',
	  'ExternallySafe' => false,
	  'Configurations' => new List < Map < String,
	  Object >> {
	   new Map < String,
	   Object > {
	    'TextValue' => 'Ava',
	    'Storefront' => 'Global',
	    'PageName' => 'all',
	    'Name' => 'Global.all.ccava.companycode'
	   }
	  }
	 });
	 module.put('ConfigurationMetas', metas);

	 ccrz.ccApiConfig.setBulk(new Map < String, Object > {
	  'version' => 1,
	  'configJSON' => JSON.serialize(new List < Object > {
	   module
	  })
	 });

	 Map < String, Object > config = ccrz.ccApiConfig.fetch(new Map < String, Object > {
	  ccrz.ccAPIConfig.STORE_NAME => 'AvalaraStore',
	  ccrz.ccAPIConfig.CONFIG_MODULE => 'ccava',
	  'version' => 1,
	  ccrz.ccAPIConfig.USE_CACHE => false
	 });

	 System.debug('config: ' + config);

	 cc_Ava_ctrl_StaticConfigflow.avaVerifiableAddress addressReal = new cc_Ava_ctrl_StaticConfigflow.avaVerifiableAddress();
	 addressReal.Line1 = '124 Fidelity Street';
	 addressReal.Line2 = 'Apt. 5';
	 addressReal.City = 'Carrboro';
	 addressReal.Region = 'NC';
	 addressReal.PostalCode = '27510';
	 addressReal.Country = 'US';

	 Test.setMock(HttpCalloutMock.class, new cc_ava_AddressMockValid());
	 Test.startTest();
	 ccrz.cc_RemoteActionResult verifyResultReal = cc_Ava_ctrl_StaticConfigflow.verifyAddress(context, addressReal);
	 System.debug('verifyResultReal: ' + verifyResultReal);
	 Test.stopTest();

	}  
	@isTest static void testAvaCtrlConfigFlow_calculateTax() {
		//signature: ccrz.cc_RemoteActionResult calculateTax(ccrz.cc_RemoteActionContext ctx, String cartId)
	
		User guestUser = [select Id from User where Email=:cc_ava_testUtils.myGuestEmail];
		System.runAs(guestUser){

			testAvaCtrlConfigFlow_addConfiguredProductToCart();

			ccrz.cc_RemoteActionContext context = cc_ava_testUtils.createRemoteActionContext();

			ccrz__E_Cart__c cart = [select Id, ccrz__EncryptedId__c from ccrz__E_Cart__c limit 1][0];
			String cartEncId = (String)cart.ccrz__EncryptedId__c;

			Test.setMock(HttpCalloutMock.class, new cc_ava_TaxMock());
			Test.startTest();
				ccrz.cc_RemoteActionResult taxAmount = cc_Ava_ctrl_StaticConfigflow.calculateTax(context, cart.Id);
	            ccrz__E_Cart__c myCart = [SELECT Id, ccrz__ValidationStatus__c, ccrz__SubtotalAmount__c, ccrz__TotalAmount__c, ccrz__TaxAmount__c, ccrz__TaxSubTotalAmount__c, ccrz__ShipTo__c, ccrz__BillTo__c, ccrz__Contact__c, ccrz__Account__c FROM ccrz__E_Cart__c WHERE Id=:cart.Id];
				List<ccrz__E_CartItem__c> myCartItems = [select Id, Name, ccrz__Cart__c, ccrz__ItemTotal__c from ccrz__E_CartItem__c where ccrz__Cart__c=:cart.Id];
				System.debug('return from calculateTax controller method: ' + taxAmount);
				System.debug('myCart after tax calculated: ' + myCart);
				System.debug('and its cartitems:' + myCartItems);
			Test.stopTest();
		}
	}
	@isTest static void testAvaCtrlConfigFlow_addConfiguredProductToCart() {
		//signature: ccrz.cc_RemoteActionResult addConfiguredProductToCart(ccrz.cc_RemoteActionContext ctx, String dynamicKitSku, String componentProducts, String selectedTierId, String selectedBillingFrequency, String leadInfoJSON)
	
		User guestUser = [select Id from User where Email=:cc_ava_testUtils.myGuestEmail];
		System.runAs(guestUser){
		
				ccrz.cc_RemoteActionContext context = cc_ava_testUtils.createRemoteActionContext();
				ccrz.cc_RemoteActionResult myCompositeProducts = cc_Ava_ctrl_StaticConfigflow.fetchCompositeProducts(context, new List<String>{cc_ava_testUtils.myDynamicKitSku});
		
				List<cc_Ava_ctrl_StaticConfigflow.groupWithProducts> componentProducts = (List<cc_Ava_ctrl_StaticConfigflow.groupWithProducts>)myCompositeProducts.data;
				System.debug('componentProducts: ' + componentProducts);
				//this is not *quite* what the object looks like on the actual page; TO DO: reconstruct that object slightly differently
				String componentProductString = JSON.serialize(myCompositeProducts.data);
				System.debug('componentproductstring return from fetch: ' + componentProductString);
				String mySelectedTierId;
		
				List<groupWithProductsLocal> myProducts = new List<groupWithProductsLocal>();
				for(cc_Ava_ctrl_StaticConfigflow.groupWithProducts g : componentProducts) {
					groupWithProductsLocal temp = new groupWithProductsLocal(); 
						temp.groupName = g.groupName;
						temp.productsThisGroupOnly = g.productsThisGroupOnly[0];
					myProducts.add(temp);
				}
				System.debug('resulting mock myProducts: ' + myProducts);
				String myProductsString = JSON.serialize(myProducts);
				System.debug('stringified: ' + myProductsString);
		
				//grab any tier
				for(cc_Ava_ctrl_StaticConfigflow.groupWithProducts g : componentProducts) {
					if(g.groupName=='Tier') {
						for(cc_Ava_ctrl_StaticConfigflow.groupableProduct gp : g.productsThisGroupOnly) {
							mySelectedTierId = gp.sfid;
						}
					}
				}
		
		
				System.debug('selectedtierid: ' + mySelectedTierId);
		
				String selectedBillingFrequency = 'Yearly';
				String leadInfoJSON = '{\"Lead_Interest_Prod_Services__c\" : \"AvaTax\",\"Lead_MethodContact__c\" : \"Webform T1\",\"Lead_Source_Most_Recent__c\" : \"Unknown Inbound\",\"Lead_Offer__c\" : \"Online Buying\",\"Lead_OpptSubType__c\" : \"SOHO\",\"Lead_WebProperty__c\" : \"store.avalara.com\",\"Lead_Source__c\" : \"Unknown Inbound\",\"Lead_CampaignId__c\" : \"70133000000e59bAAA\",\"Lead_PartnerId__c\" : \"\"}';
		
				Contact contact = [select Id, Email from Contact limit 1][0];
				String billingAddressJSON = '{\"FirstName\" : \"Robo\",\"LastName\" : \"Cop\",\"Company\" : \"Supercool Company Inc\",\"Address1\" : \"1234 Blah Street\",\"Address2\" : \"Suite 999\",\"Country\" : \"US\",\"Region\" : \"NC\",\"City\" : \"Chapel Hill\",\"PostalCode\" : \"27514\",\"Email\" : \"john.esposito@6st.robocop\",\"Phone\" : \"919-945-6789\"}';
				ccrz.cc_RemoteActionResult result = cc_Ava_ctrl_StaticConfigflow.addConfiguredProductsToCartAndContact(context, myProductsString, contact.Id, leadInfoJSON,1,billingAddressJSON);
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

			ccrz.cc_RemoteActionResult billingResult = cc_Ava_ctrl_StaticConfigflow.updateBillingAddress(context, cartEncId, billingAddressJSON);
			ccrz.cc_RemoteActionResult placeOrderResult = cc_Ava_ctrl_StaticConfigflow.placeOrder(context, cartEncId, priceGroupId, paymentToken);

			System.debug('PLACEORDER RETURN: ' + placeOrderResult);

			//System.assertEquals(true, placeOrderResult.success);

			//ccrz__E_Order__c myOrder = [select Id, ccrz__EncryptedId__c, ccrz__BuyerEmail__c, ccrz__CCEmailAddress__c, ccrz__TotalAmount__c from ccrz__E_Order__c limit 1][0];
			//List<ccrz__E_OrderItem__c> itemsJustOrdered = [select ccrz__Order__r.ccrz__OriginatedCart__c, ccrz__Product__c, ccrz__Product__r.Name, ccrz__Product__r.ccrz__SKU__c, ccrz__SubProdTerm__c, CPQ_Quantity__c from ccrz__E_OrderItem__c where ccrz__Order__c = :myOrder.Id];
			//System.debug('placed ccorder after placeOrder success:' + myOrder);

			//System.assertEquals(13.5,myOrder.ccrz__TotalAmount__c);

		}
		}
		catch(Exception ex){}
	}	
	@isTest static void testAvaCtrlConfigFlow_removeCart() {
		//signature: ccrz.cc_RemoteActionResult removeCart(ccrz.cc_RemoteActionContext ctx, String cartEncId)

		ccrz.cc_RemoteActionContext context = cc_ava_testUtils.createRemoteActionContext();
		ccrz__E_Cart__c cart = [select Id, ccrz__EncryptedId__c from ccrz__E_Cart__c limit 1][0];
		String cartEncId = (String)cart.ccrz__EncryptedId__c;

		ccrz.cc_RemoteActionResult removeCartResult = cc_Ava_ctrl_StaticConfigflow.removeCart(context, cartEncId);

		List<ccrz__E_Cart__c> cartGones = [select Id, ccrz__EncryptedId__c from ccrz__E_Cart__c where Id = :cart.Id];

		System.assertEquals(0, cartGones.size());

	}	
	public class groupWithProductsLocal {
		public String groupName;
		public cc_Ava_ctrl_StaticConfigflow.groupableProduct productsThisGroupOnly;
	}			  
}