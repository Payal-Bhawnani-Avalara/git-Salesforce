public class FunctionalMatrixHandler{

    public static void enforceSingleFM(List<Functional_Matrix__c> triggerNew){
        Map<String,Set<Id>> matrixMap = matrixMap(triggerNew);
        Map<String,String> recordTypeMap = recordTypeMap();
        for(Functional_Matrix__c matrix : triggerNew){
            // check if there is a record with the same record type for this version
            if(matrixMap.containsKey(matrix.Version__c) && matrixMap.get(matrix.Version__c).contains(matrix.RecordTypeId)){
                matrix.addError(recordTypeMap.get(matrix.RecordTypeId) + ' already exists in this version, please select another type');
            }
        }
    }

    public static void syncToConnectorKB(List<Functional_Matrix__c> fms){
        syncToConnectorKB(new Map<Id, Functional_Matrix__c>(fms), NULL);
    }

    public static void syncToConnectorKB(Map<Id, Functional_Matrix__c> fmMap, Map<Id, Functional_Matrix__c> fmOldMap){
            // Functaional Matrix => Connector KB
        Map<String, String> fieldsToSync = new Map<String, String>{
            'Configuration_Click_Path__c' => 'Configuration_Click_Path__c',
            'Company_Code__c' => 'Company_Code__c',
            'Product_Mapping_Click_Path__c' => 'Product_Mapping_Click_Path__c',
            'Client_Exemption_Click_Path__c' => 'Client_Exemption_Click_Path__c',
            'Location_Code_Click_Path__c' => 'Location_Code_Click_Path__c',
            'Line_Level_Addressing__c' => 'Line_Level_Addressing__c',
            'Timing_For_Tax_Calculation__c' => 'Timing_For_Tax_Calculation__c',
            'Timing_for_recording_Committing_Trans__c' => 'Timing_for_recording_Committing_Transa__c',
            'Notes__c' => 'Notes__c',
            'User_Implementation_Guide__c' => 'User_Guide_Documentation__c',
            'Implementation_Contact__c' => 'Contact__c',
            'Support_Support_Path__c' => 'Support_Support_Path__c',
            'Escalation_Contact__c' => 'Escalation_Contact__c',
            'Core_Notes__c' => 'Core_Notes__c',
            'Address_Validation_Click_Path__c' => 'Address_Validation_Click_Path__c',
            'API__c' => 'API__c',
            'Implemenation_Path__c' => 'Implementation_Path__c',

            'C_API__c' => 'C_API__c',
            'C_Address_Validation_Click_Path__c' => 'C_Address_Validation_Click_Path__c',
            'C_Client_Exemption_Click_Path__c' => 'C_Client_Exemption_Click_Path__c',
            'C_Company_Code__c' => 'C_Company_Code__c',
            'C_Configuration_Click_Path__c' => 'C_Configuration_Click_Path__c',
            'C_Implementation_Path__c' => 'C_Implementation_Path__c',
            'C_Line_Level_Addressing__c' => 'C_Line_Level_Addressing__c',
            'C_Location_Code_Click_Path__c' => 'C_Location_Code_Click_Path__c',
            'C_Notes__c' => 'C_Notes__c',
            'C_Product_Mapping_Click_Path__c' => 'C_Product_Mapping_Click_Path__c',
            'C_Support_Path__c' => 'C_Support_Path__c',
            'C_Timing_For_Tax_Calculation__c' => 'C_Timing_For_Tax_Calculation__c',
            'C_User_Implementation_Guide__c' => 'C_User_Implementation_Guide__c',
            'C_Location_Code_Click_Path__c' => 'C_Location_Code_Click_Path__c',
            'C_Timing_For_Recording_Committing_Tran__c' => 'C_Timing_For_Recording_Committing_Tran__c'
        };

        List<Connector_KB__kav> ckbs = [
            SELECT Id, Sales_Tax_Matrix__c, KnowledgeArticleId, Comm_Functional_Matrix__c,
                Version__r.Connector__r.Connector_Description__c,Version__r.Connector__r.Connector_EcoSystem_Test__c
            FROM Connector_KB__kav
            WHERE Sales_Tax_Matrix__c IN:fmMap.keySet() OR Comm_Functional_Matrix__c IN:fmMap.keySet()
        ];

        for(Connector_KB__kav ckb : ckbs){
            if( ckb.Version__r != NULL &&  ckb.Version__r.Connector__r != NULL){
                ckb.Connector_Description__c = ckb.Version__r.Connector__r.Connector_Description__c;
                ckb.Selling_Information__c = ckb.Version__r.Connector__r.Connector_EcoSystem_Test__c;
            }
            if(ckb.Sales_Tax_Matrix__c!= NULL && fmMap.get(ckb.Sales_Tax_Matrix__c) != NULL){
                Functional_Matrix__c fm = fmMap.get(ckb.Sales_Tax_Matrix__c);

                for(String f : fieldsToSync.keySet()){
                    if(fmOldMap == NULL || fmOldMap.get(ckb.Sales_Tax_Matrix__c).get(f) != fm.get(f)){
                        ckb.put(fieldsToSync.get(f), fm.get(f));
                    }
                }
            }

            if(ckb.Comm_Functional_Matrix__c != NULL && fmMap.get(ckb.Comm_Functional_Matrix__c) != NULL){
                Functional_Matrix__c fm = fmMap.get(ckb.Comm_Functional_Matrix__c);
                for(String f : fieldsToSync.keySet()){
                    if(f.startsWith('C_') && (fmOldMap == NULL || fmOldMap.get(ckb.Comm_Functional_Matrix__c).get(f) != fm.get(f))){
                        ckb.put(fieldsToSync.get(f), fm.get(f));
                    }
                }
            }
        }

        FunctionalMatrixSyncUtil.publishArticle(ckbs);
    }

    // creates a map of version vs all the recordtype id that version has
    private static Map<String,Set<Id>> matrixMap(List<Functional_Matrix__c> triggerNew){
        Set<String> versionIds = new Set<String>();
        Set<String> rTypeIds = new Set<String>();

        for(Functional_Matrix__c matrix : triggerNew){
            versionIds.add(matrix.Version__c);
            rTypeIds.add(matrix.RecordTypeId);
        }

        Map<String,Set<Id>> mMap = new Map<String,Set<Id>>();
        for(Functional_Matrix__c matrix : [
            SELECT Id, RecordTypeId, Version__c
            FROM Functional_Matrix__c
            WHERE Version__c IN:versionIds AND RecordTypeId IN:rTypeIds
        ]){
            if(!mMap.containsKey(matrix.Version__c)){
                mMap.put(matrix.Version__c,new Set<Id>());
            }
            mMap.get(matrix.Version__c).add(matrix.RecordTypeId);
        }
        return mMap;
    }

    //helper method
    private static Map<String,String> recordTypeMap(){
        Map<String,String> rTypeMap = new Map<String,String>();
        for(RecordType rt : [
            SELECT Id, Name
            FROM RecordType
            WHERE sObjectType = 'Functional_Matrix__c'
        ]){
            rTypeMap.put(rt.Id,rt.Name);
        }
        return rTypeMap;
    }
}