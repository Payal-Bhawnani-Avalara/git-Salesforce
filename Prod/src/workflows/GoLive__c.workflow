<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>AvaFileFFScheduled</fullName>
        <ccEmails>jeff.cohen@avalara.com;bob.waite@avalara.com</ccEmails>
        <description>AvaFile FF Scheduled</description>
        <protected>false</protected>
        <recipients>
            <recipient>arminder.kaur@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>carrie.rose@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>isie.wong@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Ava_AvaFile_Contact__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Ava_Original_Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/FFScheduled</template>
    </alerts>
    <alerts>
        <fullName>AvaFileGoLiveSuspended</fullName>
        <description>AvaFile GoLive Suspended</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>isie.wong@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/X2009_AvaFile_Suspended</template>
    </alerts>
    <alerts>
        <fullName>AvafileGoLiveCancelled</fullName>
        <description>Avafile GoLive Cancelled</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>isie.wong@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/X2009_AvaFile_Cancelled</template>
    </alerts>
    <alerts>
        <fullName>CloseGoLive_Send_Survey</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>CloseGoLive Send Survey</description>
        <protected>false</protected>
        <recipients>
            <field>Cust_GoLive_Coordinator__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>ZZZSupportArchive/GoLiveCloseTakeSurvey</template>
    </alerts>
    <alerts>
        <fullName>EMailaWelcomeCallDing</fullName>
        <description>EMail a Welcome Call Ding</description>
        <protected>false</protected>
        <recipients>
            <field>Ava_Original_Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/WelcomeCallDing</template>
    </alerts>
    <alerts>
        <fullName>FYIBASICGoLiveAppearsReadytoClose</fullName>
        <ccEmails>tom.pacholke@avalara.com</ccEmails>
        <ccEmails>bob.waite@avalara.com</ccEmails>
        <description>FYI - BASIC GoLive Appears Ready to Close</description>
        <protected>false</protected>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Ava_Original_Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/BASICAccountConnected</template>
    </alerts>
    <alerts>
        <fullName>FYICustomerSuspendedGoLive</fullName>
        <description>FYI: Customer Suspended GoLive</description>
        <protected>false</protected>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Ava_CAM_Contact__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_PRO_Contact__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Ava_Original_Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/CustSuspendedGoLive</template>
    </alerts>
    <alerts>
        <fullName>FYIProductionAccountisnowlive</fullName>
        <description>FYI - Production Account is now live</description>
        <protected>false</protected>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_PRO_Contact__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Ava_Original_Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderAddress>support@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>GoLive_Internal_Only/FYIFirstProdTransaction</template>
    </alerts>
    <alerts>
        <fullName>MASS_Email_Returns_Temp</fullName>
        <description>MASS Email Returns Temp</description>
        <protected>false</protected>
        <recipients>
            <field>Cust_Compliance_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Templates/Returns_Confirmation_This_Month</template>
    </alerts>
    <alerts>
        <fullName>New_CERT_GoLive_Coordinator_Notification</fullName>
        <description>New CERT GoLive Coordinator Notification</description>
        <protected>false</protected>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>wendy.leonard@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/NotifyNewGoLiveCoordinator</template>
    </alerts>
    <alerts>
        <fullName>NotifyNewGoLiveCoordinator</fullName>
        <description>Notify New GoLive Coordinator</description>
        <protected>false</protected>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/NotifyNewGoLiveCoordinator</template>
    </alerts>
    <alerts>
        <fullName>Notify_GLC_of_Update_to_Log</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Notify GLC of Update to Log</description>
        <protected>false</protected>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/GoLive_Modified</template>
    </alerts>
    <alerts>
        <fullName>Notify_Managed_Returns_Team_of_Submitted_Documents</fullName>
        <description>Notify Managed Returns Team of Submitted Documents</description>
        <protected>false</protected>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kimberly.taylor@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Templates/Returns_Documents_Ready_For_Review</template>
    </alerts>
    <alerts>
        <fullName>OEMConnectorCertified</fullName>
        <ccEmails>dg-sales@avalara.com;dg-technicalservices@avalara.com;bob.waite@avalara.com; dg-marketing@avalara.com</ccEmails>
        <description>Notification to stakeholders that new OEM Connector is AvaTax Certified</description>
        <protected>false</protected>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>julia.king@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>PartnersOnly/T2_OEM_Connector_Certified</template>
    </alerts>
    <alerts>
        <fullName>PROAccountConnectedJustMapped</fullName>
        <description>PRO Account Connected Just Mapped</description>
        <protected>false</protected>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Ava_CAM_Contact__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_AvaFiles_Contact__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_PRO_Contact__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Ava_Original_Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/PROAccountConnectMapped</template>
    </alerts>
    <alerts>
        <fullName>SendAlertToPRO</fullName>
        <description>Send Alert To PRO</description>
        <protected>false</protected>
        <recipients>
            <recipient>bob.waite@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jeff.orr@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/FYIWelcomeCalltoPRO</template>
    </alerts>
    <alerts>
        <fullName>SendDingSDKReadytoMigrate</fullName>
        <ccEmails>order.processing@avalara.com</ccEmails>
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
        <template>GoLive_Internal_Only/DingSDKReadytoMigrate</template>
    </alerts>
    <alerts>
        <fullName>SendEMailtoBookingRepAskingforHelptoConnectwithCustomer</fullName>
        <description>Send EMail to Booking Rep and CAM Asking for Help to Connect with Customer</description>
        <protected>false</protected>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Ava_CAM_Contact__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Ava_Original_Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/ActionRequiredCustomerUnresponsive</template>
    </alerts>
    <alerts>
        <fullName>SendFYIPROConnectedMapped</fullName>
        <description>Send FYI - PRO Connected &amp; Mapped</description>
        <protected>false</protected>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/PROAccountConnectMapped</template>
    </alerts>
    <alerts>
        <fullName>SendMappedEmailDing</fullName>
        <ccEmails>bob.waite@avalara.com</ccEmails>
        <ccEmails>pat.ferdig@avalara.com</ccEmails>
        <ccEmails>arminder.kaur@avalara.com</ccEmails>
        <ccEmails>carrie.rose@avalara.com</ccEmails>
        <description>Send Mapped! Email Ding</description>
        <protected>false</protected>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Ava_GoLive_PRO_Contact__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>Ava_Original_Sales_Rep__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/PROCallDingMappingComplete</template>
    </alerts>
    <alerts>
        <fullName>SendSuccessfulGoLiveDing</fullName>
        <description>Send Successful GoLive Ding</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <recipient>CAMs</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>X2012_GoLive</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>e_com_SDK_Team</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>x2010TeamAnderson</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>x2010TeamFalle</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>x2010TeamKushniruk</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>ann.klosterman@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jamee.nunnelee@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/GoLiveClosedSuccess</template>
    </alerts>
    <alerts>
        <fullName>Send_Notification_Email</fullName>
        <ccEmails>garin.pangburn@avalara.com</ccEmails>
        <description>Send Notification Email</description>
        <protected>false</protected>
        <recipients>
            <field>Ava_GoLive_Coordinator__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/GoLive_Modified</template>
    </alerts>
    <alerts>
        <fullName>Send_Schedeuled_Start_Date</fullName>
        <description>Send Est Filing status report</description>
        <protected>false</protected>
        <recipients>
            <field>Cust_Compliance_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Templates/Status_Report_Returns</template>
    </alerts>
    <alerts>
        <fullName>x2009AvaFileGoLiveCustomerIssues</fullName>
        <ccEmails>jeff.cohen@avalara.com;bob.waite@avalara.com</ccEmails>
        <description>2009 AvaFile GoLive Customer Issues</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>arminder.kaur@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>carrie.rose@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>isie.wong@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/X2009_AvaFile_CustIssues</template>
    </alerts>
    <alerts>
        <fullName>x2009AvaFileGoLiveStatusisScheduled</fullName>
        <description>2009 AvaFile GoLive Status is Scheduled</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>isie.wong@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kimberly.taylor@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/X2009_AvaFile_FF_Scheduled</template>
    </alerts>
    <alerts>
        <fullName>x2009AvaFileGoLiveisLive</fullName>
        <description>2009 AvaFile GoLive is Live</description>
        <protected>false</protected>
        <recipients>
            <recipient>harpreet.gill@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>isie.wong@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jd.jespersen@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>rajwinder.kaur@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/X2009_AvaFile_GoLive_Live</template>
    </alerts>
    <alerts>
        <fullName>x2009AvaFileGoLivenowinprogress</fullName>
        <ccEmails>DG-ComplianceManagers@avalara.com;</ccEmails>
        <description>2009 AvaFile GoLive now in progress</description>
        <protected>false</protected>
        <recipients>
            <recipient>arminder.kaur@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>carrie.rose@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>isie.wong@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/X2009_AvaFile_InProg</template>
    </alerts>
    <fieldUpdates>
        <fullName>AddFirstTxnNotetoLastLogEntry</fullName>
        <field>GL_Last_Log_Entry__c</field>
        <formula>TEXT(NOW())&amp;&quot; &gt;&gt;   SiteManager:  First transaction recorded&quot;</formula>
        <name>Add First Txn Note to Last Log Entry</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Add_DateStamp_to_GoLiveStatusComment</fullName>
        <description>Adds datestamp to GoLive Status Comment field</description>
        <field>GoLive_Status_Comment__c</field>
        <formula>TEXT(TODAY())</formula>
        <name>Add DateStamp to GoLiveStatusComment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ClearLogEntry</fullName>
        <description>Clear the most recent GoLive Log Entry</description>
        <field>GoLive_Log_Entry__c</field>
        <name>Clear Log Entry</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_AvaFile_Comment</fullName>
        <field>AvaFile_Comment__c</field>
        <name>Clear AvaFile Comment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Calc_Live_Date</fullName>
        <field>Calc_Live_Date__c</field>
        <name>Clear Calc Live Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CloseGoLive</fullName>
        <field>GoLive_Status__c</field>
        <literalValue>Closed - Completed</literalValue>
        <name>Close GoLive</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Default_Customer_Start_Date</fullName>
        <field>Customer_Start_Date__c</field>
        <formula>IF(ISNULL(Customer_Start_Date__c), TODAY(),Customer_Start_Date__c)</formula>
        <name>Default Customer Start Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Enter1stDevTxnintoLog</fullName>
        <field>GoLive_Log__c</field>
        <formula>&quot;*******&quot;&amp;BR()&amp;TEXT(NOW())&amp;BR()&amp;
