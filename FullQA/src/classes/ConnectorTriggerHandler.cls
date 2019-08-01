public class ConnectorTriggerHandler extends TriggerHandler{

    //Trigger Handler Methods
    /*
  	protected override void beforeInsert(){}

  	protected override void beforeUpdate(){}
  	
    protected override void beforeDelete(){}

    protected override void afterDelete(){}

    protected override void afterUndelete(){}
  */
    protected override void afterUpdate(){
      Set<Id> connectorId = new Set<Id>();
      Map<Id,Connector_KB__kav> ConKbMap = new Map<Id,Connector_KB__kav>();
      Set<String> uniqueIds = new Set<String>();
      List<Connector_KB__kav> articlesToUpdate = new List<Connector_KB__kav>();
      
      for( Connector__c conn : (List<Connector__c>)Trigger.new)
      {
          Connector__c oldConn = (Connector__c)trigger.oldMap.get(Conn.Id);
          if(conn.Vibrancy__c !=null && conn.Vibrancy__c != 'Retired'){
	          if(Conn.Connector_EcoSystem_Test__c != oldConn.Connector_EcoSystem_Test__c || Conn.Connector_Description__c != oldConn.Connector_Description__c){
	              connectorId.add(conn.id);
	           }
          }
      }
      List<Version__c> verList = [Select Id,Name,Connector__c, Version_KB__r.Account__c, Version_KB__r.Title__c, Version_KB__r.User_Guide_Documentation__c,
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
            FROM Version__c where Version_KB__c <> NULL AND  Connector__c IN : connectorId];
        System.debug('verList'+verList);
     
       for(Version__c ver : verList){
            uniqueIds.add(ver.Version_KB__c + '||' + ver.Id);
        }
        
        Map<String,Connector_KB__kav> articleMap = new Map<String,Connector_KB__kav>();
        for(Connector_KB__kav obj : [
            SELECT Id,Unique_Identifier__c, KnowledgeArticleId,Selling_Information__c
            FROM Connector_KB__kav
            WHERE Unique_Identifier__c <> NULL AND  Language = 'en_US' AND PublishStatus ='online' AND Unique_Identifier__c IN:uniqueIds
        ]){
            articleMap.put(obj.Unique_Identifier__c, obj);
         }
          System.debug('articleMap'+articleMap);
         for(Version__c ver : verList){
            String uId = ver.Version_KB__c + '||' + ver.Id;
            // convert solution object to article object
            Connector_KB__kav kav = VersionArticleManager.toArticle(ver);
            if(articleMap.containsKey(uId) ){
                // change to map so that KnowledgeArticleId can be assingned, since its not writable
                Map<String, Object> oMap = (Map<String, Object>)JSON.deserializeUntyped(JSON.serialize(kav));
                oMap.put('Id', articleMap.get(uId).Id);
                oMap.put('KnowledgeArticleId', articleMap.get(uId).KnowledgeArticleId);
                kav = (Connector_KB__kav)JSON.deserialize( JSON.serialize(oMap), Connector_KB__kav.class);
                if(kav.Selling_Information__c != ver.Connector__r.Connector_EcoSystem_Test__c ){
                 kav.Selling_Information__c = ver.Connector__r.Connector_EcoSystem_Test__c;
                }
                if(kav.Connector_Description__c != ver.Connector__r.Connector_Description__c ){
                 kav.Connector_Description__c = ver.Connector__r.Connector_Description__c;
                }
                articlesToUpdate.add(kav);
            }
         }
        // System.debug('articlesToUpdate'+articlesToUpdate);
         if(!articlesToUpdate.isEmpty()){
            List<Connector_KB__kav> knowledgeList = FunctionalMatrixSyncUtil.publishArticle(articlesToUpdate);
            FunctionalMatrixSyncUtil.process(knowledgeList);       	 
         }  
    }   
}