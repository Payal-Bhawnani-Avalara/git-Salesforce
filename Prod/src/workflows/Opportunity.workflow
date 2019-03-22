<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>AlertGoLiveOfCamSale</fullName>
        <ccEmails>clayton.wiggins@avalara.com</ccEmails>
        <ccEmails>onboarding@avalara.com</ccEmails>
        <description>Alert GoLive of a CAM sale</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/PotentialGoLiveRequired</template>
    </alerts>
    <alerts>
        <fullName>Alert_CAM_has_CLM_Opportunity_10_Days_without_Action</fullName>
        <description>Alert CAM has CLM Opportunity &gt; 10 Days without Action</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>avalara@yesler.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity/CAM_Opportunity_10Days</template>
    </alerts>
    <alerts>
        <fullName>Alert_CAM_has_CLM_Opportunity_5_Days_without_Action</fullName>
        <description>Alert CAM has CLM Opportunity &gt; 5 Days without Action</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>avalara@yesler.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity/CAM_Opportunity_5Days</template>
    </alerts>
    <alerts>
        <fullName>Alert_CAM_has_CLM_Opportunity_New_Opportunity</fullName>
        <description>Alert CAM has CLM Opportunity (New Opportunity)</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>avalara@yesler.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity/CAM_Opportunity_New</template>
    </alerts>
    <alerts>
        <fullName>Alert_DTS_opportunity</fullName>
        <description>Alert!: DTS opportunity</description>
        <protected>false</protected>
        <recipients>
            <recipient>bob.petteys@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jenny.gardner@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/DTS_Opportunity_Alert</template>
    </alerts>
    <alerts>
        <fullName>Approval_Reminder_Alert</fullName>
        <ccEmails>aaron.zapf@avalara.com</ccEmails>
        <description>Approval Reminder Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>amy.mosher@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opp_Approval_Submitted_2_Hour_Alert</template>
    </alerts>
    <alerts>
        <fullName>Asher_Alert_Channel_Partner_Name_Changed</fullName>
        <description>Asher Alert Channel Partner Name Changed</description>
        <protected>false</protected>
        <recipients>
            <recipient>asher.mathew@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>matthew.kantelis@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SAM_PPM_Email_Templates/Channel_Partner_changed_on_opp</template>
    </alerts>
    <alerts>
        <fullName>CAM_Introduction_Alert</fullName>
        <description>CAM Introduction Alert</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>webmaster@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/CAM_Introduction</template>
    </alerts>
    <alerts>
        <fullName>CP_No_Show_reassign_back_to_SDR_ADR</fullName>
        <ccEmails>DG-SDR_ADRLeaders@avalara.com</ccEmails>
        <description>CP No Show reassign back to SDR/ADR</description>
        <protected>false</protected>
        <recipients>
            <field>Qualified_By__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CP_No_Show_Reassignement_alert</template>
    </alerts>
    <alerts>
        <fullName>Channel_Partner_PMM_Alert</fullName>
        <description>Channel Partner PMM Alert</description>
        <protected>false</protected>
        <recipients>
            <field>CPN_PMM_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SAM_PPM_Email_Templates/Channel_Partner_changed_on_opp</template>
    </alerts>
    <alerts>
        <fullName>Channel_Partner_SAM_Alert</fullName>
        <description>Channel Partner SAM Alert</description>
        <protected>false</protected>
        <recipients>
            <field>CPN_SAM_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SAM_PPM_Email_Templates/Channel_Partner_changed_on_opp</template>
    </alerts>
    <alerts>
        <fullName>Connector_Opportunity_Changed</fullName>
        <description>Connector Opportunity Changed</description>
        <protected>false</protected>
        <recipients>
            <recipient>liz.anderson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mike.alpert@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Connecor_changed_on_opp</template>
    </alerts>
    <alerts>
        <fullName>Ding</fullName>
        <ccEmails>Ben@pvpartners.com</ccEmails>
        <ccEmails>ethan.bell@avalara.com</ccEmails>
        <description>Ding</description>
        <protected>false</protected>
        <recipients>
            <recipient>dg-extding@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>webmaster@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Visualforce_Email_Templates/Product_Line_Item_Sample</template>
    </alerts>
    <alerts>
        <fullName>Ding_Beta</fullName>
        <description>Ding Beta</description>
        <protected>false</protected>
        <recipients>
            <recipient>aaron.zapf@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Ding</template>
    </alerts>
    <alerts>
        <fullName>Ding_all</fullName>
        <description>Ding all</description>
        <protected>false</protected>
        <recipients>
            <recipient>aaron.zapf@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>webmaster@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Visualforce_Email_Templates/All_Product_Line_Item_Sample</template>
    </alerts>
    <alerts>
        <fullName>Director_Discount_Approved</fullName>
        <description>Director Discount Approved</description>
        <protected>false</protected>
        <recipients>
            <recipient>jay.deubler@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>pascal.vandooren@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Dir_alert</template>
    </alerts>
    <alerts>
        <fullName>Ecomm_Opp_Alert</fullName>
        <description>Ecomm Opp Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>aaron.zapf@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Ecomm_Opp_Alert</template>
    </alerts>
    <alerts>
        <fullName>Ecomm_Opp_Alert_Mktg</fullName>
        <description>Ecomm Opp Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>patti.passinault@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>robin.conner@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Ecomm_Opp_Created_Alert</template>
    </alerts>
    <alerts>
        <fullName>Jordan_s_notification_of_opp</fullName>
        <description>Jordan&apos;s notification of opp</description>
        <protected>false</protected>
        <recipients>
            <recipient>jordan.lang@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>sales.operations@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Opportunity/Opp_Distribution_Notification</template>
    </alerts>
    <alerts>
        <fullName>Lead_Converted_to_Opp_Won_Alert</fullName>
        <description>Lead Converted to Opp Won Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Partner_Portal_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>partnerprograms@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Portal_Templates/Lead_Converted_Opp_Won</template>
    </alerts>
    <alerts>
        <fullName>NEW_Soho_Opp_Distribution</fullName>
        <description>NEW Soho Opp Distribution</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity/SOHO_Opp_Distribution_Notification</template>
    </alerts>
    <alerts>
        <fullName>New_Avalara_Opportunity_Created_Notification_to_Account_Owner</fullName>
        <description>New Avalara Included Opportunity Created Notification to Account Owner</description>
        <protected>false</protected>
        <recipients>
            <recipient>brandon.huggins@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Finance_Treasury_Email_Notifications/New_Avalara_Included_Opportunity</template>
    </alerts>
    <alerts>
        <fullName>New_opportunity_assignment_form_Distribution_User</fullName>
        <description>New opportunity assignment form Distribution User</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>sales.operations@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Opportunity/Opp_Distribution_Notification</template>
    </alerts>
    <alerts>
        <fullName>NotifyOrderPlaced</fullName>
        <description>NotifyOrderPlaced</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>order.processing@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>SalesGroup/NotifyOrderPlaced</template>
    </alerts>
    <alerts>
        <fullName>Notify_CUT_Sales_Team_of_CUT_Opp</fullName>
        <ccEmails>dg-CUTOpportunities@avalara.com</ccEmails>
        <description>Notify CUT Sales Team of CUT Opp</description>
        <protected>false</protected>
        <recipients>
            <recipient>mark.wilhelm@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity/Notify_CUT_Sales_team_of_CUT_Opp</template>
    </alerts>
    <alerts>
        <fullName>Notify_Global_Sales_Team_of_Global_Opportunity</fullName>
        <ccEmails>dg-globalopportunities@avalara.com</ccEmails>
        <description>Notify Global Sales Team of Global Opportunity</description>
        <protected>false</protected>
        <recipients>
            <recipient>mark.wilhelm@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity/Notify_Global_Sales_team_of_Global_Opp</template>
    </alerts>
    <alerts>
        <fullName>Notify_IS_Rep_to_populate_Opp_SubType</fullName>
        <description>Notify IS Rep to populate Opp SubType</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>jessica.davis@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mary.jensen@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mavis.norwich@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SetOppSubTypeAlert</template>
    </alerts>
    <alerts>
        <fullName>Notify_Ippolito_of_Account_reassignment</fullName>
        <description>Notify Ippolito of Account reassignment</description>
        <protected>false</protected>
        <recipients>
            <recipient>mark.ippolito@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>CAM_email_Templates/Notify_Ippolito_of_new_Named_Account</template>
    </alerts>
    <alerts>
        <fullName>Notify_Rep_2_Weeks_Remaining_in_EComm_Trial</fullName>
        <description>Notify Rep - 2 Weeks Remaining in EComm Trial</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>FreeTrialTemplates/ECommFTVTwoWeeksLeftInTrial</template>
    </alerts>
    <alerts>
        <fullName>Notify_Rep_2_Weeks_Remaining_in_Trial</fullName>
        <description>Notify Rep - 2 Weeks Remaining in Trial</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>FreeTrialTemplates/OEMFTVTwoWeeksLeftInTrial</template>
    </alerts>
    <alerts>
        <fullName>Notify_Rep_EComm_Trial_Expires_in_1_Day</fullName>
        <description>Notify Rep - EComm Trial Expires in 1 Day</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>FreeTrialTemplates/ECommFTVTrialExpiresIn1Day</template>
    </alerts>
    <alerts>
        <fullName>Notify_Rep_EComm_Trial_Halfway_Over</fullName>
        <description>Notify Rep - EComm Trial Halfway Over</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>FreeTrialTemplates/ECommFTVTrialHalfOver</template>
    </alerts>
    <alerts>
        <fullName>Notify_Rep_Trial_Expires_1_Day</fullName>
        <description>Notify Rep - Trial Expires in 1 Day</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>FreeTrialTemplates/OEMFTVTrialExpiresIn1Day</template>
    </alerts>
    <alerts>
        <fullName>Notify_Rep_Trial_Halfway_Over</fullName>
        <description>Notify Rep - Trial Halfway Over</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>FreeTrialTemplates/OEMFTVTrialHalfOver</template>
    </alerts>
    <alerts>
        <fullName>Notify_managers_of_missing_golive_data_on_recently_placed_order</fullName>
        <description>Notify managers of missing golive data on recently placed order</description>
        <protected>false</protected>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>pascal.vandooren@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>Opportunity/Opp_Missing_GoLive_Data</template>
    </alerts>
    <alerts>
        <fullName>Opp_Approved</fullName>
        <description>Opp Approved</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Order_Approval_Complete</template>
    </alerts>
    <alerts>
        <fullName>Opp_SLA_Alert</fullName>
        <description>Opp SLA Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>amy.mosher@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SLA_Opp_Alert</template>
    </alerts>
    <alerts>
        <fullName>Opp_SubType_Update_Alert</fullName>
        <description>Opp SubType Update Alert</description>
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
        <template>unfiled$public/Opp_SubTypeUpdate_Alert</template>
    </alerts>
    <alerts>
        <fullName>Opp_rejected</fullName>
        <description>Opp rejected</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Order_Approval_Rejected</template>
    </alerts>
    <alerts>
        <fullName>Opportunity_BD_Alert_when_created_with_Connector_New_Revive_or_API</fullName>
        <description>Opportunity BD Alert when created with Connector New/Revive or API</description>
        <protected>false</protected>
        <recipients>
            <recipient>jesse.powell@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>robin.conner@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/New_Opp_with_Connector_New_Revive_or_API</template>
    </alerts>
    <alerts>
        <fullName>PS_Booked_Value_Alert_for_Rep</fullName>
        <description>PS Booked Value Alert for Rep</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>aaron.zapf@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>danielle.kershaw@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>stephanie.turner@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Enablement/PS_OVerride_Alert</template>
    </alerts>
    <alerts>
        <fullName>Partner_Lead_Source_No_Channel_proposal_stage_alert</fullName>
        <ccEmails>PPM@avalara.com</ccEmails>
        <description>Partner Lead Source &amp; No Channel @ proposal stage alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>kelleigh.t-nelson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/ACP_MSP</template>
    </alerts>
    <alerts>
        <fullName>Portal_Lead_Converted_to_Opp_Alert</fullName>
        <description>Portal Lead Converted to Opp Alert</description>
        <protected>false</protected>
        <recipients>
            <field>Partner_Portal_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>partnerprograms@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Portal_Templates/Lead_Converted_Opp</template>
    </alerts>
    <alerts>
        <fullName>Premier_ACP_Partner_Customer_Product_Alert</fullName>
        <ccEmails>a4a@avalara.com</ccEmails>
        <description>Premier ACP Partner Customer Product Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>balz.wyss@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>PartnersOnly/Premier_ACP_Partner_Customer_Product_Alert</template>
    </alerts>
    <alerts>
        <fullName>Price_Lock_Approval_Alert</fullName>
        <description>Price Lock Approval Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>pascal.vandooren@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Proce_Lock_Approval_Complete</template>
    </alerts>
    <alerts>
        <fullName>Primary_Campaign_changed_on_opp_alert_for_Liz_S</fullName>
        <description>Primary Campaign changed on opp alert for Liz S</description>
        <protected>false</protected>
        <recipients>
            <recipient>christi.whipple@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kelleigh.t-nelson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>sales.operations@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Primary_Campaign_Alert_for_Liz_A</template>
    </alerts>
    <alerts>
        <fullName>SAM_Opportunity_Email_Alert</fullName>
        <description>SAM Opportunity Email Alert</description>
        <protected>false</protected>
        <recipients>
            <field>SAM_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SAM_PPM_Email_Templates/SAM_Opportunity_Connector_Alert</template>
    </alerts>
    <alerts>
        <fullName>SAM_Opportunity_Email_Alert_for_Jordan_Grant</fullName>
        <description>SAM Opportunity Email Alert for Jordan Grant</description>
        <protected>false</protected>
        <recipients>
            <recipient>mike.wingrove@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SAM_PPM_Email_Templates/SAM_Opportunity_Connector_Alert</template>
    </alerts>
    <alerts>
        <fullName>Sales_Enablement_Send_Converted</fullName>
        <description>Sales Enablement Send Converted</description>
        <protected>false</protected>
        <recipients>
            <field>SalesEnablementEmail__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>webmaster@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Sales_Enablement/Converted_Created</template>
    </alerts>
    <alerts>
        <fullName>Sales_Enablement_Send_Demo_Complete</fullName>
        <description>Sales Enablement Send Demo Complete</description>
        <protected>false</protected>
        <recipients>
            <field>SalesEnablementEmail__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Enablement/Demo_Completed</template>
    </alerts>
    <alerts>
        <fullName>Sales_Enablement_Send_Engaged</fullName>
        <description>Sales Enablement Send Engaged</description>
        <protected>false</protected>
        <recipients>
            <field>SalesEnablementEmail__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Enablement/Engaged</template>
    </alerts>
    <alerts>
        <fullName>Sales_Enablement_Send_Proposed</fullName>
        <description>Sales Enablement Send Proposed</description>
        <protected>false</protected>
        <recipients>
            <field>SalesEnablementEmail__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_Enablement/Proposed</template>
    </alerts>
    <alerts>
        <fullName>Send_CAM_Ding</fullName>
        <description>Send CAM Ding</description>
        <protected>false</protected>
        <recipients>
            <recipient>CAMs</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>pascal.vandooren@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>customer.loyalty@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Opportunity/CAM_Beach_Ding</template>
    </alerts>
    <alerts>
        <fullName>Send_CUT_Questionnaire</fullName>
        <description>Send CUT Questionnaire</description>
        <protected>false</protected>
        <recipients>
            <field>CUTSurveyContact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity/CUT_Opportunity_Survey</template>
    </alerts>
    <alerts>
        <fullName>Send_Global_VAT_Questionnaire</fullName>
        <description>Send Global / VAT Questionnaire</description>
        <protected>false</protected>
        <recipients>
            <field>Global_Survey_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity/Global_Opportunity_Survey_v2</template>
    </alerts>
    <alerts>
        <fullName>Send_GoLive_the_GoLive_Notes_for_Opportunities_associated_with_Completed_Orders</fullName>
        <description>Send GoLive the GoLive Notes for Opportunities associated with Completed Orders</description>
        <protected>false</protected>
        <recipients>
            <recipient>garin.pangburn@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>GoLive_Internal_Only/OpportunityNotesNotification</template>
    </alerts>
    <alerts>
        <fullName>Send_Go_Live_Opp_Results</fullName>
        <description>Send Go Live Opp Results</description>
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
        <template>GoLive_Templates/GoLiveOPP_aire</template>
    </alerts>
    <alerts>
        <fullName>Send_Strategic_Tax_Content_Survey_Link_to_Opportunity_Owner</fullName>
        <description>Send Strategic Tax Content Survey Link to Opportunity Owner</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity/Strategic_Tax_content_Survey_v2</template>
    </alerts>
    <alerts>
        <fullName>Shame_Queue_Notification_New_Owner</fullName>
        <description>Shame Queue Notification - New Owner</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity/Shame_Queue_Notification_New_Owner</template>
    </alerts>
    <alerts>
        <fullName>Shopify_Order_Alert</fullName>
        <ccEmails>aaron.zapf@avalara.com</ccEmails>
        <description>Shopify Order Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>bob.waite@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>marshal.kushniruk@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>matt.scoble@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>pascal.vandooren@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tessa.jones@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Connector_Management/Shopify_Alert</template>
    </alerts>
    <alerts>
        <fullName>Shopify_Plus_Manager_Returns_Upsell</fullName>
        <description>(Deprecated 3.5.18) Shopify Plus Manager Returns Upsell</description>
        <protected>false</protected>
        <recipients>
            <field>UserContact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>matthew.hammond@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Business_Development/Hammond_Shopify_Plus_Response</template>
    </alerts>
    <alerts>
        <fullName>Thank_You_Request_for_Review_QUICKBOOKS_DESKTOP</fullName>
        <description>Thank You: Request for Review QUICKBOOKS DESKTOP</description>
        <protected>false</protected>
        <recipients>
            <field>UserContact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Business_Development/Thank_You_Request_for_Review_QUICKBOOKS_DESKTOP</template>
    </alerts>
    <alerts>
        <fullName>Thank_You_Request_for_Review_QUICKBOOKS_ONLINE</fullName>
        <description>Thank You: Request for Review QUICKBOOKS ONLINE</description>
        <protected>false</protected>
        <recipients>
            <field>UserContact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Business_Development/Thank_You_Request_for_Review_QUICKBOOKS</template>
    </alerts>
    <alerts>
        <fullName>Two_Hour_Opp_in_Submitted_Stage</fullName>
        <ccEmails>aaron.zapf@avalara.com</ccEmails>
        <description>Two Hour Opp in Submitted Stage</description>
        <protected>false</protected>
        <recipients>
            <recipient>amy.mosher@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Opp_Approval_Submitted_2_Hour_Alert</template>
    </alerts>
    <alerts>
        <fullName>VAT_Expert_Sold_Notificatino</fullName>
        <ccEmails>Annick.Van.Sinay@avalara.com</ccEmails>
        <description>VAT Expert Sold Notification</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>EMEA_VAT/VAT_Expert_Sold_Notification</template>
    </alerts>
    <fieldUpdates>
        <fullName>Active_Customer_TRUE</fullName>
        <field>ActiveCustomer__c</field>
        <literalValue>1</literalValue>
        <name>Active Customer = TRUE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Adjust_for_Buy_Down</fullName>
        <field>BookedValue__c</field>
        <formula>BookedValue__c +  Bookings_Buy_Down_Adjustment__c</formula>
        <name>Adjust for Buy Down</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Complete_Stamp</fullName>
        <field>Approval_Complete__c</field>
        <formula>TODAY()</formula>
        <name>Approval Complete Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Required_Update</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Required</literalValue>
        <name>Approval Required Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Start_Stamp</fullName>
        <field>Approval_Start__c</field>
        <formula>TODAY()</formula>
        <name>Approval Start Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Blank_EF_ID</fullName>
        <field>ef_id_original__c</field>
        <name>Blank EF_ID</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CP_No_Show_checked_Date</fullName>
        <field>CP_No_Show_Date__c</field>
        <formula>NOW()</formula>
        <name>CP No Show checked Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CheckECommFTV</fullName>
        <description>Checks the EComm FTV Opp Checkbox</description>
        <field>ECommFTVOPP__c</field>
        <literalValue>1</literalValue>
        <name>Check EComm FTV</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CheckNonStandardContract</fullName>
        <description>Checks the Non-Standard Contract checkbox</description>
        <field>NonStandardContract__c</field>
        <literalValue>1</literalValue>
        <name>CheckNonStandardContract</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CheckOEMFTVOpp</fullName>
        <description>Checks the OEM FTV Opp checkbox.</description>
        <field>OEMFTVOpp__c</field>
        <literalValue>1</literalValue>
        <name>Check OEM FTV Opp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Converted_Sent</fullName>
        <field>Sent_Converted__c</field>
        <literalValue>1</literalValue>
        <name>Check Converted Sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Do_Not_Send_Converted</fullName>
        <field>Do_not_Send_Conversion__c</field>
        <literalValue>1</literalValue>
        <name>Check Do Not Send Converted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Do_Not_Send_Demo</fullName>
        <field>Do_not_send_demo_complete__c</field>
        <literalValue>1</literalValue>
        <name>Check Do Not Send Demo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Do_Not_Send_Engaged</fullName>
        <field>Do_not_send_engaged__c</field>
        <literalValue>1</literalValue>
        <name>Check Do Not Send Engaged</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Do_Not_Send_Proposed</fullName>
        <field>Do_not_send_proposed__c</field>
        <literalValue>1</literalValue>
        <name>Check Do Not Send Proposed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Named_Account_checkbox</fullName>
        <field>CAM_Named_Account__c</field>
        <literalValue>1</literalValue>
        <name>Check Named Account checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Sales_Accepted_checkbox</fullName>
        <field>SalesAccepted__c</field>
        <literalValue>1</literalValue>
        <name>Check Sales Accepted checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Sent_Demo</fullName>
        <field>Sent_Demo_Complete__c</field>
        <literalValue>1</literalValue>
        <name>Check Sent Demo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Sent_Engaged</fullName>
        <field>Sent_Engaged__c</field>
        <literalValue>1</literalValue>
        <name>Check Sent Engaged</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Sent_Proposed</fullName>
        <field>Sent_Proposed__c</field>
        <literalValue>1</literalValue>
        <name>Check Sent Proposed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ClearQualifiedDate</fullName>
        <field>Qualified_On__c</field>
        <name>Clear QualifiedDate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_ADR_Qualified_On_Date_value</fullName>
        <description>Clear ADR Qualified On Date value</description>
        <field>ADR_Qualified_On__c</field>
        <name>Clear ADR Qualified On Date value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Closed_Lost_Closed_Date_Today</fullName>
        <description>If stage is moved to Closed Lost, the close date will be today.</description>
        <field>CloseDate</field>
        <formula>TODAY()</formula>
        <name>Closed Lost - Closed Date Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Connector_Default_Amount_Connector_ASP</fullName>
        <field>Amount</field>
        <formula>Connector__r.X2016_Budget_ASP__c</formula>
        <name>Connector Default Amount Connector ASP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>DE_Do_not_route_update</fullName>
        <field>DE_Do_Not_Route__c</field>
        <literalValue>1</literalValue>
        <name>DE Do not route update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_our_of_SLA_Cleared</fullName>
        <field>Date_out_of_SLA_Shame__c</field>
        <name>Date our of SLA Cleared</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Date_out_of_SLA_Stamp</fullName>
        <field>Date_out_of_SLA_Shame__c</field>
        <formula>Today()</formula>
        <name>Date out of SLA Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Default</fullName>
        <field>CloseDate</field>
        <formula>Today()+60</formula>
        <name>SOHO Default Close Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>DefaultCloseDate90</fullName>
        <field>CloseDate</field>
        <formula>CASE( SubType__c , &quot;QuickBooks&quot;, DATE( 
YEAR(TODAY()), 
MONTH(TODAY()), 
CASE( MONTH(TODAY()), 
1, 31, 
2, IF( MOD( YEAR(TODAY()), 4) = 0, 29, 28), 
3, 31, 
4, 30, 
5, 31, 
6, 30, 
7, 31, 
8, 31, 
9, 30, 
10, 31, 
11, 30, 
12, 31, 
0 
) 
),&quot;PeachTree&quot;,DATE( 
YEAR(TODAY()), 
MONTH(TODAY()), 
CASE( MONTH(TODAY()), 
1, 31, 
2, IF( MOD( YEAR(TODAY()), 4) = 0, 29, 28), 
3, 31, 
4, 30, 
5, 31, 
6, 30, 
7, 31, 
8, 31, 
9, 30, 
10, 31, 
11, 30, 
12, 31, 
0 
) 
),Today()+60)</formula>
        <name>DefaultCloseDate90</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Demo_Completed_Date_Stamp</fullName>
        <description>Marks todays date when Demo completed checkbox is checked.</description>
        <field>Demo_Completed_Date__c</field>
        <formula>TODAY()</formula>
        <name>Demo Completed Date Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Discount_Approved_by_Update</fullName>
        <field>Discount_Approved_By__c</field>
        <formula>$User.LastName</formula>
        <name>Discount Approved by Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Discovery_Date_update</fullName>
        <description>Stamps the Date Stage moved into or past Discovery 
