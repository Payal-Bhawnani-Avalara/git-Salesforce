@isTest
private class AccountProfileTest {
    //BATS-355 ITBSE-1303
    static testMethod void testCoMPage() {
    	 Test.startTest();
	    	//Create an account
	    	Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
	       Account acc = TestUtil.createAccount(customerAccountTypeId,1,true)[0];
	       
	       //Create Opportunity
	       Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
           Opportunity o = TestUtil.createOpportunity(acc.id,defaultOppRecTypeId,1,true)[0];
	       
	       //create Account Profile
	       id prosProRecrdtypeid = [Select Id from RecordType where DeveloperName='Prospect_Profile_1_0' limit 1].Id;
	       Account_Profile__c accPro = TestUtil.createAccountProfile(1,false,acc)[0];
	       accPro.recordtypeID = prosProRecrdtypeid;
	       accPro.Opportunity__c = o.id;
	       //accPro.Account__c = acc.id;
	       insert accPro;
	       
           //Add the page to the test context
	       PageReference testPage = Page.CoMPage;
	       testPage.getParameters().put('id', String.valueOf(o.Id));
           Test.setCurrentPage(testPage);

	        // Create a controller for the book	
           ApexPages.StandardController sc = new ApexPages.StandardController(o); 
           
           //Create an extension with the controller
	       AccountProfile accExtenstion = new AccountProfile(sc);
 	       
      Test.stopTest();
    }
}