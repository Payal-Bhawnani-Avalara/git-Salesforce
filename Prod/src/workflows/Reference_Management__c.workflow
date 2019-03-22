<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>SendEmailForVettedReferenceManagement</fullName>
        <ccEmails>DG-CAM@Avalara.com</ccEmails>
        <ccEmails>DG-NewBusinessSales@avalara.com</ccEmails>
        <description>SendEmailForVettedReferenceManagement</description>
        <protected>false</protected>
        <senderAddress>cathleen.wellbrock@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Customer_Experience/Reference_Customer_Added</template>
    </alerts>
    <fieldUpdates>
        <fullName>Manitain_Slug</fullName>
        <field>Slug__c</field>
        <formula>Left(SUBSTITUTE(LOWER( Account__r.Name ), &quot; &quot;, &quot;-&quot;),30) &amp; &quot;-&quot; &amp; SUBSTITUTE(LOWER( Contact__r.LastName ), &quot; &quot;, &quot;-&quot;) &amp; &quot;-&quot;&amp; SUBSTITUTE(LOWER( TEXT( Product__c )), &quot; &quot;, &quot;-&quot;)</formula>
        <name>Maintain Slug</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>IfReferenceManagementStatusVetted</fullName>
        <actions>
            <name>SendEmailForVettedReferenceManagement</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Reference_Management__c.Reference_Status__c</field>
            <operation>equals</operation>
            <value>Vetted</value>
        </criteriaItems>
        <description>Create Request: IBST-16849
When Reference Management&apos;s Reference Status field is updated to &quot;Vetted&quot;, send Email to desired recipients.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Maintain Slug</fullName>
        <actions>
            <name>Manitain_Slug</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(ISCHANGED( Account__c ),ISCHANGED( Contact__c ),ISCHANGED( Product__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