&quot;SiteManager:  Development Account status is now CONNECTED&quot;&amp;BR()&amp;&quot;********&quot;&amp;BR()&amp; GoLive_Log__c</formula>
        <name>Enter 1st Dev Txn into Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Enter1stProdTxnintoLog</fullName>
        <field>GoLive_Log__c</field>
        <formula>&quot;*******&quot;&amp;BR()&amp;TEXT(NOW())&amp;BR()&amp;
&quot;SiteManager:  Production Account status is now CONNECTED&quot;&amp;BR()&amp;&quot;********&quot;&amp;BR()&amp; GoLive_Log__c</formula>
        <name>Enter 1st Prod Txn into Log</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>GoLiveUpdateLogField</fullName>
        <field>GoLive_Log__c</field>
        <formula>&quot;-------&quot;&amp;BR()&amp;Text( GoLive_Log_Stamp__c )&amp;&quot;  &quot;&amp; GoLive_Log_User__c &amp;BR()&amp;

Case(GoLive_Log_Type__c,
&quot;GoLive: Welcome Call&quot;,&quot;Welcome Call: &quot;,
&quot;GoLive: Letter of Introduction Sent&quot;,&quot;GoLive: Letter of Introduction Sent.  &quot;,
&quot;Note&quot;,&quot;Note: &quot;,
&quot;Phone Call&quot;,&quot;Phone Call: &quot;,
&quot;EMail&quot;,&quot;EMail: &quot;,
&quot;Installed&quot;,&quot;Installed: &quot;,
&quot;Left Voicemail&quot;,&quot;Left Voicemail: &quot;,
&quot;PRO: Mapping Call - Customer Not Ready to Map&quot;,&quot;Customer Not Ready to Map: &quot;,
&quot;PRO: Mapping Call - Mapping in Progress&quot;,&quot;Mapping in Progress: &quot;,
&quot;PRO: Mapping Complete&quot;,&quot;Mapping Complete: &quot;,
&quot;SDK: Developer Contacted&quot;,&quot;Developer Contacted: &quot;,
&quot;SDK: Checkup Message Sent&quot;, &quot;Checkup Message Sent: &quot;,
&quot;SDK: Code Review in Progress&quot;,&quot;Code Review in Progress: &quot;,
&quot;SDK: Migrating SDK to Production&quot;,&quot;Migrating SDK to Production: &quot;,
&quot;SDK: Migration Complete&quot;,&quot;Migration Complete: &quot;,
&quot;GoLive: Customer Suspended GoLive&quot;,&quot;Customer Suspended GoLive: &quot;,
&quot;Cancellation Pending&quot;,&quot;Cancellation Pending: &quot;,
&quot;GoLive: Customer Cancelled&quot;,&quot;Customer Cancelled: &quot;,
&quot;GoLive: No GoLive Required&quot;,&quot;No GoLive Required: &quot;,
&quot;GoLive: Complete&quot;,&quot;Complete: &quot;,
&quot;GoLive: Complete - Will Not Commit Documents&quot;,&quot;Complete - Will Not Commit Documents: &quot;,
&quot;GoLive: Customer Not Responding&quot;,&quot;Customer Not Responding: &quot;,
&quot;Closed - Customer Not Responding&quot;,&quot;Closed - Customer Not Responding: &quot;,
&quot;Closed - Customer Requested Hold&quot;,&quot;Closed - Customer Requested Hold: &quot;,
&quot;Customer ReActivated&quot;,&quot;Customer Re-activated GoLive: &quot;,
&quot;Existing - Uncertified&quot;,&quot;Existing - Uncertified: &quot;,
&quot;Ready for Kickoff Call&quot;,&quot;Ready for Kickoff Call: &quot;,
&quot;Avalara Requirements Delivered&quot;,&quot;Avalara Requirements Delivered: &quot;,
&quot;OEM Design Delivered&quot;,&quot;OEM Design Delivered: &quot;,
&quot;Development In Progress&quot;,&quot;Development In Progress: &quot;,
&quot;OEM Connector Review&quot;,&quot;OEM Connector Review: &quot;,
&quot;UAT / Early Adopter&quot;,&quot;UAT / Early Adopter: &quot;,
&quot;Certified&quot;,&quot;Certified: &quot;,
&quot;&quot;)
&amp;GoLive_Log_Entry__c &amp;BR()&amp; GoLive_Log__c</formula>
        <name>GoLive Update Log Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Increment_Contact_Count</fullName>
        <field>Contact_Count__c</field>
        <formula>Contact_Count__c + 1</formula>
        <name>Increment Contact Count</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Increment_Contact_Count2</fullName>
        <field>Contact_Count__c</field>
        <formula>Contact_Count__c + 1</formula>
        <name>Increment Contact Count</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Increment_Reschedule_Count</fullName>
        <field>Est_GoLive_Date_Change_Count__c</field>
        <formula>if(Est_GoLive_Date_Change_Count__c &gt;0,Est_GoLive_Date_Change_Count__c+1,1)</formula>
        <name>Increment Reschedule Count</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>InitializeAvaFileStatus</fullName>
        <field>AvaFile_Status__c</field>
        <literalValue>AvaFile - Ordered</literalValue>
        <name>InitializeAvaFileStatus</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>InitializeGoLiveID</fullName>
        <field>Name</field>
        <formula>IF(AND( $RecordType.Name =&quot;AvaTax GoLive&quot;, OR( AV_Service_Description__c =&quot;vCert&quot;, AV_Service_Description__c =&quot;VCert&quot;)),AV_Service_Account__c&amp;&quot;(AvaTax Certs)&quot;,IF( $RecordType.Name =&quot;Compliance GoLive&quot;,AV_Service_Account__c&amp;&quot;(MRS)&quot;,IF( $RecordType.Name =&quot;SST GoLive&quot;,Related_to_Account__r.Name &amp;&quot;(SST)&quot;,
AV_Service_Account__c &amp;&quot; (&quot;&amp; LEFT(AV_Service_Description__c,FIND(&quot;/&quot;,AV_Service_Description__c)-1) &amp;&quot;)&quot;)))</formula>
        <name>Initialize GoLive ID</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ResetLastPROContactStamp</fullName>
        <field>Last_PRO_Contact__c</field>
        <formula>now()</formula>
        <name>Reset Last PRO Contact Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ResetLogType</fullName>
        <field>GoLive_Log_Type__c</field>
        <literalValue>Note</literalValue>
        <name>Reset Log Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ResetLogTypetoNone</fullName>
        <field>GoLive_Log_Type__c</field>
        <name>Reset Log Type to None</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetCAMContact</fullName>
        <field>Ava_CAM_Contact__c</field>
        <lookupValue>bob.waite@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Set CAM Contact</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetConnector2</fullName>
        <description>Sets the value for the Connector 2 field (based on the value set in the Service Description)</description>
        <field>Connector2__c</field>
        <formula>IF( ISBLANK(Asset__c), LEFT(AV_Service_Description__c,FIND(&quot;:&quot;, AV_Service_Description__c ,1)-1), Asset__r.Product2.Interface__c )</formula>
        <name>Set Connector 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetEscalationGreen</fullName>
        <field>GoLive_Escalation__c</field>
        <literalValue>0 - GoLive Team</literalValue>
        <name>Set Escalation Green</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetEscalationto2Manager</fullName>
        <field>GoLive_Escalation__c</field>
        <literalValue>2 - Manager</literalValue>
        <name>Set Escalation to 2 - Manager</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetEstGoLiveDate</fullName>
        <field>Est_GoLive_Date__c</field>
        <formula>IF( GL_Interface__c = &quot;SDK&quot;,Link_to_Dev_Contract__r.EffectiveDate__c + 60,Link_to_Dev_Contract__r.EffectiveDate__c + 30)</formula>
        <name>Set Est GoLive Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetGLActive</fullName>
        <field>GoLive_Status__c</field>
        <literalValue>Active - In Progress</literalValue>
        <name>Set GL Active</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetGLEscalationto0</fullName>
        <field>GoLive_Escalation__c</field>
        <literalValue>Normal Velocity</literalValue>
        <name>Set GL Escalation to 0</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetGLEscalationto15</fullName>
        <field>GoLive_Escalation__c</field>
        <literalValue>Velocity +15 Days Overdue</literalValue>
        <name>Set GL Escalation to 15</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetGLEscalationto30</fullName>
        <field>GoLive_Escalation__c</field>
        <literalValue>Velocity +30 Days Overdue</literalValue>
        <name>Set GL Escalation to 30</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetGLEscalationto45</fullName>
        <field>GoLive_Escalation__c</field>
        <literalValue>Velocity +45 Days Overdue</literalValue>
        <name>Set GL Escalation to 45</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetGLStatusCustCancelled</fullName>
        <field>GoLive_Status__c</field>
        <literalValue>Closed - Customer Cancelled</literalValue>
        <name>Set GL Status:CustCancelled</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetGLStatusNotRequired</fullName>
        <field>GoLive_Status__c</field>
        <literalValue>Closed - No GoLive Required</literalValue>
        <name>Set GL Status:Not Required</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetGLStatusNotResponding</fullName>
        <field>GoLive_Status__c</field>
        <literalValue>Inactive - Customer Not Responding</literalValue>
        <name>Set GL Status: Not Responding</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetGLStatustoConnectNotMap</fullName>
        <field>GoLive_Status__c</field>
        <literalValue>Active - Connected not Mapped</literalValue>
        <name>Set GL Status to Connect Not Map</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetGLStatustoMigratetoProd</fullName>
        <field>GoLive_Status__c</field>
        <literalValue>Active - Migrating SDK to Production</literalValue>
        <name>Set GL Status to Migrate to Prod</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetGLStatustoReadyforKickoffCall</fullName>
        <description>Update the GoLive Status to match the last Log Entry Type</description>
        <field>GoLive_Status__c</field>
        <literalValue>Ready for Kickoff Call</literalValue>
        <name>Set GL Status to Ready for Kickoff Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetGLStatustoSuspended</fullName>
        <field>GoLive_Status__c</field>
        <literalValue>Inactive - Customer Hold</literalValue>
        <name>Set GL Status to Suspended</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetGoLiveEscalationto1Manager</fullName>
        <field>GoLive_Escalation__c</field>
        <literalValue>1 - Manager</literalValue>
        <name>Set GoLive Escalation to 1 - Manager</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetGoLiveEscalationtoSptDirector</fullName>
        <field>GoLive_Escalation__c</field>
        <literalValue>2 - Support Director</literalValue>
        <name>Set GoLive Escalation to Spt Director</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetGoLiveStatustoCustomerCancelled</fullName>
        <field>GoLive_Status__c</field>
        <literalValue>Closed - Customer Cancelled</literalValue>
        <name>Set GoLive Status to Customer Cancelled</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetPROStatustoCustomerNotReady</fullName>
        <field>GoLive_PRO_Status_del_del__c</field>
        <literalValue>PRO: Customer Not Ready to Map</literalValue>
        <name>Set PRO Status to Customer Not Ready</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetPROStatustoMapComplete</fullName>
        <field>GoLive_PRO_Status_del_del__c</field>
        <literalValue>PRO: Mapping Complete</literalValue>
        <name>Set PRO Status to Map Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetPROStatustoMappinginProgress</fullName>
        <field>GoLive_PRO_Status_del_del__c</field>
        <literalValue>PRO: Mapping in Progress</literalValue>
        <name>Set PRO Status to Mapping in Progress</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetPROStatustoPendingDashboard</fullName>
        <field>GoLive_PRO_Status_del_del__c</field>
        <literalValue>Pending Dev Dashboard</literalValue>
        <name>Set PRO Status to Pending Dashboard</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetPROStatustoPendingMappingCall</fullName>
        <description>Set PRO Status to Pending Mapping Call when GoLive becomes &quot;in progress&quot;</description>
        <field>GoLive_PRO_Status_del_del__c</field>
        <literalValue>PRO: Pending Mapping Call</literalValue>
        <name>Set PRO Status to Pending Mapping Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetSDKCallDeveloper</fullName>
        <field>GoLive_SDK_Status__c</field>
        <literalValue>SDK Pending Developer Call</literalValue>
        <name>SetSDKCallDeveloper</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetSDKStatWaitingforCode</fullName>
        <field>GoLive_SDK_Status__c</field>
        <literalValue>SDK Waiting for Code</literalValue>
        <name>Set SDK Stat: Waiting for Code</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetSDKStatusforReceipt</fullName>
        <field>GoLive_SDK_Status__c</field>
        <literalValue>SDK Cert Req Received</literalValue>
        <name>Set SDK Status for Receipt</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetSDKStatustoCodeReviewinProg</fullName>
        <field>GoLive_SDK_Status__c</field>
        <literalValue>SDK Code Review in Progress</literalValue>
        <name>Set SDK Status to Code Review in Prog</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetSDKStatustoMigratetoProductio</fullName>
        <field>GoLive_SDK_Status__c</field>
        <literalValue>SDK Migrate to Production</literalValue>
        <name>Set SDK Status to Migrate to Productio</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetServiceDescription2</fullName>
        <description>Set&apos;s the value for the Service Description 2 field (based on associated contract)</description>
        <field>ServiceDescription2__c</field>
        <formula>IF( Link_to_Production_Account__r.Name =&quot;&quot;, Link_to_Dev_Contract__r.Name ,Link_to_Production_Account__r.Name )</formula>
        <name>Set Service Description 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetStatustoClosed</fullName>
        <field>GoLive_Status__c</field>
        <literalValue>Closed - Completed</literalValue>
        <name>Set Status to Closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_AvaFile_Status</fullName>
        <field>AvaFile_Status__c</field>
        <literalValue>Ordered</literalValue>
        <name>Set AvaFile Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_AvaFile_Status_to_Live</fullName>
        <description>Sets the AvaFile Status to &apos;Live&apos;</description>
        <field>AvaFile_Status__c</field>
        <literalValue>Live</literalValue>
        <name>Set AvaFile Status to Live</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Calc_Live_Date_to_Today</fullName>
        <field>Calc_Live_Date__c</field>
        <formula>today()</formula>
        <name>Set Calc Live Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Cancellation_Date</fullName>
        <field>Cancellation_Date__c</field>
        <formula>now()</formula>
        <name>Set Cancellation Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Conf_in_Est</fullName>
        <description>to Complete</description>
        <field>Confidence_in_Est_GL_Date__c</field>
        <literalValue>Complete - all customer tasks complete &amp; scheduled</literalValue>
        <name>Set Conf in Est</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Confidence_in_Est_to_Complte</fullName>
        <description>If a RETURNS GoLive is GoLive Complete, or a CALC, ISPI, CERT, or 1099 is Completed, set the Confidence level to &quot;Complete&quot;</description>
        <field>Confidence_in_Est_GL_Date__c</field>
        <literalValue>Complete - all customer tasks complete &amp; scheduled</literalValue>
        <name>Set Confidence in Est to Complte</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Customer_Start_Date</fullName>
        <field>Customer_Start_Date__c</field>
        <formula>msdAccount_Activation_Date__c</formula>
        <name>Set Customer Start Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Date_RMO_Filing_Calendar_Complete</fullName>
        <field>Date_RMO_Filing_Calendar_Complete__c</field>
        <formula>today()</formula>
        <name>Set Date RMO Filing Calendar Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Date_RMO_Packet_Sent</fullName>
        <field>Date_RMO_Packet_Sent__c</field>
        <formula>today()</formula>
        <name>Set Date RMO Packet Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_GL_Status_to_Avalara_Requirements</fullName>
        <description>Update the GoLive Status to match the last Log Entry Type</description>
        <field>GoLive_Status__c</field>
        <literalValue>Avalara Requirements Delivered</literalValue>
        <name>Set GL Status to Avalara Requirements</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_GL_Status_to_Certified</fullName>
        <description>Update the GoLive Status to match the last Log Entry Type</description>
        <field>GoLive_Status__c</field>
        <literalValue>Certified</literalValue>
        <name>Set GL Status to Certified</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_GL_Status_to_Closed_Hold</fullName>
        <field>GoLive_Status__c</field>
        <literalValue>Closed - Customer Requested Hold</literalValue>
        <name>Set GL Status to Closed - Hold</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_GL_Status_to_Development_in_Progress</fullName>
        <description>Update the GoLive Status to match the last Log Entry Type</description>
        <field>GoLive_Status__c</field>
        <literalValue>Development in Progress</literalValue>
        <name>Set GL Status to Development in Progress</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_GL_Status_to_OEM_Connector_Review</fullName>
        <description>Update the GoLive Status to match the last Log Entry Type</description>
        <field>GoLive_Status__c</field>
        <literalValue>OEM Connector Review</literalValue>
        <name>Set GL Status to OEM Connector Review</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_GL_Status_to_OEM_Design_Delivered</fullName>
        <description>Update the GoLive Status to match the last Log Entry Type</description>
        <field>GoLive_Status__c</field>
        <literalValue>OEM Design Delivered</literalValue>
        <name>Set GL Status to OEM Design Delivered</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_GL_Status_to_UAT_Early_Adopter</fullName>
        <description>Update the GoLive Status to match the last Log Entry Type</description>
        <field>GoLive_Status__c</field>
        <literalValue>UAT / Early Adopter</literalValue>
        <name>Set GL Status to UAT Early Adopter</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_GoLive_Status_to_Closed_Not_Respon</fullName>
        <field>GoLive_Status__c</field>
        <literalValue>Closed - Customer Not Responding</literalValue>
        <name>Set GoLive Status to Closed - Not Respon</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Mapping_Complete_Checkbox</fullName>
        <description>Sets Mapping Complete checkbox to True</description>
        <field>mMapping_Complete__c</field>
        <name>Set Mapping Complete Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Original_GoLive_Forecast</fullName>
        <field>Est_GoLive_Date_original__c</field>
        <formula>if(ISNULL(Est_GoLive_Date_original__c),IF(Product_Family__c=&quot;RETURNS&quot;,  EstFFDate__c ,Est_GoLive_Date__c),Est_GoLive_Date_original__c)</formula>
        <name>Set Original GoLive Forecast</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Status_to_Self_Serve</fullName>
        <field>GoLive_Status__c</field>
        <literalValue>Self-Serve: Pending Customer Activity</literalValue>
        <name>Set Status to Self-Serve Pending</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Tax_Codes_Completion</fullName>
        <field>msdTax_Codes_Completion_Date__c</field>
        <formula>today()</formula>
        <name>Set Tax Codes Completion</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_msdAccount_Activation_Date</fullName>
        <field>msdAccount_Activation_Date__c</field>
        <formula>today()</formula>
        <name>Set msdAccount_Activation_Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_msdLocation_Setup_Completion_Date_c</fullName>
        <field>msdLocation_Setup_Completion_Date__c</field>
        <formula>today()</formula>
        <name>Set msdLocation_Setup_Completion_Date__c</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_msdMapping_Completion_Date_c</fullName>
        <field>msdMapping_Completion_Date__c</field>
        <formula>today()</formula>
        <name>Set msdMapping_Completion_Date__c</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_msdNEXUS_Created_Date_c</fullName>
        <field>msdNEXUS_Created_Date__c</field>
        <formula>today()</formula>
        <name>Set msdNEXUS_Created_Date__c</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_msdSetup_Completion_Date_c</fullName>
        <field>msdSetup_Completion_Date__c</field>
        <formula>today()</formula>
        <name>Set msdSetup_Completion_Date__c</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_msdTransaction_Date_c</fullName>
        <field>msdTransaction_Date__c</field>
        <formula>today()</formula>
        <name>Set msdTransaction_Date__c</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SettoPendingWC</fullName>
        <field>GoLive_Status__c</field>
        <literalValue>Active - Pending Welcome Call</literalValue>
        <name>Set to Pending WC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Setup_AvaTax_formatted_GoLive_Name</fullName>
        <description>Sets GoLIve Name to &apos;Account Name (Interface)</description>
        <field>Name</field>
        <formula>Related_to_Account__r.Name&amp;&quot; (&quot;&amp; Asset__r.Product2.Interface__c&amp;&quot;)&quot;</formula>
        <name>Setup AvaTax formatted GoLive Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Setup_Certs_formatted_GoLive_Name</fullName>
        <description>Sets GoLIve Name to &apos;Account Name (Certs)&apos;</description>
        <field>Name</field>
        <formula>Related_to_Account__r.Name&amp;&quot; (AvaTax Certs)&quot;</formula>
        <name>Setup Certs formatted GoLive Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Setup_Returns_formatted_GoLive_Name</fullName>
        <description>Sets GoLIve Name to &apos;Account Name (MRS)&apos;</description>
        <field>Name</field>
        <formula>Related_to_Account__r.Name&amp;&quot; (MRS)&quot;</formula>
        <name>Setup Returns formatted GoLive Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Setup_SST_formatted_GoLive_Name</fullName>
        <description>Sets GoLIve Name to &apos;Account Name (SST)</description>
        <field>Name</field>
        <formula>Related_to_Account__r.Name&amp;&quot; (SST)&quot;</formula>
        <name>Setup SST formatted GoLive Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>StampActualGoLiveDate</fullName>
        <field>Actual_GoLive_Date__c</field>
        <formula>today()</formula>
        <name>Stamp Actual GoLive Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Actual_GoLive_Date</fullName>
        <field>Actual_GoLive_Date__c</field>
        <formula>today()</formula>
        <name>Stamp Actual GoLive Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TimeStampFirstSDKContact</fullName>
        <field>GL_First_Contact_PRO__c</field>
        <formula>now()</formula>
        <name>TimeStamp First SDK Contact</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TimeStampPROContact</fullName>
        <field>GL_First_Contact_PRO__c</field>
        <formula>now()</formula>
        <name>TimeStamp PRO Contact</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TurnOffConnectedNotMapped</fullName>
        <field>GoLive_Status__c</field>
        <literalValue>Active - In Progress</literalValue>
        <name>Turn Off Connected Not Mapped</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateAFGLLog</fullName>
        <field>AvaFileLog__c</field>
        <formula>Text( GoLive_Log_Stamp__c )&amp;&quot;  &quot;&amp; GoLive_Log_User__c &amp;BR()&amp;

