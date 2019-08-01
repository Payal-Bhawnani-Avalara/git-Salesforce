/*------------------------------------------------------------------------+
Original Shift(developer@originalshift.com)
Purpose: Handles logic for the User Trigger in the OSCPQ Package
 
Details: - Handles Package License Assignment and Permission Set Assignment for users
 
History:
Mar 23/19 - Original Shift - Initial Implementation
------------------------------------------------------------------------+*/ 
public class OSCPQ_UserTriggerHandler {
    private final string cpqUserPermSetAPIName = 'SteelBrickCPQUser';
    private final string oscpqUserPermSetAPIName = 'OSCPQ_Salesforce_CPQ_User';
    @testVisible private Id cpqPackageLicenseId;
    @testVisible private Id cpqUserPermSetId;
    @testVisible private Id oscpqUserPermSetId;
    private List<UserPackageLicense> newPackageLicenseAssignmentList = new List<UserPackageLicense>();
    private List<PermissionSetAssignment> newCPQUserPermSetAssignmentList = new List<PermissionSetAssignment>();
    private List<PermissionSetAssignment> newOSCPQUserPermSetAssignmentList = new List<PermissionSetAssignment>();
    
    /*
     * Constructor - queries for the relevant Package License and Permission Set Ids
     */
	public OSCPQ_UserTriggerHandler(){
        //Try getting the CPQ Package License
        cpqPackageLicenseId = null;
        List<PackageLicense> licenseList = [SELECT Id FROM PackageLicense WHERE NamespacePrefix = 'SBQQ'];
        if(!licenseList.isEmpty()) {
            cpqPackageLicenseId = licenseList[0].Id;
        }
        
        //Try getting the CPQ and OSCPQ Permission Set Ids
        cpqUserPermSetId = null;
        oscpqUserPermSetId = null;
        List<String> permSetNameList = new List<String>{cpqUserPermSetAPIName, oscpqUserPermSetAPIName};
        for(PermissionSet pSet : [SELECT Id, Name FROM PermissionSet WHERE Name IN :permSetNameList]) {
            if(pSet.Name == cpqUserPermSetAPIName) {
                cpqUserPermSetId = pSet.Id;
            }
            else if(pSet.Name == oscpqUserPermSetAPIName) {
                oscpqUserPermSetId = pSet.Id;
            }
        }
    }
    
    /*
    * Method that runs on After Insert triggers; checks the user checkbox and invokes the private
    * addCPQLicenseAssignment and addCPQUserPermissions methods, and finally inserts the license/permissions
    */
    public void onAfterInsert(List<User> newUserList) {
        List<Id> newCPQUserIdList = new List<Id>();
        for(User usr: newUserList) {
            if(usr.OSCPQ_CPQ_Internal_User__c == true) {
                newCPQUserIdList.add(usr.Id);
            }
        }
        if(!newCPQUserIdList.isEmpty()){
            this.addCPQLicenseAssignment(newCPQUserIdList);
            this.addCPQUserPermSetAssignment(newCPQUserIdList);
            
            this.insertLicenseAndPermissions();
        }
    }
    
    /*
    * Method that runs on After Update triggers; checks the user checkbox and invokes the private
    * addCPQLicenseAssignment and addCPQUserPermissions methods, and finally inserts the license/permissions
    */
    public void onAfterUpdate(List<User> newUserList, Map<Id, User> oldUserMap) {
        
        //Build list of users to Insert New Licenses
        List<Id> newCPQUserIdList = new List<Id>();
        for(User usr: newUserList) {
            if(usr.OSCPQ_CPQ_Internal_User__c == true && oldUserMap.containsKey(usr.Id) && oldUserMap.get(usr.Id).OSCPQ_CPQ_Internal_User__c == false) {
                newCPQUserIdList.add(usr.Id);
            }
        }
        //Do new license inserts
        if(!newCPQUserIdList.isEmpty()){
            this.addCPQLicenseAssignment(newCPQUserIdList);
            this.addCPQUserPermSetAssignment(newCPQUserIdList);
            
            this.insertLicenseAndPermissions();
        }
        
        //Build list of users to Delete license/permision set assignments
        List<Id> nonCPQUserIdList = new List<Id>();
        for(User usr: newUserList) {
            if(usr.OSCPQ_CPQ_Internal_User__c == false && oldUserMap.containsKey(usr.Id) && oldUserMap.get(usr.Id).OSCPQ_CPQ_Internal_User__c == true) {
                nonCPQUserIdList.add(usr.Id);
            }
        }
        
        if(!nonCPQUserIdList.isEmpty()) {
            this.removeCPQAssignments(nonCPQUserIdList);
        }
        
    }
        
