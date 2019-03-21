<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <outboundMessages>
        <fullName>Lead_outbound_messages</fullName>
        <apiVersion>40.0</apiVersion>
        <endpointUrl>http://sfsvc.zinfi.com/services/obm/Lead.asmx</endpointUrl>
        <fields>Company</fields>
        <fields>Email</fields>
        <fields>FirstName</fields>
        <fields>Id</fields>
        <fields>LastName</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>aaron.zapf@avalara.com</integrationUser>
        <name>Lead outbound messages</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
</Workflow>