https://jira.avalara.com/browse/IBST-6568 
Owner: Marketing - Susan Norgaard</description>
        <field>Discovery_Date__c</field>
        <formula>NOW()</formula>
        <name>Discovery Date update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EMEA_Account_CAM_Assignment</fullName>
        <description>An EMEA account had an opportunity marked Closed Won so the account has been assigned to the EMEA CAM</description>
        <field>OwnerId</field>
        <lookupValue>michelle.bequette@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>EMEA Account CAM Assignment</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EZTax_Type_Client</fullName>
        <field>EZTax_Type__c</field>
        <literalValue>Client</literalValue>
        <name>EZTax Type = Client</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Final_Approval_Update</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Final Approval Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Flag_CAM_Introduction_email_sent</fullName>
        <field>CAM_Introduction_sent__c</field>
        <literalValue>1</literalValue>
        <name>Flag CAM Introduction email sent</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ForceEZTax</fullName>
        <field>SubType__c</field>
        <literalValue>EZTax</literalValue>
        <name>Force EZTax Subtype</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Force_AddOn</fullName>
        <field>SubType__c</field>
        <literalValue>AddOn</literalValue>
        <name>Force AddOn SubType for AddOn Connector</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Force_AvaTax_SubType</fullName>
        <field>SubType__c</field>
        <literalValue>AvaTax</literalValue>
        <name>Force AvaTax SubType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Force_FreeTrial_SubType</fullName>
        <field>Type</field>
        <literalValue>Free Trial</literalValue>
        <name>Force FreeTrial SubType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Force_SOHO_Account_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>SOHO_Customer_Account</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Force SOHO Account Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Force_SOHO_SubType</fullName>
        <field>SubType__c</field>
        <literalValue>SOHO</literalValue>
        <name>Force SOHO SubType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Force_SubType_Addon</fullName>
        <field>SubType__c</field>
        <literalValue>AddOn</literalValue>
        <name>Force SubType Addon</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Force_SubType_Included</fullName>
        <field>SubType__c</field>
        <literalValue>Included</literalValue>
        <name>Force SubType Included</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Force_Type_Existing</fullName>
        <field>Type</field>
        <literalValue>Existing</literalValue>
        <name>Force Type Existing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Force_Type_New</fullName>
        <field>Type</field>
        <literalValue>New</literalValue>
        <name>Force Type New</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Free_Months_Approved_by_update</fullName>
        <field>Additional_Free_Months_Approved_By__c</field>
        <formula>$User.LastName</formula>
        <name>Free Months Approved by update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Has_Returns</fullName>
        <field>Has_Returns__c</field>
        <formula>1</formula>
        <name>Has Returns</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inbound_Online_Cup_User_TRUE</fullName>
        <field>CUP_User__c</field>
        <literalValue>1</literalValue>
        <name>Inbound Online Cup User = TRUE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Increment_Push_Counter_by_1</fullName>
        <field>Push_Counter__c</field>
        <formula>if(ISNULL( Push_Counter__c ), 1, Push_Counter__c + 1)</formula>
        <name>Increment Push Counter by 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Inside_Sales_Stamp</fullName>
        <field>Created_by_insidesales__c</field>
        <literalValue>1</literalValue>
        <name>Inside Sales Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lock_Booked_Value</fullName>
        <field>Booked_Value_Locked__c</field>
        <literalValue>1</literalValue>
        <name>Lock Booked Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>NS_Contract_approved_by</fullName>
        <field>NS_Contract_Approved_By__c</field>
        <formula>$User.LastName</formula>
        <name>NS Contract approved by</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>National_MSP_DE_do_not_routes_stamp</fullName>
        <description>update the DE do not route checkbox so opp will not route to RSM&apos;s</description>
        <field>DE_Do_Not_Route__c</field>
        <literalValue>1</literalValue>
        <name>National MSP DE do not routes stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>No_Connector_Default_Amount_13k</fullName>
        <field>Amount</field>
        <formula>13000</formula>
        <name>No Connector Default Amount 13k</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opp_Sales_Organization</fullName>
        <field>Sales_Organization__c</field>
        <literalValue>Excise Tax</literalValue>
        <name>Opp Sales Organization</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opp_Sales_Organization_CertCapture</fullName>
        <field>Sales_Organization__c</field>
        <literalValue>CertCapture</literalValue>
        <name>Opp Sales Organization - CertCapture</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opp_Stage_Change_Date_Today</fullName>
        <field>Stage_Change_Date__c</field>
        <formula>Today()</formula>
        <name>Opp Stage Change Date Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opp_Subtype_Update_to_Downgrade</fullName>
        <field>SubType__c</field>
        <literalValue>Downgrade</literalValue>
        <name>Opp Subtype Update to Downgrade</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opp_Subtype_to_BizDevLaunch</fullName>
        <description>Changes the subtype of an opp when it gets distirbuted from DE to Launch team</description>
        <field>SubType__c</field>
        <literalValue>BizDevLaunch</literalValue>
        <name>Opp Subtype to BizDevLaunch</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunitiy_Qualified_by_Role_Stamp</fullName>
        <field>Qualified_by_Role__c</field>
        <formula>Qualified_By__r.UserRole.Name</formula>
        <name>Opportunitiy Qualified by Role Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_MRS_Cancellation_Date_Stamp</fullName>
        <description>Marks todays date on the opportunities MRS Cancellation date when the checkbox is checked.</description>
        <field>MRS_Cancelled_Date__c</field>
        <formula>TODAY()</formula>
        <name>Opportunity MRS Cancellation Date Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Owner_Manager_at_Booking</fullName>
        <description>Updates the Manager at Booking field when the booking date is completed</description>
        <field>Manager_at_Booking__c</field>
        <formula>Owner_Manager__c</formula>
        <name>Opportunity Owner Manager at Booking</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Original_Offer_Stamp</fullName>
        <description>ITBSE-706
