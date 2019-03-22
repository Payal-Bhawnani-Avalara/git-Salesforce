<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_PPI_Completed</fullName>
        <field>Profile_Complete__c</field>
        <literalValue>Yes</literalValue>
        <name>Update PPI Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>Account__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Profile Complete Workflow</fullName>
        <actions>
            <name>Update_PPI_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Partner_Profile__c.Profile_Completed_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
