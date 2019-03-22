<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Calc_Owned_Update</fullName>
        <field>Calc_Owned__c</field>
        <literalValue>Yes</literalValue>
        <name>Calc Owned Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_PPP_Owned_Update</fullName>
        <field>Calc_PPP__c</field>
        <literalValue>Owned</literalValue>
        <name>Calc PPP Owned Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Certs_Owned_Update</fullName>
        <field>Certs_Owned__c</field>
        <literalValue>Yes</literalValue>
        <name>Certs Owned Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Certs_PPP_Update</fullName>
        <field>Certs_PPP__c</field>
        <literalValue>Owned</literalValue>
        <name>Certs PPP Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Returns_Owned_Update</fullName>
        <field>Returns_Owned__c</field>
        <literalValue>Yes</literalValue>
        <name>Returns Owned Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Returns_PPP_Update</fullName>
        <field>Returns_PPP__c</field>
        <literalValue>Owned</literalValue>
        <name>Returns PPP Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Review_Summary_Account_Log_Stamp</fullName>
        <field>Review_Summary_Account_Log__c</field>
        <formula>TEXT(TODAY())  &amp; &quot; CAM: &quot; &amp;  LastModifiedBy.Full_Name__c  &amp; &quot; --- &quot; &amp;  ReviewSummary__c   &amp; &quot; | &quot;  &amp; BR() &amp;
 Account__r.Review_Summary_Account_Log__c</formula>
        <name>(AP) Review Summary Account Log Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Account__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>%28AP%29 Review Summary Account Log Changed</fullName>
        <actions>
            <name>Review_Summary_Account_Log_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( ReviewSummary__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>%28AP%29 Review Summary Account Log New</fullName>
        <actions>
            <name>Review_Summary_Account_Log_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account_Profile__c.ReviewSummary__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Calc Information</fullName>
        <actions>
            <name>Calc_Owned_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Calc_PPP_Owned_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account_Profile__c.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Calc__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Certs Information</fullName>
        <actions>
            <name>Certs_Owned_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Certs_PPP_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account_Profile__c.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Certs__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Returns Information</fullName>
        <actions>
            <name>Returns_Owned_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Returns_PPP_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account_Profile__c.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Returns__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