Kim Gordon</description>
        <field>Original_Offer__c</field>
        <formula>Text( Offer__c )</formula>
        <name>Original Offer Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Type_on_Conversion</fullName>
        <description>Populate Type to New on conversion (if the Lead that is being converted has &apos;Opportunity Type = New&apos;)</description>
        <field>Type</field>
        <literalValue>New</literalValue>
        <name>Populate Type on Conversion</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Type_on_Conversion_2</fullName>
        <description>Populate Type to Existing on conversion (if the Lead that is being converted has &apos;Opportunity Type = Existing&apos;)</description>
        <field>Type</field>
        <literalValue>Existing</literalValue>
        <name>Populate Type on Conversion 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_Type_on_Conversion_3</fullName>
        <description>Populate Type to Partner on conversion (if the Lead that is being converted has &apos;Opportunity Type = Partner&apos;)</description>
        <field>Type</field>
        <literalValue>Partner</literalValue>
        <name>Populate Type on Conversion 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Proof_of_Concept_Date_update</fullName>
        <description>Stamps the Date Stage moved into or past Proof of Concept
https://jira.avalara.com/browse/IBST-6568 
Owner: Marketing - Susan Norgaard</description>
        <field>Proof_of_Concept_Date__c</field>
        <formula>NOW()</formula>
        <name>Proof of Concept Date update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>RSM_Region_Stamp_Great_Lakes</fullName>
        <field>RSM_Region__c</field>
        <formula>&quot;Great Lakes&quot;</formula>
        <name>RSM Region Stamp - Great Lakes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>RSM_Region_Stamp_North_Central</fullName>
        <field>RSM_Region__c</field>
        <formula>&quot;North Central&quot;</formula>
        <name>RSM Region Stamp - North Central</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>RSM_Region_Stamp_Northeast</fullName>
        <field>RSM_Region__c</field>
        <formula>&quot;Northeast&quot;</formula>
        <name>RSM Region Stamp - Northeast</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>RSM_Region_Stamp_South_Central</fullName>
        <field>RSM_Region__c</field>
        <formula>&quot;South Central&quot;</formula>
        <name>RSM Region Stamp - South Central</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Remove_Upside</fullName>
        <field>Forecast_Status__c</field>
        <literalValue>Forecast</literalValue>
        <name>Remove Upside</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Request_Submitted</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Submitted</literalValue>
        <name>Request Submitted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Approval_Start</fullName>
        <field>Approval_Start__c</field>
        <name>Reset Approval Start</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_to_Approved</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>Reset to Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_to_required</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Required</literalValue>
        <name>Reset to required</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>STAMP_ARR_PROS</fullName>
        <field>ARR__c</field>
        <formula>PROS_ARR__c</formula>
        <name>STAMP ARR PROS</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sales_Qualification_Date_Update</fullName>
        <description>https://jira.avalara.com/browse/IBST-6176
