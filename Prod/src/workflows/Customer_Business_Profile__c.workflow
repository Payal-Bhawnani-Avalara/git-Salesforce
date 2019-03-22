<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_default_name</fullName>
        <field>Name</field>
        <formula>Account__r.Name</formula>
        <name>Set default name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_name_of_Customer_Business_Profile</fullName>
        <field>Name</field>
        <formula>&quot;Profile for &quot; &amp; Account__r.Name</formula>
        <name>Set name of Customer Business Profile</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_name_of_Customer_Business_Profile2</fullName>
        <field>Name</field>
        <formula>Account__r.Name</formula>
        <name>Set name of Customer Business Profile</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set Customer Business Profile Name</fullName>
        <actions>
            <name>Set_default_name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Customer_Business_Profile__c.Name</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Set name of Customer Business Profile</fullName>
        <actions>
            <name>Set_name_of_Customer_Business_Profile</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Customer_Business_Profile__c.Name</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Default Customer Business Profile Name</fullName>
        <actions>
            <name>Set_name_of_Customer_Business_Profile2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Customer_Business_Profile__c.Name</field>
            <operation>notEqual</operation>
            <value>fubar</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
