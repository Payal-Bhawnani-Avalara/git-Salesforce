<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <outboundMessages>
        <fullName>Lead_Outbound_Message</fullName>
        <apiVersion>43.0</apiVersion>
        <description>This is used for notifying InsideView Refresh for Leads.</description>
        <endpointUrl>https://integrations.insideview.com/integrations-notifications/salesforce/lead?authType=IV_SALESFORCE_CANVAS</endpointUrl>
        <fields>CreatedById</fields>
        <fields>Id</fields>
        <fields>LastModifiedById</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>kory.leavitt@avalara.com</integrationUser>
        <name>InsideView Leads Outbound Message</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>InsideView Outbound Rule for Leads</fullName>
        <actions>
            <name>Lead_Outbound_Message</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <formula>CONTAINS($Setup.InsideView_Notification_Enabler__c.InsideView_Notification_Enabler__c, &quot;Lead.UPDATE&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>InsideView Outbound Rule for New Leads</fullName>
        <actions>
            <name>Lead_Outbound_Message</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <formula>CONTAINS($Setup.InsideView_Notification_Enabler__c.InsideView_Notification_Enabler__c, &quot;Lead.CREATE&quot;)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
