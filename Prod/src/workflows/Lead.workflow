<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>ACP_Partner_Sign_Up_Notification</fullName>
        <description>ACP Partner Sign Up Notification</description>
        <protected>false</protected>
        <recipients>
            <recipient>balz.wyss@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>courtney.mcfarlane@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Partner_SignUp_Alert</template>
    </alerts>
    <alerts>
        <fullName>Alert_Sales_Leads</fullName>
        <ccEmails>salesleads@avalara.com</ccEmails>
        <description>Alert Sales Leads</description>
        <protected>false</protected>
        <recipients>
            <recipient>paul.weese@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inside_Sales_Emails/PPLeadAlert</template>
    </alerts>
    <alerts>
        <fullName>AvaTax_Partner_Referral_Lead_Assignment</fullName>
        <description>AvaTax Partner Referral Lead Assignment</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/AvaTax_Partner_Referral_Lead_Assignment</template>
    </alerts>
    <alerts>
        <fullName>CDM_Onboarded_Lead_Alert</fullName>
        <description>CDM Onboarded Lead Alert</description>
        <protected>false</protected>
        <recipients>
            <field>CDM_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CDM_Onboarded_Lead_Alert</template>
    </alerts>
    <alerts>
        <fullName>CallSquad_New_Insight_Email_Alert</fullName>
        <description>CallSquad New Insight Email Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CallSquad_Insight_Alert</template>
    </alerts>
    <alerts>
        <fullName>Call_Squad_Notification</fullName>
        <description>Call Squad Notification</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CallSquad_insight</template>
    </alerts>
    <alerts>
        <fullName>Call_Squad_insight</fullName>
        <description>Call Squad insight</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/CallSquad_Insight_Alert</template>
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
        <fullName>DSP_Sign_Up_Alert</fullName>
        <ccEmails>balz.wyss@avalara.com</ccEmails>
        <description>DSP Sign Up Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>michael.hackett@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>partnerprograms@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Connector_Management/DSP_SignUp_Alert</template>
    </alerts>
    <alerts>
        <fullName>EMEA_General_Contact_Lead_Assignment_Email_Alert</fullName>
        <description>EMEA General Contact Lead Assignment Email Alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/EMEA_General_Contact_Lead_Assignment</template>
    </alerts>
    <alerts>
        <fullName>Ecomm_Lead_Alert_to_Marketing</fullName>
        <description>Ecomm Lead Alert to Marketing</description>
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
        <template>unfiled$public/Ecomm_Lead_Alert</template>
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
        <fullName>Email_Notifications_for_all_Records_Assigned_out_From_the_ACP_Queue</fullName>
        <description>Email Notifications for all Records Assigned out From the ACP Queue</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Email_Notifications_for_all_Records_Assigned_out_From_the_ACP_Queue</template>
    </alerts>
    <alerts>
        <fullName>High_Priority_lead_response</fullName>
        <description>High Priority lead response</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderAddress>sales.operations@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/AvaTax_High_Priority_Lead_Assignment</template>
    </alerts>
    <alerts>
        <fullName>Landed_Cost_New_Lead_Notification</fullName>
        <description>Landed Cost New Lead Notification</description>
        <protected>false</protected>
        <recipients>
            <recipient>amy.morgan@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Landed_Cost_New_Lead_Notification</template>
    </alerts>
    <alerts>
        <fullName>Lead_Accepted</fullName>
        <description>Lead Accepted</description>
        <protected>false</protected>
        <recipients>
            <field>Partner_Portal_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>partnerprograms@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Portal_Templates/Lead_Accepted_Alert</template>
    </alerts>
    <alerts>
        <fullName>New_EMEA_Lead_Assignment_Notification</fullName>
        <description>New EMEA Lead Assignment Notification</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/EMEALeadassignment</template>
    </alerts>
    <alerts>
        <fullName>New_Landed_Cost_Lead_Assigned</fullName>
        <description>New Landed Cost Lead Assigned</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Landed_Cost_New_Lead_Notification</template>
    </alerts>
    <alerts>
        <fullName>New_Partner_SignUp_Alert_TrustFile_Bharat</fullName>
        <ccEmails>TFBpartner@avalara.com</ccEmails>
        <description>New Partner SignUp Alert - TrustFile Bharat</description>
        <protected>false</protected>
        <recipients>
            <recipient>balz.wyss@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>gautam.mukherjee@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kunal.tiwari@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sudhir.singh@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>vivek.shinde@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/TB_Partner_SignUp_Alert</template>
    </alerts>
    <alerts>
        <fullName>New_Partner_Web_Sign_Up</fullName>
        <description>New Partner Web Sign Up</description>
        <protected>false</protected>
        <recipients>
            <recipient>balz.wyss@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>courtney.mcfarlane@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Partner_SignUp_Alert</template>
    </alerts>
    <alerts>
        <fullName>Partner_Contact_Not_Found_on_Lead</fullName>
        <ccEmails>pmm@avalara.com</ccEmails>
        <description>Partner Contact Not Found on Lead</description>
        <protected>false</protected>
        <recipients>
            <recipient>kelleigh.t-nelson@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderAddress>partnerprograms@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Partner_Contact_Not_Found_on_Lead</template>
    </alerts>
    <alerts>
        <fullName>Partner_Portal_Lead_Submitted</fullName>
        <description>Partner Portal Lead Submitted</description>
        <protected>false</protected>
        <recipients>
            <field>Partner_Portal_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>partnerprograms@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Portal_Templates/Lead_Submitted_Alert</template>
    </alerts>
    <alerts>
        <fullName>Partner_Registration_Confirmation</fullName>
        <description>Partner Registration Confirmation</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderAddress>partnerprograms@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Partner_Onboarding/Onboarding_Sign_Up_Thank_You</template>
    </alerts>
    <alerts>
        <fullName>Portal_Lead_Rejected</fullName>
        <description>Portal Lead Rejected</description>
        <protected>false</protected>
        <recipients>
            <field>CDM_Email_Address__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Partner_Portal_Email__c</field>
            <type>email</type>
        </recipients>
        <senderAddress>partnerprograms@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>Portal_Templates/Lead_Rejected_Alert</template>
    </alerts>
    <alerts>
        <fullName>RSM_Lead_Routing_Partner_Leads</fullName>
        <description>RSM Lead Routing - Partner Leads</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/RSM_Lead_Routing_Partner</template>
    </alerts>
    <alerts>
        <fullName>SAM_Lead_Email_Alert_for_Jordan_Grant</fullName>
        <description>SAM Lead Email Alert for Jordan Grant</description>
        <protected>false</protected>
        <recipients>
            <recipient>mike.wingrove@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>SAM_PPM_Email_Templates/SAM_Lead_Connector_Alert</template>
    </alerts>
    <alerts>
        <fullName>TFB_Partner_Registration_Confirmation</fullName>
        <description>TrustFile Bharat Partner Registration Confirmation</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderAddress>partnerprograms@avalara.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/TFB_Onboarding_Sign_Up_Thank_You</template>
    </alerts>
    <alerts>
        <fullName>Test_Lead_Owner_notification_for_errant_web_form</fullName>
        <description>Test Lead Owner notification (for errant web form)</description>
        <protected>false</protected>
        <recipients>
            <recipient>kory.leavitt@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Email_Alert_Infer_25</template>
    </alerts>
    <fieldUpdates>
        <fullName>Area_Code_RSM_Region</fullName>
        <description>Used for Distribution engine routing</description>
        <field>Area_Code_RSM_Region__c</field>
        <literalValue>Northwest</literalValue>
        <name>Area Code RSM Region - Northwest</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Area_Code_RSM_Region_Great_Lakes</fullName>
        <field>Area_Code_RSM_Region__c</field>
        <literalValue>Great Lakes</literalValue>
        <name>Area Code RSM Region - Great Lakes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Area_Code_RSM_Region_Mid_Atlantic</fullName>
        <field>Area_Code_RSM_Region__c</field>
        <literalValue>Mid-Atlantic</literalValue>
        <name>Area Code RSM Region - Mid-Atlantic</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Area_Code_RSM_Region_North_Central</fullName>
        <field>Area_Code_RSM_Region__c</field>
        <literalValue>North Central</literalValue>
        <name>Area Code RSM Region - North Central</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Area_Code_RSM_Region_Northeast</fullName>
        <field>Area_Code_RSM_Region__c</field>
        <literalValue>Northeast</literalValue>
        <name>Area Code RSM Region - Northeast</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Area_Code_RSM_Region_South_Centra</fullName>
        <field>Area_Code_RSM_Region__c</field>
        <literalValue>South Central</literalValue>
        <name>Area Code RSM Region - South Central</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Area_Code_RSM_Region_Southeast</fullName>
        <field>Area_Code_RSM_Region__c</field>
        <literalValue>Southeast</literalValue>
        <name>Area Code RSM Region - Southeast</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Area_Code_RSM_Region_Southwest</fullName>
        <field>Area_Code_RSM_Region__c</field>
        <literalValue>Southwest</literalValue>
        <name>Area Code RSM Region - Southwest</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>AssignLeadtoAASPQUEUE</fullName>
        <description>Change the Lead Owner to the Ray Bigley</description>
        <field>OwnerId</field>
        <lookupValue>ray.bigley@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign AASP Lead to Ray Bigley</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_Amanzon_Lead_to_Martina_Chavez</fullName>
        <field>OwnerId</field>
        <lookupValue>martina.chavez@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign Amanzon Lead to Martina Chavez</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_EMEA_Leads_to_Colin_Matthews</fullName>
        <field>OwnerId</field>
        <lookupValue>colin.matthews@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign EMEA Leads to Colin Matthews</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_Lead_to_ACP_Queue</fullName>
        <description>Assigns a Lead to the ACP Queue</description>
        <field>OwnerId</field>
        <lookupValue>ACP_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Assign Lead to ACP Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_Lead_to_Amy_Morgan</fullName>
        <field>OwnerId</field>
        <lookupValue>amy.morgan@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign Lead to Amy Morgan</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_Lead_to_CertCapture_Queue</fullName>
        <description>Sets Lead Owner to CertCapture Leads queue</description>
        <field>OwnerId</field>
        <lookupValue>CertCapture_Leads</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Assign Lead to CertCapture Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_Lead_to_Matt_Hammond</fullName>
        <field>OwnerId</field>
        <lookupValue>matthew.hammond@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign Lead to Matt Hammond</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_Lead_to_Partner_Lead_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>Partner_Lead_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Assign Lead to Partner Lead Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_Lead_to_Sacha_Wilson</fullName>
        <field>OwnerId</field>
        <lookupValue>sacha.wilson@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign Lead to Sacha Wilson</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_Leads_from_Convergence_2012</fullName>
        <field>OwnerId</field>
        <lookupValue>jessica.davis@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign Leads from Convergence 2012</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_Leads_to_EMEA_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>EMEA_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Assign Leads to EMEA Queue</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_To_Mary_Jensen</fullName>
        <field>OwnerId</field>
        <lookupValue>mary.jensen@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign To Mary Jensen</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_to_Courtney</fullName>
        <field>OwnerId</field>
        <lookupValue>courtney.mcfarlane@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Assign to Courtney</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assign_to_LandedCost_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>Landed_Cost_Lead_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Assign to LandedCost Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CLEAR_Distribution_Action</fullName>
        <field>n2de__Action__c</field>
        <name>CLEAR Distribution Action</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cadence_Stage_Unsubscribed</fullName>
        <field>Cadence_Stage__c</field>
        <literalValue>Unsubscribed</literalValue>
        <name>Cadence Stage = Unsubscribed</name>
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
        <fullName>Check_DemandBase_Accuracy</fullName>
        <description>Checks the DemandBase Accuracy Checkbox</description>
        <field>DemandBaseAccuracy__c</field>
        <literalValue>1</literalValue>
        <name>Check DemandBase Accuracy</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Entered_as_Suspect</fullName>
        <description>Checks the Entered as Suspect checkbox</description>
        <field>EnteredAsSuspect__c</field>
        <literalValue>1</literalValue>
        <name>Check Entered as Suspect</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Communication_Queue_Reassign_exiting</fullName>
        <description>Assign leads to Communication queue</description>
        <field>OwnerId</field>
        <lookupValue>EZTax_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Communication Queue - assign leads</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Copy_Email_for_Sales_Enablemet</fullName>
        <field>CopyEmail__c</field>
        <formula>Email</formula>
        <name>Copy Email for Sales Enablemet</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Copy_Fname_for_Sales_Enablemet</fullName>
        <field>CopyName__c</field>
        <formula>FirstName</formula>
        <name>Copy Fname for Sales Enablemet</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EMEA_Amazon_Lead</fullName>
        <field>OwnerId</field>
        <lookupValue>EMEA_Amazon_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>EMEA Amazon Lead Routing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EMEA_Amazon_Lead_Queue_Owner</fullName>
        <description>Change owner back to the Amazon Lead Queue if existing lead</description>
        <field>OwnerId</field>
        <lookupValue>EMEA_Amazon_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>EMEA - Amazon Lead Queue Owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>EMEA_Assign_to_EMEA_Queue</fullName>
        <description>Used for excisting leads with new EMEA activity to move back to queue for rerouting if not in the Working status.</description>
        <field>OwnerId</field>
        <lookupValue>EMEA_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>EMEA -  Assign to EMEA Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fix_Date_Stamp</fullName>
        <field>Service_Terms_Signed__c</field>
        <formula>NOW()</formula>
        <name>Fix Date Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fix_Kentico_Post_Accounting</fullName>
        <field>Partner_Category__c</field>
        <literalValue>Accounting &amp; Consulting Partner</literalValue>
        <name>Fix Kentico Post - Accounting</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fix_Kentico_Post_Developer</fullName>
        <field>Partner_Category__c</field>
        <literalValue>Development &amp; Solutions Partner</literalValue>
        <name>Fix Kentico Post - Developer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Fix_marketing_lead</fullName>
        <field>Partner_Category__c</field>
        <literalValue>Marketing &amp; Sales Partner</literalValue>
        <name>Fix marketing lead</name>
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
        <fullName>LMSR_Zytax</fullName>
        <field>Lead_Source_Most_Recent__c</field>
        <literalValue>Zytax</literalValue>
        <name>LMSR Zytax</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LSMR_Change_Date</fullName>
        <field>LSMR_Change_Date__c</field>
        <formula>Today()</formula>
        <name>LSMR Change Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Authority_2_stamp</fullName>
        <field>Authority_2__c</field>
        <literalValue>1</literalValue>
        <name>Lead Authority (2) stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Budget_2_stamp</fullName>
        <field>Budget_2__c</field>
        <literalValue>1</literalValue>
        <name>Lead Budget 2 stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Contact_Status_to_MQL_Date_stamped</fullName>
        <description>Lead/Contact Status to MQL Date stamped
