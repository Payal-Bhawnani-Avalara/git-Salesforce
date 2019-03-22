<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>AWF_Cancel_My_Contract_Final_Alert</fullName>
        <ccEmails>bob.waite@avalara.com</ccEmails>
        <description>AWF Cancel My Contract Alert</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/AWFCancelAssigned2You</template>
    </alerts>
    <alerts>
        <fullName>AWF_Cancel_My_Contract_Final_Rejection</fullName>
        <ccEmails>bob.waite@avalara.com</ccEmails>
        <description>AWF Cancel My Contract Final Rejection</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/AWFCancelAssigned2You</template>
    </alerts>
    <alerts>
        <fullName>AWF_Cancellation_Rejected</fullName>
        <ccEmails>bob.waite@avalara.com</ccEmails>
        <description>AWF Cancellation Rejected</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/AWFCancelAssigned2You</template>
    </alerts>
    <alerts>
        <fullName>AcknowledgeCustomerCancelReceived</fullName>
        <description>AcknowledgeCustomerCancelReceived</description>
        <protected>false</protected>
        <recipients>
            <field>Customer_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/Received_Your_Cancellation_Request</template>
    </alerts>
    <alerts>
        <fullName>Alert_Cancellation_older_than_7_days_old</fullName>
        <description>Alert! Cancellation older than 7 days old!</description>
        <protected>false</protected>
        <recipients>
            <recipient>clayton.wiggins@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Cancellation_7_days_old_alert</template>
    </alerts>
    <alerts>
        <fullName>Alert_for_Returns_Cancelaation_Approved</fullName>
        <description>Alert for Returns Cancelaation Approved</description>
        <protected>false</protected>
        <recipients>
            <recipient>bilkay.rose@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>blake.hanson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>heidi.genest@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/Cancellation_For_Returns_Approved</template>
    </alerts>
    <alerts>
        <fullName>CAM_Manager_Cacncellation_Alert</fullName>
        <description>CAM Manager Cacncellation Alert</description>
        <protected>false</protected>
        <recipients>
            <field>CAM_Manager__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CAM_Manager_Cancellation_Alert</template>
    </alerts>
    <alerts>
        <fullName>Cancellation_Alert_TrustFile_Cancellation_Approved</fullName>
        <description>Cancellation Alert - TrustFile Cancellation Approved</description>
        <protected>false</protected>
        <recipients>
            <recipient>aaron.zapf@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/Cancellation_Alert_TrustFile_Cancellation_Approved</template>
    </alerts>
    <alerts>
        <fullName>Cancellation_Approved_for_SST</fullName>
        <description>Cancellation Approved for SST</description>
        <protected>false</protected>
        <recipients>
            <recipient>bilkay.rose@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>blake.hanson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/Cancellation_For_SST_Approved</template>
    </alerts>
    <alerts>
        <fullName>Cancellation_Cancellation_Recalled</fullName>
        <ccEmails>dg-zuora-Provisioning@avalara.com</ccEmails>
        <description>Cancellation - Cancellation Recalled</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>GoLiveCoordinator</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>ImplementationDirector</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>aaron.zapf@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>andrea.anderson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>clayton.wiggins@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>pat.sullivan@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/AWFCancelRecalled</template>
    </alerts>
    <alerts>
        <fullName>Cancellation_Cancellation_Rejected</fullName>
        <description>Cancellation - Cancellation Rejected</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>pat.sullivan@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/AWFCancelRejected</template>
    </alerts>
    <alerts>
        <fullName>Cancellation_Notify_AvaSouth_of_Tax_Services_Cancellation</fullName>
        <description>Cancellation - Notify AvaSouth of Tax Services Cancellation</description>
        <protected>false</protected>
        <recipients>
            <recipient>stephanie.turner@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/AWFCancelAssigned2You</template>
    </alerts>
    <alerts>
        <fullName>Cancellation_Notify_AvaSouth_of_vCert_Cancellation</fullName>
        <ccEmails>wendy.leonard@avalara.com</ccEmails>
        <description>Cancellation - Notify AvaSouth of vCert Cancellation</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/AWFCancelAssigned2You</template>
    </alerts>
    <alerts>
        <fullName>Cancellation_Notify_AvaSouth_of_vReturns_Cancellation</fullName>
        <ccEmails>sara.bush@avalara.com</ccEmails>
        <ccEmails>casey.schletz@avalara.com</ccEmails>
        <description>Cancellation - Notify AvaSouth of vReturns Cancellation</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/AWFCancelAssigned2You</template>
    </alerts>
    <alerts>
        <fullName>Cancellation_Notify_vReturns_Team</fullName>
        <description>Cancellation - Notify vReturns Team</description>
        <protected>false</protected>
        <recipients>
            <recipient>liz.armbruester@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/AWFCancelAssigned2You</template>
    </alerts>
    <alerts>
        <fullName>Cancellation_Send_FYI_Cancel_Complete</fullName>
        <ccEmails>golive@avalara.com</ccEmails>
        <description>Cancellation - Send FYI OEM FTV Cancel Complete</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>andrea.anderson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/X2010_CancelNoticeOnly2</template>
    </alerts>
    <alerts>
        <fullName>Cancellation_or_Amendment_notification</fullName>
        <description>Cancellation or Amendment notification</description>
        <protected>false</protected>
        <recipients>
            <recipient>aaron.zapf@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>amy.mosher@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Cancellation_or_Amendment</template>
    </alerts>
    <alerts>
        <fullName>Early_Cancellation_NotificationSST</fullName>
        <description>Early Cancellation Notification</description>
        <protected>false</protected>
        <recipients>
            <recipient>heidi.genest@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/EarlyCancellationNotification</template>
    </alerts>
    <alerts>
        <fullName>Early_Cancellation_Notification_ALL</fullName>
        <description>Early Cancellation Notification - ALL Finance</description>
        <protected>false</protected>
        <recipients>
            <recipient>michelle.toussaint@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/EarlyCancellationNotification</template>
    </alerts>
    <alerts>
        <fullName>Early_Cancellation_Notification_Certs</fullName>
        <description>Early Cancellation Notification - Certs</description>
        <protected>false</protected>
        <recipients>
            <recipient>matt.tormollen@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>shaheen.chaudhry@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/EarlyCancellationNotification</template>
    </alerts>
    <alerts>
        <fullName>Early_Cancellation_Notification_Other</fullName>
        <description>Early Cancellation Notification - Other</description>
        <protected>false</protected>
        <recipients>
            <recipient>aaron.zapf@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/EarlyCancellationNotification</template>
    </alerts>
    <alerts>
        <fullName>Early_Cancellation_Notification_Tax</fullName>
        <description>Early Cancellation Notification - Tax Services</description>
        <protected>false</protected>
        <recipients>
            <recipient>stephanie.turner@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/EarlyCancellationNotification</template>
    </alerts>
    <alerts>
        <fullName>Early_Cncellation_Notification</fullName>
        <description>Early Cancellation Notification</description>
        <protected>false</protected>
        <recipients>
            <recipient>aaron.zapf@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/EarlyCancellationNotification</template>
    </alerts>
    <alerts>
        <fullName>Email_alert_for_CAM_approved_cancellations</fullName>
        <description>Email alert for CAM approved cancellations</description>
        <protected>false</protected>
        <recipients>
            <recipient>andrea.anderson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>order.processing@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>CAM_email_Templates/Approved_Cancellations_Email</template>
    </alerts>
    <alerts>
        <fullName>Give_Early_Notification_of_AvaFile_Cancellation_to_Compliance</fullName>
        <description>Give Early Notification of AvaFile Cancellation to Compliance</description>
        <protected>false</protected>
        <recipients>
            <recipient>edward.ekanem@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jd.jespersen@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kyana.price@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>pamela.knudsen@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>rajwinder.kaur@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/EarlyAvaFileCancellationNotification</template>
    </alerts>
    <alerts>
        <fullName>HeadsUp_to_Compliance_Support_Accounting</fullName>
        <ccEmails>bob.waite@avalara.com</ccEmails>
        <description>HeadsUp to Compliance, Support and Accounting</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>arminder.kaur@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>benjamin.andrews@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/x2011_HeadsUp_CancelSubmitted</template>
    </alerts>
    <alerts>
        <fullName>Send_HeadsUp_to_Compliance_Support</fullName>
        <ccEmails>bob.waite@avalara.com</ccEmails>
        <description>Send HeadsUp to Compliance, Support</description>
        <protected>false</protected>
        <recipients>
            <recipient>x2011CareLeadership</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>isie.wong@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Cancellation_Templates/x2011_HeadsUp_CancelSubmitted</template>
    </alerts>
    <alerts>
        <fullName>Send_Heads_Up_to_GoLive</fullName>
        <description>Send Heads Up to GoLive - Pending Cancellation</description>
        <protected>false</protected>
        <recipients>
            <recipient>GoLiveCoordinator</recipient>
            <type>role</type>
        </recipients>
        <recipients>
            <recipient>ImplementationDirector</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/x2011_HeadsUp_CancelSubmitted</template>
    </alerts>
    <alerts>
        <fullName>X60_day_cancellation_alert</fullName>
        <ccEmails>Salesleads@avalara.com</ccEmails>
        <description>60 day cancellation alert</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Cancellation_Templates/X60_day_sales_alert_cancellation</template>
    </alerts>
    <fieldUpdates>
        <fullName>Advance_Workflow_after_1_week</fullName>
        <description>Automatically sets CAM approval after Cancellation has been pending for over 1 week</description>
        <field>Workflow__c</field>
        <literalValue>Approved</literalValue>
        <name>Advance Workflow after 1 week</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cancelled_Returns</fullName>
        <field>Has_Returns__c</field>
        <formula>0</formula>
        <name>Cancelled Returns</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Account__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CheckCalcCheckbox</fullName>
        <description>Checks the Calc Checkbox</description>
        <field>Calc__c</field>
        <literalValue>1</literalValue>
        <name>Check Calc Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CheckReturnsCheckbox</fullName>
        <description>Checks the Returns Checkbox</description>
        <field>Returns__c</field>
        <literalValue>1</literalValue>
        <name>Check Returns Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Recall_Stamp</fullName>
        <description>Stamps the date when a recall actioned was initiated</description>
        <field>Recall_Date__c</field>
        <formula>Today()</formula>
        <name>Recall Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetWFApproved</fullName>
        <field>Workflow__c</field>
        <literalValue>Approved</literalValue>
        <name>SetWFApproved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetWFPendingCAM</fullName>
        <description>Sets the Workflow Status to &apos;Pending CAM&apos;</description>
        <field>Workflow__c</field>
        <literalValue>Pending CAM</literalValue>
        <name>SetWFPendingCAM</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetWFPendingFinal</fullName>
        <description>Sets the Workflow Status to &apos;Pending Final Deprovisiong&apos;</description>
        <field>Workflow__c</field>
        <literalValue>Pending Final Deprovisioning</literalValue>
        <name>SetWFPendingFinal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetWFPendingOps</fullName>
        <description>Sets the Workflow to a Status of &apos;Pending Ops&apos;</description>
        <field>Workflow__c</field>
        <literalValue>Pending Ops</literalValue>
        <name>SetWFPendingOps</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetWFRecalled</fullName>
        <field>Workflow__c</field>
        <literalValue>Recalled</literalValue>
        <name>SetWFRecalled</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetWFRejected</fullName>
        <field>Workflow__c</field>
        <literalValue>Rejected</literalValue>
        <name>SetWFRejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>StampAckAlertSentDateTime</fullName>
        <field>DateCustomerAckSent__c</field>
        <formula>NOW()</formula>
        <name>StampAckAlertSentDateTime</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Cam_Manager_Email</fullName>
        <field>CAM_Manager__c</field>
        <formula>CAM_Manager_email__c</formula>
        <name>Stamp Cam Manager Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Date_Assigned_to_Ops</fullName>
        <field>Date_Assigned_to_Ops__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Date Assigned to Ops</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Date_Cancelled_in_Accounting</fullName>
        <field>Date_Cancelled_in_Accounting__c</field>
        <formula>Today()</formula>
        <name>Stamp Date Cancelled in Accounting</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>60 Days Alert to Sales</fullName>
        <actions>
            <name>X60_day_cancellation_alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.Refund_Reason__c</field>
            <operation>equals</operation>
            <value>Within 60 Days of Sale</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cancellation 7 days old alert</fullName>
        <actions>
            <name>Alert_Cancellation_older_than_7_days_old</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.Cancellation_Timer__c</field>
            <operation>greaterOrEqual</operation>
            <value>7</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation__c.Workflow__c</field>
            <operation>equals</operation>
            <value>Pending</value>
        </criteriaItems>
        <description>Send out an email notification if a cancellation has been open for more than 7 days and hasn&apos;t yet been approved by a CAM</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cancelled Returns</fullName>
        <actions>
            <name>Cancelled_Returns</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.CancelWhat__c</field>
            <operation>equals</operation>
            <value>Returns,vReturns,Returns - SST</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation__c.Workflow__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Check Calc</fullName>
        <actions>
            <name>CheckCalcCheckbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.CancelWhat__c</field>
            <operation>includes</operation>
            <value>Calc</value>
        </criteriaItems>
        <description>If the Cancel What? field contains Calc</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Check Returns</fullName>
        <actions>
            <name>CheckReturnsCheckbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.CancelWhat__c</field>
            <operation>includes</operation>
            <value>Returns,Returns - SST</value>
        </criteriaItems>
        <description>If the Cancel What? field contains Calc</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EarlyAvaFileCancellationNotification</fullName>
        <actions>
            <name>Give_Early_Notification_of_AvaFile_Cancellation_to_Compliance</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.CancelWhat__c</field>
            <operation>includes</operation>
            <value>Returns</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EarlyAvaFileCancellationNotificationFinance</fullName>
        <actions>
            <name>Early_Cancellation_Notification_ALL</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.CancelWhat__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EarlyCertsCancellationNotification</fullName>
        <actions>
            <name>Early_Cancellation_Notification_Certs</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.CancelWhat__c</field>
            <operation>includes</operation>
            <value>Certs</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EarlyOnSiteLaserFileCancellationNotification</fullName>
        <actions>
            <name>Early_Cncellation_Notification</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.CancelWhat__c</field>
            <operation>includes</operation>
            <value>Avatax OnSite,LaserBridge</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EarlyOtherFileCancellationNotification</fullName>
        <actions>
            <name>Early_Cancellation_Notification_Other</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.CancelWhat__c</field>
            <operation>excludes</operation>
            <value>Returns - SST,AvaFile - SST,Tax Services,vReturns,Certs,AvaFile - Managed Returns,Avatax OnSite,LaserBridge,Returns</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EarlySSTServCancellationNotification</fullName>
        <actions>
            <name>Early_Cancellation_NotificationSST</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.CancelWhat__c</field>
            <operation>includes</operation>
            <value>Returns - SST,AvaFile - SST</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EarlyTaxServCancellationNotification</fullName>
        <actions>
            <name>Early_Cancellation_Notification_Tax</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.CancelWhat__c</field>
            <operation>includes</operation>
            <value>Tax Services</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify GoLive Of Cancellation</fullName>
        <actions>
            <name>Send_Heads_Up_to_GoLive</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.OpenGoLives__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation__c.Workflow__c</field>
            <operation>equals</operation>
            <value>Pending Ops</value>
        </criteriaItems>
        <description>Notifies GoLive of a Pending Cancellation if there is an Open GoLive and the Cancellation has been approved by the CAM.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Products Cancelled Task To CAM</fullName>
        <actions>
            <name>X3_Month_Cancellation_Winback_Check</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>X6_Month_Cancellation_Winback_Check</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.Workflow__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Recall%3A Onsite%2FLaserbridge</fullName>
        <actions>
            <name>Recall_of_Cancellation_Onsite_or_LaserBridge_PStask</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.Workflow__c</field>
            <operation>equals</operation>
            <value>Recalled</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation__c.CancelWhat__c</field>
            <operation>includes</operation>
            <value>Avatax OnSite,LaserBridge</value>
        </criteriaItems>
        <description>When a recall of a cancellation occurs, any actions by ops and accounting need to be undone.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Recall%3A Other</fullName>
        <actions>
            <name>Recall_of_Cancellation_See_CancelWhat_PSTask</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.Workflow__c</field>
            <operation>equals</operation>
            <value>Recalled</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation__c.CancelWhat__c</field>
            <operation>excludes</operation>
            <value>Returns - SST,AvaFile - SST,vReturns,Tax Services,Certs,AvaFile - Managed Returns,LaserBridge,Avatax OnSite,Returns</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Recall%3A Returns</fullName>
        <actions>
            <name>Recall_of_Cancellation_Returns_AKtask_Returns_non_SST</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Recall_of_Cancellation_Returns_CRtaskn_Returns_non_SST</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Recall_of_Cancellation_Returns_IWtask</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Recall_of_Cancellation_Returns_PStask</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.Workflow__c</field>
            <operation>equals</operation>
            <value>Recalled</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation__c.CancelWhat__c</field>
            <operation>includes</operation>
            <value>vReturns,Returns,AvaFile - Managed Returns</value>
        </criteriaItems>
        <description>When a recall of a cancellation occurs, any actions by ops and accounting need to be undone.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Recall%3A SST</fullName>
        <actions>
            <name>Recall_of_Cancellation_SST_HGTask</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.Workflow__c</field>
            <operation>equals</operation>
            <value>Recalled</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation__c.CancelWhat__c</field>
            <operation>includes</operation>
            <value>Returns - SST,AvaFile - SST</value>
        </criteriaItems>
        <description>When a recall of a cancellation occurs, any actions by ops and accounting need to be undone.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Recall%3A Tax Services</fullName>
        <actions>
            <name>Recall_of_Cancellation_Tax_Services_PSTask</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Recall_of_Cancellation_Tax_Services_STTask</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.Workflow__c</field>
            <operation>equals</operation>
            <value>Recalled</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation__c.CancelWhat__c</field>
            <operation>includes</operation>
            <value>Tax Services</value>
        </criteriaItems>
        <description>When a recall of a cancellation occurs, any actions by ops and accounting need to be undone.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Recall%3A vCerts</fullName>
        <actions>
            <name>Recall_of_Cancellation_vCerts</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Recall_of_Cancellation_vCerts_SHTask</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.Workflow__c</field>
            <operation>equals</operation>
            <value>Recalled</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation__c.CancelWhat__c</field>
            <operation>includes</operation>
            <value>Certs</value>
        </criteriaItems>
        <description>When a recall of a cancellation occurs, any actions by ops and accounting need to be undone.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SendCustomerCancelAcknowlegement</fullName>
        <actions>
            <name>AcknowledgeCustomerCancelReceived</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>StampAckAlertSentDateTime</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.SendCustomerAck__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Cancellation__c.DateCustomerAckSent__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Sends email acknowledgement to customer, account owner and creator of cancellation record when &quot;Send Acknowledgement&quot; checkbox is checked.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Manager Email</fullName>
        <actions>
            <name>Stamp_Cam_Manager_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Cancellation__c.AssignToCAM__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>CertCapture_Account_Deprovisioning</fullName>
        <assignedTo>earl.wright@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>CertCapture Account Deprovisioning is required for this cancellation event</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Cancellation__c.NextRenewalDate__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>CertCapture Account Deprovisioning</subject>
    </tasks>
    <tasks>
        <fullName>Process_Cancellation</fullName>
        <assignedTo>bob.waite@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please update your systems to reflect</description>
        <dueDateOffset>5</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Process Cancellation</subject>
    </tasks>
    <tasks>
        <fullName>Recall_of_Cancellation_Onsite_or_LaserBridge_PStask</fullName>
        <assignedTo>michelle.toussaint@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A recall of the associated cancellation request has occurred. If you have actioned any portion of the initial cancellation, please undo that work and mark this task complete. If no action was taken on your part, please mark the task complete as well.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Recall of Cancellation: Avatax Onsite or LaserBridge</subject>
    </tasks>
    <tasks>
        <fullName>Recall_of_Cancellation_Returns_AKtask_Returns_non_SST</fullName>
        <assignedTo>rajwinder.kaur@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A recall of the associated cancellation request has occurred. If you have actioned any portion of the initial cancellation, please undo that work and mark this task complete. If no action was taken on your part, please mark the task complete as well.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Recall of Cancellation: Returns (non SST)</subject>
    </tasks>
    <tasks>
        <fullName>Recall_of_Cancellation_Returns_CRtaskn_Returns_non_SST</fullName>
        <assignedTo>pamela.knudsen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A recall of the associated cancellation request has occurred. If you have actioned any portion of the initial cancellation, please undo that work and mark this task complete. If no action was taken on your part, please mark the task complete as well.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Recall of Cancellation: Returns (non SST)</subject>
    </tasks>
    <tasks>
        <fullName>Recall_of_Cancellation_Returns_IWtask</fullName>
        <assignedTo>heidi.genest@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A recall of the associated cancellation request has occurred. If you have actioned any portion of the initial cancellation, please undo that work and mark this task complete. If no action was taken on your part, please mark the task complete as well.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Recall of Cancellation: Returns (non SST)</subject>
    </tasks>
    <tasks>
        <fullName>Recall_of_Cancellation_Returns_PStask</fullName>
        <assignedTo>michelle.toussaint@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A recall of the associated cancellation request has occurred. If you have actioned any portion of the initial cancellation, please undo that work and mark this task complete. If no action was taken on your part, please mark the task complete as well.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Recall of Cancellation: Returns (non SST)</subject>
    </tasks>
    <tasks>
        <fullName>Recall_of_Cancellation_SST_HGTask</fullName>
        <assignedTo>heidi.genest@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A recall of the associated cancellation request has occurred. If you have actioned any portion of the initial cancellation, please undo that work and mark this task complete. If no action was taken on your part, please mark the task complete as well.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Recall of Cancellation: SST</subject>
    </tasks>
    <tasks>
        <fullName>Recall_of_Cancellation_See_CancelWhat_PSTask</fullName>
        <assignedTo>michelle.toussaint@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A recall of the associated cancellation request has occurred. If you have actioned any portion of the initial cancellation, please undo that work and mark this task complete. If no action was taken on your part, please mark the task complete as well.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Recall of Cancellation: General: See CancelWhat</subject>
    </tasks>
    <tasks>
        <fullName>Recall_of_Cancellation_Tax_Services_PSTask</fullName>
        <assignedTo>michelle.toussaint@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A recall of the associated cancellation request has occurred. If you have actioned any portion of the initial cancellation, please undo that work and mark this task complete. If no action was taken on your part, please mark the task complete as well.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Recall of Cancellation: Tax Services</subject>
    </tasks>
    <tasks>
        <fullName>Recall_of_Cancellation_Tax_Services_STTask</fullName>
        <assignedTo>stephanie.turner@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A recall of the associated cancellation request has occurred. If you have actioned any portion of the initial cancellation, please undo that work and mark this task complete. If no action was taken on your part, please mark the task complete as well.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Recall of Cancellation: Tax Services</subject>
    </tasks>
    <tasks>
        <fullName>Recall_of_Cancellation_vCerts</fullName>
        <assignedTo>kyle.leyh@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A recall of the associated cancellation request has occurred. If you have actioned any portion of the initial cancellation, please undo that work and mark this task complete. If no action was taken on your part, please mark the task complete as well.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Recall of Cancellation: vCerts</subject>
    </tasks>
    <tasks>
        <fullName>Recall_of_Cancellation_vCerts_SHTask</fullName>
        <assignedTo>steven.hawk@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A recall of the associated cancellation request has occurred. If you have actioned any portion of the initial cancellation, please undo that work and mark this task complete. If no action was taken on your part, please mark the task complete as well.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Recall of Cancellation: vCerts</subject>
    </tasks>
    <tasks>
        <fullName>RescueAssignedtoCAM</fullName>
        <assignedTo>bob.waite@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Cancellation__c.Date_Assigned_to_CAM__c</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Rescue Assigned to CAM</subject>
    </tasks>
    <tasks>
        <fullName>RescueAttempt</fullName>
        <assignedTo>bob.waite@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>We received a cancellation request from this customer.  Please call them, find out why they are cancelling, and see if you can turn them around.

cc: Andrea Anderson</description>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Rescue Attempt</subject>
    </tasks>
    <tasks>
        <fullName>RescueAttemptAndrea</fullName>
        <assignedTo>andrea.anderson@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>We received a cancellation request from this customer.  Please call them, find out why they are cancelling, and see if you can turn them around.

cc: Terry Arndt</description>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Rescue Attempt (Andrea)</subject>
    </tasks>
    <tasks>
        <fullName>ReviewCancellationRequest</fullName>
        <assignedTo>bob.waite@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Cancellation__c.CreatedDate</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Review Cancellation Request</subject>
    </tasks>
    <tasks>
        <fullName>X3_Month_Cancellation_Winback_Check</fullName>
        <assignedToType>owner</assignedToType>
        <description>3 Month Cancellation Winback Check</description>
        <dueDateOffset>90</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>3 Month Cancellation Winback Check</subject>
    </tasks>
    <tasks>
        <fullName>X6_Month_Cancellation_Winback_Check</fullName>
        <assignedToType>owner</assignedToType>
        <description>6 Month Cancellation Winback Check</description>
        <dueDateOffset>180</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>6 Month Cancellation Winback Check</subject>
    </tasks>
</Workflow>
