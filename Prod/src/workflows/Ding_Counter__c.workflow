<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <flowActions>
        <fullName>Reset_Ding_Counter</fullName>
        <flow>Reset_Ding_Counter</flow>
        <flowInputs>
            <name>CurrentMonth</name>
            <value>{!Next_Ding_Month__c}</value>
        </flowInputs>
        <flowInputs>
            <name>CurrentYear</name>
            <value>{!Next_Ding_Year__c}</value>
        </flowInputs>
        <flowInputs>
            <name>LastMonthDingCount</name>
            <value>{!Current_Value__c}</value>
        </flowInputs>
        <label>Reset Ding Counter</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <rules>
        <fullName>Reset Ding Counter</fullName>
        <actions>
            <name>Reset_Ding_Counter</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Ding_Counter__c.TriggerReset__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
