@isTest
private class CCCartTriggerBeforeDeleteTest {

	@testSetup static void createData() {
		Map<String,Object> initData = cc_ava_testUtils.initData();
	}

	@isTest static void test_CCCartTriggerBeforeDelete() {

		User guestUser = [select Id from User where Email=:cc_ava_testUtils.myGuestEmail];
		Account acc = new Account(
			Name='Test Account'
		);
		insert acc;
		Contact con = new Contact(
			FirstName='Ima',
			Lastname='Testuser',
			Accountid=acc.id,
			Email='test@email.com'
		);
		insert con;


		ccrz__E_Cart__c cart = new ccrz__E_Cart__c(
			ccrz__ActiveCart__c = true,
			ccrz__CartStatus__c = 'Open',
			ccrz__CartType__c = 'Cart',
			ccrz__Name__c = 'My Cart',
			ccrz__Storefront__c = cc_ava_testUtils.TEST_AVALARASTORE_STOREFRONT,
	        ccrz__CurrencyISOCode__c = 'USD',
			ccrz__User__c = guestUser.Id,
			ccrz__BuyerFirstName__c = 'Some',
			ccrz__BuyerLastName__c = 'Name',
			ccrz__BuyerEmail__c = 'someplace@thing.com',
			ccrz__BuyerCompanyName__c = 'my company',
			ccrz__ValidationStatus__c = 'CartAuthUserValidated',
			ccrz__Account__c = acc.Id,
			ccrz__AnonymousId__c = true,
			ccrz__Contact__c = con.Id,
			addContact__c = true
		);
		insert cart;

		Test.startTest();
			//delete the cart; should fire the CCCartTriggerBeforeDelete
			delete cart;
			//requery to make sure that cart is deleted
			List<ccrz__E_Cart__c> cartGone = [select Id, Name from ccrz__E_Cart__c where Id = :cart.Id];
			System.assertEquals(0, cartGone.size());
			//now make sure the contact is deleted
			List<Contact> contactGone = [select Id, Name from Contact where Id = :con.Id];
			System.assertEquals(0, contactGone.size());
			//and make sure the account is deleted too
			List<Account> accountGone = [select Id, Name from Account where Id = :acc.Id];
			System.assertEquals(0, accountGone.size());
		Test.stopTest();
	}
	
	
}