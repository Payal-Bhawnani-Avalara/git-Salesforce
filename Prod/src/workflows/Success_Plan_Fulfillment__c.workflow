<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_Schedule_Options</fullName>
        <ccEmails>aaron.zapf@avalara.com</ccEmails>
        <description>Email Schedule Options</description>
        <protected>false</protected>
        <recipients>
            <field>Bill_to_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Templates/Invitation_to_GoLive_Planning_Call</template>
    </alerts>
    <rules>
        <fullName>Online Alert Scheduler Email</fullName>
        <actions>
            <name>Email_Schedule_Options</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Success_Plan_Fulfillment__c.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
