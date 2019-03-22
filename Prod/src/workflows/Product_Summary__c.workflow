<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Stamp_Ding_Value</fullName>
        <field>Ding_Value__c</field>
        <formula>Ding_Lookup__c</formula>
        <name>Stamp Ding Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_booked_Value</fullName>
        <field>Booked_Value__c</field>
        <formula>Booked_Lookup__c</formula>
        <name>Stamp Booked Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Name</fullName>
        <field>Name</field>
        <formula>LEFT(TEXT(ProductFamily__c) &amp; &quot; - &quot; &amp; ConnectorName__c, 80)</formula>
        <name>Update Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Change AvaTax Name</fullName>
        <actions>
            <name>Update_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Product_Summary__c.ProductFamily__c</field>
            <operation>equals</operation>
            <value>Avalara AvaTax</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Opportunity Ding %26 Booked %286 Hour Delay%29</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Product_Summary__c.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Stamp_Ding_Value</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Stamp_booked_Value</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>6</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