CASE( AvaFile_Status__c ,
&quot;Ordered&quot;,&quot;(Status Ordered):  &quot;&amp; AvaFile_Comment__c,
&quot;In Progress&quot;,&quot;(Status In Progress):  &quot;&amp; AvaFile_Comment__c,
&quot;Customer Issues&quot;,&quot;(Status Customer Issues):  &quot;&amp; AvaFile_Comment__c,
&quot;Scheduled&quot;,&quot;(Status Scheduled):  &quot;&amp; AvaFile_Comment__c,
&quot;Waiting on Customer&quot;,&quot;(Status Waiting on Customer): &quot;&amp;AvaFile_Comment__c,
&quot;Customer Not Responding&quot;,&quot;(Customer Not Responding): &quot;&amp;AvaFile_Comment__c,
&quot;Suspended&quot;,&quot;(Suspended): &quot;&amp;AvaFile_Comment__c,
&quot;Cancellation Pending&quot;,&quot;(Status: Cancellation Pending): &quot;&amp; AvaFile_Comment__c, 
&quot;Cancelled&quot;,&quot;(Status: Cancelled): &quot;&amp; AvaFile_Comment__c, 
&quot;GoLive Complete&quot;,&quot;(Status GoLive Complete): &quot;&amp;AvaFile_Comment__c,
&quot;Live&quot;,&quot;(Status Live):  &quot;&amp; AvaFile_Comment__c,
&quot;Suspended&quot;,&quot;(Status Suspended): &quot;&amp; AvaFile_Comment__c,
&quot;Closed - Customer Not Responding&quot;,&quot;(Closed - Customer Not Responding):  &quot; &amp; AvaFile_Comment__c,
&quot;Closed - Customer Requested Hold&quot;,&quot;(Closed - Customer Requested Hold):  &quot; &amp; AvaFile_Comment__c,
&quot;  &quot;)

