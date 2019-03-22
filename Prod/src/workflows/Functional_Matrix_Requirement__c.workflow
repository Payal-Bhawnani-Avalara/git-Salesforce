<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Check_Migrate</fullName>
        <field>Note_Migrated__c</field>
        <literalValue>1</literalValue>
        <name>Check Migrate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_FM_Requirement_External_Id</fullName>
        <field>External_Id__c</field>
        <formula>Functional_Matrix__c + &apos;||&apos; +  Functional_Matrix_Requirements_Config__c + &apos;||&apos; +  TEXT(Functional_Matrix_Requirements_Config__r.Core_Type__c)</formula>
        <name>Update FM Requirement External Id</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
</Workflow>
