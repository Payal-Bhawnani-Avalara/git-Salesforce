<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>CertCapture_Work_Complete_Date_Stamp</fullName>
        <field>Work_Order_End_Date__c</field>
        <formula>Today()</formula>
        <name>CertCapture Work Complete Date Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Cert Capture SOW complete</fullName>
        <actions>
            <name>CertCapture_Work_Complete_Date_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Cert_Capture_Billing__c.Work_Complete_Ready_to_Bill__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Checked when ready to bill for cert capture and time stamps the date as completed.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
