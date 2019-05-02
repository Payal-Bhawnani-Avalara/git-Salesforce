<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>AlertsenttoTerritoryManagerswhenanewCaseisopenedforoneoftheirAccounts</fullName>
        <ccEmails>notify-territory@avalara.com</ccEmails>
        <description>Alert sent to Territory Managers when a new Case is opened for one of their Accounts</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Support_Emails/TechnicalServicesCaseOpenAlertTerritory</template>
    </alerts>
    <alerts>
        <fullName>Auto_Response_Avalara_Account_Email</fullName>
        <description>Auto Response: Avalara Account Email</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>service-reply@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Avalara_Account_Web_Auto_Response_HTML</template>
    </alerts>
    <alerts>
        <fullName>AvaTax_Extractor_Welcome_Email</fullName>
        <description>AvaTax Extractor Welcome Email</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Extractor_Templates_Customer_Facing/AvaTax_Extractor_Welcome_Email</template>
    </alerts>
    <alerts>
        <fullName>Avalara_Account_Email_Comment</fullName>
        <description>Avalara Account Email Comment</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>service-reply@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Avalara_Account_Comment_Email_Alert</template>
    </alerts>
    <alerts>
        <fullName>Avalara_Account_Email_Inbound_Comment</fullName>
        <description>Avalara Account Email Inbound Comment</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Avalara_Account_Inbound_Comment_Email_Alert</template>
    </alerts>
    <alerts>
        <fullName>Avalara_Cancellation_Confirmed_email_to_contact</fullName>
        <description>Avalara Cancellation Confirmed email to contact</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>X2016_Cancellation_Templates/Cancellation_Finance_Step_Complete</template>
    </alerts>
    <alerts>
        <fullName>BR_send10Day_email</fullName>
        <description>BR-send10Day email</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>svc-notifications@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Brazil_Support/BR_10_Day_NoResponse</template>
    </alerts>
    <alerts>
        <fullName>CAM_Case_Alert</fullName>
        <description>CAM Case Alert</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CAM_Case_Alert</template>
    </alerts>
    <alerts>
        <fullName>CAM_Case_Created_for_You</fullName>
        <ccEmails>bob.waite@avalara.com</ccEmails>
        <description>CAM Case Created for You</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Templates/CAM_Case_Created</template>
    </alerts>
    <alerts>
        <fullName>CAM_Case_on_President_Watchlist</fullName>
        <description>CAM Case on President Watchlist</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>alex.deblois@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>andrea.anderson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>earl.wright@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jay.deubler@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mark.ippolito@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>matthew.johnson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tom.pacholke@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Templates/PlacedOnWatchList</template>
    </alerts>
    <alerts>
        <fullName>CAM_Case_on_VP_Watchlist</fullName>
        <description>CAM Case on VP Watchlist</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>alex.deblois@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>andrea.anderson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>clint.knudsen@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>earl.wright@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jay.deubler@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>katy.klinkenberg@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mark.ippolito@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>matt.tormollen@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>matthew.johnson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nate.anderson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tom.pacholke@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Templates/PlacedOnWatchList</template>
    </alerts>
    <alerts>
        <fullName>CAM_Case_on_Watchlist</fullName>
        <description>CAM Case on Watchlist</description>
        <protected>false</protected>
        <recipients>
            <recipient>CAM_Leadership_Watch_List_Distribution</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Templates/PlacedOnWatchList</template>
    </alerts>
    <alerts>
        <fullName>CAM_Ent_Alert_1</fullName>
        <description>CAM Ent Alert 1</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>customer.loyalty@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>CAM_email_Templates/CAM_ENT_temp_1</template>
    </alerts>
    <alerts>
        <fullName>CAM_Ent_Alert_2</fullName>
        <description>CAM Ent Alert 2</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>clint.knudsen@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ken.davis@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>natasha.strickland@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>rose.tweit@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tonya.winchester@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>CX_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>customer.loyalty@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>CAM_email_Templates/CAM_ENT_temp_2</template>
    </alerts>
    <alerts>
        <fullName>CAM_Ent_Alert_3</fullName>
        <description>CAM Ent Alert 3</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>amanda.miller@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>clint.knudsen@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jamie.edgerton@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ken.davis@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>laura.moses@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mark.ippolito@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>natasha.strickland@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nicole.mackay@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>reiner.paculdo@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>robert.leo@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>rose.tweit@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>service-ops@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tonya.winchester@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>CX_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>customer.loyalty@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>CAM_email_Templates/CAM_ENT_temp_3</template>
    </alerts>
    <alerts>
        <fullName>CSC_Case_Creation_Acknowledgement</fullName>
        <description>CSC - Case Creation Acknowledgement</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Accounting/Acctg_You_Got_Case</template>
    </alerts>
    <alerts>
        <fullName>Cancellation_CAM_Notification</fullName>
        <description>Cancellation CAM Notification</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <recipient>nicholas.ostrom@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>customer.loyalty@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>X2016_Cancellation_Templates/Cancellation_CAM_notification</template>
    </alerts>
    <alerts>
        <fullName>Cancellation_Survey_Returned_To_CAM</fullName>
        <description>Cancellation Survey Returned To CAM</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>X2016_Cancellation_Templates/Cancellation_CAM_notification</template>
    </alerts>
    <alerts>
        <fullName>Cancellation_Survey_Sent_Second_Notice</fullName>
        <description>Cancellation Survey Sent - Second Notice</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>customer.loyalty@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Cancellation_Templates/second_Cancellation_Email_Received</template>
    </alerts>
    <alerts>
        <fullName>CaseClosedSendSurvey</fullName>
        <description>CaseClosedSendSurvey</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>ZZZSupportArchive/Customer_Support_Survey</template>
    </alerts>
    <alerts>
        <fullName>CaseMovedtoEscalatedIssues</fullName>
        <ccEmails>bob.waite@avalara.com</ccEmails>
        <description>CaseMovedtoEscalatedIssues</description>
        <protected>false</protected>
        <recipients>
            <recipient>carol.mccormick@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>demarcus.wells@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jenny.gardner@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>pat.ferdig@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>ZZZSupportArchive/FYI_M2Escalated</template>
    </alerts>
    <alerts>
        <fullName>Closing_Email_Alert</fullName>
        <description>Closing Email Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support_Emails/Monitor_Email_Close_2</template>
    </alerts>
    <alerts>
        <fullName>Contact_Noification_that_Full_Cancellation_Survey_Received</fullName>
        <description>Contact Noification that Full Cancellation Survey Received</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>CNCLCancellation_Alt_Contact_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>customer.loyalty@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>X2016_Cancellation_Templates/Cancellation_Survey_Returned</template>
    </alerts>
    <alerts>
        <fullName>Customer_Feedback_Form_from_Dashboard</fullName>
        <description>Customer Feedback Form from Dashboard</description>
        <protected>false</protected>
        <recipients>
            <recipient>andrea.anderson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>bob.waite@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>latesha.mccaffety@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mark.wilhelm@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mark.withers@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>marshal.kushniruk@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>michael.gardner@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>pat.falle@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>pat.ferdig@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Customer_Feedback_Form/FYI_Customer_Submitted_Feedback_Form</template>
    </alerts>
    <alerts>
        <fullName>Customer_facing_email_Cancellation_Finance_Step_Complete</fullName>
        <description>Customer-facing email &quot;Cancellation Finance Step Complete&quot;</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>customer.loyalty@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>X2016_Cancellation_Templates/Cancellation_Finance_Step_Complete</template>
    </alerts>
    <alerts>
        <fullName>EMEA_Doc_Alert</fullName>
        <ccEmails>service-ops@avalara.com, demarcus.wells@avalara.com</ccEmails>
        <description>EMEA Doc Alert</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>MRS_Support_Templates/EMEADocumentAlert</template>
    </alerts>
    <alerts>
        <fullName>Email</fullName>
        <description>Cancellation Survey Returned To Contact</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>CNCLCancellation_Alt_Contact_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>X2016_Cancellation_Templates/Cancellation_Survey_Returned</template>
    </alerts>
    <alerts>
        <fullName>Ent_Core_Team_Follow_Up_Violation</fullName>
        <description>Ent: Core Team Follow Up Violation</description>
        <protected>false</protected>
        <recipients>
            <recipient>india.anderson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>service-ops@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Workflow_Case_in_working_longer_than_SLA</template>
    </alerts>
    <alerts>
        <fullName>Ent_Esc_Compliance_Violation_FC</fullName>
        <ccEmails>service-ops@avalara.com</ccEmails>
        <description>Ent: Esc Compliance Violation FC</description>
        <protected>false</protected>
        <recipients>
            <recipient>kyana.price@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>pamela.knudsen@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Workflow_Escalation_Compliance_Violation</template>
    </alerts>
    <alerts>
        <fullName>Ent_Esc_Compliance_Violation_Notices</fullName>
        <ccEmails>service-ops@avalara.com</ccEmails>
        <description>Ent: Esc Compliance Violation Notices</description>
        <protected>false</protected>
        <recipients>
            <recipient>kyana.price@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>pamela.knudsen@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Workflow_Escalation_Compliance_Violation</template>
    </alerts>
    <alerts>
        <fullName>Ent_Esc_Compliance_Violation_RR</fullName>
        <ccEmails>service-ops@avalara.com</ccEmails>
        <description>Ent: Esc Compliance Violation RR</description>
        <protected>false</protected>
        <recipients>
            <recipient>kyana.price@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>pamela.knudsen@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Workflow_Escalation_Compliance_Violation</template>
    </alerts>
    <alerts>
        <fullName>Ent_Esc_Compliance_Violation_Recon</fullName>
        <ccEmails>service-ops@avalara.com</ccEmails>
        <description>Ent: Esc Compliance Violation Recon</description>
        <protected>false</protected>
        <recipients>
            <recipient>kyana.price@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>pamela.knudsen@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Workflow_Escalation_Compliance_Violation</template>
    </alerts>
    <alerts>
        <fullName>Escalation_Disposition_Sev_1</fullName>
        <ccEmails>service-ops@avalara.com</ccEmails>
        <description>Escalation Disposition - Sev 1</description>
        <protected>false</protected>
        <recipients>
            <recipient>india.anderson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Workflow_Escalated_Disposition</template>
    </alerts>
    <alerts>
        <fullName>Escalation_Disposition_Sev_2</fullName>
        <ccEmails>service-ops@avalara.com</ccEmails>
        <description>Escalation Disposition - Sev 2</description>
        <protected>false</protected>
        <recipients>
            <recipient>india.anderson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Workflow_Escalated_Disposition</template>
    </alerts>
    <alerts>
        <fullName>Escalation_Disposition_Sev_345</fullName>
        <ccEmails>india.anderson@avalara.com</ccEmails>
        <description>Escalation Disposition - Sev 345</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Workflow_Escalated_Disposition</template>
    </alerts>
    <alerts>
        <fullName>Escalation_Fix_Date_Sev_1</fullName>
        <ccEmails>service-ops@avalara.com</ccEmails>
        <description>Escalation Fix Date - Sev 1</description>
        <protected>false</protected>
        <recipients>
            <recipient>india.anderson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Workflow_Escalated_FixDate</template>
    </alerts>
    <alerts>
        <fullName>Escalation_Fix_Date_Sev_2</fullName>
        <ccEmails>service-ops@avalara.com</ccEmails>
        <description>Escalation Fix Date - Sev 2</description>
        <protected>false</protected>
        <recipients>
            <recipient>india.anderson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Workflow_Escalated_FixDate</template>
    </alerts>
    <alerts>
        <fullName>Escalation_Fix_Date_Sev_345</fullName>
        <ccEmails>india.anderson@avalara.com</ccEmails>
        <description>Escalation Fix Date - Sev 345</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Workflow_Escalated_FixDate</template>
    </alerts>
    <alerts>
        <fullName>Escalation_Workaround_Sev_1</fullName>
        <ccEmails>service-ops@avalara.com</ccEmails>
        <description>Escalation Workaround - Sev 1</description>
        <protected>false</protected>
        <recipients>
            <recipient>india.anderson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Workflow_Escalated_Workaround</template>
    </alerts>
    <alerts>
        <fullName>Escalation_Workaround_Sev_2</fullName>
        <ccEmails>service-ops@avalara.com</ccEmails>
        <description>Escalation Workaround - Sev 2</description>
        <protected>false</protected>
        <recipients>
            <recipient>india.anderson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Workflow_Escalated_Workaround</template>
    </alerts>
    <alerts>
        <fullName>Escalation_Workaround_Sev_345</fullName>
        <ccEmails>india.anderson@avalara.com</ccEmails>
        <description>Escalation Workaround - Sev 345</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Workflow_Escalated_Workaround</template>
    </alerts>
    <alerts>
        <fullName>Excise_Custom_Notifications_Case_Comment_Update</fullName>
        <description>Excise Custom Notifications Case Comment Update</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>service-reply@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Case_Comment_Update_Notification</template>
    </alerts>
    <alerts>
        <fullName>Excise_Custom_Notifications_Case_attachment_Update</fullName>
        <description>Excise Custom Notifications Case attachment Update</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Case_Attachment_Update_Notification</template>
    </alerts>
    <alerts>
        <fullName>Excise_Email_Comment</fullName>
        <description>Excise Email Comment</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support_Emails/WorkFlow_Case_Comments_16</template>
    </alerts>
    <alerts>
        <fullName>External_Setup_Complete_Next_Steps</fullName>
        <description>External - Setup Complete Next Steps</description>
        <protected>false</protected>
        <recipients>
            <recipient>aaron.zapf@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Self_Serve_GoLive/GLI_Status_Calc_ss</template>
    </alerts>
    <alerts>
        <fullName>Funding_POA_Detected</fullName>
        <description>Funding POA Detected</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>aaron.zapf@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>allison.olanie@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>melissa.davis@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Funding_POA_Detected</template>
    </alerts>
    <alerts>
        <fullName>ICP_Alert_03</fullName>
        <description>ICP Alert 03</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>accountsreceivable@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>AR_Collection_Templates/ICP_WorkflowCM03</template>
    </alerts>
    <alerts>
        <fullName>ICP_Alert_05</fullName>
        <description>ICP Alert 05</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderAddress>accountsreceivable@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>AR_Collection_Templates/ICP_WorkflowCM05</template>
    </alerts>
    <alerts>
        <fullName>ICP_Alert_06</fullName>
        <description>ICP Alert 06</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>accountsreceivable@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>AR_Collection_Templates/ICP_WorkflowCM06</template>
    </alerts>
    <alerts>
        <fullName>ICP_Alert_08</fullName>
        <description>ICP Alert 08</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>accountsreceivable@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>AR_Collection_Templates/ICP_WorkflowCM08</template>
    </alerts>
    <alerts>
        <fullName>ICP_Alert_10</fullName>
        <description>ICP Alert 10</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>accountsreceivable@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>AR_Collection_Templates/ICP_WorkflowCM10</template>
    </alerts>
    <alerts>
        <fullName>Initial_Cancellation_Auto_Response</fullName>
        <description>Initial Cancellation Auto Response</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>customer.loyalty@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>X2016_Cancellation_Templates/Cancellation_Email_Received</template>
    </alerts>
    <alerts>
        <fullName>Intro_to_Customer_Care_Center</fullName>
        <description>Intro to Customer Care Center</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>customercarecenter@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/AvaTax_Welcome_Letter</template>
    </alerts>
    <alerts>
        <fullName>Milestone_Automation_AddonConnector</fullName>
        <description>Milestone Automation - AddonConnector</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>customercarecenter@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Milestone_Automation_AddOn</template>
    </alerts>
    <alerts>
        <fullName>New_Cancellation_Case_Created</fullName>
        <description>New Cancellation Case Created</description>
        <protected>false</protected>
        <recipients>
            <recipient>ken.davis@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/New_Cancellation_Case_Created</template>
    </alerts>
    <alerts>
        <fullName>Nexus_Email_Alert</fullName>
        <description>Nexus Email Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>aaron.zapf@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/X1099_Webinar_Follow_Up_Jesse</template>
    </alerts>
    <alerts>
        <fullName>NotifyCustomersofofClosedCase</fullName>
        <description>NotifyCustomersofClosedCase</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Customer_Notification_of_Closed_Case_external2</template>
    </alerts>
    <alerts>
        <fullName>NotifyLeadsofofClosedCase</fullName>
        <description>NotifyInternalsofClosedCase</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>charlie.morrisette@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>derek.colbert@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jon.helin@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>pamela.knudsen@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>service-ops@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>steven.hawk@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Customer_Notification_of_Closed_Case</template>
    </alerts>
    <alerts>
        <fullName>Notify_CAM_Case_Owner_when_case_auto_closed_b_c_smart_tasks_are_complete</fullName>
        <description>Notify CAM Case Owner when case auto closed b/c smart tasks are complete</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Templates/CAMCaseAutoClosed</template>
    </alerts>
    <alerts>
        <fullName>Notify_CAM_of_New_Case</fullName>
        <description>Notify CAM of New Case</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>CAM_email_Templates/Notify_CAM_of_New_Case</template>
    </alerts>
    <alerts>
        <fullName>Notify_CX_Rep_of_Case_Assignment</fullName>
        <description>Notify CX Rep of Case Assignment</description>
        <protected>false</protected>
        <recipients>
            <field>CX_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Templates/Notify_CX_Rep_of_Case_Assignment</template>
    </alerts>
    <alerts>
        <fullName>NotifyofBlankTeamonCase</fullName>
        <description>NotifyofBlankTeamonCase</description>
        <protected>false</protected>
        <recipients>
            <recipient>service-ops@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>ZZZSupportArchive/BlankTeamCase</template>
    </alerts>
    <alerts>
        <fullName>OK_To_Close_CAM_Case</fullName>
        <ccEmails>bob.waite@avalara.com</ccEmails>
        <description>OK To Close CAM Case</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Templates/VerifyCloseCAMCase</template>
    </alerts>
    <alerts>
        <fullName>Prenote_Upload_Failure</fullName>
        <ccEmails>TMS@avalara.com</ccEmails>
        <description>Prenote Upload Failure</description>
        <protected>false</protected>
        <recipients>
            <field>Treasury_Services_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Finance_Treasury_Email_Notifications/Prenote_upload_Treasury_Email</template>
    </alerts>
    <alerts>
        <fullName>R01_Treasury_Notification_Invalid_Account_Number_or_No_Account_Cannot_Locate</fullName>
        <ccEmails>TMS@avalara.com</ccEmails>
        <description>R01 Treasury Notification -  Insufficient funds</description>
        <protected>false</protected>
        <recipients>
            <field>Treasury_Services_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Finance_Treasury_Email_Notifications/R01_Finance_Treasury_Email_Insufficient_funds</template>
    </alerts>
    <alerts>
        <fullName>R02_Treasury_Notification_Account_Closed</fullName>
        <ccEmails>TMS@avalara.com</ccEmails>
        <description>R02 -Treasury Notification Account Closed</description>
        <protected>false</protected>
        <recipients>
            <field>Treasury_Services_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Finance_Treasury_Email_Notifications/R02_Finance_Treasury_Email_Account_Closed</template>
    </alerts>
    <alerts>
        <fullName>R03_Treasury_Notification_Invalid_Account_Number_or_No_Account_Cannot_Locate</fullName>
        <ccEmails>TMS@avalara.com</ccEmails>
        <description>R03 Treasury Notification -  No Account/Cannot Locate</description>
        <protected>false</protected>
        <recipients>
            <field>Treasury_Services_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Finance_Treasury_Email_Notifications/R03_Finance_Treasury_Email_Invalid_Account_Number</template>
    </alerts>
    <alerts>
        <fullName>R08_Finance_Treasury_Notification_Payment_Stopped</fullName>
        <ccEmails>TMS@avalara.com</ccEmails>
        <description>R08 Finance Treasury Notification - Payment Stopped</description>
        <protected>false</protected>
        <recipients>
            <field>Treasury_Services_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Finance_Treasury_Email_Notifications/R08_Finance_Treasury_Email_Payment_Stopped</template>
    </alerts>
    <alerts>
        <fullName>R09_Uncollected_Funds</fullName>
        <ccEmails>TMS@avalara.com</ccEmails>
        <description>R09 – Uncollected Funds</description>
        <protected>false</protected>
        <recipients>
            <field>Treasury_Services_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Finance_Treasury_Email_Notifications/R09_Uncollected_Funds</template>
    </alerts>
    <alerts>
        <fullName>R13_Invalid_ACH_Routing_No</fullName>
        <ccEmails>TMS@avalara.com</ccEmails>
        <description>R13 – Invalid ACH Routing No</description>
        <protected>false</protected>
        <recipients>
            <field>Treasury_Services_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Finance_Treasury_Email_Notifications/R13_Invalid_ACH_Routing_No</template>
    </alerts>
    <alerts>
        <fullName>R20_Non_Transaction_Account</fullName>
        <ccEmails>TMS@avalara.com</ccEmails>
        <description>R20 – Non Transaction Account</description>
        <protected>false</protected>
        <recipients>
            <field>Treasury_Services_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Finance_Treasury_Email_Notifications/R20_Finance_Treasury_Email_Non_Transaction_Account</template>
    </alerts>
    <alerts>
        <fullName>Reassignment_Alert</fullName>
        <ccEmails>service-ops@avalara.com, india.anderson@avalara.com</ccEmails>
        <description>Reassignment Alert</description>
        <protected>false</protected>
        <recipients>
            <field>LastModifiedById</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/WorkFlow_Reassignment_Warning</template>
    </alerts>
    <alerts>
        <fullName>Refund_Processed</fullName>
        <description>Refund Processed</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>AR_Templates/Refund_Processed</template>
    </alerts>
    <alerts>
        <fullName>Response_Needed_Alert</fullName>
        <description>Response Needed Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>ZZZSupportArchive/Response_Needed</template>
    </alerts>
    <alerts>
        <fullName>Response_Needed_Alert_2</fullName>
        <ccEmails>service-ops@avalara.com, steven.hawk@avalara.com, derek.colbert@avalara.com, pamela.knudsen@avalara.com</ccEmails>
        <description>Response Needed Alert_2</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>ZZZSupportArchive/Response_Needed_2</template>
    </alerts>
    <alerts>
        <fullName>Response_Needed_Alert_3</fullName>
        <ccEmails>service-ops@avalara.com, steven.hawk@avalara.com, derek.colbert@avalara.com, pamela.knudsen@avalara.com</ccEmails>
        <description>Response Needed Alert_3</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>ZZZSupportArchive/Response_Needed_3</template>
    </alerts>
    <alerts>
        <fullName>Returns_AvaTax_Update</fullName>
        <description>Returns AvaTax Update</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>customercarecenter@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Returns_Welcome_Letter</template>
    </alerts>
    <alerts>
        <fullName>Send10DayEmail</fullName>
        <description>Send10DayEmail</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>svc-notifications@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Brazil_Support/BR_10_Day_NoResponse</template>
    </alerts>
    <alerts>
        <fullName>SendCancelNoticeAcknowledgement</fullName>
        <description>SendCancelNoticeAcknowledgement</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Case_Templates/CancelRequestReceived</template>
    </alerts>
    <alerts>
        <fullName>SendEmailonClosedCase</fullName>
        <description>SendEmailonClosedCase</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Closed_Case_Response_HTML</template>
    </alerts>
    <alerts>
        <fullName>Send_Accounting_Case_Rejection</fullName>
        <ccEmails>bob.waite@avalara.com</ccEmails>
        <description>Send Accounting Case Rejection</description>
        <protected>false</protected>
        <recipients>
            <recipient>Accounting AR</recipient>
            <type>caseTeam</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Accounting/Accth_Case_Denied</template>
    </alerts>
    <alerts>
        <fullName>Send_Acctg_Case_Approval</fullName>
        <description>Send Acctg Case Approval</description>
        <protected>false</protected>
        <recipients>
            <recipient>Accounting AR</recipient>
            <type>caseTeam</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Accounting/Accth_Case_Approved</template>
    </alerts>
    <alerts>
        <fullName>Send_Alert</fullName>
        <ccEmails>2066603485@txt.att.net;</ccEmails>
        <ccEmails>3604737358@txt.att.net;</ccEmails>
        <ccEmails>3607908719@vtext.com;</ccEmails>
        <ccEmails>3602046280@vtext.com;</ccEmails>
        <ccEmails>3602865549@messaging.sprintpcs.com;</ccEmails>
        <description>Send Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>charlie.morrisette@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>derek.colbert@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>pamela.knudsen@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>service-ops@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>steven.hawk@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support_Emails/Premium_Alert</template>
    </alerts>
    <alerts>
        <fullName>Send_Alert_2</fullName>
        <ccEmails>2256147655@txt.att.net</ccEmails>
        <description>Send Alert 2</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Support_Emails/Premium_Alert</template>
    </alerts>
    <alerts>
        <fullName>Send_Case_Owner_a_Notification</fullName>
        <description>Send Case Owner a Notification</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support_Emails/WorkFlow_Case_Assignment_Notification_v4</template>
    </alerts>
    <alerts>
        <fullName>Send_ClickTools_Case_Closed_Survey</fullName>
        <description>(Deprecated) Send ClickTools Case Closed Survey</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>ZZZSupportArchive/Customer_Support_Survey_Clicktools</template>
    </alerts>
    <alerts>
        <fullName>Send_Exit_Survey</fullName>
        <description>Cancellation Confirmation &amp; Exit Survey</description>
        <protected>false</protected>
        <recipients>
            <recipient>aaron.zapf@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>customer.loyalty@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>AvaTax_Cancellation_Workflow/Cancellation_Exist_Survey</template>
    </alerts>
    <alerts>
        <fullName>Send_Filing_Calendar_Closed_Alert</fullName>
        <description>Send Filing Calendar Closed Alert</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/WorkFlow_Filing_Calendar_Update</template>
    </alerts>
    <alerts>
        <fullName>Send_Jira_Notification_to_Case_Owner</fullName>
        <description>Send Jira Notification to Case Owner</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/NewJiraCommentNotice</template>
    </alerts>
    <alerts>
        <fullName>Send_Nexus_Email_to_Customer</fullName>
        <description>Send Nexus Email to Customer</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>customercarecenter@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Milestone_Automation_Nexus_Complete</template>
    </alerts>
    <alerts>
        <fullName>Send_No_Transaction_Email_Alert</fullName>
        <description>Send No Transaction Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>customercarecenter@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Milestone_Automation_NoTransaction</template>
    </alerts>
    <alerts>
        <fullName>Send_Notice_Logged_Email</fullName>
        <description>Send Notice Logged Email</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Notice_Received1</template>
    </alerts>
    <alerts>
        <fullName>Send_Notice_Received_Email</fullName>
        <description>Send Notice Received Email</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Notice_Received1</template>
    </alerts>
    <alerts>
        <fullName>Send_Rebuild_Closed_Case_Alert</fullName>
        <description>Send Rebuild Closed Case Alert</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/WorkFlow_Rebuild</template>
    </alerts>
    <alerts>
        <fullName>Send_SRM_Alert</fullName>
        <description>Send SRM Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>bridgette.penel@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>service-ops@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>CustomerSupport/SRMAlert</template>
    </alerts>
    <alerts>
        <fullName>Send_TAM_Alert_Template</fullName>
        <ccEmails>nigel.drinkwater@avalara.com</ccEmails>
        <ccEmails>devayani.wandrekar@avalara.com</ccEmails>
        <ccEmails>manish.kumbalkar@avalara.com</ccEmails>
        <ccEmails>david.regan@avalara.com</ccEmails>
        <ccEmails>rasika.kher@avalara.com</ccEmails>
        <description>Send TAM Alert Template</description>
        <protected>false</protected>
        <recipients>
            <field>TAM_Email_Alert__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support_Emails/TAM_New_Case_Alert</template>
    </alerts>
    <alerts>
        <fullName>Send_TrustFile_Finish_Setting_Up_Account_Email_to_Customer</fullName>
        <description>Send TrustFile Finish Setting Up Account Email to Customer</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>customercarecenter@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Milestone_Automation_FinishTrustFile</template>
    </alerts>
    <alerts>
        <fullName>Send_TrustFile_No_Account_Activation_Email_to_Customer</fullName>
        <description>Send TrustFile No Account Activation Email to Customer</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>customercarecenter@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Milestone_Automation_StepsTrustFile</template>
    </alerts>
    <alerts>
        <fullName>Send_TrustFile_Reminder_to_File_Email_to_Customer</fullName>
        <description>Send TrustFile Reminder to File Email to Customer</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>customercarecenter@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Milestone_Automation_TrustFeilFilingReminder</template>
    </alerts>
    <alerts>
        <fullName>Send_TrustFile_Sync_Your_Transactions_Email_to_Customer</fullName>
        <description>Send TrustFile Sync Your Transactions Email to Customer</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>customercarecenter@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Milestone_Automation_SyncDataTrustFile</template>
    </alerts>
    <alerts>
        <fullName>Send_Unresponsive_Email_to_Customer</fullName>
        <description>Send Unresponsive Email to Customer</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>customercarecenter@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Milestone_Automation_SelfServe_Unresponsive</template>
    </alerts>
    <alerts>
        <fullName>Send_W_9_to_Case_Contact</fullName>
        <description>Send W-9 to Case Contact</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>accountsreceivable@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>AR_Templates/W_9_text</template>
    </alerts>
    <alerts>
        <fullName>Send_W_9_to_Case_Owner</fullName>
        <description>Send W-9 to Case Owner</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>accountsreceivable@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>AR_Templates/W_9_text</template>
    </alerts>
    <alerts>
        <fullName>Send_Warning_Email_to_Customer</fullName>
        <description>Send Warning Email to Customer</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>customercarecenter@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Milestone_Automation_SelfServe_Warning</template>
    </alerts>
    <alerts>
        <fullName>Testing_Feedback_Form</fullName>
        <description>Testing Feedback Form</description>
        <protected>false</protected>
        <recipients>
            <recipient>andrea.anderson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Customer_Feedback_Form/FYI_Customer_Submitted_Feedback_Form</template>
    </alerts>
    <alerts>
        <fullName>Treasure_Notification_NOC_C01</fullName>
        <ccEmails>TMS@avalara.com</ccEmails>
        <description>C01 Treasury Notification Notification of Change - Incorrect Account Number</description>
        <protected>false</protected>
        <recipients>
            <field>Treasury_Services_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Finance_Treasury_Email_Notifications/NOC_C01_Treasury_Notification</template>
    </alerts>
    <alerts>
        <fullName>Treasure_Notification_NOC_C02</fullName>
        <ccEmails>TMS@avalara.com</ccEmails>
        <description>C02 Treasure Notification Notification of Change - Incorrect Routing Number</description>
        <protected>false</protected>
        <recipients>
            <field>Treasury_Services_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Finance_Treasury_Email_Notifications/NOC_C02_Treasury_Notification</template>
    </alerts>
    <alerts>
        <fullName>Treasure_Notification_NOC_C03</fullName>
        <ccEmails>TMS@avalara.com</ccEmails>
        <description>C03Treasure Notification Notification of Change - Incorrect Routing Number</description>
        <protected>false</protected>
        <recipients>
            <field>Treasury_Services_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Finance_Treasury_Email_Notifications/NOC_C03_Treasury_Notification</template>
    </alerts>
    <alerts>
        <fullName>Treasury_Notification_Acct_Froz</fullName>
        <ccEmails>TMS@avalara.com</ccEmails>
        <description>R16 - Treasury Notification - Acct Frzn/Ret per OFAC</description>
        <protected>false</protected>
        <recipients>
            <field>Treasury_Services_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Finance_Treasury_Email_Notifications/R16_Finance_Treasury_Email_Invalid_Acct_frz</template>
    </alerts>
    <alerts>
        <fullName>Treasury_Notification_Invalid_Account_Number_or_No_Account_Cannot_Locate</fullName>
        <ccEmails>TMS@avalara.com</ccEmails>
        <description>R04 Treasury Notification - Invalid Account Number or No Account/Cannot Locate</description>
        <protected>false</protected>
        <recipients>
            <field>Treasury_Services_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Finance_Treasury_Email_Notifications/R04_Finance_Treasury_Email_Invalid_Account_Number</template>
    </alerts>
    <alerts>
        <fullName>Treasury_Notification_Unauthorized_Corporate_Transaction</fullName>
        <ccEmails>TMS@avalara.com</ccEmails>
        <description>R29 - Treasury Notification - Unauthorized Corporate Transaction</description>
        <protected>false</protected>
        <recipients>
            <field>Treasury_Services_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Finance_Treasury_Email_Notifications/Finance_Treasury_Email_Unauthorized_tans_Block</template>
    </alerts>
    <alerts>
        <fullName>TrustFile_Welcome_Email</fullName>
        <description>TrustFile Welcome Email</description>
        <protected>false</protected>
        <recipients>
            <field>ContactEmail</field>
            <type>email</type>
        </recipients>
        <senderAddress>customercarecenter@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Milestone_Automation_Welcome_to_TrustFile</template>
    </alerts>
    <alerts>
        <fullName>WOC_1st_Notification</fullName>
        <description>WOC - 1st Notification</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Customer_Support_Waiting_General</template>
    </alerts>
    <alerts>
        <fullName>WOC_2nd_Notification</fullName>
        <description>WOC - 2nd Notification</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Customer_Support_Waiting_2nd</template>
    </alerts>
    <alerts>
        <fullName>WOC_3rd_Notification</fullName>
        <description>WOC - 3rd Notification</description>
        <protected>false</protected>
        <recipients>
            <field>ContactId</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Support_Emails/Customer_Support_Waiting_3rd</template>
    </alerts>
    <alerts>
        <fullName>WireException_Treasury_Notification</fullName>
        <ccEmails>TMS@avalara.com</ccEmails>
        <description>WireException Treasury Notification</description>
        <protected>false</protected>
        <recipients>
            <field>Treasury_Services_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Finance_Treasury_Email_Notifications/WireException_Finance_Treasury_Email</template>
    </alerts>
    <fieldUpdates>
        <fullName>Add_1_to_Contacts_per_Case</fullName>
        <field>Contacts_Per_Case__c</field>
        <formula>Contacts_Per_Case__c  + 1</formula>
        <name>Add 1 to Contacts per Case</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_1_to_Target_Change_Count</fullName>
        <field>Target_Change_Count__c</field>
        <formula>Target_Change_Count__c + 1</formula>
        <name>Add 1 to Target Change Count</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>AssignTeamLeadWatchlist</fullName>
        <field>WatchList__c</field>
        <literalValue>Team Lead</literalValue>
        <name>AssignTeamLeadWatchlist</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_Billing_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>Billing_Contact_Management</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Assign Billing Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_Case_to_Susan_Gover</fullName>
        <field>OwnerId</field>
        <lookupValue>susan.gover@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign Case to Susan Gover</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_Support_Record_type</fullName>
        <description>Assign case record type to Support Case v1</description>
        <field>RecordTypeId</field>
        <lookupValue>Support_Case_v2</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Assign Support Record type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_to_Account_Queue</fullName>
        <description>Cancellation cases are assigned to the accounting queue when the status is set to Confirmed.</description>
        <field>OwnerId</field>
        <lookupValue>Accounting_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Assign to Accounting Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_to_Finance_Cancellation_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>Finance_Cancellation_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Assign to Finance Cancellation Queue</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_to_Monitor</fullName>
        <description>Assign to Self Serve</description>
        <field>OwnerId</field>
        <lookupValue>SOHO_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Assign to Self Serve</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_to_OmniSelfServe</fullName>
        <field>OwnerId</field>
        <lookupValue>OmniSelfServe</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Assign to OmniSelfServe</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Avalara_Product_AvaTax</fullName>
        <field>Avalara_Product__c</field>
        <literalValue>Avalara Avatax</literalValue>
        <name>Avalara Product = AvaTax</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Avalara_Product_CertCapture</fullName>
        <field>Avalara_Product__c</field>
        <literalValue>Avalara CertCapture</literalValue>
        <name>Avalara Product = CertCapture</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Avalara_Product_Returns</fullName>
        <field>Avalara_Product__c</field>
        <literalValue>Avalara Returns</literalValue>
        <name>Avalara Product = Returns</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BR_CLoseCase10day</fullName>
        <description>Change status to Closed no response</description>
        <field>Status</field>
        <literalValue>No Response (Closed)</literalValue>
        <name>BR_CLoseCase10day</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cancel_Notify_Date_Stamp</fullName>
        <description>CNCL Combined Cancellation Survey Sent  date stamped onto field</description>
        <field>Cancel_Notify_Date__c</field>
        <formula>CNCLCancellation_Survey_Sent__c</formula>
        <name>Cancel Notify Date Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Case_Status_to_Working</fullName>
        <field>Status</field>
        <literalValue>Working</literalValue>
        <name>Change Case Status to Working</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_Delete</fullName>
        <field>OwnerId</field>
        <lookupValue>Delete</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Change Owner Delete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Owner_to_Support</fullName>
        <field>OwnerId</field>
        <lookupValue>CustomerSupport</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Change Owner to Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Record_Type_to_Support_Case_v2</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Support_Case_v2</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change Record Type to Support Case v2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Status_to_Response_Needed</fullName>
        <field>Status</field>
        <literalValue>Response Needed (Open)</literalValue>
        <name>Change Status to Response Needed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Status_to_Submitted_to_CEE</fullName>
        <field>Status</field>
        <literalValue>Submitted to CEE</literalValue>
        <name>Change Status to Submitted to CEE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Watchlist_to_Customer_Response</fullName>
        <description>Change Watchlist to “Customer Response”</description>
        <field>WatchList__c</field>
        <literalValue>Customer Response</literalValue>
        <name>Change Watchlist to Customer Response</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_to_Cam_Case</fullName>
        <field>RecordTypeId</field>
        <lookupValue>CAM_Case</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change to Cam Case</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_to_FC_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Filing_Calendar_Case_v1</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change to FC Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_to_Notice_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Notice_Case_v1</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change to Notice Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_to_RR_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Returns_Request_Case_v1</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change to RR Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_to_Recon_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Recon_Case_v1</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change to Recon Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_to_Zytax_Case</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Zytax_Case_v1</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change to Zytax Case</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CheckSurveySentCheckbox</fullName>
        <description>This checks the Survey Sent Checkbox which prevents this rule from getting triggered again in the future.</description>
        <field>SurveySent__c</field>
        <literalValue>1</literalValue>
        <name>Check Survey Sent Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Case_Rank</fullName>
        <field>Case_Rank_Override__c</field>
        <name>Clear Case Rank</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Pulled_by</fullName>
        <field>Pulled_By__c</field>
        <name>Clear Pulled by</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Pulled_by_Date</fullName>
        <field>Pulled_Date__c</field>
        <name>Clear Pulled by Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CloseCAMCaseSuccessful</fullName>
        <description>Set CAM Case to Resolved (Closed) when all SmartTasks associated with the case are completed.</description>
        <field>Status</field>
        <literalValue>Resolved (Closed)</literalValue>
        <name>CloseCAMCaseSuccessful</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CloseDeflectedcase</fullName>
        <field>Status</field>
        <literalValue>Resolved (Closed)</literalValue>
        <name>CloseDeflectedcase</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Copy_TAM_Email</fullName>
        <field>TAM_Email_Alert__c</field>
        <formula>TAM_emailreference__c</formula>
        <name>Copy TAM Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Create_Jira_URL</fullName>
        <field>Issue_URL_Jira__c</field>
        <formula>&quot;https://jira.avalara.com/browse/&quot; + Issue_Number__c</formula>
        <name>Create Jira URL</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EMEA_CA</fullName>
        <field>MRS_Registration_Pack_Sent__c</field>
        <formula>Today()</formula>
        <name>EMEA CASE Status Change - Reg. pack sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EMEA_CASE_Status_Change_Await_Documen</fullName>
        <description>Update today&apos;s date when the status changes</description>
        <field>MRS_Awaiting_Documents_Date__c</field>
        <formula>Today()</formula>
        <name>EMEA CASE Status Change - Await. Documen</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EMEA_CASE_Status_Change_Client_Review</fullName>
        <description>update date field when status changes to Client Review</description>
        <field>MRS_Client_Review_Date__c</field>
        <formula>Today()</formula>
        <name>EMEA CASE Status Change - Client Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EMEA_CASE_Status_Change_Coc_review</fullName>
        <description>Update date to today when status changes to Document Review</description>
        <field>MRS_Document_Review_Date__c</field>
        <formula>Today()</formula>
        <name>EMEA CASE Status Change - Doc. Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EMEA_CASE_Status_Change_Final_Documen</fullName>
        <description>Stamp date when status changes to  Final Document Review</description>
        <field>MRS_Final_Document_Review_Date__c</field>
        <formula>Today()</formula>
        <name>EMEA CASE Status Change -  Final Documen</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EMEA_CASE_Status_Change_Originals_Requ</fullName>
        <description>Change date field when status changes to Originals Requested</description>
        <field>MRS_Originals_Requested_Date__c</field>
        <formula>Today()</formula>
        <name>EMEA CASE Status Change - Originals Requ</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EMEA_CASE_Status_Change_Submitted_to</fullName>
        <description>Stamp date when status changes to Submitted to TO</description>
        <field>MRS_Submitted_to_TO__c</field>
        <formula>Today()</formula>
        <name>EMEA CASE Status Change -  Submitted to</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EMEA_CASE_Status_Change_VAT_Number_Rec</fullName>
        <description>Stamp date when status changes to VAT Number Received</description>
        <field>MRS_VAT_Number_Received_Date__c</field>
        <formula>Today()</formula>
        <name>EMEA CASE Status Change - VAT Number Rec</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Ever_Escalated</fullName>
        <field>IsEscalated</field>
        <literalValue>1</literalValue>
        <name>Ever Escalated</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Set_Escalation_Date</fullName>
        <field>Escalation_Date__c</field>
        <formula>Now()</formula>
        <name>FU -Set Escalation Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Flag_Notice_Logged</fullName>
        <field>Notice__c</field>
        <literalValue>1</literalValue>
        <name>Flag Notice Logged</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Flag_Notice_Received</fullName>
        <description>Flag case acknowledgement as received</description>
        <field>Notice_Ack_Received__c</field>
        <literalValue>1</literalValue>
        <name>Flag Notice Received</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Force_Cancel_AvaTax</fullName>
        <field>CNCLCancelAvaTax__c</field>
        <literalValue>1</literalValue>
        <name>Force Cancel AvaTax</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Force_Cancel_CertCapture</fullName>
        <field>CNCLCancelCertCapture__c</field>
        <literalValue>1</literalValue>
        <name>Force Cancel CertCapture</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Force_Cancel_Returns</fullName>
        <field>CNCLCancelReturns__c</field>
        <literalValue>1</literalValue>
        <name>Force Cancel Returns</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Force_Self_Serve</fullName>
        <field>OwnerId</field>
        <lookupValue>SOHO_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Force Self Serve</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>GLI_Association_Trigger</fullName>
        <description>https://jira.avalara.com/browse/CXTECH-13</description>
        <field>Implementation_GLI_Trigger__c</field>
        <literalValue>1</literalValue>
        <name>GLI Association Trigger</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LX_Transfer_Compliance_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>Compliance</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>LX - Transfer Compliance Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lightning_Transer_Compliance</fullName>
        <field>OwnerId</field>
        <lookupValue>Compliance</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Lightning Transer Compliance</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MRS_All_Document_Date_Updates</fullName>
        <field>MRS_All_Documents_Received_Date__c</field>
        <formula>DATETIMEVALUE(TODAY())</formula>
        <name>MRS All Document Date Updates</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Maintain_AvaTax_Product</fullName>
        <field>Avalara_Product__c</field>
        <literalValue>Connector</literalValue>
        <name>Maintain AvaTax Product</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Maintain_Avalara_Product_CertCapture</fullName>
        <field>Avalara_Product__c</field>
        <literalValue>Avalara CertCapture</literalValue>
        <name>Maintain Avalara Product CertCapture</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Maintain_Avalara_Product_Returns</fullName>
        <field>Avalara_Product__c</field>
        <literalValue>Avalara Returns</literalValue>
        <name>Maintain Avalara Product Returns</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Maintain_Category_Trigger</fullName>
        <field>Product_Category__c</field>
        <literalValue>Service</literalValue>
        <name>Maintain Category Trigger</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Mark_Live</fullName>
        <field>Status</field>
        <literalValue>Live</literalValue>
        <name>Mark Live</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Milestone_Automation_TrustFile_Account</fullName>
        <field>Milestone_TrustFile_Account_Setup__c</field>
        <formula>Today()</formula>
        <name>Milestone Automation - TrustFile Account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Milestone_Automation_TrustFile_States</fullName>
        <field>Milestone_TrustFile_States_Configured__c</field>
        <formula>Today()</formula>
        <name>Milestone Automation - TrustFile States</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Milestone_Resume</fullName>
        <field>IsStopped</field>
        <literalValue>0</literalValue>
        <name>Milestone Resume</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Milestone_Suspend</fullName>
        <field>IsStopped</field>
        <literalValue>1</literalValue>
        <name>Milestone Suspend</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Milestone_Sync_Import_Complete</fullName>
        <field>Milestone_TrustFile_Transactions__c</field>
        <formula>Today()</formula>
        <name>Milestone - Sync/Import Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MyLodge_Assign_Member_Services</fullName>
        <field>OwnerId</field>
        <lookupValue>MyLodge_Member_Services</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>MyLodge Assign Member Services</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MyLodge_Case_Type_Email</fullName>
        <field>Case_Type__c</field>
        <literalValue>Email</literalValue>
        <name>MyLodge Case Type Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Product_Category_Service</fullName>
        <field>Product_Category__c</field>
        <literalValue>Service</literalValue>
        <name>Product Category = Service</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Raise_AR_Priority_to_critical</fullName>
        <field>Priority</field>
        <literalValue>Critical</literalValue>
        <name>Raise AR Priority to critical</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Raise_AR_case_to_1</fullName>
        <field>AR_Rank_Override__c</field>
        <formula>1</formula>
        <name>Raise AR case to 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Raise_Case_Rank_Priority</fullName>
        <description>Field update takes auto generated value of Case Rank and reduces it by 1 to raise the general priority of the case</description>
        <field>Case_Rank_Override__c</field>
        <formula>Case_Rank__c - 1</formula>
        <name>Raise Case Rank Priority</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Registration_Country_Subject_Override</fullName>
        <field>Subject</field>
        <formula>Account.Name &amp;&quot; - MRS &quot; &amp;  TEXT(MRS_Registration_Type__c) &amp; &quot; for - &quot;&amp;  TEXT(EMEA_Country__c)</formula>
        <name>Registration Country Subject Override</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_WaitProcessField</fullName>
        <field>Start_Waiting_Workflow__c</field>
        <name>BR Reset WaitProcessField</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_WatchList_Reason</fullName>
        <field>WatchListReason__c</field>
        <name>Reset WatchList Reason</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetCAMCaseReason2CancelNotice</fullName>
        <field>Reason</field>
        <literalValue>Cancellation Notice</literalValue>
        <name>SetCAMCaseReason2CancelNotice</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetCaseApprovalPending</fullName>
        <field>CaseApproved__c</field>
        <literalValue>Pending</literalValue>
        <name>SetCaseApprovalPending</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetCaseApprove2Submit</fullName>
        <field>CaseApproved__c</field>
        <literalValue>Submit for Approval</literalValue>
        <name>SetCaseApprove2Submit</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetCaseApproved</fullName>
        <field>CaseApproved__c</field>
        <literalValue>Approved</literalValue>
        <name>SetCaseApproved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetCaseApprovedNA</fullName>
        <field>CaseApproved__c</field>
        <literalValue>N/A</literalValue>
        <name>SetCaseApprovedNA</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetCaseRejected</fullName>
        <field>CaseApproved__c</field>
        <literalValue>Rejected</literalValue>
        <name>SetCaseRejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetDeflected</fullName>
        <field>DeflectedCase__c</field>
        <literalValue>1</literalValue>
        <name>SetDeflected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetNPSProduct</fullName>
        <field>NPS_Product__c</field>
        <formula>TRIM(MID(Description,FIND(&quot;Program Only:&quot;,Description)+15,
FIND(&quot;Account Owner:&quot;,Description)-FIND(&quot;Program Only:&quot;,Description)-15))</formula>
        <name>SetNPSProduct</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetNPSScore</fullName>
        <field>NPS_Survey_Score__c</field>
        <formula>IF(Contains(SUBSTITUTE(Description,&quot; &quot;,&quot;&quot;),&quot;score:10&quot;),10,
IF(Contains(SUBSTITUTE(Description,&quot; &quot;,&quot;&quot;),&quot;score:9&quot;),9,
IF(Contains(SUBSTITUTE(Description,&quot; &quot;,&quot;&quot;),&quot;score:8&quot;),8,
IF(Contains(SUBSTITUTE(Description,&quot; &quot;,&quot;&quot;),&quot;score:7&quot;),7,
IF(Contains(SUBSTITUTE(Description,&quot; &quot;,&quot;&quot;),&quot;score:6&quot;),6,
IF(Contains(SUBSTITUTE(Description,&quot; &quot;,&quot;&quot;),&quot;score:5&quot;),5,
IF(Contains(SUBSTITUTE(Description,&quot; &quot;,&quot;&quot;),&quot;score:4&quot;),4,
IF(Contains(SUBSTITUTE(Description,&quot; &quot;,&quot;&quot;),&quot;score:3&quot;),3,
IF(Contains(SUBSTITUTE(Description,&quot; &quot;,&quot;&quot;),&quot;score:2&quot;),2,
IF(Contains(SUBSTITUTE(Description,&quot; &quot;,&quot;&quot;),&quot;score:1&quot;),1,
IF(Contains(SUBSTITUTE(Description,&quot; &quot;,&quot;&quot;),&quot;score:0&quot;),0,
-7)))))))))))</formula>
        <name>SetNPSScore</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetNPSScoreWhenForwarded</fullName>
        <field>NPS_Survey_Score__c</field>
        <formula>IF(CONTAINS(Description,&quot;NPS survey score: 10&quot;),10,IF(CONTAINS(Description,&quot;NPS survey score: 9&quot;),9,IF(CONTAINS(Description,&quot;NPS survey score: 8&quot;),8,IF(CONTAINS(Description,&quot;NPS survey score: 7&quot;),7,IF(CONTAINS(Description,&quot;NPS survey score: 6&quot;),6,IF(CONTAINS(Description,&quot;NPS survey score: 5&quot;),5,IF(CONTAINS(Description,&quot;NPS survey score: 4&quot;),4,IF(CONTAINS(Description,&quot;NPS survey score: 3&quot;),3,IF(CONTAINS(Description,&quot;NPS survey score: 2&quot;),2,IF(CONTAINS(Description,&quot;NPS survey score: 1&quot;),1,IF(CONTAINS(Description,&quot;NPS survey score: 0&quot;),0,-1)))))))))))</formula>
        <name>SetNPSScoreWhenForwarded</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetReopened</fullName>
        <field>Reopened__c</field>
        <literalValue>1</literalValue>
        <name>SetReopened</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetTargetResponseDateForNewCAMCase</fullName>
        <field>Target_Response_Date_Time__c</field>
        <formula>NOW() + 1</formula>
        <name>SetTargetResponseDateForNewCAMCase</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_0_Minutes</fullName>
        <field>Next_Violation_Minutes__c</field>
        <formula>0</formula>
        <name>Set 0 Minutes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_1</fullName>
        <field>Next_Violation_Minutes__c</field>
        <formula>-1</formula>
        <name>Set -1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_12_Hour</fullName>
        <field>Next_Violation_Minutes__c</field>
        <formula>720</formula>
        <name>Set 12 Hour</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_16_Hour</fullName>
        <field>Next_Violation_Minutes__c</field>
        <formula>960</formula>
        <name>Set 16 Hour</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_1_Day</fullName>
        <field>Next_Violation_Minutes__c</field>
        <formula>1440</formula>
        <name>Set 1 Day</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_1_Hour</fullName>
        <field>Next_Violation_Minutes__c</field>
        <formula>60</formula>
        <name>Set 1 Hour</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_20_Hour</fullName>
        <field>Next_Violation_Minutes__c</field>
        <formula>1200</formula>
        <name>Set 20 Hour</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_2_Hour</fullName>
        <field>Next_Violation_Minutes__c</field>
        <formula>120</formula>
        <name>Set 2 Hour</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_30_Minutes</fullName>
        <field>Next_Violation_Minutes__c</field>
        <formula>30</formula>
        <name>Set 30 Minutes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_3_Days_Implementation</fullName>
        <field>Next_Violation_Minutes__c</field>
        <formula>4320</formula>
        <name>Set Implementation Warning 3 Days</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_3_days</fullName>
        <field>Next_Violation_Minutes__c</field>
        <formula>4320</formula>
        <name>Set 3 days</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_4_Hour</fullName>
        <field>Next_Violation_Minutes__c</field>
        <formula>240</formula>
        <name>Set 4 Hour</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_8_Hour</fullName>
        <field>Next_Violation_Minutes__c</field>
        <formula>480</formula>
        <name>Set 8 Hour</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Case_Rank_for_AR_back</fullName>
        <field>Case_Rank_Override__c</field>
        <formula>13</formula>
        <name>Set Case Rank for AR back</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Contact_Per_Case_to_0</fullName>
        <field>Contacts_Per_Case__c</field>
        <formula>0</formula>
        <name>Set Contact Per Case to 0</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Disposition_Date_to_Now_Update</fullName>
        <field>Disposition_Date__c</field>
        <formula>NOW()</formula>
        <name>Set Disposition Date field to Now</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Ent_Fix_Date_Time</fullName>
        <field>Date_Owner_Change__c</field>
        <formula>NOW()+ 0.0007</formula>
        <name>Set Ent Fix Date Time</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Escalation_Date_Field_to_Now</fullName>
        <field>Escalation_Date__c</field>
        <formula>NOW()</formula>
        <name>Set Escalation Date Field to Now</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Implementation_Live_Date</fullName>
        <field>Implementation_Live_Date__c</field>
        <formula>Today()</formula>
        <name>Set Implementation Live Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Implementation_Reset_9999999</fullName>
        <field>Next_Violation_Minutes__c</field>
        <formula>9999999</formula>
        <name>Set Implementation Reset 9999999</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Implementation_Warning_10_Days</fullName>
        <field>Next_Violation_Minutes__c</field>
        <formula>14400</formula>
        <name>Set Implementation Warning 10 Days</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Implementation_Warning_145_Days</fullName>
        <field>Next_Violation_Minutes__c</field>
        <formula>208800</formula>
        <name>Set Implementation Warning 145 Days</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Implementation_Warning_25_Days</fullName>
        <field>Next_Violation_Minutes__c</field>
        <formula>36000</formula>
        <name>Set Implementation Warning 25 Days</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Implementation_Warning_50_Days</fullName>
        <field>Next_Violation_Minutes__c</field>
        <formula>72000</formula>
        <name>Set Implementation Warning 50 Days</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Implementation_Warning_75_Days</fullName>
        <field>Next_Violation_Minutes__c</field>
        <formula>108000</formula>
        <name>Set Implementation Warning 75 Days</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Implementation_Warning_90_Days</fullName>
        <field>Next_Violation_Minutes__c</field>
        <formula>129600</formula>
        <name>Set Implementation Warning 90 Days</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Initial_Target_Fix</fullName>
        <field>Initial_Target_Fix_Date__c</field>
        <formula>Adjusted_Fix_Date__c</formula>
        <name>Set Initial Target Fix</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_LCA_T</fullName>
        <field>LCA_Test__c</field>
        <formula>NOW()</formula>
        <name>Set LCA T</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Last_Contact_Activity</fullName>
        <field>Last_Case_Activity__c</field>
        <formula>NOW()</formula>
        <name>Set Last Contact Activity</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Sent_Waiting_Email_Date</fullName>
        <field>Sent_Waiting_Email__c</field>
        <formula>NOW()</formula>
        <name>Set Sent Waiting Email Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Start_Waiting_Workflow</fullName>
        <field>Start_Waiting_Workflow__c</field>
        <formula>NOW()</formula>
        <name>Set Start Waiting Workflow</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Status_Resolved_Closed</fullName>
        <field>Status</field>
        <literalValue>Live</literalValue>
        <name>Set Status Live</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Status_Unresponsive</fullName>
        <field>Status</field>
        <literalValue>Unresponsive</literalValue>
        <name>Set Status Unresponsive</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Status_to_Duplicate</fullName>
        <field>Status</field>
        <literalValue>Duplicate (Closed)</literalValue>
        <name>Set Status to Duplicate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Status_to_No_Response_Closed</fullName>
        <field>Status</field>
        <literalValue>No Response (Closed)</literalValue>
        <name>Set Status to No Response (Closed)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Target_Change_Count_to_0</fullName>
        <field>Target_Change_Count__c</field>
        <formula>0</formula>
        <name>Set Target Change Count to 0</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Team_Name_CSR</fullName>
        <field>OwnerCSITeam__c</field>
        <formula>&quot;CAM Team&quot;</formula>
        <name>Set Team Name - CSR</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Team_Name_CertCapture</fullName>
        <field>OwnerCSITeam__c</field>
        <formula>&quot;CertCapture Support Team&quot;</formula>
        <name>Set Team Name - CertCapture</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Team_Name_Compliance</fullName>
        <field>OwnerCSITeam__c</field>
        <formula>&quot;Compliance&quot;</formula>
        <name>Set Team Name - Compliance</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Team_Name_Customer_Support</fullName>
        <field>OwnerCSITeam__c</field>
        <formula>&quot;Customer Support&quot;</formula>
        <name>Set Team Name - Customer Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Team_Name_Escalations</fullName>
        <field>OwnerCSITeam__c</field>
        <formula>&quot;Connector Team&quot;</formula>
        <name>Set Team Name - Escalations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Team_Name_SDK</fullName>
        <field>OwnerCSITeam__c</field>
        <formula>&quot;SDK&quot;</formula>
        <name>Set Team Name - SDK</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Team_Name_Zytax</fullName>
        <field>OwnerCSITeam__c</field>
        <formula>&quot;Zytax Customer Support Team&quot;</formula>
        <name>Set Team Name - Zytax</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_W9_Date_Sent</fullName>
        <field>Date_W_9_Sent__c</field>
        <formula>NOW()</formula>
        <name>Set W9 Date Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Watchlist_To_CaseOwner</fullName>
        <field>WatchList__c</field>
        <literalValue>Case Owner</literalValue>
        <name>Set Watchlist To CaseOwner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Account_Activation_Date</fullName>
        <field>Milestone_AvaTax_Account_Activation__c</field>
        <formula>Today()</formula>
        <name>Stamp Account Activation Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Company_Setup_Date</fullName>
        <field>Milestone_AvaTax_Company_Setup__c</field>
        <formula>Today()</formula>
        <name>Stamp Company Setup Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Confirmation_Date</fullName>
        <field>CNCLCancellation_Confirmation_Date__c</field>
        <formula>Today()</formula>
        <name>Stamp Confirmation Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Email_Unresponsive</fullName>
        <field>Milestone_Email_Unresponsive__c</field>
        <formula>Today()</formula>
        <name>Stamp Email Unresponsive</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Email_Warning</fullName>
        <field>Milestone_Email_Warning__c</field>
        <formula>Today()</formula>
        <name>Stamp Email Warning</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Exit_Survey_Sent</fullName>
        <field>CNCLCancellation_Exit_Survey_Sent__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Exit Survey Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Filing_Calendar</fullName>
        <field>Milestone_Returns_Calendar_Creation__c</field>
        <formula>Today()</formula>
        <name>Stamp Filing Calendar</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Funding_POA</fullName>
        <field>Milestone_Returns_POA__c</field>
        <formula>Today()</formula>
        <name>Stamp Funding POA</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_JIRA_Assignee_Date</fullName>
        <field>JIRA_Assignee_Assigned_Date__c</field>
        <formula>NOW()</formula>
        <name>Stamp JIRA Assignee Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_JIRA_Classified_Date</fullName>
        <field>JIRA_Classified_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp JIRA Classified Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Milestone_First_Response</fullName>
        <field>Milestone_First_Response__c</field>
        <formula>NOW()</formula>
        <name>Stamp Milestone First Response</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Milestone_Last_Touch</fullName>
        <field>Milestone_Last_Touch__c</field>
        <formula>Now()</formula>
        <name>Stamp Milestone Last Touch</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Nexus_Setup</fullName>
        <field>Milestone_AvaTax_Nexus_Setup__c</field>
        <formula>Today()</formula>
        <name>Stamp Nexus Setup</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Release_Date_Given</fullName>
        <field>JIRA_Release_Date_Given__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Release Date Given</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Returns_Compliance</fullName>
        <field>Milestone_Returns_Compliance_Active__c</field>
        <formula>Today()</formula>
        <name>Stamp Returns Compliance</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Signature_Detected</fullName>
        <field>Milestone_AvaTax_Signature_Detected__c</field>
        <formula>Today()</formula>
        <name>Stamp Signature Detected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Survey_Sent_Date</fullName>
        <field>CNCLCancellation_Survey_Sent__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Survey Sent Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Transaction_Detected</fullName>
        <field>Milestone_AvaTax_First_Transaction__c</field>
        <formula>Today()</formula>
        <name>Stamp Transaction Detected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Support_Product_AvaTax_Returns</fullName>
        <field>CX_911_Support_Product__c</field>
        <literalValue>Avatax Returns</literalValue>
        <name>Support Product AvaTax Returns</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Treasury_Case_Closed</fullName>
        <field>Status</field>
        <literalValue>Resolved (Closed)</literalValue>
        <name>Treasury Case Closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Treasury_Case_Subject_Stamp</fullName>
        <field>Subject</field>
        <formula>Account.Name &amp; &quot; &quot; &amp; Event_Description__c</formula>
        <name>Treasury Case Subject Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Treasury_Services_Email</fullName>
        <description>https://jira.avalara.com/browse/ITBSE-999</description>
        <field>Treasury_Services_Email__c</field>
        <formula>Contact.Email</formula>
        <name>Treasury Services Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateSendCommentEmail</fullName>
        <description>https://jira.avalara.com/browse/IBST-6263</description>
        <field>SendCommenttEmail__c</field>
        <literalValue>0</literalValue>
        <name>UpdateSendCommentEmail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateStatusDate</fullName>
        <field>Status_Set_Date__c</field>
        <formula>NOW()</formula>
        <name>UpdateStatusDate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_AR_Function_for_w9</fullName>
        <field>AR_Functional_Area__c</field>
        <literalValue>Collection</literalValue>
        <name>Update AR Function for w9</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_AR_Reason_for_w9</fullName>
        <field>AR_Reasons__c</field>
        <literalValue>Request W-9</literalValue>
        <name>Update AR Reason for w9</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_AR_product_for_w9</fullName>
        <field>AR_Product__c</field>
        <literalValue>Not Product Specific</literalValue>
        <name>Update AR product for w9</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Closed_Email_Sent</fullName>
        <field>Closed_Case_Alert_Sent_Date__c</field>
        <formula>NOW()</formula>
        <name>Update Closed Email Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_FR_Flag</fullName>
        <field>FR_E__c</field>
        <literalValue>1</literalValue>
        <name>Update FR Flag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Owner_to_Support</fullName>
        <field>OwnerId</field>
        <lookupValue>CustomerSupport</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Update Owner to Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_SendAttachmentEmail</fullName>
        <description>https://jira.avalara.com/browse/IBST-6263</description>
        <field>SendAttachmentEmail__c</field>
        <literalValue>0</literalValue>
        <name>Update SendAttachmentEmail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Service_Category</fullName>
        <field>Product_Category__c</field>
        <literalValue>Service</literalValue>
        <name>Update Service Category</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_StopAssignmentRule</fullName>
        <description>https://jira.avalara.com/browse/IBST-17028</description>
        <field>stopAssignmentRule__c</field>
        <literalValue>0</literalValue>
        <name>Update StopAssignmentRule</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Violation_12_Hours</fullName>
        <field>Next_Violation_Hours__c</field>
        <formula>12</formula>
        <name>Update Violation 12 Hours</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Violation_168</fullName>
        <field>Next_Violation_Hours__c</field>
        <formula>168</formula>
        <name>Update Violation 168</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Violation_6_Hours</fullName>
        <description>Update Violation 6 Hours</description>
        <field>Next_Violation_Hours__c</field>
        <formula>6</formula>
        <name>Update Violation 6 Hours</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_W9_Status</fullName>
        <field>Status</field>
        <literalValue>Resolved (Closed)</literalValue>
        <name>Update W9 Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_W_9_Resolution</fullName>
        <field>Resolution__c</field>
        <formula>&quot;W-9 sent via email&quot; &amp; Resolution__c</formula>
        <name>Update W-9 Resolution</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Watchlist2TeamLeader</fullName>
        <field>WatchList__c</field>
        <literalValue>Team Lead</literalValue>
        <name>WatchList2TeamLeader</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>cam_case</fullName>
        <field>RecordTypeId</field>
        <lookupValue>CAM_Case</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>cam case</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>resetWaiting</fullName>
        <field>Start_Waiting_Workflow__c</field>
        <name>resetWaiting</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <flowActions>
        <fullName>Cancellation_Account_Stamp</fullName>
        <flow>Cancellation_Account_Case_Field_update</flow>
        <flowInputs>
            <name>varAccountid</name>
            <value>{!AccountId}</value>
        </flowInputs>
        <flowInputs>
            <name>varCaseid</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>Cancellation Account Stamp on Case</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>CloseOpenActivitiesonCase</fullName>
        <flow>CloseCaseActivities</flow>
        <flowInputs>
            <name>varCaseIDforActivities</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>CloseOpenActivitiesonCase</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>FT_ChangeOwneronWaiting</fullName>
        <flow>Change_Owner_to_Support_On_Waiting</flow>
        <flowInputs>
            <name>varWaitingCaseID</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>FT_ChangeOwneronWaiting</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>FTforSoho</fullName>
        <flow>Case_Soho_assiggnment</flow>
        <flowInputs>
            <name>varAccountIDfromCaseforSOHO</name>
            <value>{!AccountId}</value>
        </flowInputs>
        <flowInputs>
            <name>varCaseIdforSOHOass</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>FTforSoho`</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>GetCustIntelforCase</fullName>
        <flow>CIwithEntitlements2016v1</flow>
        <flowInputs>
            <name>AccountIDfromCase</name>
            <value>{!AccountId}</value>
        </flowInputs>
        <flowInputs>
            <name>CaseIDforInteloriginal</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>GetCustIntelforCase</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>GetCustIntelforCaseTest</fullName>
        <flow>CIenttestv2</flow>
        <flowInputs>
            <name>AccountIDfromCase</name>
            <value>{!AccountId}</value>
        </flowInputs>
        <flowInputs>
            <name>CaseIDforInteloriginal</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>GetCustIntelforCaseTest</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>QEL</fullName>
        <flow>QEL</flow>
        <flowInputs>
            <name>varCaseIDforQuickEmailUpdate</name>
            <value>{!Id}</value>
        </flowInputs>
        <flowInputs>
            <name>varEmailfromlookupemailld</name>
            <value>{!LookupEmail__c}</value>
        </flowInputs>
        <label>QEL</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>Treasury_Case_Account_Lookup</fullName>
        <description>Used to stamp the new treasury cases with the correct salesforce account that matches the PROD AvaTax Account ID to the incoming Treasury account ID on the case.</description>
        <flow>Treasury_Case_Account_Lookup</flow>
        <flowInputs>
            <name>varCaseid</name>
            <value>{!Id}</value>
        </flowInputs>
        <flowInputs>
            <name>varPRODAccountnumber</name>
            <value>{!Treasury_Account_ID__c}</value>
        </flowInputs>
        <label>Treasury Case Account Lookup</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>UpdateFirstResponseMilestone</fullName>
        <flow>CompleteFirstResponseMilestone</flow>
        <flowInputs>
            <name>varCaseIDforFRMilestoneCompletion</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>UpdateFirstResponseMilestone</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>UpdateTeam</fullName>
        <flow>UpdateOwnerACSTeamName</flow>
        <flowInputs>
            <name>varCaseID</name>
            <value>{!Id}</value>
        </flowInputs>
        <flowInputs>
            <name>varUserID</name>
            <value>{!OwnerId}</value>
        </flowInputs>
        <label>UpdateTeam</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>UpdateWebmailfromMindTouch</fullName>
        <flow>CorrectWebMailfromMindTouch</flow>
        <flowInputs>
            <name>varCaseIDforWebEmailUpdate</name>
            <value>{!Id}</value>
        </flowInputs>
        <flowInputs>
            <name>varEmailfromUserNameField</name>
            <value>{!SuppliedName}</value>
        </flowInputs>
        <flowInputs>
            <name>varSubmittedEmail</name>
            <value>{!SuppliedEmail}</value>
        </flowInputs>
        <label>UpdateWebmailfromMindTouch</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>Update_GoLive_Log_on_Status_Change_or_Contact_Activity</fullName>
        <description>Purpose: Updates the GoLive log when related Case changes Status or has new Contact Activity 
Integrated: No 
Change: Level 0 
Custodian: Golive Director</description>
        <flow>Update_GoLive_Log_on_Status_Change_or_Contact_Activity</flow>
        <flowInputs>
            <name>CaseID</name>
            <value>{!Id}</value>
        </flowInputs>
        <flowInputs>
            <name>CaseStatus</name>
            <value>{!Status}</value>
        </flowInputs>
        <flowInputs>
            <name>CaseSubject</name>
            <value>{!Subject}</value>
        </flowInputs>
        <flowInputs>
            <name>GLIId</name>
            <value>{!Assoc_GoLiveImplementation__c}</value>
        </flowInputs>
        <flowInputs>
            <name>IsClosed</name>
            <value>{!IsClosed}</value>
        </flowInputs>
        <label>Update GoLive Log on Status Change or Contact Activity</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <rules>
        <fullName>AR Leadership Escalation</fullName>
        <actions>
            <name>Raise_AR_Priority_to_critical</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Raise_AR_case_to_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 or 2 or 3 or 4 or 5</booleanFilter>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>equals</operation>
            <value>bill.ingram@avalara.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>equals</operation>
            <value>alan.tang@avalara.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CreatedById</field>
            <operation>equals</operation>
            <value>Bill Ingram</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CreatedById</field>
            <operation>equals</operation>
            <value>Alan Tang</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CreatedById</field>
            <operation>equals</operation>
            <value>Demarcus Wells</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Add Contacts Per Case</fullName>
        <actions>
            <name>Add_1_to_Contacts_per_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Last_Case_Activity__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Assign From FC to Support</fullName>
        <actions>
            <name>Assign_Support_Record_type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Primary_Reason__c</field>
            <operation>notEqual</operation>
            <value>Filing Calendar</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Filing Calendar Case v1</value>
        </criteriaItems>
        <description>The purpose of this workflow is to look at the Filing Calendar type and if Primary Reason &lt;&gt; Filing Calendar, then it changes to the Support type.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Assign From Notice to Support</fullName>
        <actions>
            <name>Assign_Support_Record_type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.CX_911_Support_Reason__c</field>
            <operation>notEqual</operation>
            <value>Notice,Tax Notice,SST Tax Notice</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Notice Case v1</value>
        </criteriaItems>
        <description>The purpose of this workflow is to look at the Notice Case type and if Primary Reason &lt;&gt; Notice Management, then it changes to the Support type.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Assign From RR to Support</fullName>
        <actions>
            <name>Assign_Support_Record_type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>notEqual</operation>
            <value>Returns Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Returns Request Case v1</value>
        </criteriaItems>
        <description>The purpose of this workflow is to look at the Return Case type and if Primary Reason &lt;&gt; Returns Request, then it changes to the Support type.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Assign From Recon to Support</fullName>
        <actions>
            <name>Assign_Support_Record_type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3</booleanFilter>
        <criteriaItems>
            <field>Case.Primary_Reason__c</field>
            <operation>notEqual</operation>
            <value>Reconciliation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Recon Case v1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CX_911_Support_Reason__c</field>
            <operation>notEqual</operation>
            <value>Audit</value>
        </criteriaItems>
        <description>The purpose of this workflow is to look at the Recon Case type and if Primary Reason &lt;&gt; Reconciliation, then it changes to the Support type.
Update: IBST-11001</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Assign Testerina Case to Susan</fullName>
        <actions>
            <name>Assign_Case_to_Susan_Gover</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Customer_Account__c</field>
            <operation>equals</operation>
            <value>Testerina</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Assign to FC Record Type</fullName>
        <actions>
            <name>Change_to_FC_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Primary_Reason__c</field>
            <operation>equals</operation>
            <value>Filing Calendar</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Support Case v1,Support Case v2</value>
        </criteriaItems>
        <description>The purpose of this workflow is to look at the Support Case type and if Primary Reason = Filing Calendar, then it changes to the Filing Calendar type.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Assign to Finance Cancellation Queue</fullName>
        <actions>
            <name>Assign_to_Finance_Cancellation_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Confirmation_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cancellation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Confirmed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Assign to Notice Record Type</fullName>
        <actions>
            <name>Change_to_Notice_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.CX_911_Support_Reason__c</field>
            <operation>equals</operation>
            <value>Notice,Tax Notice,SST Tax Notice</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Support Case v1,Support Case v2</value>
        </criteriaItems>
        <description>The purpose of this workflow is to look at the Support Case type and if Primary Reason = Notice Management, then it changes to the Notice type.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Assign to RR Record Type</fullName>
        <actions>
            <name>Change_to_RR_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Reason_Detail__c</field>
            <operation>equals</operation>
            <value>Returns Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Support Case v1,Support Case v2</value>
        </criteriaItems>
        <description>The purpose of this workflow is to look at the Support Case type and if Primary Reason = Returns Request, then it changes to the Recon type.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Assign to Recon Record Type</fullName>
        <actions>
            <name>Change_to_Recon_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Primary_Reason__c</field>
            <operation>equals</operation>
            <value>Reconciliation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Support Case v2</value>
        </criteriaItems>
        <description>The purpose of this workflow is to look at the Support Case type and if Primary Reason = Reconciliation, then it changes to the Recon type.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Assign to Recon Record Type - audit</fullName>
        <actions>
            <name>Change_to_Recon_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.CX_911_Support_Reason__c</field>
            <operation>equals</operation>
            <value>Audit</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Support Case v2</value>
        </criteriaItems>
        <description>Update: IBST-11001 | Instead of checking &apos;Reason Detail&apos;, check if &apos;Support Reason&apos; is &quot;Audit&quot; in Cases of &quot;Support Case v2&quot; Record Type</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Auto Close Cancellation Case</fullName>
        <actions>
            <name>Set_Status_Resolved_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cancellation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Deprovisioning</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Open_Child_Cases__c</field>
            <operation>equals</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Service_End_Date__c</field>
            <operation>lessThan</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Auto Response%3A Avalara Account Origin</fullName>
        <actions>
            <name>Auto_Response_Avalara_Account_Email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Web - Avalara Account</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>MyLodge</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/CXTECH-7</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Avalara Account -Inbound Comment</fullName>
        <actions>
            <name>Avalara_Account_Email_Inbound_Comment</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>https://help.salesforce.com/articleView?id=000213606&amp;type=1</description>
        <formula>AND(     ISCHANGED(  Avalara_Account_Case_Comment_Inbound__c),     RecordType.Id  &lt;&gt; &quot;012K00000001TGB&quot; )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Avalara Account -Outbound Comment</fullName>
        <actions>
            <name>Avalara_Account_Email_Comment</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>https://help.salesforce.com/articleView?id=000213606&amp;type=1</description>
        <formula>AND(     ISCHANGED( Avalara_Account_Case_Comment__c ),     RecordType.Id  &lt;&gt; &quot;012K00000001TGB&quot; )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>BR-10dayCancel</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Brazil</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Waiting on Customer (Open)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Start_Waiting_Workflow__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Email</field>
            <operation>equals</operation>
            <value>davevt3@gmail.com</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send10DayEmail</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>BR_CLoseCase10day</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Reset_WaitProcessField</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Case.Start_Waiting_Workflow__c</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Billing Contact Queue</fullName>
        <actions>
            <name>Assign_Billing_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Billing Contact</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>C01- Treasury Notification - NOC incorrect Account Number</fullName>
        <actions>
            <name>Treasure_Notification_NOC_C01</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Treasury_Case_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Case.Event_Name__c</field>
            <operation>contains</operation>
            <value>C01</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Treasury Service Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Action__c</field>
            <operation>equals</operation>
            <value>Send Email: Treasury Services Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Treasury_Services_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Resolved (Closed)</value>
        </criteriaItems>
        <description>Send Email notification for NOC C01 Incorrect Account Number	
when new case created with Event codes C01</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>C02- Treasury Notification - NOC incorrect Routing number</fullName>
        <actions>
            <name>Treasure_Notification_NOC_C02</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Treasury_Case_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Case.Event_Name__c</field>
            <operation>contains</operation>
            <value>C02</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Treasury Service Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Action__c</field>
            <operation>equals</operation>
            <value>Send Email: Treasury Services Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Treasury_Services_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Resolved (Closed)</value>
        </criteriaItems>
        <description>Send Email notification for NOC C02 Incorrect Routing number	
when new case created with Event codes C02
Owner Jeff Vendick</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>C03- Treasury Notification - NOC incorrect Routing number</fullName>
        <actions>
            <name>Treasure_Notification_NOC_C03</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Treasury_Case_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Case.Event_Name__c</field>
            <operation>contains</operation>
            <value>C03</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Treasury Service Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Action__c</field>
            <operation>equals</operation>
            <value>Send Email: Treasury Services Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Treasury_Services_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Resolved (Closed)</value>
        </criteriaItems>
        <description>Send Email notification for NOC C03 Incorrect Routing number and Account Number	
when new case created with Event codes C03
Owner Jeff Vendick</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>C3 Phone Call - Set to Self Serve</fullName>
        <actions>
            <name>Assign_to_Monitor</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(RecordType.DeveloperName = &quot;Activation&quot;,  $User.ProfileId = &quot;00e33000000jxK6&quot;, ISCHANGED( Last_Case_Activity__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CAM Case Allert</fullName>
        <actions>
            <name>CAM_Case_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.CAM_Alert__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CAM Case On President WatchList</fullName>
        <actions>
            <name>CAM_Case_on_President_Watchlist</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>CAM Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.WatchList__c</field>
            <operation>equals</operation>
            <value>President</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>CAM Case placed on President Watchlist</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CAM Case On Team Lead Watchlist</fullName>
        <actions>
            <name>CAM_Case_on_Watchlist</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>CAM Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.WatchList__c</field>
            <operation>equals</operation>
            <value>Management,Executive</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>CAM Case placed on Team Lead Watchlist</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CAM Case On VP WatchList</fullName>
        <actions>
            <name>CAM_Case_on_VP_Watchlist</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>CAM Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.WatchList__c</field>
            <operation>equals</operation>
            <value>Vice President</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>CAM Case placed on VP Watchlist</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CAM%2FContact Cancellation Notificaton Survey Returned</fullName>
        <actions>
            <name>Cancellation_CAM_Notification</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Contact_Noification_that_Full_Cancellation_Survey_Received</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Cancellation_Survey_Completed</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.CNCLCancellation_Survey_Received__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cancellation</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CIwithEntTest</fullName>
        <actions>
            <name>GetCustIntelforCaseTest</name>
            <type>FlowAction</type>
        </actions>
        <active>false</active>
        <description>Workflow triggers the customer intelligence widget</description>
        <formula>OR
  (
   (AND
       (
	   ISNEW(),
	   NOT(ISNULL(AccountId)),
       $User.FirstName = &quot;Demarcus&quot;
	   	)
	),
      
	(AND
		(
		ISCHANGED(ContactId),
		$User.FirstName = &quot;Demarcus&quot;
		
		)


     ),
	 (AND
		(
		ISCHANGED(AccountId),
		$User.FirstName = &quot;Demarcus&quot;
		
		)
     )
	  	   
    )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cancel All Products %2B AvaTax</fullName>
        <actions>
            <name>Force_Cancel_AvaTax</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.CNCLCancellation_All_Products__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>contains</operation>
            <value>Avalara AvaTax</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cancel All Products %2B CertCapture</fullName>
        <actions>
            <name>Force_Cancel_CertCapture</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.CNCLCancellation_All_Products__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>contains</operation>
            <value>Avalara CertCapture</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cancel All Products %2B Returns</fullName>
        <actions>
            <name>Force_Cancel_Returns</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.CNCLCancellation_All_Products__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Summary__c</field>
            <operation>contains</operation>
            <value>Avalara Returns</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cancel Notice Received</fullName>
        <actions>
            <name>SetCAMCaseReason2CancelNotice</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>CAM Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Cancellations Inbox</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cancel Notify Date Stamp</fullName>
        <actions>
            <name>Cancel_Notify_Date_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Cancel_Notification_Complete_Activity_Event</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.CNCLCancellation_Survey_Sent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cancellation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Cancel_Notify_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>USed a way to overtly capture &quot;Cancel Notify Date&quot; to support Churn reporting is stamped it the CNCL Combined Cancellation Survey Sent field is popoulated</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cancellation Account Update on Case</fullName>
        <actions>
            <name>Cancellation_Account_Stamp</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cancellation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Flow trigger populates the account ID into the Cancellation Account Field if the case is a cancellation case. This allows a related list for cancellations only to be populated on the account page layout.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cancellation Case moved to Deprovisioning</fullName>
        <actions>
            <name>Customer_facing_email_Cancellation_Finance_Step_Complete</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED( Status ), ISpickval( Status,&quot;Deprovisioning&quot;), RecordTypeId = &quot;01233000000MImT&quot;, Account.Cancellation_Beta__c  = TRUE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cancellation Survey Sent - Second Request</fullName>
        <active>false</active>
        <description>When the cancellation survey has not been responded to after two weeks.</description>
        <formula>And(Not(ISBLANK(CNCLCancellation_Survey_Sent__c)), ISBLANK( CNCLCancellation_Survey_Received__c ),  Account.Cancellation_Beta__c = True)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Cancellation_Survey_Sent_Second_Notice</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Case.CNCLCancellation_Survey_Sent__c</offsetFromField>
            <timeLength>3</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Cancellation Winback Tasks</fullName>
        <actions>
            <name>X3_Month_Cancellation_Winback_Check</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>X6_Month_Cancellation_Winback_Check</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cancellation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CNCL_by_Avalara__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>https://avalara.atlassian.net/wiki/display/CL/Proposed+Cancellation+Case+changes+from+May+2016
Loyalty</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Change Owner on Waiting</fullName>
        <actions>
            <name>Update_Owner_to_Support</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 AND 2 AND 4) OR (1 AND 3 AND 4)</booleanFilter>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Waiting on Customer (Open)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Core_Success_Team__c</field>
            <operation>equals</operation>
            <value>Support Team</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Test Admin</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.ServiceOpsFilter__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CloseWhenSmartTasksComplete</fullName>
        <actions>
            <name>Notify_CAM_Case_Owner_when_case_auto_closed_b_c_smart_tasks_are_complete</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>CloseCAMCaseSuccessful</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>CAM Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SmartTaskCount__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SmartTasksOpen__c</field>
            <operation>equals</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Close_When_SmartTasks_Complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Auto closes the CAM case when all smarttasks associated with the case are closed.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EMEA MRS Registration Case - Stage change to Awaiting Documents</fullName>
        <actions>
            <name>EMEA_CASE_Status_Change_Await_Documen</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Used to track the date the stage changed on an Country Registration case from New to Awaiting Documents
Owner: EMEA - David Van Toor</description>
        <formula>AND( ISCHANGED( Status ),  RecordTypeId = &quot;012330000005hdw&quot;, ISPICKVal(Status,&quot;Awaiting Documents&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EMEA MRS Registration Case - Stage change to Awaiting DocumentsDocument Review</fullName>
        <actions>
            <name>EMEA_CASE_Status_Change_Coc_review</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Used to track the date the stage changed on an Country Registration case from New to Document Review
Owner: EMEA - David Van Toor</description>
        <formula>AND( ISCHANGED( Status ),  RecordTypeId = &quot;012330000005hdw&quot;, ISPICKVal(Status,&quot;Document Review&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EMEA MRS Registration Case - Stage change to Client Review</fullName>
        <actions>
            <name>EMEA_CASE_Status_Change_Client_Review</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Client Review
Owner: EMEA - David Van Toor</description>
        <formula>AND( ISCHANGED( Status ),  RecordTypeId = &quot;012330000005hdw&quot;, ISPICKVal(Status,&quot;Client Review&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EMEA MRS Registration Case - Stage change to Final Document Review</fullName>
        <actions>
            <name>EMEA_CASE_Status_Change_Final_Documen</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Final Document Review
Owner: EMEA - David Van Toor</description>
        <formula>AND( ISCHANGED( Status ),  RecordTypeId = &quot;012330000005hdw&quot;, ISPICKVal(Status,&quot;Final Document Review&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EMEA MRS Registration Case - Stage change to Originals Requested</fullName>
        <actions>
            <name>EMEA_CASE_Status_Change_Originals_Requ</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Originals Requested
Owner: EMEA - David Van Toor</description>
        <formula>AND( ISCHANGED( Status ),  RecordTypeId = &quot;012330000005hdw&quot;, ISPICKVal(Status,&quot;Originals Requested&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EMEA MRS Registration Case - Stage change to Registration pack sent</fullName>
        <actions>
            <name>EMEA_CA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Used to track the date the stage changed on an Country Registration case from New to Registration Pack Sent
Owner: EMEA - David Van Toor</description>
        <formula>AND( ISCHANGED( Status ),  RecordTypeId = &quot;012330000005hdw&quot;, ISPICKVal(Status,&quot;Registration Pack Sent&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EMEA MRS Registration Case - Stage change to Submitted to TO</fullName>
        <actions>
            <name>EMEA_CASE_Status_Change_Submitted_to</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Submitted to TO
Owner: EMEA - David Van Toor</description>
        <formula>AND( ISCHANGED( Status ),  RecordTypeId = &quot;012330000005hdw&quot;, ISPICKVal(Status,&quot;Submitted to TO&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EMEA MRS Registration Case - Stage change to VAT Number Received</fullName>
        <actions>
            <name>EMEA_CASE_Status_Change_VAT_Number_Rec</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>VAT Number Received
Owner: EMEA - David Van Toor</description>
        <formula>AND( ISCHANGED( Status ),  RecordTypeId = &quot;012330000005hdw&quot;, ISPICKVal(Status,&quot;VAT Number Received&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EmailCustomeronClosedCase</fullName>
        <actions>
            <name>SendEmailonClosedCase</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(ISCHANGED(LastCustomerEmailOnClosedCase__c), NOT(ISPICKVAL( Primary_Reason__c , &quot;Notice Management&quot;)),  Closed_Case_Age__c &lt;= 7.0,  RecordType.Id  &lt;&gt; &quot;012K00000001TGB&quot; )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Excise  -Outbound Comment</fullName>
        <actions>
            <name>Excise_Email_Comment</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>https://help.salesforce.com/articleView?id=000213606&amp;type=1</description>
        <formula>AND(     ISCHANGED( Excise_Case_Comment__c  ),      RecordType.Id  &lt;&gt; &quot;012K00000001TGB&quot; )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>ExtractNPSSurveyData</fullName>
        <actions>
            <name>SetNPSProduct</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SetNPSScore</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>NPS Response</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.NPS_Survey_Score__c</field>
            <operation>lessThan</operation>
            <value>0</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Follow Up Auto Task Based</fullName>
        <actions>
            <name>Follow_Up_with_Customer</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Task_Follow_Up__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Force Self-Serve Owner or GLI</fullName>
        <actions>
            <name>Force_Self_Serve</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>GoLive Automation</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>GLI Implementation Case Association Time Trigger AvaTax</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Implementation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Implementation_Product__c</field>
            <operation>equals</operation>
            <value>Avalara AvaTax</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.LastName</field>
            <operation>notEqual</operation>
            <value>Zapf</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/CXTECH-13</description>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>GLI_Association_Trigger</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Maintain_AvaTax_Product</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Maintain_Category_Trigger</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>GLI Implementation Case Association Time Trigger Certs</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Implementation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Implementation_Product__c</field>
            <operation>equals</operation>
            <value>Avalara CertCapture</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.LastName</field>
            <operation>notEqual</operation>
            <value>Zapf</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/CXTECH-13</description>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>GLI_Association_Trigger</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Maintain_Avalara_Product_CertCapture</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Maintain_Category_Trigger</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>GLI Implementation Case Association Time Trigger Returns</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Implementation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Implementation_Product__c</field>
            <operation>equals</operation>
            <value>Avalara Returns</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.LastName</field>
            <operation>notEqual</operation>
            <value>Zapf</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/CXTECH-13</description>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>GLI_Association_Trigger</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Maintain_Avalara_Product_Returns</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Maintain_Category_Trigger</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>GetCaseEnforcement</fullName>
        <actions>
            <name>Reassignment_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Change_Owner_to_Support</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND
(
ISCHANGED(OwnerId),
$User.Alias &lt;&gt; &quot;spere&quot;,
(OR
(/*($User.FirstName = &quot;Demarcus&quot;,*/

$UserRole.Name = &quot;CTEASG: Product Specialist&quot;,
$UserRole.Name = &quot;CTWESG: Product Specialist&quot;,
$UserRole.Name = &quot;CTINSG: Product Specialist&quot;

)),

PRIORVALUE(OwnerId)= &quot;00G3000000159l5&quot;,
(
OR(
Queue_Validation_Value__c &gt; 0.0001,
ISBLANK(Queue_Validation_Value__c) 
)
)

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>GetData_RunCustomerintelligence</fullName>
        <actions>
            <name>GetCustIntelforCase</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <description>Workflow triggers the customer intelligence widget</description>
        <formula>AND
(
ServiceOpsFilter__c = True,

(OR
  (
   (AND
       (
	   ISNEW(),
	   NOT(ISBLANK(AccountId))
	   	)
	),
   	(AND
		(
		ISCHANGED(ContactId),
		NOT(ISBLANK(AccountId))
		
		)
     ),
	 (AND
		(
		ISCHANGED(AccountId),
		NOT(ISBLANK(AccountId))
		)
     ),
	 
	 (AND
		(
		ISCHANGED(RecordTypeId),
		(ISBLANK( EntitlementId ))
		)
     ),

    (AND
		(
		ISCHANGED(Data_Utility__c),
		Data_Utility__c = &quot;runci&quot;
		)
     )
	 
	 
	 
	 
    ))

	)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Initial Cancellation Auto Response</fullName>
        <actions>
            <name>Initial_Cancellation_Auto_Response</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Stamp_Survey_Sent_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Email - Cancellation Beta</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cancellation</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Initial Cancellation Auto Response</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Initial Escalation Date</fullName>
        <actions>
            <name>Change_Status_to_Response_Needed</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Disposition_Date_to_Now_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Initial_Target_Fix</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
ISBLANK(Initial_Target_Fix_Date__c),
ISCHANGED(Adjusted_Fix_Date__c),
NOT(IsClosed = true)
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Jira Notification</fullName>
        <actions>
            <name>Send_Jira_Notification_to_Case_Owner</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>OR
(
ISCHANGED( Last_Jira_Update__c ),
ISCHANGED( Adjusted_Fix_Date__c ),
ISCHANGED( Issue_Status__c )
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Jira URL Update</fullName>
        <actions>
            <name>Create_Jira_URL</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND
(
ISCHANGED(Issue_Number__c),
NOT(ISBLANK(Issue_Number__c))

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Jira Update Status to Respond Needed</fullName>
        <actions>
            <name>Change_Status_to_Response_Needed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updated: IBST-14676, IBST-19545</description>
        <formula>AND( NOT(IsClosed = true), (OR( ISCHANGED(Adjusted_Fix_Date__c), (AND( ISCHANGED(Issue_Status__c), OR(Issue_Status__c = &quot;Open&quot;, Issue_Status__c = &quot;Waiting on Support&quot;)) )) ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>LX - Transfer Compliance</fullName>
        <actions>
            <name>LX_Transfer_Compliance_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Transfer_Compliance__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lightning Transfer Compliance</fullName>
        <actions>
            <name>Lightning_Transer_Compliance</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( Transfer_Compliance__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Maintain Avalara Product AvaTax</fullName>
        <actions>
            <name>Avalara_Product_AvaTax</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Product_Category_Service</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Implementation_Product__c</field>
            <operation>equals</operation>
            <value>Avalara AvaTax</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Implementation</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/CXTECH-13</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Maintain Avalara Product CertCapture</fullName>
        <actions>
            <name>Avalara_Product_CertCapture</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Product_Category_Service</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Implementation_Product__c</field>
            <operation>equals</operation>
            <value>Avalara CertCapture</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Implementation</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/CXTECH-13</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Maintain Avalara Product Returns</fullName>
        <actions>
            <name>Avalara_Product_Returns</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Product_Category_Service</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Implementation_Product__c</field>
            <operation>equals</operation>
            <value>Avalara Returns</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Implementation</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/CXTECH-13</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Mantain GLI CertCapture Lookup</fullName>
        <actions>
            <name>Support_Product_AvaTax_Returns</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Avalara_Product__c</field>
            <operation>equals</operation>
            <value>Avalara Returns</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Milestone Resume</fullName>
        <actions>
            <name>Milestone_Resume</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>In Process - Waiting,Cancellation Pending,Pending AvaTax,Customer Delayed Start</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsStopped</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Milestone Suspend</fullName>
        <actions>
            <name>Milestone_Suspend</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>In Process - Waiting,Cancellation Pending,Pending AvaTax,Customer Delayed Start</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MyLodge Email To Case Defaults</fullName>
        <actions>
            <name>MyLodge_Assign_Member_Services</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MyLodge_Case_Type_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Email</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>MyLodge</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>New Cancellation Case Created</fullName>
        <actions>
            <name>New_Cancellation_Case_Created</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Cancellation</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Notify CAM of New Case</fullName>
        <actions>
            <name>Notify_CAM_of_New_Case</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>CAM Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CreatedById</field>
            <operation>equals</operation>
            <value>Clay Wiggins</value>
        </criteriaItems>
        <description>When a CAM Case is assigned to a CAM, send them then a notification that a Case has been opened in their name</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Notify CX Rep of Case Assignment</fullName>
        <actions>
            <name>Notify_CX_Rep_of_Case_Assignment</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISBLANK( CX_Rep__c ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Prenote Upload Failure - Treasury Notification</fullName>
        <actions>
            <name>Prenote_Upload_Failure</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Treasury_Case_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Case.Event_Name__c</field>
            <operation>equals</operation>
            <value>PrenoteUploadFailure</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Treasury Service Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Action__c</field>
            <operation>equals</operation>
            <value>Send Email: Treasury Services Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Resolved (Closed)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Treasury_Services_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Send Email notification for  Prenote  Failure
when new case created with Return codes &quot;PrenoteUploadFailure&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Q Team Name - CSR</fullName>
        <actions>
            <name>Change_to_Cam_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Team_Name_CSR</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( 
       (BEGINS(OwnerId, &quot;00G&quot;)), 
       ISCHANGED(OwnerId),
       Owner:Queue.QueueName = &quot;CX Queue&quot;,
       RecordType.Id &lt;&gt; &quot;01240000000Ua4xAAC&quot;,
       RecordType.Id &lt;&gt;  &quot;01233000000MImT&quot;,
       RecordType.Id &lt;&gt; &quot;01233000000MImTAAW&quot;, $User.CaseSafeID__c &lt;&gt; &quot;00540000001e3aLAAQ&quot;,
$User.CaseSafeID__c &lt;&gt; &quot;00540000003CzKDAA0&quot;
      )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Q Team Name - CertCapture</fullName>
        <actions>
            <name>Set_Team_Name_CertCapture</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>OR 
( 
  (AND( 
       (BEGINS(OwnerId, &quot;00G&quot;)), 
        ISNEW(),
		Owner:Queue.QueueName = &quot;CEE Queue&quot;
      ) 
  ), 
  (AND( 
       (BEGINS(OwnerId, &quot;00G&quot;)), 
       ISCHANGED(OwnerId),
	   Owner:Queue.QueueName = &quot;CEE Queue&quot;
      ) 
  ) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Q Team Name - Compliance</fullName>
        <actions>
            <name>Set_Team_Name_Compliance</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>OR 
( 
(AND( 
(BEGINS(OwnerId, &quot;00G&quot;)), 
ISNEW(), 
(OR ( 
Owner:Queue.QueueName = &quot;Compliance&quot;, 
Owner:Queue.QueueName = &quot;Compliance Hot Queue&quot;, 
Owner:Queue.QueueName = &quot;Audit/Backfiling&quot;, 
Owner:Queue.QueueName = &quot;Reconciliations&quot;, 
Owner:Queue.QueueName = &quot;Standard Backfiling&quot;, 
Owner:Queue.QueueName = &quot;Backfiling Review&quot;, 
Owner:Queue.QueueName = &quot;SAS Queue&quot;, 
Owner:Queue.QueueName = &quot;Notices&quot;, 
Owner:Queue.QueueName = &quot;EFile Documents&quot;, 
Owner:Queue.QueueName = &quot;Treasury Queue&quot;, 
Owner:Queue.QueueName = &quot;Fuel Excise Tax Queue&quot;

) 
) 

) 
), 
(AND( 
(BEGINS(OwnerId, &quot;00G&quot;)), 
ISCHANGED(OwnerId), 
(OR ( 
Owner:Queue.QueueName = &quot;Compliance&quot;, 
Owner:Queue.QueueName = &quot;Compliance Hot Queue&quot;, 
Owner:Queue.QueueName = &quot;Audit/Backfiling&quot;, 
Owner:Queue.QueueName = &quot;Reconciliations&quot;, 
Owner:Queue.QueueName = &quot;Standard Backfiling&quot;, 
Owner:Queue.QueueName = &quot;Backfiling Review&quot;, 
Owner:Queue.QueueName = &quot;SAS Queue&quot;, 
Owner:Queue.QueueName = &quot;Notices&quot;, 
Owner:Queue.QueueName = &quot;EFile Documents&quot;, 
Owner:Queue.QueueName = &quot;Treasury Queue&quot;, 
Owner:Queue.QueueName = &quot;Fuel Excise Tax Queue&quot;
) 
)	
) 
) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Q Team Name - Customer Support</fullName>
        <actions>
            <name>Clear_Pulled_by</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear_Pulled_by_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Team_Name_Customer_Support</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>OR 
( 
(AND( 
(BEGINS(OwnerId, &quot;00G&quot;)), 
ISNEW(), 
(OR ( 
Owner:Queue.QueueName = &quot;Customer Support&quot;, 
Owner:Queue.QueueName = &quot;Shift Queue&quot;, 
Owner:Queue.QueueName = &quot;Onsite&quot; 
) 
) 

) 
), 
(AND( 
(BEGINS(OwnerId, &quot;00G&quot;)), 
ISCHANGED(OwnerId), 
(OR ( 
Owner:Queue.QueueName = &quot;Customer Support&quot;, 
Owner:Queue.QueueName = &quot;Shift Queue&quot;, 
Owner:Queue.QueueName = &quot;Onsite&quot; 
) 
)	
) 
),
(AND
(
Owner:Queue.QueueName = &quot;Customer Support&quot;,
  ISCHANGED( LastModifiedDate ) 

)
)
 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Q Team Name - Escalations</fullName>
        <actions>
            <name>Set_Team_Name_Escalations</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>OR 
( 
  (AND( 
       (BEGINS(OwnerId, &quot;00G&quot;)), 
        ISNEW(),
        (OR (
		  Owner:Queue.QueueName = &quot;Escalations&quot;,
		  Owner:Queue.QueueName = &quot;MicrosoftNetsuite&quot;
		     )
		)
					
      ) 
  ), 
  (AND( 
       (BEGINS(OwnerId, &quot;00G&quot;)), 
       ISCHANGED(OwnerId),
	   (OR (
		  Owner:Queue.QueueName = &quot;Escalations&quot;,
		  Owner:Queue.QueueName = &quot;MicrosoftNetsuite&quot;
		     )
		)	
      ) 
  ) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Q Team Name - Zytax</fullName>
        <actions>
            <name>Change_to_Zytax_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND
( 
(BEGINS(OwnerId, &quot;00G&quot;)), 

(
OR
(
Owner:Queue.QueueName = &quot;Zytax Queue&quot;,
Owner:Queue.QueueName = &quot;Fuel Excise Tax Queue&quot;,
Owner:User.Full_Name__c = &quot;Naomi Bruening&quot;,
Owner:User.Full_Name__c = &quot;Kadia Puetz&quot;,
Owner:User.Full_Name__c = &quot;Sharon Zellner&quot;,
Owner:User.Full_Name__c = &quot;Peggy Zenko&quot;,
Owner:User.Full_Name__c = &quot;Brian Hulse&quot;

)),

(OR(ISCHANGED(OwnerId), ISNEW()) ) 
    


)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>QuickStart Assignment Override</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.Agent_Rank__c</field>
            <operation>equals</operation>
            <value>4</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>R01 - Treasury Notification - insufficient Funds</fullName>
        <actions>
            <name>R01_Treasury_Notification_Invalid_Account_Number_or_No_Account_Cannot_Locate</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Treasury_Case_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Case.Event_Name__c</field>
            <operation>contains</operation>
            <value>R01</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Treasury Service Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Action__c</field>
            <operation>equals</operation>
            <value>Send Email: Treasury Services Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Treasury_Services_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Resolved (Closed)</value>
        </criteriaItems>
        <description>Send Email notification for Notification INsufficient Funds	
when new case created with Return codes R01
Owner Jeff Vendick</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>R02 - Treasury Notification - Notification Account Closed</fullName>
        <actions>
            <name>R02_Treasury_Notification_Account_Closed</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Treasury_Case_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Case.Event_Name__c</field>
            <operation>contains</operation>
            <value>R02</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Treasury Service Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Action__c</field>
            <operation>equals</operation>
            <value>Send Email: Treasury Services Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Treasury_Services_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Resolved (Closed)</value>
        </criteriaItems>
        <description>Send Email notification for Notification Account Closed	
when new case created with Return codes R02
Owner Jeff Vendick</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>R03 - Treasury Notification -  No Account%2FCannot Locate</fullName>
        <actions>
            <name>R03_Treasury_Notification_Invalid_Account_Number_or_No_Account_Cannot_Locate</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Treasury_Case_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Case.Event_Name__c</field>
            <operation>equals</operation>
            <value>R03</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Treasury Service Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Action__c</field>
            <operation>equals</operation>
            <value>Send Email: Treasury Services Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Treasury_Services_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Resolved (Closed)</value>
        </criteriaItems>
        <description>Send Email notification  No Account/Cannot Locate	
when new case created with Return codes R03, 
Owner Jeff Vendick</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>R04 Treasury Notification - Invalid Account Number or No Account%2FCannot Locate</fullName>
        <actions>
            <name>Treasury_Notification_Invalid_Account_Number_or_No_Account_Cannot_Locate</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Treasury_Case_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Case.Event_Name__c</field>
            <operation>equals</operation>
            <value>R04</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Treasury Service Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Action__c</field>
            <operation>equals</operation>
            <value>Send Email: Treasury Services Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Treasury_Services_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Resolved (Closed)</value>
        </criteriaItems>
        <description>Send Email notification for Invalid Account Number or No Account/Cannot Locate	
when new case created with Return codes R04
Owner Jeff Vendick</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>R08 Finance Treasury Notification - Payment Stopped</fullName>
        <actions>
            <name>R08_Finance_Treasury_Notification_Payment_Stopped</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Treasury_Case_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Case.Event_Name__c</field>
            <operation>equals</operation>
            <value>R08</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Treasury Service Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Action__c</field>
            <operation>equals</operation>
            <value>Send Email: Treasury Services Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Treasury_Services_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Resolved (Closed)</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/ITBSE-999</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>R09 %E2%80%93 Uncollected Funds</fullName>
        <actions>
            <name>R09_Uncollected_Funds</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Treasury_Case_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Case.Event_Name__c</field>
            <operation>equals</operation>
            <value>R09</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Treasury Service Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Action__c</field>
            <operation>equals</operation>
            <value>Send Email: Treasury Services Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Treasury_Services_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Resolved (Closed)</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/ITBSE-999</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>R13 %E2%80%93 Invalid ACH Routing No</fullName>
        <actions>
            <name>R13_Invalid_ACH_Routing_No</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Treasury_Case_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Case.Event_Name__c</field>
            <operation>equals</operation>
            <value>R13</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Treasury Service Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Action__c</field>
            <operation>equals</operation>
            <value>Send Email: Treasury Services Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Treasury_Services_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Resolved (Closed)</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/ITBSE-999</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>R16 Treasury Notification - Acct Froz</fullName>
        <actions>
            <name>Treasury_Notification_Acct_Froz</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Treasury_Case_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Case.Event_Name__c</field>
            <operation>equals</operation>
            <value>R16</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Treasury Service Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Action__c</field>
            <operation>equals</operation>
            <value>Send Email: Treasury Services Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Treasury_Services_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Resolved (Closed)</value>
        </criteriaItems>
        <description>Send Email notification for Unauthorized Corporate Transaction when new case created with Return codes R16
Owner Jeff Vendick</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>R20 %E2%80%93 Non Transaction Account</fullName>
        <actions>
            <name>R20_Non_Transaction_Account</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Treasury_Case_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Case.Event_Name__c</field>
            <operation>equals</operation>
            <value>R20</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Treasury Service Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Action__c</field>
            <operation>equals</operation>
            <value>Send Email: Treasury Services Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Treasury_Services_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Resolved (Closed)</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/ITBSE-999</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>R29 Treasury Notification - Unauth%2E Corp transaction</fullName>
        <actions>
            <name>Treasury_Notification_Unauthorized_Corporate_Transaction</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Treasury_Case_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Case.Event_Name__c</field>
            <operation>equals</operation>
            <value>R29</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Treasury Service Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Action__c</field>
            <operation>equals</operation>
            <value>Send Email: Treasury Services Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Treasury_Services_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Resolved (Closed)</value>
        </criteriaItems>
        <description>Send Email notification for Unauthorized Corporate Transaction when new case created with Return codes R29
Owner Jeff Vendick</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Registration Country Subject Override</fullName>
        <actions>
            <name>Registration_Country_Subject_Override</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>MRS Registration Country</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.CreatedById</field>
            <operation>equals</operation>
            <value>Salesforce Admin User</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Reopened</fullName>
        <actions>
            <name>SetReopened</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Reopened</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Reset WatchList Reason</fullName>
        <actions>
            <name>Reset_WatchList_Reason</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.WatchList__c</field>
            <operation>equals</operation>
            <value>Case Owner</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Self Help Deflection Update</fullName>
        <actions>
            <name>CloseDeflectedcase</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SetDeflected</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(

RecordType.Name = &quot;Self Help v1&quot;,
ISNEW(),
CONTAINS(Description, &quot;Feedback: yes&quot;) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send Closed Case Notification to Customers</fullName>
        <actions>
            <name>NotifyCustomersofofClosedCase</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Closed_Email_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(   ServiceOpsFilter__c = True,   (OR( LEFT(Owner:User.RoleName__c, 2)= &quot;CT&quot;,  Owner:User.RoleName__c =&quot;GoLive Coordinator&quot;, Owner:User.RoleName__c=&quot;Director of Implementation&quot;, BEGINS(Owner:User.RoleName__c, &quot;SOHO&quot;))),  (OR(  TEXT(Status) = &quot;Resolved (Closed)&quot;,  TEXT(Status) = &quot;Resolved (Closed) - FCR&quot; )),   NOT(TEXT(Origin) = &quot;Internal&quot;),  MGR_Don_t_Send__c = False,   NOT(TEXT(Reason_Detail__c)=&quot;Filing Calendar update&quot;),  NOT(TEXT(Reason_Detail__c)=&quot;Rebuild Request&quot;),  NOT(TEXT(Primary_Reason__c)=&quot;Notice Management&quot;),  RecordType.Id  &lt;&gt; &quot;012K00000001TGB&quot;   )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send Notice Logged Ack</fullName>
        <actions>
            <name>Send_Notice_Logged_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Flag_Notice_Logged</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND (4 OR 5) AND 6</booleanFilter>
        <criteriaItems>
            <field>Case.CX_911_Support_Reason__c</field>
            <operation>equals</operation>
            <value>Notice,Tax Notice,SST Tax Notice</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Notice__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.IsClosed</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Notice_QTY_Logged__c</field>
            <operation>greaterOrEqual</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Notice_QTY_Dups__c</field>
            <operation>greaterOrEqual</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>MyLodge</value>
        </criteriaItems>
        <description>Send an automated email message to customers when a notice is logged.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send Notice Received Ack</fullName>
        <actions>
            <name>Send_Notice_Received_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Flag_Notice_Received</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Case.CX_911_Support_Reason__c</field>
            <operation>equals</operation>
            <value>Notice,Tax Notice,SST Tax Notice</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Notice_Ack_Received__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Notice_QTY__c</field>
            <operation>greaterOrEqual</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Email</field>
            <operation>notContain</operation>
            <value>@avalara.com</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>MyLodge</value>
        </criteriaItems>
        <description>Send an automated email message to customers when a notice is triage.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Send W-9</fullName>
        <actions>
            <name>Send_W_9_to_Case_Contact</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Send_W_9_to_Case_Owner</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Set_W9_Date_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_AR_Function_for_w9</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_AR_Reason_for_w9</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_AR_product_for_w9</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_W9_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_W_9_Resolution</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Date_W_9_Sent__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.ContactEmail</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Send_W_9__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SendAttachmentEmail</fullName>
        <actions>
            <name>Excise_Custom_Notifications_Case_attachment_Update</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_SendAttachmentEmail</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.SendAttachmentEmail__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/IBST-6263</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SendCaseCommentEmail</fullName>
        <actions>
            <name>Excise_Custom_Notifications_Case_Comment_Update</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>UpdateSendCommentEmail</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.SendCommenttEmail__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>notEqual</operation>
            <value>Web - Avalara Account</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/IBST-6263</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set AR Case Rank</fullName>
        <actions>
            <name>Set_Case_Rank_for_AR_back</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Email – Accounting,Email – Accounting Excise,Email – Accounts Receivable,Email - PartnerCommissons</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Set Deletes to Dups</fullName>
        <actions>
            <name>Set_Status_to_Duplicate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Delete</value>
        </criteriaItems>
        <description>Temporary workflow for excise deletes</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Escalation Date WrkArnd</fullName>
        <actions>
            <name>Set_Escalation_Date_Field_to_Now</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Workflow to set Escalation Date</description>
        <formula>AND
(
ISCHANGED( Issue_Number__c ),
ISBLANK(PRIORVALUE(Issue_Number__c)) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Owner Change</fullName>
        <actions>
            <name>Set_Ent_Fix_Date_Time</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(OwnerId)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Watchlist Default If None</fullName>
        <actions>
            <name>Set_Watchlist_To_CaseOwner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.WatchList__c</field>
            <operation>notEqual</operation>
            <value>Vice President,President,Team Lead,Case Owner</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>SetInitialTargetResponseDate%28CAM%29</fullName>
        <actions>
            <name>SetTargetResponseDateForNewCAMCase</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>CAM Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <description>Set Initial Target Response Date for Create Date + 1 for new CAM Cases</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>SetStatusChangeDate</fullName>
        <actions>
            <name>UpdateStatusDate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(
ISNEW(),
ISCHANGED(Status) 


)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp JIRA Assignee Date</fullName>
        <actions>
            <name>Stamp_JIRA_Assignee_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.JiraAssignee__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp JIRA Classified Date</fullName>
        <actions>
            <name>Stamp_JIRA_Classified_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Issue_Type__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp JIRA Initial Release Date</fullName>
        <actions>
            <name>Stamp_Release_Date_Given</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.JIRA_Release_Date_Given__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Initial_Target_Fix_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/IBST-14877</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>StopAssignementRule</fullName>
        <actions>
            <name>Update_StopAssignmentRule</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.stopAssignmentRule__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/IBST-17028</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TAM Alert</fullName>
        <actions>
            <name>Send_TAM_Alert_Template</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Copy_TAM_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Workflow triggers the TAM alert</description>
        <formula>AND
(
 NOT(ISBLANK(TAM_emailreference__c)),

(OR
  (
   (AND
       (
	   ISNEW(),
	   NOT(ISBLANK(AccountId))
	   	)
	),
   	(AND
		(
		ISCHANGED(ContactId),
		NOT(ISBLANK(AccountId))
		
		)
     ),
	 (AND
		(
		ISCHANGED(AccountId),
		NOT(ISBLANK(AccountId))
		)
     )
    ))
	)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Temp ITNo Reply Fix</fullName>
        <actions>
            <name>Change_Owner_Delete</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.SuppliedEmail</field>
            <operation>equals</operation>
            <value>avalarait-noreply@avalara.com</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Track Target Change Count</fullName>
        <actions>
            <name>Add_1_to_Target_Change_Count</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Adjusted_Fix_Date__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Treasury Case Subject Stamp</fullName>
        <actions>
            <name>Treasury_Case_Subject_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>And(  ISBLANK( Subject),  Not(  ISNULL( AccountId )) ,  RecordTypeId = &quot;012330000005huY&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Treasury Services Email</fullName>
        <actions>
            <name>Treasury_Services_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Email</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/ITBSE-999</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Activity On Direct Cases</fullName>
        <actions>
            <name>Add_1_to_Contacts_per_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_LCA_T</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Last_Contact_Activity</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Phone,Chat</value>
        </criteriaItems>
        <description>Phone and Chat</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update CAM Record Type from Support</fullName>
        <actions>
            <name>Change_to_Cam_Case</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( 
       ISCHANGED(OwnerId),
       RecordType.DeveloperName = &quot;Support_Case_v2&quot;,
       PRIORVALUE(Core_Success_Team__c) = &quot;Support Team&quot;,
       Core_Success_Team__c = &quot;CAM Team&quot;  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Status when assigned to CEE</fullName>
        <actions>
            <name>Change_Status_to_Submitted_to_CEE</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>CEE Queue</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>UpdateOwnerACSTeam - On New</fullName>
        <actions>
            <name>UpdateTeam</name>
            <type>FlowAction</type>
        </actions>
        <active>false</active>
        <description>This workflow assigns the CSI Team name from the case owners profile to the case, whenever a case is created directly</description>
        <formula>(AND( 
       (BEGINS(OwnerId, &quot;005&quot;)), 
        ISNEW() 
      ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>UpdateOwnerACSTeam - OnChange</fullName>
        <actions>
            <name>Send_Case_Owner_a_Notification</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>This workflow assigns the CSI Team name from the case owners profile to the case, whenever a case is reassigned to a user.  This workflow also sends a notification to the new owner by default</description>
        <formula>AND( 
       (BEGINS(OwnerId, &quot;005&quot;)), 
       ISCHANGED(OwnerId) 
      )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Waiting On Customer Workflow</fullName>
        <actions>
            <name>Clear_Case_Rank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Start_Waiting_Workflow</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND 2 AND 3) OR (1 AND 4) OR (1 AND 5)</booleanFilter>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Waiting on Customer (Open)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Core_Success_Team__c</field>
            <operation>equals</operation>
            <value>Support Team</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.ServiceOpsFilter__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Nobody</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerCSITeamActive__c</field>
            <operation>equals</operation>
            <value>SOHOWE</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>WOC_3rd_Notification</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Set_Sent_Waiting_Email_Date</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Set_Status_to_No_Response_Closed</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>WOC_2nd_Notification</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Set_Sent_Waiting_Email_Date</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>3</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>WOC_1st_Notification</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Set_Sent_Waiting_Email_Date</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Waiting On Customer Workflow - Compliance</fullName>
        <actions>
            <name>Clear_Case_Rank</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Start_Waiting_Workflow</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND 2 AND 3) OR (1 AND 4)</booleanFilter>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>equals</operation>
            <value>Waiting on Customer (Open)</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Core_Success_Team__c</field>
            <operation>equals</operation>
            <value>Compliance</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.ServiceOpsFilter__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.OwnerId</field>
            <operation>equals</operation>
            <value>Demarcus Wells</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>WOC_2nd_Notification</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Set_Sent_Waiting_Email_Date</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>3</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>WOC_1st_Notification</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Set_Sent_Waiting_Email_Date</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>WOC_3rd_Notification</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Set_Sent_Waiting_Email_Date</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Set_Status_to_No_Response_Closed</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Web to Case Count Correction</fullName>
        <actions>
            <name>Set_Contact_Per_Case_to_0</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Target_Change_Count_to_0</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>UpdateWebmailfromMindTouch</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.Origin</field>
            <operation>equals</operation>
            <value>Web to case</value>
        </criteriaItems>
        <description>Workflow to correct the issue where default numerical values don&apos;t get created when cases are created via Web to Case.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>WireException - Treasury Notification</fullName>
        <actions>
            <name>WireException_Treasury_Notification</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Treasury_Case_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>Case.Event_Name__c</field>
            <operation>contains</operation>
            <value>WireException</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.RecordTypeId</field>
            <operation>equals</operation>
            <value>Treasury Service Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Subject</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Case_Action__c</field>
            <operation>equals</operation>
            <value>Send Email: Treasury Services Case</value>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Treasury_Services_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Case.Status</field>
            <operation>notEqual</operation>
            <value>Resolved (Closed)</value>
        </criteriaItems>
        <description>Send Email notification for  WireException
when new case created with Return codes &quot;WireExecption&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>CAM_Implementation_Violation_Pending_Account_Activation</fullName>
        <assignedTo>aaron.zapf@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>CAM Implementation Violation - Account Activation</subject>
    </tasks>
    <tasks>
        <fullName>Cancel_Notification_Complete_Activity_Event</fullName>
        <assignedToType>owner</assignedToType>
        <description>Cancel Notification Complete Activity Event</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Cancel Notification Complete Activity Event</subject>
    </tasks>
    <tasks>
        <fullName>Cancellation_Survey_Completed</fullName>
        <assignedToType>owner</assignedToType>
        <description>Cancellation Survey Completed</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Cancellation Survey Completed</subject>
    </tasks>
    <tasks>
        <fullName>Follow_Up_with_Customer</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Case.Task_Follow_Up__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow Up on Case</subject>
    </tasks>
    <tasks>
        <fullName>Implementation_Violation_Account_Activation</fullName>
        <assignedToType>owner</assignedToType>
        <description>Implementation Violation - Account Activation</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Implementation Violation - Account Activation</subject>
    </tasks>
    <tasks>
        <fullName>Implementation_Violation_Company_Setup</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Implementation Violation - Company Setup</subject>
    </tasks>
    <tasks>
        <fullName>Implementation_Violation_Nexus_Setup</fullName>
        <assignedToType>owner</assignedToType>
        <description>Implementation Violation - Nexus Setup</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Implementation Violation - Nexus Setup</subject>
    </tasks>
    <tasks>
        <fullName>Implementation_Violation_Pending_CertCapture_Document_Upload</fullName>
        <assignedToType>owner</assignedToType>
        <description>Implementation Violation Pending - CertCapture Document Upload</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Implementation Violation Pending - CertCapture Document Upload</subject>
    </tasks>
    <tasks>
        <fullName>Implementation_Violation_Signature_Detected</fullName>
        <assignedToType>owner</assignedToType>
        <description>Implementation Violation - Signature Detected</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Implementation Violation - Signature Detected</subject>
    </tasks>
    <tasks>
        <fullName>Implementation_Violation_Transaction_Detected</fullName>
        <assignedToType>owner</assignedToType>
        <description>Implementation Violation  - Transaction Detected</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Implementation Violation - Transaction Detected</subject>
    </tasks>
    <tasks>
        <fullName>Implementation_Violation_TrustFile_Amazon_Nexus_Setup</fullName>
        <assignedToType>owner</assignedToType>
        <description>Implementation Violation TrustFile Amazon Nexus Setup</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Implementation Violation TrustFile Amazon Nexus Setup</subject>
    </tasks>
    <tasks>
        <fullName>Implementation_Violation_TrustFile_Amazon_Return_1st_Filing</fullName>
        <assignedToType>owner</assignedToType>
        <description>Implementation Violation TrustFile Amazon Return 1st Filing</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Implementation Violation TrustFile Amazon Return 1st Filing</subject>
    </tasks>
    <tasks>
        <fullName>Implementation_Violation_TrustFile_Amazon_Return_Generation</fullName>
        <assignedToType>owner</assignedToType>
        <description>Implementation Violation TrustFile Amazon Return Generation</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Implementation Violation TrustFile Amazon Return Generation</subject>
    </tasks>
    <tasks>
        <fullName>Implementation_Violation_TrustFile_Amazon_States_Setup</fullName>
        <assignedToType>owner</assignedToType>
        <description>Implementation Violation TrustFile Amazon States Setup</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Implementation Violation TrustFile Amazon States Setup</subject>
    </tasks>
    <tasks>
        <fullName>Implementation_Violation_for_CertCapture_Live_Event</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Implementation Violation for CertCapture Live Event</subject>
    </tasks>
    <tasks>
        <fullName>Implementation_Violation_for_Connector_Event</fullName>
        <assignedToType>owner</assignedToType>
        <description>Implementation Violation for Connector Event</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Implementation Violation for Connector Event</subject>
    </tasks>
    <tasks>
        <fullName>Implementation_Violation_for_TrustFile_Event</fullName>
        <assignedToType>owner</assignedToType>
        <description>Implementation Violation for TrustFile Event</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Implementation Violation for TrustFile Event</subject>
    </tasks>
    <tasks>
        <fullName>OpenGoLiveCase</fullName>
        <assignedTo>bob.waite@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Open GoLive Case</subject>
    </tasks>
    <tasks>
        <fullName>Sales_Escalation_No_Account_Activation</fullName>
        <assignedTo>aaron.zapf@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Sales Escalation - No Account Activation</subject>
    </tasks>
    <tasks>
        <fullName>Task_Testing_Feedback_Form</fullName>
        <assignedTo>andrea.anderson@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Testing Feedback Form</subject>
    </tasks>
    <tasks>
        <fullName>TrustFile_for_Amazon_Onboarding_Call_Followup</fullName>
        <assignedToType>owner</assignedToType>
        <description>This is the 3 day warning for the TrustFile Amazon onboarding call setup. The milestone has not been completed and is due in two more days. Please reach out to connect with the customer.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>TrustFile for Amazon Onboarding Call Followup</subject>
    </tasks>
    <tasks>
        <fullName>TrustFile_for_Amazon_Onboarding_Call_Followup_Owner</fullName>
        <assignedToType>owner</assignedToType>
        <description>This is the 6 day warning for the TrustFile Amazon onboarding call setup. The milestone has not been completed and was due yesterday.. a violation has now occurred for this account.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>TrustFile for Amazon Onboarding Call Followup Sales</subject>
    </tasks>
    <tasks>
        <fullName>X3_Month_Cancellation_Winback_Check</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>3 Month Cancellation Winback Check</description>
        <dueDateOffset>90</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>3 Month Cancellation Winback Check</subject>
    </tasks>
    <tasks>
        <fullName>X6_Month_Cancellation_Winback_Check</fullName>
        <assignedToType>accountOwner</assignedToType>
        <description>6 Month Cancellation Winback Check</description>
        <dueDateOffset>180</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>6 Month Cancellation Winback Check</subject>
    </tasks>
    <tasks>
        <fullName>do_this</fullName>
        <assignedTo>bob.waite@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>now.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>do this</subject>
    </tasks>
</Workflow>
