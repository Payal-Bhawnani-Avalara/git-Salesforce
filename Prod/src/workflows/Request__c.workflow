<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>SendNewUserRequest</fullName>
        <description>SendNewUserRequest</description>
        <protected>false</protected>
        <recipients>
            <recipient>sara.simrell@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Launch_Community/Partner_Launch_New_User_Request</template>
    </alerts>
    <rules>
        <fullName>Send New User Request</fullName>
        <actions>
            <name>SendNewUserRequest</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Request__c.Last_Name__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
