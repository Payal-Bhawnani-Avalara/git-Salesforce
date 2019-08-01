@isTest
private class SubscriptionTriggerHandlerTest {
  static zqu__Quote__c quote{get;set;}
  Connector__c c;
  static zqu__zProduct__c product{get;set;}

  static List<zqu__ProductRatePlan__c> prpList{get;set;}
  static String subName{get;set;}  	
    static void createTestData(){
	    //need to enable this in the Zuora Config
	    //Enable_Summary_Reporting__c
	        product = TestFactory.prepareProductCatalog(false);
	
	    prpList = [SELECT Id, 
	                      Name,
	                      TransactionTier__c,
	                      Display__c,
	                      ServiceLevel__c,
	                      AddOnConnector__c,
	                      PriceSchedule__c,
	                      zqu__zProduct__c
	               FROM zqu__ProductRatePlan__c 
	               WHERE zqu__ZProduct__c = :product.Id];
	    List<String> prpIdList = new List<String>();
	    for(zqu__ProductRatePlan__c prp : prpList){
	      prpIdList.add(prp.Id);
	    }
	
	    Account acc = TestFactory.makeAccount();
	    acc.ActiveCustomer__c=true;
	    update acc;
	    Contact con=TestUtil.createContact(acc.Id,1,true)[0];
	    Opportunity opp = TestFactory.makeOpportunity( acc );
	    //opp.SubType__c='Included';
	    //update opp;
	    Connector__c c = new Connector__c(
	        Name = 'Test Connector',
	        Author__c = acc.Id,
	        Managed_By__c = acc.Id
	    );
	    insert c;    
	    Zuora__Subscription__c sub =  new Zuora__Subscription__c();
	    sub.name = 'Test123';
	    subName = sub.name;
	    sub.Zuora__Account__c = acc.Id;
	    sub.Zuora__Status__c='Active';
	    sub.Opportunity__c=opp.Id;
	    sub.Ding__c='true';
	    sub.Zuora__ContractEffectiveDate__c=Date.today();
		upsert sub;
    }
    static testMethod void testupdateRollupsFuture() {
    	 	
    		Test.startTest();
    		createTestData();
    		Test.stopTest();
    		Zuora__Subscription__c sub=[Select Id,Zuora__Account__c,Opportunity__c From Zuora__Subscription__c limit 1];
    		Account a=[Select Id,ActiveSubscriptionCount__c,First_Purchase_Date__c From Account where Id=:sub.Zuora__Account__c];
    		Opportunity o=[Select Id,Ding_Value__c,Ding_Month__c,Ding_Year__c From Opportunity Where Id=:sub.Opportunity__c];
    		System.assertEquals(a.ActiveSubscriptionCount__c,1);
    		System.assertEquals(a.First_Purchase_Date__c,Date.today());   
    		
    		System.assertEquals(o.Ding_Value__c,null);
    		System.assertEquals(o.Ding_Month__c,null);  
		
		delete sub;  	
		
		 a=[Select Id,ActiveSubscriptionCount__c,First_Purchase_Date__c From Account where Id=:a.Id];
    		 o=[Select Id,Ding_Value__c,Ding_Month__c,Ding_Year__c From Opportunity Where Id=:o.Id];
    		System.assertEquals(a.ActiveSubscriptionCount__c,1);
    		System.assertEquals(a.First_Purchase_Date__c,Date.today()); 
    		
    		TriggerHandler.clearBypass('SubscriptionTriggerHandler'); 
    		undelete sub;
    		
		 /*a=[Select Id,ActiveSubscriptionCount__c,First_Purchase_Date__c From Account where Id=:a.Id];
    		 o=[Select Id,Ding_Value__c,Ding_Month__c,Ding_Year__c From Opportunity Where Id=:o.Id];
    		System.assertEquals(a.ActiveSubscriptionCount__c,1);
    		System.assertEquals(a.First_Purchase_Date__c,Date.today());*/      		
    }
     static testMethod void testOpportunityLookUpOnUpdate() {	
    		Test.startTest();
    		  //Create an account
	      Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
	      Account a =TestUtil.createAccount(customerAccountTypeId,1,true)[0];
		  //create Opportunity
	      Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
	      Opportunity o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,true)[0];		 
	      Zuora__Subscription__c sub=TestUtil.createZuoraSubscription(a.Id,1,true)[0];
	      sub.OpportunityID__c=o.id;
          update sub;
      	  sub=[Select Id,OpportunityID__c,Opportunity__c From Zuora__Subscription__c Where Id=:sub.Id];
          System.assertEquals(sub.Opportunity__c, sub.OpportunityID__c);
        Test.stopTest();
        
    }
}