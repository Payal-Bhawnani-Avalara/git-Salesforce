<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>AMDB_DE_Welcome_Letter</fullName>
        <description>AMDB DE Welcome Letter</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>MRS_Support_Templates/DE_AMZ_Prop1_v1</template>
    </alerts>
    <alerts>
        <fullName>AMDB_FR_Welcome_Letter</fullName>
        <description>AMDB FR Welcome Letter</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>MRS_Support_Templates/FR_AMZ_Prop1_v1</template>
    </alerts>
    <alerts>
        <fullName>AMDB_UK_Welcome_Letter</fullName>
        <description>AMDB UK Welcome Letter</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>MRS_Support_Templates/UK_AMZ_Prop1_v1</template>
    </alerts>
    <alerts>
        <fullName>AMDB_UK_Welcome_Letter_HIST</fullName>
        <ccEmails>emailtosalesforce@1d9dwxuf1783akehxdcneruhn.3-pszeae.na27.le.salesforce.com</ccEmails>
        <description>AMDB UK Welcome Letter FOR ACTIVITY HISTORY</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>MRS_Support_Templates/UK_AMZ_Prop1_v1_HIST</template>
    </alerts>
    <alerts>
        <fullName>AvaTax_High_priority_Contact_Distribution_Notification</fullName>
        <description>AvaTax High Priority Contact Distribution Notification</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>sales.operations@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>SalesGroup/SDR_Contact_Distribution_Higih_Priority</template>
    </alerts>
    <alerts>
        <fullName>AvaTax_Partner_Referrals_Contact_Distribution_Notification</fullName>
        <description>AvaTax Partner Referrals Contact Distribution Notification</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>sales.operations@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>SalesGroup/SDR_Contact_Distribution_Partner_Referral</template>
    </alerts>
    <alerts>
        <fullName>Conversica_Email_Alert_Hot_Leads</fullName>
        <description>Conversica Email Alert-Hot Leads</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Conversica_Email_Alert_Hot_Leads</template>
    </alerts>
    <alerts>
        <fullName>EMEA_Contact_Lean_Data_Conversion_Alert</fullName>
        <description>EMEA Contact Lean Data Conversion Alert</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/EMEA_Contact_Lean_Data_Conversion_Alert</template>
    </alerts>
    <alerts>
        <fullName>Email_Notification_for_Conversica_Action_Required</fullName>
        <description>Email Notification for Conversica-Action Required</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Conversica_Email_Alert_Action_required</template>
    </alerts>
    <alerts>
        <fullName>Email_Notifications_for_all_Records_Assigned_out_From_the_Balz_Wyss</fullName>
        <description>Email Notifications for all Records Assigned out From the Balz Wyss</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>kimberly.gordon@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>sales.operations@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Email_Notifications_for_all_Records_Assigned_out_From_the_Balz_Wyss</template>
    </alerts>
    <alerts>
        <fullName>Email_to_Account_Owner_ADR_owned_Accounts</fullName>
        <description>Email to Account Owner ADR owned Accounts</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderAddress>svc-notifications@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/ADR_Owned_Accounts</template>
    </alerts>
    <alerts>
        <fullName>ICP_Alert_Contact</fullName>
        <description>ICP Alert Contact</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderAddress>accountsreceivable@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>AR_Collection_Templates/ICP_Alert</template>
    </alerts>
    <alerts>
        <fullName>Notify_SAM_of_SALT_in_the_Box_Signup</fullName>
        <description>Notify SAM of SALT-in-the-Box Signup</description>
        <protected>false</protected>
        <recipients>
            <field>SAMEmail__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>alison.paisley@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>brandon.houk@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>katie.pelly@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Partner_Onboarding/Notify_SAM_of_SALT_in_the_Box_Signup</template>
    </alerts>
    <alerts>
        <fullName>Open_Opp_Sales_Tier_1_Response_Notification</fullName>
        <description>Open Opp Sales Tier 1 Response Notification</description>
        <protected>false</protected>
        <recipients>
            <recipient>kimberly.gordon@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inside_Sales_Communications/PSM_Contact_Engagement_Alert</template>
    </alerts>
    <alerts>
        <fullName>Partner_Contact_Not_Found_on_Contact</fullName>
        <ccEmails>pmm@avalara.com</ccEmails>
        <description>Partner Contact Not Found on Contact</description>
        <protected>false</protected>
        <recipients>
            <recipient>kelleigh.t-nelson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>partnerprograms@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Partner_Contact_Not_Found_on_Contact</template>
    </alerts>
    <alerts>
        <fullName>SendEmailNotificationToCDMTeam</fullName>
        <ccEmails>CDM@avalara.com</ccEmails>
        <description>Send Email Notification To CDM Team</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CDMContactNotification</template>
    </alerts>
    <alerts>
        <fullName>Send_Email_Preferred_Developer_Profile_Update</fullName>
        <description>Send Email: Preferred Developer Profile Update</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderAddress>preferreddeveloper@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Partner_Program_Request/Preferred_Developer_Profile</template>
    </alerts>
    <alerts>
        <fullName>Send_MMB_Notification</fullName>
        <ccEmails>aaron.zapf@avalara.com</ccEmails>
        <description>Send MMB Notification</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderAddress>accountsreceivable@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Finance_Treasury_Email_Notifications/Minimum_Monthly_Assessment</template>
    </alerts>
    <fieldUpdates>
        <fullName>Assign_Contact_to_Balz_Wyss</fullName>
        <field>OwnerId</field>
        <lookupValue>balz.wyss@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign Contact to Balz Wyss</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_Contact_to_Matt_Hammond</fullName>
        <field>OwnerId</field>
        <lookupValue>matthew.hammond@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign Contact to Matt Hammond</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_to_FTO_Account_Distribution</fullName>
        <field>OwnerId</field>
        <lookupValue>ftoaccountdistribution@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign to FTO Account Distribution</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_to_Jason_Moore</fullName>
        <description>https://jira.avalara.com/browse/IBST-10657</description>
        <field>OwnerId</field>
        <lookupValue>jason.moore@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign to Jason Moore</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_to_Mary_Jensen</fullName>
        <description>https://jira.avalara.com/browse/IBST-14804</description>
        <field>OwnerId</field>
        <lookupValue>mary.jensen@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign to Mary Jensen</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Auto_Check_Credentials_Sent</fullName>
        <field>Portal_Credentials_Sent__c</field>
        <literalValue>1</literalValue>
        <name>Auto Check Credentials Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CLEAR_Distribution_Action</fullName>
        <field>Distribution_action__c</field>
        <name>CLEAR Distribution Action</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Channel_Partner_Name_Update_False</fullName>
        <field>Channel_Partner_Name_Update_6__c</field>
        <literalValue>0</literalValue>
        <name>Channel_Partner_Name_Update_False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Contact_Cadence_Stage_Unsubscribed</fullName>
        <field>Cadence_Stage__c</field>
        <literalValue>Unsubscribed</literalValue>
        <name>Contact Cadence Stage = Unsubscribed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>GDPR_Eligible</fullName>
        <description>https://jira.avalara.com/browse/ITBSE-1122?filter=-1</description>
        <field>GDPR_Eligible__c</field>
        <literalValue>1</literalValue>
        <name>GDPR Eligible</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Contact_Status_to_Nurture</fullName>
        <field>ContactStatus__c</field>
        <literalValue>Nurture</literalValue>
        <name>Lead/Contact Status to Nurture</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MQL_Contact_Status_Update</fullName>
        <description>https://jira.avalara.com/browse/ITBSE-706</description>
        <field>MQL_Status_Date__c</field>
        <formula>TODAY()</formula>
        <name>MQL Contact Status Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Marketing_Feedback_Log_Stamp</fullName>
        <field>Marketing_Feedback_Log__c</field>
        <formula>&quot;--- &quot;&amp; Text(NOW())&amp; &quot;-&quot;&amp; Marketing_Feedback_Notes__c &amp; &quot;-&quot; &amp; Marketing_Feedback_Log__c</formula>
        <name>Marketing Feedback Log Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Nurture_Reason_to_Unable_to_Contact</fullName>
        <field>Nurture_Reason__c</field>
        <literalValue>Unable to contact</literalValue>
        <name>Nurture Reason to Unable to Contact</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Nuture_Reason_60_days</fullName>
        <field>Nurture_Reason__c</field>
        <literalValue>60 Day Expiration</literalValue>
        <name>Nuture Reason 60 days</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Partner_Contact_Mapped</fullName>
        <description>Checks the partner contact mapped field, related to ORgChart Plus mapping.</description>
        <field>Partner_Contact_Mapped__c</field>
        <literalValue>1</literalValue>
        <name>Partner Contact Mapped</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Partner_Contact_Mapped_Date</fullName>
        <field>Partner_Contact_Mapped_Date__c</field>
        <formula>TODAY()</formula>
        <name>Partner Contact Mapped Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Partner_Contact_Mapped_by</fullName>
        <description>updates the user name on the partner contact mapped by field.</description>
        <field>Partner_Contact_Mapped_By__c</field>
        <formula>$User.Full_Name__c</formula>
        <name>Partner Contact Mapped by</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Partner_Contact_Not_Mapped</fullName>
        <description>When the orgchart is unmapped</description>
        <field>Partner_Contact_Mapped__c</field>
        <literalValue>0</literalValue>
        <name>Partner Contact Not Mapped</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Partner_contact_Mapped_date_cleared</fullName>
        <description>Clears the date of the mapping.</description>
        <field>Partner_Contact_Mapped_Date__c</field>
        <name>Partner contact Mapped date cleared</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SL_Cadence_Stage_null_Clear_it</fullName>
        <field>Cadence_Stage__c</field>
        <name>(SL) Cadence Stage =null (Clear it )</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Email_Opt_Out_to_True</fullName>
        <field>HasOptedOutOfEmail</field>
        <literalValue>1</literalValue>
        <name>Set Email Opt Out to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Prior_Case_Date</fullName>
        <field>Prior_Case_Date__c</field>
        <formula>PRIORVALUE( LastCaseOpened__c )</formula>
        <name>Set Prior Case Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Last_Partner_Sales_Contact_Trained</fullName>
        <field>Partner_Contact_Previous_Trained__c</field>
        <formula>PRIORVALUE(Partner_Contact_Trained_Date__c)</formula>
        <name>Stamp Last Partner Sales Contact Trained</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Opp_Type_Excise</fullName>
        <field>Opportunity_Sub_Type__c</field>
        <literalValue>Excise</literalValue>
        <name>Stamp Opp Type Excise</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Partner_Contact_Trained_Date</fullName>
        <field>Partner_Contact_Trained_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Partner Contact Trained Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Previous_Marketing_Contact_Trained</fullName>
        <field>Partner_Marketing_Contact_Prev_Trained__c</field>
        <formula>PRIORVALUE( Partner_Marketing_Contact_Trained_Date__c )</formula>
        <name>Stamp Previous Marketing Contact Trained</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_SALT_in_a_Box_Signup_Date</fullName>
        <field>SALT_in_a_BoxSignupDate__c</field>
        <formula>TODAY()</formula>
        <name>Stamp SALT-in-a-Box Signup Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_SAM_Email</fullName>
        <field>SAMEmail__c</field>
        <formula>Account.CDM__r.Email</formula>
        <name>Stamp SAM Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Change_Date_Working</fullName>
        <field>Status_Change_Date_Working__c</field>
        <formula>NOW()</formula>
        <name>Status Change Date - Working</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Subtype_equals_EZTax</fullName>
        <field>Opportunity_Sub_Type__c</field>
        <literalValue>EZtax</literalValue>
        <name>Subtype equals EZTax</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Contact_Status</fullName>
        <description>https://jira.avalara.com/browse/IBST-11820</description>
        <field>ContactStatus__c</field>
        <literalValue>Processing</literalValue>
        <name>Update Contact Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Contact_Status_to_Nurture</fullName>
        <description>If lead has been in working for longer than 60 days move back to nurture</description>
        <field>ContactStatus__c</field>
        <literalValue>Nurture</literalValue>
        <name>Update Contact Status to Nurture</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>CreateTrustFileAccount</fullName>
        <apiVersion>33.0</apiVersion>
        <endpointUrl>https://app.trustfile.avalara.com/TrustFileServiceSoap</endpointUrl>
        <fields>AccountName__c</fields>
        <fields>CaseSafeID__c</fields>
        <fields>CurrentUserEmail__c</fields>
        <fields>CurrentUserID__c</fields>
        <fields>Email</fields>
        <fields>FirstName</fields>
        <fields>Id</fields>
        <fields>LastName</fields>
        <fields>LeadSource</fields>
        <fields>MailingCity</fields>
        <fields>MailingCountry</fields>
        <fields>MailingPostalCode</fields>
        <fields>MailingState</fields>
        <fields>MailingStreet</fields>
        <fields>Phone</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>clayton.wiggins@avalara.com</integrationUser>
        <name>Create TrustFile Account</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Grant_Portal_Access</fullName>
        <apiVersion>29.0</apiVersion>
        <endpointUrl>http://partners.avalara.com/corporatesite/partner.asmx?PartnerSetup</endpointUrl>
        <fields>AccountId</fields>
        <fields>Email</fields>
        <fields>FirstName</fields>
        <fields>Id</fields>
        <fields>LastName</fields>
        <fields>Partner_Number__c</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>aaron.zapf@avalara.com</integrationUser>
        <name>Grant Portal Access</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>iv__InsideView_Contacts_Outbound_Message</fullName>
        <apiVersion>43.0</apiVersion>
        <description>This is used for notifying InsideView Refresh for Contacts.</description>
        <endpointUrl>https://integrations.insideview.com/integrations-notifications/salesforce/contact?authType=IV_SALESFORCE_CANVAS</endpointUrl>
        <fields>AccountId</fields>
        <fields>Id</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>kory.leavitt@avalara.com</integrationUser>
        <name>InsideView Contacts Outbound Message</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>%28SL%29 Cadence Complete</fullName>
        <actions>
            <name>Lead_Contact_Status_to_Nurture</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Nurture_Reason_to_Unable_to_Contact</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SL_Cadence_Stage_null_Clear_it</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Cadence_Stage__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.ContactStatus__c</field>
            <operation>equals</operation>
            <value>Working</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/IBST-11849</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%28SL%29 Cadence Working CLEAR Distribution Action</fullName>
        <actions>
            <name>CLEAR_Distribution_Action</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Cadence_Stage__c</field>
            <operation>equals</operation>
            <value>Working</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%28SL%29 Cadence Working CLEAR Distribution Action and Update Contact Status</fullName>
        <actions>
            <name>CLEAR_Distribution_Action</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Contact_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Cadence_Stage__c</field>
            <operation>equals</operation>
            <value>Working</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/IBST-11820</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Auto Email Opt Out for New Mcgladrey Contacts</fullName>
        <actions>
            <name>Set_Email_Opt_Out_to_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Email</field>
            <operation>contains</operation>
            <value>@mcgladrey.com</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax Contact -  Free Rates</fullName>
        <actions>
            <name>Assign_to_Mary_Jensen</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 And 6</booleanFilter>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>Free Rates</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>AvaTax</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Active_Customer__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.ActivePartnerAccount__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Number_of_Open_Opportunities__c</field>
            <operation>equals</operation>
            <value>0</value>
        </criteriaItems>
        <description>Workflow activated when someone subscribes to a free product (AST, TaxRates.com, Excel Connector)  and is a CONTACT.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax Contact -  Marketing Asset Task</fullName>
        <actions>
            <name>Assign_to_Mary_Jensen</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 and 2 And 3 And 4 and 5 and 6</booleanFilter>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>Blog,Case Study,Survey,Video,Web Tools,Whitepaper</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>AvaTax</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActivePartner__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Number_of_Open_Opportunities__c</field>
            <operation>lessThan</operation>
            <value>1</value>
        </criteriaItems>
        <description>Offer equals Blog,Case Study,Newsletter,Survey,Video,Web Tools,Whitepaper
