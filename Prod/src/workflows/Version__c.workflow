<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Populate_Primary_Signature</fullName>
        <field>Primary_Signature__c</field>
        <formula>Primary_Signature_Lookup__c</formula>
        <name>Populate Primary Signature</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Yes_in_Unpublished_Version</fullName>
        <field>Unpublished_Version_In_Dev__c</field>
        <formula>&quot;Yes&quot;</formula>
        <name>Stamp Yes in Unpublished Version</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Connector__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Populate Default Signature from KB</fullName>
        <actions>
            <name>Populate_Primary_Signature</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Version__c.Primary_Signature_Lookup__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Unpublished Version In Dev Stamp</fullName>
        <actions>
            <name>Stamp_Yes_in_Unpublished_Version</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Connector__c.Publish__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Version__c.Status__c</field>
            <operation>equals</operation>
            <value>In Development</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
