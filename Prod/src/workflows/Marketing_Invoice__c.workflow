<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Manager_Approved_Marketing_Invoice</fullName>
        <ccEmails>accountspayable@avalara.com</ccEmails>
        <description>Manager Approved Marketing Invoice</description>
        <protected>false</protected>
        <recipients>
            <recipient>jessica.davis@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Marketing_Invoice_1MGR_Approved</template>
    </alerts>
    <alerts>
        <fullName>Marketing_Invoice_Pending_Approval_Email_Alert</fullName>
        <description>Marketing Invoice Pending Approval Email Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>jessica.davis@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Marketing_Invoice_Pending_Approval_Alert</template>
    </alerts>
    <alerts>
        <fullName>PPM_Marketing_Invoice_New_Alert</fullName>
        <description>PPM Marketing Invoice New Alert</description>
        <protected>false</protected>
        <recipients>
            <field>PMM_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SAM_PPM_Email_Templates/PPM_Marketing_Invoice_New</template>
    </alerts>
    <alerts>
        <fullName>PPM_Marketing_Invoice_Updated_Alert</fullName>
        <description>PPM Marketing Invoice Updated Alert</description>
        <protected>false</protected>
        <recipients>
            <field>PMM_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SAM_PPM_Email_Templates/PPM_Marketing_Invoice_Updated</template>
    </alerts>
    <alerts>
        <fullName>Vendor_Contract_Renewal_30_day_reminder</fullName>
        <ccEmails>Katie.pelly@avalara.com</ccEmails>
        <description>Vendor Contract Renewal 30 day reminder</description>
        <protected>false</protected>
        <recipients>
            <recipient>jessica.davis@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/X30_day_Vendor_Contract_reminder</template>
    </alerts>
    <alerts>
        <fullName>X30_day_renew_date</fullName>
        <description>30 day renew date for vendor invoide</description>
        <protected>false</protected>
        <recipients>
            <recipient>chance.pruiett@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>katie.pelly@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/X30_day_Vendor_Contract_reminder</template>
    </alerts>
    <fieldUpdates>
        <fullName>Approved_pending_Payment</fullName>
        <field>Stage__c</field>
        <literalValue>Approved Pending Payment</literalValue>
        <name>Approved pending Payment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Back_to_Pending_Details</fullName>
        <field>Stage__c</field>
        <name>Back to Pending Details</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>NextValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Expected_Payment_Date</fullName>
        <description>Calculated date 45 days after approval</description>
        <field>Expected_Payment_Date__c</field>
        <formula>TODAY() + 45</formula>
        <name>Expected Payment Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Expected_Payment_Date_emea</fullName>
        <field>Expected_Payment_Date__c</field>
        <formula>TODAY() + 45</formula>
        <name>Expected Payment Date emea</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MKT_Invoice_Dept_Code_to_401</fullName>
        <field>Department_Code__c</field>
        <literalValue>401 – Marketing Communications</literalValue>
        <name>MKT Invoice: Dept Code to 401</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Marketing_Invoice_Name_Stamp</fullName>
        <field>Marketing_Invoice_Name_Stamp__c</field>
        <formula>Name</formula>
        <name>Marketing Invoice Name Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Marketing_Invoice_Paid</fullName>
        <field>Invoice_Paid__c</field>
        <literalValue>1</literalValue>
        <name>Marketing Invoice Paid</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Marketing_Invoice_Pending_Details</fullName>
        <field>Stage__c</field>
        <literalValue>Pending Approval - Details</literalValue>
        <name>Marketing Invoice - Pending Details</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Marketing_Invoice_Pending_Payment</fullName>
        <field>Stage__c</field>
        <literalValue>Approved Pending Payment</literalValue>
        <name>Marketing Invoice - Pending Payment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Marketing_Invoice_Pending_manager_appr</fullName>
        <field>Stage__c</field>
        <literalValue>Pending Approval - Manager</literalValue>
        <name>Marketing Invoice - Pending manager appr</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Marketing_Invoice_approved</fullName>
        <field>Stage__c</field>
        <literalValue>Approved Pending Payment</literalValue>
        <name>Marketing Invoice approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Marketing_invoice_Stage_Paid</fullName>
        <field>Stage__c</field>
        <literalValue>Paid</literalValue>
        <name>Marketing invoice Stage Paid</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Mkt_Invoice_GL_code_to_7280</fullName>
        <field>GL_Code__c</field>
        <literalValue>7280 International Marketing</literalValue>
        <name>Mkt Invoice: GL code to 7280</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rejected_Invoice_Stage</fullName>
        <field>Stage__c</field>
        <literalValue>Rejected</literalValue>
        <name>Rejected Invoice Stage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Time_Approved</fullName>
        <field>Time_Approved__c</field>
        <formula>NOW()</formula>
        <name>Stamp Time Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Time_Submitted</fullName>
        <field>Time_Submitted__c</field>
        <formula>NOW()</formula>
        <name>Stamp Time Submitted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>30 Day Vendor Contract renewal</fullName>
        <actions>
            <name>X30_day_renew_date</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Marketing_Invoice__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Vendor Contract Invoice</value>
        </criteriaItems>
        <criteriaItems>
            <field>Marketing_Invoice__c.Day_until_renewal_Due__c</field>
            <operation>equals</operation>
            <value>30</value>
        </criteriaItems>
        <description>send notice 30 days prior to contract renewal date</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Marketing_Invoice__c.Contract_Renewal_Date__c</offsetFromField>
            <timeLength>-30</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>EMEA Invoices</fullName>
        <actions>
            <name>MKT_Invoice_Dept_Code_to_401</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Mkt_Invoice_GL_code_to_7280</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Marketing_Invoice__c.EMEA_Invoice__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Updates GL code to 7280 International Marketing and Dept. Code to 401 when EMEA invoice is checked on record</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email Alert When Marketing Invoice Pending Approval</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Marketing_Invoice__c.Time_Submitted__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Marketing_Invoice__c.Time_Approved__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Marketing_Invoice_Pending_Approval_Email_Alert</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Marketing_Invoice__c.Time_Submitted__c</offsetFromField>
            <timeLength>14</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Marketing Invoice Name Dupe prevention</fullName>
        <actions>
            <name>Marketing_Invoice_Name_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Marketing_Invoice__c.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Marketing_Invoice_Approved_for_Payment</fullName>
        <assignedTo>joy.dupree@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>New Marketing Invoice is ready for payment</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Marketing Invoice Approved for Payment</subject>
    </tasks>
</Workflow>
