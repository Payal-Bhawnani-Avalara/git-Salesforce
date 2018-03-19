/*
* Description : Syncs the field from Article to Functional Matrix
*/
public class FunctionalMatrixSyncUtil{

    private static Map<String,String> rTypeMap = getRecordTypeIds();

    public void process(){
        List<Connector_KB__kav> knowledges = [
            SELECT Id
            FROM Connector_Kb__KAV
            WHERE Id = :ApexPages.CurrentPage().getParameters().get('id')
        ];
        process(knowledges);
    }

    public static void process(List<Connector_KB__kav> knowledges){
        syncFunctionalMatrix( [
            SELECT Id,
                Notes__c,
                KnowledgeArticleId,
                Timing_for_recording_Committing_Transa__c,
                Timing_for_Tax_Calculation__c,
                Line_Level_Addressing__c,
                Location_Code_Click_Path__c,
                Client_Exemption_Click_Path__c,
                Core_Notes__c,
                Product_Mapping_Click_Path__c,
                Company_Code__c,
                Configuration_Click_Path__c,
                Submit_User_Guide_url__c,
                API__c,
                Escalation_Contact__c,
                Contact__c,
                Support_Notes__c,
                Implementation_Path__c,
                Support_Support_Path__c,
                Version__c,
                Version__r.Certified_Calc__c,
                Version__r.Certified_Address_Validation__c,
                Version__r.Certified_Returns__c ,
                Version__r.Certified_Global__c,
                Version__r.Certified_Communications_Tax__c,
                Version__r.Certified_POS__c
            FROM Connector_Kb__Kav
            WHERE Id IN:knowledges
        ]);
    }

    public static List<Functional_Matrix__c> syncFunctionalMatrix(List<Connector_KB__kav> knowledges){

        List<Functional_Matrix__c> matrixList = syncMatrix(knowledges);
        upsert matrixList Unique_Id__c;
        publishArticle( knowledges );
        return matrixList;
    }

    public static List<Connector_KB__kav> publishArticle(List<Connector_KB__kav> knowledges){
        for(Connector_KB__kav ck : knowledges){
            ck.Id = KBManagement.PublishingService.editOnlineArticle(ck.KnowledgeArticleId, true);
        }
        upsert knowledges;
        for(Connector_KB__kav ck : knowledges) {
            KbManagement.PublishingService.publishArticle(ck.KnowledgeArticleId, true);
        }
        return knowledges;
    }

    /*
    * publishes articles that are already draft
    **/
    public static void publishNewArticle(Set<Id> ids){
        for(Connector_KB__kav ck : [
            SELECT Id,KnowledgeArticleId
            FROM Connector_KB__kav
            WHERE Id IN:ids
        ]) {
            KbManagement.PublishingService.publishArticle(ck.KnowledgeArticleId, true);
        }
    }

    private static List<Functional_Matrix__c> syncMatrix(List<Connector_KB__kav> knowledges){
        List<Functional_Matrix__c> matrixList = new List<Functional_Matrix__c>();

        for(Connector_KB__kav obj : knowledges){
            // push fields to corresponding FM
            if(obj.Core_Notes__c <> NULL){
                matrixList.add(toFunctionalMatrix('Core_Address_Validation' , obj));
            }
            if(obj.Version__r.Certified_Communications_Tax__c <> NULL){
                matrixList.add(toFunctionalMatrix('Core_Communication', obj));
            }
            matrixList.add(toFunctionalMatrix('Core_Sales_Tax', obj));

        }
        return matrixList;
    }