https://jira.avalara.com/browse/ITBSE-706
Owner: Kim Gordon</description>
        <field>MQL_Status_Date__c</field>
        <formula>TODAY()</formula>
        <name>Lead/Contact Status to MQL Date stamped</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Contact_Status_to_Nurture</fullName>
        <field>Status</field>
        <literalValue>Nurture</literalValue>
        <name>Lead/Contact Status to Nurture</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Interest_2_stamp</fullName>
        <field>Interest_2__c</field>
        <literalValue>1</literalValue>
        <name>Lead Interest (2) stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Owner_Master_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>AvaTax_Lead_Master_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Lead Owner - Master Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Owner_back_to_AvaTax_Master_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>AvaTax_Lead_Master_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Lead Owner back to AvaTax Master Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Source_Change_to_Partner_DSP</fullName>
        <field>LeadSource</field>
        <literalValue>Partner - DSP</literalValue>
        <name>Lead Source Change to Partner - DSP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Source_Marketing</fullName>
        <field>LeadSource</field>
        <literalValue>Marketing</literalValue>
        <name>Lead Source = Marketing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Source_Payroll</fullName>
        <field>LeadSource</field>
        <literalValue>Partner - MSP - Payroll</literalValue>
        <name>Lead Source Payroll</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Source_to_Marketing</fullName>
        <description>ACD: MKT2013Q410 QuickBooks No Touch Pho leads are coming in with wrong lead source. changing them to marketing</description>
        <field>LeadSource</field>
        <literalValue>Marketing</literalValue>
        <name>Lead Source to Marketing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Source_to_Partner_ACP</fullName>
        <field>LeadSource</field>
        <literalValue>Partner - ACP</literalValue>
        <name>Lead Source to Partner - ACP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Source_to_Sales_Rep_Prospecting</fullName>
        <field>LeadSource</field>
        <literalValue>Sales Generated</literalValue>
        <name>Lead Source to Sales Rep Prospecting</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lead_Status_Change_Date</fullName>
        <field>Status_Change_Date__c</field>
        <formula>NOW()</formula>
        <name>Lead Status Change Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Marketing_Feed_Back_Log_Stamp</fullName>
        <field>Marketing_Feedback_Log__c</field>
        <formula>&quot;--- &quot;&amp; Text(NOW())&amp; &quot;-&quot;&amp; Marketing_Feedback_Notes__c &amp; &quot;-&quot; &amp; Marketing_Feedback_Log__c</formula>
        <name>Marketing Feed Back Log Stamp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Most_Recent_Vendisys</fullName>
        <field>Lead_Source_Most_Recent__c</field>
        <literalValue>Vendisys</literalValue>
        <name>Most Recent = Vendisys</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MyLodge_Update_Lead_Channel</fullName>
        <field>Lead_Channel__c</field>
        <literalValue>guidebook</literalValue>
        <name>MyLodge Update Lead Channel</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>MyLodge_Update_Lead_Owner</fullName>
        <field>OwnerId</field>
        <lookupValue>ryan.odonnell@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>MyLodge Update Lead Owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
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
        <fullName>Nurture_reason_60_days</fullName>
        <field>Nurture_Reason__c</field>
        <literalValue>60 Day Expiration</literalValue>
        <name>Nurture reason 60 days</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opp_Type_Zytax</fullName>
        <field>Opportunity_Type__c</field>
        <literalValue>Zytax</literalValue>
        <name>Opp Type = Zytax</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Partner_Leadd_Opp</fullName>
        <field>Opportunity_Type__c</field>
        <literalValue>Partner</literalValue>
        <name>Partner Lead Opp Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Partner_Opp_Sub_Type</fullName>
        <field>OpportunitySubType__c</field>
        <literalValue>Other</literalValue>
        <name>Partner Opp Sub Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_CM_Email</fullName>
        <field>CDM_Email_Address__c</field>
        <formula>Get_CDM_email__c</formula>
        <name>Populate CM Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reassign_Lead_to_ACP_Queue</fullName>
        <field>OwnerId</field>
        <lookupValue>ACP_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Reassign Lead to ACP Queue</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reassign_Lead_to_API_User</fullName>
        <description>Reassign the Lead to the API User</description>
        <field>OwnerId</field>
        <lookupValue>dg-internal-systems-team@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Reassign Lead to API User</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Route_Bharat_to_Yogesh</fullName>
        <field>OwnerId</field>
        <lookupValue>yogesh.mishra@avalara.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Route Bharat to Yogesh Mishra</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
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
        <fullName>Set_Email_Opt_Out_to_True_Lead</fullName>
        <field>HasOptedOutOfEmail</field>
        <literalValue>1</literalValue>
        <name>Set Email Opt Out to True - Lead</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Lead_Source_to_Social_Media</fullName>
        <field>LeadSource</field>
        <literalValue>Social Media</literalValue>
        <name>Set Lead Source to Social Media</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Moved_Out_of_Suspect</fullName>
        <description>Date Stamps when a Lead Status changes from Suspect</description>
        <field>MovedOutOfSuspect__c</field>
        <formula>now()</formula>
        <name>Stamp Moved Out of Suspect</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Status_Change_Date_Working</fullName>
        <description>Time stamp of date the status on the lead was moved to Working</description>
        <field>Status_Change_Date_Working__c</field>
        <formula>NOW()</formula>
        <name>Status Change Date - Working</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Hidden_LSMR</fullName>
        <description>Updates the hidden LSMR field</description>
        <field>hLSMR__c</field>
        <formula>TEXT( Lead_Source_Most_Recent__c )</formula>
        <name>Update Hidden LSMR</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Lead_Source_to_Social</fullName>
        <description>Updates Lead Source to equal &apos;Social Media&apos;</description>
        <field>LeadSource</field>
        <literalValue>Social Media</literalValue>
        <name>Update Lead Source to Social</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Lead_Status</fullName>
        <description>https://jira.avalara.com/browse/IBST-11820</description>
        <field>Status</field>
        <literalValue>Processing</literalValue>
        <name>Update Lead Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Lead_to_Nurture</fullName>
        <field>Status</field>
        <literalValue>Nurture</literalValue>
        <name>Update Lead to Nurture</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Test_Field</fullName>
        <field>TESTFIELD__c</field>
        <formula>text(now())</formula>
        <name>Update Test Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_requested_a_demo</fullName>
        <field>RequestedADemo__c</field>
        <literalValue>1</literalValue>
        <name>Update requested a demo</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Webform_Submittal_Changed_Date</fullName>
        <description>Stamps the time and day the field value gets updated. Will be used to calculate the difference from the form submit to when it hits Salesforce.</description>
        <field>Webform_Submittal_Date_Changed__c</field>
        <formula>NOW()</formula>
        <name>Webform Submittal Changed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <flowActions>
        <fullName>Test_Add_Campaign_Member</fullName>
        <flow>Test_Create_Campaign_Member</flow>
        <flowInputs>
            <name>LeadID</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>Test Add Campaign Member</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <outboundMessages>
        <fullName>Create_TrustFile_Account</fullName>
        <apiVersion>33.0</apiVersion>
        <endpointUrl>https://app.trustfile.avalara.com/TrustFileServiceSoap</endpointUrl>
        <fields>CaseSafeID__c</fields>
        <fields>City</fields>
        <fields>Company</fields>
        <fields>Country</fields>
        <fields>Email</fields>
        <fields>FirstName</fields>
        <fields>Id</fields>
        <fields>LastName</fields>
        <fields>LeadSource</fields>
        <fields>Phone</fields>
        <fields>PostalCode</fields>
        <fields>SalesUserEmail__c</fields>
        <fields>SalesUserID__c</fields>
        <fields>State</fields>
        <fields>Street</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>clayton.wiggins@avalara.com</integrationUser>
        <name>Create TrustFile Account</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>TESTCreate_TrustFile_Account</fullName>
        <apiVersion>34.0</apiVersion>
        <endpointUrl>http://putsreq.com/awXbJ4ewp00oI1Da2a0y</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>clayton.wiggins@avalara.com</integrationUser>
        <name>TEST Create TrustFile Account</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>iv__Lead_Outbound_Message</fullName>
        <apiVersion>43.0</apiVersion>
        <description>This is used for notifying InsideView Refresh for Leads.</description>
        <endpointUrl>https://integrations.insideview.com/integrations-notifications/salesforce/lead?authType=IV_SALESFORCE_CANVAS</endpointUrl>
        <fields>CreatedById</fields>
        <fields>Id</fields>
        <fields>LastModifiedById</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>kory.leavitt@avalara.com</integrationUser>
        <name>InsideView Leads Outbound Message</name>
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
            <field>Lead.Cadence_Stage__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Status</field>
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
            <field>Lead.Cadence_Stage__c</field>
            <operation>equals</operation>
            <value>Working</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>%28SL%29 Cadence Working CLEAR Distribution Action and Update Lead Status</fullName>
        <actions>
            <name>CLEAR_Distribution_Action</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Lead_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Cadence_Stage__c</field>
            <operation>equals</operation>
            <value>Working</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>ACP Partner Sign Up Notification</fullName>
        <actions>
            <name>ACP_Partner_Sign_Up_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Partner_Category__c</field>
            <operation>equals</operation>
            <value>Accounting &amp; Consulting Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OpportunitySubType__c</field>
            <operation>notEqual</operation>
            <value>MyLodge</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Amazon Landing Page assignement to Martina Chavez</fullName>
        <actions>
            <name>Assign_Amanzon_Lead_to_Martina_Chavez</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Lead_Source_Most_Recent__c</field>
            <operation>equals</operation>
            <value>Educational Asset</value>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign.CaseSafeID__c</field>
            <operation>equals</operation>
            <value>70140000000WBREAA4</value>
        </criteriaItems>
        <description>Send all incoming leads directly to Martina from Amazon landing page campaign: https://na2.salesforce.com/70140000000WBRE
