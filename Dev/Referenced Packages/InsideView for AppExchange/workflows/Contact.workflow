<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <outboundMessages>
        <fullName>InsideView_Contacts_Outbound_Message</fullName>
        <apiVersion>43.0</apiVersion>
        <description>This is used for notifying InsideView Refresh for Contacts.</description>
        <endpointUrl>https://integrations.insideview.com/integrations-notifications/salesforce/contact?authType=IV_SALESFORCE_CANVAS</endpointUrl>
        <fields>AccountId</fields>
        <fields>Id</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>kory.leavitt@avalara.com</integrationUser>
        <name>InsideView Contacts Outbound Message</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>InsideView Outbound Rule for Contacts</fullName>
        <actions>
            <name>InsideView_Contacts_Outbound_Message</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <formula>CONTAINS($Setup.InsideView_Notification_Enabler__c.InsideView_Notification_Enabler__c, &quot;Contact.UPDATE&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>InsideView Outbound Rule for New Contacts</fullName>
        <actions>
            <name>InsideView_Contacts_Outbound_Message</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <formula>CONTAINS($Setup.InsideView_Notification_Enabler__c.InsideView_Notification_Enabler__c, &quot;Contact.CREATE&quot;)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
