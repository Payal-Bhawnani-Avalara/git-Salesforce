global class VersionArticleConversionBatch implements Database.batchable<SObject>{

    public static void run(){
        VersionArticleConversionBatch b = new VersionArticleConversionBatch();
        Database.executeBatch(b,1);
    }

    global database.QueryLocator start(Database.BatchableContext info){
        return Database.getQueryLocator([
            SELECT Id,
                Name,
                Connector__c,
                Version_KB__r.Account__c,
                Version_KB__r.Title__c,
                Version_KB__r.User_Guide_Documentation__c,
                Version_KB__r.Submit_Demo_Video_url__c,
                Version_KB__r.Submit_User_Guide_url__c,
                Version_KB__r.Escalation_Contact__c,
                Version_KB__r.Download_User_Guide_Template__c,
                Version_KB__r.SolutionName,
                Connector__r.Name,
                Version_KB__c,
                Version_KB__r.Configuration_Screen__c,
                Version_KB__r.Exemptions__c,
                Version_KB__r.Company_Code__c,
                Version_KB__r.Mapping__c,
                Version_KB__r.Timing_Process_for_Tax_Calc__c,
                Version_KB__r.Committing_Transactions__c,
                Version_KB__r.Warehouse_Ship_to_by_Line__c,
                Version_KB__r.Known_Issues__c,
                Version_KB__r.SDK_Platform__c ,
                Version_KB__r.Installation_Contact__c,
                Version_KB__r.Implementation_Instructions__c,
                Version_KB__r.Customer_Support_Info__c,
                Version_KB__r.Support_Escalation_Info__c,
                Version_KB__r.Address_Validation_Batch_Utlity__c,
                Connector__r.Connector_Description__c,
                Connector__r.Connector_EcoSystem_Test__c,
                Connector__r.Partner_Fee__c
            FROM Version__c
            WHERE Version_KB__c <> NULL
        ]);
    }

    global void execute(Database.BatchableContext info, List<Version__c> scope){
        List<Connector_KB__kav> articlesToInsert = new List<Connector_KB__kav>();
        List<Connector_KB__kav> articlesToUpdate = new List<Connector_KB__kav>();
        Set<String> kbIds = new Set<String>();
        Set<String> uniqueIds = new Set<String>();

        for(Version__c ver : scope){
            uniqueIds.add(ver.Version_KB__c + '||' + ver.Id);
        }
		System.debug('--'+uniqueIds);
        Map<String,Connector_KB__kav> articleMap = getArticleMap(uniqueIds);
        for(Version__c ver : scope){
            String uId = ver.Version_KB__c + '||' + ver.Id;
            // convert solution object to article object
            Connector_KB__kav kav = VersionArticleManager.toArticle(ver);
            if(articleMap.containsKey(uId)){
                // change to map so that KnowledgeArticleId can be assingned, since its not writable
                Map<String, Object> oMap = (Map<String, Object>)JSON.deserializeUntyped(JSON.serialize(kav));
                oMap.put('Id', articleMap.get(uId).Id);
                oMap.put('KnowledgeArticleId', articleMap.get(uId).KnowledgeArticleId);
                kav = (Connector_KB__kav)JSON.deserialize( JSON.serialize(oMap), Connector_KB__kav.class);
                articlesToUpdate.add(kav);
            }
            else{
                articlesToInsert.add(kav);
            }
        }

        // insert the new articles
        if(!articlesToInsert.isEmpty()){
            insert articlesToInsert;
            FunctionalMatrixSyncUtil.publishNewArticle(new Map<Id, Connector_KB__kav>(articlesToInsert).keySet());
            FunctionalMatrixSyncUtil.process(articlesToInsert);
        }

        // update and publish the existing articles
        if(!articlesToUpdate.isEmpty()){
            List<Connector_KB__kav> knowledgeList = FunctionalMatrixSyncUtil.publishArticle(articlesToUpdate);
            FunctionalMatrixSyncUtil.process(knowledgeList);
        }
    }

    global void finish(Database.BatchableContext info){}

    private static Map<String,Connector_KB__kav> getArticleMap(Set<String> uniqueIds){
        Map<String,Connector_KB__kav> articleMap = new Map<String,Connector_KB__kav>();
        for(Connector_KB__kav obj : [
            SELECT Id,Unique_Identifier__c, KnowledgeArticleId
            FROM Connector_KB__kav
            WHERE Unique_Identifier__c <> NULL AND Unique_Identifier__c IN:uniqueIds
        ]){
            articleMap.put(obj.Unique_Identifier__c, obj);
        }
        return articleMap;
    }

}