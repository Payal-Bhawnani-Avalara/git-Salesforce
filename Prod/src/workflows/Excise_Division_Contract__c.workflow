<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_GP_ID_on_Excise_Contract</fullName>
        <field>GP_Id__c</field>
        <formula>Account__r.Accounting_ID__c</formula>
        <name>Update GP ID on Excise Contract</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Populate GP ID on Excise Contract from associated Account</fullName>
        <actions>
            <name>Update_GP_ID_on_Excise_Contract</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISBLANK( Account__c ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
