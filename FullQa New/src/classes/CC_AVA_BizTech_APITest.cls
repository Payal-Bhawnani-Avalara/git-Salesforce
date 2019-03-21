@isTest
private class CC_AVA_BizTech_APITest{

     @testSetup static void setup() {
     }
    static testMethod void test_getBizTechAccountAndContact() {
        TestMockHttpResponseGenerator.SETUPRESPONSEBODY='{}';
        TestMockHttpResponseGenerator.SETUPRESPONSECODE=200;
        Test.setMock(HttpCalloutMock.class, new TestMockHttpResponseGenerator());
        Test.startTest();
        //1. Test with null email
        CCAccountWrapper obj=CC_AVA_BizTech_API.getBizTechAccountAndContact(null);
        System.assertEquals(obj.isSuccess,false);
        //2. Test with valid email but return empty JSON
        obj=CC_AVA_BizTech_API.getBizTechAccountAndContact('abc@example.com');
        System.assertEquals(obj.isSuccess,false);
        //3. Test with multiple accounts
        TestMockHttpResponseGenerator.SETUPRESPONSEBODY='{"data":[{"contacts":[{"city":"Seattle","country":"US","email":"example-165b381c@example.org","firstName":"first-d4d66dbd","id":"0030n00000FGZgkAAH","isBillingContact":true,"isPrimaryContact":false,"lastName":"last-f4b64d0e","onlineAuthorized":true,"postalCode":"98101","state":"WA","street":"1100 2nd Ave"}],"id":"0010n00000H1pEvAAJ","name":"Biztech Co 48ac5434"},{"contacts":[{"city":"Seattle","country":"US","email":"example-165b381c@example.org","firstName":"first-d4d66dbd","id":"0030n00000FGeVTAA1","isBillingContact":true,"isPrimaryContact":false,"lastName":"last-f4b64d0e_2","onlineAuthorized":true,"postalCode":"98101","state":"WA","street":"1100 2nd Ave"}],"id":"0010n00000H1pEvAAJ","name":"Biztech Co 48ac5434"},{"contacts":[{"city":"Seattle","country":"US","email":"example-165b381c@example.org","firstName":"first-d4d66dbd","id":"0030n00000FHgqHAAT","isBillingContact":true,"isPrimaryContact":false,"lastName":"last-f4b64d0e","onlineAuthorized":true,"postalCode":"98101","state":"WA","street":"1100 2nd Ave"}],"id":"0010n00000H2ujeAAB","name":"Biztech Co 48ac5434"}],"errorMessage":"More than one accounts found.","hasMoreThanOneAccount":true,"isSuccess":false}';
        Test.setMock(HttpCalloutMock.class, new TestMockHttpResponseGenerator());    
        obj=CC_AVA_BizTech_API.getBizTechAccountAndContact('abc@example.com'); 
        System.assertEquals(obj.isSuccess,false);  
        //4. Test with multiple contacts
        TestMockHttpResponseGenerator.SETUPRESPONSEBODY='{"data":[{"contacts":[{"email":"example-165b381c@example.org","firstName":"first-d4d66dbd","id":"0030n00000FGeVTAA1"},{"email":"example-165b381c@example.org","firstName":"first-d4d66dbd","id":"0030n00000FGeVTAA1"}],"id":"0010n00000H2ujeAAB","name":"Biztech Co 48ac5434"}],"errorMessage":"More than one accounts found.","hasMoreThanOneAccount":true,"isSuccess":false}';
        Test.setMock(HttpCalloutMock.class, new TestMockHttpResponseGenerator());    
        obj=CC_AVA_BizTech_API.getBizTechAccountAndContact('abc@example.com'); 
        System.assertEquals(obj.isSuccess,false);          
        //5. Test with single account and contact
        TestMockHttpResponseGenerator.SETUPRESPONSEBODY='{"data":[{"contacts":[{"city":"Wixom","country":"US","email":"abc@example.com","firstName":"NAME","id":"0030b00001vOP0ZAAW","isBillingContact":true,"isPrimaryContact":false,"lastName":"LASTNAME","onlineAuthorized":true,"postalCode":"1586","state":"MI","street":"111 ssss -"}],"id":"0010b00001sGVquAAG","name":"ddddd"}],"errorMessage":"","hasMoreThanOneAccount":false,"hasMoreThanOneContact":false,"isSuccess":true}';
        Test.setMock(HttpCalloutMock.class, new TestMockHttpResponseGenerator());    
        obj=CC_AVA_BizTech_API.getBizTechAccountAndContact('abc@example.com'); 
        System.assertEquals(obj.isSuccess,true);  
        //6. Test with invalid return code
        TestMockHttpResponseGenerator.SETUPRESPONSECODE=201;
        Test.setMock(HttpCalloutMock.class, new TestMockHttpResponseGenerator());    
        obj=CC_AVA_BizTech_API.getBizTechAccountAndContact('abc@example.com'); 
        System.assertEquals(obj.isSuccess,false);                  
        Test.stopTest();
    }
    static testMethod void test50ContactAuthorizedIdentityChanged() {
        Test.startTest();
      //Create an account
           Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
       Account a =TestUtil.createAccount(customerAccountTypeId,1,true)[0];
       //create a contact 
       List<Contact> listCon =TestUtil.createContact(a.Id,50,true);   
           for(Contact con : listCon){
             con.Authorized_Identity_Contact__c = true;
           }
       update listCon;
       Test.setMock(HttpCalloutMock.class, new TestMockHttpResponseGenerator() );
      Test.stopTest();
    }  
    static testMethod void test50AccountCPUUserChanged() {
    	Test.startTest();
	  //Create an account
    	   Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
       List<Account> listAcc =TestUtil.createAccount(customerAccountTypeId,50,true);
    	   for(Account acc : listAcc){
    	   	 acc.CUP_User__c = true;
    	   }
       update listAcc;
       Test.setMock(HttpCalloutMock.class, new TestMockHttpResponseGenerator() );
      Test.stopTest();
    }  
    
    static testMethod void test101AccountCPUUserChanged() {
    	Test.startTest();
	  //Create an account
    	   Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
      List<Account> listAcc =TestUtil.createAccount(customerAccountTypeId,20,true);
      Set<Id> accId=new Set<Id>();
    	   for(Account acc : listAcc){
    	   	 acc.CUP_User__c = true;
    	   	 accId.add(acc.Id);
    	   }
       update listAcc;
       /*}
       catch(Exception e){
       	   Boolean expectedExceptionThrown =  e.getMessage().contains('More than 100 Contacts are updated') ? true : false;
           System.AssertEquals(expectedExceptionThrown, true);
       }*/
       Test.setMock(HttpCalloutMock.class, new TestMockHttpResponseGenerator() );
       
       CC_AVA_BizTech_API.sendCPUUserChanged(accId);
      Test.stopTest();
    }         
}