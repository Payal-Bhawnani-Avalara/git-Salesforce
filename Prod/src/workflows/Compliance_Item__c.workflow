<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Stamp_AvaTax_ID_Number</fullName>
        <field>AvaTaxAccountIdNew__c</field>
        <formula>VALUE(AvaTax_Account_ID__c)</formula>
        <name>Stamp AvaTax ID Number</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <flowActions>
        <fullName>Stamp_SFDC_Account_lookup_on_CVI</fullName>
        <flow>Stamp_SFDC_Account_ID_on_CVI</flow>
        <flowInputs>
            <name>AvaTaxAccountID</name>
            <value>{!AvaTax_Account_ID__c}</value>
        </flowInputs>
        <flowInputs>
            <name>CVIRecordID</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>Stamp SFDC Account lookup on CVI</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <rules>
        <fullName>Stamp SFDC Account ID on Create</fullName>
        <actions>
            <name>Stamp_SFDC_Account_lookup_on_CVI</name>
            <type>FlowAction</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Compliance_Item__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Looks up the SFDC Account ID by querying the Compliance Variance Items table and matches on the AvaTax Account ID</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Updated Account ID</fullName>
        <actions>
            <name>Stamp_AvaTax_ID_Number</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Compliance_Item__c.AvaTax_Account_ID__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
