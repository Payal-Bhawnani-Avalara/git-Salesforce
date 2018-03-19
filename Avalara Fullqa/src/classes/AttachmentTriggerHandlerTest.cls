@isTest
public class AttachmentTriggerHandlerTest {
	private static Case c;
	private static Attachment a;
	private static user u;
	@testSetup static void setup() {
      //Setup custom setting
       List<KeyPairValue__c> listKeyPairValue=new List<KeyPairValue__c>(); 
       listKeyPairValue.add(new KeyPairValue__c(Name='Boomi_API_URL_Sandbox',Values__c='http://api.salesforce.com/'));
       listKeyPairValue.add(new KeyPairValue__c(Name='Boomi_API_Key',Values__c='123456'));
       listKeyPairValue.add(new KeyPairValue__c(Name='Boomi_API_URL_Production',Values__c='http://api.salesforce.com/'));
       listKeyPairValue.add(new KeyPairValue__c(Name='ZTBuyAPICaseSafeID ',Values__c='00533000003RbvNAAS '));
       insert listKeyPairValue;
     }
     
	static testMethod void testAttInsert() {
		Test.startTest();
		 Id ava2MasterAdminProfileId = [Select Id from Profile where Name ='Ava2 Master Admin' limit 1].id;
         u = TestUtil.createUSer(ava2MasterAdminProfileId,null,1,true)[0];
		
		Id zytaxCaseRecTypeId=[Select Id from RecordType where DeveloperName='Zytax_Case_v1' limit 1].Id;
		c=TestUtil.createCase(zytaxCaseRecTypeId,5,true)[0];
		
		System.runAs(u) {
		 a = TestUtil.createAttachment(5,false)[0];
		 a.parentid = c.id;	
		 insert a;
		}
		Test.stopTest();
		Case ca= [Select id, SendAttachmentEmail__c from Case where id=:c.id];
		system.assertEquals(ca.SendAttachmentEmail__c,false);
	}  
	static testMethod void testAttUpdate() {
		Test.startTest();
		 Id ava2MasterAdminProfileId = [Select Id from Profile where Name ='Ava2 Master Admin' limit 1].id;
         u = TestUtil.createUSer(ava2MasterAdminProfileId,null,1,true)[0];
		
		Id zytaxCaseRecTypeId=[Select Id from RecordType where DeveloperName='Zytax_Case_v1' limit 1].Id;
		c=TestUtil.createCase(zytaxCaseRecTypeId,5,true)[0];
		System.runAs(u) {
		 a = TestUtil.createAttachment(5,false)[0];
		 a.parentid = c.id;	
		 insert a;
		 a.description = 'Test';
		 update a;
		}
		Test.stopTest();
		Case ca= [Select id, SendAttachmentEmail__c from Case where id=:c.id];
		system.assertEquals(ca.SendAttachmentEmail__c,false);
	}  
	static testMethod void testAttDelete() {
		Test.startTest();
		 Id ava2MasterAdminProfileId = [Select Id from Profile where Name ='Ava2 Master Admin' limit 1].id;
         u = TestUtil.createUSer(ava2MasterAdminProfileId,null,1,true)[0];
		
		Id zytaxCaseRecTypeId=[Select Id from RecordType where DeveloperName='Zytax_Case_v1' limit 1].Id;
		c=TestUtil.createCase(zytaxCaseRecTypeId,5,true)[0];
		System.runAs(u) {
		 a = TestUtil.createAttachment(5,false)[0];
		 a.parentid = c.id;	
		 insert a;
		 delete a;
		}
		Test.stopTest();
		Case ca= [Select id, SendAttachmentEmail__c from Case where id=:c.id];
		system.assertEquals(ca.SendAttachmentEmail__c,false);
	}  
}