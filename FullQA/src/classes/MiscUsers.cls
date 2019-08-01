public with sharing class MiscUsers {
    public List<User> Records {get; set;}
    public MiscUsers(){
        Records =
            [SELECT FirstName, LastName, Email, ID, LastModifiedDate From User where ID IN (SELECT UserID from Userlogin where IsFrozen = True) and IsActive = True];
    }
}