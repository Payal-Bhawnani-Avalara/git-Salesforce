@isTest

private class cc_hk_OrderAvaTest {

	/*@testSetup static void createData() {
		Map<String,Object> initData = cc_ava_testUtils.initData();
	}

	@isTest static void testAvaOrderHookOverride_place() {
		try{
		String myPaymentToken = 'otuer90tujt93to3ehjgorihgeoj3oi3';

		ccrz.cc_CallContext.currPageParameters.put('paymentToken',myPaymentToken);

		ccrz__E_PriceGroupPricelist__c pgpl = [select Id, Name, ccrz__PriceGroup__c, ccrz__Pricelist__r.Name, ccrz__PriceGroup__r.ccrz__GroupName__c from ccrz__E_PriceGroupPricelist__c where ccrz__Pricelist__r.Name = 'AvaTax Tier 1 Pricelist' limit 1];
		String priceGroupId = pgpl.ccrz__PriceGroup__c;

		ccrz.cc_CallContext.priceGroupId = priceGroupId;

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
			Contact contact = [select Id, Email from Contact limit 1][0];

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

			ccrz__E_Order__c order = new ccrz__E_Order__c(
					ccrz__Account__c=anonAccount.Id,
					ccrz__Contact__c = contact.Id,
					ccrz__BillTo__c = addr.Id,
					ccrz__OrderDate__c = System.today()
			);
			insert order;

			ccrz__E_OrderItem__c oimj = new ccrz__E_OrderItem__c(
					ccrz__Product__c = dk.Id,
					ccrz__Order__c = order.Id,
					ccrz__Price__c = 5,
					ccrz__Quantity__c = 1,
					ccrz__SubAmount__c = 5
			);
			ccrz__E_OrderItem__c oimn = new ccrz__E_OrderItem__c(
					ccrz__Product__c = tierProd.Id,
					ccrz__Order__c = order.Id,
					ccrz__Price__c = 4,
					ccrz__Quantity__c = 1,
					ccrz__SubAmount__c = 4
			);

			List<ccrz__E_OrderItem__c> orderItems = new List<ccrz__E_OrderItem__c>();
			orderItems.add(oimj);
			orderItems.add(oimn);
			insert orderItems;

			ccrz__E_OrderItem__c oimnc = new ccrz__E_OrderItem__c(
					ccrz__Product__c = tierProd.Id,
					ccrz__Order__c = order.Id,
					ccrz__Price__c = 4,
					ccrz__Quantity__c = 1,
					ccrz__SubAmount__c = 4
			);

			List<ccrz__E_OrderItem__c> orderChildItems = new List<ccrz__E_OrderItem__c>();
			orderChildItems.add(oimnc);
			insert orderChildItems;


			Map<String,Object> inputData = new Map<String,Object>{
			'placeStep' => ccrz.cc_hk_Order.STEP_CREATE_ORDER_CHILD_ITEMS_PRE,
			'cart' => cart,
			'orderItems' => orderItems,
			'orderChildItems' => orderChildItems
			};

			cc_hk_OrderAva orderHook = new cc_hk_OrderAva();
			Map<String,Object> orderHookReturn = orderHook.place(inputData);

			//check whether sample pros code was added by order hook override
			List<ccrz__E_OrderItem__c> orderItemsReturn = (List<ccrz__E_OrderItem__c>)orderHookReturn.get('orderItems');
			System.assertEquals('TESTGENERALDATAHERE',orderItemsReturn[0].Opportunity_LI_Rate_Plan_Charge_Tier_ID__c);


			Map<String,Object> inputDataPaymentToken = new Map<String,Object>{
			'placeStep' => 'createOrderPre',
			'cart' => cart,
			'order' => order,
			'orderItems' => orderItems,
			'orderChildItems' => orderChildItems
			};

			cc_hk_OrderAva orderHookPaymentToken = new cc_hk_OrderAva();
			Map<String,Object> orderHookReturnPaymentToken = orderHookPaymentToken.place(inputDataPaymentToken);

			//check whether passed payment token was stored
			ccrz__E_Order__c orderReturn = (ccrz__E_Order__c)orderHookReturnPaymentToken.get('order');
			System.assertEquals(myPaymentToken,orderReturn.PROS_Quote_Payment_Token__c);
		}
		}
		catch(Exception ex){}		

	}*/

}