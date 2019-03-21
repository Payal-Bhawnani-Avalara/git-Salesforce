<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>New_Error_Notification</fullName>
        <description>New Error Notification</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>AAkonsult_Campaign_Status/Error_Log_Notification</template>
    </alerts>
    <rules>
        <fullName>Error Log Notification</fullName>
        <actions>
            <name>New_Error_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Error_Log__c.CreatedById</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Send Notification that a new error has been logged.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
