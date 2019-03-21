/**************************************************************************************************************************************************
 Name:  TestFactoryAvalara
 ==================================================================================================================================================
 Purpose: Create test objects to be used in test classes
 --------------------------------------------------------------------------------------------------------------------------------------------------
 History:                                                        
 --------------------------------------------------------------------------------------------------------------------------------------------------
 VERSION AUTHOR              DATE          DETAIL                          
 --------------------------------------------------------------------------------------------------------------------------------------------------
    1.0  Christina Lesnick   06/10/2014    Initial Development
**************************************************************************************************************************************************/

public with sharing class TestFactoryAvalara {

	public static List<Zuora.zApi.SaveResult> results{
		get{
			// If there is nothing in the List, run SaveResult test
			if ( results == null ){
				results = new List<Zuora.zApi.SaveResult>();
				results.addAll(getMockSuccessSaveResults());
				results.addAll(getTestMockErrorSaveResultList());
			}
			return results;
		}
		set;
	}

	public static List<Zuora__Subscription__c> subList {
		get {
			if (subList == null) {
				subList = new List<Zuora__Subscription__c>();
				subList.add(createSubscription());
			}
			return subList;
		}
		set;
	}

	public TestFactoryAvalara() {
		
	}

	public Account createAccount(){
	    Account testAcc = new Account();

	    testAcc.Name = 'testAccount';
	    testAcc.BillingState = 'CA';
	    testAcc.BillingCountry = 'USA';
	    testAcc.BillingPostalCode = '12345';
        testAcc.BillingStreet = '123';
        testAcc.BillingCity = 'Somewhere';
	    testAcc.ShippingState = 'CA';
	    testAcc.ShippingCountry = 'USA';
        testAcc.ShippingPostalCode = '23456';
	    testAcc.Industry = 'Dental'; 
	    
        return testAcc;
	}

	public Contact createContact(){
        Contact testcon = new Contact();

        testcon.firstname = 'testconfirst';
        testcon.lastname = 'testconlast';
        testcon.email = 'test@test.com';
        testcon.MailingCountry = 'US';
        testcon.MailingState = 'CA';

        return testcon;
    }

    public Campaign createCampaign(){
    	Campaign testCampaign = new Campaign();

    	testCampaign.Name = 'test campaign';
    	testCampaign.Status = 'Completed';

    	return testCampaign;
    }

    public Opportunity createOpportunity(Account acc, Campaign campaign){
        Opportunity testOpp = new Opportunity();

        Date mydate = date.newinstance(2012, 1, 1);

        testOpp.Name = 'Test Opportunity';
        testOpp.CloseDate = mydate;

        List<Account> acclist = [SELECT id, name 
        						 FROM Account 
        						 WHERE name = :acc.Name];


        testOpp.AccountId = acclist[0].Id;
        testOpp.Name = 'testopp';
        testOpp.StageName = 'Closed Won';
        testOpp.CloseDate = Date.Today();
        testOpp.CampaignId = campaign.Id;
        testOpp.Type = 'New';

        return testOpp;
    }
    
    public zqu__Quote__c createQuote(Contact con, Opportunity opp){
        zqu__Quote__c testQuote = new zqu__Quote__c();
        
        testQuote.name = 'testquote';
        testQuote.zqu__Opportunity__c = opp.Id;
        testQuote.zqu__BillToContact__c = con.Id;
        testQuote.zqu__ZuoraAccountID__c ='123';
        testQuote.zqu__SoldToContact__c = con.Id;
        testQuote.zqu__PaymentMethod__c = 'Check';
        testQuote.zqu__PaymentTerm__c = 'Due Upon Receipt';
        testQuote.zqu__InitialTerm__c = 12;
        testQuote.zqu__RenewalTerm__c = 12;
        testQuote.zqu__Service_Activation_Date__c = date.newinstance(2012, 2, 8);
        testQuote.zqu__SubscriptionTermStartDate__c = date.newinstance(2012, 1, 1);
        testQuote.zqu__AutoRenew__c = false;
        testQuote.zqu__StartDate__c = date.newinstance(2012, 1, 1);
        testQuote.zqu__ValidUntil__c = date.newinstance(2012, 1, 1);
        testQuote.zqu__Currency__c = 'USD';
        testQuote.zqu__RecordReadOnly__c = false;
        testQuote.zqu__Status__c = 'New';
        testQuote.zqu__StartDate__c = date.newinstance(2012, 1, 1);
        testQuote.zqu__SubscriptionTermStartDate__c = date.newinstance(2012, 1, 3);
        testQuote.zqu__SubscriptionTermEndDate__c = date.newinstance(2013, 1, 1);
        testQuote.zqu__SubscriptionType__c = 'New Subscription';
        testQuote.zqu__SubscriptionVersion__c = 4;

        return testQuote;   
    }

    public static Zuora__Subscription__c createSubscription() {
    	Zuora__Subscription__c testSub = new Zuora__Subscription__c();

	    testSub.Zuora__Version__c = 2;
	    testSub.Zuora__TermStartDate__c = date.newinstance(2012, 1, 1);
	    testSub.Zuora__TermEndDate__c = date.newinstance(2013, 1, 1);
	    testSub.Zuora__NextRenewalDate__c = date.newinstance(2013, 1, 1);
	    testSub.Name = 'test sub';

	    insert testSub;

	    return testSub;
    }

  	public static List < Zuora.zApi.SaveResult > getMockSuccessSaveResults() {     

	    List < Zuora.zApi.SaveResult > mockSuccessSaveResults = new List < Zuora.zApi.SaveResult > ();
	    Zuora.zApi.SaveResult result = new Zuora.zApi.SaveResult();
	    result.Id = 'resultid1';
	    result.Success = true;
	    result.Errors = null;
	    mockSuccessSaveResults.add(result);
	      
	    return mockSuccessSaveResults;  
 	}
  
    public static List < Zuora.zApi.SaveResult > getTestMockErrorSaveResultList() {
	    List <Zuora.zApi.SaveResult> r = new List <Zuora.zApi.SaveResult> ();
	    List <Zuora.zObject> errors = new List <Zuora.zObject> ();

	    Zuora.zObject error = new Zuora.zObject('Error');

	    error.setValue('Field', 'testerrorfield');
	    error.setValue('Code', 'testerrorcode');
	    error.setValue('Message', 'testerrormessage');

	    errors.add(error);

	    Zuora.zApi.SaveResult result = new Zuora.zApi.SaveResult();

	    result.Id = 'resultid2';
	    result.Success = false;
	    result.Errors = errors;

	    r.add(result);

	    return r;
    } 
}