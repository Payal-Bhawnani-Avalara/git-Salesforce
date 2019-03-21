@isTest
public class PartnerDeveloperBioTest {
    private static Account a;
	private static Contact c;
    
    //Test for Account Client Type
    static testMethod void testPartnerDevloperBioClientType() {
       Test.startTest();
	       //Create an account
	       //developer name and schema to get piclist value 
	       a =TestUtil.createAccount(Schema.SObjectType.Account.getRecordTypeInfosByName().get('EMEA Account').getRecordTypeId(),1,false)[0];
	       a.Client_Type__c = Account.Client_Type__c.getDescribe().getPicklistValues()[0].getLabel();
	       insert a;
	       //create a contact 
	       c =TestUtil.createContact(a.Id,5,true)[0];
	       PartnerDeveloperBio obj = PartnerDeveloperBio.initPartnerDeveloperBio(c.Id);
	       System.assertEquals(obj.clienttypeselected[0],a.Client_Type__c);
       Test.stopTest();
       
    }
    //Positive Test Case
    static testMethod void testPartnerDevloperBioProgrammingLanguagesSupported() {
      Test.startTest();
	       //Create an account
	       a =TestUtil.createAccount(Schema.SObjectType.Account.getRecordTypeInfosByName().get('EMEA Account').getRecordTypeId(),1,false)[0];
	       a.Programming_Languages_Supported__c = Account.Programming_Languages_Supported__c.getDescribe().getPicklistValues()[0].getLabel();
	       insert a;
	       //create a contact 
	       c =TestUtil.createContact(a.Id,5,true)[0];
	       PartnerDeveloperBio obj = PartnerDeveloperBio.initPartnerDeveloperBio(c.Id);
	       System.assertEquals(obj.programmingselected[0],a.Programming_Languages_Supported__c);
      Test.stopTest();
    }
    //Positive Test Case
     static testMethod void testPartnerDevloperBioApplicationTypesSupported() {
       Test.startTest();
	       //Create an account
	       a =TestUtil.createAccount(Schema.SObjectType.Account.getRecordTypeInfosByName().get('EMEA Account').getRecordTypeId(),1,false)[0];
	       a.Application_Types_Supported__c =  Account.Application_Types_Supported__c.getDescribe().getPicklistValues()[0].getLabel();
	       insert a;
	       //create a contact 
	       c =TestUtil.createContact(a.Id,5,true)[0];
	       PartnerDeveloperBio obj = PartnerDeveloperBio.initPartnerDeveloperBio(c.Id);
	       System.assertEquals(obj.apptypeselected[0],a.Application_Types_Supported__c);
      Test.stopTest();
    }
     //Negative Test Case
      static testMethod void testPartnerDevloperBioInvalidRecordId() {
       Test.startTest();
	       //Create an account
	       a =TestUtil.createAccount(Schema.SObjectType.Account.getRecordTypeInfosByName().get('EMEA Account').getRecordTypeId(),1,false)[0];
	       a.Client_Type__c = Account.Client_Type__c.getDescribe().getPicklistValues()[0].getLabel();
	       insert a;
	       //create a contact 
	       c =TestUtil.createContact(a.Id,5,false)[0];
	       Try{
	              PartnerDeveloperBio obj = PartnerDeveloperBio.initPartnerDeveloperBio('');
	       }catch(Exception e){
	             Boolean expectedExceptionThrown =  e.getMessage().contains(constants.INVALID_ID) ? true : false;
	           System.AssertEquals(expectedExceptionThrown, true);
	       }
      Test.stopTest();
    }
    //Test Save Date Method 
    static testMethod void testPartnerDevloperBioSaveData() {
      Test.startTest();
	       //Create an account
	       Account a =TestUtil.createAccount(Schema.SObjectType.Account.getRecordTypeInfosByName().get('EMEA Account').getRecordTypeId(),50,true)[0];
	       
           //Application Type selected 
	       List<String> apptypeselected = new List<String>();
           Schema.DescribeFieldResult fieldResultATS = Account.Application_Types_Supported__c.getDescribe();
		   List<Schema.PicklistEntry> pleApp = fieldResultATS.getPicklistValues();
		   for( Schema.PicklistEntry pickListVal : pleApp){
			  apptypeselected.add(pickListVal.getLabel());
		   }     
           //Programing Type selected 
	       List<String> programmingselected = new List<String>();
           Schema.DescribeFieldResult fieldResultPLS = Account.Programming_Languages_Supported__c.getDescribe();
		   List<Schema.PicklistEntry> pleProg = fieldResultPLS.getPicklistValues();
		   for( Schema.PicklistEntry pickListVal : pleProg){
			  programmingselected.add(pickListVal.getLabel());
		   }     
	       //Client Type selected 
	       List<String> clienttypeselected = new List<String>();
           Schema.DescribeFieldResult fieldResultClient = Account.Client_Type__c.getDescribe();
		   List<Schema.PicklistEntry> pleClient = fieldResultPLS.getPicklistValues();
		   for( Schema.PicklistEntry pickListVal : pleClient){
			  clienttypeselected.add(pickListVal.getLabel());
		   }   
	           
	       //create a contact 
	       c =TestUtil.createContact(a.id,5,true)[0];
	       PartnerDeveloperBio obj = PartnerDeveloperBio.saveData(c.Id,'Test Company Information', 'Test servicesOffered','Test referenceClients', '7',  apptypeselected, programmingselected,clienttypeselected);
	       Account acc = [Select id,Number_of_Employees__c,Company_Information__c,Services_Offered__c,Reference_Clients__c,Application_Types_Supported__c,Programming_Languages_Supported__c,Client_Type__c from Account where id=: a.id];
	       /*System.assertEquals(acc.Number_of_Employees__c, '7');
	       System.assertEquals(acc.Company_Information__c, 'Test Company Information');
	       System.assertEquals(acc.Services_Offered__c, 'Test servicesOffered');
	       System.assertEquals(acc.Reference_Clients__c, 'Test referenceClients');
	       System.assertEquals(acc.Application_Types_Supported__c,String.join(apptypeselected, ';'));
	       System.assertEquals(acc.Programming_Languages_Supported__c,String.join(programmingselected, ';'));
	       System.assertEquals(acc.Client_Type__c,String.join(clienttypeselected, ';'));*/
      Test.stopTest();
    }
      //Negative Test Case
      static testMethod void testPartnerDevloperBioSaveDataWithNullValue() {
	      Test.startTest();
	       //Create an account
	       a =TestUtil.createAccount(Schema.SObjectType.Account.getRecordTypeInfosByName().get('EMEA Account').getRecordTypeId(),1,false)[0];
	       a.Client_Type__c = Account.Client_Type__c.getDescribe().getPicklistValues()[0].getLabel();
	       insert a;
	         //Application Type selected 
	       List<String> apptypeselected = new List<String>();
           Schema.DescribeFieldResult fieldResultATS = Account.Application_Types_Supported__c.getDescribe();
		   List<Schema.PicklistEntry> pleApp = fieldResultATS.getPicklistValues();
		   for( Schema.PicklistEntry pickListVal : pleApp){
			  apptypeselected.add(pickListVal.getLabel());
		   }     
           //Programing Type selected 
	       List<String> programmingselected = new List<String>();
           Schema.DescribeFieldResult fieldResultPLS = Account.Programming_Languages_Supported__c.getDescribe();
		   List<Schema.PicklistEntry> pleProg = fieldResultPLS.getPicklistValues();
		   for( Schema.PicklistEntry pickListVal : pleProg){
			  programmingselected.add(pickListVal.getLabel());
		   }     
	       List<String> clienttypeselected = new List<String>();
	           
	       //create a contact 
	       c =TestUtil.createContact(a.Id,5,true)[0];
	     
	       Try{
	              PartnerDeveloperBio obj = PartnerDeveloperBio.saveData(c.id,'Test Company Information', 'Test servicesOffered','Test referenceClients', 'Test empvalue',  apptypeselected, programmingselected,clienttypeselected);
	       }catch(Exception e){
	             Boolean expectedExceptionThrown =  e.getMessage().contains(constants.FILL_REQUIRED_FIELDS) ? true : false;
	           System.AssertEquals(expectedExceptionThrown, true);
	       }
	      Test.stopTest();
      }
    //Negative Test Case
     static testMethod void testPartnerDevloperBioSaveDataWithNullContactID() {
       Test.startTest();
	    	    //Create an account
	       a =TestUtil.createAccount(Schema.SObjectType.Account.getRecordTypeInfosByName().get('EMEA Account').getRecordTypeId(),1,false)[0];
	       a.Client_Type__c = 'Small Office/Home Office';
	       insert a;
	       List<String> apptypeselected = new List<String>();
	       List<String> programmingselected = new List<String>();
	       List<String> clienttypeselected = new List<String>();
	           
	       //create a contact 
	       c =TestUtil.createContact(a.Id,5,false)[0];
	        Try{
	              PartnerDeveloperBio obj = PartnerDeveloperBio.saveData(null,'Test Company Information', 'Test servicesOffered','Test referenceClients', 'Test empvalue',  apptypeselected, programmingselected,clienttypeselected);
	       }catch(Exception e){
	             Boolean expectedExceptionThrown =  e.getMessage().contains(constants.INVALID_ID) ? true : false;
	           System.AssertEquals(expectedExceptionThrown, true);
	       }
      Test.stopTest();
     } 
}