<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Desired_Live_Date</fullName>
        <description>Test to update a date on the Questionairre</description>
        <field>ProjectKickOffDate__c</field>
        <formula>DATE(2013,1,1)</formula>
        <name>Update Desired Live Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Email GoLive Questionnaire</fullName>
        <actions>
            <name>Update_Desired_Live_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLiveQuestionaire__c.OppStage__c</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <description>Sends out the GoLive Questionnaire when an Opportunity is set to Closed Won</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
