<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Alert_CDM_of_New_Campaign</fullName>
        <description>Alert CDM of New Campaign</description>
        <protected>false</protected>
        <recipients>
            <field>CDM__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>PPM__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Campaign_Notifications/New_Campaign_Created</template>
    </alerts>
    <alerts>
        <fullName>New_Tradeshow_Campaign_created</fullName>
        <description>New Tradeshow Campaign created</description>
        <protected>false</protected>
        <recipients>
            <recipient>megan.mitchell@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>yvonne.lunceford@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Campaign_Notifications/New_Tradeshow_Campaign_Created</template>
    </alerts>
    <alerts>
        <fullName>Notify_CDM_and_MM_Campaign_is_still_set_to_Planned</fullName>
        <description>Notify CDM and MM Campaign is still set to Planned</description>
        <protected>false</protected>
        <recipients>
            <field>MarketingManagerEmail__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>CDM__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Campaign_Notifications/Notify_CDM_and_MM_to_update_Campaign_Status</template>
    </alerts>
    <alerts>
        <fullName>Notify_CDM_and_MM_of_Campaign_Start_Date_Today</fullName>
        <description>Notify CDM and MM of Campaign Start Date = Today</description>
        <protected>false</protected>
        <recipients>
            <field>MarketingManagerEmail__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>CDM__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>PPM__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Campaign_Notifications/Campaign_Start_Date_Notification</template>
    </alerts>
    <alerts>
        <fullName>Notify_Marketing_Manager_of_CDM_Campaign_Creation</fullName>
        <description>Notify Marketing Manager of CDM Campaign Creation</description>
        <protected>false</protected>
        <recipients>
            <recipient>kael.kelly@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Campaign_Notifications/Notify_Robin_Conner_of_CDM_Campaign_Creation</template>
    </alerts>
    <alerts>
        <fullName>Notify_Robin_Conner_of_CDM_Campaign_Creation</fullName>
        <description>Notify Robin Conner of CDM Campaign Creation</description>
        <protected>false</protected>
        <recipients>
            <recipient>kael.kelly@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Campaign_Notifications/Notify_Robin_Conner_of_CDM_Campaign_Creation</template>
    </alerts>
    <alerts>
        <fullName>Send_2_week_notice_of_Campaign_Start_Date</fullName>
        <description>Send 2 week notice of Campaign Start Date</description>
        <protected>false</protected>
        <recipients>
            <field>MarketingManagerEmail__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>CDM__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>PPM__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Campaign_Notifications/Upcoming_Campaign_2_week_notice</template>
    </alerts>
    <alerts>
        <fullName>Send_notification_to_CDM_to_follow_up_with_Partner_after_Campaign</fullName>
        <description>Send notification to CDM to follow up with Partner after Campaign</description>
        <protected>false</protected>
        <recipients>
            <field>CDM__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>PPM__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Campaign_Notifications/Partner_Campaign_Follow_Up</template>
    </alerts>
    <alerts>
        <fullName>radeshow_Registered_Alert</fullName>
        <description>radeshow Registered Alert</description>
        <protected>false</protected>
        <recipients>
            <field>CDM__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>CampaignMarketingManager2__c</field>
            <type>userLookup</type>
        </recipients>
        <recipients>
            <field>PPM__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Campaign_Notifications/Trade_Show_Registered</template>
    </alerts>
    <fieldUpdates>
        <fullName>End_Date_Update</fullName>
        <field>EndDate</field>
        <formula>StartDate</formula>
        <name>End Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Populate_AMC_Description_on_Child_Campai</fullName>
        <field>AMCDescription__c</field>
        <formula>Parent.AMCDescription__c</formula>
        <name>Populate AMC Description on Child Campai</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Active_to_True</fullName>
        <field>IsActive</field>
        <literalValue>1</literalValue>
        <name>Set Active to True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Campaign_Status_to_Completed</fullName>
        <field>Status</field>
        <literalValue>Completed</literalValue>
        <name>Set Campaign Status to Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Campaign_Type</fullName>
        <description>Set Campaign Type = Tradeshow</description>
        <field>Type</field>
        <literalValue>Tradeshow</literalValue>
        <name>Set Campaign Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Tradeshow_PBP_Campaign_Update</fullName>
        <description>Changes record type to Tradeshow</description>
        <field>RecordTypeId</field>
        <lookupValue>TradeshowType</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Tradeshow PBP Campaign Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Campaign_Type</fullName>
        <description>Update Campaign Type to equal User Group</description>
        <field>Type</field>
        <literalValue>User Group (UG)</literalValue>
        <name>Update Campaign Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Short_Description</fullName>
        <field>Short_Description__c</field>
        <formula>LEFT(Description,150)</formula>
        <name>Update Short Description</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status</fullName>
        <description>Updates the Status to match the value of the Status Updater field</description>
        <field>Status</field>
        <literalValue>In Progress</literalValue>
        <name>Update Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <flowActions>
        <fullName>Inherit_Parent_Campaign_values_on_Child</fullName>
        <flow>Inherit_Parent_Campaign_values_on_Child</flow>
        <flowInputs>
            <name>CType</name>
            <value>{!Parent.Type}</value>
        </flowInputs>
        <flowInputs>
            <name>CampaignID</name>
            <value>{!Id}</value>
        </flowInputs>
        <flowInputs>
            <name>MM</name>
            <value>{!Parent.Marketing_Manager__c}</value>
        </flowInputs>
        <flowInputs>
            <name>MMEmail</name>
            <value>{!Parent.MMEmailFormula__c}</value>
        </flowInputs>
        <label>Inherit Parent Campaign values on Child</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <flowActions>
        <fullName>Populate_CDM_on_Campaign_from_Partner_Account</fullName>
        <flow>Populate_CDM_on_Campaign_from_Partner_Account</flow>
        <flowInputs>
            <name>CampaignID</name>
            <value>{!Id}</value>
        </flowInputs>
        <flowInputs>
            <name>PPMID</name>
            <value>{!PartnerAccount__r.Secondary_CDM__r.Id}</value>
        </flowInputs>
        <flowInputs>
            <name>PrimaryCDMID</name>
            <value>{!PartnerAccount__r.CDM__r.Id}</value>
        </flowInputs>
        <label>Populate CDM on Campaign from Partner Account</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <rules>
        <fullName>Add Short Description</fullName>
        <actions>
            <name>Update_Short_Description</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( Description )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Alert CDM and MM to execute Campaign</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.EndDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign.Status</field>
            <operation>equals</operation>
            <value>Planned</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Notify_CDM_and_MM_Campaign_is_still_set_to_Planned</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Campaign.EndDate</offsetFromField>
            <timeLength>-1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>End Date Equals Start Date If not Populated</fullName>
        <actions>
            <name>End_Date_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.EndDate</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign.StartDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Notify Elle Heinen of CDM Campaign Creation</fullName>
        <actions>
            <name>Notify_Marketing_Manager_of_CDM_Campaign_Creation</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Campaign.CreatedById</field>
            <operation>equals</operation>
            <value>Liz Anderson,Joni Burchett,Kristen Roeter,Kelleigh Tegels Nelson,Amiee Keenan,Terry Carlton,Whitney Williams</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Notify Robin Conner of CDM Campaign Creation</fullName>
        <actions>
            <name>Notify_Robin_Conner_of_CDM_Campaign_Creation</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Campaign.CreatedById</field>
            <operation>equals</operation>
            <value>Mike Alpert,Asher Matthew,Matthew Kantelis,Patty Loessberg</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Populate AMC Description on Child Campaign</fullName>
        <actions>
            <name>Populate_AMC_Description_on_Child_Campai</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.ParentId</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign.AMCDescription__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Populate CDM on Campaign from Partner Account</fullName>
        <actions>
            <name>Populate_CDM_on_Campaign_from_Partner_Account</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <formula>OR(
AND(ISCHANGED(PartnerAccount__c),NOT(ISBLANK( PartnerAccount__c ))),
ISCHANGED(PartnerAccount__c),
AND(NOT(ISBLANK(PartnerAccount__c)),OR(ISBLANK( CDM__c ), ISBLANK(PPM__c)) ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Populate Marketing Manager</fullName>
        <actions>
            <name>Inherit_Parent_Campaign_values_on_Child</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.ParentId</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Set Campaign Status to Completed after End Date</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.EndDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign.Status</field>
            <operation>notEqual</operation>
            <value>Completed,Aborted,Planned</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Set_Campaign_Status_to_Completed</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Campaign.EndDate</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Set Campaign to Active</fullName>
        <actions>
            <name>Set_Active_to_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.IsActive</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Tradeshow Campaign - Newly Created</fullName>
        <actions>
            <name>New_Tradeshow_Campaign_created</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.RecordTypeId</field>
            <operation>equals</operation>
            <value>Tradeshow</value>
        </criteriaItems>
        <description>Notification sent to Marketing - (Yvonne &amp; Megan) that a new Tradeshow campaign was created.
Integrated: No
Marketing/Partner Programs: requested by Liz Anderson for Yvonne &amp; Megan</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Tradeshow PBP EVent Campaign Update</fullName>
        <actions>
            <name>Tradeshow_PBP_Campaign_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.PBP_Event_ID__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign.Type</field>
            <operation>equals</operation>
            <value>Tradeshow,User Group</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Tradeshow Registered Alert</fullName>
        <actions>
            <name>radeshow_Registered_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.Attending__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Trigger CDM Campaign Notifications</fullName>
        <actions>
            <name>Alert_CDM_of_New_Campaign</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.CDM__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign.StartDate</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Campaign.PBP_Ready__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_2_week_notice_of_Campaign_Start_Date</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Campaign.StartDate</offsetFromField>
            <timeLength>-14</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Notify_CDM_and_MM_of_Campaign_Start_Date_Today</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Campaign.StartDate</offsetFromField>
            <timeLength>0</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Send_notification_to_CDM_to_follow_up_with_Partner_after_Campaign</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Campaign.EndDate</offsetFromField>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>UpdateStatus</fullName>
        <actions>
            <name>Update_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update the Campaign Status based on Today&apos;s date, the Start Date, and the End Date</description>
        <formula>AND(ischanged( StatusUpdater__c )=true,StatusUpdater__c = &quot;In Progress&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
