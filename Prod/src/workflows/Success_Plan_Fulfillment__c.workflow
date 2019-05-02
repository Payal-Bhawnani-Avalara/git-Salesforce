<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_Schedule_Options</fullName>
        <description>Email Schedule Options</description>
        <protected>false</protected>
        <recipients>
            <field>Bill_to_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>service-reply@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>GoLive_Templates/Invitation_to_GoLive_Planning_Call</template>
    </alerts>
    <rules>
        <fullName>Online Alert Scheduler Email</fullName>
        <actions>
            <name>Email_Schedule_Options</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Online_Scheduler_Email_Sent</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Success_Plan_Fulfillment__c.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <tasks>
        <fullName>Online_Scheduler_Email_Sent</fullName>
        <assignedTo>salesforce.admin@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Online Scheduler Email Sent</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Online Scheduler Email Sent</subject>
    </tasks>
</Workflow>
