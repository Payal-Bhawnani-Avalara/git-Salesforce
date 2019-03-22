<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_Activation_Email</fullName>
        <description>Send Activation Email</description>
        <protected>false</protected>
        <recipients>
            <field>Contact_Email_Workflow__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>mylodgetaxsupport@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Licensing/Activation_Email</template>
    </alerts>
    <fieldUpdates>
        <fullName>Maintain_Email_Field_For_Contact</fullName>
        <field>Contact_Email_Workflow__c</field>
        <formula>Contact_Email__c</formula>
        <name>Maintain Email Field For Contact</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Sen</fullName>
        <field>Activation_Email_Sent__c</field>
        <literalValue>1</literalValue>
        <name>Stamp Sen</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Uncheck_Mass_Email_Missing_Address</fullName>
        <field>Mass_Email_Missing_Address__c</field>
        <literalValue>0</literalValue>
        <name>Uncheck Mass Email: Missing Address</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Auto Email For Property Activation</fullName>
        <actions>
            <name>Send_Activation_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Stamp_Sen</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Property_Subscription__c.Status__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <criteriaItems>
            <field>Property_Subscription__c.Activation_Email_Sent__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Maintain Email Field For Contact</fullName>
        <actions>
            <name>Maintain_Email_Field_For_Contact</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Property_Subscription__c.Contact_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Mass Email%3A Missing Address</fullName>
        <actions>
            <name>Uncheck_Mass_Email_Missing_Address</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Mass_Email_Missing_Address</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Property_Subscription__c.Mass_Email_Missing_Address__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Mass_Email_Missing_Address</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Mass Email: Missing Address</subject>
    </tasks>
</Workflow>
