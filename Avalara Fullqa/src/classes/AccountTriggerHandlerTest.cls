@isTest
private class AccountTriggerHandlerTest {
     @testSetup static void setup() {
       //Setup custom setting
       List<CC_AVA_KeyPairValue__c> listCC_AVA_KeyPairValue=new List<CC_AVA_KeyPairValue__c>(); 
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_URL_Sandbox',Value__c='http://api.salesforce.com/'));
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_APIKEY_Sandbox',Value__c='123456'));
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_URL_Production',Value__c='http://api.salesforce.com/'));
       listCC_AVA_KeyPairValue.add(new CC_AVA_KeyPairValue__c(Name='BizTech_API_APIKEY_Production',Value__c='123456'));
       insert listCC_AVA_KeyPairValue;
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
    static testMethod void test50AccountCPUUserChanged() {
    	Test.startTest();
	  //Create an account
    	   Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
       List<Account> listAcc =TestUtil.createAccount(customerAccountTypeId,50,true);
    	   for(Account acc : listAcc){
    	   	 acc.CUP_User__c = false;
             acc.Reason_CUP_is_Disabled__c ='Test';
    	   }
    	   TriggerHandler.clearBypass('AccountTriggerHandler');
       update listAcc;
       Test.setMock(HttpCalloutMock.class, new TestMockHttpResponseGenerator() );
      Test.stopTest();
    }  
    
   static testMethod void test101AccountCPUUserChanged() {
    	Test.startTest();
	  //Create an account
    	   Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
      List<Account> listAcc =TestUtil.createAccount(customerAccountTypeId,101,true);
    	   for(Account acc : listAcc){
    	   	 acc.CUP_User__c = false;
             acc.Reason_CUP_is_Disabled__c ='Test';
    	   }
    	   TriggerHandler.clearBypass('AccountTriggerHandler');
       update listAcc;
       /*}
       catch(Exception e){
       	   Boolean expectedExceptionThrown =  e.getMessage().contains('More than 100 Contacts are updated') ? true : false;
           System.AssertEquals(expectedExceptionThrown, true);
       }*/
       Test.setMock(HttpCalloutMock.class, new TestMockHttpResponseGenerator() );
      Test.stopTest();
    }  
    static testMethod void testChangeContactOwner() {
      Test.startTest();
       //create user 
       Id ava2CAMProfileId = [Select Id from Profile where Name ='Ava2 CAM' limit 1].id;
       User u = TestUtil.createUSer(ava2CAMProfileId,null,1,true)[0];
     //Create an account
         Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
       Account a =TestUtil.createAccount(customerAccountTypeId,101,true)[0];
            a.ActiveCustomer__c = true;
       update a;
       //create a contact 
       List<Contact> listCon =TestUtil.createContact(a.Id,50,true);
       for(Contact con :listCon ){
         con.ownerid = u.id;
       
       }
       /*}
       catch(Exception e){
            Boolean expectedExceptionThrown =  e.getMessage().contains('More than 100 Contacts are updated') ? true : false;
           System.AssertEquals(expectedExceptionThrown, true);
       }*/
      Test.stopTest();
    }   
     static testMethod void testChangeAccountOwner() {
      Test.startTest();
       //create user 
       Id ava2CAMProfileId = [Select Id from Profile where Name ='Ava2 CAM' limit 1].id;
       User u = TestUtil.createUSer(ava2CAMProfileId,null,1,true)[0];
     //Create an account
         Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
       Account a =TestUtil.createAccount(customerAccountTypeId,101,true)[0];
            a.ActiveCustomer__c = true;
             a.OwnerId = u.Id;
       update a;
       //create a contact 
       List<Contact> listCon =TestUtil.createContact(a.Id,50,true);
       /*}
       catch(Exception e){
            Boolean expectedExceptionThrown =  e.getMessage().contains('More than 100 Contacts are updated') ? true : false;
           System.AssertEquals(expectedExceptionThrown, true);
       }*/
      Test.stopTest();
    }   
    
   static testMethod void testCreateDataFeedRecordsCX() {
    	Test.startTest();
	  //Create an account
    	   Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
       Account acc =TestUtil.createAccount(customerAccountTypeId,1,false)[0];
       insert acc;
      Test.stopTest();
       CX_Data_Feed__c cxTest = [Select id,Account__c from CX_Data_Feed__c where Account__c =: acc.id  LIMIT 1];
       System.debug('cxTest>>>>'+cxTest);
       //System.assertEquals(acc.CX_Data_Feed__c,cxTest.id);
    }    
   static testMethod void testCreateDataFeedRecordsJX() {
    	Test.startTest();
	  //Create an account
    	   Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
       Account acc =TestUtil.createAccount(customerAccountTypeId,1,false)[0];
       insert acc;
      Test.stopTest();
       JX_Data_Feed__c jxTest = [Select id,Account__c from JX_Data_Feed__c where Account__c =: acc.id  LIMIT 1];
       System.debug('jxTest>>>>'+jxTest);
       //System.assertEquals(acc.JX_Data_Feed__c,jxTest.id);
    } 
    //BATS-189
    static testMethod void testMergePermisstion(){
      Test.startTest();
	   //Create an Master account
    	   Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
       Account acc =TestUtil.createAccount(customerAccountTypeId,1,false)[0];
       insert acc;
       //Create Duplicate account
       Account accDup =TestUtil.createAccount(customerAccountTypeId,1,false)[0];
       insert accDup;
       //create user
       Id ava2CAMProfileId = [Select Id from Profile where Name ='Ava2 CAM' limit 1].id;
       User u = TestUtil.createUSer(ava2CAMProfileId,null,1,true)[0];
      Test.stopTest();
      System.runAs(u){
          try{
            Database.merge(acc, accDup, false);
          }catch(Exception e){
            Boolean expectedExceptionThrown =  e.getMessage().contains(Constants.MERGE_PERMISSION) ? true : false;
            System.AssertEquals(expectedExceptionThrown, true);
         }
      }
    }   
}