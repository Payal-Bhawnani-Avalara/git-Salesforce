<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>AvaTax_Returns_Solution_Approval</fullName>
        <ccEmails>demarcus.wells@avalara.com</ccEmails>
        <description>Solution Approval Notification - AvaTax Returns</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>ZZZSupportArchive/Author_Approval_Notice</template>
    </alerts>
    <alerts>
        <fullName>Notify_Solution_Author_of_Approval</fullName>
        <ccEmails>demarcus.wells@avalara.com, elena.petre@avalara.com</ccEmails>
        <description>Solution Approval Notification</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>ZZZSupportArchive/Author_Approval_Notice</template>
    </alerts>
    <alerts>
        <fullName>Process_Test_Author_Approval_Notice</fullName>
        <ccEmails>Demarcus.Wells@avalara.com</ccEmails>
        <description>Process Test _ Author Approval Notice</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>ZZZSupportArchive/Author_Approval_Notice</template>
    </alerts>
    <alerts>
        <fullName>Solution_Rejection_Notification</fullName>
        <description>Solution Rejection Notification</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>ZZZSupportArchive/RejectedtoCreator</template>
    </alerts>
    <fieldUpdates>
        <fullName>Approver_Status_Update</fullName>
        <field>Status</field>
        <literalValue>Approved</literalValue>
        <name>Change Status to Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Capture_User</fullName>
        <field>Migrator__c</field>
        <formula>$User.FirstName&amp;&quot; &quot;&amp;$User.LastName</formula>
        <name>Capture User</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Status_to_Invalid_Solution</fullName>
        <field>Status</field>
        <literalValue>Invalid Solution</literalValue>
        <name>Change Status to Invalid Solution</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_to_Status_to_AuditReview</fullName>
        <field>Status</field>
        <literalValue>Audit Review</literalValue>
        <name>Change to Status to AuditReview</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Partner_Title_Format</fullName>
        <field>SolutionName</field>
        <formula>&quot;PartnerKB &quot; &amp;  &quot; - &quot; &amp; SolutionName</formula>
        <name>Partner Title Format</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Recall_back2Draft</fullName>
        <field>Status</field>
        <literalValue>Draft</literalValue>
        <name>Change Status to Draft</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Remove_from_Public</fullName>
        <field>IsPublishedInPublicKb</field>
        <literalValue>0</literalValue>
        <name>Remove from Public</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sales_KB_Title_update</fullName>
        <description>To differentiate Sales KB articles</description>
        <field>SolutionName</field>
        <formula>&quot;SalesKB:  &quot; &amp; TEXT( Product__c) &amp; &quot; - &quot; &amp; SolutionName</formula>
        <name>Sales KB Title update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetCSITeam</fullName>
        <field>OwnerCSITeam_s_c__c</field>
        <formula>$User.CSITeamName__c</formula>
        <name>SetCSITeam</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Certified_on_Partner_KB</fullName>
        <field>Date_Certified__c</field>
        <formula>Today()</formula>
        <name>Set Certified on Partner KB</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Date_for_Review</fullName>
        <field>Solution_Review_Date__c</field>
        <formula>Today() + 180</formula>
        <name>Set Date for Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Migration_End_Time</fullName>
        <field>Migration_Completion_Time__c</field>
        <formula>NOW()</formula>
        <name>Set Migration End Time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Migration_start_time</fullName>
        <field>Migration_Start_Time__c</field>
        <formula>NOW()</formula>
        <name>Set Migration start time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SolutionTitleUpdate</fullName>
        <field>SolutionName</field>
        <formula>TEXT( Product__c) &amp; &quot;: &quot; &amp; TEXT( Solution_Type__c )&amp; &quot; - &quot; &amp; SolutionName</formula>
        <name>Solution Title Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Solution_Review_Approval</fullName>
        <field>Status</field>
        <literalValue>Approved</literalValue>
        <name>Change Status to Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Solution_Review_Rejection</fullName>
        <field>Status</field>
        <literalValue>Rejected</literalValue>
        <name>Change Status to Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Step3_Rejection</fullName>
        <field>Status</field>
        <literalValue>Solution Review</literalValue>
        <name>Change Status Back to Solution Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Uncheck_Visible</fullName>
        <field>IsPublishedInPublicKb</field>
        <literalValue>0</literalValue>
        <name>Uncheck Visible</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateSolutionStatus</fullName>
        <field>Status</field>
        <literalValue>Solution Review</literalValue>
        <name>Change Status to Solution Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status</fullName>
        <field>Status</field>
        <literalValue>3 - Approval Review</literalValue>
        <name>Update Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Capture Migrator On Change</fullName>
        <actions>
            <name>Capture_User</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND
(
ISCHANGED( Migration_Status__c ),
NOT(ISPICKVAL( Migration_Status__c, &quot;&quot;)),
ISBLANK(Migrator__c)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Certified Partner</fullName>
        <actions>
            <name>Set_Certified_on_Partner_KB</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Solution.RecordTypeId</field>
            <operation>equals</operation>
            <value>KB Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Solution.Status</field>
            <operation>equals</operation>
            <value>Certified</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Internal Only Solution</fullName>
        <actions>
            <name>Remove_from_Public</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Solution.Solution_Type__c</field>
            <operation>equals</operation>
            <value>INTERNAL,PROCEDURE,OEM GUIDE,TRAINING GUIDE</value>
        </criteriaItems>
        <criteriaItems>
            <field>Solution.RecordTypeId</field>
            <operation>equals</operation>
            <value>KB Partner,KB Sales</value>
        </criteriaItems>
        <description>Set&apos;s Visible in KB to false if Solution type = Internal</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Partner KB Title Format</fullName>
        <actions>
            <name>Partner_Title_Format</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Solution.RecordTypeId</field>
            <operation>equals</operation>
            <value>KB Partner</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Sales KB Title Format</fullName>
        <actions>
            <name>Sales_KB_Title_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Solution.Status</field>
            <operation>equals</operation>
            <value>Draft</value>
        </criteriaItems>
        <criteriaItems>
            <field>Solution.Product__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Solution.RecordTypeId</field>
            <operation>equals</operation>
            <value>KB Sales</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Set Migration End</fullName>
        <actions>
            <name>Set_Migration_End_Time</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Solution.Migration_Status__c</field>
            <operation>equals</operation>
            <value>Duplicate,Merged,Retired,Migrated</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Migration Start</fullName>
        <actions>
            <name>Set_Migration_start_time</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Solution.Migration_Status__c</field>
            <operation>equals</operation>
            <value>In Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Solution.Migration_Start_Time__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Solution.Migration_Time__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Rule to automatically capture time when a solution migration effort starts</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SetCSIName</fullName>
        <actions>
            <name>SetCSITeam</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Solution.Status</field>
            <operation>equals</operation>
            <value>Draft</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Solution Title Format</fullName>
        <actions>
            <name>SolutionTitleUpdate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3) AND 4</booleanFilter>
        <criteriaItems>
            <field>Solution.Status</field>
            <operation>equals</operation>
            <value>Draft</value>
        </criteriaItems>
        <criteriaItems>
            <field>Solution.Product__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Solution.Product__c</field>
            <operation>notEqual</operation>
            <value>OEM Connector</value>
        </criteriaItems>
        <criteriaItems>
            <field>Solution.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>KB Partner,KB Sales</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <tasks>
        <fullName>Review_Article</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please review this solution for accuracy.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Solution.Solution_Review_Date__c</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Solution Review Task</subject>
    </tasks>
</Workflow>
