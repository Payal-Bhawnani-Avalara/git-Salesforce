public with sharing class MiscUsers {
    public List<User> Records {get; set;}
    
    public MiscUsers(){
        Records =
            [SELECT FirstName, LastName, Email, ID, LastModifiedDate From User where ID IN (SELECT UserID from Userlogin where IsFrozen = True) and IsActive = True];
    }
    public static List<PermissionSetAssignment> GetPermSetsByUserID(String Id){
 		List<PermissionSetAssignment> PermSets = new List<PermissionSetAssignment>();
        PermSets = [SELECT ID from PermissionSetAssignment where AssigneeID = :Id];
        return PermSets;
    }
    public static User GetUserMetaDataByUserID(String Id){
        User thisuser = new User();
        thisuser = [SELECT Id, Full_Name__c
                    ,ForecastEnabled
                    ,JigsawImportLimitOverride
                    ,ManagerId
                    ,ProfileId
                    ,UserPermissionsInteractionUser
                    ,UserPermissionsJigsawProspectingUser
                    ,UserPermissionsKnowledgeUser
                    ,UserPermissionsLiveAgentUser
                    ,UserPermissionsMarketingUser
                    ,UserPermissionsMobileUser
                    ,UserPermissionsOfflineUser
                    ,UserPermissionsSFContentUser
                    ,UserPermissionsSupportUser
                    ,UserPermissionsWorkDotComUserFeature
                    ,UserRoleId 
                    from User where Id =:Id];
        return thisuser;
    }
    
    public static String CloneNewUser(User mirroruser, String newuserID){
        User newuser = new User();
        newuser.Id = newuserID;
        newuser.ForecastEnabled = mirroruser.ForecastEnabled;
		newuser.JigsawImportLimitOverride = mirroruser.JigsawImportLimitOverride;
        newuser.ManagerId = mirroruser.ManagerId;
        newuser.ProfileId = mirroruser.ProfileId;
        newuser.UserPermissionsInteractionUser = mirroruser.UserPermissionsInteractionUser;
        newuser.UserPermissionsJigsawProspectingUser = mirroruser.UserPermissionsJigsawProspectingUser;
        newuser.UserPermissionsKnowledgeUser = mirroruser.UserPermissionsKnowledgeUser;
        newuser.UserPermissionsLiveAgentUser = mirroruser.UserPermissionsLiveAgentUser;
        newuser.UserPermissionsMarketingUser = mirroruser.UserPermissionsMarketingUser;
        newuser.UserPermissionsMobileUser = mirroruser.UserPermissionsMobileUser;
        newuser.UserPermissionsOfflineUser = mirroruser.UserPermissionsOfflineUser;
        newuser.UserPermissionsSFContentUser = mirroruser.UserPermissionsSFContentUser;
        newuser.UserPermissionsSupportUser = mirroruser.UserPermissionsSupportUser;
        newuser.UserPermissionsWorkDotComUserFeature = mirroruser.UserPermissionsWorkDotComUserFeature;
        newuser.UserRoleId = mirroruser.UserRoleId;
        
        update newuser;
        return 'ok';
    }
}