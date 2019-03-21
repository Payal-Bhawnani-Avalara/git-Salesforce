<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <outboundMessages>
        <fullName>Contact_outbound_messages</fullName>
        <apiVersion>40.0</apiVersion>
        <endpointUrl>http://sfsvc.zinfi.com/services/obm/Contact.asmx</endpointUrl>
        <fields>AccountId</fields>
        <fields>Email</fields>
        <fields>FirstName</fields>
        <fields>Id</fields>
        <fields>LastName</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>aaron.zapf@avalara.com</integrationUser>
        <name>Contact outbound messages</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
</Workflow>
