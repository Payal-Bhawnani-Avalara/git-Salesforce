<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Check_Needs_CAM_Case</fullName>
        <field>NeedsCAMCase__c</field>
        <literalValue>1</literalValue>
        <name>Check Needs CAM Case</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>CreateCAMCase</fullName>
        <apiVersion>29.0</apiVersion>
        <endpointUrl>http://jitterbit:46908/jitterbit_ws/?id=0d10ce38-7c38-4c61-a734-2cba614b0d70</endpointUrl>
        <fields>Account_Name__c</fields>
        <fields>Account__c</fields>
        <fields>Blocking_Risk_Factor__c</fields>
        <fields>CAM__c</fields>
        <fields>GoLive__c</fields>
        <fields>Id</fields>
        <fields>Name</fields>
        <fields>OwnerId</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>clayton.wiggins@avalara.com</integrationUser>
        <name>Create CAM Case</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>Auto Create CAM Case</fullName>
        <actions>
            <name>Check_Needs_CAM_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Risk_Assessment__c.Blocking_Risk_Factor__c</field>
            <operation>equals</operation>
            <value>Customer - Customer Not Committed,Customer - No Immediate Business Value,Customer - No Intent to Use Product,Customer - Unresponsive,Payment - Non-Payment,Schedule - No Firm Commitment to Timeline,Terms - Customer Refuses Terms</value>
        </criteriaItems>
        <description>Creates a CAM Case when certain Risk Assessment criteria are met</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
