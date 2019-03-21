public Class ArticleApprovalManager{

    public static void process(List<Draft_Knowledge__c> newKnowledges,List<Draft_Knowledge__c> oldKnowledges){

        Set<Id> versionIds = new Set<Id>();
        List<Connector_KB__kav> knowledges = new List<Connector_KB__kav>();

        for(Integer i = 0 ; i < newKnowledges.size() ; i++){
            if((Trigger.isInsert && newKnowledges[i].Approved__c == true) ||
               (Trigger.isUpdate && newKnowledges[i].Approved__c == true && newKnowledges[i].Approved__c != oldKnowledges[i].Approved__c)
            ){
                versionIds.add(newKnowledges[i].Version__c);
            }
        }

        Map<String,Connector_KB__kav> knowledgeMap = buildKnowledgeMap(versionIds);

        for(Integer i = 0 ; i < newKnowledges.size() ; i++){
            if((Trigger.isInsert && newKnowledges[i].Approved__c == true) ||
               (Trigger.isUpdate && newKnowledges[i].Approved__c == true && newKnowledges[i].Approved__c != oldKnowledges[i].Approved__c)
            ){
                if(knowledgeMap.get(newKnowledges[i].Version__c) != NULL){
                    knowledges.add(assignValueFromCustomerKnowledge(newKnowledges[i],knowledgeMap.get(newKnowledges[i].Version__c)));
                }
            }
        }
        List<Connector_KB__kav> knowledgeList = publishArticle(knowledges);
    }

    private static Map<String,Connector_KB__kav> buildKnowledgeMap(Set<Id> versionIds){
        Map<String,Connector_KB__kav> knowledgeMap = new Map<String,Connector_KB__kav>();
        for(Connector_KB__kav k : getData(versionIds)){
            knowledgeMap.put(k.Version__c,k);
        }
        return knowledgeMap;
    }
  @TestVisible
    private static Connector_KB__kav assignValueFromCustomerKnowledge(Draft_Knowledge__c cus,Connector_KB__kav kav){
        Connector_KB__kav conkav = kav.Id != NULL ? kav : new Connector_KB__kav();
        for(Schema.FieldSetMember f : getFields()) {
            String val = (String)cus.get(f.getFieldPath());
            conkav.put(f.getFieldPath(),val);
        }
        return conKav;
    }

    private static List<Schema.FieldSetMember> getFields() {
        return SObjectType.Draft_Knowledge__c.FieldSets.CustomerKnowledgeCommunity.getFields();
    }

    private static List<Connector_KB__kav> getData(Set<Id> versionIds) {
        String query = 'SELECT ';
        for(Schema.FieldSetMember f : getFields()) {
            query += f.getFieldPath() + ', ';
        }
        query += 'Id,Version__c,KnowledgeArticleId,ArticleNumber FROM Connector_KB__kav WHERE Version__c IN :versionIds';
        return Database.query(query);
    }

    private static List<Connector_KB__kav> publishArticle(List<Connector_KB__kav> knowledges){
        for(Connector_KB__kav ck : knowledges){
            ck.Id = KBManagement.PublishingService.editOnlineArticle(ck.KnowledgeArticleId,true);
        }
        update knowledges;
        for(Connector_KB__kav ck : knowledges) {
            KbManagement.PublishingService.publishArticle(ck.KnowledgeArticleId, true);
        }
        return knowledges;
    }
}