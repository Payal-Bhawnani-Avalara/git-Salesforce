<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Shame_queue_marketing_qualified_1</fullName>
        <description>Shame queue notification - 1 Previous owner</description>
        <protected>false</protected>
        <recipients>
            <field>Previous_Owner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>mark.giddens@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Opportunity/Shame_Queue_Notification_Previous_Red</template>
    </alerts>
    <alerts>
        <fullName>Shame_queue_notification_Previous_manager</fullName>
        <description>Shame queue notification - Previous manager</description>
        <protected>false</protected>
        <recipients>
            <field>Previous_Owner_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>mark.giddens@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Opportunity/Shame_Queue_Notification_Previous_MGR</template>
    </alerts>
    <fieldUpdates>
        <fullName>Date_out_of_SLA_stamp_on_opportunity</fullName>
        <field>Date_out_of_SLA_Shame__c</field>
        <formula>Today()</formula>
        <name>Date out of SLA stamp on opportunity</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Opportunity__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Shame Q- Notification</fullName>
        <actions>
            <name>Shame_queue_marketing_qualified_1</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Shame_queue_notification_Previous_manager</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Shame_Queue_Opportunity_Rerouting__c.CreatedDate</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
