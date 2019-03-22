<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Alert_PS_GoLive_Created</fullName>
        <description>Alert PS GoLive Created</description>
        <protected>false</protected>
        <recipients>
            <recipient>service-ops@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/New_PS_GoLive_Assignment_Required</template>
    </alerts>
    <alerts>
        <fullName>Alert_no_Primary_Contact</fullName>
        <description>Alert no Primary Contact</description>
        <protected>false</protected>
        <recipients>
            <recipient>clayton.wiggins@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/No_Primary_GoLive_Contact</template>
    </alerts>
    <alerts>
        <fullName>Calc_Slipped_Email_Alert</fullName>
        <description>Calc Slipped Email Alert</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/Notify_CAM_of_Slipped_Timeline</template>
    </alerts>
    <alerts>
        <fullName>Coordinator_Alert</fullName>
        <description>Coordinator Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/NotifyNewGoLiveICoordinator</template>
    </alerts>
    <alerts>
        <fullName>Docs_failed_validation</fullName>
        <description>Docs failed validation</description>
        <protected>false</protected>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/GLCNtofyFailed</template>
    </alerts>
    <alerts>
        <fullName>Dynamics_GP_Welcome_Letter</fullName>
        <description>Dynamics GP Welcome Letter</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/New_Welcome_Letter_DynamicsGP</template>
    </alerts>
    <alerts>
        <fullName>Full_Serve_Welcome_Letter</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Full Serve Welcome Letter</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/V2MASERFULLSERVE</template>
    </alerts>
    <alerts>
        <fullName>Full_Service_Welcome</fullName>
        <description>Full Service Welcome</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/NewGoLive_Full_Service_Welcome_Letter</template>
    </alerts>
    <alerts>
        <fullName>GoLiveUnresponsive15</fullName>
        <description>GoLiveUnresponsive15</description>
        <protected>false</protected>
        <recipients>
            <field>OppOwner_Mgr_email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Templates/GoliveUnresponsive</template>
    </alerts>
    <alerts>
        <fullName>GoLiveUnresponsive1st</fullName>
        <description>GoLiveUnresponsive1st</description>
        <protected>false</protected>
        <recipients>
            <field>Sales_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>GoLive_Templates/GoliveUnresponsive</template>
    </alerts>
    <alerts>
        <fullName>GoLiveUnresponsive30</fullName>
        <description>GoLiveUnresponsive30</description>
        <protected>false</protected>
        <recipients>
            <field>OppOwner_Mgr_email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Templates/GoliveUnresponsive</template>
    </alerts>
    <alerts>
        <fullName>GoLiveUnresponsive45</fullName>
        <description>GoLiveUnresponsive45</description>
        <protected>false</protected>
        <recipients>
            <field>OppOwner_Mgr_email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Sales_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>jay.deubler@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Templates/GoliveUnresponsive</template>
    </alerts>
    <alerts>
        <fullName>GoLiveUnresponsiveTEST</fullName>
        <ccEmails>dawells13@gmail.com</ccEmails>
        <description>GoLiveUnresponsiveTEST</description>
        <protected>false</protected>
        <recipients>
            <recipient>demarcus.wells@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>GoLive_Templates/GoliveUnresponsive</template>
    </alerts>
    <alerts>
        <fullName>GoLive_Entitlement_Expiration_Workfkow</fullName>
        <description>GoLive Entitlement Expiration Workfkow</description>
        <protected>false</protected>
        <recipients>
            <recipient>demarcus.wells@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>GoLive_Templates/GoLiveEntitlementAlert_Expiration</template>
    </alerts>
    <alerts>
        <fullName>GoLive_Entitlement_Path_Workfkow</fullName>
        <description>GoLive Entitlement Path Workfkow</description>
        <protected>false</protected>
        <recipients>
            <recipient>demarcus.wells@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>GoLive_Templates/GoLiveEntitlementAlert_PathSet</template>
    </alerts>
    <alerts>
        <fullName>GoLive_SetLive_Enforcement</fullName>
        <ccEmails>dawells13@gmail.com</ccEmails>
        <description>GoLive SetLive Enforcement</description>
        <protected>false</protected>
        <recipients>
            <field>LastModifiedById</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Templates/Set_Calc_Live</template>
    </alerts>
    <alerts>
        <fullName>Hubsoft_Welcome_Letter</fullName>
        <description>Hubsoft Welcome Letter</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/New_Welcome_Letter_Hubsoft</template>
    </alerts>
    <alerts>
        <fullName>Keystone_Welcome_Letter</fullName>
        <description>Keystone Welcome Letter</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/FASTSIGNSKEYSTONE</template>
    </alerts>
    <alerts>
        <fullName>MASS_Calc_No_estimate_Email</fullName>
        <description>MASS: Calc – No estimate Email</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/NewForecastCalcRequest</template>
    </alerts>
    <alerts>
        <fullName>MASS_Filing_Date_This_Month</fullName>
        <description>MASS: Filing Date This Month</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_Compliance_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>New_GoLive_Templates/AVA_Returns_Confirm_This_Month</template>
    </alerts>
    <alerts>
        <fullName>MASS_Forects_Calc_Estimation_Confirmatiion</fullName>
        <description>MASS: Forects Calc Estimation Confirmatiion</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_Compliance_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/NewForecastCalc</template>
    </alerts>
    <alerts>
        <fullName>MASS_Returns_Intentions_a_b_c</fullName>
        <description>MASS: Returns Intentions (a,b,c)</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_Compliance_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/NewForecastReturnsRequest</template>
    </alerts>
    <alerts>
        <fullName>MASS_Send_email_invitation_to_Magento_webinar</fullName>
        <description>MASS: Send email invitation to Magento webinar</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>New_GoLive_Templates/Getting_Started_with_AvaTax_for_Magento</template>
    </alerts>
    <alerts>
        <fullName>MASS_Send_email_invitation_to_QuickBooks_webinar</fullName>
        <description>MASS: Send email invitation to QuickBooks webinar</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>New_GoLive_Templates/Getting_Started_with_AvaTax_for_QuickBooks</template>
    </alerts>
    <alerts>
        <fullName>Magento_Welcome_Letter</fullName>
        <description>Magento Welcome Letter</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/New_Welcome_Letter_Magento</template>
    </alerts>
    <alerts>
        <fullName>New_GoLive_Addon_Created_Alert</fullName>
        <description>New GoLive Addon Created Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>aaron.zapf@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/New_GoLive_Assignment_Required_Addon</template>
    </alerts>
    <alerts>
        <fullName>New_GoLive_Addon_Created_Alert2</fullName>
        <description>New GoLive Addon Created Alert2</description>
        <protected>false</protected>
        <recipients>
            <recipient>aaron.zapf@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>clayton.wiggins@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sean.compton@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/New_GoLive_Assignment_Required_Addon</template>
    </alerts>
    <alerts>
        <fullName>New_GoLive_Created_Alert</fullName>
        <description>New GoLive Created Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>aaron.zapf@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>clayton.wiggins@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/New_PS_GoLive_Assignment_Required</template>
    </alerts>
    <alerts>
        <fullName>New_GoLive_Created_Alert2</fullName>
        <ccEmails>onboarding@avalara.com</ccEmails>
        <description>New GoLive Created Alert2</description>
        <protected>false</protected>
        <recipients>
            <recipient>aaron.zapf@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>melissa.davis@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/New_PS_GoLive_Assignment_Required</template>
    </alerts>
    <alerts>
        <fullName>New_Send_Ding_SDK_Ready_to_Migrate</fullName>
        <ccEmails>dg-zuora-provisioning@avalara.com</ccEmails>
        <description>Send Ding - SDK Ready to Migrate</description>
        <protected>false</protected>
        <recipients>
            <recipient>ImplementationDirector</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>VPCustomerCare</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/NewDingSDKReadytoMigrate</template>
    </alerts>
    <alerts>
        <fullName>Nexternal_Welcome_Letter</fullName>
        <description>Nexternal Welcome Letter</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/New_Welcome_Letter_NexternalCommerce</template>
    </alerts>
    <alerts>
        <fullName>Nitrosell_Welcome_Letter</fullName>
        <description>Nitrosell Welcome Letter</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/New_Welcome_Letter_Nitrosell</template>
    </alerts>
    <alerts>
        <fullName>Notify_CAM_and_Salesperson_of_unresponsive_customer</fullName>
        <ccEmails>DG-SalesEngineers@avalara.com</ccEmails>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Notify CAM and Salesperson of unresponsive customer</description>
        <protected>false</protected>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/Notify_Sales_and_CAM_of_Unresponsive</template>
    </alerts>
    <alerts>
        <fullName>Notify_CAM_and_Salesperson_of_unresponsive_customer2</fullName>
        <ccEmails>DG-SalesEngineers@avalara.com</ccEmails>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Notify CAM and Salesperson of unresponsive customer</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <field>Sales_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/Notify_Sales_and_CAM_of_Unresponsive</template>
    </alerts>
    <alerts>
        <fullName>Notify_CAM_of_Intent_to_Cancel_Returns</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Notify CAM of Intent to Cancel Returns</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <recipient>ted.saloutos@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/Returns_Cancellation_Notify_CAM</template>
    </alerts>
    <alerts>
        <fullName>Notify_CAM_of_Slipped_Timeline</fullName>
        <description>Notify CAM of Slipped Timeline</description>
        <protected>false</protected>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/Notify_CAM_of_Slipped_Timeline</template>
    </alerts>
    <alerts>
        <fullName>Notify_GLC_of_Customer_Request_for_Contact</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Notify GLC of Customer Request for Contact</description>
        <protected>false</protected>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>New_GoLive_Templates/Task_GLC_to_Contact_Customer</template>
    </alerts>
    <alerts>
        <fullName>Notify_GLC_of_Update_to_Log</fullName>
        <description>Notify GLC of Update to Log</description>
        <protected>false</protected>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/GLCNoyify</template>
    </alerts>
    <alerts>
        <fullName>Notify_GLC_of_stalled_GoLive</fullName>
        <description>Notify GLC of stalled GoLive</description>
        <protected>false</protected>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>GoLive_Internal_Only/Notify_GLC_of_stalled_GLI</template>
    </alerts>
    <alerts>
        <fullName>Notify_RMO_Contacts_of_Docs_Received</fullName>
        <description>Notify RMO Contacts of Docs Received</description>
        <protected>false</protected>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>ketan.vyas@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kimberly.taylor@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/KimDocs</template>
    </alerts>
    <alerts>
        <fullName>Notify_Sales_Rep_and_CAM_of_Live_on_AvaTax_Calc</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Notify Sales Rep and CAM of Live on AvaTax Calc</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <field>Sales_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/Notify_Sales_Rep_CAM_of_Live_on_Calc</template>
    </alerts>
    <alerts>
        <fullName>Notify_Sales_Rep_and_CAM_of_Live_on_AvaTax_Returns</fullName>
        <description>Notify Sales Rep and CAM of Live on AvaTax Returns</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <field>Sales_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/Notify_Sales_Rep_CAM_of_Live_on_Returns</template>
    </alerts>
    <alerts>
        <fullName>Notify_Sales_Rep_and_CAM_of_Live_on_CertCapture</fullName>
        <ccEmails>DG-MS-Implementation@avalara.com</ccEmails>
        <description>Notify Sales Rep and CAM of Live on CertCapture</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <field>Sales_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/Notify_Sales_Rep_CAM_of_Live_on_CertCapture</template>
    </alerts>
    <alerts>
        <fullName>Notify_managers_of_customer_submission_of_a_Filing_Calendar_Change_Request</fullName>
        <description>Notify managers of customer submission of a Filing Calendar Change Request</description>
        <protected>false</protected>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>pamela.knudsen@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>New_GoLive_Templates/Notify_Managers_of_Filing_Calendar_Change_Request</template>
    </alerts>
    <alerts>
        <fullName>Partner_GoLive_Notification_Calc_Live</fullName>
        <description>Partner GoLive Notification - Calc Live</description>
        <protected>false</protected>
        <recipients>
            <field>ChannelSalesRepEmail__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>PartnerPortalAdminEmail__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/Partner_GoLive_Notification_Calc_Live</template>
    </alerts>
    <alerts>
        <fullName>Partner_GoLive_Notification_Certs_Live</fullName>
        <description>Partner GoLive Notification - Certs Live</description>
        <protected>false</protected>
        <recipients>
            <field>ChannelSalesRepEmail__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>PartnerPortalAdminEmail__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/Partner_GoLive_Notification_Certs_Live</template>
    </alerts>
    <alerts>
        <fullName>Partner_GoLive_Notification_Returns_Live</fullName>
        <description>Partner GoLive Notification - Returns Live</description>
        <protected>false</protected>
        <recipients>
            <field>ChannelSalesRepEmail__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>PartnerPortalAdminEmail__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/Partner_GoLive_Notification_Returns_Live</template>
    </alerts>
    <alerts>
        <fullName>Quickbooks_Welcome_Letter</fullName>
        <description>Quickbooks Welcome Letter</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/New_Welcome_Letter_QuickBooks</template>
    </alerts>
    <alerts>
        <fullName>Sage_100_Welcome_Letter</fullName>
        <description>Sage 100 Welcome Letter</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/NewWelcome_Letter_Sage100</template>
    </alerts>
    <alerts>
        <fullName>Sage_300_Welcome_Letter</fullName>
        <description>Sage 300 Welcome Letter</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/NewWelcome_Letter_Sage300</template>
    </alerts>
    <alerts>
        <fullName>Self_Serve_Welcome_Letter</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Self Serve Welcome Letter</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/Welcome_Self_Serve_GO_Program</template>
    </alerts>
    <alerts>
        <fullName>Send_Cancellation_EMail_for_returns</fullName>
        <ccEmails>cancellations@avalara.com</ccEmails>
        <ccEmails>cathleen.wellbrock@Avalara.com</ccEmails>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Send Cancellation EMail for returns</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <recipient>ted.saloutos@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/Returns_Cancellation_Notify_Customer</template>
    </alerts>
    <alerts>
        <fullName>Send_Client_Delay_Survey</fullName>
        <description>Send Client Delay Survey [CPD1.1]</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>GoLive_Templates/Calc_Client_Delay_C</template>
    </alerts>
    <alerts>
        <fullName>Send_GO_Program_Welcome_Letter</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Send GO! Program Welcome Letter</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <recipient>melissa.davis@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>New_GoLive_Templates/Welcome_Self_Serve_GO_Program</template>
    </alerts>
    <alerts>
        <fullName>Send_GoLive_Date_Survey</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Send GoLive Date Survey</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>New_GoLive_Templates/CalcReturnsLiveDateSurvey</template>
    </alerts>
    <alerts>
        <fullName>Send_GoLive_Pre_Implementation_Assessment</fullName>
        <description>Send GoLive Pre-Implementation Assessment</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>GoLive_Templates/GoLive_Pre_Implementation_Assessment</template>
    </alerts>
    <alerts>
        <fullName>Send_GoLive_Survey_Calc</fullName>
        <description>Send GoLive Survey - Calc</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>GoLive_Templates/GoLiveSurvey_Calc</template>
    </alerts>
    <alerts>
        <fullName>Send_GoLive_Survey_Certs</fullName>
        <description>Send GoLive Survey - Certs</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>GoLive_Templates/GoLiveSurvey_Certs2</template>
    </alerts>
    <alerts>
        <fullName>Send_GoLive_Survey_Returns</fullName>
        <description>Send GoLive Survey - Returns</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_Compliance_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>GoLive_Templates/GoLiveSurvey_Returns2</template>
    </alerts>
    <alerts>
        <fullName>Send_Implicitly_Cancelled_survey</fullName>
        <description>Send Implicitly Cancelled survey [CIC1.1]</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>GoLive_Templates/Calc_Implicit_Delay</template>
    </alerts>
    <alerts>
        <fullName>Send_Invitation_for_GO_Program</fullName>
        <description>Send Invitation for GO! Program</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/Self_Serve_GO_Program</template>
    </alerts>
    <alerts>
        <fullName>Send_Milestone_Status_Update</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Send Milestone Status Update</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Visualforce_Email_Templates/GLI_Status_VisualForce</template>
    </alerts>
    <alerts>
        <fullName>Send_email_notification_about_LWS</fullName>
        <description>Send email notification about LWS</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_Compliance_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>New_GoLive_Templates/newGoLive_1st_Tax_Liability_Worksheet</template>
    </alerts>
    <alerts>
        <fullName>Send_email_of_status_and_invitation_to_reengage</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Send email of status and invitation to reengage</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/Backlog_Status_and_Attempt_to_Reengage</template>
    </alerts>
    <alerts>
        <fullName>Send_email_requesting_intent_desire_to_use_Returns_or_not</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Send email requesting intent / desire to use Returns or not</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_Compliance_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>New_GoLive_Templates/NewForecastReturnsRequest</template>
    </alerts>
    <alerts>
        <fullName>Send_email_to_RSM_of_unresponsive_customer_and_cc_CAM</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Send email to RSM of unresponsive customer and cc CAM</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/Notify_Sales_and_CAM_of_Unresponsive</template>
    </alerts>
    <alerts>
        <fullName>Send_email_to_SOHO_customers_to_direct_them_to_Returns_webinar</fullName>
        <ccEmails>melissa.davis@avalara.com</ccEmails>
        <description>Send email to SOHO customers to direct them to Returns webinar</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_Compliance_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>customercarecenter@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>C3_Email_Templates/Avalara_Returns_Webinar_C3</template>
    </alerts>
    <alerts>
        <fullName>Send_email_to_all_CALC_customers_to_confirm_this_month</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Send email to all CALC customers to confirm this month</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/GarinConfirmCalcForecast</template>
    </alerts>
    <alerts>
        <fullName>Send_email_to_all_RETURNS_customers_to_confirm_this_month</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Send email to all RETURNS customers to confirm this month</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_Compliance_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/GarinConfirmReturnsForecast</template>
    </alerts>
    <alerts>
        <fullName>Send_email_to_engage_backlog</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Send email &quot;Backlog Status and Attempt to Reengage&quot;</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>New_GoLive_Templates/Backlog_Status_and_Attempt_to_Reengage</template>
    </alerts>
    <alerts>
        <fullName>Send_invitation_for_Getting_Stared_with_the_Admin_Console_webinar</fullName>
        <description>Send invitation for Getting Stared with the Admin Console webinar</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>New_GoLive_Templates/Getting_Started_with_Avalara_AvaTax</template>
    </alerts>
    <alerts>
        <fullName>Send_invitation_to_CertCapture_webinars</fullName>
        <description>Send invitation to CertCapture webinars</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/CertCapture_Webinar_reminder</template>
    </alerts>
    <alerts>
        <fullName>Send_invitation_to_Dec_2014_Offer</fullName>
        <description>Send invitation to Dec 2014 Offer</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/Returns_Dec_2014_Offer</template>
    </alerts>
    <alerts>
        <fullName>Send_notification_email</fullName>
        <ccEmails>christine.martin@Avalara.com</ccEmails>
        <ccEmails>John.Sallese@avalara.com</ccEmails>
        <ccEmails>mark.giddens@Avalara.com</ccEmails>
        <ccEmails>mark.wilhelm@Avalara.com</ccEmails>
        <description>Send notification email</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <field>Sales_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>melissa.davis@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>New_GoLive_Templates/Notify_Internal_Escalation_Team_of_Blocked_GoLive</template>
    </alerts>
    <alerts>
        <fullName>Send_notification_email_regarding_Registered_for_Webinar_Get_Started_with_AvaTax</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Send notification email regarding Registered for Webinar - Get Started with AvaTax</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>New_GoLive_Templates/Registered_for_AvaTax_webinar</template>
    </alerts>
    <alerts>
        <fullName>Send_notification_email_regarding_Registered_for_Webinar_Get_Started_with_CertCa</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Send notification email regarding Registered for Webinar - Get Started with CertCapture</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>New_GoLive_Templates/Registered_for_CertCapture_webinar</template>
    </alerts>
    <alerts>
        <fullName>Send_notification_email_regarding_Registered_for_Webinar_Get_Started_with_Return</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Send notification email regarding Registered for Webinar - Get Started with Returns</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_Compliance_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>golive@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>New_GoLive_Templates/Registered_for_Returns_webinar</template>
    </alerts>
    <alerts>
        <fullName>Send_notification_of_possible_cancellation</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Send notification of possible cancellation</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <field>Sales_Rep_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/Notify_Internal_Escalation_Team_of_Blocked_GoLive</template>
    </alerts>
    <alerts>
        <fullName>Send_notification_to_Customer</fullName>
        <description>Send notification to Customer of New GLC</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_Compliance_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/MASS_GLC_Reassignment</template>
    </alerts>
    <alerts>
        <fullName>Send_welcome_letter</fullName>
        <description>Send welcome letter</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/FASTSIGNSKEYSTONE</template>
    </alerts>
    <alerts>
        <fullName>Send_welcome_letter_template</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Send welcome letter template</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/AvaTax_Implementation_Setting_Up_Add_On_Connector_Name</template>
    </alerts>
    <alerts>
        <fullName>Shopsite_Welco_me_Letter</fullName>
        <description>Shopsite Welco me Letter</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/NewWelcome_Letter_ShopSite</template>
    </alerts>
    <alerts>
        <fullName>TEST_Cancellation_Alert</fullName>
        <description>TEST Cancellation Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>clayton.wiggins@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/GLI_Status_Calc</template>
    </alerts>
    <alerts>
        <fullName>X3D_Cart_Welcome_Letter</fullName>
        <description>3D Cart Welcome Letter</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/New_Welcome_Letter_3dCart</template>
    </alerts>
    <alerts>
        <fullName>nopCommerce_Welcome</fullName>
        <description>nopCommerce Welcome</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_GoLive_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>New_GoLive_Templates/NewWelcome_Letter_nopCommerce</template>
    </alerts>
    <fieldUpdates>
        <fullName>Account_Activated_Log_Entry_1</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - Auto Milestone Status Email Sent to Customer - Activate Account Reminder #1&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Account Activated Log Entry 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Activated_Log_Entry_2</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - Auto Milestone Status Email Sent to Customer - Activate Account Reminder #2&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Account Activated Log Entry 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Activated_Log_Entry_4</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - Auto Milestone Status Email Sent to Customer - Activate Account Reminder #4&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Account Activated Log Entry 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Activated_Log_Entry_FINAL</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot;Customer has not made a milestone update for 8 days.  The current Milestone they need to complete is to Activate the Account.  Status has automatically been updated to Client Delay and they have been pulled out of the GoLive Automation workflow.&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Account Activated Log Entry - FINAL</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Activated_Log_entry_3</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - Auto Milestone Status Email Sent to Customer - Activate Account Reminder #3&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Account Activated Log entry 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_1_Forecast_Change_Calc</fullName>
        <field>Forecast_Changes_Calc__c</field>
        <formula>Forecast_Changes_Calc__c + 1</formula>
        <name>Add 1 - Forecast Change Calc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_1_Forecast_Change_Certs</fullName>
        <field>Forecast_Changes_Certs__c</field>
        <formula>Forecast_Changes_Certs__c + 1</formula>
        <name>Add 1 - Forecast Change Certs</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_1_Forecast_Change_Returns</fullName>
        <field>Forecast_Changes_Returns__c</field>
        <formula>Forecast_Changes_Returns__c + 1</formula>
        <name>Add 1 - Forecast Change Returns</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_1_Time_Blocked_Calc</fullName>
        <field>Times_Blocked_Calc__c</field>
        <formula>Times_Blocked_Calc__c + 1</formula>
        <name>Add 1 - Time Blocked Calc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_1_Time_Blocked_Certs</fullName>
        <field>Times_Blocked_Certs__c</field>
        <formula>Times_Blocked_Certs__c + 1</formula>
        <name>Add 1 - Time Blocked Certs</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_1_Time_Blocked_Returns</fullName>
        <field>Times_Blocked_Returns__c</field>
        <formula>Times_Blocked_Returns__c + 1</formula>
        <name>Add 1 - Time Blocked Returns</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_1_Times_Active_Calc</fullName>
        <field>Times_Active_Calc__c</field>
        <formula>Times_Active_Calc__c + 1</formula>
        <name>Add 1 - Times Active Calc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_1_Times_Active_Certs</fullName>
        <field>Times_Active_Certs__c</field>
        <formula>Times_Active_Certs__c + 1</formula>
        <name>Add 1 - Times Active Certs</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_1_Times_Active_Returns</fullName>
        <field>Times_Active_Returns__c</field>
        <formula>Times_Active_Returns__c + 1</formula>
        <name>Add 1 - Times Active Returns</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_1_Times_Nurtured_Calc</fullName>
        <field>Times_Nurtured_Calc__c</field>
        <formula>Times_Nurtured_Calc__c + 1</formula>
        <name>Add 1 - Times Nurtured Calc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_1_Times_Nurtured_Certs</fullName>
        <field>Times_Nurtured_Certs__c</field>
        <formula>Times_Nurtured_Certs__c + 1</formula>
        <name>Add 1 - Times Nurtured Certs</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_1_Times_Nurtured_Returns</fullName>
        <field>Times_Nurtured_Returns__c</field>
        <formula>Times_Nurtured_Returns__c + 1</formula>
        <name>Add 1 - Times Nurtured Returns</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_1_Times_Unresponsive_Calc</fullName>
        <field>Time_Unresponsive_Calc__c</field>
        <formula>Time_Unresponsive_Calc__c + 1</formula>
        <name>Add 1 - Times Unresponsive Calc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_1_Times_Unresponsive_Certs</fullName>
        <field>Times_Unresponsive_Certs__c</field>
        <formula>Times_Unresponsive_Certs__c + 1</formula>
        <name>Add 1 - Times Unresponsive Certs</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_1_Times_Unresponsive_Returns</fullName>
        <field>Times_Unresponsive_Returns__c</field>
        <formula>Times_Unresponsive_Returns__c + 1</formula>
        <name>Add 1 - Times Unresponsive Returns</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_Automated_GoLive_User</fullName>
        <field>Ava_GoLive_Coordinator__c</field>
        <lookupValue>glautomation@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Add Automated GoLive User</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_Log_Stamp</fullName>
        <field>Log_Stamp__c</field>
        <formula>NOW()</formula>
        <name>Add Log Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_notification_event_to_log</fullName>
        <field>Log_Summary__c</field>
        <formula>&quot;--- &quot;&amp; &quot;Email&quot; &amp; &quot;: &quot;&amp; $User.LastName &amp; &quot; &quot; &amp; $User.LastName &amp; &quot;: &quot;&amp; TEXT(NOW()) &amp; &quot;: &quot;&amp; &quot;Sent notification to escalation team notifying them of newly BLOCKED status. &quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Add notification event to log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Append_event_log</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot;Sent email to CAM and Sales notifying them of potential cancellation&quot;</formula>
        <name>Append event log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Append_to_GoLive_Log</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot;Sent mass email to reengage Backlogged customer (template: Backlog Status and Attempt to Reengage)&quot;</formula>
        <name>Append to GoLive Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Append_to_GoLive_Log_SOHO</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot;Sent email &apos;Avalara Returns Webinar C3&apos;&quot;</formula>
        <name>Append to GoLive Log - SOHO</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Append_to_Log</fullName>
        <field>Log_Summary__c</field>
        <formula>&quot;--- &quot;&amp; &quot;Email&quot; &amp; &quot;: &quot;&amp; $User.LastName &amp; &quot; &quot; &amp; $User.LastName &amp; &quot;: &quot;&amp; TEXT(NOW()) &amp; &quot;: &quot;&amp; &quot;GoLive assigned to &quot; &amp;  Ava_GoLive_Coordinator__r.FirstName &amp; &quot; &quot; &amp;  Ava_GoLive_Coordinator__r.LastName &amp;
 &quot; and email sent to &quot; &amp; Ava_GoLive_Coordinator__r.Email &amp; BR() &amp; Log_Summary__c</formula>
        <name>Append to Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Auto_Log_Entry_for_Send_Welcome_Letter</fullName>
        <description>Purpose: Auto Log Entry for Send Welcome Letter Log Entry Type 