    private static Functional_Matrix__c toFunctionalMatrix(String rtDevName, Connector_KB__kav knowledge){
        String recordTypeId = rTypeMap.get(rtDevName);
        Functional_Matrix__c matrix = new Functional_Matrix__c();

        if(rtDevName == 'Core_Sales_Tax' || rtDevName == 'Core_Communication'){
            matrix = new Functional_Matrix__c(
                Unique_Id__c = knowledge.Version__c + '||' + recordTypeId,
                Configuration_Click_Path__c = knowledge.Configuration_Click_Path__c,
                Company_Code__c = knowledge.Company_Code__c,
                Product_Mapping_Click_Path__c = knowledge.Product_Mapping_Click_Path__c,
                Client_Exemption_Click_Path__c = knowledge.Client_Exemption_Click_Path__c,
                Location_Code_Click_Path__c = knowledge.Location_Code_Click_Path__c,
                Line_Level_Addressing__c = knowledge.Line_Level_Addressing__c,
                Timing_For_Tax_Calculation__c = knowledge.Timing_For_Tax_Calculation__c,
                Timing_for_recording_Committing_Transa__c = knowledge.Timing_for_recording_Committing_Transa__c,
                Notes__c = knowledge.Notes__c,
                Version__c = Knowledge.Version__c,
                User_Guide_URL__c = knowledge.Submit_User_Guide_url__c,
                Implementation_Contact__c = knowledge.Contact__c,
                Support_Support_Path__c = knowledge.Support_Support_Path__c,
                Escalation_Contact__c = knowledge.Escalation_Contact__c,
                Core_Notes__c = knowledge.Core_Notes__c,
                RecordTypeId = recordTypeId
            );

            if(rtDevName == 'Core_Communication'){
                // set parent Reference
                knowledge.Comm_Functional_Matrix__r = new Functional_Matrix__c(
                    Unique_Id__c = knowledge.Version__c + '||' + recordTypeId
                );
                matrix.Communication__c = knowledge.Version__r.Certified_Communications_Tax__c <> NULL ? 'Certified' : NULL;
                matrix.Communication_Achieved_Date__c = knowledge.Version__r.Certified_Communications_Tax__c;
            }
            else {
                // set parent Reference
                knowledge.Sales_Tax_Matrix__r = new Functional_Matrix__c(
                    Unique_Id__c = knowledge.Version__c + '||' + recordTypeId
                );

                matrix.Sales_Tax__c = knowledge.Version__r.Certified_Calc__c <> NULL ? 'Certified' : NULL;
                matrix.Refunds__c = knowledge.Version__r.Certified_Returns__c <> NULL ? 'Certified' : NULL;
                matrix.VAT__c = knowledge.Version__r.Certified_Global__c <> NULL ? 'Limited Functionality' : NULL;
                matrix.POS__c = knowledge.Version__r.Certified_POS__c <> NULL ? 'Certified' : NULL;
                matrix.Sales_Tax_Achieved_Date__c = knowledge.Version__r.Certified_Calc__c;
                matrix.POS_Achieved_Date__c = knowledge.Version__r.Certified_POS__c;
                matrix.Refunds_Achieved_Date__c = knowledge.Version__r.Certified_Returns__c;
                matrix.VAT_Achieved_Date__c = knowledge.Version__r.Certified_Global__c;
            }
        }
        else if( rtDevName == 'Core_Address_Validation'){
            matrix = new Functional_Matrix__c(
                Core_Notes__c = knowledge.Core_Notes__c,
                Version__c = knowledge.Version__c,
                Unique_Id__c = knowledge.Version__c + '||' + recordTypeId,
                RecordTypeId = recordTypeId,
                Address_Validation__c = knowledge.Version__r.Certified_Address_Validation__c <> NULL ? 'Certified' : NULL
            );
            // set parent Reference
            knowledge.Address_Validation_Functional_Matrix__r = new Functional_Matrix__c(
                Unique_Id__c = knowledge.Version__c + '||' + recordTypeId
            );
        }


        return matrix;
    }

    private static Map<String,String> getRecordTypeIds(){
        Map<String,String> rTypeMap = new Map<String,String>();
        for(RecordType rt : [
            SELECT Id,DeveloperName
            FROM RecordType WHERE sObjectType = 'Functional_Matrix__c' AND DeveloperName IN ('Core_Address_Validation','Core_Communication','Core_Sales_Tax')
        ]){
            rTypeMap.put(rt.DeveloperName,rt.Id);
        }
        return rTypeMap;
    }
}