Assign tasks to Mary</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax Contact -  Partner Event%2FTrainingTask</fullName>
        <actions>
            <name>Assign_to_Mary_Jensen</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 and 2 And 3 And 4 And 5 and 6</booleanFilter>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>Partner Event,Partner Training,Through-partner syndication</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>AvaTax</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.ActivePartnerAccount__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Number_of_Open_Opportunities__c</field>
            <operation>lessThan</operation>
            <value>1</value>
        </criteriaItems>
        <description>Offer equals Partner Event, Partner Training, Through-partner syndication</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax Contact - General Contact task</fullName>
        <actions>
            <name>Assign_to_Mary_Jensen</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>when a CONTACT submits a form on AvaTax.com</description>
        <formula>AND(
Account.Number_of_Open_Opportunities__c = 0, ISCHANGED(Most_Recent_Conversion_Date__c),
Most_Recent_Conversion_Date__c = Today(), ISPICKVAL(Opportunity_Sub_Type__c , &quot;AvaTax&quot;), ActivePartnerAccount__c = False, 
Active_Customer__c = False,
OR( 
ISPICKVAL(Offer__c, &quot;General Contact&quot;), 
ISPICKVAL(Offer__c, &quot;Product Offering&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax Contact - High Priority%2FPartner Referral Program</fullName>
        <actions>
            <name>Assign_to_Mary_Jensen</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 and 2 And 3 And 4 And 5 and 6</booleanFilter>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>Referral Program</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>AvaTax</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.ActivePartnerAccount__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Number_of_Open_Opportunities__c</field>
            <operation>lessThan</operation>
            <value>1</value>
        </criteriaItems>
        <description>Referral program</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax Contact - Tradeshow%2Fuser group</fullName>
        <actions>
            <name>Assign_to_Mary_Jensen</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>Tradeshow,User Group,Road Show,Corporate Sponsored Event</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>AvaTax</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActivePartner__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.No_of_Open_Opportunities__c</field>
            <operation>lessThan</operation>
            <value>1</value>
        </criteriaItems>
        <description>Contact Task: : Attended a tradeshow or User  Group or road show
MRCD - Today,</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax Contact - Webinars</fullName>
        <actions>
            <name>Assign_to_Mary_Jensen</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 and 5 and 6</booleanFilter>
        <criteriaItems>
            <field>Contact.ActivePartnerAccount__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>Webinar</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>AvaTax</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Number_of_Open_Opportunities__c</field>
            <operation>equals</operation>
            <value>0</value>
        </criteriaItems>
        <description>Offer = Webinar, Import Date = today assigned to Mary Jensen</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CONTACT - Excise Task Product Offering</fullName>
        <actions>
            <name>Call_1_Excise_Product_Offering_Follow_Up</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 and 2 and 3</booleanFilter>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>Excise</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>Product Offering</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CertCapture DemandZen - David Wilson</fullName>
        <actions>
            <name>New_1DemandZen_Appointment_follow_up</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Campaign_Most_Recent_ID__c</field>
            <operation>equals</operation>
            <value>70140000000Vn7qAAC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.MailingState</field>
            <operation>equals</operation>
            <value>Texas,TX,Oklahoma,OK,Arkansas,AR,Louisiana,LA,Mississippi,MS,Alabama,AL,Georgia,GA,South Carolina,SC,Florida,FL</value>
        </criteriaItems>
        <description>Creates a task when a contact has been recently updated with the campaign most recent: CertCapture DemandZen  ID = 70140000000Vn7qAAC</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CertCapture DemandZen - Kristin Terdik</fullName>
        <actions>
            <name>New_2DemandZen_Appointment_follow_up</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Campaign_Most_Recent_ID__c</field>
            <operation>equals</operation>
            <value>70140000000Vn7qAAC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.MailingState</field>
            <operation>equals</operation>
            <value>New Hampshire,NH,Maine,ME,Vermont,VT,Massachusetts,MA,Rhode Island,RI,Connecticut,CT,New York,NY,New Jersey,NJ,Delaware,DE,Maryland,MD,Pennsylvania,PA,West Virginia,WV,Virginia,VA,Kentucky,KY,Tennessee,TN,North Carolina,NC</value>
        </criteriaItems>
        <description>Creates a task when a contact has been recently updated with the campaign most recent: CertCapture DemandZen  ID = 70140000000Vn7qAAC</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CertCapture DemandZen - Laura Wahl</fullName>
        <actions>
            <name>New_3DemandZen_Appointment_follow_up</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Campaign_Most_Recent_ID__c</field>
            <operation>equals</operation>
            <value>70140000000Vn7qAAC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.MailingState</field>
            <operation>equals</operation>
            <value>North Dakota,ND,South Dakota,SD,Nebraska,NE,Kansas,KS,Minnesota,MN,Iowa,IA,Missouri,MO,Wisconsin,WI,Illinois,IL,Michigan,MI,Indiana,IN,Ohio,OH</value>
        </criteriaItems>
        <description>Creates a task when a contact has been recently updated with the campaign most recent: CertCapture DemandZen  ID = 70140000000Vn7qAAC</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CertCapture DemandZen - Matthew Hill</fullName>
        <actions>
            <name>New_4DemandZen_Appointment_follow_up</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Campaign_Most_Recent_ID__c</field>
            <operation>equals</operation>
            <value>70140000000Vn7qAAC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.MailingState</field>
            <operation>equals</operation>
            <value>Hawaii,HI,Alaska,AK,Washington,WA,Oregon,OR,California,CA,Nevada,NV,Idaho,ID,Montana,MT,Wyoming,WY,Colorado,CO,Arizona,AZ,New Mexico,NM</value>
        </criteriaItems>
        <description>Creates a task when a contact has been recently updated with the campaign most recent: CertCapture DemandZen  ID = 70140000000Vn7qAAC</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Communications Task - Calculator Submissions CONTACT</fullName>
        <actions>
            <name>CommTaxRates_Registration_Follow_Up_See_Campaign_Name_for_details2</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>Free Rates</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Web_Property__c</field>
            <operation>equals</operation>
            <value>communicationstaxrates.avalara.com</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Contact  - Certcapture Task Workflow Rule</fullName>
        <actions>
            <name>Please_follow_up_with_contact_response</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 and 2</booleanFilter>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>CertCapture</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Contact - Brazil Task Assignment English</fullName>
        <actions>
            <name>New_Brazil_Contact_Marketing_Activity</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>Brazil</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Conversion_Page__c</field>
            <operation>contains</operation>
            <value>/br/en/</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Contact - Brazil Task Assignment Portuguese</fullName>
        <actions>
            <name>Please_follow_up_https_www_avalara_com_br_campaign_response</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>Brazil</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Conversion_Page__c</field>
            <operation>contains</operation>
            <value>/br/pt-br/</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Contact - Certcapture General Contact</fullName>
        <actions>
            <name>CC_Call_1_General_Contact_Request</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 and 2 and 3</booleanFilter>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>CertCapture</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>General Contact</value>
        </criteriaItems>
        <description>When a Contact Offer = General Contact, and the Most Recent Conversion Date is updated to today.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Contact - Communication Webinar Activity</fullName>
        <actions>
            <name>New_Contact_Activity_Today</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 and 2 and 3</booleanFilter>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>Communications</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>Webinar</value>
        </criteriaItems>
        <description>When a Contact has recent Webinar activity, and the Most Recent Conversion Date is updated to today.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Contact - Communications General Contact</fullName>
        <actions>
            <name>EZ_Call_General_Contact</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 and 2 and 3</booleanFilter>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>Communications</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>General Contact</value>
        </criteriaItems>
        <description>When a Contact Offer = General Contact, and the Most Recent Conversion Date is updated to today.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Contact - Communications Product Offering</fullName>
        <actions>
            <name>EZ_Call_Product_Offering_Request</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 and 2 and 3</booleanFilter>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>Communications</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>Product Offering</value>
        </criteriaItems>
        <description>When a Contact Offer = product offering, and the Most Recent Conversion Date is updated to today.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Contact - Excise Free Rates</fullName>
        <actions>
            <name>Call_1_ExciseRates_Follow_Up</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and 2 and 3</booleanFilter>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>Excise</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>Free Rates</value>
        </criteriaItems>
        <description>When a Contact Offer = Free Rates, and the Most Recent Conversion Date is updated to today.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Contact - Excise General Contact</fullName>
        <actions>
            <name>Call_1_Excise_Contact_Us_Form_Follow_Up</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 and 2 and 3</booleanFilter>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>Excise</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>General Contact</value>
        </criteriaItems>
        <description>When a Contact Offer = General Contact, and the Most Recent Conversion Date is updated to today.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Contact ACP Task Assignment</fullName>
        <actions>
            <name>Assign_Contact_to_Balz_Wyss</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>ACP</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>Recent activity regarding ACP opportunity Subtype</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Create TrustFile Account Outbound Message</fullName>
        <actions>
            <name>CreateTrustFileAccount</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.CreateTrustFileAccount__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Customer Certs Whitepaper Download %28Alex%29</fullName>
        <actions>
            <name>A_Customer_has_downloaded_one_of_the_Certificate_Management_Whitepapers</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 or 3) AND 2</booleanFilter>
        <criteriaItems>
            <field>Contact.Lead_Source_Most_Recent__c</field>
            <operation>equals</operation>
            <value>Using AvaTax Certs for Automation Whitepaper (Customers Only),Certs and Customer Service Whitepaper (Customers Only),Automating Certs Lifecycle Whitepaper (Customers Only)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.OwnerId</field>
            <operation>equals</operation>
            <value>Alex Deblois</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>Whitepaper</value>
        </criteriaItems>
        <description>Notify a CAM when a customer downloads one of Certificate Management Whitepapers</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Customer Certs Whitepaper Download %28Eric%29</fullName>
        <actions>
            <name>Follow_up_required_A_customer_has_downloaded_one_of_the_Certificate_Management_W</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Lead_Source_Most_Recent__c</field>
            <operation>equals</operation>
            <value>Automating Certs Lifecycle Whitepaper (Customers Only),Certs and Customer Service Whitepaper (Customers Only),Using AvaTax Certs for Automation Whitepaper (Customers Only)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.OwnerId</field>
            <operation>equals</operation>
            <value>Eric Chou</value>
        </criteriaItems>
        <description>Notify a CAM when a customer downloads one of Certificate Management Whitepapers</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Customer Certs Whitepaper Download %28Jason%29</fullName>
        <actions>
            <name>Follow_up_A_customer_has_downloaded_one_of_the_Certificate_Management_Whitepaper</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Lead_Source_Most_Recent__c</field>
            <operation>equals</operation>
            <value>Automating Certs Lifecycle Whitepaper (Customers Only),Certs and Customer Service Whitepaper (Customers Only),Using AvaTax Certs for Automation Whitepaper (Customers Only)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.OwnerId</field>
            <operation>equals</operation>
            <value>Jason Warren</value>
        </criteriaItems>
        <description>Notify a CAM when a customer downloads one of Certificate Management Whitepapers</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>DSP Send Initial Credentials</fullName>
        <actions>
            <name>Auto_Check_Credentials_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(NOT(ISNULL(  Account.DSP_Agreement_Signed__c  )), ISCHANGED( Partner_Number__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EMEA  New Contact Responses  Jason Moore</fullName>
        <actions>
            <name>Assign_to_Jason_Moore</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR 7) AND 2 AND 3 AND  5 AND 8 AND (4 AND 6)OR ( 11 AND (9 OR 10) )OR  (12 AND (9 OR 10) )</booleanFilter>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>Free Trial,Referral Program,General Contact,Product Offering,Blog,Case Study,Video,Survey,Webinar,Web Tools,Whitepaper,Free Rates,Road Show,Tradeshow,Corporate Sponsored Event,User Group,Partner Event,Partner Training,Content Syndication Whitepaper</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>EMEA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Number_of_Open_Opportunities__c</field>
            <operation>equals</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActivePartner__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>Through-partner syndication</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Engaged_By__c</field>
            <operation>notEqual</operation>
            <value>ADR Engaged</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.EZTax_Type__c</field>
            <operation>notEqual</operation>
            <value>Client</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Excise_Tax_Division_Type__c</field>
            <operation>notEqual</operation>
            <value>Customer</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActivePartner__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Opp SubType = EMEA, assign to Jason Moore instead (00533000003SbtJ)
https://jira.avalara.com/browse/IBST-10657</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EMEA - Amazon Bridge Contact request</fullName>
        <actions>
            <name>You_have_been_assigned_a_task_on_an_Amazon_Bridge_request</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <description>An Existing Contact has filled out the Amazon Bridge form today. Notification is sent to Colin Matthews</description>
        <formula>AND(ISPICKVAL(Opportunity_Sub_Type__c , &quot;EMEA&quot;), Most_Recent_Conversion_Date__c =  TODAY(), INCLUDES( Interest_in_Products_Services__c , &quot;Amazon Bridge&quot;), Campaign_Most_Recent_ID__c = &quot;70133000000dz7cAAA&quot; )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EMEA Contact - Lean Data Conversion Alert</fullName>
        <actions>
            <name>New_Contact_on_Your_Account_Has_Taken_an_Action</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Active_Customer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>EMEA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.LeanData__Routing_Action__c</field>
            <operation>equals</operation>
            <value>converted</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>EMEA Account</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/IBST-5082</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EMEA Contact - Notice of Most recent convertion</fullName>
        <actions>
            <name>Please_follow_up_withEMEA_contact_response</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>notEqual</operation>
            <value>General Contact</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>EMEA</value>
        </criteriaItems>
        <description>When a contact has MRCD of today and the offer is not General Contact, send task to Jordan Grimwood</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EMEA Contact - Offer General Contact</fullName>
        <actions>
            <name>Contact_Us_form_follow_up</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>General Contact</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>EMEA</value>
        </criteriaItems>
        <description>When a contact has MRCD of today and an offer of General Contact, send task to Matt Harrison</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EMEA Workflow Rule</fullName>
        <actions>
            <name>Please_follow_up_with_EMEA_prospect</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 OR 2) AND 3</booleanFilter>
        <criteriaItems>
            <field>Contact.Lead_Source_Most_Recent__c</field>
            <operation>equals</operation>
            <value>EMEA Campaign Leads</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>EMEA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>when a CONTACT has LSMR = EMEA Campaign Leads</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email Notification for Conversica Action</fullName>
        <actions>
            <name>Email_Notification_for_Conversica_Action_Required</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>https://jira.avalara.com/browse/IBST-11758</description>
        <formula>AND(       AVA__AVAAI_action_required__c = true,       OR(         Owner.UserRole.Name =&apos;SDR A&apos;,          Owner.UserRole.Name=&apos;SDR B&apos;,          Owner.UserRole.Name=&apos;SDR C&apos;,          Owner.UserRole.Name=&apos;SDR D&apos;       ),        NOT(ISPICKVAL(Opportunity_Sub_Type__c, &quot;MyLodge&quot;)),  TODAY() - 30 &lt;= DATEVALUE(AVA__AVAAI_action_required_date__c)  )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email Notification for Conversica hot leads</fullName>
        <actions>
            <name>Conversica_Email_Alert_Hot_Leads</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>https://jira.avalara.com/browse/IBST-11758</description>
        <formula>AND(          AVA__AVAAI_hot_lead__c = true,          OR(            Owner.UserRole.Name =&apos;SDR A&apos;,        Owner.UserRole.Name=&apos;SDR B&apos;,Owner.UserRole.Name=&apos;SDR C&apos;,         Owner.UserRole.Name=&apos;SDR D&apos;          ),           NOT(ISPICKVAL(Opportunity_Sub_Type__c, &quot;MyLodge&quot;)),       TODAY() - 30 &lt;= DATEVALUE(AVA__AVAAI_hot_lead_date__c)  )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email Notifications for all Records Assigned out From the Balz Wyss</fullName>
        <actions>
            <name>Email_Notifications_for_all_Records_Assigned_out_From_the_Balz_Wyss</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>https://jira.avalara.com/browse/IBST-11335</description>
        <formula>AND(ISCHANGED( OwnerId ) , PRIORVALUE(OwnerId)=&quot;00540000001wIra&quot;, ISCHANGED( Distribution_action__c ) , ISPICKVAL(Distribution_action__c , &quot;Assigned - SalesLoft&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Email Opt Out %3D Cadence Stage Unsubscribed</fullName>
        <actions>
            <name>Contact_Cadence_Stage_Unsubscribed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.HasOptedOutOfEmail</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Excise Task - Offer - Referral Program</fullName>
        <actions>
            <name>Call_1_Excise_Partner_Referral_Form_Follow_Up</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>Referral Program</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>Excise</value>
        </criteriaItems>
        <description>Send a task to when excise lead has offer = referral program and MRCD = Today.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FTO Account Distributio</fullName>
        <actions>
            <name>Assign_to_FTO_Account_Distribution</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND  5 AND 7 AND (4 AND 6)OR ( 10 AND (8 OR 9) )OR  (11 AND (8 OR 9) )</booleanFilter>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>Free Trial,Online Buying</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>AvaTax,SOHO,CertCapture,Communications,Excise,MatrixMaster,Cross-border,TrustFile</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Number_of_Open_Opportunities__c</field>
            <operation>equals</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActivePartner__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Engaged_By__c</field>
            <operation>notEqual</operation>
            <value>ADR Engaged</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.EZTax_Type__c</field>
            <operation>notEqual</operation>
            <value>Client</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Excise_Tax_Division_Type__c</field>
            <operation>notEqual</operation>
            <value>Customer</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActivePartner__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Changing Owner to update to FTO Account Distribution and Offer to = Free Trial and Online Buying. 
https://jira.avalara.com/browse/IBST-14804</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>GDPR Eligible</fullName>
        <actions>
            <name>GDPR_Eligible</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>https://jira.avalara.com/browse/ITBSE-1122?filter=-1</description>
        <formula>AND(GDPR_Eligible__c!=TRUE,  OR(  UPPER(MailingCountry)=&quot;AT&quot;,UPPER(MailingCountry)=&quot;AUSTRIA&quot;,  UPPER(MailingCountry)=&quot;BE&quot;,UPPER(MailingCountry)=&quot;BELGIUM&quot;,  UPPER(MailingCountry)=&quot;BG&quot;,UPPER(MailingCountry)=&quot;BULGARIA&quot;,  UPPER(MailingCountry)=&quot;HR&quot;,UPPER(MailingCountry)=&quot;CROATIA&quot;,  UPPER(MailingCountry)=&quot;CY&quot;,UPPER(MailingCountry)=&quot;CYPRUS&quot;,  UPPER(MailingCountry)=&quot;CZ&quot;,UPPER(MailingCountry)=&quot;CZECH REPUBLIC&quot;,  UPPER(MailingCountry)=&quot;DK&quot;,UPPER(MailingCountry)=&quot;DENMARK&quot;,  UPPER(MailingCountry)=&quot;EE&quot;,UPPER(MailingCountry)=&quot;ESTONIA&quot;,  UPPER(MailingCountry)=&quot;FI&quot;,UPPER(MailingCountry)=&quot;FINLAND&quot;,  UPPER(MailingCountry)=&quot;FR&quot;,UPPER(MailingCountry)=&quot;FRANCE&quot;,  UPPER(MailingCountry)=&quot;DE&quot;,UPPER(MailingCountry)=&quot;GERMANY&quot;,  UPPER(MailingCountry)=&quot;GR&quot;,UPPER(MailingCountry)=&quot;GREECE&quot;,  UPPER(MailingCountry)=&quot;HU&quot;,UPPER(MailingCountry)=&quot;HUNGARY&quot;,  UPPER(MailingCountry)=&quot;IE&quot;,UPPER(MailingCountry)=&quot;IRELAND&quot;,  UPPER(MailingCountry)=&quot;IT&quot;,UPPER(MailingCountry)=&quot;ITALY&quot;,  UPPER(MailingCountry)=&quot;LV&quot;,UPPER(MailingCountry)=&quot;LATVIA&quot;,  UPPER(MailingCountry)=&quot;LT&quot;,UPPER(MailingCountry)=&quot;LITHUANIA&quot;,  UPPER(MailingCountry)=&quot;LU&quot;,UPPER(MailingCountry)=&quot;LUXEMBOURG&quot;,  UPPER(MailingCountry)=&quot;MT&quot;,UPPER(MailingCountry)=&quot;MALTA&quot;,  UPPER(MailingCountry)=&quot;NL&quot;,UPPER(MailingCountry)=&quot;NETHERLANDS&quot;,  UPPER(MailingCountry)=&quot;PL&quot;,UPPER(MailingCountry)=&quot;POLAND&quot;,  UPPER(MailingCountry)=&quot;PT&quot;,UPPER(MailingCountry)=&quot;PORTUGAL&quot;,  UPPER(MailingCountry)=&quot;RO&quot;,UPPER(MailingCountry)=&quot;ROMANIA&quot;,  UPPER(MailingCountry)=&quot;SK&quot;,UPPER(MailingCountry)=&quot;SLOVAKIA&quot;,  UPPER(MailingCountry)=&quot;SI&quot;,UPPER(MailingCountry)=&quot;SLOVENIA&quot;,  UPPER(MailingCountry)=&quot;ES&quot;,UPPER(MailingCountry)=&quot;SPAIN&quot;,  UPPER(MailingCountry)=&quot;SE&quot;,UPPER(MailingCountry)=&quot;SWEDEN&quot;,  UPPER(MailingCountry)=&quot;GB&quot;,UPPER(MailingCountry)=&quot;UNITED KINGDOM&quot;,  UPPER(MailingCountry)=&quot;UK&quot;  )  )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>High Priority Responses on Active Customer Accounts</fullName>
        <actions>
            <name>Active_Customer_High_Priority_Response</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <description>https://jira.avalara.com/browse/ITBSE-1531</description>
        <formula>AND( Account.ActiveCustomer__c = TRUE,  Most_Recent_Conversion_Date__c = TODAY(),
TEXT(Method_of_Contact_Contact__c) = &quot;Webform T1&quot;,
OR( TEXT(Offer__c) = &quot;General Contact&quot;,
TEXT(Offer__c) = &quot;Product Offering&quot;, TEXT(Offer__c) = &quot;Referral Program&quot;, TEXT(Offer__c) = &quot;Free Trial&quot;, TEXT(Offer__c) = &quot;Online Buying&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inside Sales Workflow - Chat Contact Us Form</fullName>
        <actions>
            <name>Chat_Contact_Us_Form_Follow_up</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Lead_Source_Most_Recent__c</field>
            <operation>equals</operation>
            <value>Chat Contact Us Form</value>
        </criteriaItems>
        <description>Workflow activated when Chat Contact Us form is submitted by a CONTACT. Form hosted on Avalara homepage.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MQL Lead Status date stamp</fullName>
        <actions>
            <name>MQL_Contact_Status_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Lead/Contact Status to MQL Date stamped 
https://jira.avalara.com/browse/ITBSE-706</description>
        <formula>AND (OR (ISNEW() ,ISCHANGED( ContactStatus__c )),  ISPICKVAL( ContactStatus__c ,&quot;MQL&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>MSP Send Initial Credentials</fullName>
        <actions>
            <name>Auto_Check_Credentials_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(NOT(ISNULL( Account.Partner_Contract_Signed_Date__c )), ISCHANGED( Partner_Number__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Maintain EZTax Contact SubType for New</fullName>
        <actions>
            <name>Subtype_equals_EZTax</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>EZTax Account</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Maintain Excise Contact SubType for New</fullName>
        <actions>
            <name>Stamp_Opp_Type_Excise</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.RecordTypeId</field>
            <operation>equals</operation>
            <value>~Competitor,~Partner/Potential Partner,~Prospect/Customer</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Marketing Feed Back Log Stamp</fullName>
        <actions>
            <name>Marketing_Feedback_Log_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( Marketing_Feedback_Notes__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>No Touch Order - QuickBooks</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Lead_Source_Most_Recent__c</field>
            <operation>equals</operation>
            <value>NTO - QB</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Validation_Exempt__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>CONTACT</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify CDM Reps of New Partner Lead</fullName>
        <actions>
            <name>SendEmailNotificationToCDMTeam</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Lead_Source_Most_Recent__c</field>
            <operation>equals</operation>
            <value>Partner Campaign Leads</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.ACP_Conversion__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Validation_Exempt__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>notEqual</operation>
            <value>MyLodge</value>
        </criteriaItems>
        <description>When a Contact receives a Lead Source Most Recent value of &apos;Partner Campaign Leads&apos;, notify the CDM Reps of the activity</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify SAM of SALT-in-the-Box Signup</fullName>
        <actions>
            <name>Notify_SAM_of_SALT_in_the_Box_Signup</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Lead_Source_Most_Recent__c</field>
            <operation>equals</operation>
            <value>SALT-in-a-Box</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>notEqual</operation>
            <value>MyLodge</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Open Opp Sales Tier 1 Response Notification</fullName>
        <actions>
            <name>Open_Opp_Sales_Tier_1_Response_Notification</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.No_of_Open_Opportunities__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Method_of_Contact_Contact__c</field>
            <operation>equals</operation>
            <value>Webform T1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Active_Customer__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/ITBSE-1263</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>OrgChart Partner Contact Mapped</fullName>
        <actions>
            <name>Partner_Contact_Mapped</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Partner_Contact_Mapped_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Partner_Contact_Mapped_by</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.ReportsToId</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>OrgChart Partner Contact no longer Mapped</fullName>
        <actions>
            <name>Partner_Contact_Mapped_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Partner_Contact_Mapped_by</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Partner_Contact_Not_Mapped</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( ISCHANGED( ReportsToId ),NOT( ISBLANK(PRIORVALUE(ReportsToId))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Partner Contact doesn%27t exists on Contact</fullName>
        <actions>
            <name>Partner_Contact_Not_Found_on_Contact</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>This WF sends email to pmm@avalara.com when Partner_Rep_Email__c populated but matching contact dont exists</description>
        <formula>OR(AND(ISNEW(),Partner_Contact_Not_Found_Email_Sent__c==1),ISCHANGED(Partner_Contact_Not_Found_Email_Sent__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Payroll Partner Notification</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Lead_Source_Most_Recent__c</field>
            <operation>equals</operation>
            <value>Payroll Partner Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Validation_Exempt__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Portal Credentials Sent</fullName>
        <actions>
            <name>Grant_Portal_Access</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Portal_Credentials_Sent__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Validation_Exempt__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>QuickBooks Demo</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Lead_Source_Most_Recent__c</field>
            <operation>equals</operation>
            <value>QuickBooks Demo</value>
        </criteriaItems>
        <description>when a CONTACT submits a contact form</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Route Contact to CAM %28MIDWEST%29</fullName>
        <actions>
            <name>A_Contacthas_filledout_a_Filing_Needs_AssessmentSurvey</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Lead_Source_Most_Recent__c</field>
            <operation>equals</operation>
            <value>MKT2011NOEMFNAS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.OwnerId</field>
            <operation>equals</operation>
            <value>Eric Chou</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SDR Contact Distributed - Email - High Priority</fullName>
        <actions>
            <name>AvaTax_High_priority_Contact_Distribution_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>When a contact has been distributed from the Avatax High Priority  Contact Distributer, send email to  new contact owner.
Update: https://jira.avalara.com/browse/IBST-15021</description>
        <formula>AND( 
ISCHANGED(OwnerId), 
OR( 
PRIORVALUE(OwnerId)=&quot;00540000001eFBm&quot;, 
PRIORVALUE(OwnerId)=&quot;0050b000004wl8z&quot; 
), 
ISCHANGED(Distribution_action__c), ISPICKVAL(Distribution_action__c, &quot;Assigned - SalesLoft&quot;), 
OR( 
ISPICKVAL( Offer__c , &quot;General Contact&quot;), 
ISPICKVAL( Offer__c , &quot;Product Offering&quot;), 
ISPICKVAL( Offer__c , &quot;Free Trial&quot;), 
ISPICKVAL( Offer__c , &quot;Online Buying&quot;) 
))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>SDR Contact Distributed - Email - Partner Referral</fullName>
        <actions>
            <name>AvaTax_Partner_Referrals_Contact_Distribution_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>When a contact has been distributed from the Avatax Partner Referral  Contact Distributer, send email to  new contact owner</description>
        <formula>AND(ISCHANGED( OwnerId ) , PRIORVALUE(OwnerId)=&quot;00540000001eFBm&quot;, ISCHANGED( Distribution_action__c ) , ISPICKVAL(Distribution_action__c , &quot;Assigned - SalesLoft&quot;), ISPICKVAL( Offer__c , &quot;Referral Program&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>SDR%2FADR New Contact Responses Mary Jensen</fullName>
        <actions>
            <name>Assign_to_Mary_Jensen</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR 7) AND 2 AND 3 AND  5 AND 8 AND (4 AND 6)OR ( 11 AND (9 OR 10) )OR  (12 AND (9 OR 10) )</booleanFilter>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>Referral Program,General Contact,Product Offering,Blog,Case Study,Video,Survey,Webinar,Web Tools,Whitepaper,Free Rates,Road Show,Tradeshow,Corporate Sponsored Event,User Group,Partner Event,Partner Training,Content Syndication Whitepaper</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>equals</operation>
            <value>AvaTax,SOHO,CertCapture,Communications,Excise,MatrixMaster,Cross-border,Included</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Number_of_Open_Opportunities__c</field>
            <operation>equals</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActivePartner__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Offer__c</field>
            <operation>equals</operation>
            <value>Through-partner syndication</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Engaged_By__c</field>
            <operation>notEqual</operation>
            <value>ADR Engaged</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.EZTax_Type__c</field>
            <operation>notEqual</operation>
            <value>Client</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Excise_Tax_Division_Type__c</field>
            <operation>notEqual</operation>
            <value>Customer</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActivePartner__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActiveCustomer__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Avatax  Offer = Free Trial, Most Recent Conversion = Today assigned to Mary Jensen

https://jira.avalara.com/browse/IBST-8386?filter=-1</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SOHO Contacts Active Buying Nurture Response</fullName>
        <actions>
            <name>Assign_Contact_to_Matt_Hammond</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Active_Buying_Nurture_Response</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Campaign_Most_Recent_ID__c</field>
            <operation>equals</operation>
            <value>70133000001UkRcAAK,70133000001UkRhAAK,70133000001UkRrAAK,70133000001UkRwAAK,70133000001UkS6AAK,70133000001UkSBAA0,70133000001UkSQAA0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Active_Customer__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.ActivePartnerAccount__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Contact assigned to Matt Hammond if most recent campaign = 70133000001UkRc
70133000001UkRh
70133000001UkRr
70133000001UkRw
70133000001UkS6
70133000001UkSB
70133000001UkSQ
IBST-3105</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SOHO Contacts Closed Lost Opp Revive Response</fullName>
        <actions>
            <name>Assign_Contact_to_Matt_Hammond</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Closed_Lost_Opp_Revive_Response</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Campaign_Most_Recent_ID__c</field>
            <operation>equals</operation>
            <value>7010b000000eLNTAA2,7010b000000eLNYAA2,7010b000000eLNdAAM</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Active_Customer__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.ActivePartnerAccount__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Contact assigned to Matt Hammond if most recent campaign = 7010b000000eLNT
7010b000000eLNY
7010b000000eLNd IBST 3404</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SOHO%2FBizDev Contact Task</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Contact.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Opportunity_Sub_Type__c</field>
            <operation>contains</operation>
            <value>BizDev,SOHO</value>
        </criteriaItems>
        <description>When a contact has BizDev or SOHO opportunity supbtype and mostrecent conversion date is today. Assign task to Diane Waterman</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send Email%3A Preferred Developer Profile Update</fullName>
        <actions>
            <name>Send_Email_Preferred_Developer_Profile_Update</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Action__c</field>
            <operation>equals</operation>
            <value>Send Email: Preferred Developer Profile Update</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/ITBSE-1148</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Prior Case Date</fullName>
        <actions>
            <name>Set_Prior_Case_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>The purpose of this workflow is to set the Prior Case Date field on the Contact record, the value of the previous Last Opened Case date value.  This function informs the repeat case assessment.</description>
        <formula>ISCHANGED(LastCaseOpened__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Previous Marketing Contact Trained</fullName>
        <actions>
            <name>Stamp_Previous_Marketing_Contact_Trained</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( Partner_Marketing_Contact_Trained_Date__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Previous Sales Contact Trained</fullName>
        <actions>
            <name>Stamp_Last_Partner_Sales_Contact_Trained</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Partner_Contact_Trained_Date__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp SALT-in-a-Box Signup Date</fullName>
        <actions>
            <name>Stamp_SALT_in_a_Box_Signup_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_SAM_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Lead_Source_Most_Recent__c</field>
            <operation>equals</operation>
            <value>SALT-in-a-Box</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.SALT_in_a_BoxSignupDate__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Status Change Date - Working</fullName>
        <actions>
            <name>Status_Change_Date_Working</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Owner: Kim Gordon - IS Opps</description>
        <formula>AND( 
ISCHANGED(  ContactStatus__c  ), 
OR( 
ISPICKVAL(ContactStatus__c , &quot;Working&quot;), 
ISPICKVAL(Cadence_Stage__c, &quot;Working&quot;)) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Working Status over 60 Days</fullName>
        <actions>
            <name>Nuture_Reason_60_days</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Contact_Status_to_Nurture</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Change the contact status to Nurture if it has been in the working stage for over 60 days</description>
        <formula>NOW() - Status_Change_Date_Working__c &gt; 61</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>X-Cart Marketplace Form Submit</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Lead_Source_Most_Recent__c</field>
            <operation>equals</operation>
            <value>X-Cart Marketplace</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Validation_Exempt__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>when a CONTACT submits the form</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>iv__InsideView Outbound Rule for Contacts</fullName>
        <actions>
            <name>iv__InsideView_Contacts_Outbound_Message</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <formula>CONTAINS($Setup.iv__InsideView_Notification_Enabler__c.iv__InsideView_Notification_Enabler__c, &quot;Contact.UPDATE&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>iv__InsideView Outbound Rule for New Contacts</fullName>
        <actions>
            <name>iv__InsideView_Contacts_Outbound_Message</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <formula>CONTAINS($Setup.iv__InsideView_Notification_Enabler__c.iv__InsideView_Notification_Enabler__c, &quot;Contact.CREATE&quot;)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <tasks>
        <fullName>APEX_SDK_Free_Trial_for_SF_com</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>APEX SDK Free Trial for SF.com</subject>
    </tasks>
    <tasks>
        <fullName>A_Contact_has_filled_out_a_Filing_Needs_AssessmentSurvey</fullName>
        <assignedTo>jason.warren@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Filing Needs Assessment Survey Response</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>A Contact has filled out a Filing Needs Assessment Survey</subject>
    </tasks>
    <tasks>
        <fullName>A_Contact_has_filled_out_a_Filing_Needs_Assessment_Survey</fullName>
        <assignedTo>alex.deblois@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Filing Needs Assessment Survey Response</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>A Contact has filled out a Filing Needs Assessment Survey</subject>
    </tasks>
    <tasks>
        <fullName>A_Contacthas_filledout_a_Filing_Needs_AssessmentSurvey</fullName>
        <assignedTo>eric.chou@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Filing Needs Assessment Survey Response</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>A Contact has filled out a Filing Needs Assessment Survey</subject>
    </tasks>
    <tasks>
        <fullName>A_Customer_has_downloaded_one_of_the_Certificate_Management_Whitepapers</fullName>
        <assignedTo>alex.deblois@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow up required: A customer has downloaded one of the Certificate Management Whitepapers!</subject>
    </tasks>
    <tasks>
        <fullName>Active_Buying_Nurture_Response</fullName>
        <assignedTo>matthew.hammond@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please follow up.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Active Buying Nurture Response</subject>
    </tasks>
    <tasks>
        <fullName>Active_Customer_High_Priority_Response</fullName>
        <assignedTo>aaron.zapf@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Active Customer - High Priority Response</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Active Customer - High Priority Response</subject>
    </tasks>
    <tasks>
        <fullName>AssignFollowupforAvaNewsLead</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A contact submitted a form in a recent edition of the AvaNews. Please review for duplicates and assign based on assigment rules. An alert was also sent to salesleads@avalara.com for this inquiry.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Assign Followup for AvaNews Lead</subject>
    </tasks>
    <tasks>
        <fullName>Attended_Webinar3</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please look at the campaign history to see the webinar they had registered for!</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended Webinar</subject>
    </tasks>
    <tasks>
        <fullName>Attended_a_tradeshow4</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>Please look at the campaign name to see which tradeshow they attended!</description>
        <dueDateOffset>4</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended a tradeshow</subject>
    </tasks>
    <tasks>
        <fullName>Attended_a_tradeshow5</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>Please look at the campaign name to see which tradeshow they attended!</description>
        <dueDateOffset>4</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended a tradeshow</subject>
    </tasks>
    <tasks>
        <fullName>Attended_a_tradeshow8</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>Please look at the campaign name to see which tradeshow they attended!</description>
        <dueDateOffset>4</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended a tradeshow</subject>
    </tasks>
    <tasks>
        <fullName>AvaRates_Ambassador_Please_follow_up</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please refer to the campaign for details: OBTM2012Q307TMAVAAMBASS</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AvaRates Ambassador: Please follow up.</subject>
    </tasks>
    <tasks>
        <fullName>AvaRates_Subscriber_Follow_up</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This contact just subscribed to a free product. Refer to the campaign name for details of the free product. If not currently engaged and not an existing customer, please follow-up and qualify for AvaTax or other solutions.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>A. Free Product Subscriber Follow-up</subject>
    </tasks>
    <tasks>
        <fullName>AvaTax_Calc_free_trial_form_submit2</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AvaTax Calc free trial form submit</subject>
    </tasks>
    <tasks>
        <fullName>AvaTax_Free_Trial_Inquiry</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Follow up with Contact about AvaTax Standalone Free Trial</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AvaTax  Free Trial Contact Me</subject>
    </tasks>
    <tasks>
        <fullName>Business_Finance_Ad_W</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This person downloaded the Automation: A Company&apos;s Best Ally Against Sales Tax Audits white paper. The Business Finance audience are CFO, VP,  SVP level individuals and most companies are Enterprise level companies (Kevin McCarthy salesperson).</description>
        <dueDateOffset>4</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Business Finance Ad - W</subject>
    </tasks>
    <tasks>
        <fullName>CC_Call_1_General_Contact_Request</fullName>
        <assignedTo>shaun.rabe@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Contact has made a General Contact Request.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>CC Call 1: General Contact Request</subject>
    </tasks>
    <tasks>
        <fullName>Call_1_ExciseRates_Follow_Up</fullName>
        <assignedToType>owner</assignedToType>
        <description>Contact has made a Free Rates Request.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call 1: ExciseRates Follow Up</subject>
    </tasks>
    <tasks>
        <fullName>Call_1_Excise_Contact_Us_Form_Follow_Up</fullName>
        <assignedToType>owner</assignedToType>
        <description>Contact has made a General Contact Request.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call 1: Excise Contact Us Form Follow Up</subject>
    </tasks>
    <tasks>
        <fullName>Call_1_Excise_Partner_Referral_Form_Follow_Up</fullName>
        <assignedToType>owner</assignedToType>
        <description>Check the referral URL field for name of Partner</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call 1: Excise Partner Referral Form Follow Up</subject>
    </tasks>
    <tasks>
        <fullName>Call_1_Excise_Product_Offering_Follow_Up</fullName>
        <assignedToType>owner</assignedToType>
        <description>Contact has made a Product Offering Request.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call 1: Excise Product Offering Follow Up</subject>
    </tasks>
    <tasks>
        <fullName>Certs_Best_Practice_Webinar_Contact_Attended</fullName>
        <assignedToType>owner</assignedToType>
        <description>Webinar registrant (contact) who attended Exemption Certificates Best Practices webinar.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Certs Best Practice Webinar - Contact Attended</subject>
    </tasks>
    <tasks>
        <fullName>Certs_Best_Practices_Webinar_Contact_No_Show</fullName>
        <assignedToType>owner</assignedToType>
        <description>Registrant (contact) did not attend Exemption Certificate Best Practices webinar.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Certs Best Practices Webinar - Contact No Show</subject>
    </tasks>
    <tasks>
        <fullName>Chat_Contact_Us_Form_Follow_up</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This contact completed a contact us form tied to chat. Please check for duplicates and follow-up.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Chat Contact Us Form Follow-up</subject>
    </tasks>
    <tasks>
        <fullName>Closed_Lost_Opp_Revive_Response</fullName>
        <assignedTo>matthew.hammond@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please follow up</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Closed Lost Opp Revive Response</subject>
    </tasks>
    <tasks>
        <fullName>CommTaxRates_Registration_Follow_Up_See_Campaign_Name_for_details2</fullName>
        <assignedTo>shaun.rabe@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>CommTaxRates Registration Follow Up – See Campaign Name for details</subject>
    </tasks>
    <tasks>
        <fullName>Completed_the_needs_assessment_survey_tool</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>To access full analysis report and assessment responses, look to the Needs Assessment URL field at the Lead or Contact level (depending on conversion).</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Completed the needs assessment survey tool, refer to comments for more info</subject>
    </tasks>
    <tasks>
        <fullName>Completed_the_needs_assessment_survey_tool4</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>To access full analysis report and assessment responses, look to the Needs Assessment URL field at the Lead or Contact level (depending on conversion).</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Completed the needs assessment survey tool, refer to comments for more info</subject>
    </tasks>
    <tasks>
        <fullName>Completed_the_needs_assessment_survey_tool6</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>To access full analysis report and assessment responses, look to the Needs Assessment URL field at the Lead or Contact level (depending on conversion).</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Completed the needs assessment survey tool, refer to comments for more info</subject>
    </tasks>
    <tasks>
        <fullName>Contact_Direct_Assignment</fullName>
        <assignedToType>owner</assignedToType>
        <description>New contact task assigned to you. Please refer to the campaign name for details.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Contact Assignment Direct to Sales</subject>
    </tasks>
    <tasks>
        <fullName>Contact_Us_Form_Follow_Up_fixxbook</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Contact Us Form Follow-Up fixxbook</subject>
    </tasks>
    <tasks>
        <fullName>Contact_Us_form_follow_up</fullName>
        <assignedTo>matthew.harrison@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Contact has new Marketing activity, please follow up.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Contact Us form follow-up</subject>
    </tasks>
    <tasks>
        <fullName>Contact_registered_for_an_Avalara_Webinar</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please refer to the campaign name for details</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>A. Contact registered for an Avalara Webinar</subject>
    </tasks>
    <tasks>
        <fullName>ContactusForm</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Contact filled out the Contact Us Form on the website.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Contact us Form</subject>
    </tasks>
    <tasks>
        <fullName>Convergence2009LeadFollowup</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Convergence 2009 Lead Follow-up</subject>
    </tasks>
    <tasks>
        <fullName>Did_not_attend_a_webinar4</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please look at the campaign history to see the webinar they had registered for.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Did not attend a webinar</subject>
    </tasks>
    <tasks>
        <fullName>EZ_Call_General_Contact</fullName>
        <assignedTo>shaun.rabe@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Contact has made a General Contact Request.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>EZ Call: General Contact</subject>
    </tasks>
    <tasks>
        <fullName>EZ_Call_Product_Offering_Request</fullName>
        <assignedTo>shaun.rabe@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Contact has recent Product Offering Request.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>EZ Call: Product Offering Request</subject>
    </tasks>
    <tasks>
        <fullName>EcommerceWhitepaperDownloadFollowup</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This person downloaded the Ecommerce Whitepaper. Review for duplicates, convert to account/contact if needed and assign a TASK only to SDK team. SDK team will create opportunity if qualified.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Ecommerce Whitepaper Download Follow-up</subject>
    </tasks>
    <tasks>
        <fullName>EcommerceWhitepaperDownloadFollowupMCMC</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This person downloaded the Ecommerce Whitepaper from a dedicated email sent by Multichannel Merchant.  Please check for duplicates and follow up.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Ecommerce Whitepaper Download Follow-up (MCM - C)</subject>
    </tasks>
    <tasks>
        <fullName>Exemption_Certificate_White_Paper_download</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Exemption Certificate White Paper download</subject>
    </tasks>
    <tasks>
        <fullName>Follow_up_A_customer_has_downloaded_one_of_the_Certificate_Management_Whitepaper</fullName>
        <assignedTo>jason.warren@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow up required: A customer has downloaded one of the Certificate Management Whitepapers!</subject>
    </tasks>
    <tasks>
        <fullName>Follow_up_required_A_customer_has_downloaded_one_of_the_Certificate_Management_W</fullName>
        <assignedTo>eric.chou@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow up required: A customer has downloaded one of the Certificate Management Whitepapers</subject>
    </tasks>
    <tasks>
        <fullName>Free_installation_offer_W</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>These contacts came directly from a Bellwether ad and signed up for free installation and Gold support upon purchase of AvaTax. Sage users. Offer expires August 30. https://www.avalara.com/bellwether</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Free installation offer - W</subject>
    </tasks>
    <tasks>
        <fullName>INFO_Certs_WP_download</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This contact downloaded the exemption certificate white paper &quot;Automating the Exemption Certificate Management Lifecycle&quot;. 2nd email will offer next white paper and go out in 10-14 days.</description>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>INFO Certs WP download</subject>
    </tasks>
    <tasks>
        <fullName>IntellExemptCertsWebinar_ContactNoShow</fullName>
        <assignedToType>owner</assignedToType>
        <description>Contact did not attend Intelligent Exemption Certificate Mangement webinar.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>IntellExemptCertsWebinar-ContactNoShow</subject>
    </tasks>
    <tasks>
        <fullName>Intell_Exempt_Certs_Mgt_Webinar</fullName>
        <assignedToType>owner</assignedToType>
        <description>Contact attended Intelligent Exemption Certificate Management webinar.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Intell Exempt Certs Mgt Webinar</subject>
    </tasks>
    <tasks>
        <fullName>Interested_in_Infinity_Partner_Program_BS_Insight_Mag</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>Please follow up. Submitted a form for more information on Infinity Partner Program</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Interested in Infinity Partner Program - BS Insight Mag</subject>
    </tasks>
    <tasks>
        <fullName>Lead_Priority_Score_A1</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>Please create an opportunity if one does not exist or if existing opportunity has a created date greater than one year. Be sure to update with appropriate primary campaign source and opportunity sub type.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Notification: Lead Priority Score A1</subject>
    </tasks>
    <tasks>
        <fullName>Medium_Interest_Please_contact_this_prospect_Behavior_Score_updated_50_80</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>Increase in behavior score. Please refer to field for exact score.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Medium Interest! Please contact this prospect. Behavior Score updated: 50 - 80.</subject>
    </tasks>
    <tasks>
        <fullName>NACM_50_Off_Activation_W</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>NACM banner ad offering 50% off activation fee for AvaTax Certs. Offer good through August 30 (subscription must be purchased by then).</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NACM 50% Off Activation - W</subject>
    </tasks>
    <tasks>
        <fullName>NACM_Banner_Ad_Other</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This contact downloaded the white paper by clicking through from an NACM banner ad. Offer the second white paper on Customer Relationship and Exempt Cert Mgt as follow up. Will invite to a webinar one week before webinar.</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NACM Banner Ad - Other</subject>
    </tasks>
    <tasks>
        <fullName>NACM_WP_Download_Aug</fullName>
        <assignedToType>owner</assignedToType>
        <description>Contact downloaded &quot;The Relationship Between Customer Service and Exemption Certificate Management&quot; white paper. Was also invited to download the first white paper &quot;Automating the Exemption Certificate Lifecycle.&quot;</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NACM - WP Download - Aug</subject>
    </tasks>
    <tasks>
        <fullName>NACM_WP_Download_Central_Aug</fullName>
        <assignedToType>owner</assignedToType>
        <description>Contact downloaded &quot;The Relationship Between Customer Service and Exemption Certificate Management&quot;; was also invited to download &quot;Automating the Exemption Certificate Lifecycle&quot; Can offer third white paper on using AvaTax to automate.</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NACM - WP Download - Central - Aug</subject>
    </tasks>
    <tasks>
        <fullName>NACM_WP_Download_E_Aug</fullName>
        <assignedToType>owner</assignedToType>
        <description>Contact downloaded &quot;The Relationship Between Customer Service and Exemption Certificate Management&quot;; and invited to download &quot;Automating the Exemption Certificate Lifecycle&quot; as well. Can offer automating with avatax white paper as well.</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NACM - WP Download - E - Aug</subject>
    </tasks>
    <tasks>
        <fullName>New_1DemandZen_Appointment_follow_up</fullName>
        <assignedTo>david.wilson@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please follow up with the prospect with the follow up email template</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New DemandZen Appointment – follow up</subject>
    </tasks>
    <tasks>
        <fullName>New_2DemandZen_Appointment_follow_up</fullName>
        <assignedTo>kristin.terdik@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please follow up with the prospect with the follow up email template</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New DemandZen Appointment – follow up</subject>
    </tasks>
    <tasks>
        <fullName>New_3DemandZen_Appointment_follow_up</fullName>
        <assignedTo>kristin.terdik@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please follow up with the prospect with the follow up email template</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New DemandZen Appointment – follow up</subject>
    </tasks>
    <tasks>
        <fullName>New_4DemandZen_Appointment_follow_up</fullName>
        <assignedTo>matthew.hill@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please follow up with the prospect with the follow up email template</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New DemandZen Appointment – follow up</subject>
    </tasks>
    <tasks>
        <fullName>New_ACP_Contact_Activity</fullName>
        <assignedTo>balz.wyss@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>An ACP contact had recent activity. Please follow up.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New ACP Contact Activity</subject>
    </tasks>
    <tasks>
        <fullName>New_Brazil_Contact_Marketing_Activity</fullName>
        <assignedTo>roberio.lima@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please follow up: avalara.com/br campaign response</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New Brazil Contact Marketing Activity</subject>
    </tasks>
    <tasks>
        <fullName>New_Contact_Activity_Today</fullName>
        <assignedTo>shaun.rabe@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This Communications contact had a recent Webinar Activity</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>EZ Call: Webinar Activity</subject>
    </tasks>
    <tasks>
        <fullName>New_Contact_on_Your_Account_Has_Taken_an_Action</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>This contact has taken an action (filled out a form, downloaded an asset, etc – see campaign history). This is a net new contact that has been matched to one of your existing customer accounts by LeanData. Please review for follow up.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New Contact on Your Account Has Taken an Action</subject>
    </tasks>
    <tasks>
        <fullName>New_Returns_Lead</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>This person has just responded to the Customer Returns Needs Assessment Survey. CAMs please followup and track opportunities to campaign as MKT2011NOEMFNAS. If your are not the CAM, please assing to customer CAM or email customer.loyalty@avalara.com.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New Returns Lead</subject>
    </tasks>
    <tasks>
        <fullName>Notification_Lead_Priority_Score_A2</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>Please create an opportunity if one does not exist or if existing opportunity has a created date greater than one year. Be sure to update with appropriate primary campaign source and opportunity sub type.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Notification: Lead Priority Score A2</subject>
    </tasks>
    <tasks>
        <fullName>Notification_Lead_Priority_Score_A3</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>Please further qualify the contact and create/revive the opportunity if possible.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Notification: Lead Priority Score A3</subject>
    </tasks>
    <tasks>
        <fullName>Notification_Lead_Priority_Score_B1</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>Please create an opportunity if one does not exist or if existing opportunity has a created date greater than one year. Be sure to update with appropriate primary campaign source and opportunity sub type.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Notification: Lead Priority Score B1</subject>
    </tasks>
    <tasks>
        <fullName>Notification_Lead_Priority_Score_B2</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>Please create an opportunity if one does not exist or if existing opportunity has a created date greater than one year. Be sure to update with appropriate primary campaign source and opportunity sub type.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Notification: Lead Priority Score B2</subject>
    </tasks>
    <tasks>
        <fullName>Notification_Lead_Priority_Score_B3</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>Please further qualify the contact and create/revive the opportunity if possible.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Notification: Lead Priority Score B3</subject>
    </tasks>
    <tasks>
        <fullName>Notification_Lead_Priority_Score_C1</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>Please further qualify the contact and create/revive the opportunity if possible.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Notification: Lead Priority Score C1</subject>
    </tasks>
    <tasks>
        <fullName>Notification_Lead_Priority_Score_C2</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>Please further qualify the contact and create/revive the opportunity if possible.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Notification: Lead Priority Score C2</subject>
    </tasks>
    <tasks>
        <fullName>Notification_Lead_Priority_Score_C3</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>Please further qualify the contact and create/revive the opportunity if possible.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Notification: Lead Priority Score C3</subject>
    </tasks>
    <tasks>
        <fullName>Notification_Lead_Priority_Score_D1</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>Please further qualify the contact and create/revive the opportunity if possible.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Notification: Lead Priority Score D1</subject>
    </tasks>
    <tasks>
        <fullName>Notification_Lead_Priority_Score_D2</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>Please further qualify the contact and create/revive the opportunity if possible.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Notification: Lead Priority Score D2</subject>
    </tasks>
    <tasks>
        <fullName>OBTM</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>OBTM</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>OBTM</subject>
    </tasks>
    <tasks>
        <fullName>Participated_in_Marketing_Re_engagement_campaign</fullName>
        <assignedToType>owner</assignedToType>
        <description>please refer to the campaign name for details.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Participated in Marketing Re-engagement campaign</subject>
    </tasks>
    <tasks>
        <fullName>PartnerLeadRegistrationFollowUp1</fullName>
        <assignedToType>owner</assignedToType>
        <description>A Partner or a Sales Rep filled out the Partner Registration form on the website. Please follow up with this Contact.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Partner Lead Registration Follow Up</subject>
    </tasks>
    <tasks>
        <fullName>Partner_Contact_Activity</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This contact had activity that changed their Offer to one of the following: Partner Event/ Partner Training/ Referral Program.

Please follow up with contact.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Partner Referral - High Priority</subject>
    </tasks>
    <tasks>
        <fullName>Partner_Referral_Contact</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A contact was recently added to the SAM2015Q000 Partner Direct Referrals campaign. Please follow up.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Partner Referral Contact</subject>
    </tasks>
    <tasks>
        <fullName>Please_contact_this_prospect_Behavior_Score_updated</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>Increase in behavior score. Please refer to field for exact score.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>High Interest! Please contact this prospect. Behavior Score updated: &gt;81.</subject>
    </tasks>
    <tasks>
        <fullName>Please_follow_up_https_www_avalara_com_br_campaign_response</fullName>
        <assignedTo>nathalie.paschalis@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please follow up with this new contact.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Please follow up: https://www.avalara.com/br campaign response</subject>
    </tasks>
    <tasks>
        <fullName>Please_follow_up_withEMEA_contact_response</fullName>
        <assignedTo>jordan.grimwood@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Please follow up with contact response</subject>
    </tasks>
    <tasks>
        <fullName>Please_follow_up_with_EMEA_prospect</fullName>
        <assignedTo>sacha.wilson@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please refer to the campaign name for details.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Please follow up with EMEA prospect</subject>
    </tasks>
    <tasks>
        <fullName>Please_follow_up_with_contact_response</fullName>
        <assignedTo>shaun.rabe@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Please follow up with contact response.</subject>
    </tasks>
    <tasks>
        <fullName>ProStoresWebinarFlashDownload</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>ProStores Webinar Flash Download</subject>
    </tasks>
    <tasks>
        <fullName>Responded_to_a_marketing_offer</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Responded to a marketing offer</subject>
    </tasks>
    <tasks>
        <fullName>Response_to_a_nurture_track</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please refer to the nurture campaign for details</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Response to a nurture track</subject>
    </tasks>
    <tasks>
        <fullName>Response_to_a_nurture_track2</fullName>
        <assignedTo>kimberly.gordon@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please refer to the nurture campaign for details</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Response to a nurture track</subject>
    </tasks>
    <tasks>
        <fullName>Response_to_a_nurture_track3</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please refer to the nurture campaign for details</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Response to a nurture track</subject>
    </tasks>
    <tasks>
        <fullName>Response_to_a_nurture_track4</fullName>
        <assignedTo>kimberly.gordon@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please refer to the nurture campaign for details</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Response to a nurture track</subject>
    </tasks>
    <tasks>
        <fullName>Response_to_a_nurture_track5</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please refer to the nurture campaign for details</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Response to a nurture track</subject>
    </tasks>
    <tasks>
        <fullName>Response_to_a_nurture_track6</fullName>
        <assignedTo>kimberly.gordon@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please refer to the nurture campaign for details</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Response to a nurture track</subject>
    </tasks>
    <tasks>
        <fullName>Revive_campaign_follow_up</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please follow-up with this contact from the Revive campaign. Refer to the campaign name for details.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Revive Campaign: Please follow up with contact</subject>
    </tasks>
    <tasks>
        <fullName>RockNRave2010</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>120</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>RockNRave2010</subject>
    </tasks>
    <tasks>
        <fullName>SDK_Free_Trial_Sign_Up_Form</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Submitted information on SDK Free Trial webpage.  Please check for duplicates and create an opportunity for a new sdk lead.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>SDK Free Trial Sign Up Form</subject>
    </tasks>
    <tasks>
        <fullName>Submitted_a_form_to_download_an_Avalara_asset</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please refer to the campaign name for more details.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Submitted a form to download an Avalara asset</subject>
    </tasks>
    <tasks>
        <fullName>Submitted_a_form_to_download_an_Avalara_asset2</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>please refer to the campaign name for more details.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Submitted a form to download an Avalara asset</subject>
    </tasks>
    <tasks>
        <fullName>Submitted_a_form_to_respond_to_an_Avalara_special_offer</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please refer to the campaign name for more details.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Submitted a form to respond to an Avalara special offer</subject>
    </tasks>
    <tasks>
        <fullName>Submitted_a_form_to_respond_to_an_Avalara_special_offer2</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please refer to the campaign name for more details.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Contact responded to special offer</subject>
    </tasks>
    <tasks>
        <fullName>Submitted_contact_form_after_viewing_newsletter_ad</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>See newsletter ad here: https://www.avalara.com/LandingPages/newsletter-article-practicalecommerce</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Submitted contact form after viewing newsletter ad</subject>
    </tasks>
    <tasks>
        <fullName>Submitted_contact_form_from_Home_page_image</fullName>
        <assignedToType>accountOwner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Submitted contact form from Home page image</subject>
    </tasks>
    <tasks>
        <fullName>Submitted_contact_form_on_AvaTax_com1</fullName>
        <assignedTo>kael.kelly@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>High Priority Task</subject>
    </tasks>
    <tasks>
        <fullName>Submitted_contact_form_to_view_whitepaper5</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>RETAIL TOUCH POINTS WHITEPAPER</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Submitted contact form to view whitepaper</subject>
    </tasks>
    <tasks>
        <fullName>Submitted_form_to_view_RTP_whitepaper</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Retail Touch Points whitepaper campaign</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Submitted form to view RTP whitepaper</subject>
    </tasks>
    <tasks>
        <fullName>Submitted_form_to_view_eCommerce_webinar</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>submitted a form to view automated eCommerce webinar</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Submitted form to view eCommerce webinar</subject>
    </tasks>
    <tasks>
        <fullName>TapcoCaseStudyFormFollowup</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This person requested the Tapco case study hosted on Avalara&apos;s homepage.  Please check for duplicates and follow up.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Tapco Case Study Form Followup</subject>
    </tasks>
    <tasks>
        <fullName>Taxcient_Contact_Us_Form_Follow_up</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This contact completed a contact us form from the taxcient.com website. Please check for duplicates and follow-up.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Taxcient Contact Us Form Follow-up</subject>
    </tasks>
    <tasks>
        <fullName>Taxrates_com_Contact_Us_Follow_up</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This contact completed a contact us form on the www.taxrates.com website. Please check for duplicates and follow-up.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Taxrates.com Contact Us Follow-up</subject>
    </tasks>
    <tasks>
        <fullName>TrustFile_Automated_Demo</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>TrustFile Automated Demo</subject>
    </tasks>
    <tasks>
        <fullName>TrustFile_Customer_Call_Task</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please refer to the campaign name for details.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>TrustFile Customer Call Task</subject>
    </tasks>
    <tasks>
        <fullName>Whitepaper_Download</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please check for duplicates and follow-up with contact. This contact requested a whitepaper on Zip Codes and Sales Tax. See offer page: http://www.avalara.com/offers/</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Whitepaper Download</subject>
    </tasks>
    <tasks>
        <fullName>You_have_been_assigned_a_task_on_an_Amazon_Bridge_request</fullName>
        <assignedTo>colin.matthews@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A contact has recently completed an Amazon Bridge form. Please follow up.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>You have been assigned a task on an Amazon Bridge request.</subject>
    </tasks>
    <tasks>
        <fullName>b_AvaRates_Subscriber_Follow_up</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This contact just subscribed to a free product. Refer to the campaign name for details of the free product. If not currently engaged and not an existing customer, please follow-up and qualify for AvaTax or other solutions.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>B. Free Product Subscriber Follow-up</subject>
    </tasks>
    <tasks>
        <fullName>b_Contact_registered_for_an_Avalara_Webinar</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please refer to the campaign name for details</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>B. . Contact registered for an Avalara Webinar</subject>
    </tasks>
    <tasks>
        <fullName>customer_has_downloaded_one_of_the_Certificate_Management_Whitepapers</fullName>
        <assignedTo>eric.chou@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow up required: A customer has downloaded one of the Certificate Management Whitepapers!</subject>
    </tasks>
    <tasks>
        <fullName>submitted_contact_form_for_QB_Survival_Guide</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>submitted contact form for Survival Guide</subject>
    </tasks>
    <tasks>
        <fullName>submitted_contact_form_for_QB_Survival_Guide7</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>submitted contact form for Survival Guide</subject>
    </tasks>
    <tasks>
        <fullName>submitted_form_to_view_recorded_practical_ecommerce_webinar1</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>submitted form to view recorded practical ecommerce webinar</subject>
    </tasks>
    <tasks>
        <fullName>submitted_form_to_view_recorded_practical_ecommerce_webinar5</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>submitted form to view recorded practical ecommerce webinar</subject>
    </tasks>
    <tasks>
        <fullName>submitted_form_to_view_whitepaper3</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>submitted form to view whitepaper</subject>
    </tasks>
</Workflow>
