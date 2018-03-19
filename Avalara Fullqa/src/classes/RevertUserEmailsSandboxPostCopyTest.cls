@isTest
private class RevertUserEmailsSandboxPostCopyTest {
    private static User u;
    
    static testMethod void testPostRefreshEmailUpdate(){
    	Id ava2MasterAdminProfileId = [Select Id from Profile where Name ='Ava2 Master Admin' limit 1].id;
        u = TestUtil.createUSer(ava2MasterAdminProfileId,null,1,false)[0];
        u.isActive = true;
        u.IsSandboxUser__c=true;
        u.email = 'test=test.com@example.com';
        insert u;
        List<Organization> org = ([select id from Organization limit 1]);
        
        Test.startTest();
      
			Test.testSandboxPostCopyScript(new RevertUserEmailsSandboxPostCopy(), org[0].Id, org[0].Id, 'TestSandbox');
        
        Test.stopTest();
        User uTest= [SELECT id,Profileid,email FROM User WHERE id =: u.id];
        Profile p =[Select id,IsSsoEnabled from Profile where id = : u.profileid];
        System.assertEquals( 'test@test.com', uTest.email );
        //System.assertEquals(p.IsSsoEnabled,false);

    }
    
}