    /*
     * Method intakes a List of current new assignments, and appends to that list an assignment for the specified user
     */
    private void addCPQLicenseAssignment(List<Id> newCPQUserIds) {
        
        if(!newCPQUserIds.isEmpty()) {
            List<Id> userIdForAssignmentList = new List<Id>(newCPQUserIds);
            
            //Check for any existing CPQ Package License assignments for the relevant users, and remove the users from being assigned a new license (prevent dupes)
            for(UserPackageLicense existingLicense : [SELECT Id, UserId FROM UserPackageLicense WHERE PackageLicenseId = :cpqPackageLicenseId AND UserId IN :newCPQUserIds]) {
                Integer newUserIndex = userIdForAssignmentList.indexOf(existingLicense.UserId);
                if(newUserIndex != -1) {
                    userIdForAssignmentList.remove(newUserIndex);
                }
            }
            
            //Add actual assignment records to class variable
            for(Id newCPQUserId : userIdForAssignmentList) {
            	newPackageLicenseAssignmentList.add(new UserPackageLicense(UserId = newCPQUserId, PackageLicenseId = cpqPackageLicenseId));
       		}
        }        
    }
    
    /*
     * Method intakes a List of current new permission set assignments, and appends to that list an assignment for the specified user
     */
    private void addCPQUserPermSetAssignment(List<Id> newCPQUserIds) {
        if(!newCPQUserIds.isEmpty()) {
            List<Id> userIdForCPQUserAssignmentList = new List<Id>(newCPQUserIds);
            List<Id> userIdForOSCPQUserAssignmentList = new List<Id>(newCPQUserIds);
            
            //Check for any existing CPQ Package License assignments for the relevant users, and remove the users from being assigned a new license (prevent dupes)
            for(PermissionSetAssignment existingAssignment : [SELECT AssigneeId, PermissionSetId FROM PermissionSetAssignment WHERE PermissionSetId IN (:cpqUserPermSetId, :oscpqUserPermSetId) AND AssigneeId IN :newCPQUserIds]) {
                if(existingAssignment.PermissionSetId == cpqUserPermSetId) { //check for the managed package's permission set
                    Integer newUserIndex = userIdForCPQUserAssignmentList.indexOf(existingAssignment.AssigneeId);
                    if(newUserIndex != -1) {
                        userIdForCPQUserAssignmentList.remove(newUserIndex);
                    }
                }
                else if(existingAssignment.PermissionSetId == oscpqUserPermSetId) { //check for the OSCPQ package's permission set
                    Integer newUserIndex = userIdForOSCPQUserAssignmentList.indexOf(existingAssignment.AssigneeId);
                    if(newUserIndex != -1) {
                        userIdForOSCPQUserAssignmentList.remove(newUserIndex);
                    }
                }
            }
            
            //Assign to the CPQ package User permission set
            for(Id newCPQUserId : userIdForCPQUserAssignmentList) {
                newCPQUserPermSetAssignmentList.add(new PermissionSetAssignment(AssigneeId = newCPQUserId, PermissionSetId = cpqUserPermSetId));
            }
            //Assign to the OSCPQ package User permission set
            for(Id newCPQUserId : userIdForOSCPQUserAssignmentList) {
                newOSCPQUserPermSetAssignmentList.add(new PermissionSetAssignment(AssigneeId = newCPQUserId, PermissionSetId = oscpqUserPermSetId));
            }
        }  
    }
    
    private void removeCPQAssignments(List<Id> nonCPQUserIdList) {
        //Get & Remove CPQ Package Licenses
        List<UserPackageLicense> licensesToRemoveList = [SELECT Id FROM UserPackageLicense WHERE PackageLicenseId = :cpqPackageLicenseId AND UserId IN :nonCPQUserIdList];
        if(!licensesToRemoveList.isEmpty()) {
            delete licensesToRemoveList;
        }
        
        //Get & Remove CPQ & OSCPQ User Permission Sets
        List<PermissionSetAssignment> permSetAssignmentsToRemoveList = [SELECT Id FROM PermissionSetAssignment WHERE PermissionSetId IN (:cpqUserPermSetId, :oscpqUserPermSetId) AND AssigneeId IN :nonCPQUserIdList];
        if(!permSetAssignmentsToRemoveList.isEmpty()) {
            delete permSetAssignmentsToRemoveList;
        }
    }
    
    /*
     * Small helper method that simply handles any inserts and does error handling
     */
    private void insertLicenseAndPermissions() {      
        if(!newPackageLicenseAssignmentList.isEmpty()) {
            insert newPackageLicenseAssignmentList;
        }
        if(!newCPQUserPermSetAssignmentList.isEmpty()) {
            insert newCPQUserPermSetAssignmentList;
        }
        if(!newOSCPQUserPermSetAssignmentList.isEmpty()) {
            insert newOSCPQUserPermSetAssignmentList;
        }
    }
}