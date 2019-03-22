<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Default_Booked_Target</fullName>
        <field>Expected_Bookings__c</field>
        <formula>Expected_Deals__c  *  Expected_ASP__c</formula>
        <name>Default Expected Booked</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Default_Expected_Deals</fullName>
        <field>Expected_Deals__c</field>
        <formula>Expected_Opps_Calc__c  * 0.20</formula>
        <name>Default Expected Deals</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Default_Expected_Opps</fullName>
        <field>Expected_Opps__c</field>
        <formula>Expected_Leads__c * 0.20</formula>
        <name>Default Expected Opps</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Default Booked Value</fullName>
        <actions>
            <name>Default_Booked_Target</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(NOT(ISBLANK(Expected_Deals__c)),ISCHANGED( Expected_Deals__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Default Expected Deals</fullName>
        <actions>
            <name>Default_Expected_Deals</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(ISNEW(),ISCHANGED( Expected_Opps__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Default Expected Opps</fullName>
        <actions>
            <name>Default_Expected_Opps</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(ISNEW(),ISCHANGED(Expected_Leads__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
