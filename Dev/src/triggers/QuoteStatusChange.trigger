/***********************************************************************************************************************
 Name:  QuoteStatusChange 
 =======================================================================================================================
 Purpose: Trigger when Quote Sent to Z-Billing will call the following handlers: 
 		  (1) SyncSubscriptionFields for amend and renew subscriptions
 -----------------------------------------------------------------------------------------------------------------------
 History:                                                        
 -----------------------------------------------------------------------------------------------------------------------
 VERSION AUTHOR              DATE          DETAIL                          
 -----------------------------------------------------------------------------------------------------------------------
    1.0  Christina Lesnick   05/20/2014    Initial Development
***********************************************************************************************************************/

trigger QuoteStatusChange on zqu__Quote__c (after update) {

    for (zqu__Quote__c newQuote : Trigger.new) {
		zqu__Quote__c oldQuote = Trigger.oldMap.get(newQuote.Id);  
		String subType = newQuote.zqu__SubscriptionType__c;
		String subId =  subType == 'New Subscription' ? 
            newQuote.zqu__ZuoraSubscriptionID__c : 
            newQuote.zqu__ExistSubscriptionID__c;

		// If Amend or Renew Subscription, sync custom fields in zqu__CustomQuoteFields field set to the subscription 
		// in Zuora
		if (newQuote.zqu__Status__c == 'Sent To Z-Billing' && 
			oldQuote.zqu__Status__c == 'New' && 
			subType != 'New Subscription') {

			SyncSubscriptionFields ssf = new SyncSubscriptionFields(
				NewQuote.zqu__Hidden_Subscription_Name__c,
		        newQuote.Id, 
		        subId,
		        newQuote.zqu__SubscriptionVersion__c);
		}
	} 
}