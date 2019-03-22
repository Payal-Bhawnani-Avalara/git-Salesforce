<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Rejected</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Close_Complete</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Accepted</literalValue>
        <name>Stamp Close Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Final_Approval_Complete</fullName>
        <field>Final_Approval_Date__c</field>
        <formula>Today()</formula>
        <name>Stamp Final Approval Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Final_Bookings_Document_upload</fullName>
        <field>Final_Bookings_Document_Approval_Date__c</field>
        <formula>Today()</formula>
        <name>Stamp Final Bookings Document upload</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Final_Reconciliation_Approval</fullName>
        <field>Final_Reconciliation_Approval_Date__c</field>
        <formula>Today()</formula>
        <name>Stamp Final Reconciliation Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Freeze_Approval_Date</fullName>
        <field>EDW_Freeze_Approval_Date__c</field>
        <formula>Today()</formula>
        <name>Stamp Freeze Approval Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Manual_Additions_Approved</fullName>
        <field>Manual_Additions_Approval_Date__c</field>
        <formula>Today()</formula>
        <name>Stamp Manual Additions Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
</Workflow>