&amp;BR()&amp;&quot;-------  &quot;&amp;BR()&amp;AvaFileLog__c</formula>
        <name>UpdateAFGLLog</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateGoLiveEscalationto60days</fullName>
        <field>GoLive_Escalation__c</field>
        <literalValue>2 - Support Director</literalValue>
        <name>Update GoLive Escalation to 60 days</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateGoLiveEscalationto75days</fullName>
        <field>GoLive_Escalation__c</field>
        <literalValue>2 - Support Director</literalValue>
        <name>Update GoLive Escalation to 75 days</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateGoLiveStatus</fullName>
        <description>Update GoLive status to match AvaFile status when Cancelled</description>
        <field>GoLive_Status__c</field>
        <literalValue>Closed - Customer Cancelled</literalValue>
        <name>Update GoLive Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateLastAFComment</fullName>
        <field>AFLastLogEntry__c</field>
        <formula>AvaFile_Comment__c</formula>
        <name>UpdateLastAFComment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateLastGoLiveLogEntryDateStamp</fullName>
        <description>Updates the Last Log Entry Date with Now()</description>
        <field>LastLogEntryDate__c</field>
        <formula>GoLive_Log_Stamp__c</formula>
        <name>UpdateLastGoLiveLogEntryDateStamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateLastLogEntry</fullName>
        <field>GL_Last_Log_Entry__c</field>
        <formula>GoLive_Log_User__c &amp;&quot; on ( &quot;&amp; text(GoLive_Log_Stamp__c )&amp;&quot; ) - &quot;&amp;GoLive_Log_Entry__c</formula>
        <name>Update Last Log Entry</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateToActiveInProgress</fullName>
        <description>Sets the GoLive Status to &apos;Active - In Progress&apos; when the AvaFile Status is set to &apos;Scheduled&apos;</description>
        <field>GoLive_Status__c</field>
        <literalValue>Active - In Progress</literalValue>
        <name>UpdateToActiveInProgress</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_AOD</fullName>
        <field>AOD__c</field>
        <formula>IF(ISNULL(Link_to_Production_Account__r.AvaFileOrderDate__c),
Link_to_Dev_Contract__r.AvaFileOrderDate__c, 
GL_Contract_StartDate__c)</formula>
        <name>Update AOD</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Company_Created_Date</fullName>
        <field>msdCompany_Created_Date__c</field>
        <formula>today()</formula>
        <name>Update Company_Created_Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Connector_2</fullName>
        <field>Connector2__c</field>
        <formula>Connector__c</formula>
        <name>Update Connector 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Cust_Start_Date</fullName>
        <field>Customer_Start_Date__c</field>
        <formula>if(isnull( Customer_Start_Date__c),today(),Customer_Start_Date__c)</formula>
        <name>Update Cust Start Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Date_Cancelled</fullName>
        <field>Cancellation_Date__c</field>
        <formula>NOW()</formula>
        <name>Update Date Cancelled</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Date_RMO_Packet_Received</fullName>
        <field>Date_RMO_Packet_Received__c</field>
        <formula>today()</formula>
        <name>Update 	Date RMO Packet Received</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_GLStatus</fullName>
        <field>GoLive_Status__c</field>
        <literalValue>Cancellation Pending</literalValue>
        <name>Update GoLive Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_GL_Status</fullName>
        <description>Update GL Status to match the last Log Entry Type</description>
        <field>GoLive_Status__c</field>
        <literalValue>Existing - Uncertified</literalValue>
        <name>Update GL Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_GL_Status_to_Installed</fullName>
        <description>Update the GoLive Status to equal &apos;Installed&apos;</description>
        <field>GoLive_Status__c</field>
        <literalValue>Active - Installed</literalValue>
        <name>Update GL Status to Installed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_GL_Status_to_Migration_Complete</fullName>
        <description>Update the GL Status to &apos;Active - Migration Complete&apos;</description>
        <field>GoLive_Status__c</field>
        <literalValue>Active - Migration Complete</literalValue>
        <name>Update GL Status to Migration Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_GoLive_Status_for_Reengage</fullName>
        <field>GoLive_Status__c</field>
        <literalValue>Active - In Progress</literalValue>
        <name>Update GoLive Status for Reengage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_GoLive_Status_to_Completed</fullName>
        <description>When an AvaFile GoLive is updated to have a staus of &apos;Live&apos;, update the GoLive status to &apos;Closed - Completed&apos;</description>
        <field>GoLive_Status__c</field>
        <literalValue>Closed - Completed</literalValue>
        <name>Update GoLive Status to Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Last_Log_Entry</fullName>
        <field>GL_Last_Log_Entry__c</field>
        <formula>Text( GoLive_Log_Stamp__c )&amp;&quot;  -  &quot;&amp; GoLive_Log_User__c &amp;BR()&amp; AvaFile_Comment__c</formula>
        <name>Update Last Log Entry</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Last_Log_Entry_Date</fullName>
        <field>LastLogEntryDate__c</field>
        <formula>now()</formula>
        <name>Update Last Log Entry Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Sales_Instructions</fullName>
        <description>Copies the GoLive Notes from the related Account into the Sales Notes field on the GoLive object</description>
        <field>SalesNotes__c</field>
        <formula>Related_to_Account__r.GoLive_Notes__c</formula>
        <name>Update Sales Instructions</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>2009 AvaFile Customer Issues</fullName>
        <actions>
            <name>x2009AvaFileGoLiveCustomerIssues</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.AvaFile_Status__c</field>
            <operation>equals</operation>
            <value>Customer Issues</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>2009 AvaFile Filing Scheduled</fullName>
        <actions>
            <name>x2009AvaFileGoLiveStatusisScheduled</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.AvaFile_Status__c</field>
            <operation>equals</operation>
            <value>Scheduled</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>2009 AvaFile Live</fullName>
        <actions>
            <name>x2009AvaFileGoLiveisLive</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.AvaFile_Status__c</field>
            <operation>equals</operation>
            <value>Live</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AvaFileGoLiveCancelled</fullName>
        <actions>
            <name>AvafileGoLiveCancelled</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.AvaFile_Status__c</field>
            <operation>equals</operation>
            <value>Cancelled</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AvaFileGoLiveSuspended</fullName>
        <actions>
            <name>AvaFileGoLiveSuspended</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.AvaFile_Status__c</field>
            <operation>equals</operation>
            <value>Suspended</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Clear AvaFile Comment</fullName>
        <actions>
            <name>Clear_AvaFile_Comment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.AvaFile_Comment__c</field>
            <operation>greaterThan</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Clear Calc Live Date</fullName>
        <actions>
            <name>Clear_Calc_Live_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.Live_on_CALC__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.Calc_Live_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>DateStamp Calc Live Date</fullName>
        <actions>
            <name>Set_Calc_Live_Date_to_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.Live_on_CALC__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.Calc_Live_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>First Production Transaction - AvaFile Only</fullName>
        <active>true</active>
        <description>Version of this for Carrie for AvaFile customers who did their first trans.</description>
        <formula>AND(GL_Prod_Connected__c  =&quot;Yes&quot; , Ordered_AvaFile__c =&quot;Yes&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>GoLive Log Set to Customer Reactivated</fullName>
        <actions>
            <name>Update_GoLive_Status_for_Reengage</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>Customer ReActivated</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>GoLive Log is %27Installed%27</fullName>
        <actions>
            <name>Update_GL_Status_to_Installed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>Installed</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Status__c</field>
            <operation>notEqual</operation>
            <value>Active - Installed</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>AvaTax GoLive</value>
        </criteriaItems>
        <description>If the most recent Log entry of Type &apos;Installed&apos; but the GoLive Status is not set to &apos;Installed&apos;, this rule updates the GoLive Status to = &apos;Installed&apos;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>GoLive Log is Cancellation Pending</fullName>
        <actions>
            <name>Update_GLStatus</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>Cancellation Pending</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>GoLive Log%3A Start Self Serve</fullName>
        <actions>
            <name>Set_Status_to_Self_Serve</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( $RecordType.Name &lt;&gt;&quot;Compliance GoLive&quot;,ISPICKVAL( GoLive_Log_Type__c ,&quot;GoLive: Letter of Introduction Sent&quot;), NOT(ISPICKVAL(GoLive_Status__c,&quot;Self-Serve: Pending Customer Activity&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>GoLive Status Update %28Active - In Progress%29</fullName>
        <actions>
            <name>UpdateToActiveInProgress</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive__c.AvaFile_Status__c</field>
            <operation>equals</operation>
            <value>Scheduled</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Compliance GoLive</value>
        </criteriaItems>
        <description>Sets the GoLive Status to &apos;Active - In Progress&apos; when the AvaFile Status is set to &apos;Scheduled&apos;</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>GoLive Update Log</fullName>
        <actions>
            <name>ClearLogEntry</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>GoLiveUpdateLogField</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Increment_Contact_Count</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>ResetLogTypetoNone</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>UpdateLastGoLiveLogEntryDateStamp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>UpdateLastLogEntry</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Appends Log Entry to the Log History</description>
        <formula>AND(GoLive_Log_Entry__c  &lt;&gt; GL_Last_Log_Entry__c,GoLive_Log_Entry__c &lt;&gt; &quot;&quot;, $RecordType.Name &lt;&gt; &quot;Compliance GoLive&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Initialize AvaFile Log Entry</fullName>
        <actions>
            <name>Set_AvaFile_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Compliance GoLive</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Initialize GoLIve ID %28via Asset%29 - Calc</fullName>
        <actions>
            <name>SetConnector2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SetServiceDescription2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Setup_AvaTax_formatted_GoLive_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Uses the associated Asset to update the GoLive ID field</description>
        <formula>AND(NOT( ISBLANK(Asset__c )), NOT(CONTAINS(Name,&quot;***&quot; )), ISPICKVAL(Asset__r.Product2.Family ,&quot;Calc&quot;))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Initialize GoLive ID</fullName>
        <actions>
            <name>InitializeGoLiveID</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SetConnector2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SetServiceDescription2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(ISBLANK(Asset__c ), NOT(CONTAINS(Name,&quot;***&quot; )))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Initialize GoLive ID %28via Asset%29 - Certs</fullName>
        <actions>
            <name>SetConnector2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SetServiceDescription2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Setup_Certs_formatted_GoLive_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Uses the associated Asset to update the GoLive ID field</description>
        <formula>AND(NOT( ISBLANK(Asset__c )), NOT(CONTAINS(Name,&quot;***&quot; )), ISPICKVAL(Asset__r.Product2.Family ,&quot;Certs&quot;))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Initialize GoLive ID %28via Asset%29 - Returns</fullName>
        <actions>
            <name>SetConnector2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SetServiceDescription2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Setup_Returns_formatted_GoLive_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Uses the associated Asset to update the GoLive ID field</description>
        <formula>AND(NOT( ISBLANK(Asset__c )), NOT(CONTAINS(Name,&quot;***&quot; )), ISPICKVAL(Asset__r.Product2.Family ,&quot;Returns&quot;),NOT(CONTAINS( Asset__r.Product2.Interface__c ,&quot;SST&quot;)))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Initialize GoLive ID %28via Asset%29 - SST</fullName>
        <actions>
            <name>SetConnector2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SetServiceDescription2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Setup_SST_formatted_GoLive_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Uses the associated Asset to update the GoLive ID field</description>
        <formula>AND(NOT( ISBLANK(Asset__c )), NOT(CONTAINS(Name,&quot;***&quot; )), ISPICKVAL(Asset__r.Product2.Family ,&quot;Returns&quot;),CONTAINS( Asset__r.Product2.Interface__c ,&quot;SST&quot;))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Log Entry is Avalara Requirements Delivered</fullName>
        <actions>
            <name>Set_GL_Status_to_Avalara_Requirements</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>T2 OEM Connector GoLive</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Status__c</field>
            <operation>notEqual</operation>
            <value>Avalara Requirements Delivered</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>Avalara Requirements Delivered</value>
        </criteriaItems>
        <description>If Log Entry type is &apos;Avalara Requirements Delivered&apos;, update the GoLive Status accordingly</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Log Entry is Certified</fullName>
        <actions>
            <name>OEMConnectorCertified</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Set_GL_Status_to_Certified</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>T2 OEM Connector GoLive</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Status__c</field>
            <operation>notEqual</operation>
            <value>Certified</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>Certified</value>
        </criteriaItems>
        <description>If Log Entry type is &apos;Certified&apos;, update the GoLive Status accordingly</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Log Entry is Development in Progress</fullName>
        <actions>
            <name>Set_GL_Status_to_Development_in_Progress</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>T2 OEM Connector GoLive</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Status__c</field>
            <operation>notEqual</operation>
            <value>Development in Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>Development In Progress</value>
        </criteriaItems>
        <description>If Log Entry type is &apos;Development in Progress&apos;, update the GoLive Status accordingly</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Log Entry is Existing Uncertified</fullName>
        <actions>
            <name>Update_GL_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>T2 OEM Connector GoLive</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Status__c</field>
            <operation>notEqual</operation>
            <value>Existing - Uncertified</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>Existing - Uncertified</value>
        </criteriaItems>
        <description>If Log Entry type is Existing - Uncertified, update the GoLive Status Accordingly</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Log Entry is Migration Complete</fullName>
        <actions>
            <name>Update_GL_Status_to_Migration_Complete</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>SDK: Migration Complete</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Status__c</field>
            <operation>notEqual</operation>
            <value>Closed - Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>2011 GoLive,T2 OEM Connector GoLive,Compliance GoLive</value>
        </criteriaItems>
        <description>When the GoLive Log Entry is &quot;SDK: Migration Complete&quot;, update the GoLive Status to &apos;Active - Migration Complete&apos;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Log Entry is OEM Connector Review</fullName>
        <actions>
            <name>Set_GL_Status_to_OEM_Connector_Review</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>T2 OEM Connector GoLive</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Status__c</field>
            <operation>notEqual</operation>
            <value>OEM Connector Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>OEM Connector Review</value>
        </criteriaItems>
        <description>If Log Entry type is &apos;OEM Connector Review&apos;, update the GoLive Status accordingly</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Log Entry is OEM Design Delivered</fullName>
        <actions>
            <name>Set_GL_Status_to_OEM_Design_Delivered</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>T2 OEM Connector GoLive</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Status__c</field>
            <operation>notEqual</operation>
            <value>OEM Design Delivered</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>OEM Design Delivered</value>
        </criteriaItems>
        <description>If Log Entry type is &apos;OEM Design Delivered&apos;, update the GoLive Status accordingly</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Log Entry is Ready for Kickoff Call</fullName>
        <actions>
            <name>SetGLStatustoReadyforKickoffCall</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>T2 OEM Connector GoLive</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Status__c</field>
            <operation>notEqual</operation>
            <value>Ready for Kickoff Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>Ready for Kickoff Call</value>
        </criteriaItems>
        <description>If Log Entry type is &apos;Ready for Kickoff Call&apos;, update the GoLive Status Accordingly</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Log Entry is UAT Early Adopter</fullName>
        <actions>
            <name>Set_GL_Status_to_UAT_Early_Adopter</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>T2 OEM Connector GoLive</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Status__c</field>
            <operation>notEqual</operation>
            <value>UAT / Early Adopter</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>UAT / Early Adopter</value>
        </criteriaItems>
        <description>If Log Entry type is &apos;UAT / Early Adopter&apos;, update the GoLive Status accordingly</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Log Says SDK Checkup Message Sent</fullName>
        <actions>
            <name>SetSDKStatWaitingforCode</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>SDK: Checkup Message Sent</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_SDK_Status__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Compliance GoLive</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Log Says SDK Dev Contacted</fullName>
        <actions>
            <name>SetSDKStatWaitingforCode</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>SDK: Developer Contacted</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_SDK_Status__c</field>
            <operation>notEqual</operation>
            <value>SDK Waiting for Code</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Compliance GoLive</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify GLC of Update to Log</fullName>
        <actions>
            <name>Notify_GLC_of_Update_to_Log</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(Ava_GoLive_Coordinator__r.Username &lt;&gt;  $User.Username,OR(ISCHANGED(  GoLive_Log_Entry__c ),ISCHANGED(  AvaFile_Comment__c )))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Notify Managed Returns Team of Documents Ready for Review</fullName>
        <actions>
            <name>Notify_Managed_Returns_Team_of_Submitted_Documents</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.Returns_Document_Status__c</field>
            <operation>equals</operation>
            <value>Documents Received From Customer &amp; Submitted for Approval</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify PRO Contact of Pending Mapping Call</fullName>
        <actions>
            <name>SetPROStatustoPendingMappingCall</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
ISPICKVAL( GoLive_PRO_Status_del_del__c ,&quot;&quot;),
ISPICKVAL( GoLive_Log_Type__c ,&quot;GoLive: Welcome Call&quot;),
Ordered_PRO__c = &quot;Yes&quot;, $RecordType.Name &lt;&gt; &quot;Compliance GoLive&quot;

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Notify Wendy of New CERTS GoLive Coordinator</fullName>
        <actions>
            <name>New_CERT_GoLive_Coordinator_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>If a new or reassigned Cert GoLive, notify Wendy so that she can give them access to the customer&apos;s CERT portal.</description>
        <formula>AND(
OR(ischanged( Ava_GoLive_Coordinator__c )=true,isnew()=true),
CONTAINS(UPPER(Name),&quot;CERT&quot;)
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>PRO GoLive Ready to Close</fullName>
        <actions>
            <name>SendFYIPROConnectedMapped</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>StampActualGoLiveDate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.GL_Prod_Connected__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_PRO_Status_del_del__c</field>
            <operation>equals</operation>
            <value>PRO: Mapping Complete</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Status__c</field>
            <operation>notContain</operation>
            <value>Inactive</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Status__c</field>
            <operation>notContain</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Compliance GoLive</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pending Welcome if New GoLive</fullName>
        <actions>
            <name>SettoPendingWC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.GoLive_Status__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Compliance GoLive</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>T2 OEM Connector GoLive</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Populate AOD Field</fullName>
        <actions>
            <name>Update_AOD</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Compliance GoLive</value>
        </criteriaItems>
        <description>Uupon creation of new RETURNS GoLive</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Populate Account Name</fullName>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>2012 GoLive</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Process PRO Mapping Call - Cust Not Ready</fullName>
        <actions>
            <name>SetPROStatustoCustomerNotReady</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>PRO: Mapping Call - Customer Not Ready to Map</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_PRO_Status_del_del__c</field>
            <operation>notEqual</operation>
            <value>PRO: Customer Not Ready to Map</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Compliance GoLive</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Process PRO Mapping Call - In Progress</fullName>
        <actions>
            <name>SetPROStatustoMappinginProgress</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>PRO: Mapping Call - Mapping in Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_PRO_Status_del_del__c</field>
            <operation>notEqual</operation>
            <value>PRO: Mapping in Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Compliance GoLive</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Process PRO Mapping Complete</fullName>
        <actions>
            <name>SendMappedEmailDing</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>SetPROStatustoMapComplete</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Mapping_Complete_Checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>PRO: Mapping Complete</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_PRO_Status_del_del__c</field>
            <operation>notEqual</operation>
            <value>PRO: Mapping Complete</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Compliance GoLive</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Ready for SDK Call</fullName>
        <actions>
            <name>SetSDKCallDeveloper</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>GoLive: Welcome Call</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.AV_Service_Description__c</field>
            <operation>contains</operation>
            <value>SDK</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GL_Dev_Connected__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>Compliance GoLive</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Reset PRO Last Contact</fullName>
        <actions>
            <name>ResetLastPROContactStamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
(GoLive_Log_User__c  =  Ava_GoLive_PRO_Contact__c), 
(GoLive_Log_Entry__c  &lt;&gt;  GL_Last_Log_Entry__c ),
( $RecordType.Name &lt;&gt; &quot;Compliance GoLive&quot;)
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Connected Not Mapped Status</fullName>
        <actions>
            <name>SetGLStatustoConnectNotMap</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6 and 7</booleanFilter>
        <criteriaItems>
            <field>GoLive__c.Ordered_PRO__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_PRO_Status_del_del__c</field>
            <operation>notEqual</operation>
            <value>PRO: Mapping Complete</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GL_Prod_Connected__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Status__c</field>
            <operation>notContain</operation>
            <value>Closed</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Status__c</field>
            <operation>notContain</operation>
            <value>Inactive</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Status__c</field>
            <operation>notContain</operation>
            <value>Mapped</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>notContain</operation>
            <value>Compliance GoLive</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Customer Start Date</fullName>
        <actions>
            <name>Set_Customer_Start_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.msdAccount_Activation_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.Product_Family__c</field>
            <operation>equals</operation>
            <value>CALC</value>
        </criteriaItems>
        <description>if not already filled in</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Date RMO Filing Calendar Complete</fullName>
        <actions>
            <name>Set_Date_RMO_Filing_Calendar_Complete</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.Returns_Document_Status__c</field>
            <operation>equals</operation>
            <value>Passed - Filing Calendar Complete</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Date RMO Packet Recieved</fullName>
        <actions>
            <name>Update_Date_RMO_Packet_Received</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.Returns_Document_Status__c</field>
            <operation>equals</operation>
            <value>Documents Received From Customer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Date RMO Packet Sent</fullName>
        <actions>
            <name>Set_Date_RMO_Packet_Sent</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.Returns_Document_Status__c</field>
            <operation>equals</operation>
            <value>Returns Packet Sent to Customer</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set GoLive Status to Cancelled</fullName>
        <actions>
            <name>Set_Cancellation_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>UpdateGoLiveStatus</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Compliance GoLive</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.AvaFile_Status__c</field>
            <operation>equals</operation>
            <value>Cancelled</value>
        </criteriaItems>
        <description>When a Compliance go live has the AvaFile status changed to &apos;Cancelled&apos;, update the GoLive Status to Cancelled as well</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set GoLive Status to Closed - Completed</fullName>
        <actions>
            <name>Update_GoLive_Status_to_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Compliance GoLive</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.AvaFile_Status__c</field>
            <operation>equals</operation>
            <value>Live</value>
        </criteriaItems>
        <description>When a Compliance go live has the AvaFile status changed to &apos;Live&apos;, update the GoLive Status to Closed - Completed</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set GoLive Status to Closed - Customer Hold</fullName>
        <actions>
            <name>Set_GL_Status_to_Closed_Hold</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.GoLive_Status__c</field>
            <operation>notEqual</operation>
            <value>Closed - Customer Requested Hold</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>Closed - Customer Requested Hold</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set GoLive Status to Closed - Not Responding</fullName>
        <actions>
            <name>Set_GoLive_Status_to_Closed_Not_Respon</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.GoLive_Status__c</field>
            <operation>notEqual</operation>
            <value>Closed - Customer Not Responding</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>Closed - Customer Not Responding</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Original GoLive Forecast</fullName>
        <actions>
            <name>Increment_Reschedule_Count</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Original_GoLive_Forecast</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IF(Product_Family__c=&quot;RETURNS&quot;, ISCHANGED(EstFFDate__c)
,ISCHANGED(Est_GoLive_Date__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set SST GoLive to Live</fullName>
        <actions>
            <name>SetStatustoClosed</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_AvaFile_Status_to_Live</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.GoLive_Log_Type__c</field>
            <operation>equals</operation>
            <value>GoLive: Complete</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>SST GoLive</value>
        </criteriaItems>
        <description>Sets the GoLive Status to Live when a Log Entry of Type &apos;Complete&apos; is added to an SST GoLive</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Actual GoLive Date</fullName>
        <actions>
            <name>Stamp_Actual_GoLive_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.AvaFile_Status__c</field>
            <operation>equals</operation>
            <value>GoLive Complete</value>
        </criteriaItems>
        <description>For RETURNS GoLives, set the Actual GoLive Date to when we completed the GoLive.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Start AvaFile GoLive</fullName>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.GoLiveMasterStatus__c</field>
            <operation>equals</operation>
            <value>AvaTax PRO Live</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.Ordered_AvaFile__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TEMP Mass Email Returns Status</fullName>
        <actions>
            <name>MASS_Email_Returns_Temp</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Returns_Status_Email_Sent</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>GoLive__c.Mass_Email_Stat_Flag__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Confidence Level of Est GoLive Date</fullName>
        <actions>
            <name>Set_Confidence_in_Est_to_Complte</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND 2) OR (3 AND 4)</booleanFilter>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Compliance GoLive</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.AvaFile_Status__c</field>
            <operation>equals</operation>
            <value>GoLive Complete</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>AvaTax GoLive</value>
        </criteriaItems>
        <criteriaItems>
            <field>GoLive__c.GoLive_Status__c</field>
            <operation>equals</operation>
            <value>Closed - Completed</value>
        </criteriaItems>
        <description>Once a golive is GoLive Complete (Returns) or Complete (CALC), set confidence in estimate to &apos;Complete&apos;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Sales Instructions</fullName>
        <actions>
            <name>Update_Sales_Instructions</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Copies the GoLive Notes from the related Account into the Sales Notes field on the GoLive object</description>
        <formula>ISBLANK(SalesNotes__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>UpdateAvaFileLog</fullName>
        <actions>
            <name>Increment_Contact_Count2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>UpdateAFGLLog</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>UpdateLastAFComment</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>UpdateLastGoLiveLogEntryDateStamp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Last_Log_Entry</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Last_Log_Entry_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(AvaFile_Comment__c &lt;&gt; AFLastLogEntry__c,LEN(AvaFile_Comment__c)&gt;0)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>Admin_Console_Complete</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>14</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Admin Console Complete</subject>
    </tasks>
    <tasks>
        <fullName>Admin_Console_Complete1</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>21</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Admin Console Complete</subject>
    </tasks>
    <tasks>
        <fullName>AvaTax_Certs_Planning_Call</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>7</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AvaTax Certs Planning Call</subject>
    </tasks>
    <tasks>
        <fullName>AvaTax_Returns_Planning_Call</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>21</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AvaTax Returns Planning Call</subject>
    </tasks>
    <tasks>
        <fullName>CERTS_is_Live</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>21</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>CERTS is Live</subject>
    </tasks>
    <tasks>
        <fullName>Certs_Account_Setup</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>14</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Certs Account Setup</subject>
    </tasks>
    <tasks>
        <fullName>Connector_Configured</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>14</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Connector Configured</subject>
    </tasks>
    <tasks>
        <fullName>Connector_Installed</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>14</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Connector Installed</subject>
    </tasks>
    <tasks>
        <fullName>Connector_Live</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>21</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Connector Live</subject>
    </tasks>
    <tasks>
        <fullName>Customer_Start_Implementation</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>7</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Customer Start Implementation</subject>
    </tasks>
    <tasks>
        <fullName>Customer_Start_Implementation1</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>14</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Customer Start Implementation</subject>
    </tasks>
    <tasks>
        <fullName>Filing_Calendar_Finalized</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>45</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Filing Calendar Finalized</subject>
    </tasks>
    <tasks>
        <fullName>Filing_Calendar_Returned</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>28</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Filing Calendar Returned</subject>
    </tasks>
    <tasks>
        <fullName>GoLive_Complete</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>21</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>GoLive Complete</subject>
    </tasks>
    <tasks>
        <fullName>Import_Customer_Records</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>21</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Import Customer Records</subject>
    </tasks>
    <tasks>
        <fullName>Import_Legacy_Certificates</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>21</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Import Legacy Certificates</subject>
    </tasks>
    <tasks>
        <fullName>POA_Returned</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>28</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>POA Returned</subject>
    </tasks>
    <tasks>
        <fullName>PRO_Mapping_Call</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>7</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>PRO Mapping Call</subject>
    </tasks>
    <tasks>
        <fullName>PRO_Mapping_Complete</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>14</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>PRO Mapping Complete</subject>
    </tasks>
    <tasks>
        <fullName>Payment_Form_Returned</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>28</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Payment Form Returned</subject>
    </tasks>
    <tasks>
        <fullName>Returns_Live</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>45</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Returns Live</subject>
    </tasks>
    <tasks>
        <fullName>Returns_Status_Email_Sent</fullName>
        <assignedTo>garin.pangburn@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Returns Status Email Sent</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Returns Status Email Sent</subject>
    </tasks>
    <tasks>
        <fullName>Welcome_Call</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Welcome Call</subject>
    </tasks>
    <tasks>
        <fullName>Welcome_Call_Complete</fullName>
        <assignedTo>GoLiveCoordinator</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Welcome Call Complete</subject>
    </tasks>
</Workflow>
