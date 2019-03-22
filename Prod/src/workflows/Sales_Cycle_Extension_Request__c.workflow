<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Alert_Rep_Approved</fullName>
        <description>Alert Rep Approved</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Sales_Cycle_Extension_Request_App</template>
    </alerts>
    <alerts>
        <fullName>Alert_Rep_Rejected</fullName>
        <description>Alert Rep Rejected</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Sales_Cycle_Extension_Request_Rej</template>
    </alerts>
    <fieldUpdates>
        <fullName>Stamp_Approved_Status</fullName>
        <field>Request_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Stamp Approved Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Rejected_Status</fullName>
        <field>Request_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>Stamp Rejected Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
</Workflow>
