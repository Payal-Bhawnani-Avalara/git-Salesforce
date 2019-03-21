@isTest
private class cc_Ava_AbandonedCartCleanupTest {

	/*@testSetup static void createData() {
		cc_ava_testUtils.initData();
	}

	@isTest static void testAbandonedCartCleanup_execute() {

		User guestUser = [select Id from User where Email=:cc_ava_testUtils.myGuestEmail];

		ccrz__E_Cart__c cartFresh = new ccrz__E_Cart__c(
			ccrz__ActiveCart__c = true,
			ccrz__CartStatus__c = 'Open',
			ccrz__CartType__c = 'Cart',
			ccrz__Name__c = 'My Cart',
			ccrz__Storefront__c = cc_ava_testUtils.TEST_AVALARASTORE_STOREFRONT,
            ccrz__CurrencyISOCode__c = 'USD',
			ccrz__User__c = guestUser.Id,
			ccrz__BuyerFirstName__c = 'Some',
			ccrz__BuyerLastName__c = 'Name',
			ccrz__ValidationStatus__c = 'CartAuthUserValidated',
			CreatedDate = System.now().addMinutes(-50),
			LastModifiedDate = System.now().addMinutes(-40)
		);
		insert cartFresh;

		Test.startTest();

			String sched = '0 0 * * * ?';
			String jobId = System.schedule('test_abandonedCartCleanup', sched, new cc_Ava_AbandonedCartCleanup());

			CronTrigger ct = [select Id, CronExpression, TimesTriggered, NextFireTime
				from CronTrigger
				where Id = :jobId];

			//make sure job hasn't fired yet
			System.assertEquals(0,ct.TimesTriggered);

			//make sure cart hasn't updated before schedule time comes around
			System.assertNotEquals('Abandoned',cartFresh.ccrz__CartStatus__c);
			System.assertNotEquals(false,cartFresh.ccrz__ActiveCart__c);

		Test.stopTest();

		//make sure it has fired when schedule time comes around
		ccrz__E_Cart__c cartCleaned = [select Id, ccrz__ActiveCart__c, ccrz__CartStatus__c from ccrz__E_Cart__c where Id = :cartFresh.Id];
		System.assertEquals('Abandoned',cartCleaned.ccrz__CartStatus__c);
		System.assertEquals(false,cartCleaned.ccrz__ActiveCart__c);
	}*/
		
}