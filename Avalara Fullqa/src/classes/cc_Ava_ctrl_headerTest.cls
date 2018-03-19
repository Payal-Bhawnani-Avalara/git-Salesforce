@isTest
public class cc_Ava_ctrl_headerTest {    
    @testSetup
    static void testSetup() { 
        Ava_In_Maintenance__c avaDevTestEnv= new Ava_In_Maintenance__c(Name='Ava Dev Environment',Turn_Off_Site_for_Maintenance__c=true,URL_for_redirection__c='test.example.com');
        insert avaDevTestEnv;
    }
    @isTest static void headerTest() { 
        Test.startTest();
		cc_Ava_ctrl_header ctrler= new cc_Ava_ctrl_header();
        Test.stopTest();
        System.assert(ctrler.isRedirect);
        System.assertEquals('test.example.com', ctrler.redirectLoc);
    }
}