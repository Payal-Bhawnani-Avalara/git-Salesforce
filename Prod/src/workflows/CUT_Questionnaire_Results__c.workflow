<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Notify_CUT_Sales_Team_of_CUT_Survey_Completion</fullName>
        <ccEmails>DG-CUTOpportunities@avalara.com</ccEmails>
        <description>Notify CUT Sales Team of CUT Survey Completion</description>
        <protected>false</protected>
        <recipients>
            <recipient>mark.wilhelm@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity/Notify_CUT_Sales_team_of_CUT_Survey_Completion</template>
    </alerts>
    <alerts>
        <fullName>Notify_Opp_Owner_of_CUT_Survey_Completion</fullName>
        <description>Notify Opp Owner of CUT Survey Completion</description>
        <protected>false</protected>
        <recipients>
            <field>OpportunityOwnerEmail__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity/Notify_CUT_Sales_team_of_CUT_Survey_Completion</template>
    </alerts>
    <fieldUpdates>
        <fullName>Stamp_Opp_Owner_Email</fullName>
        <field>OpportunityOwnerEmail__c</field>
        <formula>Opportunity__r.Owner.Email</formula>
        <name>Stamp Opp Owner Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Notify CUT Sales team of CUT Survey Completion</fullName>
        <actions>
            <name>Notify_CUT_Sales_Team_of_CUT_Survey_Completion</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Stamp_Opp_Owner_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CUT_Questionnaire_Results__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Notify Opp Owner of CUT Survey Completion</fullName>
        <actions>
            <name>Notify_Opp_Owner_of_CUT_Survey_Completion</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CUT_Questionnaire_Results__c.OpportunityOwnerEmail__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
