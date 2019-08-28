public with sharing class MiscUsers {
    public List<User> ActiveFrozenRecords {get; set;}
    public List<User> ActiveNoLoginRecords {get;set;}
    public List<userlicense> CurrentLicenses {get;set;}
    public List<PackageLicense> CurrentPROS {get;set;}
    public List<PackageLicense> CurrentDE {get;set;}

    public MiscUsers(){
        ActiveFrozenRecords =
            [SELECT Full_Name__c, Email, ID, Profile.Name,Days_Since_Freeze__c From User where ID IN (SELECT UserID from Userlogin where IsFrozen = True) and Profile.Name != 'PSE - Consultant (Platform User)' and IsActive = True ORDER by Days_Since_Freeze__c DESC];

        ActiveNoLoginRecords = 
			[SELECT Full_Name__c,Email,ID,LastLoginDate,LastModifiedDate, Profile.Name,Profile.UserLicense.Name from User where Profile.UserLicense.LicenseDefinitionKey = 'SFDC' AND (NOT USERNAME like 'dma@avalara.com') AND (NOT USERNAME like 'glautomation@avalara.com') AND (NOT USERNAME like  'pendgli@avalara.com') AND (NOT USERNAME like 'psunassigned@avalara.com') AND (NOT USERNAME like '%insightssecurity%') AND (NOT USERNAME like 'dg-extding@avalara.com') AND (NOt Username like 'camaccount@avalara.com') and (NOT username like 'inside.sales@avalara.com') and (not username like 'golivebacklog@avalara.com') AND (NOT Full_name__c like '%Account Distribution%') AND isActive=true and (Not Profile.name like '%api%') and (not Profile.Name like '%Community%') AND ID IN (SELECT UserID from Userlogin where IsFrozen = False) and email != 'golive@avalara.com' and Profile.Name != 'PSE - Consultant (Platform User)' and lastLoginDate <= :DATE.TODAY()-45  ORDER by Profile.Name];

		CurrentLicenses = [SELECT Name, TotalLicenses, UsedLicenses FROM userlicense WHERE name = 'Salesforce'];
		CurrentPROS = [SELECT Id, Status, AllowedLicenses, UsedLIcenses, NamespacePrefix FROM PackageLicense WHERE NamespacePrefix = 'CameleonCPQ'];
		CurrentDE = [SELECT Id, Status, AllowedLicenses, UsedLIcenses, NamespacePrefix from PackageLicense where namespaceprefix = 'n2de'];
    }
}