Integrated: no
Marketing: Martina Chavez/Greg Chapman</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Assign AASP Leads to Ray Bigley</fullName>
        <actions>
            <name>AssignLeadtoAASPQUEUE</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Lead_Source_Most_Recent__c</field>
            <operation>equals</operation>
            <value>AASP</value>
        </criteriaItems>
        <description>When an existing Lead signs up for the AASP program, assign the Lead record to Ray Bigley</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Assign ACP Leads to the ACP Queue</fullName>
        <actions>
            <name>Assign_Lead_to_ACP_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Opportunity_Type__c</field>
            <operation>equals</operation>
            <value>Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OpportunitySubType__c</field>
            <operation>equals</operation>
            <value>ACP</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>notEqual</operation>
            <value>Working,Converted</value>
        </criteriaItems>
        <description>Assign appropriate Leads to the ACP Queue</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Assign General Task when Lead is Accepted from ACP Queue</fullName>
        <actions>
            <name>ACP_List</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <description>Assigns a Task when a Lead is accepted from the ACP Queue</description>
        <formula>AND(ischanged( OwnerId)=true, priorvalue(OwnerId)=&quot;00G40000001nH1Y&quot;,OwnerId&lt;&gt;&quot;00G40000001nNqm&quot;,
 ISPICKVAL(Lead_Source_Most_Recent__c,&quot;ACP List&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Assign Lead to Partner Lead Queue</fullName>
        <actions>
            <name>Assign_Lead_to_Partner_Lead_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Lead_Source_Most_Recent__c</field>
            <operation>equals</operation>
            <value>SALT-in-a-Box</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Assign Leads to CertCapture Queue</fullName>
        <actions>
            <name>Assign_Lead_to_CertCapture_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2 OR 3</booleanFilter>
        <criteriaItems>
            <field>Lead.Lead_Source_Most_Recent__c</field>
            <operation>equals</operation>
            <value>CertCapture Asset,CertCapture Event,CertCapture OBTM,Sales Tax Institute,MKT2014 Adwords CertCapture,MKT2014 CertCapture Learn More,CERTMKT2015AdWords - FATCA Whitepaper,CertCapture</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Unbounce_Page_ID__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.UnbouncePageID__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Workflow activated when a CertCapture Lead responds to a campaign.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Assign leads from eloqua user</fullName>
        <actions>
            <name>Lead_Owner_back_to_AvaTax_Master_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND 2 AND 3 AND 4 and 7) or (5 and 6)</booleanFilter>
        <criteriaItems>
            <field>Lead.OpportunitySubType__c</field>
            <operation>equals</operation>
            <value>AvaTax</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>contains</operation>
            <value>Eloqua</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Lead_Source_Most_Recent__c</field>
            <operation>notEqual</operation>
            <value>Chat Contact Us Form,Chat Contact Us Online,Event - Queue,Event - Sales,Get Started Integration,QBO Trial Subscription</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Offer__c</field>
            <operation>notEqual</operation>
            <value>CL Event,Direct to Rep</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OwnerId</field>
            <operation>contains</operation>
            <value>Averetek</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Lead_Source_Most_Recent__c</field>
            <operation>equals</operation>
            <value>AMC Partner Lead</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Eloqua_Webinar_Hold__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Leads moved out of eloqua user to Avatax master queue</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Auto Email Opt Out for New Mcgladrey Leads</fullName>
        <actions>
            <name>Set_Email_Opt_Out_to_True_Lead</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Email</field>
            <operation>contains</operation>
            <value>@mcgladrey.com</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax Email Notification for High Priority Leads</fullName>
        <actions>
            <name>High_Priority_lead_response</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Creates and email notification to owner for High Priority leads
Updated: IBST-16982</description>
        <formula>AND( ISCHANGED(OwnerId)=true, OR(PRIORVALUE(OwnerId)=&quot;00G0b000001xivX&quot;,PRIORVALUE(OwnerId)=&quot;00G330000029Ov0&quot;,PRIORVALUE(OwnerId)=&quot;00G40000001nQgz&quot;,PRIORVALUE(OwnerId)=&quot;00G40000001nH1Y&quot;), OR(ISPICKVAL( Offer__c , &quot;General Contact&quot;), ISPICKVAL( Offer__c , &quot;Product Offering&quot;), ISPICKVAL( Offer__c , &quot;Free Trial&quot;) ), NOT(ISPICKVAL(OpportunitySubType__c, &quot;MyLodge&quot;)) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax Email Notification for Partner Referrals</fullName>
        <actions>
            <name>AvaTax_Partner_Referral_Lead_Assignment</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Creates and email notification to owner for High Priority leads</description>
        <formula>AND(  ischanged(OwnerId)=true,   OR(priorvalue(OwnerId)=&quot;00G0b000001xivX&quot;,priorvalue(OwnerId)=&quot;00G330000029Ov0&quot;,priorvalue(OwnerId)=&quot;00G40000001nQgz&quot;),    ISPICKVAL( Offer__c , &quot;Referral Program&quot;),   NOT(ISPICKVAL(OpportunitySubType__c, &quot;MyLodge&quot;))   )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax Task - Create Task When ACP Lead is Taken fom the AVatax SDR Lead Routing Queue</fullName>
        <actions>
            <name>New_Partner_ACP_Lead</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <description>Creates a Task for the new Lead Owner when a Lead is taken from the AvaTax SDR lead Routing Queue</description>
        <formula>AND(ischanged(OwnerId)=true,priorvalue(OwnerId)=&quot;00G33000001fPvO&quot;, ISPICKVAL( OpportunitySubType__c , &quot;ACP&quot;), ISPICKVAL( Opportunity_Type__c , &quot;Partner&quot;)  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax Task - Create Task When Lead is Taken fom the AVatax SDR Lead Routing Queue</fullName>
        <actions>
            <name>New_Lead_Follow_Up</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <description>Creates a Task for the new Lead Owner when a Lead is taken from the AvaTax SDR lead Routing Queue</description>
        <formula>AND(ischanged(OwnerId)=true,priorvalue(OwnerId)=&quot;00G33000001fPvO&quot;, ISPICKVAL( OpportunitySubType__c , &quot;AvaTax&quot;) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax Task - Create Task When Lead is Taken fom the Landed Cost Queue</fullName>
        <actions>
            <name>New_Landed_Cost_Lead_Assigned</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>New_Landed_Cost</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <description>Creates a Task for the new Lead Owner when a Lead is taken from the Landed Cost Queue</description>
        <formula>AND(ischanged(OwnerId)=true,priorvalue(OwnerId)=&quot;00G33000002N9T1&quot;,OR( ISPICKVAL(   OpportunitySubType__c  , &quot;AvaTax&quot;),ISPICKVAL(   OpportunitySubType__c  , &quot;LandedCost&quot;) ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax Task - Create Task When Lead is Taken from Miscellaneous Queue</fullName>
        <actions>
            <name>Follow_up_with_Lead_from_Miscellaneous_Queue</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <description>Creates a Task for the new Lead Owner when a Lead is taken from the Miscellaneous Queue</description>
        <formula>AND(ischanged(OwnerId)=true,priorvalue(OwnerId)=&quot;00G3300000237EU&quot;,OwnerId &lt;&gt; &quot;00G40000001SSpG&quot;,OwnerId&lt;&gt;&quot;005400000016PcH&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax Task - Create Task When Lead is Taken from Whitepaper Queue</fullName>
        <actions>
            <name>AvaTax_Whitepaper_Queue</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <description>Creates a Task for the new Lead Owner when a Lead is taken from the Whitepaper Queue</description>
        <formula>AND(ischanged(OwnerId)=true,priorvalue(OwnerId)=&quot;00G40000001SH8u&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax Task - Create Task When MSP Lead is Taken fom the AVatax SDR Lead Routing Queue</fullName>
        <actions>
            <name>MSP_Potential_Partner_Lead</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <description>Creates a Task for the new Lead Owner when a MSP Lead is taken from the AvaTax SDR lead Routing Queue</description>
        <formula>AND(ischanged(OwnerId)=true,priorvalue(OwnerId)=&quot;00G33000001fPvO&quot;, ISPICKVAL( OpportunitySubType__c , &quot;MSP&quot;) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Avatax Lead %28existing%29 back to master queue</fullName>
        <actions>
            <name>Lead_Owner_back_to_AvaTax_Master_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( ISCHANGED( Most_Recent_Conversion_Date__c ), Most_Recent_Conversion_Date__c = TODAY(), OR(ISPICKVAL(OpportunitySubType__c, &quot;AvaTax&quot;),ISPICKVAL(OpportunitySubType__c, &quot;SOHO&quot;),ISPICKVAL(OpportunitySubType__c, &quot;TrustFile&quot;)), NOT( Includes( Interest_in_Products_Services__c , &quot;Landed Cost/Cross Border&quot;)),Eloqua_Webinar_Hold__c = False,NOT( ISPICKVAL( Offer__c , &quot;Direct to Rep&quot;)), NOT( ISPICKVAL( Offer__c , &quot;CL Event&quot;)) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Brazil Lead Assignment Task</fullName>
        <actions>
            <name>Please_follow_up_https_www_avalara_com_br_campaign_response</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <description>Creates a Task for the new Lead Owner when a Lead is taken from the Brazil Lead Queue.</description>
        <formula>AND(ischanged(OwnerId)=true,priorvalue(OwnerId)=&quot;00G33000002Iy1D&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Capture Status change from Suspect</fullName>
        <actions>
            <name>Stamp_Moved_Out_of_Suspect</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>When Lead Status changes from Suspect to anything else, stamp the date in the &apos;Moved Out of Status&apos; field.</description>
        <formula>AND( EnteredAsSuspect__c=true,NOT(ISPICKVAL(Status,&quot;Suspect&quot;)),NOT(ISPICKVAL(Status,&quot;Nurture&quot;)),NOT(ISPICKVAL(Status,&quot;Disqualified&quot;)),ISBLANK( MovedOutOfSuspect__c ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CertCapture DemandZen - David Wilson</fullName>
        <actions>
            <name>New_DemandZen_Appointment_follow_up2</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Campaign_Most_Recent_ID__c</field>
            <operation>equals</operation>
            <value>70140000000Vn7qAAC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.State</field>
            <operation>equals</operation>
            <value>Texas,TX,Oklahoma,OK,Arkansas,AR,Louisiana,LA,Mississippi,MS,Alabama,AL,Georgia,GA,South Carolina,SC,Florida,FL</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CertCapture DemandZen - Kristin Terdik</fullName>
        <actions>
            <name>New_DemandZen_Appointment_follow_up3</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Campaign_Most_Recent_ID__c</field>
            <operation>equals</operation>
            <value>70140000000Vn7qAAC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.State</field>
            <operation>contains</operation>
            <value>New Hampshire,NH,Maine,ME,Vermont,VT,Massachusetts,MA,Rhode Island,RI,Connecticut,CT,New York,NY,New Jersey,NJ,Delaware,DE,Maryland,MD,Pennsylvania,PA,West Virginia,WV,Virginia,VA,Kentucky,KY,Tennessee,TN,North Carolina,NC</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>CertCapture DemandZen - Laura Wahl</fullName>
        <actions>
            <name>New_DemandZen_Appointment_follow_up1</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Campaign_Most_Recent_ID__c</field>
            <operation>equals</operation>
            <value>70140000000Vn7qAAC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.State</field>
            <operation>contains</operation>
            <value>North Dakota,ND,South Dakota,SD,Nebraska,NE,Kansas,KS,Minnesota,MN,Iowa,IA,Missouri,MO,Wisconsin,WI,Illinois,IL,Michigan,MI,Indiana,IN,Ohio,OH</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CertCapture DemandZen - Matthew Hill</fullName>
        <actions>
            <name>New_DemandZen_Appointment_follow_up</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Campaign_Most_Recent_ID__c</field>
            <operation>equals</operation>
            <value>70140000000Vn7qAAC</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.State</field>
            <operation>contains</operation>
            <value>Hawaii,HI,Alaska,AK,Washington,WA,Oregon,OR,California,CA,Nevada,NV,Idaho,ID,Montana,MT,Wyoming,WY,Colorado,CO,Arizona,AZ,New Mexico,NM</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CertCapture Task - Offer -General Contact</fullName>
        <actions>
            <name>CC_Call_1_General_Contact_Request</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.OpportunitySubType__c</field>
            <operation>equals</operation>
            <value>CertCapture</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Offer__c</field>
            <operation>equals</operation>
            <value>General Contact</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>Creates a Task for the new Lead Owner when a Lead is taken from the Communications Queue with offer = General Contact</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Check Entered as Suspect</fullName>
        <actions>
            <name>Check_Entered_as_Suspect</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Status</field>
            <operation>equals</operation>
            <value>Suspect</value>
        </criteriaItems>
        <description>When a Lead is created with a Lead Status of Suspect check the &apos;Entered as Suspect&apos; checkbox</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Communication - Existing Lead Rerouting back to Communications Queue</fullName>
        <actions>
            <name>Communication_Queue_Reassign_exiting</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Existing leads that have re-engaged with a new Most recent conversion rate of today and are not in the Working status will be reassigned to the queue and rerouted through DE</description>
        <formula>AND( ISCHANGED( Most_Recent_Conversion_Date__c )  , ISCHANGED(  OpportunitySubType__c  ), Most_Recent_Conversion_Date__c =  TODAY(), ISPICKVAL( OpportunitySubType__c , &quot;Communications&quot;),NOT( ISPICKVAL(  Offer__c , &quot;Direct to Rep&quot;)), OwnerId  &lt;&gt;  &quot;00540000003P20m&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Communication Lead rating changed to A</fullName>
        <actions>
            <name>Call_EZ_Lead_Rating_A_Reached</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <formula>And ( ISCHANGED(   Rating  ) , Not(ISBLANK(PRIORVALUE( Rating ))),  ISPICKVAL( Rating , &quot;A&quot;) , ISPICKVAL( OpportunitySubType__c , &quot;Communications&quot;),  $User.ProfileId  &lt;&gt; &quot;00e400000017Jxi&quot; )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Communication Lead rating changed to b</fullName>
        <actions>
            <name>Call_EZ_Lead_Rating_B_Reached</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <formula>And ( ISCHANGED(   Rating  ) , Not(ISBLANK(PRIORVALUE( Rating ))),  ISPICKVAL( Rating , &quot;B&quot;),ISPICKVAL( OpportunitySubType__c , &quot;Communications&quot;),$User.ProfileId &lt;&gt; &quot;00e400000017Jxi&quot;  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Communications Task - Calculator Submissions</fullName>
        <actions>
            <name>CommTaxRates_Registration_Follow_Up_See_Campaign_Name_for_details</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Offer__c</field>
            <operation>equals</operation>
            <value>Free Rates</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Web_Property__c</field>
            <operation>equals</operation>
            <value>communicationstaxrates.avalara.com</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Communications Task - Offer -General Contact</fullName>
        <actions>
            <name>EZ_Call_General_Contact_Request</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.OpportunitySubType__c</field>
            <operation>equals</operation>
            <value>Communications</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Offer__c</field>
            <operation>equals</operation>
            <value>General Contact</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>Creates a Task for the new Lead Owner when a Lead is taken from the Communications Queue with offer = General Contact</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Communications Task - Offer -Product Offering</fullName>
        <actions>
            <name>EZ_Call_Product_Offering_Request</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.OpportunitySubType__c</field>
            <operation>equals</operation>
            <value>Communications</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Offer__c</field>
            <operation>equals</operation>
            <value>Product Offering</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>Creates a Task for the new Lead Owner when a Lead is taken from the Communications Queue with offer = Webinar</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Communications Task - Offer Webinar</fullName>
        <actions>
            <name>EZ_Call_Webinar_Attendee</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <description>Creates a Task for the new Lead Owner when a Lead is taken from the Communications Queue with offer = Webinar</description>
        <formula>AND(ischanged(OwnerId)=true,priorvalue(OwnerId)=&quot;00G3300000239km&quot;,OwnerId &lt;&gt; &quot;00540000003P20m&quot;, ISPICKVAL( Offer__c , &quot;Webinar&quot;), Most_Recent_Conversion_Date__c  =  TODAY(), ISPICKVAL( Webinar_Status__c , &quot;Attended&quot;)   )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Copy Email for Sales Enablemet</fullName>
        <actions>
            <name>Copy_Email_for_Sales_Enablemet</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Email</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Copy Fname for Sales Enablemet</fullName>
        <actions>
            <name>Copy_Fname_for_Sales_Enablemet</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.FirstName</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Create Task When Lead is Taken from Event Queue</fullName>
        <actions>
            <name>Event_Queue</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <description>When a Lead is accepted from the Event queue, created a task and assign it to the new Lead Owner</description>
        <formula>AND(ischanged(OwnerId)=true,priorvalue( OwnerId )=&quot;00G3300000237EF&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>DSP Sign Up Alert</fullName>
        <actions>
            <name>DSP_Sign_Up_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Partner_Category__c</field>
            <operation>equals</operation>
            <value>Development &amp; Solutions Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OpportunitySubType__c</field>
            <operation>notEqual</operation>
            <value>MyLodge</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EMEA - Amazon Bridge Routing</fullName>
        <actions>
            <name>EMEA_Amazon_Lead</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Interest_in_Products_Services__c</field>
            <operation>equals</operation>
            <value>Amazon Bridge</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OpportunitySubType__c</field>
            <operation>equals</operation>
            <value>EMEA</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EMEA - Assign Existing Lead Back To EMEA Amazon Q</fullName>
        <actions>
            <name>EMEA_Amazon_Lead_Queue_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>When an existing lead takes a new action and the Opp subtype = EMEA and is not currently being worked, it will go back to the EMEA Amazon queue for re-routing</description>
        <formula>AND(ISCHANGED( OpportunitySubType__c ), ISPICKVAL(OpportunitySubType__c, &quot;EMEA&quot;), Most_Recent_Conversion_Date__c =  TODAY(), Custom_Routing__c = TRUE, INCLUDES( Interest_in_Products_Services__c , &quot;Amazon Bridge&quot;) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EMEA - Assign Existing Lead Back To EMEA Queue</fullName>
        <actions>
            <name>EMEA_Assign_to_EMEA_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>When an existing lead takes a new action and the Opp subtype = EMEA and is not currently being worked, it will go back to the EMEA queue for re-routing.

Updated 10/9/17: Add ISCHANGED(MRCD) to prevent action on new leads.

Updated 05/11 - IBST-9768</description>
        <formula>AND( ISPICKVAL(OpportunitySubType__c, &quot;EMEA&quot;), Most_Recent_Conversion_Date__c =  TODAY(), ISCHANGED(Most_Recent_Conversion_Date__c),   Custom_Routing__c = False,  NOT(INCLUDES( Interest_in_Products_Services__c , &quot;Amazon Bridge&quot;)), NOT(INCLUDES( Interest_in_Products_Services__c , &quot;VISA&quot;)) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EMEA General Contact Lead Assignment Task</fullName>
        <actions>
            <name>EMEA_General_Contact_Lead_Assignment_Email_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Contact_Us_form_follow_up</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <description>Creates a Task for the new Lead Owner when a Lead is taken from the  EMEA Lead Queue and has the offer of General Contact 
IBST-9768 : Added email alert</description>
        <formula>AND(    Ischanged(OwnerId)=true,    priorvalue(OwnerId)=&quot;00G40000001oeVb&quot;,    OR(     ISPICKVAL( Offer__c ,&quot;General Contact&quot;),    ISPICKVAL( Offer__c ,&quot;Product Offering&quot;),    ISPICKVAL( Offer__c ,&quot;Free Trial&quot;),    ISPICKVAL( Offer__c ,&quot;Referral Program&quot;)    ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Ecomm Created Lead Alert</fullName>
        <actions>
            <name>Ecomm_Lead_Alert_to_Marketing</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>User.Sales_Group__c</field>
            <operation>equals</operation>
            <value>Ecomm</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.OpportunitySubType__c</field>
            <operation>notEqual</operation>
            <value>MyLodge</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Email Notification for Conversica Action</fullName>
        <actions>
            <name>Email_Notification_for_Conversica_Action_Required</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>IBST-9449</description>
        <formula>AND(AVA__AVAAI_action_required__c = true,     OR(      Owner:User.UserRole.Name =&apos;SDR A&apos;,       Owner:User.UserRole.Name=&apos;SDR B&apos;,       Owner:User.UserRole.Name=&apos;SDR C&apos;,       Owner:User.UserRole.Name=&apos;SDR D&apos;     ),   NOT(ISPICKVAL(OpportunitySubType__c, &quot;MyLodge&quot;)),  TODAY() - 30 &lt;= DATEVALUE(AVA__AVAAI_action_required_date__c)    )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email Notification for Conversica hot leads</fullName>
        <actions>
            <name>Conversica_Email_Alert_Hot_Leads</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>IBST-9449</description>
        <formula>AND(     AVA__AVAAI_hot_lead__c = true,     OR(       Owner:User.UserRole.Name =&apos;SDR A&apos;,        Owner:User.UserRole.Name=&apos;SDR B&apos;,        Owner:User.UserRole.Name=&apos;SDR C&apos;,        Owner:User.UserRole.Name=&apos;SDR D&apos;      ),       NOT(ISPICKVAL(OpportunitySubType__c, &quot;MyLodge&quot;)),    TODAY() - 30 &lt;= DATEVALUE(AVA__AVAAI_hot_lead_date__c) )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Email Notifications for all Records Assigned out From the ACP Queue</fullName>
        <actions>
            <name>Email_Notifications_for_all_Records_Assigned_out_From_the_ACP_Queue</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>https://jira.avalara.com/browse/IBST-11333</description>
        <formula>AND(  Ischanged(OwnerId)=true,  priorvalue(OwnerId)=&quot;00G40000001nH1Y&quot;,
ISCHANGED( n2de__Action__c ) , 
ISPICKVAL(n2de__Action__c ,&quot;Assigned - SalesLoft&quot;)  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Email Opt Out %3D Cadence Stage Unsubscribed</fullName>
        <actions>
            <name>Cadence_Stage_Unsubscribed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.HasOptedOutOfEmail</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Excise Task - Create Task When Lead is Taken for ExciseRate%2Ecom</fullName>
        <actions>
            <name>New_Lead_Assigned_to_You</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <description>When new ExciseRates.com lead is distributed, created a task and assign it to the new Lead Owner</description>
        <formula>AND(ischanged(OwnerId)=true,priorvalue( OwnerId )=&quot;00G40000001oOLh&quot;,  ISPICKVAL(Lead_Source_Most_Recent__c,&quot;ExciseRates.com&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Excise Task - Offer - Free Rates</fullName>
        <actions>
            <name>Call_1_ExciseRates_Follow_Up</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.OpportunitySubType__c</field>
            <operation>equals</operation>
            <value>Excise</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Offer__c</field>
            <operation>equals</operation>
            <value>Free Rates</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>Creates a Task for the new Lead Owner when a Lead has an offer of Free rates and MRCD = Today</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Excise Task - Offer - Product offering</fullName>
        <actions>
            <name>Call_1_Excise_Product_Offering_Follow_Up</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.OpportunitySubType__c</field>
            <operation>equals</operation>
            <value>Excise</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Offer__c</field>
            <operation>equals</operation>
            <value>Product Offering</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>Creates a Task when Excise lead has an offer = Product Offering can MRCD = Today</description>
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
            <field>Lead.OpportunitySubType__c</field>
            <operation>equals</operation>
            <value>Excise</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Offer__c</field>
            <operation>contains</operation>
            <value>Referral</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>Creates a Task when Excise lead has an offer = Referral Program and MRCD = Today</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Excise Task - Offer -General Contact</fullName>
        <actions>
            <name>Call_1_Excise_Contact_Us_Form_Follow_Up</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.OpportunitySubType__c</field>
            <operation>equals</operation>
            <value>Excise</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Offer__c</field>
            <operation>equals</operation>
            <value>General Contact</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>Creates a Task for the new Lead Owner when a Lead is taken from the Excise Queue with offer = General Contact</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Fix Kentico Post - Account</fullName>
        <actions>
            <name>Fix_Date_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Fix_Kentico_Post_Accounting</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Partner_Category__c</field>
            <operation>contains</operation>
            <value>Account</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Fix Kentico Post - Developer</fullName>
        <actions>
            <name>Fix_Kentico_Post_Developer</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Partner_Category__c</field>
            <operation>startsWith</operation>
            <value>Develop</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Fix Kentico Post - Marketing</fullName>
        <actions>
            <name>Fix_Date_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Fix_marketing_lead</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Partner_Category__c</field>
            <operation>startsWith</operation>
            <value>Mark</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>GDPR Eligible</fullName>
        <actions>
            <name>GDPR_Eligible</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>https://jira.avalara.com/browse/ITBSE-1122?filter=-1</description>
        <formula>AND(GDPR_Eligible__c!=TRUE,   OR( UPPER(Country)=&quot;AT&quot;,UPPER(Country)=&quot;AUSTRIA&quot;, UPPER(Country)=&quot;BE&quot;,UPPER(Country)=&quot;BELGIUM&quot;, UPPER(Country)=&quot;BG&quot;,UPPER(Country)=&quot;BULGARIA&quot;, UPPER(Country)=&quot;HR&quot;,UPPER(Country)=&quot;CROATIA&quot;, UPPER(Country)=&quot;CY&quot;,UPPER(Country)=&quot;CYPRUS&quot;, UPPER(Country)=&quot;CZ&quot;,UPPER(Country)=&quot;CZECH REPUBLIC&quot;, UPPER(Country)=&quot;DK&quot;,UPPER(Country)=&quot;DENMARK&quot;, UPPER(Country)=&quot;EE&quot;,UPPER(Country)=&quot;ESTONIA&quot;, UPPER(Country)=&quot;FI&quot;,UPPER(Country)=&quot;FINLAND&quot;, UPPER(Country)=&quot;FR&quot;,UPPER(Country)=&quot;FRANCE&quot;, UPPER(Country)=&quot;DE&quot;,UPPER(Country)=&quot;GERMANY&quot;, UPPER(Country)=&quot;GR&quot;,UPPER(Country)=&quot;GREECE&quot;, UPPER(Country)=&quot;HU&quot;,UPPER(Country)=&quot;HUNGARY&quot;, UPPER(Country)=&quot;IE&quot;,UPPER(Country)=&quot;IRELAND&quot;, UPPER(Country)=&quot;IT&quot;,UPPER(Country)=&quot;ITALY&quot;, UPPER(Country)=&quot;LV&quot;,UPPER(Country)=&quot;LATVIA&quot;, UPPER(Country)=&quot;LT&quot;,UPPER(Country)=&quot;LITHUANIA&quot;, UPPER(Country)=&quot;LU&quot;,UPPER(Country)=&quot;LUXEMBOURG&quot;, UPPER(Country)=&quot;MT&quot;,UPPER(Country)=&quot;MALTA&quot;, UPPER(Country)=&quot;NL&quot;,UPPER(Country)=&quot;NETHERLANDS&quot;, UPPER(Country)=&quot;PL&quot;,UPPER(Country)=&quot;POLAND&quot;, UPPER(Country)=&quot;PT&quot;,UPPER(Country)=&quot;PORTUGAL&quot;, UPPER(Country)=&quot;RO&quot;,UPPER(Country)=&quot;ROMANIA&quot;, UPPER(Country)=&quot;SK&quot;,UPPER(Country)=&quot;SLOVAKIA&quot;, UPPER(Country)=&quot;SI&quot;,UPPER(Country)=&quot;SLOVENIA&quot;, UPPER(Country)=&quot;ES&quot;,UPPER(Country)=&quot;SPAIN&quot;, UPPER(Country)=&quot;SE&quot;,UPPER(Country)=&quot;SWEDEN&quot;, UPPER(Country)=&quot;GB&quot;,UPPER(Country)=&quot;UNITED KINGDOM&quot;, UPPER(Country)=&quot;UK&quot; ) )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Gemeral Partner Sign Up Routing</fullName>
        <actions>
            <name>New_Partner_Web_Sign_Up</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Partner_Registration_Confirmation</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Assign_to_Courtney</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Partner_Leadd_Opp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Partner_Opp_Sub_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Partner_Category__c</field>
            <operation>notEqual</operation>
            <value>,Partner.Category4</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>LSMR Change Date</fullName>
        <actions>
            <name>LSMR_Change_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( Lead_Source_Most_Recent__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Landed Cost - New Lead Notificaion</fullName>
        <actions>
            <name>Landed_Cost_New_Lead_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Interest_in_Products_Services__c</field>
            <operation>equals</operation>
            <value>Landed Cost</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Accepted in Portal Confirmation</fullName>
        <actions>
            <name>Lead_Accepted</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND( Portal_Contact__r.PNL_Lead_Accepted_Notification__c  = TRUE,  Portal_Lead_Status__c = &quot;Accepted&quot;,  Partner_Portal_Email__c &lt;&gt; &quot;&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Authority %282%29 Stamp</fullName>
        <actions>
            <name>Lead_Authority_2_stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Authority__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Used to copy authority field to authority (2) to allow mapping to contact</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Budget %282%29 Stamp</fullName>
        <actions>
            <name>Lead_Budget_2_stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Budget__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Used to copy budget field to budget (2) to allow mapping to contact</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Interest %282%29 stamp</fullName>
        <actions>
            <name>Lead_Interest_2_stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Interest__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Rejected in Portal Confirmation</fullName>
        <actions>
            <name>Portal_Lead_Rejected</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND( Portal_Contact__r.PNL_Lead_Rejected_Notification__c  = TRUE,  Portal_Lead_Status__c = &quot;Rejected&quot;,  Partner_Portal_Email__c &lt;&gt; &quot;&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Source FDC-dup-IN%7CAvalara AvaTax change to Partner - DSP</fullName>
        <actions>
            <name>Lead_Source_Change_to_Partner_DSP</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>equals</operation>
            <value>SFDC-dup-IN|Avalara AvaTax</value>
        </criteriaItems>
        <description>Purpose:FDC-dup-IN|Avalara AvaTaxLead source change to Partner - DSP</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Source change to Partner - ACP</fullName>
        <actions>
            <name>Lead_Source_to_Partner_ACP</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>equals</operation>
            <value>Partner - ASP</value>
        </criteriaItems>
        <description>Purpose:Partner - ASP Lead source change to Partner - ACP</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Source change to Partner - DSP</fullName>
        <actions>
            <name>Lead_Source_Change_to_Partner_DSP</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>equals</operation>
            <value>SFDC-IN|Avalara AvaTax</value>
        </criteriaItems>
        <description>Purpose:SFDC-IN|Avalara AvaTax Lead source change to Partner - DSP</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Sourch Jigsaw</fullName>
        <actions>
            <name>Lead_Source_to_Sales_Rep_Prospecting</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.LeadSource</field>
            <operation>equals</operation>
            <value>Jigsaw</value>
        </criteriaItems>
        <description>Purpose: Change Date.com Jigsaw Leads Source to Sales Rep Prospecting</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead Submission in Portal Confirmation</fullName>
        <actions>
            <name>Partner_Portal_Lead_Submitted</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(Portal_Contact__r.PNL_Lead_Submission_Notification__c = TRUE,  Partner_Portal_Email__c &lt;&gt; &quot;&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Lead%2FContact Status to MQL Date</fullName>
        <actions>
            <name>Lead_Contact_Status_to_MQL_Date_stamped</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Lead/Contact Status to MQL Date will be mapped to opportunity field.
https://jira.avalara.com/browse/ITBSE-706</description>
        <formula>AND (OR (ISNEW() ,ISCHANGED( Status )),  ISPICKVAL(Status,&quot;MQL&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Marketing Feedback Log Stamp</fullName>
        <actions>
            <name>Marketing_Feed_Back_Log_Stamp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR(

(AND(

ISNEW(),
NOT(ISBLANK( Marketing_Feedback_Notes__c)))),   

ISCHANGED( Marketing_Feedback_Notes__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>MyLodge Update Lead Channel</fullName>
        <actions>
            <name>MyLodge_Update_Lead_Channel</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Description</field>
            <operation>contains</operation>
            <value>__guidebook__</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MyLodge Update Lead Owner</fullName>
        <actions>
            <name>MyLodge_Update_Lead_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Lead_Channel__c</field>
            <operation>equals</operation>
            <value>guidebook</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>New EMEA  Lead - Task and Assignment notification email</fullName>
        <actions>
            <name>New_EMEA_Lead_Assignment_Notification</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>MISC_EMEA</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <formula>AND(  ISCHANGED(OwnerId)=true,  PRIORVALUE(OwnerId)=&quot;00G40000001oeVb&quot;,  NOT(  OR(  ISPICKVAL( Offer__c ,&quot;General Contact&quot;),  ISPICKVAL( Offer__c ,&quot;Product Offering&quot;),  ISPICKVAL( Offer__c ,&quot;Free Trial&quot;),  ISPICKVAL( Offer__c ,&quot;Referral Program&quot;)  )  )  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Partner Contact Updated 6 months before</fullName>
        <actions>
            <name>Channel_Partner_Name_Update_False</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Lead.Channel_Partner_Name_Update_6__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>This WF sends email to  pmm@avalara.com when If a Channel Partner name is populated on the lead record currently, and it was added less than 6 months before the form submit</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Partner Contact doesn%27t exists on Lead</fullName>
        <actions>
            <name>Partner_Contact_Not_Found_on_Lead</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>This WF sends email to  pmm@avalara.com when Partner_Rep_Email__c populated but matching contact dont exists</description>
        <formula>OR(AND(ISNEW(),Partner_Contact_Not_Found_Email_Sent__c==1),ISCHANGED(Partner_Contact_Not_Found_Email_Sent__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Partner Portal Lead Submitted</fullName>
        <actions>
            <name>Alert_Sales_Leads</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Lead_Source_Most_Recent__c</field>
            <operation>equals</operation>
            <value>Partner Lead Reg Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Partner_Portal_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Populate CDM Email Address</fullName>
        <actions>
            <name>Populate_CM_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Partner_Portal_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Reassign lead to Landed Cost queue</fullName>
        <actions>
            <name>Assign_to_LandedCost_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>existing leads with new landedCost marketing activity will be reassigned to the queue</description>
        <formula>AND( ISCHANGED( Most_Recent_Conversion_Date__c ),NOT( ISPICKVAL( Status , &quot;Working&quot;) ), Most_Recent_Conversion_Date__c = TODAY(), ISPICKVAL( OpportunitySubType__c , &quot;LandedCost&quot;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>SOHO Closed Lost Opp Revive</fullName>
        <actions>
            <name>Assign_Lead_to_Matt_Hammond</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Closed_Lost_Opp_Revive_Response</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Campaign_Most_Recent_ID__c</field>
            <operation>contains</operation>
            <value>7010b000000eLNTAA2,7010b000000eLNYAA2,7010b000000eLNdAAM</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>Leads owned by soho queue from campaign:
7010b000000eLNT
7010b000000eLNY
7010b000000eLNd
IBST 3404 Eileen hansen</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>SOHO Leads Active Buying Nurture Response</fullName>
        <actions>
            <name>Assign_Lead_to_Matt_Hammond</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Active_Buying_Nurture_Response</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Campaign_Most_Recent_ID__c</field>
            <operation>contains</operation>
            <value>70133000001UkRcAAK,70133000001UkRhAAK,70133000001UkRrAAK,70133000001UkRwAAK,70133000001UkS6AAK,70133000001UkSBAA0,70133000001UkSQAA0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Most_Recent_Conversion_Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>Leads owned by soho queue from campaign: 70133000001UkRc
70133000001UkRh
70133000001UkRr
70133000001UkRw
70133000001UkS6
70133000001UkSB
70133000001UkSQ
Assing to Matt Hammond</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Shadow LSMR</fullName>
        <actions>
            <name>Update_Hidden_LSMR</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.Lead_Source_Most_Recent__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>creates a shadow copy of the LSMR field to push to the opportunity.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Status Change Date - Stamp</fullName>
        <actions>
            <name>Lead_Status_Change_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Stamps the current date and time when a status is changed.</description>
        <formula>ISCHANGED(  Status )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Status Change Date - Working</fullName>
        <actions>
            <name>Status_Change_Date_Working</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( 
ISCHANGED( Status ),
OR(  
ISPICKVAL(Status, &quot;Working&quot;),
ISPICKVAL(Cadence_Stage__c, &quot;Working&quot;)) ,
NOT(
ISPICKVAL(Status, &quot;Converted &quot;)
) 
)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Trigger TrustFile Account Creation Outbound Message</fullName>
        <actions>
            <name>Create_TrustFile_Account</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.CreateTrustFileAccount__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TrustFile Bharat Partner Sign Up Routing</fullName>
        <actions>
            <name>TFB_Partner_Registration_Confirmation</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Route_Bharat_to_Yogesh</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Lead.ReferringQueryString__c</field>
            <operation>equals</operation>
            <value>type=4%2c&amp;aliaspath=%2fPartners%2fBecome-a-Partner</value>
        </criteriaItems>
        <criteriaItems>
            <field>Lead.Partner_Category__c</field>
            <operation>equals</operation>
            <value>Partner.Category4</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Event Opp Score</fullName>
        <actions>
            <name>Update_requested_a_demo</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.ISEvent_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Lead Source for Payroll</fullName>
        <actions>
            <name>Lead_Source_Payroll</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.FoundAvalaraBy__c</field>
            <operation>equals</operation>
            <value>Payroll</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>VendiSys Lead</fullName>
        <actions>
            <name>Most_Recent_Vendisys</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.CreatedById</field>
            <operation>contains</operation>
            <value>Connection User</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Webform Submittal Change Date Stamp</fullName>
        <actions>
            <name>Webform_Submittal_Changed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR( ISNEW() ,ISCHANGED( Webform_Submit_Date_Time__c ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Webinar Hold Queue - Return to master Queue</fullName>
        <actions>
            <name>Lead_Owner_back_to_AvaTax_Master_Queue</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>When the Webinar is complete, Heather will reroute uncheck via eloqua the Webinar hold queue checkbox to send leads back to Master queue.</description>
        <formula>AND(ISCHANGED( Most_Recent_Conversion_Date__c ),Most_Recent_Conversion_Date__c = Today(),  ISCHANGED( Eloqua_Webinar_Hold__c ), Eloqua_Webinar_Hold__c = False, Not( ISPICKVAL( Status , &quot;Working&quot;)  ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Working Status over 60 Days</fullName>
        <actions>
            <name>Nurture_reason_60_days</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Lead_to_Nurture</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Change the lead status to Nurture if it has been in the working stage for over 60 days</description>
        <formula>NOW() - Status_Change_Date_Working__c &gt; 61</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>iv__InsideView Outbound Rule for Leads</fullName>
        <actions>
            <name>iv__Lead_Outbound_Message</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <formula>CONTAINS($Setup.iv__InsideView_Notification_Enabler__c.iv__InsideView_Notification_Enabler__c, &quot;Lead.UPDATE&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>iv__InsideView Outbound Rule for New Leads</fullName>
        <actions>
            <name>iv__Lead_Outbound_Message</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <formula>CONTAINS($Setup.iv__InsideView_Notification_Enabler__c.iv__InsideView_Notification_Enabler__c, &quot;Lead.CREATE&quot;)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <tasks>
        <fullName>AASP_Lead_Please_follow_up</fullName>
        <assignedTo>ray.bigley@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AASP Lead: Please follow up</subject>
    </tasks>
    <tasks>
        <fullName>ACP_Asset_Download</fullName>
        <assignedToType>owner</assignedToType>
        <description>This lead downloaded an ACP Asset</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>ACP Asset Download</subject>
    </tasks>
    <tasks>
        <fullName>ACP_Event</fullName>
        <assignedToType>owner</assignedToType>
        <description>This Lead attended an ACP Event</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>ACP Event</subject>
    </tasks>
    <tasks>
        <fullName>ACP_List</fullName>
        <assignedToType>owner</assignedToType>
        <description>This Lead was acquired from a List buy</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>ACP List</subject>
    </tasks>
    <tasks>
        <fullName>ACT_trade_show_follow_up</fullName>
        <assignedToType>owner</assignedToType>
        <description>Attendees to the ACT conference and expo June 20, 2011.</description>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>ACT trade show follow up</subject>
    </tasks>
    <tasks>
        <fullName>AICPAContactFollowup</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please check for duplicates (merging any duplicate information found) and follow-up with this contact. This contact visited the booth at AICPA and are expecting follow-up.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AICPA Contact Follow-up</subject>
    </tasks>
    <tasks>
        <fullName>ASTCWebinar</fullName>
        <assignedToType>owner</assignedToType>
        <description>Attended ASTC Webinar</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>ASTC Webinar</subject>
    </tasks>
    <tasks>
        <fullName>A_new_Lead_has_been_assigned_to_you</fullName>
        <assignedToType>owner</assignedToType>
        <description>This may be a new Lead, or an existing one who has checked out something new.  Please click through to the associated Campaign to determine the details of Lead acquisition and discern the most effective approach to a follow up call.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>A new Lead has been assigned to you!</subject>
    </tasks>
    <tasks>
        <fullName>AberdeenLeads2010</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>14</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AberdeenLeads8.24.10</subject>
    </tasks>
    <tasks>
        <fullName>AberdeenSurvey2010</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>90</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AberdeenSurvey2010</subject>
    </tasks>
    <tasks>
        <fullName>AberdeenWhitepaperDownload</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This lead downloaded the Aberdeen whitepaper from the Microsoft conference-specific landing page. Please &quot;Find Duplicates&quot; to see if there are other matching records - then convert and assign.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Aberdeen Whitepaper Download</subject>
    </tasks>
    <tasks>
        <fullName>Account_insight_for_ERP_or_Ecomm</fullName>
        <assignedToType>owner</assignedToType>
        <description>Account insight for ERP or Ecomm</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Account insight for ERP or Ecomm</subject>
    </tasks>
    <tasks>
        <fullName>AccountingSymposiumFollowup</fullName>
        <assignedToType>owner</assignedToType>
        <description>Accounting Symposium lead.  For location of event see Additional Information.  This contact did not ask for specific information about Avalara so is a B lead.  Please follow up and check for duplicates.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Lead.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Accounting Symposium Followup</subject>
    </tasks>
    <tasks>
        <fullName>Active_Buying_Nurture_Response</fullName>
        <assignedTo>matthew.hammond@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please follow up.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Active Buying Nurture Response</subject>
    </tasks>
    <tasks>
        <fullName>AssignFollowupforAvaNewsLead</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Assign Followup for AvaNews Lead</subject>
    </tasks>
    <tasks>
        <fullName>AttendedAICPATech</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AttendedAICPATechShow2009</subject>
    </tasks>
    <tasks>
        <fullName>AttendedAvaFileWebinar</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AttendedAvaFileWebinar4.13.11</subject>
    </tasks>
    <tasks>
        <fullName>AttendedCertWebinar</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please assign this lead to the appropriate sales person.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AttendedCertWebinar</subject>
    </tasks>
    <tasks>
        <fullName>AttendedDynamicsWebinar</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AttendedDynamicsWebinar03.09.10</subject>
    </tasks>
    <tasks>
        <fullName>AttendedEcommerceWebinar_2_24_11</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AttendedEcommerceWebinar 4.21.11</subject>
    </tasks>
    <tasks>
        <fullName>AttendedEpicorshow2008MargaritaMachineleads</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Lead.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended Epicor show 2008 Margarita Machine leads</subject>
    </tasks>
    <tasks>
        <fullName>AttendedExemptionCertWebinar</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AttendedExemptionCertWeb.06.09.11</subject>
    </tasks>
    <tasks>
        <fullName>AttendedGeneralWebinar3409</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Lead.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AttendedGeneralWebinar3/4/09</subject>
    </tasks>
    <tasks>
        <fullName>AttendedGeneralWebinar_04_13_11</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AttendedGeneralWebinar_05.11.11</subject>
    </tasks>
    <tasks>
        <fullName>AttendedGoeCartWebinar</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AttendedGoeCartWebinar3.17.10</subject>
    </tasks>
    <tasks>
        <fullName>AttendedK2EsponsoredCPAevent</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended K2E sponsored CPA event</subject>
    </tasks>
    <tasks>
        <fullName>AttendedK2EsponsoredCPAeventDec</fullName>
        <assignedToType>owner</assignedToType>
        <description>Attended this event for CPE credits.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended K2E sponsored CPA event-Dec</subject>
    </tasks>
    <tasks>
        <fullName>AttendedMagentoWebinar2_24_10AttendedMagentoWebinar</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AttendedMagentoWebinar2.24.10</subject>
    </tasks>
    <tasks>
        <fullName>AttendedNetSuiteWebinar9_23_10</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended NetSuite Webinar 3.23.11</subject>
    </tasks>
    <tasks>
        <fullName>AttendedQuickBooksWebinar_3_22_11</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AttendedQuickBooksWebinar_6.14.11</subject>
    </tasks>
    <tasks>
        <fullName>AttendedResourcesWebinar_2_11_10</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AttendedResourcesWebinar_2.17.10</subject>
    </tasks>
    <tasks>
        <fullName>AttendedSageMAS500Webinar21109</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>5</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Lead.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended Sage MAS 500 Webinar 2.11.09</subject>
    </tasks>
    <tasks>
        <fullName>AttendedSageMAS500Webinar42209</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended Sage MAS 500 Webinar 4.22.09</subject>
    </tasks>
    <tasks>
        <fullName>AttendedSalesTaxComplianceWebinar12809</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AttendedSalesTaxComplianceWebinar1/28/09</subject>
    </tasks>
    <tasks>
        <fullName>AttendedShop_Org2011</fullName>
        <assignedToType>owner</assignedToType>
        <description>Attended Shop.org tradeshow</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AttendedShop.Org2011</subject>
    </tasks>
    <tasks>
        <fullName>AttendedTUGTradeshow31109</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended TUG Tradeshow 3.11.09</subject>
    </tasks>
    <tasks>
        <fullName>AttendedTrustfileWebinar</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended Trustfile Webinar</subject>
    </tasks>
    <tasks>
        <fullName>Attended_3DCart_webinar_6_21_11</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended 3DCart webinar 6.21.11</subject>
    </tasks>
    <tasks>
        <fullName>Attended_AICPA_show_please_follow_up</fullName>
        <assignedToType>owner</assignedToType>
        <description>Accountants show! Please provide info regarding AAP.</description>
        <dueDateOffset>4</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended AICPA show: please follow up</subject>
    </tasks>
    <tasks>
        <fullName>Attended_ASUG_8_4_10</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended ASUG 8.4.10</subject>
    </tasks>
    <tasks>
        <fullName>Attended_Cancelled_General_Webinar_5_12_2010</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please call to follow up - this prospect registered for a general webinar -  the webinar was canceled due to technical difficulties</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended Cancelled General Webinar 5.12.2010</subject>
    </tasks>
    <tasks>
        <fullName>Attended_Convergence_4_13_11</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended Convergence 4.13.11</subject>
    </tasks>
    <tasks>
        <fullName>Attended_Convergence_4_13_2011</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended Convergence 4.13.11</subject>
    </tasks>
    <tasks>
        <fullName>Attended_IRCE_2011_please_follow_up</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please look in the notes and additional information sections for information regarding this lead.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended IRCE 2011, submitted iPad entry</subject>
    </tasks>
    <tasks>
        <fullName>Attended_NatSol_UC_9_2_10</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended_Nat Sol UC 9_22.10</subject>
    </tasks>
    <tasks>
        <fullName>Attended_NetSuite_SuiteWorld_please_follow_up</fullName>
        <assignedTo>john.perri@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended NetSuite SuiteWorld, please follow up</subject>
    </tasks>
    <tasks>
        <fullName>Attended_PowerPlex_2011</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended PowerPlex 2011</subject>
    </tasks>
    <tasks>
        <fullName>Attended_SYSPRO_webinar</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended SYSPRO webinar</subject>
    </tasks>
    <tasks>
        <fullName>Attended_Sage_Prospect_Webinar_6_15_10</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended Sage Prospect Webinar 6_15_10</subject>
    </tasks>
    <tasks>
        <fullName>Attended_Sleeter_Group_Conference_2010</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>5</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended Sleeter Group Conference 2010</subject>
    </tasks>
    <tasks>
        <fullName>Attended_TAPN_Event_09_10</fullName>
        <assignedToType>owner</assignedToType>
        <description>Attended The Accounts Payable Network (TAPN) event that Mike Gardner spoke at.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended TAPN Event 09.10</subject>
    </tasks>
    <tasks>
        <fullName>Attended_WebEx_Webinar</fullName>
        <assignedTo>jessica.davis@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please look at the campaign history to see the webinar they had registered for.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended WebEx Webinar</subject>
    </tasks>
    <tasks>
        <fullName>Attended_Webinar10</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please look at the campaign name to see which webinar they attended!</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended Webinar</subject>
    </tasks>
    <tasks>
        <fullName>Attended_Webinar7</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please refer to the campaign name for more details.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended Webinar</subject>
    </tasks>
    <tasks>
        <fullName>Attended_a_tradeshow</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please look at the campaign name to see which tradeshow they attended!</description>
        <dueDateOffset>4</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended a tradeshow</subject>
    </tasks>
    <tasks>
        <fullName>Attended_a_tradeshow15</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please look to the campaign for details on the tradeshow!</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended a tradeshow</subject>
    </tasks>
    <tasks>
        <fullName>Attended_a_tradeshow2</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please look at the campaign history to see the webinar they had registered for!</description>
        <dueDateOffset>4</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended a tradeshow</subject>
    </tasks>
    <tasks>
        <fullName>Attended_a_tradeshow3</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>4</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended a tradeshow</subject>
    </tasks>
    <tasks>
        <fullName>Attended_a_tradeshow_please_follow_up</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please refer to campaign name for details.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Lead Assignment Direct To Sales</subject>
    </tasks>
    <tasks>
        <fullName>Attended_a_user_group</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please refer to campaign name for additional details.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended a user group</subject>
    </tasks>
    <tasks>
        <fullName>Attended_the_Practical_Ecommerce_webinar</fullName>
        <assignedToType>owner</assignedToType>
        <description>Attended Practical Ecommerce webinar. Has been assigned a subtype of SDK, but please ask if they are using a T2 e-commerce solution AND IF SO, please update the subtype and pass to appropriate sales rep.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended the Practical Ecommerce webinar</subject>
    </tasks>
    <tasks>
        <fullName>Attended_vCert_Webinar_3_17_2011</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended vCert Webinar 3.17.2011</subject>
    </tasks>
    <tasks>
        <fullName>AttendedaGeneralwebinar103008</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended a General webinar 10/30/08</subject>
    </tasks>
    <tasks>
        <fullName>AttendedtheAvataxwebinarforTrustfilecustomers81908</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please Check for duplicates</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Lead.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended the Avatax webinar for Trustfile customers 8/19/08</subject>
    </tasks>
    <tasks>
        <fullName>AttendedtheFloridaTradeshowbusinesscards</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Lead.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended the Florida Tradeshow, business cards</subject>
    </tasks>
    <tasks>
        <fullName>Attendee_AS400_Webinar_03_08_11</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Campaign.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attendee AS400 Webinar 03.08.11</subject>
    </tasks>
    <tasks>
        <fullName>Attendees_Magento_Tradeshow_02_09_1</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attendees_Magento_Tradeshow_02.09.11</subject>
    </tasks>
    <tasks>
        <fullName>Attending_Scaling_New_Heights</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attending Scaling New Heights</subject>
    </tasks>
    <tasks>
        <fullName>AvaCertWebinar</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendedAvaCertWebinar_9.22.10</subject>
    </tasks>
    <tasks>
        <fullName>AvaTax_Whitepaper_Queue</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AvaTax Whitepaper Queue</subject>
    </tasks>
    <tasks>
        <fullName>Business_Finance_Ad_W</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This lead downloaded &quot;Automation: A Company&apos;s Best Ally Against Sales Tax Audits&quot; white paper. Audience level is CFO, SVP, VP and company size will probably be Enterprise Level (Kevin McCarthy salesperson).</description>
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
        <description>Lead has made a General Contact Request.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>CC Call 1: General Contact Request</subject>
    </tasks>
    <tasks>
        <fullName>CDM_Follow_Up</fullName>
        <assignedToType>owner</assignedToType>
        <description>You&apos;ve accepted a Lead from the CDM Queue.  Please follow up with them as soon as possible.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>CDM Follow Up</subject>
    </tasks>
    <tasks>
        <fullName>Call_1_ExciseRates_Follow_Up</fullName>
        <assignedToType>owner</assignedToType>
        <description>Lead has made a Free Rates Request.</description>
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
        <description>Lead has made a General Contact Request.</description>
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
        <description>Lead has made a Product Offering Request.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call 1: Excise Product Offering Follow Up</subject>
    </tasks>
    <tasks>
        <fullName>Call_EZ_Lead_Rating_A_Reached</fullName>
        <assignedTo>shaun.rabe@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call: EZ Lead Rating A Reached</subject>
    </tasks>
    <tasks>
        <fullName>Call_EZ_Lead_Rating_B_Reached</fullName>
        <assignedTo>shaun.rabe@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call: EZ Lead Rating B Reached</subject>
    </tasks>
    <tasks>
        <fullName>Certs_Best_Practice_Webinar</fullName>
        <assignedToType>owner</assignedToType>
        <description>Lead registered but did not attend webex webinar on Exemption Certificate Best Practices.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Certs Best Practice Webinar</subject>
    </tasks>
    <tasks>
        <fullName>Certs_Best_Practices_Webinar_Attended</fullName>
        <assignedToType>owner</assignedToType>
        <description>Webinar registrant who ATTENDED the Exemption Certificate Best Practices webinar.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Certs Best Practices Webinar Attended</subject>
    </tasks>
    <tasks>
        <fullName>Certs_Webinar_Attendee</fullName>
        <assignedToType>owner</assignedToType>
        <description>These leads attended the certs webinar on June 23, 2011. Many had trouble with the visual and could be invited to attend another one, or be sent the white paper on certs automation, or be vetted for any of the AVaTax products.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Certs Webinar Attendee</subject>
    </tasks>
    <tasks>
        <fullName>Chat_Form_Contact_Us_Follow_up</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This contact filled out a contact us form tied to chat. Please check for duplicates and follow-up.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Chat Form Contact Us Follow-up</subject>
    </tasks>
    <tasks>
        <fullName>Closed_Lost_Opp_Revive_Response</fullName>
        <assignedTo>matthew.hammond@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please Follow Up</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Closed Lost Opp Revive Response</subject>
    </tasks>
    <tasks>
        <fullName>CommTaxRates_Registration_Follow_Up_See_Campaign_Name_for_details</fullName>
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
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
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
        <fullName>Completed_the_needs_assessment_survey_tool1</fullName>
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
        <fullName>ContactUsFormFollowup3</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This person submitted the Contact Us form hosted on Avalara&apos;s homepage. Please check for duplicates and follow up.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Contact Us Form Followup</subject>
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
        <fullName>Contact_Us_Form_Follow_up_from_Taxrates_com</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This contact submitted a contact us form on www.taxrates.com. Please check for duplicates and follow-up.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Contact Us Form Follow-up from Taxrates.com</subject>
    </tasks>
    <tasks>
        <fullName>Contact_Us_form_follow_up</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Contact Us form follow-up</subject>
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
        <fullName>Convergence2010</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Attended and visited booth at Convergence 2010</subject>
    </tasks>
    <tasks>
        <fullName>Did_not_attend_3DCart_webinar_6_21_11</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Did not attend 3DCart webinar 6.21.11</subject>
    </tasks>
    <tasks>
        <fullName>Did_not_attend_SYSPRO_webinar</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Did not attend SYSPRO webinar</subject>
    </tasks>
    <tasks>
        <fullName>Did_not_attend_a_webinar9</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please refer to the campaign name for more details.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Did not attend a webinar</subject>
    </tasks>
    <tasks>
        <fullName>DidnotAttendAvaTaxwebinaron121108</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Lead.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Did not Attend AvaTax webinar on 12/11/08</subject>
    </tasks>
    <tasks>
        <fullName>Direct_Selling_Contact_Form</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please check for duplicates and follow up.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Direct Selling Contact Form</subject>
    </tasks>
    <tasks>
        <fullName>Downloaded_Retail_Touch_Points_Whitepaper</fullName>
        <assignedToType>owner</assignedToType>
        <description>RTP white paper topic: States, Rates, and Debates: Sales Tax Complexities Simplified.  How retailers are working to make sense out of the tax rate roller coaster.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Downloaded Retail Touch Points Whitepaper</subject>
    </tasks>
    <tasks>
        <fullName>Downloaded_VAR_Star_Top_100_List_1_11_11</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Downloaded_VAR_Star_Top_100_List_1.11.11</subject>
    </tasks>
    <tasks>
        <fullName>DynamicsWeb</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>4</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendedDynamicsWeb3.09.10</subject>
    </tasks>
    <tasks>
        <fullName>ECi_Avalara_Webinar_Follow_Up</fullName>
        <assignedTo>david.west@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>ECi Avalara Webinar Follow Up</subject>
    </tasks>
    <tasks>
        <fullName>EZ_Call_General_Contact_Request</fullName>
        <assignedTo>shaun.rabe@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>You have a new lead, please follow up.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>EZ Call: General Contact Request</subject>
    </tasks>
    <tasks>
        <fullName>EZ_Call_Product_Offering_Request</fullName>
        <assignedTo>shaun.rabe@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>You have a new lead, please follow up.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>EZ Call: Product Offering Request</subject>
    </tasks>
    <tasks>
        <fullName>EZ_Call_Webinar_Attendee</fullName>
        <assignedToType>owner</assignedToType>
        <description>You have a new lead, please follow up. Please review lead record for Campaign and Webinar attendee details.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>EZ Call: Webinar Attendee</subject>
    </tasks>
    <tasks>
        <fullName>EpicorList</fullName>
        <assignedTo>david.west@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This is a contact provided in the Epicor list acquired by Erica. Please check for duplicates and call.</description>
        <dueDateOffset>15</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Epicor List</subject>
    </tasks>
    <tasks>
        <fullName>Epicor_Perspectives_2010_Attendee</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Epicor Perspectives 2010 Attendee</subject>
    </tasks>
    <tasks>
        <fullName>Event_Queue</fullName>
        <assignedToType>owner</assignedToType>
        <description>You&apos;ve taken ownership of this lead from the Event Queue. Please follow up with this Lead as soon as possible</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Event Queue Lead Assigned to You</subject>
    </tasks>
    <tasks>
        <fullName>Exemption_Certificate_White_Paper_download_follow_up</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Exemption Certificate White Paper download follow up</subject>
    </tasks>
    <tasks>
        <fullName>FilledoutaMargaritaMachinecard</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>6</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Lead.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Filled out a Margarita Machine card</subject>
    </tasks>
    <tasks>
        <fullName>Follow_up_from_NetSuite_Webinar_2_23_11</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow up from NetSuite Webinar 05.17.11</subject>
    </tasks>
    <tasks>
        <fullName>Follow_up_on_AvaRates_Subscriber</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This person just subscribed to AvaRates for free rate look-ups. Please review for duplicates. If not a customer or currently engaged, please follow-up to qualify for AvaTax or other solutions.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow-up on AvaRates Subscriber</subject>
    </tasks>
    <tasks>
        <fullName>Follow_up_on_Card_Scan_Attendee_ISP_Summit_2010</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow up on Card Scan_ Attendee ISP Summit 2010</subject>
    </tasks>
    <tasks>
        <fullName>Follow_up_on_Forums_Subscriber</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This person just subscribed to Forums for free access to our customer / support forums. Please review for duplicates. If not a customer or currently engaged, please follow-up to qualify for AvaTax or other solutions.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow-up on Forums Subscriber</subject>
    </tasks>
    <tasks>
        <fullName>Follow_up_with_Lead_from_Miscellaneous_Queue</fullName>
        <assignedToType>owner</assignedToType>
        <description>You&apos;ve taken ownership of this lead from the Miscellaneous Queue.  Please follow up with this Lead as soon as possible.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Misc. Queue Lead Assigned to You</subject>
    </tasks>
    <tasks>
        <fullName>Follow_up_with_Lead_who_filled_out_a_AvaRates_form</fullName>
        <assignedToType>owner</assignedToType>
        <description>You&apos;ve taken ownership of this lead from the AvaRates Queue.  Please follow up with this Lead as soon as possible.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>AvaRates</subject>
    </tasks>
    <tasks>
        <fullName>Follow_up_with_Lead_who_filled_out_a_Contact_Me_form</fullName>
        <assignedToType>owner</assignedToType>
        <description>You&apos;ve taken ownership of this lead from the Contact Me Queue.  Please follow up with this Lead as soon as possible.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Contact Me</subject>
    </tasks>
    <tasks>
        <fullName>Follow_up_with_QuickBooks_Demo_prospect</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow up with QuickBooks Demo prospect</subject>
    </tasks>
    <tasks>
        <fullName>Follow_up_with_this_Lead_from_the_the_OBTM_Queue</fullName>
        <assignedToType>owner</assignedToType>
        <description>This Lead was taken from the Outbound Telemarketing Queue. Please follow up with them accordingly.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow up with this Lead from the the OBTM Queue</subject>
    </tasks>
    <tasks>
        <fullName>Follow_up_with_this_Lead_from_the_the_Standby_Queue</fullName>
        <assignedToType>owner</assignedToType>
        <description>This Lead was taken from the Standby Queue.  Please follow up with them accordingly.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Standby</subject>
    </tasks>
    <tasks>
        <fullName>Forums_Contact_Me</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Forums Contact Me</subject>
    </tasks>
    <tasks>
        <fullName>Free_installation_offer_W</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>These leads came directly from a Bellwether ad and signed up for free installation and Gold support upon purchase of AvaTax. Sage users. Offer expires August 30. https://www.avalara.com/bellwether</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Free installation offer - W</subject>
    </tasks>
    <tasks>
        <fullName>G2WAttendee_011711</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>G2WAttendee_011711</subject>
    </tasks>
    <tasks>
        <fullName>IFA_Tradeshow_Leads_Please_follow_up</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>IFA Tradeshow Leads -- Please follow up</subject>
    </tasks>
    <tasks>
        <fullName>IPT_Trade_Show_Leads</fullName>
        <assignedToType>owner</assignedToType>
        <description>Attended the IPT trade show in June 2011. Audience includes those interested in all three AvaTax products.</description>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>IPT Trade Show Leads</subject>
    </tasks>
    <tasks>
        <fullName>ISPI_leads_09</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>ISPI leads 09</subject>
    </tasks>
    <tasks>
        <fullName>InforInviteWebCallList</fullName>
        <assignedToType>owner</assignedToType>
        <description>David, please call and invite to the Infor Webinar on June 19th.</description>
        <dueDateOffset>6</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>InforInviteWebCallList</subject>
    </tasks>
    <tasks>
        <fullName>InforLeads</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Lead.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Infor Leads</subject>
    </tasks>
    <tasks>
        <fullName>Infor_Certs_white_paper_download</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This lead downloaded the exemption certificate white paper &quot;Automating the Exemption Certifcate Lifecycle&quot;. Followup and 2nd email will go out to promote the next white paper within 10-14 days.</description>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Infor Certs white paper download</subject>
    </tasks>
    <tasks>
        <fullName>Intaactbusinesscards</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Intaact business cards</subject>
    </tasks>
    <tasks>
        <fullName>Intacct_Advantage_2010_Attendee</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Intacct Advantage 2010 Attendee</subject>
    </tasks>
    <tasks>
        <fullName>IntellExemptCertsWebinar</fullName>
        <assignedToType>owner</assignedToType>
        <description>Lead that did not attend Intelligent Exemption Certificate Management webinar.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>IntellExemptCertsWebinar</subject>
    </tasks>
    <tasks>
        <fullName>IntellExemptCertsWebinar_Attended</fullName>
        <assignedToType>owner</assignedToType>
        <description>Lead attended Intelligent Exemption Certificate Management webinar.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>IntellExemptCertsWebinar_Attended</subject>
    </tasks>
    <tasks>
        <fullName>Interested_in_Infinity_Partner_Program_BS_Insight_Mag</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please follow up. Interested in Infinity Partner Program</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Interested in Infinity Partner Program - BS Insight Mag</subject>
    </tasks>
    <tasks>
        <fullName>LMBCShowCardscannerleads</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Lead.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>LMBC Show Card scanner leads</subject>
    </tasks>
    <tasks>
        <fullName>LeadsfromOnlineMarketWorldTradeshow</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Leads from Online Market World Tradeshow</subject>
    </tasks>
    <tasks>
        <fullName>MISC_EMEA</fullName>
        <assignedToType>owner</assignedToType>
        <description>You&apos;ve taken ownership of this lead from the EMEA Queue. Please follow up with this Lead as soon as possible.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Lead.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New EMEA Lead - Follow-up</subject>
    </tasks>
    <tasks>
        <fullName>MSP_Potential_Partner_Lead</fullName>
        <assignedToType>owner</assignedToType>
        <description>You have been assigned a new MSP Lead, please follow up.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>MSP Potential Partner Lead</subject>
    </tasks>
    <tasks>
        <fullName>NACM_2011_Leads</fullName>
        <assignedToType>owner</assignedToType>
        <description>This rule is to assign the task to the lead owner/record owner in the spreadsheet.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NACM_2011_Leads</subject>
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
        <description>This lead downloaded the white paper by clicking through from an NACM banner ad. Offer the second white paper on Customer Relationship and Exempt Cert Mgt as follow up. Will follow up with webinar invite a week before webinar.</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NACM Banner Ad - Other</subject>
    </tasks>
    <tasks>
        <fullName>NACM_WP_Download_W_Aug</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Lead downloaded white paper from NACM banner ad.</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NACM WP Download - W - Aug</subject>
    </tasks>
    <tasks>
        <fullName>NRFTradeshow</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NRFTradeshow</subject>
    </tasks>
    <tasks>
        <fullName>NRFTradeshowFollowup</fullName>
        <assignedTo>andrea.anderson@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Add notes.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NRF Tradeshow Follow-up</subject>
    </tasks>
    <tasks>
        <fullName>NRFTradeshowList2</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NRF TradeshowList2</subject>
    </tasks>
    <tasks>
        <fullName>NavisionDirectionsLeadsAtlantaShow</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Lead.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Navision Directions Leads: Atlanta Show</subject>
    </tasks>
    <tasks>
        <fullName>NetsuitesContactForm</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Netsuites Contact Form</subject>
    </tasks>
    <tasks>
        <fullName>New_DemandZen_Appointment_follow_up</fullName>
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
        <fullName>New_DemandZen_Appointment_follow_up1</fullName>
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
        <fullName>New_DemandZen_Appointment_follow_up2</fullName>
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
        <fullName>New_DemandZen_Appointment_follow_up3</fullName>
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
        <fullName>New_EMEA_Lead_in_Queue</fullName>
        <assignedTo>jordan.grimwood@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>A New Lead has been assigned to the EMEA queue. Please follow up.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New EMEA Lead in Queue</subject>
    </tasks>
    <tasks>
        <fullName>New_Excise_Lead_Assigned_to_You</fullName>
        <assignedToType>owner</assignedToType>
        <description>You have a new Lead assigned to you from the Zytax Lead Queue.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New Excise Lead Assigned to You</subject>
    </tasks>
    <tasks>
        <fullName>New_Landed_Cost</fullName>
        <assignedToType>owner</assignedToType>
        <description>You have a new landed cost Lead. Please follow up.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New Landed Cost Lead Assigned to you</subject>
    </tasks>
    <tasks>
        <fullName>New_Lead_Assigned_to_You</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please follow up with new lead.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New Excise Rates Lead</subject>
    </tasks>
    <tasks>
        <fullName>New_Lead_Follow_Up</fullName>
        <assignedToType>owner</assignedToType>
        <description>You have received a new lead which requires immediate follow-up and a change of the lead status.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>High Priority Task - New Lead</subject>
    </tasks>
    <tasks>
        <fullName>New_Partner_ACP_Lead</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New Partner ACP Lead</subject>
    </tasks>
    <tasks>
        <fullName>New_RSM_Ecomm_Lead</fullName>
        <assignedToType>owner</assignedToType>
        <description>A new Ecomm Lead was created and routed to you today. 
Please follow up!</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New RSM Ecomm Lead</subject>
    </tasks>
    <tasks>
        <fullName>New_Returns_Lead</fullName>
        <assignedTo>bob.waite@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>The person responded to the Customer Returns Needs Assessment survey. Because the email was not already associated with the account, it could not automatically be assigned to the CAM. Please review and assign to CAM, or Inside Sales if not a customer.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>New Returns Lead</subject>
    </tasks>
    <tasks>
        <fullName>No_Show_WebEx_Webinar</fullName>
        <assignedTo>jessica.davis@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please look at the campaign history to see the webinar they had registered for.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>No Show to a Webinar</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendedAvaCert</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Lead.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendedAvaCertWebinar_3.3.11</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendedAvaFile</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendedAvaFileWebinar_1.26.11</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendedDynamicsWebinar</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendedDynamicsWebinar6.23.09</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendedEcommerceWebinar_2_24_11</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendedEcommerceWebinar_4.21.11</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendedEndToEndComplianceAvafileWebinar_11_16_10</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendedEndToEndComplianceAvafileWebinar_11.16.10</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendedGoeCartWebinar</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendedGoeCartWebinar3.17.2010</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendedMicrosoftDynamicsWebinar42309</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttended Microsoft Dynamics Webinar 4/23/09</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendedProServicesWebinar_5_13_10</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>4</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendedProServicesWebinar_5.13.10</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendedQuickBooksWebinar3509</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendedQuickBooksWebinar3/5/09</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendedQuickBooksWebinar_3_22_11</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendedQuickBooksWebinar_5.24.11</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendedSDKWebinar21809</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Lead.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendedSDK Webinar 2.18.09</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendedSageMAS90200</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendedSageMAS90/200Webinar8/18/09</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendedSalesTaxComplianceWebinar12809</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendedSalesTaxComplianceWebinar1/28/09</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendedSalesTaxMnmtWebinar11409</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Non Attended Sales Tax Mnmt Webinar 1/14/09</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendedStoneEdgeWebinar101309</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendedStoneEdgeWebinar101309</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendedTrustfileWebinar</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendedTrustfileWebinar</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendedTrustfileWebinar31109</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttended Trustfile Webinar 3.11.09</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendedTrustfileWebinar7_28_09</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendedTrustfileWebinar7/28/09</subject>
    </tasks>
    <tasks>
        <fullName>NonAttended_Practical_Ecommerce_webinar</fullName>
        <assignedToType>owner</assignedToType>
        <description>Attended Practical Ecommerce webinar. Has been assigned a subtype of SDK, but please ask if they are using a T2 e-commerce solution AND IF SO, please update the subtype and pass to appropriate sales rep.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttended Practical Ecommerce webinar</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendedvCertWebinar_3_17_10</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendedvCertWebinarForISPI&amp;TFCustomers_5.18.10</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendeesCertsWebinar</fullName>
        <assignedToType>owner</assignedToType>
        <description>These are individuals who attended the webinar--please assign to appropriate sales team members.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendeesCertsWebinar</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendeesGeneralWebinar_03_16_11</fullName>
        <assignedToType>owner</assignedToType>
        <description>These prospects that signed up but didn&apos;t attend our monthly  general webinar.  Please check for duplicates and assign if nec to the correct rep.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendeesGeneralWebinar_04.13.11</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendeesQBWebinar09_28_10</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendeesQBWebinar09.28.10</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendees_AG_Webinar_8510</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Non Attendees AG Webinar 8 5 10</subject>
    </tasks>
    <tasks>
        <fullName>NonAttendees_Aberdeen_Webinar_11_9_10</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Non Attendees Aberdeen Webinar 11.9.10</subject>
    </tasks>
    <tasks>
        <fullName>Non_AttendeeCertsWebinar</fullName>
        <assignedToType>owner</assignedToType>
        <description>Did not attend the 6-23-2011 certs webinar but expressed interest by signing up.</description>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Non-AttendeeCertsWebinar</subject>
    </tasks>
    <tasks>
        <fullName>Non_Attendees_Sage_Prospect_Webinar_07_22_10</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Non Attendees Sage Prospect Webinar 07.22.10</subject>
    </tasks>
    <tasks>
        <fullName>Non_Attendees_Sage_Prospect_Webinar_5_12_10</fullName>
        <assignedTo>clayton.wiggins@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendedSageWebinar 5_12_10</subject>
    </tasks>
    <tasks>
        <fullName>Non_attendees_vCert_Webinar_3_17_2011</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Non attendees vCert Webinar 3.17.2011</subject>
    </tasks>
    <tasks>
        <fullName>NotAttendedMagentoWebinar</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NotAttendedMagentoWebinar2.24.10</subject>
    </tasks>
    <tasks>
        <fullName>Outsourced_Telemarketing_Opportunity_Please_Follow_Up</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please refer to campaign name for additional details!</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Outsourced Telemarketing Opportunity, Please Follow Up</subject>
    </tasks>
    <tasks>
        <fullName>Participated_in_Marketing_Re_engagement_campaign</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please follow up and refer to campaign name for details.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Participated in Marketing Re-engagement campaign</subject>
    </tasks>
    <tasks>
        <fullName>PartnerLeadRegistrationFollowUp</fullName>
        <assignedToType>owner</assignedToType>
        <description>A Partner or a Sales Rep filled out the Partner Registration form on the website.  Please follow up with this Lead.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Partner Lead Registration Follow Up</subject>
    </tasks>
    <tasks>
        <fullName>Please_follow_up_https_www_avalara_com_br_campaign_response</fullName>
        <assignedToType>owner</assignedToType>
        <description>This lead has just been assigned to you from the Brazil Lead Queue.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Please follow up: https://www.avalara.com/br campaign response</subject>
    </tasks>
    <tasks>
        <fullName>Please_follow_up_with_Lead</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please refer to campaign name for details.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Lead.Birth_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Please follow up with Lead</subject>
    </tasks>
    <tasks>
        <fullName>PleasecallandthankFreeTrialCDCampaigncontact</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Lead.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>Please call and thank Free Trial CD Campaign contact</subject>
    </tasks>
    <tasks>
        <fullName>ProStoresWebinarFlashDownload</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This person downloaded the ProStores Flash Webinar. Please check for duplicates.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>ProStores Webinar Flash Download</subject>
    </tasks>
    <tasks>
        <fullName>ProStoresWhitepaperLead</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please check for duplicates and follow-up with this lead.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>ProStores Whitepaper Lead</subject>
    </tasks>
    <tasks>
        <fullName>QuickBooksLeadFollowup</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please check for duplicates and follow-up on QuickBooks leads.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>QuickBooks Lead Follow-up</subject>
    </tasks>
    <tasks>
        <fullName>QuickBooks_Partner_Webinar_8_24_10</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>QuickBooks Partner Webinar 8.24.10</subject>
    </tasks>
    <tasks>
        <fullName>RATES_queue_follow_up</fullName>
        <assignedToType>owner</assignedToType>
        <description>You&apos;ve taken ownership of this lead from the RATES Queue. Please follow up with this Lead as soon as possible.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>RATES queue follow up</subject>
    </tasks>
    <tasks>
        <fullName>Redirect_from_ACP_Team_to_Inside_Sales</fullName>
        <assignedToType>owner</assignedToType>
        <description>This Lead was redirected from the ACP Team to the Inside Sales Team</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Redirect from ACP Team to Inside Sales</subject>
    </tasks>
    <tasks>
        <fullName>Registered_for_a_partner_webinar</fullName>
        <assignedToType>owner</assignedToType>
        <description>please refer to the campaign name for details.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Registered/Attended a webinar</subject>
    </tasks>
    <tasks>
        <fullName>RegisteredbutdidnotattendTrusfilewebinar31908</fullName>
        <assignedTo>jonathan.giddens@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Registered but did not attend &quot;Trusfile webinar&quot;  3/19/08</subject>
    </tasks>
    <tasks>
        <fullName>Responded_to_a_Special_Offer</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please look at the campaign name to see which special offer they responded to.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Responded to a Special Offer</subject>
    </tasks>
    <tasks>
        <fullName>Responded_to_a_marketing_offer2</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Responded to a marketing offer</subject>
    </tasks>
    <tasks>
        <fullName>RetailNow_please_follow_up</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Pleas refer to campaign name for details.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>RetailNow: please follow up</subject>
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
        <fullName>RockNRaveGPUG2009</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>6</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>RockNRaveGPUG2009</subject>
    </tasks>
    <tasks>
        <fullName>SDK_Free_Trial_Form</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Submitted information on SDK Free Trial webpage.  Please check for duplicates and convert with opportunity as new sdk lead.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>SDK Free Trial Form</subject>
    </tasks>
    <tasks>
        <fullName>SE_Accounting_Show_Follow_up</fullName>
        <assignedToType>owner</assignedToType>
        <description>Possible AAP lead.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>SE Accounting Show Follow-up</subject>
    </tasks>
    <tasks>
        <fullName>SSTLeadssignedupforSSTbutnotforavalara</fullName>
        <assignedToType>owner</assignedToType>
        <description>The following Account has registered on the SST Registration system as a Model 1or 2 and has indicated your company as their CSP/CAS.  The have indicated the following information can be forwarded to your company.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Lead.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>SST Leads (signed up for SST, but not for avalara)</subject>
    </tasks>
    <tasks>
        <fullName>STSurvivalGuide_W</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Submitted form for the Sales Tax Survival Guide</subject>
    </tasks>
    <tasks>
        <fullName>Shoporg_Conference_Demandware_Promo_10_15_10</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Shop.org_Conference_Demandware_Promo_10.15.10</subject>
    </tasks>
    <tasks>
        <fullName>Signedupforaoneonone</fullName>
        <assignedToType>owner</assignedToType>
        <description>Please call and schedule a one on one before Oct 1st.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Lead.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Signed up for a one on one</subject>
    </tasks>
    <tasks>
        <fullName>Sleeter_Conference</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>F/USleeterConf.AAPprospects</subject>
    </tasks>
    <tasks>
        <fullName>SniperDynePartnerWeb60909</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>SniperDynePartnerWeb6/09/09</subject>
    </tasks>
    <tasks>
        <fullName>Submitted_a_form_to_download_an_Avalara_asset10</fullName>
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
        <fullName>Submitted_contact_form_after_viewing_newsletter_ad</fullName>
        <assignedToType>owner</assignedToType>
        <description>See newsletter ad here: https://www.avalara.com/LandingPages/newsletter-article-practicalecommerce</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Submitted contact form after viewing newsletter ad</subject>
    </tasks>
    <tasks>
        <fullName>Submitted_contact_form_for_X_Cart_shopping_cart1</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Submitted contact form for X-Cart shopping cart</subject>
    </tasks>
    <tasks>
        <fullName>Submitted_contact_form_from_Home_page_image</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Submitted contact form from Home page image</subject>
    </tasks>
    <tasks>
        <fullName>Submitted_contact_form_from_as1</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Submitted contact form from aspdotnetstorefront</subject>
    </tasks>
    <tasks>
        <fullName>Submitted_contact_form_on_AvaTax_com</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Submitted contact form on AvaTax.com</subject>
    </tasks>
    <tasks>
        <fullName>Submitted_contact_form_to_view_whitepaper1</fullName>
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
        <fullName>Submitted_contact_form_to_view_whitepaper2</fullName>
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
        <fullName>Submitted_form_for_APEX_SDK_Free_Trial_for_SF_com</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Submitted form for APEX SDK Free Trial for SF.com</subject>
    </tasks>
    <tasks>
        <fullName>Submitted_form_from_Website_Mag_to_get_whitepaper</fullName>
        <assignedToType>owner</assignedToType>
        <description>Retail Touch Points whitepaper: states, rates and debates: sales tax complexities simplified
highly qualified lead, collecting sales tax in more than one state and is interesting in automating sales tax compliance.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Submitted form: Website Magazine to get whitepaper</subject>
    </tasks>
    <tasks>
        <fullName>Submitted_form_to_view_RTP_whitepaper</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Retail Touch Points Whitepaper campaign</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Submitted form to view RTP whitepaper</subject>
    </tasks>
    <tasks>
        <fullName>Submitted_form_to_view_eCommerce_webinar</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Submitted form to view eCommerce webinar</subject>
    </tasks>
    <tasks>
        <fullName>TDCItradeshow</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Lead.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>TDCI tradeshow.</subject>
    </tasks>
    <tasks>
        <fullName>TapcoCaseStudyFormFollowup</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This person requested the Tapco case study hosted on Avalara&apos;s homepage.  Please check for duplicates and follow up.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Tapco Case Study Form Followup</subject>
    </tasks>
    <tasks>
        <fullName>TaxRates_Premium_Rates_Lead_Assignment</fullName>
        <assignedTo>mary.jensen@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>TaxRates Premium Rates Lead Assignment</subject>
    </tasks>
    <tasks>
        <fullName>Taxcient_Contact_Us_Form_Follow_up</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This contact completed a contact us form on the taxcient.com website. Please check for duplicates and follow-up.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Taxcient Contact Us Form Follow-up</subject>
    </tasks>
    <tasks>
        <fullName>Taxient_Webinar_Reingage_5_2010</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>30</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Taxient Webinar Reingage_5/2010</subject>
    </tasks>
    <tasks>
        <fullName>TechnologyIndustryCallList609</fullName>
        <assignedToType>owner</assignedToType>
        <description>IS2009Q200NOOCTECH  Andrea said to put the cam code  in the task so you can add to the account and or lead if an op is created. Thanks G</description>
        <dueDateOffset>7</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>TechnologyIndustryCallList6/09</subject>
    </tasks>
    <tasks>
        <fullName>TrustFile_Automated_Webinar</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>TrustFile Automated Webinar</subject>
    </tasks>
    <tasks>
        <fullName>TrustfileSurveyFollowup</fullName>
        <assignedTo>jonathan.giddens@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Trustfile customers that responded to survey.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Trustfile Survey Follow-up</subject>
    </tasks>
    <tasks>
        <fullName>VAItradeshowleads</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Lead.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>VAI tradeshow leads</subject>
    </tasks>
    <tasks>
        <fullName>WadestinationwebinarfromJuly08</fullName>
        <assignedToType>owner</assignedToType>
        <description>These people attended a webinar back in July when Wa changed to a destination based state for tax ability. Please re-qualify them and invite to a webinar or get a one on one.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Wa destination webinar from July 08</subject>
    </tasks>
    <tasks>
        <fullName>WebsiteContactForm</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Website Contact Form</subject>
    </tasks>
    <tasks>
        <fullName>WhitepaperDownloadLeadFollowup</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Please review the campaign ID, check for duplicates and follow-up on this  lead.</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Whitepaper Download Lead Follow-up</subject>
    </tasks>
    <tasks>
        <fullName>Whitepaper_Download</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
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
        <fullName>attended_CyrCon_user_conference_4_7_10</fullName>
        <assignedTo>clayton.wiggins@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>attended CyrCon user conference 4/7/10</subject>
    </tasks>
    <tasks>
        <fullName>attended_general_webinar_on_0414</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>attended general webinar on 0414</subject>
    </tasks>
    <tasks>
        <fullName>attended_sage_webinaron0421</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>attended_sage_webinar on 0421</subject>
    </tasks>
    <tasks>
        <fullName>bal</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>bal</subject>
    </tasks>
    <tasks>
        <fullName>eCommerceWhitepaperDownload</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>This lead downloaded the eCommerce whitepaper. Please &quot;Find Duplicates&quot; to see if there are other matching records. Then call, inviting to an upcoming eCommerce webinar or set an appointment for the corporate reps.</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>eCommerce Whitepaper Download</subject>
    </tasks>
    <tasks>
        <fullName>eMedia_Sales_Tax_Mangement_Survey_2_23_11</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>eMedia_Sales_Tax_Management_Survey_2.23.11</subject>
    </tasks>
    <tasks>
        <fullName>nonattendee_sage_reseller_webinar_on_0421</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>NonAttendedSageWebinar0421</subject>
    </tasks>
    <tasks>
        <fullName>submitted_contact_form_for_QB_Survival_Guide6</fullName>
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
        <fullName>submitted_form_to_view_a_whitepaper6</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>submitted form to view a whitepaper</subject>
    </tasks>
    <tasks>
        <fullName>submitted_form_to_view_recorded_practical_ecommerce_webinar2</fullName>
        <assignedTo>cathleen.wellbrock@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>submitted form to view recorded practical ecommerce webinar</subject>
    </tasks>
</Workflow>
