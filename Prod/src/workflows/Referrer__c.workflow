<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <flowActions>
        <fullName>Associate_Partner_Contact_with_Referrer</fullName>
        <flow>Associate_Partner_Contact_with_Referrer</flow>
        <flowInputs>
            <name>ReferrerDomain</name>
            <value>{!Domain__c}</value>
        </flowInputs>
        <flowInputs>
            <name>ReferrerEmail</name>
            <value>{!Email__c}</value>
        </flowInputs>
        <flowInputs>
            <name>ReferrerFirstName</name>
            <value>{!First_Name__c}</value>
        </flowInputs>
        <flowInputs>
            <name>ReferrerID</name>
            <value>{!Id}</value>
        </flowInputs>
        <flowInputs>
            <name>ReferrerLastName</name>
            <value>{!Last_Name__c}</value>
        </flowInputs>
        <label>Associate Partner Contact with Referrer</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <rules>
        <fullName>Associate Referrer to Partner Contact</fullName>
        <actions>
            <name>Associate_Partner_Contact_with_Referrer</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Referrer__c.Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
