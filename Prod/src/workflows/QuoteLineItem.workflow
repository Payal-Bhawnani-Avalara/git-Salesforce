<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>CalcSalesPrice</fullName>
        <field>UnitPrice</field>
        <formula>(1-Discount) *  PricebookEntry.UnitPrice</formula>
        <name>CalcSalesPrice</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Calculate_Discount</fullName>
        <description>Populates Discount with Sales Price / List Price</description>
        <field>Discount</field>
        <formula>(PricebookEntry.UnitPrice - UnitPrice) / PricebookEntry.UnitPrice</formula>
        <name>Calculate Discount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Mark_HasGoldSupport</fullName>
        <description>Makes HasGoldSupport = 1</description>
        <field>HasGoldSupport__c</field>
        <formula>1</formula>
        <name>Mark HasGoldSupport</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reapply_Sales_Price</fullName>
        <field>UnitPrice</field>
        <formula>PricebookEntry.UnitPrice *  Discount</formula>
        <name>Reapply Sales Price</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetSalesPriceto0</fullName>
        <description>Updates &apos;Sales Price&apos; to $0</description>
        <field>UnitPrice</field>
        <formula>0</formula>
        <name>Set Sales Priceto 0</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateHiddenAmountBilledBySage</fullName>
        <field>HiddenAmountBilledBySage__c</field>
        <formula>SageBilledTotal__c</formula>
        <name>UpdateHidden Amoun tBilled By Sage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateHiddenAnnualTotalPrice</fullName>
        <description>Updates the HiddenTotalPrice field for roll-up summary</description>
        <field>HiddenTotalPrice__c</field>
        <formula>TotalPriceLineItemActual__c</formula>
        <name>Update Hidden Annual TotalPrice</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateHiddenItemType</fullName>
        <description>Update Hidden Item Type</description>
        <field>HiddenItemType__c</field>
        <formula>ItemType__c</formula>
        <name>Update Hidden Item Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>UpdateIsSingleState</fullName>
        <description>Set &apos;Is Single State&apos; to 1</description>
        <field>IsSingleState__c</field>
        <formula>1</formula>
        <name>Update Is Single State</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Hidden_Frequency</fullName>
        <field>HiddenF__c</field>
        <formula>IF( OR(Product2.Name = &quot;AvaTax Gold Support&quot;, AND(CONTAINS(Product2.Name,&quot;Prepaid&quot;), Product2.TensoftRule__c =&quot;Ent&quot;)),&quot;One-Time&quot;,

Frequency__c)</formula>
        <name>Update Hidden Frequency</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Hidden_Total_Price</fullName>
        <field>HiddenMonthlyTotalPrice__c</field>
        <formula>MonthlyTotalPrice__c</formula>
        <name>Update Hidden Total Price</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Hidden_Total_for_Discount_Calc</fullName>
        <description>Updates HiddenTPForDiscountCalc with the value in TPForDiscountCalc</description>
        <field>HiddenTPForDiscountCalc__c</field>
        <formula>TPForDiscountCalc__c</formula>
        <name>Update Hidden Total for Discount Calc</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Check HasGoldSupport</fullName>
        <actions>
            <name>Mark_HasGoldSupport</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>When Gold Support is added as a Line Item, make HasGoldSupport=1</description>
        <formula>Product2.GPSKU__c =&quot;AT-SPT-GOLD&quot;</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Flag Single State Line Item</fullName>
        <actions>
            <name>UpdateIsSingleState</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Product2.PriceLevel__c</field>
            <operation>contains</operation>
            <value>SS</value>
        </criteriaItems>
        <description>When a Single State Item is added to a Quote, update the &apos;Is Single State&apos; Quote Line Item field</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Hidden Line Item Fields</fullName>
        <actions>
            <name>UpdateHiddenAmountBilledBySage</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>UpdateHiddenAnnualTotalPrice</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>UpdateHiddenItemType</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Hidden_Frequency</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Hidden_Total_Price</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Update_Hidden_Total_for_Discount_Calc</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updates the hidden line item fields which are then used as the foundation for a quote level rollup summary to display the aggregate of custom pricing</description>
        <formula>NOT(ISNULL( Id ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
