<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Subtract_Likelihood_To_Hire_by_1</fullName>
        <description>Corrects ClickTools rating value</description>
        <field>LikelihoodToHire__c</field>
        <formula>LikelihoodToHire__c - 1</formula>
        <name>Subtract Likelihood To Hire by 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
</Workflow>
