<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>AlertAccountIdentifiedAtRisk</fullName>
        <description>Alert: Account Identified At Risk</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <recipient>GetsAtRiskAlerts</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <field>LastModifiedById</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/AccountAtRisk</template>
    </alerts>
    <alerts>
        <fullName>BD_Assigned_Alert</fullName>
        <description>BD Assigned Alert</description>
        <protected>false</protected>
        <recipients>
            <field>BusDevOwner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/BD_Assigned_Alert</template>
    </alerts>
    <alerts>
        <fullName>CAMRenewalAccountProfileAlert</fullName>
        <description>(AP) CAM Renewal Account Profile Alert</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>CAM_email_Templates/Account_Profile_Alert</template>
    </alerts>
    <alerts>
        <fullName>CAM_Account_CPO_90_Email_Alert</fullName>
        <description>CAM Account CPO +90 Email Alert</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderAddress>customer.loyalty@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>CAM_email_Templates/CAM_Account_CPO_90_Alert</template>
    </alerts>
    <alerts>
        <fullName>CDM_Assigned_Alert</fullName>
        <description>DSP Partner Level SAM Assigned</description>
        <protected>false</protected>
        <recipients>
            <field>BusDevOwner__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>CDM__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Onboarding/Onboarding_CDM_Asigned</template>
    </alerts>
    <alerts>
        <fullName>DSP_Account_Owner_Change_Error</fullName>
        <description>DSP Account Owner Change Error</description>
        <protected>false</protected>
        <recipients>
            <recipient>aaron.zapf@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/AccountOwnerChange</template>
    </alerts>
    <alerts>
        <fullName>DSP_Partner_Sales_Director_Required</fullName>
        <ccEmails>aaron.zapf@avalara.com</ccEmails>
        <ccEmails>asher.mathew@avalara.com</ccEmails>
        <description>DSP Partner Sales Director Required</description>
        <protected>false</protected>
        <recipients>
            <recipient>pascal.vandooren@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Onboarding/Onboarding_DSP_SD</template>
    </alerts>
    <alerts>
        <fullName>DSP_Partner_TTSales_Director_Required</fullName>
        <description>DSP Partner Sales Director Required TESTING</description>
        <protected>false</protected>
        <recipients>
            <recipient>clayton.wiggins@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Onboarding/Onboarding_DSP_SD</template>
    </alerts>
    <alerts>
        <fullName>EVP_Sales_DSP_Qualified_Alert</fullName>
        <ccEmails>pascal.vandooren@avalara.com, jay.deubler@avalara.com, pat.falle@avalara.com, balz.wyss@avalara.com, sacha.wilson@avalara.com</ccEmails>
        <description>EVP Sales DSP Qualified Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>bryan.wiggins@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kael.kelly@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Onboarding/D2Onboarding_CDM_Asigned</template>
    </alerts>
    <alerts>
        <fullName>Email_Marshal_when_this_rule_is_triggered</fullName>
        <description>Email Marshal when this rule is triggered</description>
        <protected>false</protected>
        <recipients>
            <recipient>marshal.kushniruk@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/NotifyMarshalNewT2OEMAccount</template>
    </alerts>
    <alerts>
        <fullName>Kick_off_call_required</fullName>
        <description>Kick off call required</description>
        <protected>false</protected>
        <recipients>
            <field>BusDevOwner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Kickoff_Call_Required</template>
    </alerts>
    <alerts>
        <fullName>Kick_off_scheduled_escalation_to_SD</fullName>
        <description>Kick off scheduled escalation to SD</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Kick_off_call_reminder_for_SD</template>
    </alerts>
    <alerts>
        <fullName>Kick_off_scheduled_reminder_1</fullName>
        <description>Kick off scheduled reminder 1</description>
        <protected>false</protected>
        <recipients>
            <field>CDM__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Kick_off_call_reminder</template>
    </alerts>
    <alerts>
        <fullName>Kick_off_scheduled_reminder_2</fullName>
        <description>Kick off scheduled reminder 2</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Kick_off_call_reminder</template>
    </alerts>
    <alerts>
        <fullName>Kick_off_scheduled_reminder_3</fullName>
        <description>Kick off scheduled reminder 3</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Kick_off_call_reminder</template>
    </alerts>
    <alerts>
        <fullName>MM_Assignment_Needed</fullName>
        <description>MM Assignment Needed</description>
        <protected>false</protected>
        <recipients>
            <recipient>robin.conner@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Onboarding/Onboarding_MM_Required</template>
    </alerts>
    <alerts>
        <fullName>MSP_ACP_Partner_Level_SAM_Assignment_Alert</fullName>
        <description>MSP/ACP Partner Level SAM Assignment Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Onboarding/Onboarding_MSP_Asigned</template>
    </alerts>
    <alerts>
        <fullName>MSP_Non_Web_Reminder</fullName>
        <description>MSP Non Web Reminder</description>
        <protected>false</protected>
        <recipients>
            <field>CDM__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/MSP_Non_Web_Contract_Reminder</template>
    </alerts>
    <alerts>
        <fullName>MSP_Partner_Sales_Director_Required</fullName>
        <ccEmails>aaron.zapf@avalara.com</ccEmails>
        <description>MSP Partner Sales Director Required</description>
        <protected>false</protected>
        <recipients>
            <recipient>pascal.vandooren@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Onboarding/Onboarding_MSP</template>
    </alerts>
    <alerts>
        <fullName>Managed_Partner_PBP_Required</fullName>
        <description>Managed Partner PBP Required</description>
        <protected>false</protected>
        <recipients>
            <field>CDM__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Onboarding/Onboarding_PBP_Alert_Asigned</template>
    </alerts>
    <alerts>
        <fullName>NS_Commission_Alert_for_DSP</fullName>
        <ccEmails>balz.wyss@avalara.com</ccEmails>
        <description>NS Commission Alert for DSP</description>
        <protected>false</protected>
        <recipients>
            <recipient>marshal.kushniruk@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mihaela.mircea-zick@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Onboarding/Non_Standard_Commission</template>
    </alerts>
    <alerts>
        <fullName>NewPartnerDing</fullName>
        <description>New Partner Ding</description>
        <protected>false</protected>
        <recipients>
            <recipient>bob.waite@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SalesGroup/NewPartnerDingEMail</template>
    </alerts>
    <alerts>
        <fullName>NewT2PartnerApproved</fullName>
        <ccEmails>dg-sales@avalara.com;</ccEmails>
        <ccEmails>dg-technicalservices@avalara.com;</ccEmails>
        <ccEmails>bob.waite@avalara.com;</ccEmails>
        <ccEmails>dg-execs@avalara.com;</ccEmails>
        <ccEmails>clayton.wiggins@avalara.com</ccEmails>
        <description>New T2 Partner Approved</description>
        <protected>false</protected>
        <recipients>
            <recipient>simone.vanrheenen@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SalesGroup/NewT2PartnerEMail</template>
    </alerts>
    <alerts>
        <fullName>New_CDM_Sourced_Partner_Alert</fullName>
        <description>New CDM Sourced Partner Alert</description>
        <protected>false</protected>
        <recipients>
            <field>CDM_Source_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CDM_Onboarded_Partner_Alert</template>
    </alerts>
    <alerts>
        <fullName>Notify_Batavia_of_ISPI_Customer_At_Risk</fullName>
        <ccEmails>d.marie@taxrates.com</ccEmails>
        <description>Notify Batavia of ISPI Customer At Risk</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <recipient>bob.waite@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/AccountAtRisk</template>
    </alerts>
    <alerts>
        <fullName>Notify_SAM_and_PPM_of_New_Partner_Signup</fullName>
        <description>Notify SAM and PPM of New Partner Signup</description>
        <protected>false</protected>
        <recipients>
            <field>CDM__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Secondary_CDM__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Onboarding/New_Partner_Signup_Alert</template>
    </alerts>
    <alerts>
        <fullName>Nudge_Bob_to_Set_Contracts_Flag</fullName>
        <description>Nudge Bob to Set Contracts Flag</description>
        <protected>false</protected>
        <recipients>
            <recipient>bob.waite@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>john.osman@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SalesGroup/T2OEM_Needs_OK</template>
    </alerts>
    <alerts>
        <fullName>PBB</fullName>
        <description>PBP for BD</description>
        <protected>false</protected>
        <recipients>
            <field>BusDevOwner__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Onboarding/Onboarding_PBP_Alert_Asigned</template>
    </alerts>
    <alerts>
        <fullName>PartnerDeveloperProfileUpdated</fullName>
        <ccEmails>navees.ahmed@avalara.com</ccEmails>
        <description>PartnerDeveloperProfileUpdated</description>
        <protected>false</protected>
        <recipients>
            <recipient>sara.simrell@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Program_Request/PartnerDeveloperProfileUpdated</template>
    </alerts>
    <alerts>
        <fullName>PartnerTypeChangeAlert</fullName>
        <description>Partner Type Change Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>bob.waite@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SalesGroup/PartnerUpdateAlert</template>
    </alerts>
    <alerts>
        <fullName>Partner_Activated</fullName>
        <description>Partner Activated</description>
        <protected>false</protected>
        <recipients>
            <recipient>balz.wyss@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Partner_Activated</template>
    </alerts>
    <alerts>
        <fullName>SR_Asigned_Alert</fullName>
        <description>SR Asigned Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Onboarding/Onboarding_SR_Asigned</template>
    </alerts>
    <alerts>
        <fullName>Send_Notification_to_Previous_Owner_of_Account_Owner_Change</fullName>
        <description>Send Notification to Previous Owner of Account Owner Change</description>
        <protected>false</protected>
        <recipients>
            <recipient>clayton.wiggins@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/AccountOwnerChange</template>
    </alerts>
    <alerts>
        <fullName>Unmanaged_partner_has_two_dings</fullName>
        <description>Unmanaged partner has two dings</description>
        <protected>false</protected>
        <recipients>
            <field>CDM__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Onboarding/Onboarding_Unmanaged</template>
    </alerts>
    <fieldUpdates>
        <fullName>ACP_Moves_to_Active</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Partner_Active</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>ACP Moves to Active</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Product_Class_Stamp</fullName>
        <field>Account_Product_Class_Stamp_for_routing__c</field>
        <formula>Account_Product_Class__c</formula>
        <name>Account Product Class Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_Deubler</fullName>
        <field>OwnerId</field>
        <lookupValue>ken.brajevich@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign Deubler</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_to_Matthew_Hammond</fullName>
        <field>OwnerId</field>
        <lookupValue>matthew.hammond@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign to Matthew Hammond</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Budget_Status_New</fullName>
        <field>BudgetStatus__c</field>
        <literalValue>New</literalValue>
        <name>Budget Status New</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CAM_Account_Distribution_User_Assignment</fullName>
        <field>OwnerId</field>
        <lookupValue>camaccount@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>CAM Account Distribution User Assignment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CUP_User_TRUE</fullName>
        <field>CUP_User__c</field>
        <literalValue>1</literalValue>
        <name>CUP User TRUE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Partner_Record_Type_Active</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Partner_Active</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change Partner Record Type Active</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Partner_Record_Type_Agreement</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Partner_Agreement</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change Partner Record Type Agreement</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Record_To_Certification</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Partner_Certification</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change Record To Certification</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_100</fullName>
        <field>AvaTax_Usage_100_Date__c</field>
        <name>Clear 100%</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_70</fullName>
        <field>AvaTax_Usage_70_Date__c</field>
        <name>Clear 70%</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_80</fullName>
        <field>AvaTax_Usage_80_Date__c</field>
        <name>Clear 80%</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_90</fullName>
        <field>AvaTax_Usage_90_Date__c</field>
        <name>Clear 90%</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Engaged_By_Assigned_Date</fullName>
        <field>Engaged_by_Assignment_Date__c</field>
        <name>Clear Engaged By Assigned Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>DSP_is_Managed_Auto</fullName>
        <field>Partner_Managemen__c</field>
        <literalValue>Managed</literalValue>
        <name>DSP is Managed Auto</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Default_Notice</fullName>
        <field>T_C_Renewal_Notice_Date__c</field>
        <formula>Partner_Contract_Signed_Date__c + 330</formula>
        <name>Default Notice</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Default_Renewal_Notice</fullName>
        <field>T_C_Renewal_Date__c</field>
        <formula>Partner_Contract_Signed_Date__c + 360</formula>
        <name>Default Renewal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Engaged_By_Null</fullName>
        <field>Engaged_By__c</field>
        <name>Engaged By = Null</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Force</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Avalara_TrustFile</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Force TrustFile Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Force_Customer_Account_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Customer_Account_Type</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Force Customer Account Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Force_EMEA_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>EMEA_Account</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Force EMEA Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Force_ZTBuy_Owner</fullName>
        <field>OwnerId</field>
        <lookupValue>ztb-boomiapi@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Force ZTBuy Owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Ignore_account_Assignment_stamp</fullName>
        <field>Ignore_Owner_Assignment__c</field>
        <literalValue>1</literalValue>
        <name>Ignore account Assignment stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Is_Distributed_Stamp</fullName>
        <field>n2de__Is_distributed__c</field>
        <literalValue>1</literalValue>
        <name>Is Distributed Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Make_Managed_if_Dings_2</fullName>
        <field>Partner_Managemen__c</field>
        <literalValue>Managed</literalValue>
        <name>Make Managed if Dings&gt;2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Move_to_Qualified_Record_Type</fullName>
        <field>Qualification_Information_Complete_Date__c</field>
        <formula>Today()</formula>
        <name>Move to Qualified Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Name_Account_Candidate_Stamp</fullName>
        <field>CAM_Name_Candidate__c</field>
        <literalValue>1</literalValue>
        <name>Name Account Candidate Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Engaged_by_Assigned_Date</fullName>
        <field>Engaged_by_Assignment_Date__c</field>
        <formula>TODAY()</formula>
        <name>Populate Engaged by Assigned Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Professional_Support</fullName>
        <field>SupportLevel__c</field>
        <formula>&quot;Professional Support&quot;</formula>
        <name>Professional Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SOHO_FTO</fullName>
        <field>RecordTypeId</field>
        <lookupValue>SOHO_FTO_Account</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>SOHO FTO</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SOHO_FTO_Ownership</fullName>
        <field>OwnerId</field>
        <lookupValue>ztb-boomiapi@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>SOHO FTO Ownership</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Active_Customer</fullName>
        <field>ActiveCustomer__c</field>
        <literalValue>1</literalValue>
        <name>Set Active Customer True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Active_Customer_False</fullName>
        <field>ActiveCustomer__c</field>
        <literalValue>0</literalValue>
        <name>Set Active Customer False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_CX_Rep_to_Clint_Knudsen</fullName>
        <field>CX_Rep__c</field>
        <lookupValue>clint.knudsen@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Set CX Rep to Clint Knudsen</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_CX_Rep_to_Holly_Rutledge</fullName>
        <field>CX_Rep__c</field>
        <lookupValue>holly.rutledge@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Set CX Rep to Holly Rutledge</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_CX_Rep_to_Jeff_Williams</fullName>
        <field>CX_Rep__c</field>
        <lookupValue>jeff.williams@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Set CX Rep to Jeff Williams</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_CX_Rep_to_Ken_Davis</fullName>
        <field>CX_Rep__c</field>
        <lookupValue>ken.davis@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Set CX Rep to Ken Davis</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_CX_Rep_to_Natasha_Strickland</fullName>
        <field>CX_Rep__c</field>
        <lookupValue>natasha.strickland@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Set CX Rep to Natasha Strickland</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_CX_Rep_to_Nicholas_Ostrom</fullName>
        <field>CX_Rep__c</field>
        <lookupValue>nicholas.ostrom@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Set CX Rep to Nicholas Ostrom</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_CX_Rep_to_Rose_Tweit</fullName>
        <field>CX_Rep__c</field>
        <lookupValue>rose.tweit@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Set CX Rep to Rose Tweit</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_CX_Rep_to_Tonya_Winchester</fullName>
        <field>CX_Rep__c</field>
        <lookupValue>tonya.winchester@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Set CX Rep to Tonya Winchester</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Owner_as_FTO_Account_Distribution</fullName>
        <description>Create Request: IBST-12051</description>
        <field>OwnerId</field>
        <lookupValue>ftoaccountdistribution@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Set Owner as FTO Account Distribution</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Support_Level_Standard</fullName>
        <field>SupportLevel__c</field>
        <formula>&quot;AvaTax Standard Support&quot;</formula>
        <name>Set Support Level Standard</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_to_Qualification</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Partner_Qualification</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Set to Qualification</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_100_Usage_Date</fullName>
        <field>AvaTax_Usage_100_Date__c</field>
        <formula>Today()</formula>
        <name>Stamp 100% Usage Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_70_Usage_Date</fullName>
        <field>AvaTax_Usage_70_Date__c</field>
        <formula>Today()</formula>
        <name>Stamp 70% Usage Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_80_Usage_Date</fullName>
        <field>AvaTax_Usage_80_Date__c</field>
        <formula>Today()</formula>
        <name>Stamp 80% Usage Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_90_Usage_Date</fullName>
        <field>AvaTax_Usage_90_Date__c</field>
        <formula>Today()</formula>
        <name>Stamp 90% Usage Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_AvaTax_End_Date_Next_Subscription</fullName>
        <field>NextSubscriptionEndDate__c</field>
        <formula>AvaTax_Current_Plan_End_Date__c</formula>
        <name>Stamp AvaTax End Date Next Subscription</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_BAIB_Last_Date</fullName>
        <field>Blue_in_the_Box_Last_Sign_Up_Date__c</field>
        <formula>PRIORVALUE( BLUE_in_the_Box_Sign_Up_Date__c )</formula>
        <name>Stamp BAIB Last Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_BD_Assignment_Date</fullName>
        <field>BD_Assigned_Date__c</field>
        <formula>TOday()</formula>
        <name>Stamp BD Assignment Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Business_Support</fullName>
        <field>SupportLevel__c</field>
        <formula>&quot;Business Support&quot;</formula>
        <name>Stamp Business Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_CPO_90_Date</fullName>
        <field>CPO_90_Score_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp CPO 90 Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Enterprise_Support</fullName>
        <field>SupportLevel__c</field>
        <formula>&quot;Enterprise Support&quot;</formula>
        <name>Stamp Enterprise Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_OAIB_BAIB_Renewal</fullName>
        <field>OIAB_BIAB_Renewal__c</field>
        <literalValue>1</literalValue>
        <name>Stamp OAIB/BAIB Renewal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_OAIB_Last</fullName>
        <field>ORANGE_in_the_Box_Last_Sign_Up_Date__c</field>
        <formula>PRIORVALUE( ORANGE_in_the_Box_Sign_Up_Date__c )</formula>
        <name>Stamp OAIB Last</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Premium_Support</fullName>
        <field>SupportLevel__c</field>
        <formula>&quot;AvaTax Premium Support&quot;</formula>
        <name>Stamp Premium Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Previous_PMM</fullName>
        <field>Previous_PMM_del__c</field>
        <formula>PRIORVALUE( PPM_Full_Name_Text__c )</formula>
        <name>Stamp Previous PMM</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Product_Summary_Changed_Date</fullName>
        <field>Product_Summary_Updated__c</field>
        <formula>Today()</formula>
        <name>Stamp Product Summary Changed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Professional_Support</fullName>
        <field>SupportLevel__c</field>
        <formula>&quot;Professional Support&quot;</formula>
        <name>Stamp Professional Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Standard_Support</fullName>
        <field>SupportLevel__c</field>
        <formula>&quot;Standard Support&quot;</formula>
        <name>Stamp Standard Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Support_Level_Gold</fullName>
        <field>SupportLevel__c</field>
        <formula>&quot;AvaTax Gold Support&quot;</formula>
        <name>Stamp Support Level Gold</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_first_deal</fullName>
        <field>First_Deal_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp first deal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TrustFile_Bharat_ACP</fullName>
        <field>Partner_Category__c</field>
        <literalValue>Accounting &amp; Consulting Partner</literalValue>
        <name>TrustFile Bharat = ACP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Uncheck_Returns_Flag</fullName>
        <field>Returns__c</field>
        <literalValue>0</literalValue>
        <name>Uncheck Returns Flag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Calc_Flag</fullName>
        <field>Calc__c</field>
        <literalValue>1</literalValue>
        <name>Update Calc Flag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Entitlement_to_Standard</fullName>
        <field>SupportLevel__c</field>
        <formula>&quot;Standard&quot;</formula>
        <name>Update Entitlement to Standard</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Kickoff_CAll_Scheduled_Date</fullName>
        <description>puts today() in Kickoff Call Scheduled Date</description>
        <field>Kick_Off_Call_Scheduled_Date__c</field>
        <formula>today()</formula>
        <name>Update Kickoff CAll Scheduled Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Owner_ScheduleOnce</fullName>
        <field>OwnerId</field>
        <lookupValue>scheduleonceapi@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Update Owner ScheduleOnce</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Returns_Flag</fullName>
        <field>Returns__c</field>
        <literalValue>1</literalValue>
        <name>Update Returns Flag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <flowActions>
        <fullName>Populate_PBA_from_Primary_CDM_User_record</fullName>
        <flow>Populate_Account_PBA_from_Primary_CDM_User_record</flow>
        <flowInputs>
            <name>AccountID</name>
            <value>{!Id}</value>
        </flowInputs>
        <flowInputs>
            <name>AccountOwner</name>
            <value>{!CDM__r.Id}</value>
        </flowInputs>
        <label>Populate PBA from Primary CDM User record</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <outboundMessages>
        <fullName>iv__Refresh_Accounts_Outbound_Message</fullName>
        <apiVersion>43.0</apiVersion>
        <description>This is used for notifying InsideView Refresh for Accounts.</description>
        <endpointUrl>https://integrations.insideview.com/integrations-notifications/salesforce/account?authType=IV_SALESFORCE_CANVAS</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>kory.leavitt@avalara.com</integrationUser>
        <name>InsideView Accounts Outbound Message</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>ACP Partner Qualified</fullName>
        <actions>
            <name>Change_Partner_Record_Type_Agreement</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1    AND 2 and 3</booleanFilter>
        <criteriaItems>
            <field>Account.Partner_Category__c</field>
            <operation>equals</operation>
            <value>Accounting &amp; Consulting Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Qualification_Information_Complete_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>User.Validation_Exempt__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Account Owner Change Notification</fullName>
        <actions>
            <name>Send_Notification_to_Previous_Owner_of_Account_Owner_Change</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>If Account Owner is changed by anyone but the existing Account Owner, a notification is sent to the previous Account Owner.</description>
        <formula>AND(ISCHANGED( OwnerId ), LastModifiedBy.Id &lt;&gt; PRIORVALUE(OwnerId ),  $User.Validation_Exempt__c = FALSE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Account Product Class Stamp</fullName>
        <actions>
            <name>Account_Product_Class_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamps the Account Product Class formula as text to be reduced for Cam Eligible formula used in CAM account assignment routing</description>
        <formula>ISCHANGED(Account_Product_Class__c )= TRue</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Activate Partner First Deal</fullName>
        <actions>
            <name>Stamp_first_deal</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Total_Deals__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner Qualification,Partner Agreement,Partner Readiness</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Auto CUP User at First Purchase</fullName>
        <actions>
            <name>CUP_User_TRUE</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.First_Purchase_Date__c</field>
            <operation>greaterOrEqual</operation>
            <value>10/16/2017</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax 100%25 Usage Trigger</fullName>
        <actions>
            <name>Stamp_100_Usage_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( 
AvaTax_Current_Usage__c &gt;= 1.0, 
ISBLANK ( AvaTax_Usage_100_Date__c ) 
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax 70%25 Usage Trigger</fullName>
        <actions>
            <name>Stamp_70_Usage_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( 
AvaTax_Current_Usage__c &gt;= 0.7, 
ISBLANK ( AvaTax_Usage_70_Date__c ) 
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax 80%25 Usage Trigger</fullName>
        <actions>
            <name>Stamp_80_Usage_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( 
AvaTax_Current_Usage__c &gt;= 0.8, 
ISBLANK ( AvaTax_Usage_80_Date__c ) 
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax 90%25 Usage Trigger</fullName>
        <actions>
            <name>Stamp_90_Usage_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
AvaTax_Current_Usage__c &gt;= 0.9,
ISBLANK ( AvaTax_Usage_90_Date__c )
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax Usage Fields Clear</fullName>
        <actions>
            <name>Clear_100</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear_70</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear_80</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear_90</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(ISCHANGED(AvaTax_Current_Plan_End_Date__c) , ISCHANGED(AvaTax_Current_Plan_Tier__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>BD Assigned Alert</fullName>
        <actions>
            <name>BD_Assigned_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Stamp_BD_Assignment_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.BusDevOwner__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>MyLodge Partner,MyLodge Account</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>BP Partner Qualified</fullName>
        <actions>
            <name>Change_Partner_Record_Type_Agreement</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Qualification_Information_Complete_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Partner_Category__c</field>
            <operation>equals</operation>
            <value>Accounting &amp; Consulting Partner,Marketing &amp; Sales Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>MyLodge Partner,MyLodge Account</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CAM Account CPO %2B90 Alerts</fullName>
        <actions>
            <name>CAM_Account_CPO_90_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>CAM_Account_CPO_90_Task</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.CPO_Overall_Score__c</field>
            <operation>greaterOrEqual</operation>
            <value>90</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Owner_Role__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Owner_Role__c</field>
            <operation>contains</operation>
            <value>CAM</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CAM Account Distribution</fullName>
        <actions>
            <name>Ignore_account_Assignment_stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Is_Distributed_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Deactivated: https://jira.avalara.com/browse/BATS-549</description>
        <formula>AND( ISCHANGED( OwnerId ) , PRIORVALUE(OwnerId)= &quot;00533000004B2iS&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CAM Assign Account to CAM Distribution User</fullName>
        <actions>
            <name>CAM_Account_Distribution_User_Assignment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Deactivated: https://jira.avalara.com/browse/BATS-549</description>
        <formula>OR( AND( ISCHANGED(CAM_Eligible_US__c ), CAM_Eligible_US__c = True,  NOT(Contains(Owner_Role__c, &quot;CAM&quot;)),  Ignore_Owner_Assignment__c = False), AND(  ISCHANGED(RecordTypeId), PRIORVALUE(RecordTypeId)= &quot;0120b0000005ip7&quot;, CAM_Eligible_US__c = True,  NOT(Contains(Owner_Role__c, &quot;CAM&quot;)), Ignore_Owner_Assignment__c = False))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Change Engaged By to NULL</fullName>
        <actions>
            <name>Engaged_By_Null</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Number_of_Open_Opportunities__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <description>When an account has an open opportunity change Engaged By to Null.
https://jira.avalara.com/browse/IBST-4623</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Clear Engaged by date</fullName>
        <actions>
            <name>Clear_Engaged_By_Assigned_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>https://jira.avalara.com/browse/IBST-11848</description>
        <formula>AND(        ISCHANGED( Engaged_By__c),         ISPICKVAL(Engaged_By__c,&quot;&quot;)   )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Customer Account Record type - No partner catagory%2E</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Customer Account Type</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Partner_Category__c</field>
            <operation>equals</operation>
            <value>Development &amp; Solutions Partner,Marketing &amp; Sales Partner,Accounting &amp; Consulting Partner</value>
        </criteriaItems>
        <description>If an account moves from a partner account to a customer account, the partner category needs to be made null on the records.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>DSP Kick off call completed</fullName>
        <actions>
            <name>Connector_Certification_Required</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>New_DSP_SKU_Required</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Kick_Off_Call_Complete_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Partner_Category__c</field>
            <operation>equals</operation>
            <value>Development &amp; Solutions Partner</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>DSP Owner Change Notification</fullName>
        <actions>
            <name>DSP_Account_Owner_Change_Error</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>If Account Owner is changed by anyone but the existing Account Owner, a notification is sent to the previous Account Owner.</description>
        <formula>AND(ISCHANGED( OwnerId ), LastModifiedBy.Id &lt;&gt; PRIORVALUE(OwnerId ),  ISPICKVAL(Partner_Category__c, &quot;Development &amp; Solutions Partner&quot;),  NOT(ISBLANK( DSP_Agreement_Signed__c )),$User.Validation_Exempt__c = FALSE,   OR( RecordType.Id  &lt;&gt;  &quot;01233000000Ue4B&quot;,       RecordType.Id  &lt;&gt;  &quot;01233000000Ue4G&quot;    )   )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>DSP Partner Level SAM Assignment Alert</fullName>
        <actions>
            <name>CDM_Assigned_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.CDM__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>User.Validation_Exempt__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Partner_Category__c</field>
            <operation>equals</operation>
            <value>Development &amp; Solutions Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.DSP_Agreement_Signed__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>MyLodge Partner,MyLodge Account</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>DSP Partner Qualified</fullName>
        <actions>
            <name>Change_Partner_Record_Type_Agreement</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>DSP_is_Managed_Auto</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>New_Development_Solutions_Partner_Qualified_Assign_BD</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Partner_Category__c</field>
            <operation>equals</operation>
            <value>Development &amp; Solutions Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Qualification_Information_Complete_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>DSP Partner Signed Triggers</fullName>
        <actions>
            <name>DSP_Partner_Sales_Director_Required</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Budget_Status_New</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Default_Notice</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Default_Renewal_Notice</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>New_Partner_Contract_Signed_Check_OnFile_with_Ops</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.DSP_Agreement_Signed__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>User.Validation_Exempt__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>MyLodge Partner,MyLodge Account</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Default Converted DSP Partner Lead</fullName>
        <actions>
            <name>Set_to_Qualification</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.OwnerId</field>
            <operation>equals</operation>
            <value>Courtney McFarlane</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Partner_Category__c</field>
            <operation>equals</operation>
            <value>Development &amp; Solutions Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Partner Agreement,Partner Readiness,Partner Active</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Default Converted MSP Partner Lead</fullName>
        <actions>
            <name>Change_Record_To_Certification</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.OwnerId</field>
            <operation>equals</operation>
            <value>Courtney McFarlane</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Partner_Category__c</field>
            <operation>equals</operation>
            <value>Marketing &amp; Sales Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Partner Agreement,Partner Readiness,Partner Active</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>FTO Account Assignment</fullName>
        <actions>
            <name>Set_Owner_as_FTO_Account_Distribution</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>contains</operation>
            <value>(FTO)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CARR__c</field>
            <operation>equals</operation>
            <value>USD 0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.SubType__c</field>
            <operation>notContain</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Owner_Role__c</field>
            <operation>notContain</operation>
            <value>CAM</value>
        </criteriaItems>
        <description>Create Request: IBST-12051</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Force Customer Account Record Type</fullName>
        <actions>
            <name>Force_Customer_Account_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR 4) AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>Account.ActiveSubscriptionCount__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Prospect,Avalara Included</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>contains</operation>
            <value>Avalara TrustFile (FTO)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CARR__c</field>
            <operation>greaterThan</operation>
            <value>USD 0</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Force DSP%2FMSP Record Type</fullName>
        <actions>
            <name>Set_to_Qualification</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>OEMPartner,Channel Partner Type</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Force EMEA Record Type</fullName>
        <actions>
            <name>Force_EMEA_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>equals</operation>
            <value>VAT Registration,VAT Returns</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>notContain</operation>
            <value>AvaTax</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Force TrustFile Record Type</fullName>
        <actions>
            <name>Force</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>contains</operation>
            <value>Avalara Trustfile</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>notContain</operation>
            <value>AvaTax</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>General Partner Signed Triggers</fullName>
        <actions>
            <name>Kick_off_call_required</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>MM_Assignment_Needed</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Change_Record_To_Certification</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR 3) AND 2 And 4</booleanFilter>
        <criteriaItems>
            <field>Account.Partner_Contract_Signed_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner Qualification,Partner Agreement</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.DSP_Agreement_Signed__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>User.Validation_Exempt__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Kick off call completed for managed BD</fullName>
        <actions>
            <name>PBB</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Kick_Off_Call_Complete_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Partner_Managemen__c</field>
            <operation>equals</operation>
            <value>Managed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Partner_Category__c</field>
            <operation>equals</operation>
            <value>Accounting &amp; Consulting Partner</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MSP Kick off call completed and dings %3E 2</fullName>
        <actions>
            <name>Make_Managed_if_Dings_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Kick_Off_Call_Complete_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Partner_Category__c</field>
            <operation>equals</operation>
            <value>Accounting &amp; Consulting Partner,Marketing &amp; Sales Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.AnnualDingProjection__c</field>
            <operation>greaterThan</operation>
            <value>2</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MSP Non Web Contract Reminder</fullName>
        <actions>
            <name>MSP_Non_Web_Reminder</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>Partner Agreement</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Partner_Contract_Signed_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Partner_Category__c</field>
            <operation>equals</operation>
            <value>Accounting &amp; Consulting Partner,Marketing &amp; Sales Partner</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MSP%2FACP Partner Level SAM Assignment Alert</fullName>
        <actions>
            <name>MSP_ACP_Partner_Level_SAM_Assignment_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.CDM__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>User.Validation_Exempt__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Partner_Category__c</field>
            <operation>notEqual</operation>
            <value>Development &amp; Solutions Partner</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Maintain Previous PMM on Account</fullName>
        <actions>
            <name>Stamp_Previous_PMM</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( Secondary_CDM__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Named Account Candidate Stamp</fullName>
        <actions>
            <name>Name_Account_Candidate_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND (3 or 5 or (4 and 6))</booleanFilter>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Communications Account,Excise Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CARR__c</field>
            <operation>greaterThan</operation>
            <value>&quot;USD 100,000&quot;</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.AnnualRevenue</field>
            <operation>greaterOrEqual</operation>
            <value>&quot;USD 500,000,000&quot;</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>contains</operation>
            <value>MatrixMaster</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CARR__c</field>
            <operation>greaterThan</operation>
            <value>&quot;USD 25,000&quot;</value>
        </criteriaItems>
        <description>Update: https://jira.avalara.com/browse/IBST-15937</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify SAM and PPM of New Partner</fullName>
        <actions>
            <name>Notify_SAM_and_PPM_of_New_Partner_Signup</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(ISBLANK(PRIORVALUE( PartnerNumber__c )),NOT(ISBLANK(PartnerNumber__c)),OR( RecordType.Id &lt;&gt; &quot;01233000000Ue4B&quot;,  RecordType.Id &lt;&gt; &quot;01233000000Ue4G&quot;  ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Partner Qualification %3D 100%25</fullName>
        <actions>
            <name>Move_to_Qualified_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Partner_Qualification_Stage__c</field>
            <operation>equals</operation>
            <value>100% - Qualification</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>PartnerDeveloperProfileUpdated</fullName>
        <actions>
            <name>PartnerDeveloperProfileUpdated</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>ITBSE-1148</description>
        <formula>OR(ISCHANGED(Application_Types_Supported__c),ISCHANGED(Client_Type__c),ISCHANGED(Company_Information__c),ISCHANGED(Number_of_Employees__c),ISCHANGED(Programming_Languages_Supported__c),ISCHANGED(Reference_Clients__c),ISCHANGED(Services_Offered__c) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Populate Engaged by date</fullName>
        <actions>
            <name>Populate_Engaged_by_Assigned_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>https://jira.avalara.com/browse/IBST-11848</description>
        <formula>AND(        ISCHANGED( Engaged_By__c),         NOT(            ISPICKVAL(Engaged_By__c,&quot;&quot;)         ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Populate PBA on Partner Account when Primary CDM is assigned</fullName>
        <actions>
            <name>Populate_PBA_from_Primary_CDM_User_record</name>
            <type>FlowAction</type>
        </actions>
        <active>false</active>
        <formula>NOT(ISBLANK(CDM__c))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>RSM Kickoff Reminder Alert</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Account.Sales_Rep__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Kick_Off_Call_Scheduled_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Qualification_Information_Complete_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>User.Validation_Exempt__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>MyLodge Partner,MyLodge Account</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <timeLength>24</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Kick_off_scheduled_reminder_2</name>
                <type>Alert</type>
            </actions>
            <timeLength>24</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Kick_off_scheduled_reminder_3</name>
                <type>Alert</type>
            </actions>
            <timeLength>48</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Kick_off_scheduled_escalation_to_SD</name>
                <type>Alert</type>
            </actions>
            <timeLength>60</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>SAM Partner Onboarded Alert</fullName>
        <actions>
            <name>New_CDM_Sourced_Partner_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.CDM_Source_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>MyLodge Partner,MyLodge Account</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SOHO FTO</fullName>
        <actions>
            <name>SOHO_FTO</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SOHO_FTO_Ownership</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>contains</operation>
            <value>Avalara AvaTax (FTO)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>notContain</operation>
            <value>Avalara TrustFile (FTO)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CARR__c</field>
            <operation>equals</operation>
            <value>USD 0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.SubType__c</field>
            <operation>notContain</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Owner_Role__c</field>
            <operation>notContain</operation>
            <value>CAM:</value>
        </criteriaItems>
        <description>Update Request: IBST-12051</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SOHO Partner Territory Change Alert</fullName>
        <actions>
            <name>Alert_SOHO_Partner_Territory_Change_Event</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED( Partner_Territory__c ),  PRIORVALUE(Partner_Territory__c) = &quot;SOHO&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>SR Assigned Alert</fullName>
        <actions>
            <name>SR_Asigned_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Sales_Rep__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>User.Validation_Exempt__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>MyLodge Partner,MyLodge Account</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>ScheduleOnce Ownership</fullName>
        <actions>
            <name>Update_Owner_ScheduleOnce</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.CreatedById</field>
            <operation>equals</operation>
            <value>ScheduleOnce API</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Active Customer False</fullName>
        <actions>
            <name>Set_Active_Customer_False</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Active Customer To False</fullName>
        <actions>
            <name>Set_Active_Customer_False</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR (2 AND 3)) AND 4</booleanFilter>
        <criteriaItems>
            <field>Account.ActiveSubscriptionCount__c</field>
            <operation>equals</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CARR__c</field>
            <operation>equals</operation>
            <value>,USD 0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CARR_Override__c</field>
            <operation>equals</operation>
            <value>,USD 0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>EMEA Account,EMEA Implementation Partner,TrustFile Bharat ACP/MSP,Communications Partner,Communications Account,MyLodge Partner,MyLodge Account,TrustFile Bharat Account,(Deprecated) OEMPartner,Excise Partner,Excise Account,Brazil Account</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/IBST-8835 (Exclude Account Record Types that don&apos;t utilize Zuora subscriptions and billing accounts)</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Active Customer True</fullName>
        <actions>
            <name>Set_Active_Customer</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND (2 OR 3)) OR 4</booleanFilter>
        <criteriaItems>
            <field>Account.ActiveSubscriptionCount__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CARR__c</field>
            <operation>greaterThan</operation>
            <value>USD 0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CARR_Override__c</field>
            <operation>greaterThan</operation>
            <value>USD 0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>MyLodge Account</value>
        </criteriaItems>
        <description>Update: https://jira.avalara.com/browse/IBST-13302</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set CX Rep - East-MW</fullName>
        <actions>
            <name>Set_CX_Rep_to_Jeff_Williams</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Manager__c</field>
            <operation>equals</operation>
            <value>Jamie Edgerton</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Set CX Rep field based on account owner or account owner manager</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set CX Rep - East-NE</fullName>
        <actions>
            <name>Set_CX_Rep_to_Natasha_Strickland</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Manager__c</field>
            <operation>equals</operation>
            <value>Amanda Miller</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Set CX Rep field based on account owner or account owner manager</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set CX Rep - East-SE</fullName>
        <actions>
            <name>Set_CX_Rep_to_Tonya_Winchester</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Manager__c</field>
            <operation>equals</operation>
            <value>Richard Highland</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Set CX Rep field based on account owner or account owner manager</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set CX Rep - Named West</fullName>
        <actions>
            <name>Set_CX_Rep_to_Rose_Tweit</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Manager__c</field>
            <operation>equals</operation>
            <value>mark ippolito</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Set CX Rep field based on account owner manager</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set CX Rep - VSB</fullName>
        <actions>
            <name>Set_CX_Rep_to_Ken_Davis</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Manager__c</field>
            <operation>equals</operation>
            <value>Terry Arndt</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Set CX Rep field based on account owner or account owner manager</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set CX Rep - West-CA</fullName>
        <actions>
            <name>Set_CX_Rep_to_Clint_Knudsen</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Manager__c</field>
            <operation>equals</operation>
            <value>Nicole Mackay</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Set CX Rep field based on account owner manager</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set CX Rep - West-Mtn</fullName>
        <actions>
            <name>Set_CX_Rep_to_Ken_Davis</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Manager__c</field>
            <operation>equals</operation>
            <value>Reiner Paculdo</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Set CX Rep field based on account owner manager</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set CX Rep - West-So and Named East</fullName>
        <actions>
            <name>Set_CX_Rep_to_Holly_Rutledge</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Owner_Role__c</field>
            <operation>contains</operation>
            <value>NA East,CAM: West Team South,CAM: NA Team East</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Set CX Rep field based on account Owner Role</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Shopify Plus Customers to Matt Hammond</fullName>
        <actions>
            <name>Assign_to_Matthew_Hammond</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Connector_Summary__c</field>
            <operation>contains</operation>
            <value>Shopify Plus</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>equals</operation>
            <value>Avalara AvaTax</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Shopify Plus Entitlement Override</fullName>
        <actions>
            <name>Force_ZTBuy_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Professional_Support</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Connector_Summary__c</field>
            <operation>equals</operation>
            <value>Shopify Plus</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp AvaTax End Date in Next Subscription End Data</fullName>
        <actions>
            <name>Stamp_AvaTax_End_Date_Next_Subscription</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>This workflow is required to populate the Next Subscription End Date on Accounts.  This triggers a Process Builder that automates the creation of Account Profiles and email alerts to account owners.</description>
        <formula>OR(

ISNEW(),
ISCHANGED(AvaTax_Current_Plan_End_Date__c)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp BAIB Last Date</fullName>
        <actions>
            <name>Stamp_BAIB_Last_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_OAIB_BAIB_Renewal</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(NOT(ISNEW()),ISCHANGED(BLUE_in_the_Box_Sign_Up_Date__c),NOT( ISNULL(  PRIORVALUE(  BLUE_in_the_Box_Sign_Up_Date__c  ))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Business Support</fullName>
        <actions>
            <name>Stamp_Business_Support</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>contains</operation>
            <value>Business Support</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp CPO 90 Date</fullName>
        <actions>
            <name>Stamp_CPO_90_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.CPO_Overall_Score__c</field>
            <operation>equals</operation>
            <value>90</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Enterprise Support</fullName>
        <actions>
            <name>Stamp_Enterprise_Support</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>contains</operation>
            <value>Enterprise Support</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp OAIB Last Date</fullName>
        <actions>
            <name>Stamp_OAIB_BAIB_Renewal</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_OAIB_Last</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(NOT(ISNEW()),ISCHANGED(ORANGE_in_the_Box_Sign_Up_Date__c),NOT( ISNULL(  PRIORVALUE( ORANGE_in_the_Box_Sign_Up_Date__c )  )))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Premium Support</fullName>
        <actions>
            <name>Stamp_Premium_Support</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>contains</operation>
            <value>Premium Support</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Professional Support</fullName>
        <actions>
            <name>Stamp_Professional_Support</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>contains</operation>
            <value>Professional Support</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Standard Support</fullName>
        <actions>
            <name>Stamp_Standard_Support</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>notContain</operation>
            <value>Professional Support,Enterprise Support,Business Support,AvaTax Gold Support</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.SupportLevel__c</field>
            <operation>notContain</operation>
            <value>Standard Support,Included,AIP,PartnerLed</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>TrustFile FTO Account Assignment</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>contains</operation>
            <value>Avalara TrustFile (FTO)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>notContain</operation>
            <value>Avalara AvaTax (FTO)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CARR__c</field>
            <operation>equals</operation>
            <value>USD 0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.SubType__c</field>
            <operation>notContain</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Owner_Role__c</field>
            <operation>notContain</operation>
            <value>CAM:</value>
        </criteriaItems>
        <description>Create Request: IBST-12051</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Uncheck Returns Flag</fullName>
        <actions>
            <name>Uncheck_Returns_Flag</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>notContain</operation>
            <value>Avalara Returns</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Returns__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Unmanaged has two dings</fullName>
        <actions>
            <name>Unmanaged_partner_has_two_dings</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Total_Deals__c</field>
            <operation>equals</operation>
            <value>2</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Partner_Managemen__c</field>
            <operation>equals</operation>
            <value>Unmanaged</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>MyLodge Partner,MyLodge Account</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Calc Flag</fullName>
        <actions>
            <name>Update_Calc_Flag</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>contains</operation>
            <value>AvaTax</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Kickoff Call Scheduled Date</fullName>
        <actions>
            <name>Update_Kickoff_CAll_Scheduled_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Kick_Off_Call_Complete_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Kick_Off_Call_Scheduled_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>If Kick Off Call Completed Date is populated but Kickoff Call Scheduled is still blank, update the Kickoff Call Scheduled Date with the Kickoff Call Completed Date</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Returns Flag</fullName>
        <actions>
            <name>Update_Returns_Flag</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>contains</operation>
            <value>Avalara Returns</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update TrustFile Bharat Partner Category</fullName>
        <actions>
            <name>TrustFile_Bharat_ACP</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Partner_Category__c</field>
            <operation>contains</operation>
            <value>Category4</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>if CUP User%2C flag GoLive%3A CUP Onboarding Preview</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Account.CUP_User__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>iv__InsideView Outbound Rule for Accounts</fullName>
        <actions>
            <name>iv__Refresh_Accounts_Outbound_Message</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <formula>CONTAINS($Setup.iv__InsideView_Notification_Enabler__c.iv__InsideView_Notification_Enabler__c, &quot;Account.UPDATE&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>iv__InsideView Outbound Rule for New Accounts</fullName>
        <actions>
            <name>iv__Refresh_Accounts_Outbound_Message</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <formula>CONTAINS($Setup.iv__InsideView_Notification_Enabler__c.iv__InsideView_Notification_Enabler__c, &quot;Account.CREATE&quot;)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <tasks>
        <fullName>AR_Assist_Collections</fullName>
        <assignedTo>bob.waite@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>5</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Assist Collections</subject>
    </tasks>
    <tasks>
        <fullName>Alert_SOHO_Partner_Territory_Change_Event</fullName>
        <assignedTo>robin.conner@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Alert! - SOHO Partner Territory Change Event. See Account linked to this task. Please review and close as appropriate.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Alert! - SOHO Partner Territory Change Event</subject>
    </tasks>
    <tasks>
        <fullName>CAM_Account_CPO_90_Task</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>CPO alert: Your account has a &gt;= 90 Overall CPO Score</subject>
    </tasks>
    <tasks>
        <fullName>Connector_Certification_Required</fullName>
        <assignedTo>simone.vanrheenen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>The kickof call for a solution partner has been completed. Please mark the connector certification date in the associated partner record when complete.</description>
        <dueDateOffset>30</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Connector Certification Required</subject>
    </tasks>
    <tasks>
        <fullName>Nee_Development_Solutions_Partner_Qualified</fullName>
        <assignedTo>balz.wyss@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A new DSP partner has been qualified by business development. Please review the associated record and inform the owner if you have any concerns or need additional information to approve this new partner.</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New Development &amp; Solutions Partner Qualified</subject>
    </tasks>
    <tasks>
        <fullName>New_Business_Partner_Signed_Assign_CDM</fullName>
        <assignedToType>owner</assignedToType>
        <description>You have been assigned as Sales Director for this new partner, please assign a CDM and a Sales Rep via the CDM and Sales Rep association fields on the account related to this task.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New Partner Signed - Assign CDM</subject>
    </tasks>
    <tasks>
        <fullName>New_DSP_SKU_Required</fullName>
        <assignedTo>amy.mosher@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>The kick off call for a new partner has been completed and SKU&apos;s for this new partner are required.</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New DSP SKU Required</subject>
    </tasks>
    <tasks>
        <fullName>New_Development_Solutions_Partner_Qualified_Assign_BD</fullName>
        <assignedTo>marshal.kushniruk@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A new development and solutions partner has been qualified. Please review the qualification information associated with this account and assign a BD representative by entering the name of that rep in the &quot;Bus Dev&quot; field of the associated partner.</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New Development &amp; Solutions Partner Qualified - Assign BD</subject>
    </tasks>
    <tasks>
        <fullName>New_Management_Sales_Partner_Qualified</fullName>
        <assignedTo>balz.wyss@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A new MSP partner has been qualified by business development. Please review the associated record and inform the owner if you have any concerns or need additional information to approve this new partner.</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New Management &amp; Sales Partner Qualified</subject>
    </tasks>
    <tasks>
        <fullName>New_Partner_Contract_Signed_Check_OnFile_with_Ops</fullName>
        <assignedTo>marshal.kushniruk@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A new dsp partner has signed an agreement, please verify that the contract is on file with ops by selecting the checkbox for the associated account</description>
        <dueDateOffset>7</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New Partner Contract Signed Check OnFile with Ops</subject>
    </tasks>
    <tasks>
        <fullName>New_customer_introduction</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>First year customer introduction</subject>
    </tasks>
    <tasks>
        <fullName>StartBillingforClient</fullName>
        <assignedTo>marshal.kushniruk@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Start Billing for Client</subject>
    </tasks>
    <tasks>
        <fullName>X2_Week_New_Account_Follow_Up</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>14</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>2 Week New Account Follow Up</subject>
    </tasks>
</Workflow>
