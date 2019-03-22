<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Marketing_Project_Request_MM_Added</fullName>
        <description>Marketing Project Request - MM Added</description>
        <protected>false</protected>
        <recipients>
            <field>Marketing_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Partner_Programs_Requested</template>
    </alerts>
    <alerts>
        <fullName>Marketing_Project_Request_Status_change_notification</fullName>
        <description>Marketing Project Request Status change notification</description>
        <protected>false</protected>
        <recipients>
            <field>PPM__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>SAM_RSM__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Program_Request/Marketing_Project_Request_status_change_HTML</template>
    </alerts>
    <alerts>
        <fullName>Marketing_Project_Submitted</fullName>
        <description>Marketing Project Request Submitted</description>
        <protected>false</protected>
        <recipients>
            <field>Marketing_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>PPM__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>SAM_RSM__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Partner_Programs_Requested</template>
    </alerts>
    <alerts>
        <fullName>Partner_Program_Request_Past_Due</fullName>
        <description>Partner Program Request Past Due</description>
        <protected>false</protected>
        <recipients>
            <field>Partner_PPM_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Marketing_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>PPM__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>SAM_RSM__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Program_Request/Partner_Program_Request_Past_Due</template>
    </alerts>
    <fieldUpdates>
        <fullName>Marketing_Project_submitted_by</fullName>
        <field>Submitted_By__c</field>
        <formula>$User.FirstName &amp; &quot; &quot; &amp;  $User.LastName</formula>
        <name>Marketing Project submitted by</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Mkt_prject_request_status_submitted</fullName>
        <field>Status__c</field>
        <literalValue>Submitted</literalValue>
        <name>Mkt prject request status submitted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Mkt_request_submitted_to_marketing</fullName>
        <description>Update the date a request was submitted</description>
        <field>Submitted_Date__c</field>
        <formula>Today()</formula>
        <name>Mkt Request submitted date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Partner_PPM_Email_update</fullName>
        <field>Partner_PPM_Email__c</field>
        <formula>Partner_Account__r.Secondary_CDM__r.Email</formula>
        <name>Partner PPM Email update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Marketing Project Request Submittal</fullName>
        <actions>
            <name>Marketing_Project_Submitted</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Marketing_Project_submitted_by</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Mkt_prject_request_status_submitted</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Mkt_request_submitted_to_marketing</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Marketing_Project_Request__c.Submitted__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Mkt Project Request MM Added</fullName>
        <actions>
            <name>Marketing_Project_Request_MM_Added</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Marketing_Project_Request__c.Marketing_Manager__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Send Notification that the PPM has added a Marketing Manager onto the request</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Mkt Project Request Stage change notification</fullName>
        <actions>
            <name>Marketing_Project_Request_Status_change_notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send Notification that a marketing project request has had a stage change</description>
        <formula>ISCHANGED(Status__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Partner PPM EMail Stamp on record</fullName>
        <actions>
            <name>Partner_PPM_Email_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Marketing_Project_Request__c.Partner_PPM_Email__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Marketing_Project_Request__c.Partner_PPM__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Used to send alerts to the Partner PPM</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Partner Program Request Past Due</fullName>
        <actions>
            <name>Partner_Program_Request_Past_Due</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Marketing_Project_Request__c.Due_Date__c</field>
            <operation>lessThan</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Marketing_Project_Request__c.Status__c</field>
            <operation>notEqual</operation>
            <value>Completed,Aborted,On Hold</value>
        </criteriaItems>
        <description>Used to notify SAM, PPM and MM is the project is past do.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