https://jira.avalara.com/browse/IBST-6568</description>
        <field>Sales_Qualification_Date__c</field>
        <formula>NOW()</formula>
        <name>Sales Qualification Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Sales_Working_Date</fullName>
        <description>https://jira.avalara.com/browse/IBST-6176</description>
        <field>Sales_Working_Date__c</field>
        <formula>NOW()</formula>
        <name>Sales Working Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetFreeMonthsTo1</fullName>
        <description>Sets Free Months to 1</description>
        <field>FreeMonths__c</field>
        <literalValue>1</literalValue>
        <name>SetFreeMonthsTo1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetFreeMonthsto0</fullName>
        <description>Sets Free Months to 0</description>
        <field>FreeMonths__c</field>
        <literalValue>0</literalValue>
        <name>Set Free Months to 0</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetInitialTermTo13</fullName>
        <description>Sets Initial Term to 13</description>
        <field>InitialContractTerm__c</field>
        <formula>13</formula>
        <name>SetInitialTermTo13</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetInitialTermto0</fullName>
        <description>Sets Initial Term to 0</description>
        <field>InitialContractTerm__c</field>
        <formula>0</formula>
        <name>Set Initial Term to 0</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetInitialTermto12</fullName>
        <description>Sets Initial Term to 12</description>
        <field>InitialContractTerm__c</field>
        <formula>12</formula>
        <name>Set Initial Term to 12</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetQualifiedOnTimestamp</fullName>
        <field>Qualified_On__c</field>
        <formula>NOW()</formula>
        <name>Set Qualified On Timestamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Free_Months_to_0</fullName>
        <description>Sets the Free Months Field to Equal 0</description>
        <field>FreeMonths__c</field>
        <literalValue>0</literalValue>
        <name>Set Free Months to 0</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stage_History_Updater</fullName>
        <description>Update: https://jira.avalara.com/browse/IBST-9292</description>
        <field>Stage_History__c</field>
        <formula>IF( ISNEW() , 
CASE(StageName, &quot;Sales Qualification&quot;, &quot;Marketing Qualified, Sales Qualification&quot;, 
&quot;Sales Working&quot;, &quot;Marketing Qualified, Sales Qualification, Sales Working&quot;, 
&quot;Discovery&quot;, &quot;Marketing Qualified, Sales Qualification, Sales Working, Discovery&quot;, 
&quot;Proof of Concept&quot;, &quot;Marketing Qualified, Sales Qualification, Sales Working, Discovery, Proof of Concept&quot;, 
&quot;Proposal&quot;, &quot;Marketing Qualified, Sales Qualification, Sales Working, Discovery, Proof of Concept, Proposal&quot;, 
&quot;Verbally Committed&quot;, &quot;Marketing Qualified, Sales Qualification, Sales Working, Discovery, Proof of Concept, Proposal, Verbally Committed&quot;, 
&quot;Closed Won&quot;, &quot;Marketing Qualified, Sales Qualification, Sales Working, Discovery, Proof of Concept, Proposal, Verbally Committed, Closed Won&quot;, 
&quot;Closed Lost&quot;, (LEFT(PRIORVALUE(Stage_History__c) &amp; &quot;, Closed Lost&quot;, 255)), 
&quot;Marketing Qualified&quot;), 
IF( 
AND( 
CONTAINS(TEXT(StageName), &quot;Sales Qualification&quot;), 
NOT(CONTAINS(Stage_History__c, &quot;Sales Qualification&quot;)) 
), &quot;Marketing Qualified, Sales Qualification&quot;, 
IF( 
AND( 
CONTAINS(TEXT(StageName), &quot;Sales Working&quot;), 
NOT(CONTAINS(Stage_History__c, &quot;Sales Working&quot;)) 
), &quot;Marketing Qualified, Sales Qualification, Sales Working&quot;, 
IF( 
AND( 
CONTAINS(TEXT(StageName), &quot;Discovery&quot;), 
NOT(CONTAINS(Stage_History__c, &quot;Discovery&quot;)) 
), &quot;Marketing Qualified, Sales Qualification, Sales Working, Discovery&quot;, 
IF( 
AND( 
CONTAINS(TEXT(StageName), &quot;Proof of Concept&quot;), 
NOT(CONTAINS(Stage_History__c, &quot;Proof of Concept&quot;)) 
), &quot;Marketing Qualified, Sales Qualification, Sales Working, Discovery, Proof of Concept&quot;, 
IF( 
AND( 
CONTAINS(TEXT(StageName), &quot;Proposal&quot;), 
NOT(CONTAINS(Stage_History__c, &quot;Proposal&quot;)) 
), &quot;Marketing Qualified, Sales Qualification, Sales Working, Discovery, Proof of Concept, Proposal&quot;, 
IF( 
AND( 
CONTAINS(TEXT(StageName), &quot;Verbally Committed&quot;), 
NOT(CONTAINS(Stage_History__c, &quot;Verbally Committed&quot;)) 
), &quot;Marketing Qualified, Sales Qualification, Sales Working, Discovery, Proof of Concept, Proposal, Verbally Committed&quot;, 
IF( 
AND( 
CONTAINS(TEXT(StageName), &quot;Closed Won&quot;), 
NOT(CONTAINS(Stage_History__c,&quot;Closed Won&quot;)) 
), &quot;Marketing Qualified, Sales Qualification, Sales Working, Discovery, Proof of Concept, Proposal, Verbally Committed, Closed Won&quot;, 
IF( 
AND( 
CONTAINS(TEXT(StageName), &quot;Closed Lost&quot;), 
NOT(CONTAINS(Stage_History__c,&quot;Closed Lost&quot;)) 
), (LEFT(PRIORVALUE(Stage_History__c) &amp; &quot;, Closed Lost&quot;, 255)), 
PRIORVALUE(Stage_History__c))))))))))</formula>
        <name>Stage History Updater</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_20_Service</fullName>
        <field>Contains_20_Service_Item_Discount__c</field>
        <literalValue>1</literalValue>
        <name>Stamp 20% Service</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_50_Activation</fullName>
        <field>Contains_50_Activation_Item_Discount__c</field>
        <literalValue>1</literalValue>
        <name>Stamp 50% Activation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_50_Support</fullName>
        <field>Contains_50_Support_Item_Discount__c</field>
        <literalValue>1</literalValue>
        <name>Stamp 50% Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_ADR_Qualified_On_Date_with_NOW</fullName>
        <description>Update ADR_Qualified_On__c with current date-time</description>
        <field>ADR_Qualified_On__c</field>
        <formula>NOW()</formula>
        <name>Stamp ADR Qualified On Date with NOW</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Active_Customer_TRUE</fullName>
        <field>ActiveCustomer__c</field>
        <literalValue>1</literalValue>
        <name>Stamp Active Customer TRUE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Booked_Date</fullName>
        <field>Booked_Date__c</field>
        <formula>CloseDate</formula>
        <name>Stamp Booked Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Booked_Manually_Calculated_Date</fullName>
        <field>BookedManuallyCalculatedDate__c</field>
        <formula>TODAY()</formula>
        <name>Stamp Booked Manually Calculated Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Booked_Value</fullName>
        <field>BookedValue__c</field>
        <formula>Amount</formula>
        <name>Stamp Booked Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Booked_Value_From_Excise_Year_1</fullName>
        <field>BookedValue__c</field>
        <formula>Year_1_Booking2__c</formula>
        <name>Stamp Booked Value From Excise Year 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_CARR_Override</fullName>
        <field>CARR_Override__c</field>
        <formula>PROS_ARR__c</formula>
        <name>Stamp CARR Override</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_First_Purchase_Date_on_Account</fullName>
        <field>First_Purchase_Date__c</field>
        <formula>Booked_Date__c</formula>
        <name>Stamp First Purchase Date on Account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_PS_Override_Perpetual</fullName>
        <field>PS__c</field>
        <formula>PS_Override_Summary__c</formula>
        <name>Stamp PS Override Perpetual</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Re_Qualified_By_Role</fullName>
        <field>Re_Qualified_Role__c</field>
        <formula>ADR_Qualified_By__r.RoleName__c</formula>
        <name>Stamp Re-Qualified By Role</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_SubType_BizDev</fullName>
        <field>SubType__c</field>
        <literalValue>BizDev</literalValue>
        <name>Stamp SubType BizDev</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_ZtBuy_First_Purchase_Date</fullName>
        <field>First_Purchase_Date__c</field>
        <formula>TODAY()</formula>
        <name>Stamp ZtBuy First Purchase Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>AccountId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_engagment</fullName>
        <field>Engagement_Stamp__c</field>
        <formula>now()</formula>
        <name>Stamp engagment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Amount_With_Booked_Value</fullName>
        <field>Amount</field>
        <formula>BookedValue__c</formula>
        <name>Update Amount With Booked Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_EOM_Stamp</fullName>
        <field>EOM_Stamp__c</field>
        <formula>DATE(
YEAR( CloseDate),
MONTH(CloseDate),
CASE( MONTH(CloseDate),
1, 31,
2, IF( MOD( YEAR(CloseDate), 4) = 0, 29, 28),
3, 31,
4, 30,
5, 31,
6, 30,
7, 31,
8, 31,
9, 30,
10, 31,
11, 30,
12, 31,
0
)
)</formula>
        <name>Update EOM Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Ecomm_Lead_Source</fullName>
        <field>LeadSource</field>
        <literalValue>Marketing</literalValue>
        <name>Update Ecomm Lead Source</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Forecast_Status_to_In</fullName>
        <field>Forecast_Status__c</field>
        <literalValue>In</literalValue>
        <name>Update Forecast Status to In</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Forecast_Status_to_Push</fullName>
        <field>Forecast_Status__c</field>
        <literalValue>Push</literalValue>
        <name>Update Forecast Status to Push</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Initial_Term</fullName>
        <description>Updates Initial Term when the Included Free Months is edited (as long as the initial term is intended to be less than a year).</description>
        <field>InitialContractTerm__c</field>
        <formula>IF( InitialContractTerm__c + VALUE(TEXT( FreeMonths__c )) &gt; 11, 12 + VALUE(TEXT( FreeMonths__c )), InitialContractTerm__c)</formula>
        <name>Update Initial Term</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_NS_Cotnract_True</fullName>
        <field>NonStandardContract__c</field>
        <literalValue>1</literalValue>
        <name>Update NS Cotnract True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Name</fullName>
        <field>Name</field>
        <formula>Name &amp;&quot;-&quot; &amp; &quot; ID &quot; &amp; &quot;-&quot; &amp; CaseSafeID__c</formula>
        <name>Update Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Proposal_Date</fullName>
        <description>Stamps the Date Stage moved into or past Proposal
https://jira.avalara.com/browse/IBST-6568 
Owner: Marketing - Susan Norgaard</description>
        <field>Proposal_Date__c</field>
        <formula>NOW()</formula>
        <name>Update Proposal Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Push_Stamp</fullName>
        <field>Push_Stamp__c</field>
        <formula>Today()</formula>
        <name>Update Push Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_SE_Close_Stamp</fullName>
        <field>SE_Close_Stamp__c</field>
        <formula>CloseDate</formula>
        <name>Update SE Close Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Stage_to_Closed_Won</fullName>
        <field>StageName</field>
        <literalValue>Closed Won</literalValue>
        <name>Update Stage to Closed Won</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Upside</fullName>
        <field>Forecast_Status__c</field>
        <literalValue>Upside</literalValue>
        <name>Upside</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Verbally_Committed_Date</fullName>
        <description>Stamps the Date Stage moved into or past Verbally Committed
