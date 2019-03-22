<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Zip_Code_Region_Text_Stamp</fullName>
        <field>Region_Text__c</field>
        <formula>Region__r.Name</formula>
        <name>Zip Code Region Text Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Stamp text region field</fullName>
        <actions>
            <name>Zip_Code_Region_Text_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>used to for other objects formulas to reduce size of formula</description>
        <formula>OR( ISNEW() , ISCHANGED( Region__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
