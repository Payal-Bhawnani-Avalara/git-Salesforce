global class cc_Ava_AbandonedCartCleanup {
	/*global void execute(SchedulableContext sc) {

		List<ccrz__E_Cart__c> abandonedCarts = [select Id
			, ccrz__CartStatus__c
			, ccrz__ActiveCart__c 
			, LastModifiedDate
			from ccrz__E_Cart__c 
			where ccrz__CartStatus__c = 'Open' 
			and LastModifiedDate < :System.now().addMinutes(-30)];

		for(ccrz__E_Cart__c ac : abandonedCarts) {
			ac.ccrz__CartStatus__c = 'Abandoned';
			ac.ccrz__ActiveCart__c = false;
		}

		try {
			update abandonedCarts;			
		} catch (Exception e) {
			System.debug('Error cleaning up abandoned carts: ' + e.getTypeName() + ' with cause ' + e.getCause() + ' at line ' + e.getLineNumber() + ' with message ' + e.getMessage() + ' and stack trace ' + e.getStackTraceString());
		}

	}*/
}