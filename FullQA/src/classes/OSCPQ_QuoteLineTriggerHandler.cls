/*------------------------------------------------------------------------+
Original Shift(developer@originalshift.com)
Purpose: Handles the OSCPQ Quote Line Trigger
 
Details: - Performs Quote Line Group Cloning
 
History:
Mar 06/19 - Original Shift - Initial Implementation
------------------------------------------------------------------------+*/ 
public with sharing class OSCPQ_QuoteLineTriggerHandler {
    @testVisible private CPQ_Setting__mdt settings; //Testvisible so that test classes can inject special settings.

    /*
     * Constructor - takes a metadata record API name, so that
     *  more scenarios can be accomodated as needed in an implemenation.
     *  For example, Partner quotes may not have the same level of automation
     */
    public OSCPQ_QuoteLineTriggerHandler(String settingsAPIName) {
        if(settingsAPIName != null && settingsAPIName != '') {
            CPQ_Setting__mdt tmpSettings = OSCPQ_Utils.getContractSettings(settingsAPIName);
            if(tmpSettings != null){
                settings = tmpSettings;
            }
        }
    }

    /*
     * On After Insert method. Primary function is doing a quote line group cloning
     */
    public void onAfterInsert(List<SBQQ__QuoteLine__c> newQuoteLineList) {
        Set<Id> origQuoteLineGroupIds = new Set<Id>();
        List<Id> parentIds = new List<Id>();
        Id quoteId;
        
        if(settings.TwinMapping_CloneQuoteGroups__c != 'Never') {
            //Initial loop; pull list of Original Group Ids and get the Quote Id
            for (SBQQ__QuoteLine__c qli : newQuoteLineList) {
                quoteId = qli.SBQQ__Quote__c;

                //Since parent items get inserted in call before children, we should only get Ids from the parent
                if (qli.SBQQ__RequiredBy__c == null && qli.OSCPQ_Original_Quote_Line_Group_Id__c != null) {
                    origQuoteLineGroupIds.add(qli.OSCPQ_Original_Quote_Line_Group_Id__c);
                } //Child items are always grouped together with the parent, so we just need to get the various parent Ids
                else if(qli.SBQQ__RequiredBy__c != null) {
                    parentIds.add(qli.SBQQ__RequiredBy__c);
                }
            }

            //Check if we are in a valid case for group cloning
            SBQQ__Quote__c quote = [SELECT Id, SBQQ__Type__c FROM SBQQ__Quote__c WHERE Id = :quoteId LIMIT 1];
            if((quote.SBQQ__Type__c == 'Amendment' && (settings.TwinMapping_CloneQuoteGroups__c == 'On Amendment' || settings.TwinMapping_CloneQuoteGroups__c == 'Always'))
              || (quote.SBQQ__Type__c == 'Renewal' && (settings.TwinMapping_CloneQuoteGroups__c == 'On Renewal' || settings.TwinMapping_CloneQuoteGroups__c == 'Always'))
            ) {
                List<String> clonableFields = getFieldsToClone();
                Map<Id, SBQQ__QuoteLineGroup__c> oldQLGMap = new Map<Id, SBQQ__QuoteLineGroup__c>();
                if(!clonableFields.isEmpty()) {
                    List<SBQQ__QuoteLineGroup__c> currentQLGs = new List<SBQQ__QuoteLineGroup__c>([SELECT Id, OSCPQ_Original_Quote_Line_Group__c FROM SBQQ__QuoteLineGroup__c WHERE SBQQ__Quote__c = :quoteId]);

                    //Pull Query for the original quote line groups
                    String queryStr = 'Select ' + String.join(clonableFields, ', ') + ', Id'
                        + ' FROM SBQQ__QuoteLineGroup__c WHERE Id IN :origQuoteLineGroupIds';
                    List<SBQQ__QuoteLineGroup__c> oldQLGList = (List<SBQQ__QuoteLineGroup__c>)database.query(queryStr);
                    //Fields selected and old QLGs queried - now need to map
                    List<SBQQ__QuoteLineGroup__c> newQLGList = new List<SBQQ__QuoteLineGroup__c>();

                    //make sure we don't duplicate groups created in prior calls
                    List<String> existingCheck = new List<String>(); 

                    for (SBQQ__QuoteLineGroup__c qlg : currentQLGs) {
                        existingCheck.add(qlg.OSCPQ_Original_Quote_Line_Group__c);
                    }

                    //Loop that actually does the mapping from old group to new group
                    for (SBQQ__QuoteLineGroup__c oldQLG : oldQLGList) {
                        if (!existingCheck.contains(oldQLG.Id)) { //If we haven't already created this group
                            SBQQ__QuoteLineGroup__c newQLG = new SBQQ__QuoteLineGroup__c();
                            for(String fieldName : clonableFields) {
                                newQLG.put(fieldName, oldQLG.get(fieldName));
                            }

                            newqlg.SBQQ__Quote__c = quoteId;
                            newqlg.OSCPQ_Original_Quote_Line_Group__c = oldQLG.Id;
                            newQLGList.add(newqlg);
                        }
                    }
                    //Actually insert the new QLGs
                    if (newQLGList.size() > 0) {
                        insert newQLGList;
                        currentQLGs.addAll(newQLGList);
                    }

                    //Finally, associate quote lines with the appropriate group
                    Map<Id,SBQQ__QuoteLine__c> parentLines = new Map<Id,SBQQ__QuoteLine__c>([SELECT Id, SBQQ__Group__c FROM SBQQ__QuoteLine__c WHERE Id IN :parentIds]);
                    for (SBQQ__QuoteLine__c qli : newQuoteLineList) {
                        for (SBQQ__QuoteLineGroup__c qlg : currentQLGs) {
                            if (qlg.OSCPQ_Original_Quote_Line_Group__c == qli.OSCPQ_Original_Quote_Line_Group_Id__c) {
                                qli.SBQQ__Group__c = qlg.Id;
                            } else if(qli.SBQQ__RequiredBy__c != null){
                                SBQQ__QuoteLine__c parentQLI = parentLines.get(qli.SBQQ__RequiredBy__c);
                                qli.SBQQ__Group__c = parentQLI.SBQQ__Group__c;
                            }
                        }
                    }
                }
                
                
            }
        }
    }

    private static List<String> getFieldsToClone() {
        List<String> fieldsToClone = new List<String>();
        
        //Get all fields from the QLG and determine which ones the user has appropriate access to for cloning purposes.
        List<String> twinMappableFieldNames = new List<String>();
        Map<String, Schema.SObjectField> allQLGFieldsMap = Schema.SObjectType.SBQQ__QuoteLineGroup__c.fields.getMap();
        for(String qlgFieldApiName : allQLGFieldsMap.keySet()){
            Schema.DescribeFieldResult fieldDescribeRes = allQLGFieldsMap.get(qlgFieldApiName).getDescribe();
            //Unlike the true twin mapping feature, allow for package fields to be cloned
            if(fieldDescribeRes.isAccessible() && fieldDescribeRes.isUpdateable() && !fieldDescribeRes.isExternalId() && !fieldDescribeRes.isCalculated()) {
                twinMappableFieldNames.add(qlgFieldApiName);
            }
        }

        //Loop through fields in the clonable field set, and check them against the twinMappable set
        List<Schema.FieldSetMember> clonableFSMembers;
        Schema.FieldSet clonableFieldSet = Schema.SObjectType.SBQQ__QuoteLineGroup__c.fieldSets.OSCPQ_Clonable_Fields;
        if(clonableFieldSet != null) {
            clonableFSMembers = clonableFieldSet.getFields();
            //Loop through the clonable fields from the field set, check that the user has appropriate access (from the twin map util), and add to the result
            if(!clonableFSMembers.isEmpty() && !twinMappableFieldNames.isEmpty()) {
                for(Schema.FieldSetMember fsMember : clonableFSMembers) {
                    string fieldName = fsMember.getFieldPath();
                    if(twinMappableFieldNames.contains(fieldName.toLowerCase())) {
                        fieldsToClone.add(fieldName);
                    }
                }
            }
        }

        return fieldsToClone;
    }

}