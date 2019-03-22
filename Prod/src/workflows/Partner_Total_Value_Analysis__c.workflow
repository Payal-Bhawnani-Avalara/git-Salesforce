<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_Recalculate_False</fullName>
        <field>Recalculate__c</field>
        <literalValue>0</literalValue>
        <name>Set Recalculate False</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Cumulative_Gain_Loss_Y4</fullName>
        <field>Cumulative_Gain_Loss_Y4_STAMP__c</field>
        <formula>Cumulative_Gain_Loss_Y3__c + Gain_Loss_Y4__c</formula>
        <name>Stamp Cumulative Gain / Loss Y4</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stamp_Recurring_Returns_Revenue_Y5</fullName>
        <field>Recurring_Returns_Revenue_Y5_Stamp__c</field>
        <formula>Returns_per_Customer_Y5__c * Price_per_Return_Y5__c *  Cumulative_Returns_Customers_Y4__c</formula>
        <name>Stamp Recurring Returns Revenue Y5</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Stamp Cumulative Gain %2F Loss Y4</fullName>
        <actions>
            <name>Set_Recalculate_False</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Cumulative_Gain_Loss_Y4</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stamp_Recurring_Returns_Revenue_Y5</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Partner_Total_Value_Analysis__c.Cumulative_Gain_Loss_Y3__c</field>
            <operation>notEqual</operation>
            <value>USD 0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Partner_Total_Value_Analysis__c.Recalculate__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
