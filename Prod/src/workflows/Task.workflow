<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>escalateIssue</fullName>
        <ccEmails>acrozier@mondaycall.com</ccEmails>
        <ccEmails>DG-Partnerlaunch@avalara.com</ccEmails>
        <description>escalateIssue</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/escalateIssue</template>
    </alerts>
    <alerts>
        <fullName>sendBadgeRequest</fullName>
        <ccEmails>acrozier@mondaycall.com</ccEmails>
        <ccEmails>DG-Partnerlaunch@avalara.com</ccEmails>
        <description>sendBadgeRequest</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Avalara_Contact__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/requestBadge</template>
    </alerts>
    <fieldUpdates>
        <fullName>Case_Email_Task_Type</fullName>
        <field>Type</field>
        <literalValue>Email</literalValue>
        <name>Case Email Task Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Task_Type_to_Call</fullName>
        <description>Changes the Task Type to Call</description>
        <field>Type</field>
        <literalValue>Call</literalValue>
        <name>Change Task Type to Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Marketing_Response_Task</fullName>
        <field>Marketing_Activity_Response__c</field>
        <literalValue>1</literalValue>
        <name>Marketing Response Task</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Short_comments_field</fullName>
        <field>Short_Comments__c</field>
        <formula>LEFT( Description, 100)</formula>
        <name>Populate Short comments field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_CallDurationInSeconds_on_Task</fullName>
        <description>Request: https://jira.avalara.com/browse/IBST-10531</description>
        <field>CallDurationInSeconds</field>
        <formula>ROUND(SL_Call_Duration__c, 0)</formula>
        <name>Update CallDurationInSeconds on Task</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Type_to_AASP_Follow_Up</fullName>
        <description>Set Type to equal &apos;AASP Follow Up&apos;</description>
        <field>Type</field>
        <literalValue>AASP Follow Up</literalValue>
        <name>Update Type to AASP Follow Up</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Type_to_Email</fullName>
        <description>Updates the Activity Type to Email</description>
        <field>Type</field>
        <literalValue>Email</literalValue>
        <name>Update Type to Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <flowActions>
        <fullName>FT_ClearMilestoneonTrigger</fullName>
        <flow>ClearCaseMilestonefromCompletingTask</flow>
        <flowInputs>
            <name>varCaseIDfromCompletedTask</name>
            <value>{!WhatId}</value>
        </flowInputs>
        <label>FT_ClearMilestoneonTrigger</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>LCA_FT</fullName>
        <flow>LCA_ReplacementFlow</flow>
        <flowInputs>
            <name>var_CaseIDfromRelatedTask</name>
            <value>{!WhatId}</value>
        </flowInputs>
        <label>LCA_FT</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <outboundMessages>
        <fullName>InsideSales_Calls_over_25</fullName>
        <apiVersion>32.0</apiVersion>
        <description>Used for inside sales to monitor calls that are over 25 seconds long.</description>
        <endpointUrl>https://powerstandings.insidesales.com/kpi/apptsheld</endpointUrl>
        <fields>Id</fields>
        <fields>OwnerId</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>mary.jensen@avalara.com</integrationUser>
        <name>InsideSales Calls over 25</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>Assign Task Type to Call for Insile Sales Reps</fullName>
        <actions>
            <name>Change_Task_Type_to_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 OR 2 OR 3) AND (4 OR 5 OR 6)</booleanFilter>
        <criteriaItems>
            <field>Task.OwnerId</field>
            <operation>equals</operation>
            <value>steven hawk</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.OwnerId</field>
            <operation>equals</operation>
            <value>david smart</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.OwnerId</field>
            <operation>equals</operation>
            <value>jimmie allen</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.CreatedById</field>
            <operation>notEqual</operation>
            <value>steven hawk</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.CreatedById</field>
            <operation>notEqual</operation>
            <value>david smart</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.CreatedById</field>
            <operation>notEqual</operation>
            <value>jimmie allen</value>
        </criteriaItems>
        <description>Defaults the Task Type to Call for all Inside Sales Reps</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Clear Milestone on Completed Task</fullName>
        <actions>
            <name>FT_ClearMilestoneonTrigger</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Task.Status</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.CreatedById</field>
            <operation>notEqual</operation>
            <value>Service Ops</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Type</field>
            <operation>notEqual</operation>
            <value>Email</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.RecordTypeId</field>
            <operation>equals</operation>
            <value>Support Activity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Type</field>
            <operation>notEqual</operation>
            <value>Email</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.CSI_Team_Name_v2__c</field>
            <operation>startsWith</operation>
            <value>CT</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Convert Tasks to Type Email</fullName>
        <actions>
            <name>Update_Type_to_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Converts Activities that have a subject starting with &apos;Email:&apos; to have an Activity Type of Email</description>
        <formula>AND(left(Subject,6)=&quot;Email:&quot;, ISPICKVAL(Type,&quot;Call&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Copy SL_Call_Duration to CallDurationInSeconds</fullName>
        <actions>
            <name>Update_CallDurationInSeconds_on_Task</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.SL_Call_Duration__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Request: https://jira.avalara.com/browse/IBST-10531</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Last Contact Activity</fullName>
        <actions>
            <name>LCA_FT</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2</booleanFilter>
        <criteriaItems>
            <field>Task.Related_Object__c</field>
            <operation>equals</operation>
            <value>Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Status</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Marketing Response Task Stamp</fullName>
        <actions>
            <name>Marketing_Response_Task</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2 OR 3</booleanFilter>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>equals</operation>
            <value>Free Product Subscriber Follow-up,Contact had recent Partner Activity</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>equals</operation>
            <value>AvaTax Free Trial Contact Me,Submitted a form to download an Avalara asset</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>equals</operation>
            <value>Attended an event,Contact registered for an Avalara Webinar</value>
        </criteriaItems>
        <description>Using the subject line of contact response workflows to stamp marketing activity. Using this process because we cannot update custom activity on a Task in workflow, can only update custom task fields by using a &quot;field&quot; update
Marketing</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Populate Short comments field</fullName>
        <actions>
            <name>Populate_Short_comments_field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.RecordTypeId</field>
            <operation>equals</operation>
            <value>EZTax</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Description</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>EZTax</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Tasks to Bigley equal AASP</fullName>
        <actions>
            <name>Update_Type_to_AASP_Follow_Up</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.OwnerId</field>
            <operation>equals</operation>
            <value>Ray Bigley</value>
        </criteriaItems>
        <description>All tasks assigned to Ray Bigley from the Inside Sales team are updated to have a Type of &apos;AASP Follow Up&apos;</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>sendEscalateIssue</fullName>
        <actions>
            <name>escalateIssue</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.Type</field>
            <operation>equals</operation>
            <value>Report Issue</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>sendRequestBadge</fullName>
        <actions>
            <name>sendBadgeRequest</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.Type</field>
            <operation>equals</operation>
            <value>Functionality Request</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
