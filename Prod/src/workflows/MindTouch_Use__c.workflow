<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>LinkonaClosenotification</fullName>
        <description>LinkonaClosenotification</description>
        <protected>false</protected>
        <recipients>
            <recipient>service-ops@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>ZZZSupportArchive/LinkonaClose</template>
    </alerts>
    <flowActions>
        <fullName>AddMindTouchArticle</fullName>
        <flow>MTArticle</flow>
        <flowInputs>
            <name>varCaseID</name>
            <value>{!Case__r.Id}</value>
        </flowInputs>
        <flowInputs>
            <name>varMTUseID</name>
            <value>{!Article__c}</value>
        </flowInputs>
        <label>AddMindTouchArticle</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>RemoveMindTouchArticle</fullName>
        <flow>RemoveMTArticle</flow>
        <flowInputs>
            <name>varMTUseRecordID</name>
            <value>{!this}</value>
        </flowInputs>
        <label>RemoveMindTouchArticle</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <rules>
        <fullName>AddArticletoResolution</fullName>
        <actions>
            <name>AddMindTouchArticle</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <formula>AND(

ISNEW(),
NOT(CONTAINS(Article__r.Category__c,&quot;Internal&quot;))

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>RemoveArticlesforClosedCases</fullName>
        <actions>
            <name>RemoveMindTouchArticle</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <formula>AND(

ISNEW(),
Case__r.Closed_Case_Age__c &gt; 0.00 

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
