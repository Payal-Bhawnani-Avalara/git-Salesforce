<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>New_User_With_Read_Only_Profile</fullName>
        <description>New User With Read Only Profile</description>
        <protected>false</protected>
        <recipients>
            <recipient>walter.kimbrough@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/NewUserReadOnlyProfile</template>
    </alerts>
    <fieldUpdates>
        <fullName>Role_Changed_Date</fullName>
        <field>Sales_Tenure_Date__c</field>
        <formula>Today()</formula>
        <name>Role Changed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Role_Name</fullName>
        <field>RoleNameStamp__c</field>
        <formula>RoleName__c</formula>
        <name>Stamp Role Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Current Role Tenure Date Stamp</fullName>
        <actions>
            <name>Role_Changed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamps todays date if the users role is changed. User to track tenure of sales reps.
and how long they have been in current role.</description>
        <formula>OR(ISNEW(),  ISCHANGED( UserRoleId ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Role Name</fullName>
        <actions>
            <name>Stamp_Role_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(
AND(
ISNEW(), 
NOT(ISBLANK(UserRoleId ))
),
AND(
ISCHANGED(UserRoleId),
NOT(ISBLANK(UserRoleId))
)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Welcome Email</fullName>
        <active>false</active>
        <criteriaItems>
            <field>User.Email</field>
            <operation>contains</operation>
            <value>avalara.com</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
