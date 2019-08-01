@isTest
public class ComplianceVarianceItemTriggerHandlerTest {
  //IBST-16111
  static testMethod void testCVIAccUpdate() {
    	 Test.startTest();
	    	//Create an account
	       Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
	       Account acc = TestUtil.createAccount(customerAccountTypeId,1,false)[0];
	       acc.ActiveCustomer__c=true;
           acc.ActiveSubscriptionCount__c = 5;
           acc.CARR_Override__c = 50;
           insert acc;
      
	       //Create Account Statistics
           Account_Statistics__c accStat= TestUtil.createAccountStatistics(acc.id,1,false)[0];
           accStat.AccountID__c = 2000060838;
           accStat.System__c='PROD';
           insert accStat;
	       
	       //create Compliance Variance Item
	       Compliance_Item__c cVI = TestUtil.createComplianceItem(1,false)[0];
           cVI.AvaTaxAccountIdNew__c=2000060838;
	       insert cVI;
           
           Compliance_Item__c cIAcc = [Select Account__c from Compliance_Item__c where id=:cVI.id];
           System.assertEquals(cIAcc.Account__c, acc.id);
           
      Test.stopTest();
    }
}