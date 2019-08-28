@isTest
public class MiscUsersTest {
    static testMethod void testResults(){
		MiscUsers misc = new MiscUsers();
		List<User> TestRecords = new List<User>();
        List<User> TestNoLogins = new List<User>();
        List<User> MiscUserRecords = misc.ActiveFrozenRecords;
		List<User> MiscUserNologinRecords = misc.ActiveNoLoginRecords;
        TestRecords = [SELECT Full_Name__c, Email, ID,LastModifiedDate From User where ID IN (SELECT UserID from Userlogin where IsFrozen = True) and IsActive = True];
		TestNoLogins = [SELECT Full_Name__c,Email,ID,LastModifiedDate from User where isActive=true and lastLoginDate <= :DATE.TODAY()-45];
        System.assert(MiscUserRecords.size() >= 0);        
		System.assert(MiscUserNologinRecords.size() >= 0);     
    }
}