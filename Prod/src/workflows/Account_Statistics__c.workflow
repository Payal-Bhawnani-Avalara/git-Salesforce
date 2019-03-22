<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Stamp_1st_Liability_Date</fullName>
        <field>X1st_Liability_Date_Stamp__c</field>
        <formula>X1st_Liability_Date__c</formula>
        <name>Stamp 1st Liability Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Annual</fullName>
        <field>X1st_Liability_Annual_Date_Stamp__c</field>
        <formula>X1st_Liability_Annual_Date__c</formula>
        <name>Stamp Annual</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_AvaTax_PROD_ID</fullName>
        <field>PROD_AvaTax_Account__c</field>
        <formula>AvaTaxAccountID__c</formula>
        <name>Stamp AvaTax PROD ID</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Account__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Bilable_Count</fullName>
        <field>Billable_Count__c</field>
        <formula>TotalBillable__c</formula>
        <name>Stamp Bilable Count</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Account__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Company_Count</fullName>
        <field>Company_Count__c</field>
        <formula>CompanyCount__c</formula>
        <name>Stamp Company Count</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Account__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Dev_ID</fullName>
        <field>Dev_AvaTax_Account__c</field>
        <formula>AvaTaxAccountID__c</formula>
        <name>Stamp Dev ID</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Account__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Monthly</fullName>
        <field>X1st_Liability_Monthly_Date_Stamp__c</field>
        <formula>X1st_Liability_Monthly_Date__c</formula>
        <name>Stamp Monthly</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Nexus_Count</fullName>
        <field>Nexus_Count__c</field>
        <formula>NexusCount__c</formula>
        <name>Stamp Nexus Count</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Account__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Quarterly</fullName>
        <field>X1st_Liability_Quarter_Date_Stamp__c</field>
        <formula>X1st_Liability_Quarter_Date__c</formula>
        <name>Stamp Quarterly</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Transaction_Detected</fullName>
        <field>CX_911_Transaction_Date__c</field>
        <formula>Today()</formula>
        <name>Stamp Transaction Detected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Unknown_Signature</fullName>
        <field>CX_911_Connector_Signature_s__c</field>
        <formula>&quot;Unknown Transaction Detected&quot;</formula>
        <name>Stamp Unknown Signature</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Account_Min_Created</fullName>
        <field>Account_Min_Activated__c</field>
        <formula>Today()</formula>
        <name>Update Account Min Created</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status</fullName>
        <field>AccountStatus__c</field>
        <formula>&quot;Pending - Unused&quot;</formula>
        <name>Update Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Signature Override for Transaction Detected</fullName>
        <actions>
            <name>Stamp_Unknown_Signature</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account_Statistics__c.CX_911_Connector_Signature_s__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account_Statistics__c.CX_911_Transaction_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp 1st Liability Date</fullName>
        <actions>
            <name>Stamp_1st_Liability_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account_Statistics__c.X1st_Liability_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Annual</fullName>
        <actions>
            <name>Stamp_Annual</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account_Statistics__c.X1st_Liability_Annual_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp DEV ID at Account Level</fullName>
        <actions>
            <name>Stamp_Dev_ID</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( TEXT(System__c) = &quot;DEV&quot; , OR(ISNEW(), ISCHANGED( AvaTaxAccountID__c )))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Monthly</fullName>
        <actions>
            <name>Stamp_Monthly</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account_Statistics__c.X1st_Liability_Monthly_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp PROD ID at Account Level</fullName>
        <actions>
            <name>Stamp_AvaTax_PROD_ID</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( TEXT(System__c) = &quot;PROD&quot; , OR(ISNEW(), ISCHANGED( AvaTaxAccountID__c )))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Quarterly</fullName>
        <actions>
            <name>Stamp_Quarterly</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account_Statistics__c.X1st_Liability_Quarter_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Transaction Detected</fullName>
        <actions>
            <name>Stamp_Transaction_Detected</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(NOT(ISBLANK( FirstDocument__c)), NOT(ISBLANK(  FirstGetTax__c )))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Temp Sandbox</fullName>
        <actions>
            <name>Update_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account_Statistics__c.System__c</field>
            <operation>equals</operation>
            <value>DEV</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account_Statistics__c.AccountStatus__c</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account_Statistics__c.Provisioned_Services__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Account Min Created</fullName>
        <actions>
            <name>Update_Account_Min_Created</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account_Statistics__c.AccountStatus__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Company Count %26 Nexus</fullName>
        <actions>
            <name>Stamp_Bilable_Count</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Company_Count</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Nexus_Count</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( ISPICKVAL(System__c,&quot;PROD&quot;), OR(ISNEW(), ISCHANGED( TotalBillable__c ),ISCHANGED( CompanyCount__c ), ISCHANGED( NexusCount__c )))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
