@isTest
private class JobOpportunityLockTest {
	private static Account a;
	private static Contact c;
	private static Opportunity o;
	private static CameleonCPQ__Quote__c cpq;
    static testMethod void testJobOpportunityLock() {
	  	//Create an account
    	  	 Id emeaAccountTypeId=[Select Id from RecordType where DeveloperName='EMEA_Account' limit 1].Id;
      	 a =TestUtil.createAccount(emeaAccountTypeId,1,true)[0];
       	//create a contact 
      	 c =TestUtil.createContact(a.Id,5,true)[0];
      	 //create Opportunity
      	 Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
      	 o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,true)[0];
      	 //create pros quote
      	 cpq = TestUtil.createProsQuote(a.id,o.id,c.id,1,false)[0];
      	// cpq.OPStatus__c = Constants.PROS_QUOTE_STATUS_COMPLETE;
      	 insert cpq;
      	 User ztbuyAPIUser=[Select id from User Where Id='00533000003RbvNAAS'];
   	 	Test.startTest();
      	 System.runAs(ztbuyAPIUser){
	      	 cpq.SentToZBillingDate__c=Date.today();
	      	 update cpq;
      	 }
  	    //Give unlock permissions to user
        User currentUser=new User(Id=UserInfo.getUserId(),Special_Permission__c='CanUpdateLockedOpportunities');
        update currentUser;
        //UnLock Opportunity
        o.Locked__c=false;
        update o;
		JobOpportunityLock m = new JobOpportunityLock();
        String seconds = '0'; //Execute at Zero Seconds
        String minutes = '0'; //Execute at every 0 minute of hour
        String hours = '2'; // Execute at 1 AM
        String dayOfMonth = '*'; // Execute Every Day of the Month
        String month = '*'; //Execute every Month
        String dayOfWeek = '?'; //Execute on all 7 days of the Week
        
        //Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        String sch = seconds + ' ' + minutes + ' ' + hours + ' ' + dayOfMonth + ' ' + month + ' ' + dayOfWeek;
        //String sch = '0 0 01 * * ?';
        system.schedule('JobOpportunityLock Run Everyday 2am Test', sch, m);     
        Test.stopTest();
    }
}