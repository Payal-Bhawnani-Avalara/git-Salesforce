@isTest
private class CC_AVA_Util_Test {

    static testMethod void testgetSandboxName() {
        CC_AVA_Util.getSandboxName();      
        User u=createUser(userinfo.getProfileId(), 'avalarastore@aa-bb.ccc', 'example@example.com', 'fname', 'lname', 'alfname');
        System.runAs(u){
        		CC_AVA_Util.getSandboxName();
        }
        u=createUser(userinfo.getProfileId(), 'avalarastore@aabb.ccc.dev', 'example@example.com', 'fname', 'lname', 'alfname');
        System.runAs(u){
        		CC_AVA_Util.getSandboxName();
        }        
    }
    static User createUser(Id pid, String username, String emailAddress, String firstName, String lastName, String alias){
        User u = new User(
            FirstName         = firstName,
            LastName          = lastName,
            Email             = emailAddress,
            Alias             = alias,
            Username          = username,
            LocaleSidKey      = 'en_US',
            TimeZoneSidKey    = 'GMT',
            ProfileID         = pid,
            LanguageLocaleKey = 'en_US',
            EmailEncodingKey  = 'UTF-8'
        );   
        return u; 	
    }
}