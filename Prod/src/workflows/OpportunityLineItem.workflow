<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Avalara_Account_Purchase_Alert</fullName>
        <description>Avalara Account Purchase Alert</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <recipient>aaron.zapf@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>april.spence@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>greg.chapman@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kevin.hippert@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>marshal.kushniruk@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>thomas.plaster@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Avalara_Account_Purchase_Alert</template>
    </alerts>
    <alerts>
        <fullName>CAM_Online_Sales_Ding</fullName>
        <description>CAM Online Sales Ding</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Opportunity/CAM_Online_Buy_Ding</template>
    </alerts>
    <alerts>
        <fullName>Cloud_Connect_Quote_Event</fullName>
        <description>Cloud Connect Quote Event</description>
        <protected>false</protected>
        <recipients>
            <recipient>liz.armbruester@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mark.giddens@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mark.janzen@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>spencer.james@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Cloud_Connect_Quote_Alert</template>
    </alerts>
    <alerts>
        <fullName>Need_Booked</fullName>
        <description>Need Booked Value Update for Additional Pro Services</description>
        <protected>false</protected>
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
        <recipients>
            <recipient>tyler.flora@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Need_Booked_Value_Update_for_Additional_Pro_Services</template>
    </alerts>
    <alerts>
        <fullName>Quickstart_add_on_alert</fullName>
        <description>Quickstart add on alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>melissa.davis@avalara.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Quickstart_Addon_Order_Alert</template>
    </alerts>
    <fieldUpdates>
        <fullName>Asset_Created</fullName>
        <field>Converted_to_Asset__c</field>
        <literalValue>1</literalValue>
        <name>Asset Created</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Avalara_Returns</fullName>
        <field>ProductFamily__c</field>
        <formula>&quot;Avalara Returns&quot;</formula>
        <name>Avalara Returns</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Avalara_TrustFile_Family</fullName>
        <field>ProductFamily__c</field>
        <formula>&quot;Avalara TrustFile&quot;</formula>
        <name>Avalara TrustFile Family</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Bigcommerce_Enterprise_Returns_Effective</fullName>
        <field>EffectivePrice__c</field>
        <formula>CPQ_Quantity__c * 35</formula>
        <name>Bigcommerce Enterprise Returns Effective</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Bigcommerce_Enterprise_Returns_TotalPric</fullName>
        <field>TotalPrice__c</field>
        <formula>CPQ_Quantity__c * 35</formula>
        <name>Bigcommerce Enterprise Returns TotalPric</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Bigcommerce_Enterprise_Returns_Usage_Pri</fullName>
        <field>UsagePrice__c</field>
        <formula>35</formula>
        <name>Bigcommerce Enterprise Returns Usage Pri</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Contains_Negative_Discount_on_Opp</fullName>
        <field>ContainsNegativeDiscountModel__c</field>
        <literalValue>1</literalValue>
        <name>Check Contains Negative Discount on Opp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>OpportunityId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_is_Returns</fullName>
        <field>Is_Returns__c</field>
        <literalValue>1</literalValue>
        <name>Check is Returns</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cloud_Craze_Quantity</fullName>
        <field>CPQ_Quantity__c</field>
        <formula>Case( EffectivePrice__c ,5.00,250, 50.00, 250, 9.00, 500, 95.00, 500, 18.00, 1500, 200.00, 1500, 1)</formula>
        <name>Cloud Craze Quantity</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cloud_Craze_Total_Price</fullName>
        <field>TotalPrice__c</field>
        <formula>EffectivePrice__c * 12</formula>
        <name>Cloud Craze Total Price</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Default_End_of_Agreement_Behavior_Update</fullName>
        <field>End_of_Agreement_Behavior__c</field>
        <formula>IF( PriceFormat__c = &quot;OneTime&quot;, &quot;Terminate&quot;, &quot;Renew at catalog pricing&quot;)</formula>
        <name>Default End of Agreement Behavior Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FAB_Usage_Override_TRUE</fullName>
        <field>FAB_Usage_Override__c</field>
        <literalValue>1</literalValue>
        <name>FAB Usage Override = TRUE</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Force_AddOn_SubType</fullName>
        <field>SubType__c</field>
        <literalValue>AddOn</literalValue>
        <name>Force AddOn SubType</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>OpportunityId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Force_Quantity_1</fullName>
        <field>Quantity</field>
        <formula>1</formula>
        <name>Force Quantity 1</name>
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
        <targetObject>OpportunityId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Is_Activation_Update</fullName>
        <field>Is_Activation__c</field>
        <literalValue>1</literalValue>
        <name>Is Activation Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Is_Royalty_Update</fullName>
        <field>Is_Royalty__c</field>
        <literalValue>1</literalValue>
        <name>Is Royalty Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lock</fullName>
        <field>Line_Item_Locked__c</field>
        <literalValue>1</literalValue>
        <name>Lock Line Item</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Maintain_Exist_Rate_Plan_ID</fullName>
        <field>RPId__c</field>
        <formula>PRPId__c</formula>
        <name>Maintain Exist Rate Plan ID</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Make_Effective_Price_a_Positive_Value</fullName>
        <field>EffectivePrice__c</field>
        <formula>IF( EffectivePrice__c &lt; 0,EffectivePrice__c * -1,EffectivePrice__c)</formula>
        <name>Make Effective Price a Positive Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Make_Sales_Price_a_Positive_Value</fullName>
        <field>UnitPrice</field>
        <formula>IF( UnitPrice&lt; 0,UnitPrice* -1,UnitPrice)</formula>
        <name>Make Sales Price a Positive Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Make_Total_Price_a_Positive_Value</fullName>
        <field>TotalPrice__c</field>
        <formula>IF( TotalPrice&lt;0,TotalPrice * -1, TotalPrice)</formula>
        <name>Make Total Price a Positive Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>PSA_Set_IsServices_Flag_On_Opp_Products</fullName>
        <field>pse__IsServicesProductLine__c</field>
        <literalValue>1</literalValue>
        <name>PSA Set IsServices Flag On Opp Products</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Remove_Native_Discount</fullName>
        <field>Discount</field>
        <formula>0</formula>
        <name>Remove Native Discount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Returns_Act_Fee</fullName>
        <field>Returns_Activation_Fee__c</field>
        <formula>TotalPrice</formula>
        <name>Returns Act Fee</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>OpportunityId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Returns_Estimate</fullName>
        <field>Returns_Estimate__c</field>
        <formula>Case( Product2.PriceLevel__c ,&quot;15R&quot;,868,&quot;40R&quot;,1311,&quot;100R&quot;,5090.80,&quot;360R&quot;,8982.20,&quot;360+R&quot;,16581.36
,&quot;1000R&quot;,16581.36,5090.80)</formula>
        <name>Returns Estimate</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Self_Serve_Connector_Count</fullName>
        <field>Self_Serve_Connector_Count__c</field>
        <formula>IF( TEXT(ConnectorID__r.Default_Self_Serve__c) = &quot;Self-Serve&quot;, 1, 0)</formula>
        <name>Self Serve Connector Count</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Effective_Price_to_Total_Price</fullName>
        <field>EffectivePrice__c</field>
        <formula>TotalForQuote__c</formula>
        <name>Set Effective Price to Total Price</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Price_Format_to_Flat_Fee</fullName>
        <field>PriceFormat__c</field>
        <formula>&quot;Flat Fee&quot;</formula>
        <name>Set Price Format to Flat Fee</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Sales_Priceto_0</fullName>
        <description>Sets Sales Price to $0 when a Royalty Item is added as a Product to an Opportunity</description>
        <field>UnitPrice</field>
        <formula>0</formula>
        <name>Set Sales Priceto 0</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Setup_Fee_on_Opportunity_Product</fullName>
        <field>One_Time_Set_up__c</field>
        <formula>Product2.One_time_Setup_Fee__c</formula>
        <name>Set Setup Fee on Opportunity Product</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Suppress_PDF_Price</fullName>
        <field>Suppress_PDF_Price__c</field>
        <literalValue>1</literalValue>
        <name>Set Suppress PDF Price</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>StampPre_PurchasedReturnsQuantity</fullName>
        <field>PrePurchasedReturnsQuantity__c</field>
        <formula>CPQ_Quantity__c</formula>
        <name>Stamp Pre-Purchased Returns Quantity</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>OpportunityId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Alert_Complete</fullName>
        <field>Alert_Complete_Cloud_Connect__c</field>
        <literalValue>1</literalValue>
        <name>Stamp Alert Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>OpportunityId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_AvaTax</fullName>
        <field>ProductFamily__c</field>
        <formula>&quot;Avalara AvaTax&quot;</formula>
        <name>Stamp AvaTax</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Connector_Level_Formula</fullName>
        <description>https://jira.avalara.com/browse/BATS-428</description>
        <field>Connector_Level_Number__c</field>
        <formula>Connector_Level_Formula__c</formula>
        <name>Stamp Connector Level Formula</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Effective_Change</fullName>
        <field>Effective_Stamp__c</field>
        <formula>NOW()</formula>
        <name>Stamp Effective Change</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_FAB_Exclusion_True</fullName>
        <field>FAB_Exclusion__c</field>
        <literalValue>1</literalValue>
        <name>Stamp FAB Exclusion True</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Needs_Finance_Product_1</fullName>
        <field>Needs_Finance_Product__c</field>
        <formula>1</formula>
        <name>Stamp Needs Finance Product 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Non_Annual_Drop</fullName>
        <description>Updated formula per: https://jira.avalara.com/browse/IBST-7444</description>
        <field>UnitPrice</field>
        <formula>CASE(
TEXT( BillingFrequency__c), &quot;Monthly&quot;, EffectivePrice__c *12*1.1, 
&quot;Quarterly&quot;,EffectivePrice__c *4*1.05, 
&quot;Semi-Annual&quot;,EffectivePrice__c *2,EffectivePrice__c)</formula>
        <name>Stamp Non Annual Drop</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_PS_MS_Item</fullName>
        <field>PS_MS_Item_Flag__c</field>
        <literalValue>1</literalValue>
        <name>Stamp PS/MS Item</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Premier_ACP_Partner_Product</fullName>
        <description>https://jira.avalara.com/browse/BATS-480</description>
        <field>Premier_ACP_Partner_Product__c</field>
        <literalValue>1</literalValue>
        <name>Stamp Premier ACP Partner Product</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Prev_Value</fullName>
        <field>Effective_Prev_Value__c</field>
        <formula>PRIORVALUE( EffectivePrice__c )</formula>
        <name>Stamp Prev Value</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Product_Class_Formula</fullName>
        <field>Product_Class_Number__c</field>
        <formula>Product_Class_Formula__c</formula>
        <name>Stamp Product Class Formula</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Product_Family_AvaTax_CC</fullName>
        <field>ProductFamily__c</field>
        <formula>&quot;Avalara AvaTax&quot;</formula>
        <name>Stamp Product Family AvaTax CC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Product_Family_Returns_CC</fullName>
        <field>ProductFamily__c</field>
        <formula>&quot;Avalara Returns&quot;</formula>
        <name>Stamp Product Family Returns CC</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Registration_Non_Fiscal</fullName>
        <field>Description</field>
        <formula>&quot;EU VAT Registration - No Fiscal Representation&quot;</formula>
        <name>Stamp Registration Non Fiscal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Remove</fullName>
        <field>AmendmentType__c</field>
        <literalValue>RemoveProduct</literalValue>
        <name>Stamp Remove</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Returns_Fiscal</fullName>
        <field>Description</field>
        <formula>&quot;EU VAT Returns - Fiscal Representation required&quot;</formula>
        <name>Stamp Returns Fiscal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Returns_NoFiscal</fullName>
        <field>Description</field>
        <formula>&quot;EU VAT Return - No Fiscal Representation&quot;</formula>
        <name>Stamp Returns NoFiscal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Sales_Price_0</fullName>
        <field>UnitPrice</field>
        <formula>0</formula>
        <name>Stamp Sales Price 0</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_TAS_Item</fullName>
        <field>TAS_Item_Flag__c</field>
        <literalValue>1</literalValue>
        <name>Stamp TAS Item</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Add_on_Professional_Services</fullName>
        <field>BookedValue__c</field>
        <formula>UnitPrice</formula>
        <name>Update Add on: Professional Services</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Deposit_Amount</fullName>
        <field>Deposit_Amount__c</field>
        <formula>Product2.Deposit__c</formula>
        <name>Update Deposit Amount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Effective_Price</fullName>
        <field>EffectivePrice__c</field>
        <formula>TotalForQuote__c  /  PDF_Quantity__c</formula>
        <name>Update Effective Price</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Effective_Price_on_Pre_Purchased</fullName>
        <field>EffectivePrice__c</field>
        <formula>IF( ISPICKVAL(BillingFrequency__c , &quot;Semi-Annual&quot;),162 - (162 *  RecurringDiscountPercent__c ),

IF(ISPICKVAL(BillingFrequency__c , &quot;Quarterly&quot;),81 - (81 *  RecurringDiscountPercent__c ),

IF(ISPICKVAL(BillingFrequency__c , &quot;Monthly&quot;),27 - (27 *  RecurringDiscountPercent__c ),

324 - (324 *  RecurringDiscountPercent__c ))))</formula>
        <name>Update Effective Price on Pre-Purchased</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Fiscal_VAT</fullName>
        <field>Description</field>
        <formula>&quot;EU VAT Registration - Fiscal Representation&quot;</formula>
        <name>Update Fiscal VAT Registrations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Line_Description</fullName>
        <field>Description</field>
        <formula>Description &amp; &quot; - see reference document&quot;</formula>
        <name>Update Line Description</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_List_Price_for_BG_Returns</fullName>
        <field>ListPrice__c</field>
        <formula>CPQ_Quantity__c * 35</formula>
        <name>Update List Price for BG Returns</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Monthly_List</fullName>
        <field>Calc_List__c</field>
        <formula>ListPrice * 1.075</formula>
        <name>Update Monthly List</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Monthly_Sales</fullName>
        <field>UnitPrice</field>
        <formula>UnitPrice * 1.075</formula>
        <name>Update Monthly Sales</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Monthly_Sales2</fullName>
        <field>Calc_Sale__c</field>
        <formula>IF(Discount&gt;0,(UnitPrice  * 1.075) * (1-Discount),UnitPrice  * 1.075)</formula>
        <name>Update Monthly Sales2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_PDF_Quantity</fullName>
        <field>CPQ_Quantity__c</field>
        <formula>PDF_Quantity__c</formula>
        <name>Update Zuora Quantity</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Pro_Services_List</fullName>
        <field>Calc_List__c</field>
        <formula>UnitPrice</formula>
        <name>Update Pro Services List</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Sales_Price</fullName>
        <field>UnitPrice</field>
        <formula>TotalPrice__c + Buy_Down_Estimate__c  +  BookedValue__c</formula>
        <name>Update Sales Price</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Sales_Price_0</fullName>
        <field>UnitPrice</field>
        <formula>0</formula>
        <name>Update Sales Price $0</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Sales_Price_on_Dropped_PP_Returns</fullName>
        <field>UnitPrice</field>
        <formula>DropPPReturnsExtendedAmount__c</formula>
        <name>Update Sales Price on Dropped PP Returns</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Total_price_0</fullName>
        <field>TotalPrice__c</field>
        <formula>0</formula>
        <name>Update Total price $0</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_to_Annual</fullName>
        <field>BillingFrequency__c</field>
        <literalValue>Annual</literalValue>
        <name>Update to Annual</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <flowActions>
        <fullName>Delete_SubTotal_Opp_Line_Item</fullName>
        <description>Deletes any Opp Line Item containing the string &quot;subtotal&quot; upon creation</description>
        <flow>Delete_SubTotal_Opp_Line_Item</flow>
        <flowInputs>
            <name>ID</name>
            <value>{!this}</value>
        </flowInputs>
        <flowInputs>
            <name>OppLineItemID</name>
            <value>{!Id}</value>
        </flowInputs>
        <label>Delete SubTotal Opp Line Item</label>
        <language>en_US</language>
        <protected>false</protected>
    </flowActions>
    <rules>
        <fullName>Add Calc Dash Connector Override</fullName>
        <active>false</active>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>equals</operation>
            <value>CalcDash - Service Charge</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Add on%3A Professional Services Book Alert</fullName>
        <actions>
            <name>Need_Booked</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>equals</operation>
            <value>Add on: Professional Services,Add On: Professional Services - Custom SOW</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AddOn Quickstart order alert</fullName>
        <actions>
            <name>Quickstart_add_on_alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Booked_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>Quickstart</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.SubType__c</field>
            <operation>equals</operation>
            <value>AddOn</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Append Line Description</fullName>
        <actions>
            <name>Update_Line_Description</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>Historical Registration,Tax Exposure Analysis,Voluntary Disclosure,Backfiling Service</value>
        </criteriaItems>
        <description>If certain professional services items are selected, add &apos;see reference document&apos; to the Line Description</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AvaTax Product Family Fixer</fullName>
        <actions>
            <name>Stamp_AvaTax</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.ProductFamily__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Connector_Name__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Avalara Account Purchase Alert CAM Ding</fullName>
        <actions>
            <name>CAM_Online_Sales_Ding</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.ItemType__c</field>
            <operation>equals</operation>
            <value>Recurring</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CreatedById</field>
            <operation>equals</operation>
            <value>ZTBuy API</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>Managed Returns Service,Pre-Paid Returns Service</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Owner_Role_Name__c</field>
            <operation>contains</operation>
            <value>CAM</value>
        </criteriaItems>
        <description>Avalara Account Purchase Alert for CAM&apos;s</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Avalara Account Purchase Alert%21</fullName>
        <actions>
            <name>Avalara_Account_Purchase_Alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Force_AddOn_SubType</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.ItemType__c</field>
            <operation>equals</operation>
            <value>Recurring</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.CreatedById</field>
            <operation>equals</operation>
            <value>ZTBuy API</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>Managed Returns Service,Pre-Paid Returns Service</value>
        </criteriaItems>
        <description>Avalara Account Purchase Alert</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Bigcommerce Enterprise Returns List Price</fullName>
        <actions>
            <name>Bigcommerce_Enterprise_Returns_Effective</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Bigcommerce_Enterprise_Returns_TotalPric</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_List_Price_for_BG_Returns</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Connector_Name__c</field>
            <operation>equals</operation>
            <value>Bigcommerce</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.SubType__c</field>
            <operation>equals</operation>
            <value>SOHO</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>equals</operation>
            <value>Pre-Purchased Managed Returns Service - Annual - Service Fee</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Bigcommerce Enterprise Returns Usage Price</fullName>
        <actions>
            <name>Bigcommerce_Enterprise_Returns_Usage_Pri</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>FAB_Usage_Override_TRUE</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Connector_Name__c</field>
            <operation>equals</operation>
            <value>Bigcommerce</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.SubType__c</field>
            <operation>equals</operation>
            <value>SOHO</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>Overage Returns Fee</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cloud Craze Product Family AvaTax</fullName>
        <actions>
            <name>Stamp_Product_Family_AvaTax_CC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>AvaTax Integration:</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cloud Craze Product Family Returns</fullName>
        <actions>
            <name>Stamp_Product_Family_Returns_CC</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.PRPId__c</field>
            <operation>equals</operation>
            <value>2c92a0f94d98ec20014db6c3eaa63391</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Cloud Craze Updates Monthly</fullName>
        <actions>
            <name>Cloud_Craze_Total_Price</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Name</field>
            <operation>contains</operation>
            <value>Cloud Craze</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.BillingFrequency__c</field>
            <operation>equals</operation>
            <value>Monthly</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cloud Craze Updates Quantity</fullName>
        <actions>
            <name>Cloud_Craze_Quantity</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Name</field>
            <operation>contains</operation>
            <value>Cloud Craze</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>notEqual</operation>
            <value>Pre-Pay Returns</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Cloud Craze Updates Usage</fullName>
        <actions>
            <name>Update_Sales_Price_0</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Total_price_0</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.Name</field>
            <operation>contains</operation>
            <value>Cloud Craze</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.ItemType__c</field>
            <operation>equals</operation>
            <value>Usage</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>CloudConnect Alert</fullName>
        <actions>
            <name>Cloud_Connect_Quote_Event</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Stamp_Alert_Complete</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>CloudConnect Service</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Alert_Complete_Cloud_Connect__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Delete SubTotal Opp Line Item</fullName>
        <actions>
            <name>Delete_SubTotal_Opp_Line_Item</name>
            <type>FlowAction</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>subtotal,SubTotal,Subtotal</value>
        </criteriaItems>
        <description>Deletes any Opp Line Item that contains the string &quot;subtotal&quot; upon creation</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Drop Non Annual Total Stamp</fullName>
        <actions>
            <name>Stamp_Non_Annual_Drop</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>startsWith</operation>
            <value>Drop:</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.BillingFrequency__c</field>
            <operation>notEqual</operation>
            <value>,Annual</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.SubType__c</field>
            <operation>notEqual</operation>
            <value>Downgrade</value>
        </criteriaItems>
        <description>deactivated because of ITBSE-1018</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Dropped Products Trigger</fullName>
        <actions>
            <name>Maintain_Exist_Rate_Plan_ID</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Remove</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.ProductName__c</field>
            <operation>startsWith</operation>
            <value>DROP</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EMEA LI Description Override Registration Fiscal</fullName>
        <actions>
            <name>Update_Fiscal_VAT</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.Countries__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Fiscal_Representation__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>Registration</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EMEA LI Description Override Registration NonFiscal</fullName>
        <actions>
            <name>Stamp_Registration_Non_Fiscal</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.Countries__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Fiscal_Representation__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>Registration</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EMEA LI Description Override Returns Fiscal</fullName>
        <actions>
            <name>Stamp_Returns_Fiscal</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.Countries__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Fiscal_Representation__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>Return</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EMEA LI Description Override Returns NonFiscal</fullName>
        <actions>
            <name>Stamp_Returns_NoFiscal</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.Countries__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Fiscal_Representation__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>Return</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EZTax%3A Update Asset Created On Closed Won</fullName>
        <actions>
            <name>Asset_Created</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>EZTax</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>End of Agreement Behavior Default</fullName>
        <actions>
            <name>Default_End_of_Agreement_Behavior_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.LastModifiedById</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>FAB Exclusion Stamp</fullName>
        <actions>
            <name>Stamp_FAB_Exclusion_True</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2 OR 3</booleanFilter>
        <criteriaItems>
            <field>OpportunityLineItem.RPTCId__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>A-Z Training</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>Development Account (Included)</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Flip Per Unit to Flat Fee</fullName>
        <actions>
            <name>Set_Effective_Price_to_Total_Price</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Price_Format_to_Flat_Fee</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>Data File Exchange</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Force Dropped Discount%2FCredit to be positive</fullName>
        <actions>
            <name>Make_Effective_Price_a_Positive_Value</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Make_Sales_Price_a_Positive_Value</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Make_Total_Price_a_Positive_Value</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3 OR 4)</booleanFilter>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>equals</operation>
            <value>DROP: Avalara AvaTax Discount</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.EffectivePrice__c</field>
            <operation>lessThan</operation>
            <value>USD 0</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.UnitPrice</field>
            <operation>lessThan</operation>
            <value>USD 0</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.TotalPrice</field>
            <operation>lessThan</operation>
            <value>USD 0</value>
        </criteriaItems>
        <description>Forces Drop Lines that are labeled &apos;Avalara AvaTax Discount&apos; to have a positive Sales Price and Total Price so that the Opportunity Amount tallies accurately</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Force Native Dollar to be 0 for Downgrade</fullName>
        <actions>
            <name>Stamp_Sales_Price_0</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.SubType__c</field>
            <operation>equals</operation>
            <value>Downgrade</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Force Native Quantity to be 1</fullName>
        <actions>
            <name>Force_Quantity_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.Quantity</field>
            <operation>greaterThan</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.CPQ_Quantity__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Is Activation</fullName>
        <actions>
            <name>Is_Activation_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Product2.ItemType__c</field>
            <operation>equals</operation>
            <value>Activation,QuickStart,Implementation,Installation</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Is Prepaid Returns</fullName>
        <actions>
            <name>Check_is_Returns</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Product2.Name</field>
            <operation>contains</operation>
            <value>Prepaid</value>
        </criteriaItems>
        <criteriaItems>
            <field>Product2.ItemType__c</field>
            <operation>equals</operation>
            <value>Returns</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Is Royalty</fullName>
        <actions>
            <name>Is_Royalty_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Product2.TensoftRule__c</field>
            <operation>equals</operation>
            <value>Roy</value>
        </criteriaItems>
        <criteriaItems>
            <field>Product2.Name</field>
            <operation>notContain</operation>
            <value>Professional Service,Professional Services,Implementation Services,CertCapture,Tax Services,Registration Services,Nexus Studies</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Lock Line Item</fullName>
        <actions>
            <name>Lock</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.BookedValue__c</field>
            <operation>greaterThan</operation>
            <value>USD 0</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Maintain Total Price</fullName>
        <actions>
            <name>Remove_Native_Discount</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Sales_Price</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updated for ITBSE-977</description>
        <formula>AND( OR(NOT(ISPICKVAL(Opportunity.SubType__c, &quot;Downgrade&quot;))),(NOT(ISPICKVAL(Opportunity.SubType__c, &quot;Excise&quot;))),(NOT(ISPICKVAL(Opportunity.SubType__c, &quot;Communications&quot;))), OR( ISNEW(), ISCHANGED(TotalPrice__c),  ISCHANGED( BookedValue__c ) ), PRPCId__c!=&apos;2c92a0fd59b56b850159b957444e14e5&apos;, PRPId__c!=&apos;2c92a0ff59b56b9b0159b95743131239&apos;, RPTCId__c!=&apos;2c92a0fd59b56b850159b957444f14e6&apos; )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Make Yearly Annual</fullName>
        <actions>
            <name>Update_to_Annual</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IF((TEXT(BillingFrequency__c) = &quot;Yearly&quot;) , TRUE, FALSE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>PSA Set Opportunity Product IsServicesProductLine</fullName>
        <actions>
            <name>PSA_Set_IsServices_Flag_On_Opp_Products</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Mark as Services Opp Product, if product is a Services Product</description>
        <formula>Product2.pse__IsServicesProduct__c = TRUE</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Per Unit Qty For Zuora</fullName>
        <actions>
            <name>Update_PDF_Quantity</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>10 AND (1 OR 2 OR (3 AND 4) OR 5 OR 6 OR 7 OR (8 AND 9))</booleanFilter>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>Pre-Purchased Managed Returns</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.PriceFormat__c</field>
            <operation>equals</operation>
            <value>Per Unit</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.ProductFamily__c</field>
            <operation>equals</operation>
            <value>Avalara Professional Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.PriceFormat__c</field>
            <operation>equals</operation>
            <value>Flat Fee</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>equals</operation>
            <value>ONSITE - Z9CSV Rates - STATE</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>equals</operation>
            <value>ONSITE - Z5CSV Rates - STATE</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>equals</operation>
            <value>ONSITE - Dimasys Rates - STATE</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>equals</operation>
            <value>Upgrade Charge</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.ProductFamily__c</field>
            <operation>equals</operation>
            <value>Avalara Returns</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Name</field>
            <operation>notContain</operation>
            <value>Cloud Craze</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Quickstart Alert</fullName>
        <actions>
            <name>Quickstart_AddOn_Sale_Complete</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>quickstart</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Booked_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.SubType__c</field>
            <operation>equals</operation>
            <value>AddOn</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Returns Act Fee Opp Stamp</fullName>
        <actions>
            <name>Returns_Act_Fee</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.Family__c</field>
            <operation>equals</operation>
            <value>Returns</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Product2.ItemType__c</field>
            <operation>equals</operation>
            <value>Activation</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Returns Estimate Stamp</fullName>
        <actions>
            <name>Returns_Estimate</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.Family__c</field>
            <operation>equals</operation>
            <value>Returns</value>
        </criteriaItems>
        <criteriaItems>
            <field>Product2.Name</field>
            <operation>notContain</operation>
            <value>Prepaid,Processing,Subscription</value>
        </criteriaItems>
        <criteriaItems>
            <field>Product2.ItemType__c</field>
            <operation>equals</operation>
            <value>Returns</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Returns Product Family Fixer</fullName>
        <actions>
            <name>Avalara_Returns</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND (2 OR 3)</booleanFilter>
        <criteriaItems>
            <field>OpportunityLineItem.ProductFamily__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>equals</operation>
            <value>Avalara Returns - Pre-Paid Returns Service - Annual</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>equals</operation>
            <value>Avalara Returns - BigCommerce Pre-Purchased Managed Returns Service - Annual</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Self Serve Connector Count</fullName>
        <actions>
            <name>Self_Serve_Connector_Count</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.Connector_Name__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Suppress PDF Price</fullName>
        <actions>
            <name>Set_Suppress_PDF_Price</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Set the Suppress PDF Price field for specific opportunity products</description>
        <formula>(RPTCId__c = &quot;0FDNmxGdNtcEwty&quot;) || (RPTCId__c = &quot;0FDvGxAxkCyfZJj&quot;) || (RPTCId__c = &quot;0FDCXFo4Faxj1c5&quot;) || (RPTCId__c = &quot;0FDt3shTCiTCyXX&quot;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp %27Contains Negative Discount%27 on Opp</fullName>
        <actions>
            <name>Check_Contains_Negative_Discount_on_Opp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>startsWith</operation>
            <value>DROP:</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>Billing Fee</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.BillingFrequency__c</field>
            <operation>notEqual</operation>
            <value>Annual</value>
        </criteriaItems>
        <description>Checks to see if any of the products on the Opp are a Billing Fee associated with Negative Discount model rate plans.  If so, checks the appropriate checkbox on the parent Opp</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Needs Finance Product</fullName>
        <actions>
            <name>Stamp_Needs_Finance_Product_1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.ProductName__c</field>
            <operation>contains</operation>
            <value>managed services,global,consumer,landed,sand</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Pre-Purchased Returns Quantity on Opportunity</fullName>
        <actions>
            <name>StampPre_PurchasedReturnsQuantity</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.ProductFamily__c</field>
            <operation>equals</operation>
            <value>Avalara Returns</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Model__c</field>
            <operation>equals</operation>
            <value>Volume Pricing</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.ItemType__c</field>
            <operation>equals</operation>
            <value>Recurring</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>startsWith</operation>
            <value>Pre-Purchased Managed Returns</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Premier ACP Partner Product</fullName>
        <actions>
            <name>Stamp_Premier_ACP_Partner_Product</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.ProductFamily__c</field>
            <operation>equals</operation>
            <value>Avalara Professional Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>backfiling,custom tax recovery,registration,tax exposure,tax research,voluntary disclosure,nexus</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>notContain</operation>
            <value>EU,Spain,United Kingdom,Finland,Greece,Italy,France,Austria,Switzerland,Czech Republic,Germany,Hungary</value>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/BATS-480</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Stamp Product Class and Connector Level Formula</fullName>
        <actions>
            <name>Stamp_Connector_Level_Formula</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Product_Class_Formula</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>OpportunityLineItem.Product_Class_Formula__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Connector_Level_Formula__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>https://jira.avalara.com/browse/BATS-428</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Temp PS%2FMS Item</fullName>
        <actions>
            <name>Stamp_PS_MS_Item</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR 2 OR 4 OR 5) AND 3  AND 6</booleanFilter>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>Avalara Implementation,Add On: Professional Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>contains</operation>
            <value>Managed Services,SAP ECC/SAP S/4HANA (private cloud) by DMA</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>notContain</operation>
            <value>VAT Registration,VAT Returns,Fiscal</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.ServiceType__c</field>
            <operation>equals</operation>
            <value>PS,MS,TAS</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.ProductFamily__c</field>
            <operation>equals</operation>
            <value>Avalara Professional Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>notEqual</operation>
            <value>Avalara State Sales Tax Registration,Avalara Licensing Form Finder,Avalara Business Licensing and Sales Tax Registration</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Temp TAS Item</fullName>
        <actions>
            <name>Stamp_TAS_Item</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>notContain</operation>
            <value>Avalara Implementation Service,Add On: Professional Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>notContain</operation>
            <value>Managed Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>notEqual</operation>
            <value>EMEA</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>notContain</operation>
            <value>VAT,Fiscal</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.ProductFamily__c</field>
            <operation>equals</operation>
            <value>Avalara Professional Services</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.ItemType__c</field>
            <operation>equals</operation>
            <value>Usage</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>TrustFile Product Family Fixer</fullName>
        <actions>
            <name>Avalara_TrustFile_Family</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.ProductFamily__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>equals</operation>
            <value>Avalara TrustFile-TrustFile Trial Online Monthly-Monthly Service</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Update Effective Price on Pre-Purchased Returns Service</fullName>
        <actions>
            <name>Update_Effective_Price_on_Pre_Purchased</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.ProductFamily__c</field>
            <operation>equals</operation>
            <value>Avalara Returns</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Model__c</field>
            <operation>equals</operation>
            <value>Volume Pricing</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.ItemType__c</field>
            <operation>equals</operation>
            <value>Recurring</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>startsWith</operation>
            <value>Pre-Purchased Managed Returns</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.PriceFormat__c</field>
            <operation>equals</operation>
            <value>Flat Fee</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Monthly List-Sales</fullName>
        <actions>
            <name>Update_Monthly_List</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Monthly_Sales2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.BillingFrequency__c</field>
            <operation>equals</operation>
            <value>Monthly</value>
        </criteriaItems>
        <criteriaItems>
            <field>Product2.ItemType__c</field>
            <operation>equals</operation>
            <value>Service</value>
        </criteriaItems>
        <criteriaItems>
            <field>Product2.Family</field>
            <operation>equals</operation>
            <value>Calc,Certs</value>
        </criteriaItems>
        <criteriaItems>
            <field>Product2.Name</field>
            <operation>notContain</operation>
            <value>prepaid</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Oppportunity Product Deposit</fullName>
        <actions>
            <name>Update_Deposit_Amount</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.Deposit_Amount__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Product2.Deposit__c</field>
            <operation>greaterThan</operation>
            <value>USD 0</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Oppportunity Product Setup</fullName>
        <actions>
            <name>Set_Setup_Fee_on_Opportunity_Product</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.One_Time_Set_up__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Product2.One_time_Setup_Fee__c</field>
            <operation>greaterThan</operation>
            <value>USD 0</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Prof Services List</fullName>
        <actions>
            <name>Update_Pro_Services_List</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND 2) OR 3</booleanFilter>
        <criteriaItems>
            <field>Product2.PriceLevel__c</field>
            <operation>equals</operation>
            <value>NO LEVEL</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.ListPrice</field>
            <operation>equals</operation>
            <value>USD 0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Product2.GPSKU__c</field>
            <operation>equals</operation>
            <value>TS-PROFSVCS</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update Sales Price on Dropped PP Returns</fullName>
        <actions>
            <name>Update_Sales_Price_on_Dropped_PP_Returns</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>OpportunityLineItem.Description</field>
            <operation>equals</operation>
            <value>DROP: Avalara Returns Service Fee</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.SubType__c</field>
            <operation>notEqual</operation>
            <value>Downgrade</value>
        </criteriaItems>
        <criteriaItems>
            <field>OpportunityLineItem.PDF_Quantity__c</field>
            <operation>greaterThan</operation>
            <value>1</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>Need_Booked_Value_Update_for_Certs_Additional_Pro_Services</fullName>
        <assignedTo>danielle.kershaw@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Need Booked Value Update for Additional Pro Services</subject>
    </tasks>
    <tasks>
        <fullName>Quickstart_AddOn_Sale_Complete</fullName>
        <assignedTo>melissa.davis@avalara.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Quickstart AddOn Sale Complete</description>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Quickstart AddOn Sale Complete</subject>
    </tasks>
</Workflow>
