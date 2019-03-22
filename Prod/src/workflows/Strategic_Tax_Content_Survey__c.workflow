<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Notify_Team_of_New_Strategic_Tax_Content_Survey_Results</fullName>
        <description>Notify Team of New Strategic Tax Content Survey Results</description>
        <protected>false</protected>
        <recipients>
            <recipient>kory.leavitt@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity/Notify_Team_new_Strategic_Tax_Content_Survey_Response</template>
    </alerts>
    <fieldUpdates>
        <fullName>Stamp_Opp_Owner_Email_Strategic_Tax</fullName>
        <description>Purpose: To stamp the opportunity owner email on the Strategic Tax Content survey results records</description>
        <field>Opportunity_Owner_Email__c</field>
        <formula>Opportunity__r.Owner.Email</formula>
        <name>Stamp Opp Owner Email - Strategic Tax</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Notify Team that new strategic tax content survey has been completed</fullName>
        <actions>
            <name>Notify_Team_of_New_Strategic_Tax_Content_Survey_Results</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Stamp_Opp_Owner_Email_Strategic_Tax</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Strategic_Tax_Content_Survey__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