Integrated: No 
Change: Level 1 
Custodian: Golive Director</description>
        <field>Log_Entry__c</field>
        <formula>&quot;Welcome letter sent&quot;</formula>
        <name>Auto Log Entry for Send Welcome Letter</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Status_Active</fullName>
        <field>Calc_Status__c</field>
        <literalValue>Active</literalValue>
        <name>Calc Status Active</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Status_Blocked</fullName>
        <field>Calc_Status__c</field>
        <literalValue>Blocked</literalValue>
        <name>Calc Status Blocked</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Status_Nurture</fullName>
        <field>Calc_Status__c</field>
        <literalValue>Nurtured</literalValue>
        <name>Calc Status Nurture</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calc_Status_Unresponsive</fullName>
        <field>Calc_Status__c</field>
        <literalValue>Unresponsive</literalValue>
        <name>Calc Status Unresponsive</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Call_Campaign_Calc_Date</fullName>
        <field>Call_Campaign_Calc_Estimation__c</field>
        <formula>Calc_Estimation__c</formula>
        <name>Call Campaign Calc Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Call_Campaign_Certs_Date</fullName>
        <field>Call_Campaign_Certs_Estimation__c</field>
        <formula>Certs_Estimation__c</formula>
        <name>Call Campaign Certs Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Call_Campaign_Returns_Date</fullName>
        <field>Call_Campaign_Returns_Estimation__c</field>
        <formula>Returns_Estimation__c</formula>
        <name>Call Campaign Returns Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cancel_Calc</fullName>
        <field>Calc_Status__c</field>
        <literalValue>Canceled</literalValue>
        <name>Cancel Calc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cancel_Certs</fullName>
        <field>Certs_Status__c</field>
        <literalValue>Canceled</literalValue>
        <name>Cancel Certs</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cancel_Returns</fullName>
        <field>Returns_Status__c</field>
        <literalValue>Canceled</literalValue>
        <name>Cancel Returns</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Certs_Estimate_Confidence_Medium</fullName>
        <field>Confidence_in_Estimate_CC__c</field>
        <literalValue>Med</literalValue>
        <name>Certs Estimate Confidence = Medium</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Certs_First_Est_Stamp</fullName>
        <field>Certs_First_Est_Date__c</field>
        <formula>Certs_Estimation__c</formula>
        <name>Certs First Est Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Certs_Status_Active</fullName>
        <field>Certs_Status__c</field>
        <literalValue>Active</literalValue>
        <name>Certs Status Active</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Certs_Status_Blocked</fullName>
        <field>Certs_Status__c</field>
        <literalValue>Blocked</literalValue>
        <name>Certs Status Blocked</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Certs_Status_Nurtured</fullName>
        <field>Certs_Status__c</field>
        <literalValue>Nurtured</literalValue>
        <name>Certs Status Nurtured</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Certs_Status_Unresponsive</fullName>
        <field>Certs_Status__c</field>
        <literalValue>Unresponsive</literalValue>
        <name>Certs Status Unresponsive</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_Name_to_SOHO</fullName>
        <field>Name</field>
        <formula>&quot;ZT &quot; &amp; Connector__r.Name &amp; &quot; &quot; &amp;  Account__r.Name &amp; &quot; - SOHO&quot;</formula>
        <name>Change Name to SOHO</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Needs_CAM_Case2</fullName>
        <description>Checks Needs CAM Case on the GLI</description>
        <field>Needs_CAM_Case__c</field>
        <literalValue>1</literalValue>
        <name>Check Needs CAM Case</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Pre_Paid_Returns_checkbox_on_GLI</fullName>
        <field>Pre_Paid_Returns__c</field>
        <literalValue>1</literalValue>
        <name>Check Pre-Paid Returns checkbox on GLI</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Calc_Live_GLC</fullName>
        <field>Calc_Live_GLC__c</field>
        <name>Clear Calc Live GLC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Call_Campaign_Result</fullName>
        <field>Call_Campaign_Result__c</field>
        <name>Clear Call Campaign Result</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Certs_Live_GLC</fullName>
        <field>Certs_Live_GLC__c</field>
        <name>Clear Certs Live GLC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Checkbox</fullName>
        <field>MASS_Notify_Cust_of_New_GLC__c</field>
        <literalValue>0</literalValue>
        <name>Clear Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Checkbox2</fullName>
        <field>MASS_Garin_Confirm_Calc_This_Month__c</field>
        <literalValue>0</literalValue>
        <name>Clear Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Checkbox5</fullName>
        <field>MASS_Garin_Confirm_Returns_This_Month__c</field>
        <literalValue>0</literalValue>
        <name>Clear Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Conf_Calc</fullName>
        <field>Confidence_in_Estimate_Calc__c</field>
        <name>Clear Conf Calc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Conf_Certs</fullName>
        <field>Confidence_in_Estimate_CC__c</field>
        <name>Clear Conf Certs</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Conf_Returns</fullName>
        <field>Confidence_in_Estimate_Returns__c</field>
        <name>Clear Conf Returns</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Days_Until_GLC_Call</fullName>
        <field>GLCRe__c</field>
        <name>Clear Days Until GLC Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Days_Until_Reengage</fullName>
        <field>DaysUntilReengage__c</field>
        <name>Clear Days Until Reengage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Escalation_flag</fullName>
        <field>Escalate_to_Sales_and_CAM__c</field>
        <literalValue>0</literalValue>
        <name>Clear Escalation flag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_GLC_Contact_Date</fullName>
        <field>GLC_Contact_Date__c</field>
        <name>Clear GLC Contact Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_LWS_Reminder_checkbox</fullName>
        <field>MASS_Returns_LWS_Reminder__c</field>
        <literalValue>0</literalValue>
        <name>Clear LWS Reminder checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Log_Entry</fullName>
        <field>Log_Entry__c</field>
        <name>Clear Log Entry</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Log_Type</fullName>
        <field>Log_Type__c</field>
        <name>Clear Log Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_MASS_Escalate_to_SALES_CAM</fullName>
        <field>MASS_Escalate_to_SALES_CAM__c</field>
        <literalValue>0</literalValue>
        <name>Clear MASS_Escalate_to_SALES_CAM</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Offer_Checklist</fullName>
        <field>MASS_Returns_Offer__c</field>
        <literalValue>0</literalValue>
        <name>Clear Offer Checklist</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Returns_Live_GLC</fullName>
        <field>Returns_Live_GLC__c</field>
        <name>Clear Returns Live GLC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_SOHO_Returns_webinar_checklist</fullName>
        <field>MASS_SOHO_Returns_Webinar_email__c</field>
        <literalValue>0</literalValue>
        <name>Clear SOHO Returns webinar checklist</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_checkbox6</fullName>
        <field>Garin_Mass_GoLive_Backlog_email__c</field>
        <literalValue>0</literalValue>
        <name>Clear checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_mass_email_zombie_checkbox</fullName>
        <field>MASS_Email_Zombies__c</field>
        <literalValue>0</literalValue>
        <name>Clear mass email zombie checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Company_Created_Log_Entry_1</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - Auto Milestone Status Email Sent to Customer - Create Company Reminder #1&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Company Created Log Entry 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Company_Created_Log_Entry_2</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - Auto Milestone Status Email Sent to Customer - Create Company Reminder #2&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Company Created Log Entry 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Company_Created_Log_Entry_3</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - Auto Milestone Status Email Sent to Customer - Create Company Reminder #3&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Company Created Log Entry 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Company_Created_Log_Entry_4</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - Auto Milestone Status Email Sent to Customer - Create Company Reminder #4&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Company Created Log Entry 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Company_Created_Log_Entry_FINAL</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot;Customer has not made a milestone update for 8 days. The current Milestone they need to complete is Company Creation. Status has automatically been updated to Client Delay and they have been pulled out of the GoLive Automation workflow.&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Company Created Log Entry - FINAL</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Credit_for_the_Resurrection</fullName>
        <description>Name of Nurture Rep.  Intended to spiff Nurture Reps for recovering a ZOMBIE GoLive</description>
        <field>Resurrection_Rep__c</field>
        <formula>if(contains(text(Log_Type__c),&quot;ZOMBIE&quot;), $User.FirstName &amp; &quot; &quot; &amp; $User.LastName,&quot;&quot;)</formula>
        <name>Credit for the Resurrection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cust_Start_Date_plus_Days_until_Reengage</fullName>
        <field>Customer_Start_Date__c</field>
        <formula>IF(NOT(ISBLANK( Customer_Start_Date__c )),

Customer_Start_Date__c +  DaysUntilReengage__c,

Customer_Start_Date__c)</formula>
        <name>Cust Start Date plus Days until Reengage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_Stamp_Risk_Date</fullName>
        <field>Risk_Date__c</field>
        <formula>today()</formula>
        <name>Date Stamp Risk Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_of_the_Resurrecton</fullName>
        <description>Date the nurture rep saved a zombie golive;  used for SPIFFs</description>
        <field>Resurrection_Date__c</field>
        <formula>if(contains(text(Log_Type__c),&quot;Back From The Dead&quot;), TODAY(),NULL)</formula>
        <name>Date of the Resurrecton</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Days_Until_Reengage_Log_Entry</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - Customer Start Date Updated via automation This was triggered by a Customer response to an survey indicating when they&apos;d like to reengage with the GoLive team.&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Days Until Reengage Log Entry</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Default_Calc_Status</fullName>
        <field>Calc_Status__c</field>
        <literalValue>Active</literalValue>
        <name>Default Calc Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Default_Certs_Status</fullName>
        <field>Certs_Status__c</field>
        <literalValue>Active</literalValue>
        <name>Default Certs Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Default_Returns_Status</fullName>
        <field>Returns_Status__c</field>
        <literalValue>Active</literalValue>
        <name>Default Returns Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Desired_Certs_Estimate_from_Opp</fullName>
        <field>Certs_Estimation__c</field>
        <formula>DesiredCalcLiveDate_from_Opp__c</formula>
        <name>Desired Certs Estimate from Opp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Docs_Failed_Validation</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot;System - Documentation Returns Packet FAILED Validation&quot;</formula>
        <name>Docs Failed Validation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Exclude_from_Velocity_flag</fullName>
        <field>Exclude_from_velocity__c</field>
        <literalValue>1</literalValue>
        <name>Exclude from Velocity flag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Flip_Exclude_from_Velocity_flag</fullName>
        <field>Exclude_from_velocity__c</field>
        <literalValue>1</literalValue>
        <name>Flip Exclude from Velocity flag</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Force_Calc_Estimation_Today_1</fullName>
        <field>Calc_Estimation__c</field>
        <formula>Today() + 1</formula>
        <name>Force Calc Estimation Today + 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>GoLive_Calc_Status_Reset</fullName>
        <field>Calc_Status__c</field>
        <name>GoLive Calc Status Reset</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>NextValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>GoLive_Date_Survey_Sent_Log_Entry</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - GoLive Date Survey Sent&quot; &amp;  BR() &amp; Log_Summary__c</formula>
        <name>GoLive Date Survey Sent Log Entry</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>GoLive_Log_Summary_Milestone</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - Auto Milestone Status Email Sent to Customer - Post a Transaction Reminder #1&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Transaction Posted Log Entry 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Implementation_Path_Assisted</fullName>
        <field>Implementation_Path__c</field>
        <literalValue>Assisted</literalValue>
        <name>Implementation Path Assisted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Increment_Call_Campaign_Count</fullName>
        <description>Increment the counter for call attempts.</description>
        <field>Call_Campaign_Attempts__c</field>
        <formula>IF(text(Call_Campaign_Result__c) &lt;&gt;&quot;Internal (Cleanup/Escalation)&quot;,if(isnull(Call_Campaign_Attempts__c ),1,Call_Campaign_Attempts__c+1),Call_Campaign_Attempts__c)</formula>
        <name>Increment Call Campaign Count</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Increment_Current_Call_Campaign_Attempts</fullName>
        <field>Current_Call_Campaign_Attempts__c</field>
        <formula>if(isnull(Current_Call_Campaign_Attempts__c )
,1,
Current_Call_Campaign_Attempts__c+1)</formula>
        <name>Increment Current Call Campaign Attempts</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Increment_GLC_Log_Update_Count</fullName>
        <description>If current user is the owner of the GoLive, update the counter.</description>
        <field>GLC_Log_Count__c</field>
        <formula>IF( IsCurrentUser__c=&quot;Yes&quot; , if(isnull(GLC_Log_Count__c),1,GLC_Log_Count__c +1), GLC_Log_Count__c )</formula>
        <name>Increment GLC Log Update Count</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_Log_Entry_Stamp</fullName>
        <field>GL_Last_Log_Entry__c</field>
        <formula>CASE(Log_Type__c,&quot;Phone&quot;,&quot;Phone&quot;,&quot;Email&quot;,&quot;Email&quot;,&quot;Note&quot;,&quot;Note&quot;,&quot;General&quot;) &amp; &quot;: &quot; &amp; $User.FirstName &amp; $User.LastName &amp; &quot;: &quot;&amp; TEXT(NOW()) &amp; &quot;: &quot;&amp; Log_Entry__c</formula>
        <name>Last Log Entry Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Log_Client_Delay_Survey_Sent</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - Client Delay Email Sent to Customer&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Log Client Delay Survey Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Log_Entry_MASS_Confirm_Calc_Estimate</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot;Sent MASS: Confirm Calc Estimation Date&quot;</formula>
        <name>Log Entry: MASS Confirm Calc Estimate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Log_Entry_MASS_Filing_Date_This_Month</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot;Log Entry: sent &apos;MASS:Filing Date This Month&apos;&quot;</formula>
        <name>Log Entry: MASS:Filing Date This Month</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Log_Entry_MASS_Notify_CAM_of_Cancellati</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot;Sent notification to CAM of intent to cancel Returns (only) for non-payment. 48 hr notice.&quot;</formula>
        <name>Log Entry: MASS Notify CAM of Cancellati</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Log_Entry_MASS_Send_Invite_for_GO_Prog</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot;Sent MASS: Send Invite for GO Program&quot;</formula>
        <name>Log Entry: MASS: Send Invite for GO Prog</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Log_Entry_No_Est_FF_Date</fullName>
        <description>&quot;Sent Mass: No EFF Date, Live on Calc, Request Date&quot;</description>
        <field>Log_Entry__c</field>
        <formula>&quot;Sent Mass: No EFF Date, Live on Calc, Request Date&quot;</formula>
        <name>Log Entry: No Est FF Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Log_Entry_Notify_Cust_of_Returns_Cancel</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot;Sent Eloqua Cancellation Notice for Returns service (only) for non-payment. (MinBill/ActReBill)&quot;</formula>
        <name>Log Entry: Notify Cust of Returns Cancel</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Log_Entry_Prioritizing_You_for_This_Mo</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot;Sent email to Calc customers &apos;would like to prioritize you for this month&apos;&quot;</formula>
        <name>Log Entry: Prioritizing You for This Mo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Log_Implicitly_Cancelled_Survey_Sent</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - Implicitly Cancelled Survey Sent to Customer&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Log Implicitly Cancelled Survey Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Log_entry</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot;Sent &apos;MASS:Filing Date Update&apos;&quot;</formula>
        <name>Log entry: Filing Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Log_entry_MASS_Returns_LWS_Reminder</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot;Sent email &apos;MASS Returns LWS Reminder&apos;&quot;</formula>
        <name>Log entry: MASS Returns LWS Reminder</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Make_note_in_log</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot; Returns GoLive Marked as SCHEDULED for &quot; &amp; TEXT(Returns_Estimation__c)</formula>
        <name>Make note in log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Nexus_Setup_Log_Entry_1</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - Auto Milestone Status Email Sent to Customer - Nexus Setup Reminder #1&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Nexus Setup Log Entry 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Nexus_Setup_Log_Entry_2</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - Auto Milestone Status Email Sent to Customer - Nexus Setup Reminder #2&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Nexus Setup Log Entry 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Nexus_Setup_Log_Entry_3</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - Auto Milestone Status Email Sent to Customer - Nexus Setup Reminder #3&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Nexus Setup Log Entry 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Nexus_Setup_Log_Entry_4</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - Auto Milestone Status Email Sent to Customer - Nexus Setup Reminder #4&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Nexus Setup Log Entry 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Nexus_Setup_Log_Entry_FINAL</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot;Customer has not made a milestone update for 8 days.  The current Milestone they need to complete is to set up Nexus.  Status has automatically been updated to Client Delay and they have been pulled out of the GoLive Automation workflow.&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Nexus Setup Log Entry - FINAL</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Sales_Rep_Email</fullName>
        <field>Sales_Rep_Email__c</field>
        <formula>Sales_Email_Address_Lookup__c</formula>
        <name>Populate Sales Rep Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Remove_Calc_Status</fullName>
        <field>Calc_Status__c</field>
        <name>Remove Calc Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Remove_Calc_Sub</fullName>
        <field>Primary_Calc_Name__c</field>
        <name>Remove Calc Sub</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_MASS</fullName>
        <field>MASS_CAM_Notify_Returns_Cancellation__c</field>
        <literalValue>0</literalValue>
        <name>Reset: MASS CAM Notify Returns Cancel</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_MASS_Calc_No_estimate</fullName>
        <field>MASS_Calc_No_estimate__c</field>
        <name>Reset MASS: Calc – No estimate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_MASS_Cust_Notify_Returns_Cancel</fullName>
        <field>MASS_Cust_Notify_Returns_Cancellation__c</field>
        <literalValue>0</literalValue>
        <name>Reset: MASS Cust Notify Returns Cancel</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_MASS_Magento_Invite_Checkbox</fullName>
        <field>MASS_Invite_to_Magento_Webinar__c</field>
        <literalValue>0</literalValue>
        <name>Reset MASS Magento Invite Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_MASS_QuickBooks_Invite_Checkbox</fullName>
        <field>MASS_Invite_to_QuickBooks_Webinar__c</field>
        <literalValue>0</literalValue>
        <name>Reset MASS QuickBooks Invite Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_MASS_Send_AvaTax_Status_Email</fullName>
        <field>MASS_Send_AvaTax_Status_Email__c</field>
        <literalValue>0</literalValue>
        <name>Reset MASS Send AvaTax Status Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Mass_Calc_Forecast_Confirmation</fullName>
        <field>MASS_Confirm_Calc_Estimation_Date__c</field>
        <name>Reset Mass: Calc Forecast Confirmation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Mass_Filing_Date</fullName>
        <field>MASS_Filing_Date_Passed__c</field>
        <name>Reset Mass Filing Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Mass_Filing_This_Month</fullName>
        <field>MASS_Filing_Date_This_Month__c</field>
        <name>Reset Mass Filing This Month</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Mass_GO_Program_Invite</fullName>
        <field>MASS_Confirm_GO_Program_Invite__c</field>
        <literalValue>0</literalValue>
        <name>Reset Mass: MASS GO! Program Invite</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Time_Spent_GoLive</fullName>
        <field>Time_Spent_GoLive__c</field>
        <name>Reset Time Spent (GoLive)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Time_Spent_Support</fullName>
        <field>Time_Spent_Support__c</field>
        <formula>0</formula>
        <name>Reset Time Spent (Support)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_checkbox_for_Getting_Started_Admin</fullName>
        <field>MASS_Invite_to_Admin_Console_Webinar__c</field>
        <literalValue>0</literalValue>
        <name>Reset checkbox for Getting Started Admin</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_checkbox_for_MASS_CertCap_Invitati</fullName>
        <field>MASS_Invite_to_CertCap_Webinars__c</field>
        <literalValue>0</literalValue>
        <name>Reset checkbox for MASS CertCap Invitati</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_checkbox_for_No_Est_FF_Date_email</fullName>
        <field>MASS_Email_Returns_No_Est_FF_Date__c</field>
        <literalValue>0</literalValue>
        <name>Reset checkbox for No Est FF Date email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Returns_First_Est_Stamp</fullName>
        <field>Returns_First_Est_Date__c</field>
        <formula>Returns_Estimation__c</formula>
        <name>Returns First Est Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Returns_Status_Blocked</fullName>
        <field>Returns_Status__c</field>
        <literalValue>Blocked</literalValue>
        <name>Returns Status Blocked</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Returns_Status_Nurtured</fullName>
        <field>Returns_Status__c</field>
        <literalValue>Nurtured</literalValue>
        <name>Returns Status Nurtured</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Returns_Status_Unresponsive</fullName>
        <field>Returns_Status__c</field>
        <literalValue>Unresponsive</literalValue>
        <name>Returns Status Unresponsive</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sent_MASS_Email_for_GLC_Reassignment</fullName>
        <description>Sent Email Template = MASS: GLC Reassignment</description>
        <field>Log_Entry__c</field>
        <formula>&quot;Email Template = MASS: GLC Reassignment&quot;</formula>
        <name>Sent MASS Email for GLC Reassignment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Calc_Status_Actively_Engaged</fullName>
        <field>Calc_Status__c</field>
        <literalValue>Active</literalValue>
        <name>Set Calc Status - Actively Engaged SS</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Calc_Status_Client_Delay</fullName>
        <field>Calc_Status__c</field>
        <literalValue>Active</literalValue>
        <name>Set Calc Status - Client Delay</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Calc_Status_Implicitly_Cancelled</fullName>
        <field>Calc_Status__c</field>
        <literalValue>Active</literalValue>
        <name>Set Calc Status - Implicitly Cancelled</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Calc_Status_Not_Responsding</fullName>
        <field>Calc_Status__c</field>
        <literalValue>Client Delay</literalValue>
        <name>Set Calc Status Not Responding</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Checkbox_for_Intro_Follow_Up_Call</fullName>
        <field>Welcome_Call_Completed__c</field>
        <literalValue>1</literalValue>
        <name>Set Checkbox for Intro/Follow Up Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Delay_Customer_Delayed_Start</fullName>
        <field>OldDelay__c</field>
        <literalValue>Customer: Delayed Start</literalValue>
        <name>Set Delay = Customer: Delayed Start</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Exclude_Activation_Re_Bill_to_TRUE</fullName>
        <field>Exclude_from_Activation_Re_Bill__c</field>
        <literalValue>1</literalValue>
        <name>Set Exclude Activation Re-Bill to TRUE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Exclude_from_Velocity_to_False</fullName>
        <field>Exclude_from_velocity__c</field>
        <literalValue>0</literalValue>
        <name>Set Exclude from Velocity to False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_First_Filing_Date</fullName>
        <field>First_Filing_Returns__c</field>
        <formula>Returns_Estimation__c</formula>
        <name>Set First Filing Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_First_Min_Bill_Date</fullName>
        <field>First_Min_Bill_Date__c</field>
        <formula>Source_Quote__r.zqu__StartDate__c + 120</formula>
        <name>Set First Min Bill Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_GLC_Contact_Date</fullName>
        <field>GLC_Contact_Date__c</field>
        <formula>GLCRe__c + TODAY()</formula>
        <name>Set GLC Contact Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Include_in_Activation_Re_bill_TRUE</fullName>
        <field>Include_in_Activation_Fee_Re_Bill__c</field>
        <literalValue>1</literalValue>
        <name>Set Include in Activation Re-bill TRUE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Minimum_Monthly_Bill_Fee</fullName>
        <field>Min_Re_Bill_Amt__c</field>
        <formula>IF( Source_Quote__r.Returns_Activation_Quantity_for_GLI__c = 1000,

(361/12) * 0.5 *  Source_Quote__r.Convert_Usage_Fee_to_Number__c,

IF( Source_Quote__r.Returns_Activation_Quantity_for_GLI__c = 360,

(101/12) * 0.5 *  Source_Quote__r.Convert_Usage_Fee_to_Number__c,

NULL))</formula>
        <name>Set Minimum Monthly Bill Fee</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Minimum_Monthly_Billing_to_Exclude</fullName>
        <field>Minimum_Monthly_Billing__c</field>
        <literalValue>Exclude</literalValue>
        <name>Set Minimum Monthly Billing to Exclude</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Minimum_Monthly_Billing_to_Include</fullName>
        <field>Minimum_Monthly_Billing__c</field>
        <literalValue>Include</literalValue>
        <name>Set Minimum Monthly Billing to Include</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Planning_Call_Completed</fullName>
        <field>Planning_Call_Completed__c</field>
        <literalValue>Completed</literalValue>
        <name>Set Planning Call Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Reason_for_Exclusion_from_MMB_to</fullName>
        <field>ReasonForExclusionFromMMB__c</field>
        <literalValue>Pre-Paid Returns</literalValue>
        <name>Set Reason for Exclusion to Pre-Paid</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Reason_for_Exclusion_to_1_100</fullName>
        <field>ReasonForExclusionFromMMB__c</field>
        <literalValue>1 - 100</literalValue>
        <name>Set Reason for Exclusion to 1-100</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_SST_Status</fullName>
        <field>SST_Status__c</field>
        <literalValue>Canceled</literalValue>
        <name>Set SST Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Account_Activation_Date</fullName>
        <field>msdAccount_Activation_Date__c</field>
        <formula>Today()</formula>
        <name>Stamp Account Activation Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Account_Activation_Date_DEV</fullName>
        <field>AccountActivationDate_DEV__c</field>
        <formula>Today()</formula>
        <name>Stamp Account Activation Date (DEV)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Account_Level_Calc_Live_Date</fullName>
        <field>AvaTax_Live_Date__c</field>
        <formula>Calc_Live_Date__c</formula>
        <name>Stamp Account Level Calc Live Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Account__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_AvaTax_Webinar_FollowUp_Dt</fullName>
        <description>Date Sent: AvaTax Webinar FollowUp</description>
        <field>Sent_AvaTax_Webinar_FollowUp__c</field>
        <formula>TODAY()</formula>
        <name>Stamp AvaTax Webinar FollowUp Dt</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Calc_Delay_Timestamp</fullName>
        <field>Calc_Delay_Timestamp__c</field>
        <formula>NOW()</formula>
        <name>Stamp Calc Delay Timestamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Calc_Estimation</fullName>
        <field>Calc_Estimation__c</field>
        <formula>IF(ISBLANK( DesiredCalcLiveDate_from_Opp__c) ,Today() + Connector__r.Calc_Velocity2__c, DesiredCalcLiveDate_from_Opp__c)</formula>
        <name>Stamp Calc Estimation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Calc_Estimation2</fullName>
        <field>Calc_Estimation__c</field>
        <formula>DesiredCalcLiveDate_from_Opp__c</formula>
        <name>Stamp Calc Estimation 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Calc_First_Est_Date</fullName>
        <description>Maintains first calc estimation date ever entered</description>
        <field>Calc_First_Est_Date__c</field>
        <formula>Calc_Estimation__c</formula>
        <name>Stamp Calc First Est Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Calc_Live_Date</fullName>
        <field>Calc_Live_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Calc Live Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Calc_Live_GLC2</fullName>
        <field>Calc_Live_GLC__c</field>
        <formula>IF( Has_Calc__c =1,Ava_GoLive_Coordinator__r.FirstName &amp; &quot; &quot; &amp;  Ava_GoLive_Coordinator__r.LastName,&quot;&quot;)</formula>
        <name>Stamp Calc Live GLC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Call_Campaign_Last_Call_Date</fullName>
        <description>Updated each time the call campaign dropdown is changed.</description>
        <field>Call_Campaign_Last_Call_Date__c</field>
        <formula>today()</formula>
        <name>Stamp Call Campaign Last Call Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Call_Campaign_Last_Result</fullName>
        <field>Call_Campaign_Last_Result__c</field>
        <formula>TEXT(Call_Campaign_Result__c)</formula>
        <name>Stamp Call Campaign Last Result</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_CertCaptureWebinar_FollowUp_Dt</fullName>
        <field>Sent_CertCapture_Webinar_FollowUp__c</field>
        <formula>TODAY()</formula>
        <name>Stamp CertCaptureWebinar FollowUp Dt</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Certs_Delay_Timestamp_on_change</fullName>
        <field>Calc_Delay_Timestamp__c</field>
        <formula>NOW()</formula>
        <name>Stamp Certs Delay Timestamp on change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Certs_Estimation</fullName>
        <field>Certs_Estimation__c</field>
        <formula>IF(AND(ISBLANK( DesiredCertsLiveDate_from_Opp__c ), Has_Certs__c &gt;0) ,Today() + Connector__r.Certs_Velocity2__c,  DesiredCertsLiveDate_from_Opp__c )</formula>
        <name>Stamp Certs Estimation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Certs_Live_Date</fullName>
        <field>CertCapture_Live_Date__c</field>
        <formula>Certs_Live_Date__c</formula>
        <name>Stamp Certs Live Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Account__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Certs_Live_Date</fullName>
        <field>Certs_Live_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Certs Live Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Certs_Live_GLC</fullName>
        <description>Stamp the name of the GoLive Consultant who owned the GoLive at the time Certs was marked Live</description>
        <field>Certs_Live_GLC__c</field>
        <formula>IF(Has_Certs__c =1,Ava_GoLive_Coordinator__r.FirstName &amp; &quot; &quot; &amp;  Ava_GoLive_Coordinator__r.LastName,&quot;&quot;)</formula>
        <name>Stamp Certs Live GLC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Confidence_CC_Estimate</fullName>
        <field>Confidence_in_Estimate_CC__c</field>
        <literalValue>Med</literalValue>
        <name>Stamp Confidence (CC Estimate)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Confidence_Calc_Estimate</fullName>
        <field>Confidence_in_Estimate_Calc__c</field>
        <literalValue>Med</literalValue>
        <name>Stamp Confidence (Calc Estimate)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Confidence_Returns_Estimate</fullName>
        <field>Confidence_in_Estimate_Returns__c</field>
        <literalValue>Med</literalValue>
        <name>Stamp Confidence (Returns Estimate)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Confidence_in_Estimate</fullName>
        <field>Confidence_in_Estimate_Calc__c</field>
        <literalValue>Med</literalValue>
        <name>Stamp Confidence in Estimate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Confirmed_FC_Complete</fullName>
        <field>Date_Completed_Filing_Calendar_Submittal__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Confirmed FC Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Date_MRO_Filing_Calendar_Complete</fullName>
        <description>Date stamp the MRO Filing Calendar Comlete field to understand workflow and SLA.</description>
        <field>Date_MRO_Filing_Calendar_Complete__c</field>
        <formula>today()</formula>
        <name>Stamp Date MRO Filing Calendar Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Date_MRO_Packet_Received</fullName>
        <description>Date stamp the MRO Packet Received field to understand workflow and SLA.</description>
        <field>Date_MRO_Packet_Received__c</field>
        <formula>today()</formula>
        <name>Stamp Date MRO Packet Received</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Date_MRO_Packet_Sent</fullName>
        <field>Date_MRO_Packet_Sent__c</field>
        <formula>today()</formula>
        <name>Stamp Date MRO Packet Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Date_Planning_Call_Completed</fullName>
        <field>Date_Planning_Call_Completed__c</field>
        <formula>today()</formula>
        <name>Stamp Date Planning Call Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Date_Survey_Ready_TRUE</fullName>
        <field>Trigger_Date_Survey__c</field>
        <literalValue>1</literalValue>
        <name>Stamp Date Survey Ready = TRUE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Date_Welcome_Letter_Sent</fullName>
        <field>Date_Welcome_Letter_Sent__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Date Welcome Letter Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Date_of_CAM_Notification_of_Return</fullName>
        <field>CAM_Notification_Sent_Returns_Cancel__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Date of CAM Notification of Return</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Date_of_Customer_Notification</fullName>
        <field>Customer_Notice_Sent_Returns_Canclation__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Date of Customer Notification</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Date_of_Final_Review_Handoff_to_Su</fullName>
        <field>Date_of_Final_Review_Call_AvaTax__c</field>
        <formula>today()</formula>
        <name>Stamp Date of Final Review/Handoff to Su</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Date_of_Going_Live_Review_Call</fullName>
        <field>Date_of_Going_Live_Review_Call_Certs__c</field>
        <formula>today()</formula>
        <name>Stamp Date of Going Live Review Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Date_of_Pre_Live_Review_Call</fullName>
        <field>Date_of_Going_Live_Review_Call_AvaTax__c</field>
        <formula>today()</formula>
        <name>Stamp Date of Pre-Live Review Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Date_of_Project_Plan_Sent</fullName>
        <field>Date_Project_Plan_Sent__c</field>
        <formula>today()</formula>
        <name>Stamp Date of Project Plan Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Date_of_Welcome_Call</fullName>
        <field>Date_of_Welcome_Call__c</field>
        <formula>today()</formula>
        <name>Stamp Date of Welcome Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Default_Implementation_Path_Manage</fullName>
        <field>Implementation_Path__c</field>
        <literalValue>Managed</literalValue>
        <name>Stamp Default Implementation Path Manage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Docs_Received_Log_Entry</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot;Auto Notification: Managed Returns Team notified that this customer is ready for review!&quot;</formula>
        <name>Stamp Docs Received Log Entry</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Escalation_Mgr_Last_Log_Date</fullName>
        <field>Escalation_Reviewed__c</field>
        <formula>IF($User.LastName=Escalation_Manager__r.LastName,TODAY(), Escalation_Reviewed__c )</formula>
        <name>Stamp Escalation Mgr Last Log Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Estimated_First_Filing_Date</fullName>
        <field>Returns_Estimation__c</field>
        <formula>IF( ISBLANK(AvalaraFirstFilingDate_from_Opp__c ),IF(OR(ISBLANK(Calc_Estimation__c),ISBLANK(  Primary_Returns_Name__c )),
Returns_Estimation__c ,

IF(AND(DAY( Calc_Estimation__c )=1,MONTH(Calc_Estimation__c )+1&gt;12),
DATE(
YEAR(Calc_Estimation__c ),
MONTH(Calc_Estimation__c )+1-12,
1),

IF(AND(DAY( Calc_Estimation__c )=1,MONTH(Calc_Estimation__c )+1&lt;=12),
DATE(
YEAR(Calc_Estimation__c ),
MONTH(Calc_Estimation__c )+1,
1),

IF(AND(DAY( Calc_Estimation__c )&lt;&gt;1,MONTH(Calc_Estimation__c )+2&gt;12),
DATE(
YEAR(Calc_Estimation__c ),
MONTH(Calc_Estimation__c )+2-12,
1),

DATE(
YEAR(Calc_Estimation__c ),
MONTH(Calc_Estimation__c )+2,
1))))),AvalaraFirstFilingDate_from_Opp__c )</formula>
        <name>Stamp Estimated First Filing Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_File_Request_Prior</fullName>
        <field>File_Request_Prior_Submitted__c</field>
        <formula>PRIORVALUE( FileRequest_Submitted__c )</formula>
        <name>Stamp File Request Prior</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Final_Review_Call_Returns</fullName>
        <field>Date_of_Final_Review_Call_Returns__c</field>
        <formula>today()</formula>
        <name>Stamp Final Review Call (Returns)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_First_Activation_Fee_Rebill_Date</fullName>
        <field>First_Activation_Rebill_Date__c</field>
        <formula>Source_Quote__r.zqu__Service_Activation_Date__c + 90</formula>
        <name>Stamp First Activation Fee Rebill Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_GLC_Last_Log_Update</fullName>
        <field>GLC_Last_Log_Update__c</field>
        <formula>TODAY()</formula>
        <name>Stamp GLC Last Log Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_GLC_Log_Entry_Date</fullName>
        <description>When the owner of the GoLive updated the log
