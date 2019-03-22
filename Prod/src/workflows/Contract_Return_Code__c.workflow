<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Contract_Return_Code_Name</fullName>
        <field>Name</field>
        <formula>IF(ISBLANK( Associated_Entity__c ),Excise_Division_Contract__r.Name &amp; &quot; - &quot; &amp;  Return_Code__r.Name, Associated_Entity__r.Name &amp; &quot; - &quot; &amp; Return_Code__r.Name)</formula>
        <name>Update Contract Return Code Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Update Return Code Name</fullName>
        <actions>
            <name>Update_Contract_Return_Code_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISBLANK( Return_Code__c ))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