https://jira.avalara.com/browse/IBST-6568 
Owner: Marketing - Susan Norgaard</description>
        <field>Verbally_Committed_Date__c</field>
        <formula>NOW()</formula>
        <name>Verbally Committed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>WhaleCheck</fullName>
        <description>Puts a check in the Whale checkbox if the Number of Annual Transactions picklist is set to &apos;Above 1,500,000&apos;</description>
        <field>Whale__c</field>
        <literalValue>1</literalValue>
        <name>WhaleCheck</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <flowActions>
        <fullName>CPN_SAM_Stamp_and_Email_Alert</fullName>
        <flow>CPN_SAM_Stamp_and_Email_Alert</flow>
        <flowInputs>
            <name>varAccountID</name>
            <value>{!PartnerName__c}</value>
        </flowInputs>
        <flowInputs>
            <name>varOppID</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>CPN SAM Stamp and Email Alert</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>Launch_Opp_owner_assignement</fullName>
        <flow>Launch_connector_BD_Owner_Opp_Assignment</flow>
        <flowInputs>
            <name>varConnectorID</name>
            <value>{!Connector__c}</value>
        </flowInputs>
        <flowInputs>
            <name>varOppID</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>Launch Opp owner assignement</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>Opp_Owner_Assignment_to_Channel_partner_reselling_connector_rep</fullName>
        <flow>Reselling_Connector_Opportunity_Assignment</flow>
        <flowInputs>
            <name>varAccountID</name>
            <value>{!PartnerName__c}</value>
        </flowInputs>
        <flowInputs>
            <name>varConnector</name>
            <value>{!Connector_ID__c}</value>
        </flowInputs>
        <flowInputs>
            <name>varOpportunityID</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>Opp Owner Assignment to Channel partner reselling connector rep</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>Reassign_Open_Tasks_to_new_Opp_Owner</fullName>
        <flow>Reassign_Open_Tasks_to_new_Opp_Owner</flow>
        <flowInputs>
            <name>OppID</name>
            <value>{!Id}</value>
        </flowInputs>
        <flowInputs>
            <name>OppOwnerID</name>
            <value>{!OwnerId}</value>
        </flowInputs>
        <label>Reassign Open Tasks to new Opp Owner</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>Shame_Queue_creator</fullName>
        <flow>Shame_queue_routing</flow>
        <flowInputs>
            <name>varOppid</name>
            <value>{!Id}</value>
        </flowInputs>
        <flowInputs>
            <name>varPrevManager</name>
            <value>{!Owner.ManagerId}</value>
        </flowInputs>
        <flowInputs>
            <name>varPrevOwnerID</name>
            <value>{!OwnerId}</value>
        </flowInputs>
        <flowInputs>
            <name>varpreviousstage</name>
            <value>{!StageName}</value>
        </flowInputs>
        <label>Shame Queue creator</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>Stamp_ACP_Firm_Size_on_Opp</fullName>
        <flow>Stamp_ACP_Firm_Size_on_Opp</flow>
        <flowInputs>
            <name>OppID</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>Stamp ACP Firm Size on Opp</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>Stamp_Sales_Team_on_Opp</fullName>
        <flow>Stamp_Sales_Team_on_Opp</flow>
        <flowInputs>
            <name>OppID</name>
            <value>{!Id}</value>
        </flowInputs>
        <flowInputs>
            <name>OwnerID</name>
            <value>{!OwnerId}</value>
        </flowInputs>
        <label>Stamp Sales Team on Opp</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <outboundMessages>
        <fullName>InsideSales_New_Qual_Opps_Created</fullName>
        <apiVersion>32.0</apiVersion>
        <description>Used for InsideSales gamification to track newly created qualified ops</description>
        <endpointUrl>https://powerstandings.insidesales.com/kpi/qualopp</endpointUrl>
        <fields>Id</fields>
        <fields>Qualified_By__c</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>mary.jensen@avalara.com</integrationUser>
        <name>InsideSales - New Qual Opps Created</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Inside_Sales_Closed_Won</fullName>
        <apiVersion>32.0</apiVersion>
        <endpointUrl>https://powerstandings.insidesales.com/kpi/oppwon</endpointUrl>
        <fields>Id</fields>
        <fields>Qualified_By__c</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>mary.jensen@avalara.com</integrationUser>
        <name>Inside Sales Closed Won</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>iv__InsideView_Opportunity_Outbound_Message</fullName>
        <apiVersion>43.0</apiVersion>
        <description>This is used for notifying InsideView Refresh for opportunities.</description>
        <endpointUrl>https://integrations.insideview.com/integrations-notifications/salesforce/opportunity?authType=IV_SALESFORCE_CANVAS</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>kory.leavitt@avalara.com</integrationUser>
        <name>InsideView Opportunity Outbound Message</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>Addon Force</fullName>
        <actions>
            <name>Force_AddOn</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
NOT(ISBLANK(PROS_Order_Quote__c )), 
TEXT( SubType__c) = &quot;Upgrade&quot;, 
Order_BB_to_PP__c = FALSE , 
 PROS_Order_Quote__r.Connector_Amendment__c = TRUE,
Contains_Drops__c = 0
)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Alert Global Team of Global Opp</fullName>
        <actions>
            <name>Notify_Global_Sales_Team_of_Global_Opportunity</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND( Global_Opportunity__c = TRUE, $User.Validation_Exempt__c = FALSE)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Alert Jenny Gardner and Bob Petteys of DTS Opp</fullName>
        <actions>
            <name>Alert_DTS_opportunity</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.DTS_Required__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <description>Purpose: Alert Jenny Gardner and Bob Petteys for DTS Opps
Integrated: No
Change: Level 0
Custodian: Compliance / Liz Armbreuster</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Audit - SubType Field</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.SubType__c</field>
            <operation>notEqual</operation>
            <value>APac,India,Included,EMEA,Brazil,AvaTax,QBD,BizDev,CertCapture,Communications,MatrixMaster,MyLodge,TrustFile,TrustFile Bharat,SOHO,Excise,EMEA Amazon,EMEA Enterprise,EMEA MRS,EMEA VAT Expert,BizDevLaunch,BizDev-Emerging</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Automated Opportunity Name</fullName>
        <actions>
            <name>Update_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CreatedDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Brazil Update Booked Date and Value</fullName>
        <actions>
            <name>Stamp_Booked_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Booked_Value</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.SubType__c</field>
            <operation>equals</operation>
            <value>Brazil</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>greaterThan</operation>
            <value>USD 0</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CAM Ding</fullName>
        <actions>
            <name>Send_CAM_Ding</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>greaterThan</operation>
            <value>USD 0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>Existing</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.SubType__c</field>
            <operation>notEqual</operation>
            <value>Downgrade</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Role_Name__c</field>
            <operation>contains</operation>
            <value>CAM,CAM:</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.ProfileId</field>
            <operation>notEqual</operation>
            <value>Ava2 Sales Operations</value>
        </criteriaItems>
        <description>Purpose: CAM ding alert distribution email for amount &gt; $0 and not a downgrade
Integrated: No 
Change: Level 0 
Custodian: Loyalty</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Canadian Opps - Great Lakes</fullName>
        <actions>
            <name>RSM_Region_Stamp_Great_Lakes</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.AccountBillingState__c</field>
            <operation>equals</operation>
            <value>ON,Ontario,QC,Quebec,PE,Prince Edward Island</value>
        </criteriaItems>
        <description>Stamps Great Lakes to RSM region if Canadian Provice is ON,QC,PE</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Canadian Opps - North Central</fullName>
        <actions>
            <name>RSM_Region_Stamp_North_Central</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.AccountBillingState__c</field>
            <operation>equals</operation>
            <value>YT,Yukon,NU,Nunavut,NT,Northwest Territories,AB,Alberta,BC,British Columbia,MB,Manitoba,SK,Saskatchewan</value>
        </criteriaItems>
        <description>Stamps Great Lakes to RSM region if Canadian Provice is AB,BC,MB,SK</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Channel Partner Email Alerts</fullName>
        <actions>
            <name>Asher_Alert_Channel_Partner_Name_Changed</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>CPN_SAM_Stamp_and_Email_Alert</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <description>Static Email Alert to Asher on New and Change CPN on Opp