Update Request: https://jira.avalara.com/browse/IBST-10497</description>
        <field>GLC_Last_Log_Update__c</field>
        <formula>TODAY()</formula>
        <name>Stamp GLC Log Entry Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_GoLive_Assignment_Date</fullName>
        <field>Assigned__c</field>
        <formula>now()</formula>
        <name>Stamp GoLive Assignment Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Intro_Follow_Up_Call_Date</fullName>
        <field>Date_of_Welcome_Call__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Intro/Follow Up Call Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Pre_Implementation_Survey_Review_d</fullName>
        <field>Date_Pre_Implementation_Survey_Reviewed__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Pre-Implementation Survey Review d</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Re_bill_Fee</fullName>
        <field>Min_Re_Bill_Amt__c</field>
        <formula>IF( ReturnsLevel__c = 15,89,

IF( ReturnsLevel__c = 40,189,

IF( ReturnsLevel__c = 100,495,

NULL)))</formula>
        <name>Stamp Re-bill Fee</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Returns_Cancel_Date</fullName>
        <field>Returns_Cancelation_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Returns Cancel Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Returns_Delay_Timestamp_on_change</fullName>
        <field>Returns_Delay_Timestamp__c</field>
        <formula>NOW()</formula>
        <name>Stamp Returns Delay Timestamp on change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Returns_Live_Date</fullName>
        <field>Returns_Live_Date__c</field>
        <formula>today()</formula>
        <name>Stamp Returns Live Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Returns_Live_GLC</fullName>
        <description>Stamp the name of the GoLive Consultant who owned the GoLive at the time Returns was marked Scheduled</description>
        <field>Returns_Live_GLC__c</field>
        <formula>IF(OR(Has_Returns__c =1, Has_SST__c =1),Ava_GoLive_Coordinator__r.FirstName &amp; &quot; &quot; &amp;  Ava_GoLive_Coordinator__r.LastName,&quot;&quot;)</formula>
        <name>Stamp Returns Live GLC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Returns_Status_Active</fullName>
        <field>Returns_Status__c</field>
        <literalValue>Active</literalValue>
        <name>Stamp Returns Status = Active</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Returns_Webinar_FollowUp_Dt</fullName>
        <field>Sent_Returns_Webinar_FollowUp__c</field>
        <formula>today()</formula>
        <name>Stamp Returns Webinar FollowUp Dt</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_SST_Live_Date</fullName>
        <field>Returns_Live_Date__c</field>
        <formula>SST_Live_Date__c</formula>
        <name>Stamp SST Live Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_SST_Live_Date_Account</fullName>
        <field>SST_Live_Date__c</field>
        <formula>SST_Live_Date__c</formula>
        <name>Stamp SST Live Date Account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Account__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Sent_GLI_Assessment_Survey</fullName>
        <description>Stamp date in GLI Assessment Survey</description>
        <field>Sent_GLI_Assessment_Survey__c</field>
        <formula>today()</formula>
        <name>Stamp Sent GLI Assessment Survey</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Stamp_MRO_Start_Validation</fullName>
        <description>Stamp Date MRO Start Validation based on Returns Documentation Status = RMO - Working / Researching.</description>
        <field>Date_MRO_Start_Validation__c</field>
        <formula>today()</formula>
        <name>Stamp Stamp MRO Start Validation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_date_of_LWS_Review</fullName>
        <field>Date_of_LWS_Review_Call_Returns__c</field>
        <formula>today()</formula>
        <name>Stamp date of LWS Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_date_of_final_review</fullName>
        <field>Date_of_Final_Review_Call_Certs__c</field>
        <formula>today()</formula>
        <name>Stamp date of final review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_date_of_planning_call</fullName>
        <field>Date_Planning_Call_Completed__c</field>
        <formula>today()</formula>
        <name>Stamp date of planning call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Update_Avalara_Delay</fullName>
        <field>Calc_Status__c</field>
        <literalValue>Avalara Delay</literalValue>
        <name>Status Update: Avalara Delay</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Track_Calc_Est_Month</fullName>
        <field>Forecast_Change_Trend_Calc__c</field>
        <formula>Forecast_Change_Trend_Calc__c &amp;&quot; &quot;&amp;Calc_Est_Month__c&amp;&quot;,&quot;</formula>
        <name>Track Calc Est Month</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Track_Certs_Est_Month</fullName>
        <field>Forecast_Change_Trend_Certs__c</field>
        <formula>Forecast_Change_Trend_Certs__c &amp;&quot; &quot;&amp;Certs_Est_Month__c&amp;&quot;,&quot;</formula>
        <name>Track Certs Est Month</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Track_Returns_Est_Month</fullName>
        <field>Forecast_Change_Trend_Returns__c</field>
        <formula>Forecast_Change_Trend_Returns__c &amp;&quot; &quot;&amp;Returns_Est_Month__c&amp;&quot;,&quot;</formula>
        <name>Track Returns Est Month</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Transaction_Posted_Log_Entry_2</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - Auto Milestone Status Email Sent to Customer - Post a Transaction Reminder #2&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Transaction Posted Log Entry 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Transaction_Posted_Log_Entry_4</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - Auto Milestone Status Email Sent to Customer - Post a Transaction Reminder #4&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Transaction Posted Log Entry 4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Transaction_Posted_Log_Entry_FINAL</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot;Customer has not made a milestone update for 8 days.  The only remaining Milestone is for them to Post a Transaction.  Status has automatically been updated to Client Delay and they have been pulled out of the GoLive Automation workflow.&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Transaction Posted Log Entry - FINAL</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Transaction_Posted_Log_entry_3</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - Auto Milestone Status Email Sent to Customer - Post a Transaction Reminder #3&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Transaction Posted Log entry 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Active_GLC_Status</fullName>
        <field>Calc_Status__c</field>
        <literalValue>Active</literalValue>
        <name>Update Active GLC Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Active_SS_Status</fullName>
        <field>Calc_Status__c</field>
        <literalValue>Active</literalValue>
        <name>Update Active SS Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Calc_Status_Active</fullName>
        <field>Calc_Status__c</field>
        <literalValue>Active</literalValue>
        <name>Update Calc Status Active</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Calc_Status_Live</fullName>
        <field>Calc_Status__c</field>
        <literalValue>Live</literalValue>
        <name>Update Calc Status Live</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Certs_Migration_Date</fullName>
        <field>CERT_Migration_Created_Date__c</field>
        <formula>Today()</formula>
        <name>Update Certs Migration Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Certs_Status_Active</fullName>
        <field>Certs_Status__c</field>
        <literalValue>Actively Engaged GLC</literalValue>
        <name>Update Certs Status Active</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Certs_Status_Live</fullName>
        <field>Certs_Status__c</field>
        <literalValue>Live</literalValue>
        <name>Update Certs Status Live</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Connector_Risk</fullName>
        <field>Risk_Family__c</field>
        <literalValue>Calc</literalValue>
        <name>Update Connector Risk Family</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_GLC_Last_Log_Update</fullName>
        <field>GLC_Last_Log_Update__c</field>
        <formula>IF( IsCurrentUser__c=&quot;Yes&quot; ,Today(), GLC_Last_Log_Update__c )</formula>
        <name>Update GLC Last Log Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_GoLive_Log</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot;Returns Onboarding Packet sent to the customer&quot;</formula>
        <name>Update GoLive Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_GoLive_Log9</fullName>
        <description>Stamp the GoLive log</description>
        <field>Log_Entry__c</field>
        <formula>&quot;Escalated to RSM and CAM via email (attached)&quot;</formula>
        <name>Update GoLive Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_GoLive_Log_MRO_FC_Complete</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot;Filing Calendar Complete&quot;</formula>
        <name>Update GoLive Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_GoLive_Log_MRO_recieved</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot;Returns Packet received from Customer.&quot;</formula>
        <name>Update GoLive Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_GoLive_Log_SST</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot; SST GoLive Marked as Live for &quot; &amp; TEXT( SST_Live_Date__c )</formula>
        <name>Update GoLive Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_GoLive_Log_for_Go_Program</fullName>
        <field>Log_Summary__c</field>
        <formula>&quot;--- &quot;&amp; &quot;Email&quot; &amp; &quot;: &quot;&amp; $User.LastName &amp; &quot; &quot; &amp; $User.LastName &amp; &quot;: &quot;&amp; TEXT(NOW()) &amp; &quot;: &quot;&amp; &quot;Sent email - Go! Program Invitation via workflow (Master SS Welcome Letter - CALC Only). &quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Update GoLive Log for GO! Program</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Log_Entry_Field3</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot;Sent email - CertCapture Webinar reminder via workflow (Mass: Send Invite to CertCpature Webinar). &quot;</formula>
        <name>Update Log Entry Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Log_Entry_field</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot;Sent email - GETTING STARTED WITH AVALARA AVATAX webinar via workflow (Mass: Send Invite to Intro Admin Console). &quot;</formula>
        <name>Update Log Entry field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Log_Summary</fullName>
        <field>Log_Summary__c</field>
        <formula>&quot;--- &quot;&amp; TEXT(Log_Type__c) &amp; &quot;: &quot;&amp; $User.FirstName &amp; &quot; &quot; &amp; $User.LastName &amp; &quot;: &quot;&amp; TEXT(NOW()) &amp; &quot;: &quot;&amp; Log_Entry__c &amp; BR() &amp; Log_Summary__c</formula>
        <name>Update Log Summary</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Log_Summary2</fullName>
        <field>Log_Summary__c</field>
        <formula>&quot;--- &quot;&amp; &quot;Email&quot; &amp; &quot;: &quot;&amp; $User.LastName &amp; &quot;: &quot;&amp; TEXT(NOW()) &amp; &quot;: &quot;&amp; &quot;Sent mass email requesting updated First Filing Date&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Update Log Summary</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Log_Summary3</fullName>
        <field>Log_Summary__c</field>
        <formula>&quot;--- &quot;&amp; &quot;Email&quot; &amp; &quot;: &quot;&amp; $User.LastName &amp; &quot;: &quot;&amp; TEXT(NOW()) &amp; &quot;: &quot;&amp; &quot;Sent mass email requesting filing date confirmation&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Update Log Summary</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Log_Summary_w_AvaTax_Status_Email</fullName>
        <field>Log_Summary__c</field>
        <formula>TEXT(Today()) &amp; &quot; - Record included in a MASS Send AvaTax Email on demand triggered by &quot; &amp;  $User.Full_Name__c  &amp; BR() &amp; Log_Summary__c</formula>
        <name>Update Log Summary w AvaTax Status Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Log_for_Invite_to_Admin_Console</fullName>
        <field>Log_Summary__c</field>
        <formula>&quot;--- &quot;&amp; &quot;Email&quot; &amp; &quot;: &quot;&amp; $User.LastName &amp; &quot; &quot; &amp; $User.LastName &amp; &quot;: &quot;&amp; TEXT(NOW()) &amp; &quot;: &quot;&amp; &quot;Sent email - GETTING STARTED WITH AVALARA AVATAX webinar via workflow (Mass: Send Invite to Intro Admin Console). &quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Update Log for Invite to Admin Console</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Log_for_Invite_to_Magento</fullName>
        <field>Log_Summary__c</field>
        <formula>&quot;--- &quot;&amp; &quot;Email&quot; &amp; &quot;: &quot;&amp; $User.LastName &amp; &quot; &quot; &amp; $User.LastName &amp; &quot;: &quot;&amp; TEXT(NOW()) &amp; &quot;: &quot;&amp; &quot;Sent email - GETTING STARTED WITH Magento webinar via workflow (Mass: Send Invite to Magento webinar). &quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Update Log for Invite to Magento</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Log_for_Invite_to_QuickBooks</fullName>
        <field>Log_Summary__c</field>
        <formula>&quot;--- &quot;&amp; &quot;Email&quot; &amp; &quot;: &quot;&amp; $User.LastName &amp; &quot; &quot; &amp; $User.LastName &amp; &quot;: &quot;&amp; TEXT(NOW()) &amp; &quot;: &quot;&amp; &quot;Sent email - GETTING STARTED WITH QUICKBOOKS webinar via workflow (Mass: Send Invite to QuickBooks webinar). &quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Update Log for Invite to QuickBooks</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Log_for_Returns_Offer</fullName>
        <field>Log_Summary__c</field>
        <formula>&quot;--- &quot;&amp; &quot;Email&quot; &amp; &quot;: &quot;&amp; $User.FirstName &amp; &quot; &quot; &amp; $User.LastName  &amp; &quot;: &quot;&amp; TEXT(NOW()) &amp; &quot;: &quot;&amp; &quot;Sent mass email reminding of Dec 2014 Returns Offer. &quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Update Log for Returns Offer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Log_for_Returns_e_mail_No_Est_FF</fullName>
        <field>Log_Summary__c</field>
        <formula>&quot;--- &quot;&amp; &quot;Email&quot; &amp; &quot;: &quot;&amp; $User.LastName &amp; &quot; &quot; &amp; $User.LastName &amp; &quot;: &quot;&amp; TEXT(NOW()) &amp; &quot;: &quot;&amp; &quot;Sent email - No Est FF Date (Mass: No EFF Date, Live on Calc, Request Date). &quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Update Log for Returns e-mail No Est FF</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Mass_Calc_Confirm_Log_Entry</fullName>
        <field>Log_Summary__c</field>
        <formula>&quot;--- &quot;&amp; &quot;Email&quot; &amp; &quot;: &quot;&amp; $User.LastName &amp; &quot;: &quot;&amp; TEXT(NOW()) &amp; &quot;: &quot;&amp; &quot;Sent mass email requesting updated Calc Estimation Date&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Update Mass Calc Confirm Log Entry</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Migration_Date</fullName>
        <field>Migration_Created_Date__c</field>
        <formula>Today()</formula>
        <name>Update Calc Migration Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Product_Risk</fullName>
        <field>Product_Risk__c</field>
        <literalValue>Connector</literalValue>
        <name>Update Product Risk</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Returns_Migration_Date</fullName>
        <field>RETURNS_Migration_Created_Date__c</field>
        <formula>Today()</formula>
        <name>Update Returns Migration Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Returns_Status_Active</fullName>
        <field>Returns_Status__c</field>
        <literalValue>Actively Engaged GLC</literalValue>
        <name>Update Returns Status Active</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Returns_Status_Live</fullName>
        <field>Returns_Status__c</field>
        <literalValue>Live</literalValue>
        <name>Update Returns Status Live</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Risk_Date</fullName>
        <field>Risk_Date__c</field>
        <formula>Today()</formula>
        <name>Update Risk Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Total_Time_Spent_GoLive</fullName>
        <field>Total_Time_Spent_GoLive__c</field>
        <formula>IF(ISBLANK( Total_Time_Spent_GoLive__c ), Time_Spent_GoLive__c ,  Total_Time_Spent_GoLive__c + Time_Spent_GoLive__c)</formula>
        <name>Update Total Time Spent_GoLive</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Total_Time_Spent_Support</fullName>
        <field>Total_Time_Spent_Support__c</field>
        <formula>IF(ISBLANK(Total_Time_Spent_Support__c),Time_Spent_Support__c, Total_Time_Spent_Support__c + Time_Spent_Support__c)</formula>
        <name>Update Total Time Spent_Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Welcome_Letter_Sent</fullName>
        <field>Welcome_Letter_Sent__c</field>
        <literalValue>1</literalValue>
        <name>Update Welcome Letter Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_log</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot;Sent email to Returns customers, reminding them of the deadline&quot;</formula>
        <name>Update log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_log_MASS_Calc_No_estimate</fullName>
        <field>Log_Entry__c</field>
        <formula>&quot;Sent MASS: Calc – No estimate letter&quot;</formula>
        <name>Log Entry: MASS CALC No Estimate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_log_for_LWS_Reminder</fullName>
        <field>Log_Summary__c</field>
        <formula>&quot;--- &quot;&amp; &quot;Email&quot; &amp; &quot;: &quot;&amp; $User.LastName &amp; &quot;: &quot;&amp; TEXT(NOW()) &amp; &quot;: &quot;&amp; &quot;Sent mass email reminding of Liability Worksheet for first filing period. &quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Update log for LWS Reminder</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Updatte_Mss_Calc_Log_Summary</fullName>
        <field>Log_Summary__c</field>
        <formula>&quot;--- &quot;&amp; &quot;Email&quot; &amp; &quot;: &quot;&amp; $User.LastName &amp; &quot;: &quot;&amp; TEXT(NOW()) &amp; &quot;: &quot;&amp; &quot;Sent mass email requesting updated Calc estimate&quot; &amp; BR() &amp; Log_Summary__c</formula>
        <name>Updatte Mss Calc Log Summary</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Welcome_Letter_Log_Stamp</fullName>
        <field>Log_Entry__c</field>
        <formula>Connector__r.Name  &amp; &quot; Welcome Letter Sent to &quot; &amp;  Primary_GoLive_Contact__r.FirstName &amp; &quot; &quot; &amp;  Primary_GoLive_Contact__r.LastName</formula>
        <name>Welcome Letter Log Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <flowActions>
        <fullName>Check_Compliance_Contact_on_Contact_Record</fullName>
        <flow>Check_Compliance_Contact_on_Contact_Record</flow>
        <flowInputs>
            <name>ContactID</name>
            <value>{!Primary_Compliance_Contact__r.Id}</value>
        </flowInputs>
        <label>Check Compliance Contact on Contact Record</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>Snapshot_GLI_Workload</fullName>
        <flow>Snapshot_GLI_Workload</flow>
        <flowInputs>
            <name>Connector</name>
            <value>{!Connector__r.Name}</value>
        </flowInputs>
        <flowInputs>
            <name>Consultant</name>
            <value>{!Ava_GoLive_Coordinator__r.LastName}</value>
        </flowInputs>
        <flowInputs>
            <name>GLIID</name>
            <value>{!Id}</value>
        </flowInputs>
        <flowInputs>
            <name>GLIName</name>
            <value>{!Name}</value>
        </flowInputs>
        <label>Snapshot GLI Workload</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>Stamp_Opp_Notes_Add_On_Calc</fullName>
        <flow>Stamp_Opportunity_Notes_on_GLI</flow>
        <flowInputs>
            <name>ChargeID</name>
            <value>{!Add_On_Calc_Subscription__c}</value>
        </flowInputs>
        <flowInputs>
            <name>GLIID</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>Stamp Opp Notes - Add On Calc</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>Stamp_Opp_Notes_Add_On_Certs</fullName>
        <flow>Stamp_Opportunity_Notes_on_GLI</flow>
        <flowInputs>
            <name>ChargeID</name>
            <value>{!Add_On_Certs_Subscription__c}</value>
        </flowInputs>
        <flowInputs>
            <name>GLIID</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>Stamp Opp Notes - Add On Certs</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>Stamp_Opp_Notes_Add_On_PS</fullName>
        <flow>Stamp_Opportunity_Notes_on_GLI</flow>
        <flowInputs>
            <name>ChargeID</name>
            <value>{!Add_On_PS_Subscription__c}</value>
        </flowInputs>
        <flowInputs>
            <name>GLIID</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>Stamp Opp Notes - Add On PS</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>Stamp_Opp_Notes_Add_On_Returns</fullName>
        <flow>Stamp_Opportunity_Notes_on_GLI</flow>
        <flowInputs>
            <name>ChargeID</name>
            <value>{!Add_On_Returns_Subscription__c}</value>
        </flowInputs>
        <flowInputs>
            <name>GLIID</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>Stamp Opp Notes - Add On Returns</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>Stamp_Opp_Notes_Add_On_SST</fullName>
        <flow>Stamp_Opportunity_Notes_on_GLI</flow>
        <flowInputs>
            <name>ChargeID</name>
            <value>{!Add_On_SST_Subscription__c}</value>
        </flowInputs>
        <flowInputs>
            <name>GLIID</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>Stamp Opp Notes - Add On SST</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>Stamp_Opp_Notes_Primary_Calc</fullName>
        <flow>Stamp_Opportunity_Notes_on_GLI</flow>
        <flowInputs>
            <name>ChargeID</name>
            <value>{!Primary_Calc_Subscription__c}</value>
        </flowInputs>
        <flowInputs>
            <name>GLIID</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>Stamp Opp Notes - Primary Calc</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>Stamp_Pro_Basic_on_GLI</fullName>
        <flow>Stamp_Pro_Basic_on_GLI</flow>
        <flowInputs>
            <name>AddOnID</name>
            <value>{!Add_On_Calc_Subscription__c}</value>
        </flowInputs>
        <flowInputs>
            <name>GLIID</name>
            <value>{!Id}</value>
        </flowInputs>
        <flowInputs>
            <name>PrimaryID</name>
            <value>{!Primary_Calc_Subscription__c}</value>
        </flowInputs>
        <label>Stamp Pro/Basic on GLI</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>Stamp_Quote_Notes_v2</fullName>
        <flow>Stamp_Quote_Notes_v2</flow>
        <flowInputs>
            <name>GLIID</name>
            <value>{!Id}</value>
        </flowInputs>
        <flowInputs>
            <name>QuoteID</name>
            <value>{!Source_Quote__c}</value>
        </flowInputs>
        <label>Stamp Quote Notes v2</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>Stamp_Subscription_Product_Names_on_GLI</fullName>
        <flow>Stamp_Subscription_Product_Names_on_GLI</flow>
        <flowInputs>
            <name>GLIID</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>Stamp Subscription Product Names on GLI</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <outboundMessages>
        <fullName>GLI_Risks_Create_CAM_Case</fullName>
        <apiVersion>29.0</apiVersion>
        <description>Specific Blocking Risk Factors trigger CAM Case creation by sending an outbound message to Jitterbit</description>
        <endpointUrl>http://avajitter.avalara.com:46908/jitterbit_ws/?id=13bc6d6c-0095-4b46-82d4-9be782b203d8</endpointUrl>
        <fields>Account__c</fields>
        <fields>BlockingRiskFactor__c</fields>
        <fields>Id</fields>
        <fields>Primary_GoLive_Contact__c</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>clayton.wiggins@avalara.com</integrationUser>
        <name>GLI Risks Create CAM Case</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>30 Day Returns Estimation Slipped</fullName>
        <active>true</active>
        <description>Purpose: Track 30 day delta between old returns estimation and new returns estimation
