<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>PBP_Blue_in_a_box_sign_up_date</fullName>
        <field>Blue_in_the_Box_Signup_Date__c</field>
        <formula>TODAY()</formula>
        <name>PBP Blue in a box sign up date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PBP_Orange_in_a_box_signup_date</fullName>
        <field>Orange_in_the_Box_Signup_date__c</field>
        <formula>TODAY()</formula>
        <name>PBP Orange in a box signup date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PBP_Salt_in_a_Box_Sign_up_date</fullName>
        <field>Salt_in_the_Box_Signup_Date__c</field>
        <formula>TODAY()</formula>
        <name>PBP - Salt-in-a-Box Sign up date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>PBP Plan-Blue-in-the-Box signup date</fullName>
        <actions>
            <name>PBP_Orange_in_a_box_signup_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Performance__c.Blue_in_a_Box__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>BIB checkbox checked add today&apos;s date
Partner Mgmt: Liz Anderson</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>PBP Plan-Orange-in-the-Box signup date</fullName>
        <actions>
            <name>PBP_Orange_in_a_box_signup_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Performance__c.Orange_in_a_Box__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>OIB checkbox checked add today&apos;s date
Partner Mgmt: Liz Anderson</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>PBP Plan-Salt-in-the-Box signup date</fullName>
        <actions>
            <name>PBP_Salt_in_a_Box_Sign_up_date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Performance__c.Salt_in_a_Box__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>SIB checkbox checked add today&apos;s date
Partner Mgmt: Liz Anderson</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