Dynamic Email Alert to MSP SAM on team Kantelis</description>
        <formula>AND(

ISPICKVAL(Type, &quot;New&quot;), 
OR(
AND(
NOT(ISBLANK(PartnerName__c)),
ISNEW()),
ISCHANGED(PartnerName__c)
))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Clear ADR Qualified On Date</fullName>
        <actions>
            <name>Clear_ADR_Qualified_On_Date_value</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.ADR_Qualified_By__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.ADR_Qualified_On__c</field>
            <operation>greaterThan</operation>
            <value>1/1/2008</value>
        </criteriaItems>
        <description>Clear ADR_Qualified_On__c when ADR_Qualified_By__c is cleared</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Clear Qualified Date</fullName>
        <actions>
            <name>ClearQualifiedDate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Qualified_By__c</field>
            <operation>equals</operation>
            <value></value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Qualified_On__c</field>
            <operation>greaterThan</operation>
            <value>1/1/2008</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Closed Lost - Stamp Closed Date</fullName>
        <actions>
            <name>Closed_Lost_Closed_Date_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>IF an Opportunity is marked closed , the Closed  Date will be stamped with today.</description>
        <formula>AND(ISCHANGED(  IsClosed ), IsClosed = True)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Closed Lost Reason SOHO SubType</fullName>
        <actions>
            <name>Force_SOHO_SubType</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Primary_Connector_Platform_Level__c</field>
            <operation>equals</operation>
            <value>Level 1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.ClosedLostReason__c</field>
            <operation>equals</operation>
            <value>Online Redirect</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.SubType__c</field>
            <operation>equals</operation>
            <value>AvaTax</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Connector change notification</fullName>
        <actions>
            <name>Connector_Opportunity_Changed</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(  Connector__c  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Default AvaTax Opp Amount Connector</fullName>
        <actions>
            <name>Connector_Default_Amount_Connector_ASP</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Connector_Name__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>2010 Default Opportunity Rec Type,2010 Default Opportunity Rec Type w/ Zuora,AvaTax Business Development,2010 Default Opportunity Rec Type,SOHO</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Probability</field>
            <operation>lessThan</operation>
            <value>30</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>equals</operation>
            <value>USD 0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.SubType__c</field>
            <operation>notEqual</operation>
            <value>SOHO,TrustFile</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Default AvaTax Opp Amount No Connector</fullName>
        <actions>
            <name>No_Connector_Default_Amount_13k</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Connector_Name__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>2010 Default Opportunity Rec Type</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Demo Completed Date Stamp</fullName>
        <actions>
            <name>Demo_Completed_Date_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Demo_Completed__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Stamps the today&apos;s date on the Demo completed date when the Demo Complete check box is checked on an opportunity.
Sales Ops: Amy Mosher</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EF_ID Override Fix</fullName>
        <actions>
            <name>Blank_EF_ID</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.ef_id_original__c</field>
            <operation>equals</operation>
            <value>00N0b0000032qEp=</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EMEA CAM Account Assignment</fullName>
        <actions>
            <name>EMEA_Account_CAM_Assignment</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>New_EMEA_Account</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 or 3)  AND 2 and 4 and 5 and 6 and 7 and 8</booleanFilter>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>EMEA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.SubType__c</field>
            <operation>equals</operation>
            <value>EMEA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.ActivePartner__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Products_of_Interest__c</field>
            <operation>notEqual</operation>
            <value>Amazon Bridge</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>notEqual</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Name__c</field>
            <operation>notContain</operation>
            <value>Michelle Bequette</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Name__c</field>
            <operation>notContain</operation>
            <value>Emil Jackiewicz</value>
        </criteriaItems>
        <description>When and EMEA opportunity is closed Won, the account will be assigned to EMEA CAM - Currently Michelle 9.6.16</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email Alert%3A Request for Review QUICKBOOKS DESKTOP</fullName>
        <actions>
            <name>Thank_You_Request_for_Review_QUICKBOOKS_DESKTOP</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Connector_Name__c</field>
            <operation>equals</operation>
            <value>Quickbooks Desktop</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>notEqual</operation>
            <value>Existing,Free Trial</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.User_Contact_First_Name__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/IBST-12942</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email Alert%3A Request for Review QUICKBOOKS ONLINE</fullName>
        <actions>
            <name>Thank_You_Request_for_Review_QUICKBOOKS_ONLINE</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Connector_Name__c</field>
            <operation>equals</operation>
            <value>Quickbooks Online</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>notEqual</operation>
            <value>Existing,Free Trial</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.User_Contact_First_Name__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/IBST-12942</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Engagement Stamp</fullName>
        <actions>
            <name>Stamp_engagment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Attempting to Engage</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Engagement_Stamp__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Force CUP Online Buy</fullName>
        <actions>
            <name>Inbound_Online_Cup_User_TRUE</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR (2 AND 3)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Name</field>
            <operation>contains</operation>
            <value>cloud craze</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CreatedById</field>
            <operation>equals</operation>
            <value>ZTBuy API</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.SubType__c</field>
            <operation>equals</operation>
            <value>SOHO</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Force EZTax Subtype</fullName>
        <actions>
            <name>ForceEZTax</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>EZTax</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Force FreeTrial SubType</fullName>
        <actions>
            <name>Force_FreeTrial_SubType</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Connector_Name__c</field>
            <operation>equals</operation>
            <value>API</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CreatedById</field>
            <operation>equals</operation>
            <value>ZTBuy API</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>notEqual</operation>
            <value>Free Trial</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>GoLive Opportunity Questions Escalation</fullName>
        <actions>
            <name>Send_Go_Live_Opp_Results</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>(RScore_Busperstate__c + RScore_Returnsperyear__c) &gt;= 1</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Inside Sales Stamp</fullName>
        <actions>
            <name>Inside_Sales_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.UserRoleId</field>
            <operation>contains</operation>
            <value>SDR,inside</value>
        </criteriaItems>
        <description>Updated role criteria from &quot;inside sales&quot; to &quot;SDR&quot; with role change.

