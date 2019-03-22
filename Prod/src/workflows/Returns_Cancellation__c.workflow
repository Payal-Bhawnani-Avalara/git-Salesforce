<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_Returns_Survey_FYI</fullName>
        <ccEmails>service-ops@avalara.com</ccEmails>
        <description>Send Returns Survey FYI</description>
        <protected>false</protected>
        <recipients>
            <recipient>cathleen.wellbrock@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Cancellation_Templates/Returns_Cancellation_Request_FYI</template>
    </alerts>
    <fieldUpdates>
        <fullName>Stamp_Date_Requested</fullName>
        <field>Date_Requested__c</field>
        <formula>NOW ()</formula>
        <name>Stamp Date Requested</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Returns Survey Notification</fullName>
        <actions>
            <name>Send_Returns_Survey_FYI</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Stamp_Date_Requested</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Returns_Cancellation__c.CreatedById</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
