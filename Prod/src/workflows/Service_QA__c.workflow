<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>ServiceQAQualityUpdate</fullName>
        <field>Total_Quality_Score__c</field>
        <formula>Closing_Quality_Score__c + Greeting_Quality_Score__c + Issue_Description_Quality_Score__c + Issue_Engagement_Quality_Score__c + KCS_Quality_Score__c + Resolution_Documentation_Quality_Score__c + Throughout_Quality_Score__c + Friendly_Quality_Score__c + Escalation_Quality_Score__c</formula>
        <name>ServiceQAQualityUpdate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ServiceQATrainingUpdate</fullName>
        <field>Total_Training_Score__c</field>
        <formula>Closing_Training_Score__c +  Greeting_Training_Score__c + Issue_Description_Training_Score__c + Issue_Engagement_Training_Score__c + KCS_Training_Score__c  + Resolution_Documentation_Training_Score__c + Throughout_Training_Score__c +  Friendly_Training_Score__c + Escalation_Training_Score__c</formula>
        <name>ServiceQATrainingUpdate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Service QA Calc</fullName>
        <actions>
            <name>ServiceQAQualityUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ServiceQATrainingUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(

ISNEW(),
ISCHANGED(LastModifiedDate)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
