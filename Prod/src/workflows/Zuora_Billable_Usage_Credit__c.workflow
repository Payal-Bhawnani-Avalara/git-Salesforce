<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_Approval_Notice</fullName>
        <description>Send Approval Notice</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Zuora_Billable_Workflow_Items/Zuora_Credit_Limit_Approved</template>
    </alerts>
    <alerts>
        <fullName>Send_Rejection_Notice</fullName>
        <description>Send Rejection Notice</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Zuora_Billable_Workflow_Items/Zuora_Credit_Limit_Rejected</template>
    </alerts>
    <alerts>
        <fullName>Send_ZBUCReject</fullName>
        <description>Send ZBUC Rejection</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Zuora_Billable_Workflow_Items/Zuora_Credit_Limit_Rejected</template>
    </alerts>
    <fieldUpdates>
        <fullName>Approval_Date</fullName>
        <description>https://jira.avalara.com/browse/IBST-12706</description>
        <field>Approval_Date__c</field>
        <formula>TODAY()</formula>
        <name>Approval Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approved_By</fullName>
        <description>https://jira.avalara.com/browse/IBST-12706</description>
        <field>Approved_By__c</field>
        <formula>$User.Full_Name__c</formula>
        <name>Approved By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Invoice_Credit_Balance_Update</fullName>
        <field>Transaction_Credit_Balance__c</field>
        <formula>Transaction_Credit_Balance__c -   Invoice_Credit_Transaction_Equivalent__c</formula>
        <name>Invoice Credit Balance Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Status_Approved</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Set Status Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Status_Pending</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Pending</literalValue>
        <name>Set Status Pending</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Status_Rejected</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>Set Status Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Account_Level_Term_End_Date</fullName>
        <field>Transaction_Credit_End_Date__c</field>
        <formula>Account__r.AvaTax_Current_Plan_End_Date__c</formula>
        <name>Stamp Account Level Term End Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Balance_Default</fullName>
        <field>Transaction_Credit_Balance__c</field>
        <formula>Transaction_Credit_Amount__c -  Invoice_Transaction_Credit_Amount__c</formula>
        <name>Stamp Balance Default</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Default Balance Trigger</fullName>
        <actions>
            <name>Stamp_Balance_Default</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Zuora_Billable_Usage_Credit__c.Transaction_Credit_Amount__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Zuora_Billable_Usage_Credit__c.Transaction_Credit_UOM__c</field>
            <operation>equals</operation>
            <value>Documents,Transactions</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Post Initial Invoice Credit Trigger</fullName>
        <actions>
            <name>Invoice_Credit_Balance_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Zuora_Billable_Usage_Credit__c.Invoice_Credit_Amount__c</field>
            <operation>greaterThan</operation>
            <value>USD 0</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp End Date From Current Tier</fullName>
        <actions>
            <name>Stamp_Account_Level_Term_End_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Zuora_Billable_Usage_Credit__c.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
