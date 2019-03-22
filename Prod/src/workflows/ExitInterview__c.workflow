<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_Avoidable_Unavoidable_to_Avoidable</fullName>
        <field>Avoidable__c</field>
        <literalValue>Avoidable</literalValue>
        <name>Set Avoidable/Unavoidable to Avoidable</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Avoidable_Unavoidable_to_N_A</fullName>
        <field>Avoidable__c</field>
        <literalValue>N/A</literalValue>
        <name>Set Avoidable/Unavoidable to N/A</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Avoidable_Unavoidable_to_Unavoidable</fullName>
        <field>Avoidable__c</field>
        <literalValue>Unavoidable</literalValue>
        <name>Set Avoidable/Unavoidable to Unavoidable</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Category_to_Compliance</fullName>
        <field>Category__c</field>
        <literalValue>Compliance</literalValue>
        <name>Set Category to Compliance</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Category_to_Customer_Readiness</fullName>
        <field>Category__c</field>
        <literalValue>Customer Readiness</literalValue>
        <name>Set Category to Customer Readiness</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Category_to_NA</fullName>
        <field>Category__c</field>
        <literalValue>NA</literalValue>
        <name>Set Category to NA</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Category_to_Partner</fullName>
        <field>Category__c</field>
        <literalValue>Partner</literalValue>
        <name>Set Category to Partner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Category_to_Product</fullName>
        <field>Category__c</field>
        <literalValue>Product</literalValue>
        <name>Set Category to Product</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Category_to_Sales_Expectations</fullName>
        <field>Category__c</field>
        <literalValue>Sales/Expectations</literalValue>
        <name>Set Category to Sales/Expectations</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Category_to_Support_Svcs</fullName>
        <field>Category__c</field>
        <literalValue>Support Svcs</literalValue>
        <name>Set Category to Support Svcs</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Category_to_Value_Prop_Price</fullName>
        <field>Category__c</field>
        <literalValue>Value Prop/Price</literalValue>
        <name>Set Category to Value Prop/Price</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Cancellation_Reason_Primary</fullName>
        <description>Updates the field on the Cancellation record with the value captured in the Exit Interview</description>
        <field>CancellationReasonPrimary__c</field>
        <formula>TEXT( CancelReason_Primary__c )</formula>
        <name>Update Cancellation Reason (Primary)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>CancellationReference__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Assign Categor - Sales%2FExpectations</fullName>
        <actions>
            <name>Set_Avoidable_Unavoidable_to_Avoidable</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Category_to_Sales_Expectations</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>ExitInterview__c.OverrideDefaultCategory__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>ExitInterview__c.CancelReason_Primary__c</field>
            <operation>equals</operation>
            <value>Not as promised - time involved,Add-ons oversold/no intent,Contract error,Not as promised - not easy,Not as promised - tax codes,Unsupported platform,Not as promised - prod limitation</value>
        </criteriaItems>
        <description>Assigns the Category to Sales/Expectations and Avoidable? to Avoidable</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Create Cancellation Follow Up</fullName>
        <active>true</active>
        <criteriaItems>
            <field>ExitInterview__c.CreateFollowUpTask__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Creates a follow up task for a Cancellation record that requested a future follow up.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Populate Cancellation Reason</fullName>
        <actions>
            <name>Update_Cancellation_Reason_Primary</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>ExitInterview__c.CancelReason_Primary__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>ExitInterview__c.CancelReason_Secondary__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When an Exit Interview is saved, populate the shadow fields for Cancellation Reason (Primary) and (Secondary) at the Cancellation level.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set Category AND Avoidable%2FUn to NA</fullName>
        <actions>
            <name>Set_Avoidable_Unavoidable_to_N_A</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Category_to_NA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>ExitInterview__c.OverrideDefaultCategory__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>ExitInterview__c.CancelReason_Primary__c</field>
            <operation>equals</operation>
            <value>Unknown</value>
        </criteriaItems>
        <description>Sets the Category to N/A and sets Avoidable/Unavoidable to N/A</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Category to Compliance</fullName>
        <actions>
            <name>Set_Avoidable_Unavoidable_to_Avoidable</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Category_to_Compliance</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>ExitInterview__c.OverrideDefaultCategory__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>ExitInterview__c.CancelReason_Primary__c</field>
            <operation>equals</operation>
            <value>Insufficient Compliance support,Innaccurate Returns/Notices,Tax content missing</value>
        </criteriaItems>
        <description>Set&apos;s the Category to Compliance and Avoidable/Unavoidable to Avoidable</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Category to Customer Readiness</fullName>
        <actions>
            <name>Set_Avoidable_Unavoidable_to_Avoidable</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Category_to_Customer_Readiness</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>ExitInterview__c.OverrideDefaultCategory__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>ExitInterview__c.CancelReason_Primary__c</field>
            <operation>equals</operation>
            <value>ERP/dependent systems not ready,Need a PM/champion</value>
        </criteriaItems>
        <description>Sets the Category to Customer Readiness and Avoidable/Unavoidable to Avoidable</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Category to NA</fullName>
        <actions>
            <name>Set_Avoidable_Unavoidable_to_Unavoidable</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Category_to_NA</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>ExitInterview__c.OverrideDefaultCategory__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>ExitInterview__c.CancelReason_Primary__c</field>
            <operation>equals</operation>
            <value>Replacing with other Ava product,Inability to pay,Company out of business,Company acquired/restructured,Closing relevant part of business</value>
        </criteriaItems>
        <description>Sets the Category to NA and sets Avoidable/Unavoidable to Unavoidable</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Category to Partner</fullName>
        <actions>
            <name>Set_Avoidable_Unavoidable_to_Avoidable</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Category_to_Partner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>ExitInterview__c.OverrideDefaultCategory__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>ExitInterview__c.CancelReason_Primary__c</field>
            <operation>equals</operation>
            <value>Need partner support</value>
        </criteriaItems>
        <description>Sets the Category to Partner and sets Avoidable/Unavoidable to Avoidable</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Category to Product</fullName>
        <actions>
            <name>Set_Avoidable_Unavoidable_to_Avoidable</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Category_to_Product</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>ExitInterview__c.OverrideDefaultCategory__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>ExitInterview__c.CancelReason_Primary__c</field>
            <operation>equals</operation>
            <value>Tax profile set-up unsatisfactory,Service performance issues,Bugs,Limitations/Key feature missing</value>
        </criteriaItems>
        <description>Sets the Category to Product and sets Avoidable/Unavoidable to Avoidable</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Category to Support Svcs</fullName>
        <actions>
            <name>Set_Avoidable_Unavoidable_to_Avoidable</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Category_to_Support_Svcs</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>ExitInterview__c.OverrideDefaultCategory__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>ExitInterview__c.CancelReason_Primary__c</field>
            <operation>equals</operation>
            <value>Insufficient Support,Unaware of support</value>
        </criteriaItems>
        <description>Sets the Category to Support Svcs and sets Avoidable/Unavoidable to Avoidable</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Category to Value Prop%2FPrice</fullName>
        <actions>
            <name>Set_Avoidable_Unavoidable_to_Avoidable</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Category_to_Value_Prop_Price</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>ExitInterview__c.OverrideDefaultCategory__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>ExitInterview__c.CancelReason_Primary__c</field>
            <operation>equals</operation>
            <value>Value prop not realized</value>
        </criteriaItems>
        <description>Sets the Category to Value Prop/Price and sets Avoidable/Unavoidable to Avoidable</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
