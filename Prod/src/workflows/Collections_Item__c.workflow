<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Add_Log_Stamp</fullName>
        <field>Collection_Log_Stamp__c</field>
        <formula>Now()</formula>
        <name>Add Log Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Log_Entry</fullName>
        <field>Collection_Log_Entry__c</field>
        <name>Clear Log Entry</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Last_Log</fullName>
        <field>Collection_Last_Log__c</field>
        <formula>$User.LastName &amp; &quot;: &quot;&amp; TEXT(NOW()) &amp; &quot;: &quot;&amp;  Collection_Log_Entry__c</formula>
        <name>Update Last Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Log</fullName>
        <field>Collection_Log__c</field>
        <formula>&quot;--- &quot;&amp; $User.FirstName &amp; &quot; &quot; &amp; $User.LastName &amp; &quot;: &quot;&amp; TEXT(NOW()) &amp; &quot;: &quot; &amp; BR() &amp;  Collection_Log_Entry__c  &amp; BR() &amp;  Collection_Log__c</formula>
        <name>Update Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <flowActions>
        <fullName>Populate_Account_Lookup_on_Collection_Item</fullName>
        <flow>Populate_Account_Lookup_on_Collection_Item</flow>
        <flowInputs>
            <name>CollectionItemID</name>
            <value>{!Id}</value>
        </flowInputs>
        <flowInputs>
            <name>SMID</name>
            <value>{!Temp_Account__c}</value>
        </flowInputs>
        <label>Populate Account Lookup on Collection Item</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <rules>
        <fullName>Log Entry Controller</fullName>
        <actions>
            <name>Add_Log_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear_Log_Entry</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Last_Log</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Log</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Collections_Item__c.Collection_Log_Entry__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
