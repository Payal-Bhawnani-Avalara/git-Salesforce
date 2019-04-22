<?xml version="1.0" encoding="UTF-8"?>
<CustomMetadata xmlns="http://soap.sforce.com/2006/04/metadata" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <label>RTDiscard Adding Discarded Status</label>
    <protected>false</protected>
    <values>
        <field>fferpcore__Configuration__c</field>
        <value xsi:type="xsd:string">{
                    &quot;name&quot;: &quot;ffrr__RevenueRecognitionTransaction__c.ffrr__Status__c&quot;,
                    &quot;values&quot;: {
                        &quot;Discarded&quot;: {
                            &quot;operation&quot;: {
                                &quot;enable&quot;: &quot;add&quot;
                            }
                        }
                    }
                }</value>
    </values>
    <values>
        <field>fferpcore__Feature__c</field>
        <value xsi:type="xsd:string">ffrr__RTDiscard</value>
    </values>
    <values>
        <field>fferpcore__IsOptional__c</field>
        <value xsi:type="xsd:string">Optional</value>
    </values>
    <values>
        <field>fferpcore__StepDescription__c</field>
        <value xsi:type="xsd:string">ffrr__RRTAddingDiscardDescription</value>
    </values>
    <values>
        <field>fferpcore__StepNumber__c</field>
        <value xsi:type="xsd:double">2.0</value>
    </values>
    <values>
        <field>fferpcore__StepType__c</field>
        <value xsi:type="xsd:string">Picklist</value>
    </values>
</CustomMetadata>