https://jira.avalara.com/browse/IBST-5888</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Launch Opp Distribution update Subtype</fullName>
        <actions>
            <name>Opp_Subtype_to_BizDevLaunch</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED( OwnerId ), PRIORVALUE(OwnerId )=&quot;00533000003hat0&quot;, OR ( Connector_Vibrancy__c =  &quot;Launch&quot;,Connector_Vibrancy__c = &quot;Dormant&quot; , Connector_Vibrancy__c = &quot;Retired&quot;  ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Launch Opp auto assigned to BD owner from connector</fullName>
        <actions>
            <name>Launch_Opp_owner_assignement</name>
            <type>FlowAction</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Connector_Vibrancy__c</field>
            <operation>contains</operation>
            <value>Launch,Dormant,Retired</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Name__c</field>
            <operation>equals</operation>
            <value>Distribution User</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Level 1 Force SOHO SubType</fullName>
        <actions>
            <name>Force_SOHO_SubType</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Inbound_Online_Cup_User_TRUE</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(OR(TEXT(Type) = &quot;New&quot;, TEXT(Type) = &quot;Free Trial&quot;), TEXT(Connector__r.Platform_Cateogry__c) = &quot;Level 1&quot;, NOT(ISBLANK( Connector__c )), Connector_Name__c &lt;&gt; &quot;TrustFile Online&quot;, ISBLANK(  Booked_Date__c ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MRS Cancellation Date Stamp</fullName>
        <actions>
            <name>Opportunity_MRS_Cancellation_Date_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.SubType__c</field>
            <operation>equals</operation>
            <value>EMEA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.MRS_Cancelled__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Todays date is stamped with the MRS Cancellation Checkbox is checked. This lives on the opportunity record as MRS opps do not have related subscription records.
EMEA: David Van Toor/Andrew Bannister</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Maintain Active Customer on Non Zuora BUs</fullName>
        <actions>
            <name>Stamp_Active_Customer_TRUE</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_CARR_Override</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_First_Purchase_Date_on_Account</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.SubType__c</field>
            <operation>equals</operation>
            <value>Brazil,Communications,EMEA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Booked_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>For Opportunities that don&apos;t flow through Zuora (EMEA, Comm, Brazil), stamp Active Customer = true when booked date is populated on the Opp</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Maintain Booked Value %2F Amount for New</fullName>
        <actions>
            <name>Update_Amount_With_Booked_Value</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(TEXT( Type) = &quot;New&quot;,ISCHANGED( BookedValue__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Maintain Excise Booked Value</fullName>
        <actions>
            <name>Stamp_Booked_Value_From_Excise_Year_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Year_1_Booking2__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Manager at Closing stamp</fullName>
        <actions>
            <name>Opportunity_Owner_Manager_at_Booking</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamps the current opportunity owner manager at the time of booking to preserve value for reporting and historic allocation</description>
        <formula>AND( ISCHANGED( IsClosed ),IsClosed = True,Id&lt;&gt;&quot;0063300000ii6Gu&quot;,Id&lt;&gt;&quot;0064000000X9sx5&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>NON Level 1 Force AvaTax SubType</fullName>
        <actions>
            <name>Force_AvaTax_SubType</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update: https://jira.avalara.com/browse/IBST-12791</description>
        <formula>AND( 
TEXT(SubType__c)&lt;&gt;&quot;BizDev&quot;,
TEXT(SubType__c)&lt;&gt;&quot;BizDev-Emerging&quot;,
TEXT(SubType__c)&lt;&gt;&quot;BizDevLaunch&quot;,
TEXT(SubType__c)&lt;&gt;&quot;Included&quot;, 
TEXT(SubType__c)&lt;&gt;&quot;EMEA&quot;, 
TEXT(SubType__c)&lt;&gt;&quot;Brazil&quot;, 
TEXT(SubType__c)&lt;&gt;&quot;QBD&quot;, 
TEXT(SubType__c)&lt;&gt;&quot;SOHO&quot;, 
TEXT(SubType__c)&lt;&gt;&quot;Communications&quot;, 
TEXT(SubType__c)&lt;&gt;&quot;MyLodge&quot;, 
TEXT(SubType__c)&lt;&gt;&quot;TrustFile&quot;, 
TEXT(SubType__c)&lt;&gt;&quot;Excise&quot;, 
TEXT(SubType__c)&lt;&gt;&quot;CertCapture&quot;, 
TEXT(Type) = &quot;New&quot;, 
TEXT(Connector__r.Platform_Cateogry__c) &lt;&gt; &quot;Level 1&quot;, NOT(ISBLANK( Connector__c )),  
ISBLANK(  Booked_Date__c ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>National MSP Do Not Route</fullName>
        <actions>
            <name>National_MSP_DE_do_not_routes_stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.SubType__c</field>
            <operation>equals</operation>
            <value>AvaTax</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Partner_Category__c</field>
            <operation>equals</operation>
            <value>Marketing &amp; Sales Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Partner_Territory__c</field>
            <operation>equals</operation>
            <value>National MSP,National MSP - Premier</value>
        </criteriaItems>
        <description>Stamp opps that are National MSP with DE Do not route so they do not go through the Distribution engine to reps. Will be assigned manually by Managers
Owner: Matt K. and Kim Gordon IBST-1635</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>New Opp Distribution Assigned from Matt H%2E</fullName>
        <actions>
            <name>NEW_Soho_Opp_Distribution</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED( OwnerId ), PRIORVALUE(OwnerId )=&quot;00540000003Cjae&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>New Opp Distribution from Distribution User</fullName>
        <actions>
            <name>New_opportunity_assignment_form_Distribution_User</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED( OwnerId ), PRIORVALUE(OwnerId )=&quot;00533000003hat0&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>New Opp Distribution from Distribution User Jordans team</fullName>
        <actions>
            <name>Jordan_s_notification_of_opp</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED( OwnerId ), PRIORVALUE(OwnerId )=&quot;00533000003hat0&quot;,     CONTAINS(Owner_Manager__c, &quot;Lang&quot;) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Notify CUT Sales Team of CUT Opp</fullName>
        <actions>
            <name>Notify_CUT_Sales_Team_of_CUT_Opp</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND( CUTOpportunity__c = TRUE, $User.Validation_Exempt__c = FALSE)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opp Assignment from Channel Partner Reselling Connector</fullName>
        <actions>
            <name>Opp_Owner_Assignment_to_Channel_partner_reselling_connector_rep</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Connector_ID__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PartnerNumber__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Name__c</field>
            <operation>contains</operation>
            <value>Distribution</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Channel_Partner_Category__c</field>
            <operation>contains</operation>
            <value>Marketing</value>
        </criteriaItems>
        <description>Opportunity is auto assigned if Channel Partner has a reselling partner assigned rep on the connector associated with the Opp</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opp Sales Organization - CertCapture</fullName>
        <actions>
            <name>Opp_Sales_Organization_CertCapture</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>RecordTypeId = &quot;01240000000UbuO&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opp Sales Organization - Excise Tax</fullName>
        <actions>
            <name>Opp_Sales_Organization</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>RecordTypeId = &quot;01240000000UbsN&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity CP NO show date stamp</fullName>
        <actions>
            <name>CP_No_Show_checked_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamps the date of an opp that is marked cp no show</description>
        <formula>No_Show_CP__c = TRUE</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Qualified by Role Stamp</fullName>
        <actions>
            <name>Opportunitiy_Qualified_by_Role_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamps the current role of the qualifying rep onto the opp.</description>
        <formula>OR( ISNEW(), AND( OR( ISCHANGED(Qualified_By__c), ISblank(PRIORVALUE( Qualified_By__c ))) ,NOT(isblank( Qualified_By__c))))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Opportunity Zero Amount Fix</fullName>
        <actions>
            <name>Opp_Subtype_Update_to_Downgrade</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>https://jira.avalara.com/browse/SFCOM-8791</description>
        <formula>AND(  Amount &lt; 0, Text(SubType__c) = &quot;Upgrade&quot;,  (OR(  ISNEW() , ISCHANGED(Amount), (AND( ISCHANGED(Opp_Function_Utility__c), Opp_Function_Utility__c = &quot;fixzero&quot; ) ) ) ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Original Offer Stamp</fullName>
        <actions>
            <name>Original_Offer_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>ITBSE-706</description>
        <formula>NOT( ISBLANK(tEXT( Offer__c ) ))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>PROS EMEA Booking</fullName>
        <actions>
            <name>Stamp_Booked_Value</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Booked_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.SubType__c</field>
            <operation>equals</operation>
            <value>EMEA</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.BookedValue__c</field>
            <operation>equals</operation>
            <value>,USD 0</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>PROS Quote ARR Update</fullName>
        <actions>
            <name>STAMP_ARR_PROS</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(NOT(ISBLANK(PROS_Order_Quote__c)),  PROS_ARR__c &gt; 0)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>PS Override Population Alert</fullName>
        <actions>
            <name>PS_Booked_Value_Alert_for_Rep</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.PS_Override_Summary__c</field>
            <operation>greaterThan</operation>
            <value>USD 0</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>PVDForecast - Set Close Stamp2</fullName>
        <actions>
            <name>Update_EOM_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_SE_Close_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( ISBLANK( SE_Close_Stamp__c ),ISCHANGED( CloseDate) ,  OR($User.ProfileId =&quot;00e400000017D1i&quot;,$User.ProfileId =&quot;00e30000000dbMH&quot;,$User.ProfileId =&quot;00e400000017MtR&quot;,$User.ProfileId =&quot;00e400000017OTd&quot;,$User.ProfileId =&quot;00e400000017NZA&quot;,$User.ProfileId =&quot;00e400000017P91&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>PVDForecast - Set Push Date</fullName>
        <actions>
            <name>Update_Forecast_Status_to_Push</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Push_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>MONTH(CloseDate) &gt;  MONTH( SE_Close_Stamp__c)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Partner Lead Source Stage %26 Channel Alert</fullName>
        <actions>
            <name>Partner_Lead_Source_No_Channel_proposal_stage_alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.LeadSource</field>
            <operation>equals</operation>
            <value>Partner - ACP,Partner - DSP,Partner - MSP,Partner - MSP - Payroll</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Proposal</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.PartnerNumber__c</field>
            <operation>equals</operation>
            <value>,000-000-000</value>
        </criteriaItems>
        <description>Purpose: Partner Lead Source, @ proposed stage and no channel partner alert 
Integrated: No 
Change: Level 0 
Custodian: Partner Management / Liz Anderson</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Pending Assignment - Existing</fullName>
        <actions>
            <name>Force_SubType_Addon</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Force_Type_Existing</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CreatedById</field>
            <operation>equals</operation>
            <value>ZTBuy API</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CAM_Owned__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CARR__c</field>
            <operation>greaterThan</operation>
            <value>USD 0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>notEqual</operation>
            <value>Free Trial</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Pending Assignment - New</fullName>
        <actions>
            <name>Force_Type_New</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CreatedById</field>
            <operation>equals</operation>
            <value>ZTBuy API</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Owner_Role__c</field>
            <operation>notContain</operation>
            <value>CAM</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CARR__c</field>
            <operation>equals</operation>
            <value>,USD 0</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Populate Re-Qualified by Role</fullName>
        <actions>
            <name>Stamp_Re_Qualified_By_Role</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.ADR_Qualified_By__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Populate Type on Conversion</fullName>
        <actions>
            <name>Populate_Type_on_Conversion</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.TypeShadow__c</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <description>Populate Type to New on conversion (if the Lead that is being converted has &apos;Opportunity Type = New&apos;)</description>
        <triggerType>onCreateOnly</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Opportunity.CreatedDate</offsetFromField>
            <timeLength>0</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Populate Type on Conversion 2</fullName>
        <actions>
            <name>Populate_Type_on_Conversion_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.TypeShadow__c</field>
            <operation>equals</operation>
            <value>Existing</value>
        </criteriaItems>
        <description>Populate Type to Existing on conversion (if the Lead that is being converted has &apos;Opportunity Type = Existing&apos;)</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Populate Type on Conversion 3</fullName>
        <actions>
            <name>Populate_Type_on_Conversion</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.TypeShadow__c</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <description>Populate Type to Partner on conversion (if the Lead that is being converted has &apos;Opportunity Type = Partner&apos;)</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Portal Lead Converted To Opp Lost Notification</fullName>
        <actions>
            <name>Partner_Opportunity_Lost</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Partner_Portal_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Lost</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Portal Lead Converted To Opp Notification</fullName>
        <actions>
            <name>Portal_Lead_Converted_to_Opp_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>Partner_Portal_Email__c &lt;&gt; &quot;&quot;</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Portal Lead Converted To Opp Won Notification</fullName>
        <actions>
            <name>Lead_Converted_to_Opp_Won_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Partner_Portal_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Primary Campaign Alert for Liz A</fullName>
        <actions>
            <name>Primary_Campaign_changed_on_opp_alert_for_Liz_S</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Alert Liz every time the primary campaign changes on an opportunity</description>
        <formula>AND(
ISCHANGED(CampaignId), 
ISPICKVAL(Type,&quot;New&quot;),
ISPICKVAL(SubType__c,&quot;AvaTax&quot;) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Push Counter</fullName>
        <actions>
            <name>Increment_Push_Counter_by_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IF( CloseDate &gt; PRIORVALUE( CloseDate ), IF (MONTH(CloseDate) &lt;&gt; MONTH(PRIORVALUE( CloseDate )) , TRUE, FALSE), FALSE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Reassign Open Tasks to new Opp - DE user</fullName>
        <actions>
            <name>Reassign_Open_Tasks_to_new_Opp_Owner</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED( OwnerId ), PRIORVALUE(OwnerId )=&quot;00533000003hat0&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Reassign Open Tasks to new Opp - Geach</fullName>
        <actions>
            <name>Reassign_Open_Tasks_to_new_Opp_Owner</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED( OwnerId ), PRIORVALUE(OwnerId )=&quot;00540000002fAjb&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Reassign Open Tasks to new Opp - Lang</fullName>
        <actions>
            <name>Reassign_Open_Tasks_to_new_Opp_Owner</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED( OwnerId ), PRIORVALUE(OwnerId )=&quot;00540000001gJYt&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Reassign Open Tasks to new Opp -Brajevich</fullName>
        <actions>
            <name>Reassign_Open_Tasks_to_new_Opp_Owner</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED( OwnerId ), PRIORVALUE(OwnerId )=&quot;00540000002LPxjAAG&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Reassign Open Tasks to new Opp -Hammond</fullName>
        <actions>
            <name>Reassign_Open_Tasks_to_new_Opp_Owner</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED( OwnerId ), PRIORVALUE(OwnerId )=&quot;00540000003Cjae&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Reassign Open Tasks to new Opp Owner - Clyde</fullName>
        <actions>
            <name>Reassign_Open_Tasks_to_new_Opp_Owner</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <description>Reassigns open tasks to opp owner if previous owner was Ian Clyde</description>
        <formula>AND(ISCHANGED( OwnerId ), PRIORVALUE(OwnerId )=&quot;00540000000yhNA&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Reassign Open Tasks to new Opp Owner -Deubler</fullName>
        <actions>
            <name>Reassign_Open_Tasks_to_new_Opp_Owner</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED( OwnerId ), PRIORVALUE(OwnerId )=&quot;00540000001hDB6&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Reassign Open Tasks to new Opp Perri</fullName>
        <actions>
            <name>Reassign_Open_Tasks_to_new_Opp_Owner</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <formula>AND(ISCHANGED( OwnerId ), PRIORVALUE(OwnerId )=&quot;0054000000169FT&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>SDRs%2FADRs created Opptys Default Close Date</fullName>
        <actions>
            <name>Default</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR 2) AND 3</booleanFilter>
        <criteriaItems>
            <field>Opportunity.Created_By_Role__c</field>
            <operation>startsWith</operation>
            <value>ADR</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Created_By_Role__c</field>
            <operation>startsWith</operation>
            <value>SDR</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/IBST-7566</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>SOHO Default Close Date</fullName>
        <actions>
            <name>Default</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.SubType__c</field>
            <operation>equals</operation>
            <value>SOHO</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.IsClosed</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Created_By_Role__c</field>
            <operation>contains</operation>
            <value>inside</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>SOHO Force Account Record Type</fullName>
        <actions>
            <name>Force_SOHO_Account_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(TEXT(Connector__r.Platform_Cateogry__c) = &quot;Level 1&quot;, TEXT( SubType__c) = &quot;SOHO&quot;,  Amount &gt; 0,  IsClosed = TRUE, Connector__r.Name  &lt;&gt; &quot;TrustFile Online&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send CUT Questionnaire</fullName>
        <actions>
            <name>Send_CUT_Questionnaire</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND( CUTOpportunity__c = TRUE, NOT(ISBLANK( CUTSurveyContact__c )), $User.Validation_Exempt__c = FALSE)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send Global %2F VAT Questionnaire</fullName>
        <actions>
            <name>Send_Global_VAT_Questionnaire</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND( Global_Opportunity__c = TRUE, NOT(ISBLANK(Global_Survey_Contact__c)), $User.Validation_Exempt__c = FALSE)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Send Stategic Tax Content Questionnaire</fullName>
        <actions>
            <name>Send_Strategic_Tax_Content_Survey_Link_to_Opportunity_Owner</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>Strategic_Tax_Content_Opportunity__c = TRUE</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Qualified Date</fullName>
        <actions>
            <name>SetQualifiedOnTimestamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Qualified_By__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Qualified_On__c</field>
            <operation>lessThan</operation>
            <value>1/1/2008</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Shopify Online Order Alert</fullName>
        <actions>
            <name>Shopify_Order_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Force_SubType_Included</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>ZTNew,SOHO</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Connector_Name__c</field>
            <operation>equals</operation>
            <value>Shopify Plus</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notContain</operation>
            <value>Fame House</value>
        </criteriaItems>
        <description>Purpose: Zero Touch Order Alert for Shopify
Integrated: No 
Change: Level 0 
Custodian: SFDC Governance</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Source Connector Stamp</fullName>
        <active>false</active>
        <formula>And(  ISCHANGED(Connector__c), PRIORVALUE(Connector__c)= NULL )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stage Changed Date Stamp</fullName>
        <actions>
            <name>Opp_Stage_Change_Date_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>(ISCHANGED( StageName)) ||  (DateValue(CreatedDate) = Today())</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stage History Update</fullName>
        <actions>
            <name>Stage_History_Updater</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update: https://jira.avalara.com/browse/IBST-9292</description>
        <formula>ISNEW() || ISCHANGED( StageName )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp ADR Qualified On Date</fullName>
        <actions>
            <name>Stamp_ADR_Qualified_On_Date_with_NOW</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.ADR_Qualified_By__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.ADR_Qualified_On__c</field>
            <operation>lessThan</operation>
            <value>1/1/2008</value>
        </criteriaItems>
        <description>Stamp ADR_Qualified_On__c with current date-time when ADR_Qualified_By__c is populated</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Booked Manually Calculated Date</fullName>
        <actions>
            <name>Stamp_Booked_Manually_Calculated_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Booked_Manually_Calculated_Amount__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp EZTax Type %3D Client on Communications Opp Closed Won</fullName>
        <actions>
            <name>EZTax_Type_Client</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Type</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.SubType__c</field>
            <operation>equals</operation>
            <value>Communications</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.EZTax_Type__c</field>
            <operation>notEqual</operation>
            <value>Client</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Perpetual PS Override</fullName>
        <actions>
            <name>Stamp_PS_Override_Perpetual</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.PS_Override_Summary__c</field>
            <operation>greaterThan</operation>
            <value>USD 0</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Sales Accepted checkbox</fullName>
        <actions>
            <name>Check_Sales_Accepted_checkbox</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Sales Accepted</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SubType Change Alert</fullName>
        <actions>
            <name>Opp_SubType_Update_Alert</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <formula>AND(BookedValue__c &gt; 0, ISCHANGED( SubType__c ),  TEXT(Type)=&quot;New&quot; )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Discovery Date</fullName>
        <actions>
            <name>Discovery_Date_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>https://jira.avalara.com/browse/IBST-6176
https://jira.avalara.com/browse/IBST-6568</description>
        <formula>AND(          OR(     AND(      ISNEW() ,      ISBLANK( Discovery_Date__c )      ),           AND(                ISCHANGED( StageName ),                ISBLANK( Discovery_Date__c  )             ),             ISPICKVAL(PRIORVALUE(StageName),&quot;Marketing Qualified&quot;),            ISPICKVAL(PRIORVALUE(StageName),&quot;Sales Qualification&quot;),              ISPICKVAL(PRIORVALUE(StageName),&quot;Sales Working&quot;)),              OR(             ISPICKVAL(StageName, &quot;Discovery&quot;),             ISPICKVAL(StageName, &quot;Proof of Concept&quot;),             ISPICKVAL(StageName, &quot;Proposal&quot;),             ISPICKVAL(StageName, &quot;Verbally Committed&quot;),             ISPICKVAL(StageName, &quot;Closed Won&quot;)           )  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Proof of Concept Date</fullName>
        <actions>
            <name>Proof_of_Concept_Date_update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>https://jira.avalara.com/browse/IBST-6176
https://jira.avalara.com/browse/IBST-6568</description>
        <formula>AND(         OR(    AND(      ISNEW() ,      ISBLANK( Proof_of_Concept_Date__c )      ),             AND(                 ISCHANGED( StageName ),                 ISBLANK( Proof_of_Concept_Date__c  )              ),            ISPICKVAL(PRIORVALUE(StageName),&quot;Marketing Qualified&quot;),           ISPICKVAL(PRIORVALUE(StageName),&quot;Sales Qualification&quot;),              ISPICKVAL(PRIORVALUE(StageName),&quot;Sales Working&quot;),           ISPICKVAL(PRIORVALUE(StageName),&quot;Discovery&quot;)),             OR(            ISPICKVAL(StageName, &quot;Proof of Concept&quot;),            ISPICKVAL(StageName, &quot;Proposal&quot;),            ISPICKVAL(StageName, &quot;Verbally Committed&quot;),            ISPICKVAL(StageName, &quot;Closed Won&quot;)            )  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Proposal Date</fullName>
        <actions>
            <name>Update_Proposal_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>https://jira.avalara.com/browse/IBST-6176
https://jira.avalara.com/browse/IBST-6568</description>
        <formula>AND(         OR(      AND(       ISNEW() ,       ISBLANK( Proposal_Date__c )      ),           AND(                 ISCHANGED( StageName ),                  ISBLANK( Proposal_Date__c  )              ),              ISPICKVAL(PRIORVALUE(StageName),&quot;Marketing Qualified&quot;),             ISPICKVAL(PRIORVALUE(StageName),&quot;Sales Qualification&quot;),             ISPICKVAL(PRIORVALUE(StageName),&quot;Sales Working&quot;),             ISPICKVAL(PRIORVALUE(StageName),&quot;Discovery&quot;),             ISPICKVAL(PRIORVALUE(StageName),&quot;Proof of Concept&quot;)      ),               OR(       ISPICKVAL(StageName, &quot;Proposal&quot;),               ISPICKVAL(StageName, &quot;Verbally Committed&quot;),               ISPICKVAL(StageName, &quot;Closed Won&quot;)         )  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Sales Qualification Date</fullName>
        <actions>
            <name>Sales_Qualification_Date_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>https://jira.avalara.com/browse/IBST-6176</description>
        <formula>AND(      OR(       AND(        ISNEW() ,        ISBLANK( Sales_Qualification_Date__c )      ),      AND(                    ISCHANGED( StageName ),                    ISBLANK( Sales_Qualification_Date__c )                  ),                ISPICKVAL(PRIORVALUE(StageName),&quot;Marketing Qualified&quot;)               ),         OR(                           ISPICKVAL(StageName, &quot;Sales Qualification&quot;),                ISPICKVAL(StageName, &quot;Sales Working&quot;),               ISPICKVAL(StageName, &quot;Discovery&quot;),               ISPICKVAL(StageName, &quot;Proof of Concept&quot;),               ISPICKVAL(StageName, &quot;Proposal&quot;),               ISPICKVAL(StageName, &quot;Verbally Committed&quot;),               ISPICKVAL(StageName, &quot;Closed Won&quot;)              )  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Sales Working Date</fullName>
        <actions>
            <name>Sales_Working_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>https://jira.avalara.com/browse/IBST-6176</description>
        <formula>AND(         OR(       AND(           ISNEW() ,                     ISBLANK( Sales_Working_Date__c )        ),               AND(           ISCHANGED( StageName ),                     ISBLANK( Sales_Working_Date__c )        ),               ISPICKVAL(PRIORVALUE(StageName),&quot;Marketing Qualified&quot;),      ISPICKVAL(PRIORVALUE(StageName),&quot;Sales Qualification&quot;)),                  OR(              ISPICKVAL(StageName, &quot;Sales Working&quot;),              ISPICKVAL(StageName, &quot;Discovery&quot;),              ISPICKVAL(StageName, &quot;Proof of Concept&quot;),              ISPICKVAL(StageName, &quot;Proposal&quot;),              ISPICKVAL(StageName, &quot;Verbally Committed&quot;),              ISPICKVAL(StageName, &quot;Closed Won&quot;)              )  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Verbally Committed Date</fullName>
        <actions>
            <name>Verbally_Committed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>https://jira.avalara.com/browse/IBST-6176
https://jira.avalara.com/browse/IBST-6568</description>
        <formula>AND(         OR(      AND(       ISNEW() ,       ISBLANK( Verbally_Committed_Date__c )      ),          AND(                    ISCHANGED( StageName ),                    ISBLANK( Verbally_Committed_Date__c  )       ),              ISPICKVAL(PRIORVALUE(StageName),&quot;Marketing Qualified&quot;),            ISPICKVAL(PRIORVALUE(StageName),&quot;Sales Qualification&quot;),           ISPICKVAL(PRIORVALUE(StageName),&quot;Sales Working&quot;),      ISPICKVAL(PRIORVALUE(StageName),&quot;Discovery&quot;),      ISPICKVAL(PRIORVALUE(StageName),&quot;Proof of Concept&quot;),      ISPICKVAL(PRIORVALUE(StageName),&quot;Proposal&quot;)),              OR(     ISPICKVAL(StageName, &quot;Verbally Committed&quot;),            ISPICKVAL(StageName, &quot;Closed Won&quot;)           )  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Upside Removed</fullName>
        <actions>
            <name>Remove_Upside</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Upside__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>VAT Expert Sold Notification</fullName>
        <actions>
            <name>VAT_Expert_Sold_Notificatino</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send email notification to EMEA team when a VAT Expert Opp is marked Closed Won</description>
        <formula>AND(ISCHANGED(StageName), ISPICKVAL(StageName, &quot;Closed Won&quot;),  INCLUDES( Products_of_Interest__c , &quot;VAT Expert&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>ZTBuy First Purchase Date</fullName>
        <actions>
            <name>Stamp_ZtBuy_First_Purchase_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.CreatedById</field>
            <operation>equals</operation>
            <value>ZTBuy API</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Booked_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Account.First_Purchase_Date__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>iv__InsideView Outbound Rule for New Opportunities</fullName>
        <actions>
            <name>iv__InsideView_Opportunity_Outbound_Message</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <formula>CONTAINS($Setup.iv__InsideView_Notification_Enabler__c.iv__InsideView_Notification_Enabler__c, &quot;Opportunity.CREATE&quot;)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>iv__InsideView Outbound Rule for Opportunities</fullName>
        <actions>
            <name>iv__InsideView_Opportunity_Outbound_Message</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <formula>CONTAINS($Setup.iv__InsideView_Notification_Enabler__c.iv__InsideView_Notification_Enabler__c, &quot;Opportunity.UPDATE&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>Approval_time_task_trigger</fullName>
        <assignedTo>aaron.zapf@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Approval time task trigger</subject>
    </tasks>
    <tasks>
        <fullName>Follow_up_with_closed_lost_opportunity_that_has_re_engaged</fullName>
        <assignedToType>owner</assignedToType>
        <description>Responded to Closed-Lost nurture campaign in Eloqua:
    - Downloaded whitepaper: How Sales Tax Affects your Business.
    - Viewed interactive online ROI calculator.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow-up with closed-lost opportunity that has re-engaged</subject>
    </tasks>
    <tasks>
        <fullName>New_EMEA_Account</fullName>
        <assignedTo>michelle.bequette@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>An EMEA Account just had an opportunity marked closed one. Please follow up.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New EMEA Customer Introduction</subject>
    </tasks>
    <tasks>
        <fullName>Partner_Opportunity_Lost</fullName>
        <assignedTo>balz.wyss@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A partner opportunity has been marked closed lost. Please reassign this task to the primary CDM associated with this opportunity.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Partner Opportunity Lost</subject>
    </tasks>
    <tasks>
        <fullName>Sales_Enablement_Converted_Email_Sent</fullName>
        <assignedTo>mark.giddens@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Sales Enablement: Converted Email Sent</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Sales Enablement: Converted Email Sent</subject>
    </tasks>
    <tasks>
        <fullName>Sales_Enablement_Demo_Complete_Email_Sent</fullName>
        <assignedTo>mark.giddens@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Sales Enablement: Demo Complete</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Sales Enablement: Demo Complete Email Sent</subject>
    </tasks>
    <tasks>
        <fullName>Sales_Enablement_Engaged_Email_Sent</fullName>
        <assignedTo>mark.giddens@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Sales Enablement: Engaged Email Sent</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Sales Enablement: Engaged Email Sent</subject>
    </tasks>
    <tasks>
        <fullName>Sales_Enablement_Proposed_Email_Sent</fullName>
        <assignedTo>mark.giddens@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Sales Enablement: Proposed Email Sent</subject>
    </tasks>
    <tasks>
        <fullName>Schedule_CAM_Hand_Off_Call</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please coordinate a hand-off call with the CAM for this account and mark this task complete when finished.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Schedule CAM Hand Off Call</subject>
    </tasks>
    <tasks>
        <fullName>TestTimeDependentTrigger</fullName>
        <assignedTo>clayton.wiggins@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Yo Dawg, I heard you like Time Dependent Workflow Actions so I created one for you to test their efficacy.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>TestTimeDependentTrigger</subject>
    </tasks>
    <tasks>
        <fullName>leadfollowedupon</fullName>
        <assignedTo>marshal.kushniruk@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>lead followed up on</subject>
    </tasks>
</Workflow>
