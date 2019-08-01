@isTest
public class EventTriggerHandlerTest {
    private static Account a;
	private static Contact c;
	private static User u;
	private static Connector__c con;
	private static Opportunity o;
	private static OpportunityContactRole oCR;
	private static Event eI,eDeM,eDe,eDi;
	private static KeyPairValue__c kpMeetingType,kpOpportunitySubType; //Event with meeting Type Intrest,Demo Mid Market,Demo , Discovery
	
	 @testSetup static void setup() {
       //Setup custom setting
       List<KeyPairValue__c> listKeyPairValue=new List<KeyPairValue__c>(); 
       listKeyPairValue.add(new KeyPairValue__c(Name='OpportunitySubType',Values__c='AvaTax@@BizDev@@SOHO'));
       insert listKeyPairValue;
     }
	static void init(){
    	   //Create an account
    	   Id customerAccountTypeId=[Select Id from RecordType where DeveloperName='Customer_Account_Type' limit 1].Id;
       a =TestUtil.createAccount(customerAccountTypeId,1,true)[0];
       //create a contact 
       c =TestUtil.createContact(a.Id,5,true)[0];
       //create user 
       Id ava2MasterAdminProfileId = [Select Id from Profile where Name ='Ava2 Master Admin' limit 1].id;
       u = TestUtil.createUSer(ava2MasterAdminProfileId,null,1,true)[0];
       //create Connector 
       con = TestUtil.createConnector(a.id,a.id,1,true)[0];
       //create Opportunity
       Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
       o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,false)[0];
       o.Connector__c = con.id;
       insert o;
       //Create OpportunityContactRole
       oCR = TestUtil.createOpportunityContactRole(o.id,c.id,null,1,true)[0];	
	}
	static testMethod void testEventMeetingTypeIntrest() {	
	  init();
	  //Event with Meeting Type Interest            
      eI =  TestUtil.createEvent(c.id,a.id,u.id,1,true)[0];
      List <Event> testqueryres = [SELECT WhatId FROM Event WHERE Id = :eI.Id];            
      //system.assertEquals(testqueryres.get(0).WhatId, o.Id );
	} 
    static testMethod void testEventMeetingTypeDemoMM() {  
    	  init();
      //Event with Meeting Type Demo Mid Market 
      eDeM =  TestUtil.createEvent(c.id,a.id,u.id,1,false)[0];
      eDeM.Meeting_Type_CP__c = 'Demo Mid Market';
      insert eDeM;     
      List <Event> testqueryresDemoMidMarket = [SELECT WhatId FROM Event WHERE Id = :eDeM.Id];            
      //system.assertEquals(testqueryresDemoMidMarket.get(0).WhatId, o.Id );    
    }
    static testMethod void testEventMeetingTypeDemo() {  
    	init();
     //Event with Meeting Type Demo 
     eDe =  TestUtil.createEvent(c.id,a.id,u.id,1,false)[0];
     eDe.Meeting_Type_CP__c = 'Demo';
     insert eDe; 
     List <Event> testqueryresDemo = [SELECT WhatId FROM Event WHERE Id = :eDe.Id];            
     //system.assertEquals(testqueryresDemo.get(0).WhatId, o.Id );
    }
    static testMethod void testEventMeetingTypeDiscoverey() {  
     init();
     //Event with Meeting Type Discoverey 
     eDi = TestUtil.createEvent(c.id,a.id,u.id,1,false)[0];
     eDi.Meeting_Type_CP__c = 'Discoverey';        
     insert eDi;  
     List <Event> testqueryresDiscoverey = [SELECT WhatId FROM Event WHERE Id = :eDi.Id];            
     //system.assertEquals(testqueryresDiscoverey.get(0).WhatId, o.Id );      
	}
	
}