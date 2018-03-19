/**************************************************************************************************************************************************
 Name:  Sync Subscription Test 
 ==================================================================================================================================================
 Purpose: Test the SyncSubscriptionFields.cls
 --------------------------------------------------------------------------------------------------------------------------------------------------
 History:                                                        
 --------------------------------------------------------------------------------------------------------------------------------------------------
 VERSION AUTHOR              DATE          DETAIL                          
 --------------------------------------------------------------------------------------------------------------------------------------------------
    1.0  Christina Lesnick   05/20/2014    Initial Development
**************************************************************************************************************************************************/

@isTest(SeeAllData=true)
public with sharing class SyncSubTest {

	public SyncSubTest() {
		 
	}

	/**
	* (1) Test Create Quote logic to set default values 
	* (2) After mock quote sent to z-billing test following functionality
	*    (a) Custom field sync to Zuora for amendments + renewals
	**/
 	static testMethod void sync() {
 		
 		TestFactoryAvalara testData = new TestFactoryAvalara();

 		Account testAccount = testData.createAccount();
 		insert testAccount;

 		Contact testContact = testData.createContact();
 		insert testContact;

 		Campaign testCampaign = testData.createCampaign();
 		insert testCampaign;

 		Opportunity testOpportunity = testData.createOpportunity(testAccount, testCampaign);
 		insert testOpportunity;

 		zqu__Quote__c testQuote = testData.createQuote(testContact, testOpportunity);
 		insert testQuote;

 		zqu__Quote__c testQuote2 = testData.createQuote(testContact, testOpportunity);
 		testQuote2.zqu__SubscriptionType__c = 'Amend Subscription';
 		insert testQuote2;

 		zqu__Quote__c testQuote3 = testData.createQuote(testContact, testOpportunity);
 		testQuote2.zqu__SubscriptionType__c = 'Renew Subscription';
 		insert testQuote3;
 		System.Debug('=========== END BUILD TEST DATA ===========');


 		System.Debug('=========== START TEST SyncSubFields w/ Amend Sub ===========');
 		testQuote2.zqu__Status__c = 'Sent to Z-Billing';
 		update testQuote2;
 		System.Debug('=========== END TEST SyncSubFields w/ Amend Sub ===========');


 		System.Debug('=========== START TEST -- ZLogging ===========');
 		ZLogging logger = new ZLogging();
 		SyncSubscriptionFields.ZlogException();
 		SyncSubscriptionFields.ZlogSaveResultError('code', 'message');
 		System.Debug('=========== END TEST -- ZLogging ===========');

	}
}