Integrated: No
Change: Level 0
Custodian: Golive Director</description>
        <formula>AND(NOT(ISBLANK( Returns_Estimation__c )), Returns_Estimation__c - PRIORVALUE( Returns_Estimation__c) &gt; 30 )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>AddOn GoLive PS Created Alert</fullName>
        <actions>
            <name>Alert_PS_GoLive_Created</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Professional Services Add On</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Validation_Exempt__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Calc Active Status Update</fullName>
        <actions>
            <name>Calc_Status_Active</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>equals</operation>
            <value>Nurtured,Opportunity,Unresponsive</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Estimation__c</field>
            <operation>greaterOrEqual</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Calc Client Delay Play %5BAutomation%5D</fullName>
        <actions>
            <name>Send_Client_Delay_Survey</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Log_Client_Delay_Survey_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>equals</operation>
            <value>Client Delay</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Customer_Start_Date__c</field>
            <operation>lessThan</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Implementation_Path__c</field>
            <operation>equals</operation>
            <value>Self-Serve,Assisted</value>
        </criteriaItems>
        <description>NEEDS Update</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Calc First Est Stamp</fullName>
        <actions>
            <name>Stamp_Calc_First_Est_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Estimation__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_First_Est_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Calc Status Blocked</fullName>
        <actions>
            <name>Calc_Status_Blocked</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>GoLive_Implementation__c.Delay__c</field>
            <operation>contains</operation>
            <value>Blocked</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Delay__c</field>
            <operation>contains</operation>
            <value>Inoperable</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Calc Status UnBlocked - Active</fullName>
        <actions>
            <name>Update_Calc_Status_Active</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Delay__c</field>
            <operation>notContain</operation>
            <value>Blocked,Inoperable</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>equals</operation>
            <value>Blocked</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Unblock_Nurture_Unreposnsive_Logic_CALC__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>notEqual</operation>
            <value>Live,Canceled</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Calc Status UnBlocked - Nurture</fullName>
        <actions>
            <name>Notify_CAM_and_Salesperson_of_unresponsive_customer</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Calc_Status_Nurture</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Delay__c</field>
            <operation>notContain</operation>
            <value>Blocked</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>equals</operation>
            <value>Blocked</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Unblock_Nurture_Unreposnsive_Logic_CALC__c</field>
            <operation>equals</operation>
            <value>Nurture</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>notEqual</operation>
            <value>Live,Canceled</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Calc Status UnBlocked - Unresponsive</fullName>
        <actions>
            <name>Calc_Status_Unresponsive</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Delay__c</field>
            <operation>notContain</operation>
            <value>Blocked</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>equals</operation>
            <value>Blocked</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Unblock_Nurture_Unreposnsive_Logic_CALC__c</field>
            <operation>equals</operation>
            <value>Unresponsive</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>notEqual</operation>
            <value>Live,Canceled</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Call Campaign Calc Date</fullName>
        <actions>
            <name>Call_Campaign_Calc_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED(Calc_Estimation__c),  $User.Id = &quot;00540000002hz7S&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Call Campaign Certs Date</fullName>
        <actions>
            <name>Call_Campaign_Certs_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED( Certs_Estimation__c ),  $User.Id = &quot;00540000002hz7S&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Call Campaign Returns Date</fullName>
        <actions>
            <name>Call_Campaign_Returns_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>AND(ISCHANGED(  Returns_Estimation__c ),  $User.Id = &quot;00540000002hz7S&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cancel Calc</fullName>
        <actions>
            <name>Cancel_Calc</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Cancelation_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cancel Certs</fullName>
        <actions>
            <name>Cancel_Certs</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Cancelation_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cancel Rturns</fullName>
        <actions>
            <name>Cancel_Returns</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Cancelation_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cancel SST</fullName>
        <actions>
            <name>Set_SST_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.SST_Cancellation_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.SST_Status__c</field>
            <operation>notEqual</operation>
            <value>Live,Canceled</value>
        </criteriaItems>
        <description>Change the SST Status to Cancelled if the cancellation SST Cancellation Date is filled in</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Certs Active Status Update</fullName>
        <actions>
            <name>Certs_Status_Active</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Status__c</field>
            <operation>equals</operation>
            <value>Nurtured,Opportunity,Unresponsive</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Estimation__c</field>
            <operation>greaterOrEqual</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Certs First Est Stamp</fullName>
        <actions>
            <name>Certs_First_Est_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Estimation__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Certs Status Blocked</fullName>
        <actions>
            <name>Certs_Status_Blocked</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.CertCapture_Delay__c</field>
            <operation>contains</operation>
            <value>Blocked</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Certs Status UnBlocked - Active</fullName>
        <actions>
            <name>Certs_Status_Active</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.CertCapture_Delay__c</field>
            <operation>notContain</operation>
            <value>Blocked</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Status__c</field>
            <operation>equals</operation>
            <value>Blocked</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Unblock_Nurture_Unresponsive_logic_CERTS__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Status__c</field>
            <operation>notEqual</operation>
            <value>Live,Canceled</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Certs Status UnBlocked - Nurtured</fullName>
        <actions>
            <name>Certs_Status_Nurtured</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.CertCapture_Delay__c</field>
            <operation>notContain</operation>
            <value>Blocked</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Status__c</field>
            <operation>equals</operation>
            <value>Blocked</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Unblock_Nurture_Unresponsive_logic_CERTS__c</field>
            <operation>equals</operation>
            <value>Nurture</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Status__c</field>
            <operation>notEqual</operation>
            <value>Live,Canceled</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Certs Status UnBlocked - Unresponsive</fullName>
        <actions>
            <name>Notify_CAM_and_Salesperson_of_unresponsive_customer2</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Certs_Status_Unresponsive</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.CertCapture_Delay__c</field>
            <operation>notContain</operation>
            <value>Blocked</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Status__c</field>
            <operation>equals</operation>
            <value>Blocked</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Unblock_Nurture_Unresponsive_logic_CERTS__c</field>
            <operation>equals</operation>
            <value>Unresponsive</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Status__c</field>
            <operation>notEqual</operation>
            <value>Live,Canceled</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Check Compliance Contact on Contact record</fullName>
        <actions>
            <name>Check_Compliance_Contact_on_Contact_Record</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <formula>AND(NOT(ISBLANK( Primary_Compliance_Contact__c )),OR(ISNEW(),ISCHANGED(Primary_Compliance_Contact__c)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Check Needs CAM Case</fullName>
        <actions>
            <name>Check_Needs_CAM_Case2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.BlockingRiskFactor__c</field>
            <operation>equals</operation>
            <value>Customer - Customer Not Committed,Customer - No Immediate Business Value,Customer - No Intent to Use Product,Customer - Unresponsive,Payment - Non-Payment,Schedule - No Firm Commitment to Timeline,Terms - Customer Refuses Terms</value>
        </criteriaItems>
        <description>Checks the &apos;Needs CAM Case&apos; checkbox if pertinent blocking risk factors are identified.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Check Pre-Paid</fullName>
        <actions>
            <name>Check_Pre_Paid_Returns_checkbox_on_GLI</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2 OR 3 OR 4</booleanFilter>
        <criteriaItems>
            <field>GoLive_Implementation__c.Add_On_Returns_Name__c</field>
            <operation>contains</operation>
            <value>Pre-Pay,Pre-Purchased</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Primary_Returns_Name__c</field>
            <operation>contains</operation>
            <value>Pre-Pay,Pre-Purchased</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Add_On_Returns_Name__c</field>
            <operation>contains</operation>
            <value>Pre-Pay,Pre-Purchased</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Primary_Returns_Name__c</field>
            <operation>contains</operation>
            <value>Pre-Pay,Pre-Purchased</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Clear Calc Live GLC</fullName>
        <actions>
            <name>Clear_Calc_Live_GLC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>notEqual</operation>
            <value>Live</value>
        </criteriaItems>
        <description>something is erroneously filling in the Calc Live GLC, so this workflow is used to clear it</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Clear Certs Live GLC</fullName>
        <actions>
            <name>Clear_Certs_Live_GLC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Status__c</field>
            <operation>notEqual</operation>
            <value>Live</value>
        </criteriaItems>
        <description>something is erroneously filling in the Certs Live GLC, so this workflow is used to clear it</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Clear Confidence if Calc Est Blank</fullName>
        <actions>
            <name>Clear_Conf_Calc</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Estimation__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Clear Confidence if Certs Est Blank</fullName>
        <actions>
            <name>Clear_Conf_Certs</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Estimation__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Clear Confidence if Returns Est Blank</fullName>
        <actions>
            <name>Clear_Conf_Returns</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Estimation__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Clear Returns Live GLC</fullName>
        <actions>
            <name>Clear_Returns_Live_GLC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Status__c</field>
            <operation>notEqual</operation>
            <value>Live,Scheduled</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Has_Returns__c</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <description>something is erroneously filling in the Returns Live GLC, so this workflow is used to clear it</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Connectwise Override</fullName>
        <actions>
            <name>Remove_Calc_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Remove_Calc_Sub</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Primary_Calc_Name__c</field>
            <operation>contains</operation>
            <value>Connectwise</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Coordinator Assignment</fullName>
        <actions>
            <name>Coordinator_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Append_to_Log</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>GoLive Assignment Alert</description>
        <formula>AND(OR(ischanged(  Ava_GoLive_Coordinator__c )=true,isnew()=true), Ava_GoLive_Coordinator__r.Email &lt;&gt; &quot;support@avalara.com&quot;, Ava_GoLive_Coordinator__r.Email &lt;&gt; &quot;golive@avalara.com&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Days Until Reengage %5BAutomation%5D</fullName>
        <actions>
            <name>Clear_Days_Until_Reengage</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Cust_Start_Date_plus_Days_until_Reengage</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Days_Until_Reengage_Log_Entry</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Calc_Status_Client_Delay</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Delay_Customer_Delayed_Start</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.DaysUntilReengage__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Implementation_Path__c</field>
            <operation>equals</operation>
            <value>Self-Serve,Assisted</value>
        </criteriaItems>
        <description>NEEDS Update</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Default Calc Status</fullName>
        <actions>
            <name>Default_Calc_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Has_Calc__c</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <description>NEEDS Update</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Default Certs Status</fullName>
        <actions>
            <name>Default_Certs_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Has_Certs__c</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <description>NEEDS Update</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Default Returns Status</fullName>
        <actions>
            <name>Default_Returns_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Has_Returns__c</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Status__c</field>
            <operation>notEqual</operation>
            <value>,New</value>
        </criteriaItems>
        <description>Updates the Returns status to Active once the Has Returns is true (Has Returns is true if any of the subscription text boxes are filled in) and if the Returns Status is empty or &quot;New&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email GLC to Contact Customer %5BAutomation%5D</fullName>
        <actions>
            <name>Set_GLC_Contact_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.GLCRe__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Implementation_Path__c</field>
            <operation>equals</operation>
            <value>Self-Serve,Assisted</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Notify_GLC_of_Customer_Request_for_Contact</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Clear_Days_Until_GLC_Call</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Clear_GLC_Contact_Date</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>GoLive_Implementation__c.GLC_Contact_Date__c</offsetFromField>
            <timeLength>8</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Escalate to Sales and cc CAM</fullName>
        <actions>
            <name>Send_email_to_RSM_of_unresponsive_customer_and_cc_CAM</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Clear_Escalation_flag</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_GoLive_Log9</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Escalate_to_Sales_and_CAM__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Expire Business Implementation Path</fullName>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.SupportLevel__c</field>
            <operation>contains</operation>
            <value>Business</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Implementation_Status__c</field>
            <operation>equals</operation>
            <value>OPEN</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Entitlement_Status__c</field>
            <operation>notEqual</operation>
            <value>Expired</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>GoLive_Entitlement_Expiration_Workfkow</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>GoLive_Implementation__c.Entitlement_Date__c</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Expire Professional Implementation Path</fullName>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.SupportLevel__c</field>
            <operation>contains</operation>
            <value>Professional</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Implementation_Status__c</field>
            <operation>equals</operation>
            <value>OPEN</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Entitlement_Status__c</field>
            <operation>notEqual</operation>
            <value>Expired</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>GoLive_Entitlement_Expiration_Workfkow</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>GoLive_Implementation__c.Entitlement_Date__c</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Expire Quickstart Implementation Path</fullName>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.QuickStart__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Implementation_Status__c</field>
            <operation>equals</operation>
            <value>OPEN</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Entitlement_Status__c</field>
            <operation>equals</operation>
            <value>Expired</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>GoLive_Entitlement_Expiration_Workfkow</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>GoLive_Implementation__c.Entitlement_Date__c</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Flip Exclude from Velocity flag %3D true</fullName>
        <actions>
            <name>Flip_Exclude_from_Velocity_flag</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Flip Exclude from Velocity flag based on Delay</description>
        <formula>OR(TEXT(Delay__c) =&quot;CAM Case: Billing Issue or Pricing&quot;,TEXT(Delay__c) =&quot;CAM Case: CAM needs to resell product&quot;,TEXT(Delay__c) =&quot;CAM Case: Connector swap&quot;,TEXT(Delay__c) =&quot;CAM Case: Unresponsive Customer&quot;,TEXT(Delay__c) =&quot;Connector: Not Available&quot;,TEXT(Delay__c) =&quot;Connector: Not Meeting Needs&quot;,TEXT(Delay__c) =&quot;Solution as Sold Won&apos;t Work&quot;, Contains(UPPER( Connector__r.Name ),&quot;EPICOR&quot;),TEXT(Calc_Unforecasted_Root_Cause__c)=&quot;Connector Not Available&quot;,TEXT(Calc_Unforecasted_Root_Cause__c)=&quot;No Intent to Use&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Force Calc Estimation Today %2B 1</fullName>
        <actions>
            <name>Force_Calc_Estimation_Today_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED( Calc_Estimation__c ),Calc_Estimation__c &lt;= Today())</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Force SOHO GoLive</fullName>
        <actions>
            <name>Add_Automated_GoLive_User</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_Name_to_SOHO</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>TEXT(Connector__r.Platform_Cateogry__c) = &quot;Level 1&quot;</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Forecast Changes - Calc</fullName>
        <actions>
            <name>Add_1_Forecast_Change_Calc</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Purpose: On Calc Est Date change, count the # of times in a target field
Integrated: 
Change: Level 0 
Custodian: Golive Director</description>
        <formula>ISCHANGED(Calc_Estimation__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Forecast Changes - Certs</fullName>
        <actions>
            <name>Add_1_Forecast_Change_Certs</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Purpose: On Calc Est Date change, count the # of times in a target field
Integrated: 
Change: Level 0 
Custodian: Golive Director</description>
        <formula>ISCHANGED(Certs_Estimation__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Forecast Changes - Returns</fullName>
        <actions>
            <name>Add_1_Forecast_Change_Returns</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Purpose: On Returns Est Date change, count the # of times in a target field
Integrated: 
Change: Level 0 
Custodian: Golive Director</description>
        <formula>ISCHANGED(Returns_Estimation__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Forecast Month Changes - Calc</fullName>
        <actions>
            <name>Track_Calc_Est_Month</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Purpose: On Calc Est Monyh change, count the # of times in a target field
Integrated: 
Change: Level 0 
Custodian: Golive Director</description>
        <formula>AND(
ISCHANGED( Calc_Est_Month__c ),
NOT(ISBLANK(Calc_Est_Month__c)) 


)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Forecast Month Changes - Certs</fullName>
        <actions>
            <name>Track_Certs_Est_Month</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Purpose: On Certs Month change, count the # of times in a target field
Integrated: 
Change: Level 0 
Custodian: Golive Director</description>
        <formula>AND(
ISCHANGED(Certs_Est_Month__c),
NOT(ISBLANK(Certs_Est_Month__c)) 


)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Forecast Month Changes - Returns</fullName>
        <actions>
            <name>Track_Returns_Est_Month</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Purpose: On Returns Est Month change, count the # of times in a target field
Integrated: 
Change: Level 0 
Custodian: Golive Director</description>
        <formula>AND(
ISCHANGED(Returns_Est_Month__c),
NOT(ISBLANK(Returns_Est_Month__c)) 


)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>GoLive Consultant Assignment %28initial%29</fullName>
        <actions>
            <name>Stamp_GoLive_Assignment_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Ava_GoLive_Coordinator__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Assigned__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Ava_GoLive_Coordinator__c</field>
            <operation>notEqual</operation>
            <value>Gary Webb</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.OwnerId</field>
            <operation>notContain</operation>
            <value>ZTBuy</value>
        </criteriaItems>
        <description>First time a GoLive Consultant is assigned to a GoLive</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>GoLive marked LIVE - Calc</fullName>
        <actions>
            <name>Notify_Sales_Rep_and_CAM_of_Live_on_AvaTax_Calc</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Send_GoLive_Survey_Calc</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New,Calc Add On</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>equals</operation>
            <value>Live</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Validation_Exempt__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.OwnerId</field>
            <operation>notContain</operation>
            <value>ZTBuy</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Implementation_Path__c</field>
            <operation>equals</operation>
            <value>Assisted,Managed</value>
        </criteriaItems>
        <description>Notifies RSM and CAM of Live customer.  Sets follow-up task for final review.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>GoLive marked LIVE - Certs</fullName>
        <actions>
            <name>Notify_Sales_Rep_and_CAM_of_Live_on_CertCapture</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Send_GoLive_Survey_Certs</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New,Certs Add On</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Status__c</field>
            <operation>equals</operation>
            <value>Live</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Validation_Exempt__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Exclude_from_Automation__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Path_Certs__c</field>
            <operation>notEqual</operation>
            <value>Professional Services</value>
        </criteriaItems>
        <description>Notifies RSM and CAM of Live customer.  Sets follow-up task for final review.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>GoLive marked LIVE - Returns</fullName>
        <actions>
            <name>Notify_Sales_Rep_and_CAM_of_Live_on_AvaTax_Returns</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Send_GoLive_Survey_Returns</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New,Returns Add On</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Status__c</field>
            <operation>equals</operation>
            <value>Live</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Validation_Exempt__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Exclude_from_Automation__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Path_Returns__c</field>
            <operation>notEqual</operation>
            <value>Professional Services,Self-Serve</value>
        </criteriaItems>
        <description>Notifies RSM and CAM of Live customer.  Sets follow-up task for final review.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>GoLive%3A mass email to engage backlog</fullName>
        <actions>
            <name>Send_email_to_engage_backlog</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Append_to_GoLive_Log</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear_checkbox6</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Garin_Mass_GoLive_Backlog_email__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Intro %2F Welcome Letter Follow Up Call</fullName>
        <actions>
            <name>Set_Checkbox_for_Intro_Follow_Up_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Intro_Follow_Up_Call_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Log_Type__c</field>
            <operation>equals</operation>
            <value>Intro / Welcome Letter Follow Up Call</value>
        </criteriaItems>
        <description>Sets the checkbox and stamps the date for Intro / Welcome Letter Follow Up Call</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Log Entry Controller</fullName>
        <actions>
            <name>Add_Log_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear_Log_Entry</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear_Log_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Increment_GLC_Log_Update_Count</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Last_Log_Entry_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Escalation_Mgr_Last_Log_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_GLC_Log_Entry_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Log_Summary</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Log_Entry__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Maintain the GLI log entry controller</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Log says Migrate SDK</fullName>
        <actions>
            <name>New_Send_Ding_SDK_Ready_to_Migrate</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Log_Type__c</field>
            <operation>equals</operation>
            <value>SDK migration to production</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MASS Send AvaTax Status Email</fullName>
        <actions>
            <name>Send_Milestone_Status_Update</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Reset_MASS_Send_AvaTax_Status_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Log_Summary_w_AvaTax_Status_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.MASS_Send_AvaTax_Status_Email__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MASS%3A Calc %E2%80%93 No estimate</fullName>
        <actions>
            <name>MASS_Calc_No_estimate_Email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Reset_MASS_Calc_No_estimate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_log_MASS_Calc_No_estimate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>MASS_Calc_No_estimate</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.MASS_Calc_No_estimate__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <description>MASS: Calc – No estimate = Yes
Template = Forecast Calc Request</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MASS%3A Confirm Calc Estimation Date</fullName>
        <actions>
            <name>MASS_Forects_Calc_Estimation_Confirmatiion</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Log_Entry_MASS_Confirm_Calc_Estimate</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Reset_Mass_Calc_Forecast_Confirmation</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Mass_Email_Confirm_Calc_Estimation_Date_Sent</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.MASS_Confirm_Calc_Estimation_Date__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <description>MASS: Confirm Calc Estimation Date = Yes
Email Template	MASS: Forecast Calc Request</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MASS%3A Send Invite for GO Program</fullName>
        <actions>
            <name>Send_Invitation_for_GO_Program</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Log_Entry_MASS_Send_Invite_for_GO_Prog</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Reset_Mass_GO_Program_Invite</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Invitation_to_GO_Program</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.MASS_Confirm_GO_Program_Invite__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>MASS Confirm GO Program Invite = True
Email Template = Welcome Letter SELF-SERVE GO! Program</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MASS%3AFiling Date This Month</fullName>
        <actions>
            <name>MASS_Filing_Date_This_Month</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Log_Entry_MASS_Filing_Date_This_Month</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Reset_Mass_Filing_This_Month</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Mass_Email_Filing_Date_This_Month_Notice_Sent</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.MASS_Filing_Date_This_Month__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <description>Filing Date This Month = Yes
Email Template = MASS:Avalara Returns Confirm This Month</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MASS%3AFiling Date Update</fullName>
        <actions>
            <name>MASS_Returns_Intentions_a_b_c</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Log_entry</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Reset_Mass_Filing_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Mass_Email_Filing_Date_Passed_Notice_Sent</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.MASS_Filing_Date_Passed__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <description>MASS: Filing Date Update = Yes
Email Template = Forecast Returns Request</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MASS%3AGarin Calc Prioritizing You for This Month</fullName>
        <actions>
            <name>Send_email_to_all_CALC_customers_to_confirm_this_month</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Clear_Checkbox2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Log_Entry_Prioritizing_You_for_This_Mo</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.MASS_Garin_Confirm_Calc_This_Month__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>MASS: Garin Confirm Calc This Month = True
Email Template = MASS: Garin Confirm This Month</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MASS%3AGarin Returns Prioritizing You for This Month</fullName>
        <actions>
            <name>Send_email_to_all_RETURNS_customers_to_confirm_this_month</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Clear_Checkbox5</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.MASS_Garin_Confirm_Returns_This_Month__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>MASS: Garin Confirm Returns This Month = True
Email Template = MASS: Garin Returns Confirm This Month</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MASS%3ANotify Customer of New GLC</fullName>
        <actions>
            <name>Send_notification_to_Customer</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Clear_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Sent_MASS_Email_for_GLC_Reassignment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.MASS_Notify_Cust_of_New_GLC__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>MASS Notify Cust of New GLC = True
Email Template = MASS: GLC Reassignment</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MASS%3AReturns Cancellation - Notify CAM</fullName>
        <actions>
            <name>Notify_CAM_of_Intent_to_Cancel_Returns</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Log_Entry_MASS_Notify_CAM_of_Cancellati</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Reset_MASS</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Date_of_CAM_Notification_of_Return</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Notify_CAM_of_Cancellation</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.MASS_CAM_Notify_Returns_Cancellation__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Notify CAMs of intent to cancel the Returns Service (only) for non-payment</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MASS%3AReturns Cancellation - Notify Customer</fullName>
        <actions>
            <name>Send_Cancellation_EMail_for_returns</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Log_Entry_Notify_Cust_of_Returns_Cancel</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Reset_MASS_Cust_Notify_Returns_Cancel</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Date_of_Customer_Notification</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Returns_Cancel_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.MASS_Cust_Notify_Returns_Cancellation__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Notify Customer of intent to cancel the Returns Service (only) for non-payment</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MASS%3AReturns LWS Reminder</fullName>
        <actions>
            <name>Send_email_notification_about_LWS</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Clear_LWS_Reminder_checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Log_entry_MASS_Returns_LWS_Reminder</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.MASS_Returns_LWS_Reminder__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>MASS: Returns LWS Reminder = True
Email Template = GoLive - 1st Tax Liability Worksheet</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Maintain Time Entry - GoLive - Clear Time Spent</fullName>
        <actions>
            <name>Reset_Time_Spent_GoLive</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ISCHANGED( Total_Time_Spent_GoLive__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>MaintainTime Entry - GoLive - Update Total</fullName>
        <actions>
            <name>Update_Total_Time_Spent_GoLive</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Time tracker controller for GoLive Time spent entries
Update: https://jira.avalara.com/browse/IBST-10375</description>
        <formula>AND( 
ISCHANGED(Time_Spent_GoLive__c), 
Time_Spent_GoLive__c &gt; 0 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Mantain Created Date In Migration Date</fullName>
        <actions>
            <name>Update_Certs_Migration_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Migration_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Returns_Migration_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Mass%3A No EFF Date%2C Live on Calc%2C Request Date</fullName>
        <actions>
            <name>Send_email_requesting_intent_desire_to_use_Returns_or_not</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Log_Entry_No_Est_FF_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Reset_checkbox_for_No_Est_FF_Date_email</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Send_Request_For_Estimated_First_File_Date</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.MASS_Email_Returns_No_Est_FF_Date__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Implementation_Path__c</field>
            <operation>notEqual</operation>
            <value>Professional Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Estimation__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>equals</operation>
            <value>Live</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Has_Returns__c</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <description>MASS Email - Returns No Est FF Date = True
Email Template	= Forecast Returns Request</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Mass%3A Send Invite to CertCap Webinar</fullName>
        <actions>
            <name>Send_invitation_to_CertCapture_webinars</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Reset_checkbox_for_MASS_CertCap_Invitati</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Log_Entry_Field3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Invitation_to_CertCap_webinars</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.MASS_Invite_to_CertCap_Webinars__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>MASS Invite to CertCap Webinars = True
Email Template = CertCapture - Webinar reminder</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Mass%3A Send Invite to Intro Admin Console</fullName>
        <actions>
            <name>Send_invitation_for_Getting_Stared_with_the_Admin_Console_webinar</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Reset_checkbox_for_Getting_Started_Admin</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Log_Entry_field</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Invitation_to_Getting_Started_with_the_Admin_Console_webinar</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.MASS_Invite_to_Admin_Console_Webinar__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>MASS Invite to Admin Console Webinar = True
Email Template = Getting Started with Avalara AvaTax</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Master FS Welcome Letter</fullName>
        <actions>
            <name>Full_Serve_Welcome_Letter</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Active_GLC_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Welcome_Letter_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Welcome_Letter_Log_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Welcome_Letter_Sent</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <description>NEEDS Update</description>
        <formula>AND( ISPICKVAL(Log_Type__c , &quot;Send Welcome Letter&quot;), NOT(ISPICKVAL( Connector__r.Default_Self_Serve__c,&quot;Self-Serve&quot; )),NOT( $User.Validation_Exempt__c ),NOT(Connector__r.Name = &quot;Hubsoft&quot;),NOT(Connector__r.Name = &quot;Keystone&quot;), Welcome_Letter_Sent__c = FALSE, Exclude_from_Automation__c =FALSE, TEXT(Implementation_Path__c)&lt;&gt;&quot;Professional Services&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Master SS Welcome Letter</fullName>
        <actions>
            <name>Self_Serve_Welcome_Letter</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Active_SS_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Welcome_Letter_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Welcome_Letter_Log_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Welcome_Letter_Sent</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <description>NEEDS Update</description>
        <formula>AND( ISPICKVAL(Log_Type__c , &quot;Send Welcome Letter&quot;), ISPICKVAL( Connector__r.Default_Self_Serve__c,&quot;Self-Serve&quot; ),Primary_Connector__c = True, NOT( $User.Validation_Exempt__c ),NOT(Connector__r.Name = &quot;Hubsoft&quot;),NOT(Connector__r.Name = &quot;Keystone&quot;),Welcome_Letter_Sent__c = FALSE, Ava_GoLive_Coordinator__r.LastName &lt;&gt;&quot;Automation&quot;, Exclude_from_Automation__c =FALSE, TEXT(Implementation_Path__c)&lt;&gt;&quot;Professional Services&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Master SS Welcome Letter - CALC Only</fullName>
        <actions>
            <name>Send_GO_Program_Welcome_Letter</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Active_SS_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_GoLive_Log_for_Go_Program</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Welcome_Letter_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>GO_Program_Welcome_Letter_Sent</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <description>NEEDS Update</description>
        <formula>AND( NOT(ISBLANK( Connector__c )),ISPICKVAL(Log_Type__c , &quot;Send Welcome Letter&quot;), ISPICKVAL( Connector__r.Default_Self_Serve__c,&quot;Self-Serve&quot; ), Primary_Connector__c = True, NOT( $User.Validation_Exempt__c ),NOT(Connector__r.Name = &quot;Hubsoft&quot;),NOT(Connector__r.Name = &quot;Keystone&quot;),Welcome_Letter_Sent__c = FALSE, Ava_GoLive_Coordinator__r.LastName =&quot;Automation&quot;, Exclude_from_Automation__c =FALSE, TEXT(Implementation_Path__c)&lt;&gt;&quot;Professional Services&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Milestone Status -Account Activated %5BAutomation%5D</fullName>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND (6 OR 7)  AND 8 AND 9</booleanFilter>
        <criteriaItems>
            <field>GoLive_Implementation__c.Date_Survey_Complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.msdAccount_Activation_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Opt_Out_Auto_Survey__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Implementation_Path__c</field>
            <operation>equals</operation>
            <value>Self-Serve,Assisted</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.AccountNumber__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Account_DEV__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Exclude_from_Automation__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Customer_Start_Date__c</field>
            <operation>greaterThan</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>NEEDS Update</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Milestone_Status_Update</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Account_Activated_Log_entry_3</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>GoLive_Implementation__c.Customer_Start_Date__c</offsetFromField>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Milestone_Status_Update</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Account_Activated_Log_Entry_4</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>GoLive_Implementation__c.Customer_Start_Date__c</offsetFromField>
            <timeLength>6</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Milestone_Status_Update</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Account_Activated_Log_Entry_1</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Set_Calc_Status_Actively_Engaged</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>GoLive_Implementation__c.Customer_Start_Date__c</offsetFromField>
            <timeLength>10</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Notify_GLC_of_stalled_GoLive</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Account_Activated_Log_Entry_FINAL</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Set_Calc_Status_Client_Delay</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>GoLive_Implementation__c.Customer_Start_Date__c</offsetFromField>
            <timeLength>8</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Milestone_Status_Update</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Account_Activated_Log_Entry_2</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>GoLive_Implementation__c.Customer_Start_Date__c</offsetFromField>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Milestone Status -Company Created %5BAutomation%5D</fullName>
        <actions>
            <name>Send_Milestone_Status_Update</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Company_Created_Log_Entry_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7</booleanFilter>
        <criteriaItems>
            <field>GoLive_Implementation__c.Date_Survey_Complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.msdAccount_Activation_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.msdCompany_Created_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Opt_Out_Auto_Survey__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Implementation_Path__c</field>
            <operation>equals</operation>
            <value>Self-Serve,Assisted</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Exclude_from_Automation__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>NEEDS Update</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Milestone_Status_Update</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Company_Created_Log_Entry_3</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Milestone_Status_Update</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Company_Created_Log_Entry_4</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>6</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Notify_GLC_of_stalled_GoLive</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Company_Created_Log_Entry_FINAL</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Set_Calc_Status_Not_Responsding</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>8</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Milestone_Status_Update</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Company_Created_Log_Entry_2</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Milestone Status -Nexus Setup %5BAutomation%5D</fullName>
        <actions>
            <name>Send_Milestone_Status_Update</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Nexus_Setup_Log_Entry_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8</booleanFilter>
        <criteriaItems>
            <field>GoLive_Implementation__c.Date_Survey_Complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.msdAccount_Activation_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.msdCompany_Created_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.msdNEXUS_Created_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Opt_Out_Auto_Survey__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Implementation_Path__c</field>
            <operation>equals</operation>
            <value>Self-Serve,Assisted</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Exclude_from_Automation__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Needs Update</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Milestone_Status_Update</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Nexus_Setup_Log_Entry_4</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>6</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Milestone_Status_Update</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Nexus_Setup_Log_Entry_2</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Milestone_Status_Update</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Nexus_Setup_Log_Entry_3</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Notify_GLC_of_stalled_GoLive</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Nexus_Setup_Log_Entry_FINAL</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Set_Calc_Status_Client_Delay</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>8</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Milestone Status -Transaction Posted %5BAutomation%5D</fullName>
        <actions>
            <name>Send_Milestone_Status_Update</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>GoLive_Log_Summary_Milestone</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9</booleanFilter>
        <criteriaItems>
            <field>GoLive_Implementation__c.Date_Survey_Complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.msdAccount_Activation_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.msdCompany_Created_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.msdNEXUS_Created_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.msdTransaction_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Opt_Out_Auto_Survey__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Implementation_Path__c</field>
            <operation>equals</operation>
            <value>Self-Serve,Assisted</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Exclude_from_Automation__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Needs Update</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Milestone_Status_Update</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Transaction_Posted_Log_Entry_2</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Milestone_Status_Update</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Transaction_Posted_Log_Entry_4</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>6</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Send_Milestone_Status_Update</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Transaction_Posted_Log_entry_3</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Notify_GLC_of_stalled_GoLive</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Set_Calc_Status_Client_Delay</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Transaction_Posted_Log_Entry_FINAL</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>8</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Non PrePaid %3C 100R MMB Field Updates</fullName>
        <actions>
            <name>Set_Include_in_Activation_Re_bill_TRUE</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Minimum_Monthly_Billing_to_Exclude</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Reason_for_Exclusion_to_1_100</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_First_Activation_Fee_Rebill_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND (3 OR 4)</booleanFilter>
        <criteriaItems>
            <field>GoLive_Implementation__c.Pre_Paid_Returns__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.ReturnsLevel__c</field>
            <operation>lessOrEqual</operation>
            <value>100</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Add_On_Returns_Name__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Primary_Returns_Name__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Non PrePaid 100R%2B MMB Field Updates</fullName>
        <actions>
            <name>Set_Exclude_Activation_Re_Bill_to_TRUE</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_First_Min_Bill_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Minimum_Monthly_Bill_Fee</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Minimum_Monthly_Billing_to_Include</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND (3 OR 4)</booleanFilter>
        <criteriaItems>
            <field>GoLive_Implementation__c.Pre_Paid_Returns__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.ReturnsLevel__c</field>
            <operation>greaterThan</operation>
            <value>100</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Add_On_Returns_Name__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Primary_Returns_Name__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Notify CAM of Slipped Timeline</fullName>
        <actions>
            <name>Notify_CAM_of_Slipped_Timeline</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 or 2 or 3 or 4</booleanFilter>
        <criteriaItems>
            <field>GoLive_Implementation__c.Slippage_Start__c</field>
            <operation>greaterThan</operation>
            <value>30</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Slippage_Calc_Live__c</field>
            <operation>greaterThan</operation>
            <value>30</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Slippage_Certs_Live__c</field>
            <operation>greaterThan</operation>
            <value>30</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Slippage_Returns_Live__c</field>
            <operation>greaterThan</operation>
            <value>30</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify Consultant Docs Failed Validation</fullName>
        <actions>
            <name>Docs_failed_validation</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Docs_Failed_Validation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Documentation_Status__c</field>
            <operation>equals</operation>
            <value>Failed Validation</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify Consultant When Log Entry Added</fullName>
        <actions>
            <name>Notify_GLC_of_Update_to_Log</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND( Ava_GoLive_Coordinator__r.Username &lt;&gt;  $User.Username, $User.Validation_Exempt__c = FALSE, Ava_GoLive_Coordinator__r.LastName &lt;&gt; &quot;Automation&quot;,Ava_GoLive_Coordinator__r.LastName &lt;&gt; &quot;Backlog&quot;,ISCHANGED(Log_Entry__c  ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Notify Escalation Team of BLOCKED GoLive</fullName>
        <actions>
            <name>Send_notification_email</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Add_notification_event_to_log</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 OR 2 OR 3</booleanFilter>
        <criteriaItems>
            <field>GoLive_Implementation__c.Delay__c</field>
            <operation>equals</operation>
            <value>Connector: Not Meeting Needs,Customer: Challenged by Taxability Configuration,Solution as Sold Won&apos;t Work</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.CertCapture_Delay__c</field>
            <operation>equals</operation>
            <value>CertCapture: Not Meeting Needs,Solution as Sold Won&apos;t Work</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Delay__c</field>
            <operation>equals</operation>
            <value>Solution as Sold Won&apos;t Work</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify Managed Returns %3E Ready for Review</fullName>
        <actions>
            <name>Notify_RMO_Contacts_of_Docs_Received</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Stamp_Docs_Received_Log_Entry</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR 3) AND 2</booleanFilter>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Status__c</field>
            <operation>equals</operation>
            <value>Scheduled</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Documentation_Status__c</field>
            <operation>equals</operation>
            <value>Returns Submitted Online,Returns Packet Received</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.SST_Status__c</field>
            <operation>equals</operation>
            <value>Live</value>
        </criteriaItems>
        <description>Notify the managed returns customers are ready to be reviewed</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify Managers of Filing Calendar Change Request</fullName>
        <actions>
            <name>Notify_managers_of_customer_submission_of_a_Filing_Calendar_Change_Request</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Status__c</field>
            <operation>equals</operation>
            <value>Live,Scheduled</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.FileRequest_Submitted__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.FileRequest_DateSubmitted__c</field>
            <operation>equals</operation>
            <value>LAST 7 DAYS</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify Sales %26 CAM of potential cancellation</fullName>
        <actions>
            <name>Send_notification_of_possible_cancellation</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Append_event_log</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear_MASS_Escalate_to_SALES_CAM</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2 OR 3 OR 4</booleanFilter>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>equals</operation>
            <value>Cancellation Pending</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Status__c</field>
            <operation>equals</operation>
            <value>Cancellation Pending</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Status__c</field>
            <operation>equals</operation>
            <value>Cancellation Pending</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.MASS_Escalate_to_SALES_CAM__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Partner GoLive Notification - Calc Live</fullName>
        <actions>
            <name>Partner_GoLive_Notification_Calc_Live</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>equals</operation>
            <value>Live</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.ChannelSalesRepEmail__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Name</field>
            <operation>equals</operation>
            <value>Clay Test GLI</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Partner GoLive Notification - Certs Live</fullName>
        <actions>
            <name>Partner_GoLive_Notification_Certs_Live</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Status__c</field>
            <operation>equals</operation>
            <value>Live</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.ChannelSalesRepEmail__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Name</field>
            <operation>equals</operation>
            <value>Clay Test GLI</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Partner GoLive Notification - Returns Live</fullName>
        <actions>
            <name>Partner_GoLive_Notification_Returns_Live</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Status__c</field>
            <operation>equals</operation>
            <value>Live</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.ChannelSalesRepEmail__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Name</field>
            <operation>equals</operation>
            <value>Clay Test GLI</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pre-paid Returns MMB Field Updates</fullName>
        <actions>
            <name>Set_Exclude_Activation_Re_Bill_to_TRUE</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Minimum_Monthly_Billing_to_Exclude</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Reason_for_Exclusion_from_MMB_to</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Pre_Paid_Returns__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Returns First Est Stamp</fullName>
        <actions>
            <name>Returns_First_Est_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Estimation__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Returns Status Blocked</fullName>
        <actions>
            <name>Returns_Status_Blocked</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Delay__c</field>
            <operation>contains</operation>
            <value>Blocked</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Returns Status UnBlocked - Nurture</fullName>
        <actions>
            <name>Returns_Status_Nurtured</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Delay__c</field>
            <operation>notContain</operation>
            <value>Blocked</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Status__c</field>
            <operation>equals</operation>
            <value>Blocked</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Unblock_Nurture_Unresponsive_RETURNS__c</field>
            <operation>equals</operation>
            <value>Nurture</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Status__c</field>
            <operation>notEqual</operation>
            <value>Live,Canceled</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Returns Status UnBlocked - Unresponsive</fullName>
        <actions>
            <name>Returns_Status_Unresponsive</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Delay__c</field>
            <operation>notContain</operation>
            <value>Blocked</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Status__c</field>
            <operation>equals</operation>
            <value>Blocked</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Unblock_Nurture_Unresponsive_RETURNS__c</field>
            <operation>equals</operation>
            <value>Unresponsive</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Status__c</field>
            <operation>notEqual</operation>
            <value>Live,Canceled</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SOHO Returns Webinar email %3D True</fullName>
        <actions>
            <name>Send_email_to_SOHO_customers_to_direct_them_to_Returns_webinar</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Append_to_GoLive_Log_SOHO</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear_SOHO_Returns_webinar_checklist</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.MASS_SOHO_Returns_Webinar_email__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send GoLive Date Survey %5BAutomation%5D</fullName>
        <actions>
            <name>Send_GoLive_Date_Survey</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Date_Survey_Sent</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 AND 7 AND 8 AND 9 AND 10</booleanFilter>
        <criteriaItems>
            <field>GoLive_Implementation__c.Date_Survey_Complete__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Implementation_Path__c</field>
            <operation>equals</operation>
            <value>Self-Serve,Assisted</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Trigger_Date_Survey__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Opt_Out_Auto_Survey__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Account_Activated__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Company_Created__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Nexus_Created__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Transactions__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>notEqual</operation>
            <value>Live</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Exclude_from_Automation__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Sends GL Survey</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Send_GoLive_Date_Survey</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>Set_Calc_Status_Client_Delay</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>4</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Set_Calc_Status_Implicitly_Cancelled</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Call_Customer_Date_Survey_Ignored</name>
                <type>Task</type>
            </actions>
            <timeLength>8</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Send_GoLive_Date_Survey</name>
                <type>Alert</type>
            </actions>
            <timeLength>6</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Send GoLive Pre-Implementation Assessment Survey</fullName>
        <actions>
            <name>Send_GoLive_Pre_Implementation_Assessment</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Stamp_Sent_GLI_Assessment_Survey</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( 
OR( 
CONTAINS(Owner_Role__c, &quot;GoLive&quot;), 
CONTAINS(Owner_Role__c, &quot;Implementation&quot;)), 
OR( 
RecordTypeId = &quot;01240000000UYZU&quot;, 
RecordTypeId = &quot;01240000000UahC&quot;), 
Connector__c &lt;&gt; &quot;a0n4000000ChMxq&quot;, 
OR( 
AND( 
(DATETIMEVALUE(Assigned__c) - DATETIMEVALUE(TODAY())) &gt;= -7, 
ISBLANK(Sent_GLI_Assessment_Survey__c), 
TEXT(Calc_Status__c) &lt;&gt; &quot;&quot;, 
TEXT(Calc_Status__c) &lt;&gt; &quot;Scheduled&quot;, 
TEXT(Calc_Status__c) &lt;&gt; &quot;Live&quot;, 
TEXT(Calc_Status__c) &lt;&gt; &quot;Canceled&quot;, 
TEXT(Calc_Status__c) &lt;&gt; &quot;Cancellation Pending&quot; 
), 
AND( 
ISBLANK(Sent_GLI_Assessment_Survey__c), 
Send_GLI_Assessment_Survey__c = True) 
))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send Webinar Registration Follow Up%3A Get Started with AvaTax</fullName>
        <actions>
            <name>Send_notification_email_regarding_Registered_for_Webinar_Get_Started_with_AvaTax</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Stamp_AvaTax_Webinar_FollowUp_Dt</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Log_Type__c</field>
            <operation>equals</operation>
            <value>Registered for Webinar -  Get Started with AvaTax</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send Webinar Registration Follow Up%3A Get Started with CertCapture</fullName>
        <actions>
            <name>Send_notification_email_regarding_Registered_for_Webinar_Get_Started_with_CertCa</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Stamp_CertCaptureWebinar_FollowUp_Dt</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Log_Type__c</field>
            <operation>equals</operation>
            <value>Registered for Webinar -  Get Started with CertCapture</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send Webinar Registration Follow Up%3A Get Started with Returns</fullName>
        <actions>
            <name>Send_notification_email_regarding_Registered_for_Webinar_Get_Started_with_Return</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Stamp_Returns_Webinar_FollowUp_Dt</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Log_Type__c</field>
            <operation>equals</operation>
            <value>Registered for Webinar -  Get Started with Returns</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send Welcome Letter Log Entry</fullName>
        <actions>
            <name>Send_welcome_letter_template</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Auto_Log_Entry_for_Send_Welcome_Letter</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Date_Welcome_Letter_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Log_Type__c</field>
            <operation>equals</operation>
            <value>Send Welcome Letter</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Welcome_Letter_Sent__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Calc Add On</value>
        </criteriaItems>
        <description>Purpose: Auto Log Entry for Send Welcome Letter Log Entry Type 
Integrated: No 
Change: Level 1 
Custodian: Golive Director</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Calc Status to Actively Engaged %5BAutomation%5D</fullName>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Customer_Start_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Date_Survey_Complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Implementation_Path__c</field>
            <operation>equals</operation>
            <value>Self-Serve,Assisted</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>notEqual</operation>
            <value>Live</value>
        </criteriaItems>
        <description>NEEDS Update</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Set_Calc_Status_Actively_Engaged</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>GoLive_Implementation__c.Customer_Start_Date__c</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Snapshot GLI Workload - FLOW</fullName>
        <actions>
            <name>Snapshot_GLI_Workload</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Professional Services Add On,New (Product Summary),PS Calc Add On,PS Certs Add On,PS PS Add On,PS Returns Add On,PS SST Add On</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Account Activation Date</fullName>
        <actions>
            <name>Stamp_Account_Activation_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.msdAccount_Activation_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Account_Activated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Account Activation Date %28DEV%29</fullName>
        <actions>
            <name>Stamp_Account_Activation_Date_DEV</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.AccountActivationDate_DEV__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.AccountActivated_DEV__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Account Level Calc Live Date</fullName>
        <actions>
            <name>Stamp_Account_Level_Calc_Live_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED(Calc_Live_Date__c),  RecordType.DeveloperName = &apos;New&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Calc Delay Timestamp on change</fullName>
        <actions>
            <name>Stamp_Calc_Delay_Timestamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamp the Calc Delay Timestamp field upon change of Calc Delay</description>
        <formula>ISCHANGED(Delay__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Calc Estimation %5BAutomation%5D</fullName>
        <actions>
            <name>Stamp_Calc_Estimation</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Certs_Estimation</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Date_Survey_Ready_TRUE</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Estimated_First_Filing_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Purpose: Stamp default estimation dates and date survey readiness
Integrated: Yes
Change: Level 2
Custodian: Golive Director</description>
        <formula>AND( RecordTypeId = &quot;01240000000UYZU&quot;, NOT(ISBLANK(     Primary_Calc_Name__c  )),  Date_Survey_Complete__c = FALSE)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Calc Estimation and Confidence</fullName>
        <actions>
            <name>Stamp_Calc_Estimation2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Confidence_in_Estimate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Has_Calc__c</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.DesiredCalcLiveDate_from_Opp__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/IBST-5487</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Calc Estimation on Add On</fullName>
        <actions>
            <name>Stamp_Calc_Estimation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Purpose: Stamp default estimation dates and date survey readiness
Integrated: Yes
Change: Level 2
Custodian: Golive Director</description>
        <formula>AND( RecordTypeId = &quot;01240000000UYZZ&quot;, NOT(ISBLANK(   Add_On_Calc_Name__c   )))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Calc Live Date</fullName>
        <actions>
            <name>Stamp_Calc_Live_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>equals</operation>
            <value>Live</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Live_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Stamps the Calc Live date if blank</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Calc Live GLC</fullName>
        <actions>
            <name>Stamp_Calc_Live_GLC2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR 2) AND 3</booleanFilter>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>equals</operation>
            <value>Live</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Live_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Live_GLC__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Stamp the name of the GLC at the time Calc was marked Live</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Certs Delay Timestamp on change</fullName>
        <actions>
            <name>Stamp_Certs_Delay_Timestamp_on_change</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamp the Certs Delay Timestamp field upon change of Certs Delay</description>
        <formula>ISCHANGED( CertCapture_Delay__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Certs Live Date</fullName>
        <actions>
            <name>Stamp_Certs_Live_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>ISCHANGED( Certs_Live_Date__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Certs Live Date if blank</fullName>
        <actions>
            <name>Stamp_Certs_Live_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Status__c</field>
            <operation>equals</operation>
            <value>Live</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Live_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Sets the Certs Live Date to today if blank</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Certs Live GLC</fullName>
        <actions>
            <name>Stamp_Certs_Live_GLC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Status__c</field>
            <operation>equals</operation>
            <value>Live</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Live_GLC__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Stamp the name of the GoLive Consultant who owned the GoLive at the time Certs was marked Live</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Certs Status and Estimate</fullName>
        <actions>
            <name>Certs_Estimate_Confidence_Medium</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Certs_Status_Active</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Desired_Certs_Estimate_from_Opp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Has_Certs__c</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.DesiredCertsLiveDate_from_Opp__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/IBST-5724</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Date Final Review Call %28Returns%29</fullName>
        <actions>
            <name>Stamp_Final_Review_Call_Returns</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Final_Review_Call_Returns__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Date_of_Final_Review_Call_Returns__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Date LWS Review Call %28Returns%29</fullName>
        <actions>
            <name>Stamp_date_of_LWS_Review</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.LWS_Review_Call_Returns__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Date_of_LWS_Review_Call_Returns__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Date Planning Call Completed</fullName>
        <actions>
            <name>Stamp_Date_Planning_Call_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Date_Planning_Call_Completed__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Planning_Call_Completed__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <description>Stamp Date Planning Call Completed</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Date of Final Review Call %28Certs%29</fullName>
        <actions>
            <name>Stamp_date_of_final_review</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Final_Review_Call_Certs__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Date_of_Final_Review_Call_Certs__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Date of Final Review%2FHandoff to Support</fullName>
        <actions>
            <name>Stamp_Date_of_Final_Review_Handoff_to_Su</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Date_of_Final_Review_Call_AvaTax__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Final_Review_Handoff_Call_Completed__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Date of Pre-Live Review Call</fullName>
        <actions>
            <name>Stamp_Date_of_Pre_Live_Review_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Date_of_Going_Live_Review_Call_AvaTax__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Going_Live_Review_Call_AvaTax__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Date of Project Plan Sent</fullName>
        <actions>
            <name>Stamp_Date_of_Project_Plan_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Date_Project_Plan_Sent__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Project_Plan_Sent__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Date of Welcome Call</fullName>
        <actions>
            <name>Stamp_Date_of_Welcome_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Date_of_Welcome_Call__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Welcome_Call_Completed__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Stamp Date of Welcome Call</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Default Confidence %28CC Estimate%29</fullName>
        <actions>
            <name>Stamp_Confidence_CC_Estimate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Confidence_in_Estimate_CC__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Estimation__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Default Confidence %28Calc Estimate%29</fullName>
        <actions>
            <name>Stamp_Confidence_Calc_Estimate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Confidence_in_Estimate_Calc__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Estimation__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Default Confidence %28Returns Estimate%29</fullName>
        <actions>
            <name>Stamp_Confidence_Returns_Estimate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Confidence_in_Estimate_Returns__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Estimation__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Default Implementation Path Assisted for Quickstart</fullName>
        <actions>
            <name>Implementation_Path_Assisted</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( Account__r.RecordTypeId = &quot;01233000000MIyU&quot;, HasQUICKSTART__c = TRUE)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Default Implementation Path Managed</fullName>
        <actions>
            <name>Stamp_Default_Implementation_Path_Manage</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(NOT( ISBLANK( Connector__c )), ISPICKVAL( Connector__r.Default_Self_Serve__c , &quot;Managed&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Estimated First Filing Date</fullName>
        <actions>
            <name>Stamp_Estimated_First_Filing_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>When a Connector is associated with a GLI, stamp the estimated first filing date</description>
        <formula>AND( RecordTypeId = &quot;01240000000UYZU&quot;,ISPICKVAL(Log_Type__c , &quot;Send Welcome Letter&quot;),  NOT(ISBLANK(Calc_Estimation__c)) ,Trigger_Date_Survey__c = TRUE, Date_Survey_Complete__c = FALSE, Opt_Out_Auto_Survey__c = FALSE,NOT(ISPICKVAL( Implementation_Path__c ,&quot;Self-Serve&quot;)),NOT(ISPICKVAL( Implementation_Path__c ,&quot;Assisted&quot;)) )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Stamp Filing Calendars Complete</fullName>
        <actions>
            <name>Stamp_Confirmed_FC_Complete</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.All_Filing_Calendars_Submitted__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Stamp the date when the Consultant confirmed that filing calendar submission is complete for the customer&apos;s first filing cycle.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp GLI from Add On Calc</fullName>
        <actions>
            <name>Stamp_Opp_Notes_Add_On_Calc</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <formula>AND( NOT(ISBLANK( Add_On_Calc_Subscription__c  )),ISBLANK( SourceOpportunity__c ),ISBLANK( Source_Quote__c ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp GLI from Add On Certs</fullName>
        <actions>
            <name>Stamp_Opp_Notes_Add_On_Certs</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <formula>AND( NOT(ISBLANK( Add_On_Certs_Subscription__c  )),ISBLANK( SourceOpportunity__c ),ISBLANK( Source_Quote__c ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp GLI from Add On PS</fullName>
        <actions>
            <name>Stamp_Opp_Notes_Add_On_PS</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <formula>AND( NOT(ISBLANK(  Add_On_PS_Subscription__c   )),ISBLANK( SourceOpportunity__c ),ISBLANK( Source_Quote__c ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp GLI from Add On Returns</fullName>
        <actions>
            <name>Stamp_Opp_Notes_Add_On_Returns</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <formula>AND( NOT(ISBLANK( Add_On_Returns_Subscription__c  )),ISBLANK( SourceOpportunity__c ),ISBLANK( Source_Quote__c ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp GLI from Add On SST</fullName>
        <actions>
            <name>Stamp_Opp_Notes_Add_On_SST</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <formula>AND( NOT(ISBLANK( Add_On_SST_Subscription__c  )),ISBLANK( SourceOpportunity__c ),ISBLANK( Source_Quote__c ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp GLI from Primary Calc</fullName>
        <actions>
            <name>Stamp_Opp_Notes_Primary_Calc</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <formula>AND( NOT(ISBLANK(Primary_Calc_Subscription__c )),ISBLANK( SourceOpportunity__c ),ISBLANK( Source_Quote__c ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Going Live Review Call %28Certs%29</fullName>
        <actions>
            <name>Stamp_Date_of_Going_Live_Review_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Going_Live_Review_Call_Certs__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Date_of_Going_Live_Review_Call_Certs__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp MRO Filing Calendar Complete</fullName>
        <actions>
            <name>Stamp_Date_MRO_Filing_Calendar_Complete</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_GoLive_Log_MRO_FC_Complete</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Documentation_Status__c</field>
            <operation>equals</operation>
            <value>Passed Validation</value>
        </criteriaItems>
        <description>Stamp &quot;Date MRO Filing Calendar Complete&quot; when the MRO Team finishes their validation.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp MRO Packet Received</fullName>
        <actions>
            <name>Stamp_Date_MRO_Packet_Received</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_GoLive_Log_MRO_recieved</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Documentation_Status__c</field>
            <operation>equals</operation>
            <value>Returns Packet Received,Returns Submitted Online</value>
        </criteriaItems>
        <description>Stamp &quot;Date MRO Packet Received&quot;, which is the data the GLC handed off the customer to MRO for validation.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp MRO Packet Sent</fullName>
        <actions>
            <name>Stamp_Date_MRO_Packet_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_GoLive_Log</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Documentation_Status__c</field>
            <operation>equals</operation>
            <value>Returns Packet Sent to Customer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp MRO Start Validation</fullName>
        <actions>
            <name>Stamp_Stamp_MRO_Start_Validation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Documentation_Status__c</field>
            <operation>equals</operation>
            <value>RMO - Working / Researching</value>
        </criteriaItems>
        <description>Update &quot;Date MRO Start Validation&quot; based on Returns Documentation Status = RMO - Working / Researching</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Pre-Implementation Survey Review date</fullName>
        <actions>
            <name>Stamp_Pre_Implementation_Survey_Review_d</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Reviewed_Pre_Implementation_Survey__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Date_Pre_Implementation_Survey_Reviewed__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Pro%2FBasic on GLI</fullName>
        <actions>
            <name>Stamp_Pro_Basic_on_GLI</name>
            <type>FlowAction</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>New,Calc Add On</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Quote Notes v2</fullName>
        <actions>
            <name>Stamp_Quote_Notes_v2</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <formula>AND(NOT(ISBLANK( Name )),NOT(ISBLANK( Source_Quote__c )))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Re-bill Fee</fullName>
        <actions>
            <name>Stamp_Re_bill_Fee</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Include_in_Activation_Fee_Re_Bill__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Returns Delay Timestamp on change</fullName>
        <actions>
            <name>Stamp_Returns_Delay_Timestamp_on_change</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamp the Returns  Delay Timestamp field upon change of Returns Delay</description>
        <formula>ISCHANGED( Returns_Delay__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Returns Live Dates</fullName>
        <actions>
            <name>Make_note_in_log</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_First_Filing_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Returns_Live_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Status__c</field>
            <operation>equals</operation>
            <value>Scheduled</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Validation_Exempt__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Stamps the Returns Live Date and update the Actual First File Date</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Returns Live GLC</fullName>
        <actions>
            <name>Stamp_Returns_Live_GLC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Status__c</field>
            <operation>equals</operation>
            <value>Scheduled,Live</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Live_GLC__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Stamp the name of the GoLive Consultant who owned the GoLive at the time Returns was marked Scheduled</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Returns Status %3D Active</fullName>
        <actions>
            <name>Stamp_Returns_Status_Active</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Has_Returns__c</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/IBST-5509</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Risk Date</fullName>
        <actions>
            <name>Date_Stamp_Risk_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Sets the Risk Date to Today if the Blocking Risk Factor changes (which occurs if any of the Risks are changed)</description>
        <formula>OR(ISCHANGED( BlockingRiskFactor__c ),ISCHANGED(Product_Risk__c),ISCHANGED(Customer_Risk__c),ISCHANGED(Schedule_Risk__c),ISCHANGED(Terms_Risk__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp SST Live Date</fullName>
        <actions>
            <name>Stamp_SST_Live_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_GoLive_Log_SST</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.SST_Live_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Stamps the SST Live Date</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp SST Live Date Account</fullName>
        <actions>
            <name>Stamp_SST_Live_Date_Account</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(  SST_Live_Date__c  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp SST Live GLC</fullName>
        <actions>
            <name>Stamp_Returns_Live_GLC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.SST_Status__c</field>
            <operation>equals</operation>
            <value>Live</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Returns_Live_GLC__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Stamp the name of the GoLive Consultant who owned the GoLive at the time the SST GoLive was marked Live</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Sales Rep Email</fullName>
        <actions>
            <name>Populate_Sales_Rep_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Sales_Rep__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Welcome Letter Sent Date</fullName>
        <actions>
            <name>Stamp_Date_Welcome_Letter_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Welcome_Letter_Sent__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Stamp Welcome Letter Sent Date when the Welcome Letter Sent checkbox is checked.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Times Active - Calc</fullName>
        <actions>
            <name>Add_1_Times_Active_Calc</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Purpose: Track number of times Calc Status is Active
Integrated: 
Change: Level 0 
Custodian: Golive Director</description>
        <formula>AND(
ISCHANGED(Calc_Status__c),
ISPICKVAL(Calc_Status__c, &quot;Active&quot;) 

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Times Active - Certs</fullName>
        <actions>
            <name>Add_1_Times_Active_Certs</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Purpose: Track number of times Certs Status is Active
Integrated: 
Change: Level 0 
Custodian: Golive Director</description>
        <formula>AND(
ISCHANGED(Certs_Status__c),
ISPICKVAL(Certs_Status__c, &quot;Active&quot;) 

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Times Active - Returns</fullName>
        <actions>
            <name>Add_1_Times_Active_Returns</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Purpose: Track number of times Returns Status is Active
Integrated: 
Change: Level 0 
Custodian: Golive Director</description>
        <formula>AND(
ISCHANGED(Returns_Status__c),
ISPICKVAL(Returns_Status__c, &quot;Active&quot;) 

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Times Blocked - Calc</fullName>
        <actions>
            <name>Add_1_Time_Blocked_Calc</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Purpose: Track number of times Calc Status is Blocked
Integrated: 
Change: Level 0 
Custodian: Golive Director</description>
        <formula>AND(
ISCHANGED(Calc_Status__c),
ISPICKVAL(Calc_Status__c, &quot;Blocked&quot;) 

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Times Blocked - Certs</fullName>
        <actions>
            <name>Add_1_Time_Blocked_Certs</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Purpose: Track number of times Certs Status is Blocked
Integrated: 
Change: Level 0 
Custodian: Golive Director</description>
        <formula>AND(
ISCHANGED( Certs_Status__c ),
ISPICKVAL(Certs_Status__c, &quot;Blocked&quot;) 

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Times Blocked - Returns</fullName>
        <actions>
            <name>Add_1_Time_Blocked_Returns</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Purpose: Track number of times Returns Status is Blocked
Integrated: 
Change: Level 0 
Custodian: Golive Director</description>
        <formula>AND(
ISCHANGED(Returns_Status__c),
ISPICKVAL(Returns_Status__c, &quot;Blocked&quot;) 

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Times Nurtured - Calc</fullName>
        <actions>
            <name>Add_1_Times_Nurtured_Calc</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Purpose: Track number of times Calc Status is Nurtured
Integrated: 
Change: Level 0 
Custodian: Golive Director</description>
        <formula>AND(
ISCHANGED(Calc_Status__c),
ISPICKVAL(Calc_Status__c, &quot;Nurtured&quot;) 

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Times Nurtured - Certs</fullName>
        <actions>
            <name>Add_1_Times_Nurtured_Certs</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Purpose: Track number of times Certs Status is Nurtured
Integrated: 
Change: Level 0 
Custodian: Golive Director</description>
        <formula>AND(
ISCHANGED(Certs_Status__c),
ISPICKVAL(Certs_Status__c, &quot;Nurtured&quot;) 

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Times Nurtured - Returns</fullName>
        <actions>
            <name>Add_1_Times_Nurtured_Returns</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Purpose: Track number of times Returns Status is Nurtured
Integrated: 
Change: Level 0 
Custodian: Golive Director</description>
        <formula>AND(
ISCHANGED(Returns_Status__c),
ISPICKVAL(Returns_Status__c, &quot;Nurtured&quot;) 

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Times Unresponsive - Calc</fullName>
        <actions>
            <name>Add_1_Times_Unresponsive_Calc</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Purpose: Track number of times Calc Status is Unresponsive
Integrated: 
Change: Level 0 
Custodian: Golive Director</description>
        <formula>AND(
ISCHANGED(Calc_Status__c),
ISPICKVAL(Calc_Status__c, &quot;Unrepsonsive&quot;) 

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Times Unresponsive - Certs</fullName>
        <actions>
            <name>Add_1_Times_Unresponsive_Certs</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Purpose: Track number of times Calc Status is Unresponsive
Integrated: 
Change: Level 0 
Custodian: Golive Director</description>
        <formula>AND(
ISCHANGED(Certs_Status__c),
ISPICKVAL(Certs_Status__c, &quot;Unrepsonsive&quot;) 

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Times Unresponsive - Returns</fullName>
        <actions>
            <name>Add_1_Times_Unresponsive_Returns</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Purpose: Track number of times Returns Status is Unresponsive
Integrated: 
Change: Level 0 
Custodian: Golive Director</description>
        <formula>AND(
ISCHANGED(Returns_Status__c),
ISPICKVAL(Returns_Status__c, &quot;Unrepsonsive&quot;) 

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Track Returns Submitted Prior Value</fullName>
        <actions>
            <name>Stamp_File_Request_Prior</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(FileRequest_Submitted__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Calc Status To Live</fullName>
        <actions>
            <name>Update_Calc_Status_Live</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Live_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Call Campaign Tracking</fullName>
        <actions>
            <name>Clear_Call_Campaign_Result</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Increment_Call_Campaign_Count</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Increment_Current_Call_Campaign_Attempts</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Call_Campaign_Last_Call_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Call_Campaign_Last_Result</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TEXT(Call_Campaign_Result__c) &lt;&gt; &quot;&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Certs Status To Live</fullName>
        <actions>
            <name>Update_Certs_Status_Live</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Certs_Live_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Delay - Customer%3A Delayed Start %5BAutomation%5D</fullName>
        <actions>
            <name>Set_Calc_Status_Client_Delay</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Delay_Customer_Delayed_Start</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Customer_Start_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Customer_Start_Date__c</field>
            <operation>greaterThan</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Implementation_Path__c</field>
            <operation>equals</operation>
            <value>Self-Serve,Assisted</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive_Implementation__c.Calc_Status__c</field>
            <operation>notEqual</operation>
            <value>Live</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Initial Planning Call</fullName>
        <actions>
            <name>Set_Planning_Call_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_date_of_planning_call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.Log_Type__c</field>
            <operation>contains</operation>
            <value>Planning Call</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Welcome Hubsoft</fullName>
        <actions>
            <name>Hubsoft_Welcome_Letter</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Active_SS_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Welcome_Letter_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Welcome_Letter_Log_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Hubsoft_Welcome_Letter_Sent</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <description>NEEDS UPDATE</description>
        <formula>AND( Connector__r.Name  = &quot;Hubsoft&quot;, ISPICKVAL( Connector__r.Default_Self_Serve__c,&quot;Self-Serve&quot; ),ISPICKVAL(  Calc_Status__c ,&quot;Active&quot;),NOT($User.Validation_Exempt__c), ISPICKVAL(Log_Type__c , &quot;Send Welcome Letter&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Welcome Keystone</fullName>
        <actions>
            <name>Keystone_Welcome_Letter</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Update_Active_SS_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Welcome_Letter_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Welcome_Letter_Log_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Keystone_Welcome_Letter_Sent</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <description>NEEDS Update</description>
        <formula>AND( Connector__r.Name  = &quot;Keystone&quot;, ISPICKVAL( Connector__r.Default_Self_Serve__c,&quot;Self-Serve&quot; ),ISPICKVAL(  Calc_Status__c ,&quot;Active&quot;),NOT($User.Validation_Exempt__c),ISPICKVAL(Log_Type__c , &quot;Send Welcome Letter&quot;))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>if MASS Email Zombies is checked</fullName>
        <actions>
            <name>Send_email_of_status_and_invitation_to_reengage</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Clear_mass_email_zombie_checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive_Implementation__c.MASS_Email_Zombies__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>CERTS_Complete_Final_Review_Handoff_Call</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <description>	Ask if customer understands and is comfortable with the process
	Introduce them to their CAM (virtually) &amp; how to reach them
	Explain Support process</description>
        <dueDateOffset>30</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>GoLive_Implementation__c.Certs_Live_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>CERTS: Complete Final Review/Handoff Call</subject>
    </tasks>
    <tasks>
        <fullName>Call_Customer_Date_Survey_Ignored</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <description>Customer was sent the date survey 4 times without responding to the survey.  Please contact the customer to confirm their timeline and commitment.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call Customer - Date Survey Ignored</subject>
    </tasks>
    <tasks>
        <fullName>Complete_Final_Review_Handoff_Call</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <description>	Ask if customer understands and is comfortable with the process
	Remind them of the Help Center
	Introduce them to their CAM (virtually) &amp; how to reach them
	Explain Support process</description>
        <dueDateOffset>30</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>GoLive_Implementation__c.Calc_Live_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Complete Final Review/Handoff Call</subject>
    </tasks>
    <tasks>
        <fullName>Customer_GoLive_Not_Responding</fullName>
        <assignedTo>melissa.davis@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please followup with primary GoLive contact, as no milestones have been updated in 8 days.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Customer GoLive Not Responding</subject>
    </tasks>
    <tasks>
        <fullName>Customer_Live_Golive_Review_Task</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Customer Live Golive Review Task</subject>
    </tasks>
    <tasks>
        <fullName>Date_Survey_Sent</fullName>
        <assignedTo>glautomation@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Date Survey Sent</subject>
    </tasks>
    <tasks>
        <fullName>Dynamics_GP_Welcome_Letter_Sent</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Dynamics GP Welcome Letter Sent</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Dynamics GP Welcome Letter Sent</subject>
    </tasks>
    <tasks>
        <fullName>FastSigns_Keystone_Welcome_Letter_Sent</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>The welcome letter was sent</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>FastSigns Keystone Welcome Letter Sent</subject>
    </tasks>
    <tasks>
        <fullName>Full_Service_Welcome_Letter_Sent</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Full Service Welcome Letter Sent</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Full Service Welcome Letter Sent</subject>
    </tasks>
    <tasks>
        <fullName>GO_Program_Welcome_Letter_Sent</fullName>
        <assignedTo>melissa.davis@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>GO! Program Welcome Letter Sent</subject>
    </tasks>
    <tasks>
        <fullName>GoLive_1_Year_Live_Account_Review_Call</fullName>
        <assignedToType>owner</assignedToType>
        <description>Golive 365 days transaction task</description>
        <dueDateOffset>365</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>GoLive 1 Year Anniversary Live - Account Review Call</subject>
    </tasks>
    <tasks>
        <fullName>GoLive_6Month_Live_Account_Review_Call</fullName>
        <assignedToType>owner</assignedToType>
        <description>Golive Transaction 180 day task</description>
        <dueDateOffset>180</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>GoLive 6 Months Live - Account Review Call</subject>
    </tasks>
    <tasks>
        <fullName>GoLive_complete_Account_Review_Call</fullName>
        <assignedToType>owner</assignedToType>
        <description>Golive Transactions 60 day task</description>
        <dueDateOffset>60</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>GoLive 60 Days Live - Account Review Call</subject>
    </tasks>
    <tasks>
        <fullName>Hubsoft_Welcome_Letter_Sent</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Hubsoft Welcome Letter Sent</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Hubsoft Welcome Letter Sent</subject>
    </tasks>
    <tasks>
        <fullName>Invitation_to_CertCap_webinars</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Invitation to CertCap webinars</subject>
    </tasks>
    <tasks>
        <fullName>Invitation_to_GO_Program</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Email sent to GoLive Primary Contact inviting them to participate in the GO! Program (webinar curriculum)</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Invitation to GO! Program</subject>
    </tasks>
    <tasks>
        <fullName>Invitation_to_Getting_Started_with_the_Admin_Console_webinar</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Invitation to Getting Started with the Admin Console webinar</subject>
    </tasks>
    <tasks>
        <fullName>Invitation_to_Getting_Started_with_the_Magento_webinar</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Invitation to Getting Started with the Magento webinar</subject>
    </tasks>
    <tasks>
        <fullName>Invitation_to_Getting_Started_with_the_QuickBooks_webinar</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Invitation to Getting Started with the QuickBooks webinar</subject>
    </tasks>
    <tasks>
        <fullName>Keystone_Welcome_Letter_Sent</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Keystone Welcome Letter Sent</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Keystone Welcome Letter Sent</subject>
    </tasks>
    <tasks>
        <fullName>MASS_Calc_No_estimate</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>MASS: Calc – No estimate email sent</subject>
    </tasks>
    <tasks>
        <fullName>Magento_Welcome_Letter_Sent</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Magento Welcome Letter Sent</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Magento Welcome Letter Sent</subject>
    </tasks>
    <tasks>
        <fullName>Mass_Email_Confirm_Calc_Estimation_Date_Sent</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Mass Email: Confirm Calc Estimation Date Sent</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Mass Email: Confirm Calc Estimation Date Sent</subject>
    </tasks>
    <tasks>
        <fullName>Mass_Email_Filing_Date_Passed_Notice_Sent</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Mass Email: Filing Date Passed Notice Sent</subject>
    </tasks>
    <tasks>
        <fullName>Mass_Email_Filing_Date_This_Month_Notice_Sent</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Mass Email: Filing Date This Month Notice Sent</subject>
    </tasks>
    <tasks>
        <fullName>Nexternal_Welcom_Letter_Sent</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Nexternal Welcome Letter Sent</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Nexternal Welcome Letter Sent</subject>
    </tasks>
    <tasks>
        <fullName>Notify_CAM_of_Cancellation</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Notify CAM of Cancellation</subject>
    </tasks>
    <tasks>
        <fullName>Notify_Customer_of_Cancellation</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Notification sent to customer of our cancellation of the Returns service (only) due to non-payment.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Notify Customer of Cancellation</subject>
    </tasks>
    <tasks>
        <fullName>Quickbooks_Welcome_Letter_Sent</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Quickbooks Welcome Letter Sent</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Quickbooks Welcome Letter Sent</subject>
    </tasks>
    <tasks>
        <fullName>RETURNS_Complete_Final_Review_Handoff_Call</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <description>	Show &amp; tell of the Returns Archive folder
	Ask if customer understands the process
	Review the Notice submission process</description>
        <dueDateOffset>30</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>GoLive_Implementation__c.Projected_LWS_Build_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>RETURNS: Complete Final Review/Handoff Call</subject>
    </tasks>
    <tasks>
        <fullName>SAGE_100_Welcome_Letter_Sent</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>SAGE 100 Welcome Letter Sent</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>SAGE 100 Welcome Letter Sent</subject>
    </tasks>
    <tasks>
        <fullName>SAGE_300_Welcome_Letter_Sent</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>SAGE 300 Welcome Letter Sent</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>SAGE 300 Welcome Letter Sent</subject>
    </tasks>
    <tasks>
        <fullName>Send_Request_For_Estimated_First_File_Date</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Send Request For Estimated First File Date</subject>
    </tasks>
    <tasks>
        <fullName>Shopsite_Welcome_Letter_Sent</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Shopsite Welcome Letter Sent</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Shopsite Welcome Letter Sent</subject>
    </tasks>
    <tasks>
        <fullName>Slippage_Test</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Slippage Test</subject>
    </tasks>
    <tasks>
        <fullName>Welcome_Call_with_Customer</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <description>Agenda:
- Introductions and establishment of roles and responsibilities.
- Discuss customer objectives and timeline.
- Review purchased products
- Discuss this implementation plan
- Register for Webinars</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Welcome Call with Customer</subject>
    </tasks>
    <tasks>
        <fullName>Welcome_Letter_Sent</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Welcome Letter Sent</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Welcome Letter Sent</subject>
    </tasks>
    <tasks>
        <fullName>X1_Year_Golive_Review_Task</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>365</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>GoLive_Implementation__c.Calc_Live_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>1 Year Golive Review Task</subject>
    </tasks>
    <tasks>
        <fullName>X3D_Cart_Welcome_Letter</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>3D Cart Welcome Letter</subject>
    </tasks>
    <tasks>
        <fullName>X60_Day_Golive_Review_Task</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>60</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>GoLive_Implementation__c.Calc_Live_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>60 Day Golive Review Task</subject>
    </tasks>
    <tasks>
        <fullName>X6Month_Golive_Review_Task</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>180</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>GoLive_Implementation__c.Calc_Live_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>6 Month Golive Review Task</subject>
    </tasks>
    <tasks>
        <fullName>nopCommerce_Welcome_Letter_Sent</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>nopCommerce Welcome Letter Sent</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>nopCommerce Welcome Letter Sent</subject>
    </tasks>
</Workflow>
