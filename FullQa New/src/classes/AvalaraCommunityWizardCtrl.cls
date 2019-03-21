public without Sharing class AvalaraCommunityWizardCtrl {

    public Account acc {get; set;}
    public String connectorId{get; set;}
    public String versionId{get; set;}
    public Connector__c connector { get; set; }
    public List<Selectoption> connectorTypes {get;set;}
    public List<Selectoption> sdkPlatforms {get;set;}
    public List<Selectoption> onboardingEntitlements {get;set;}
    public Attachment att {get;set;}
    public String selectorVersion{get;set;}
    public String tranasctionSignature{get;set;}
    public String downLoadUserGuideTemplate{get;set;}
    public String submitUserGuideURL {get;set;}
    public String submitDemoVideoURL {get;set;}
    public Task t {get;set;}
    public Version__c version {get;set;}
    public static Note__c n {get;set;}
    public String sfBaseUrl {get;set;}
    public Draft_Knowledge__c knowledge {get;set;}
    public Integer randomJsIden{get;set;}

    @TestVisible
    private static String accountIdOverride;

    public AvalaraCommunityWizardCtrl(){
        if(UserInfo.getUserType() != 'Guest'){
            Connector_KB__kav connectorKB = new Connector_KB__kav();
            knowledge = new Draft_Knowledge__c();
            randomJsIden = getRandomNumber(1000000);
            sfBaseUrl = System.URL.getSalesforceBaseUrl().toExternalForm();
            acc = getAccount();
            versionId = '';
            if(!acc.Connectors__r.isEmpty()){
                connectorId = acc.Connectors__r[0].Id;
                connector = acc.Connectors__r[0];
                versionId = fetchVersion(connectorId);
                selectVersion();
            }
            String vId = ApexPages.currentPage().getParameters().get('vid');
            t = new Task(WhatId = vId,Subject = 'Please Follow up with this version');

            if(String.isNotBlank(vId)){
                versionId = vId;
                version = [
                    SELECT Id,Name,Connector__r.Name,Primary_Signature__c,X_Avalara_UID__c
                    FROM Version__c WHERE Id =:vId
                ];
                selectVersion();
                knowledge = getKnowledge(vId);
                if(knowledge.Id == NULL){
                    connectorKB = getConnectorKB(vId);
                    Id connectorKBId = connectorKB.Id;
                    connectorKB.Id = NULL;
                    knowledge = (Draft_Knowledge__c)JSON.deserialize(JSON.serialize(connectorKB), Draft_Knowledge__c.class);
                    // assign connectorKBId to knowledge lookup field
                }

            }
            att = new Attachment(parentId = acc.Id);
        }
    }

    public List<Attachment> getVersionAttachment(){
        return [
          SELECT Id,Name
          FROM Attachment
          WHERE ParentId =:acc.Id
              AND Description = 'Avalara Launch Center Logo'
          ORDER BY CreatedDate DESC
        ];
    }

    public void selectConnector(){
        List<Version__c> vers = new List<Version__c>();
        if(connectorId != NULL){
            vers =  [
                SELECT Id,Name,Connector__r.Name
                FROM Version__c
                WHERE Connector__c = :connectorId
            ];
            Map<Id,Connector__c>connectorMap = new Map<Id,Connector__c>(acc.Connectors__r) ;
            connector = connectorMap.get(connectorId);
        }

        if(vers.size() ==1){
            versionId = vers[0].Id;
            selectVersion();
        }
    }

    public pageReference selectVersion(){
        if(String.isNotBlank(versionId)){
            Connector_KB__kav connectorKB = getConnectorKB(versionId);
            Id connectorKBId = connectorKB.Id;
            connectorKB.Id = NULL;
            knowledge = (Draft_Knowledge__c)JSON.deserialize(JSON.serialize(connectorKB), Draft_Knowledge__c.class);
        }
        return null;
    }

    public List<SelectOption> getActiveConnectors(){
        List<SelectOption> options = new List<SelectOption>{
            new SelectOption('','--None--')
        };

        for(Connector__c c: acc.Connectors__r){
            options.add(new SelectOption(c.Id, c.Name));
        }
        return options;
    }

    public List<SelectOption> getVersions(){
        List<SelectOption> options = new List<SelectOption>{
            new SelectOption('','--None--')
        };
        if(connectorId != NULL){
            for(Version__c v : [
                SELECT Id,Name,Connector__r.Name
                FROM Version__c
                WHERE Connector__c = :connectorId
            ]){
                options.add(new SelectOption(v.Id, v.Name));
            }
        }

        return options;
    }

    private static Account getAccount(){
        String accId = accountIdOverride != NULL ? accountIdOverride : [
            SELECT AccountId
            FROM User WHERE Id = :Userinfo.getUserId()
        ].AccountId;

        if(accId == null){
            for(User u : [SELECT Id,AccountId FROM User WHERE AccountId!= NULL And ContactId= '0033300001s2V6d' LIMIT 1]){
                accId = u.AccountId;
            }
        }
        return [
            SELECT
                Id,BillingStreet,BillingCity,
                BillingState,BillingPostalCode,ShippingStreet,
                ShippingCity,ShippingState,ShippingPostalCode,
                BillingCountry,ShippingCountry,BusDevOwner__r.Name,
                (
                    SELECT
                        Id,Solution_Provider__c,DSPWebsite__c,BDNotes__c,
                        Name,Contract_Signed_Date__c,Owner.Name,Marketing_Notes__c ,
                        Solution_Provider__r.Name,TAM_Total_Addressable_Market__c,
                        Primary_Business_Contact__c,Managed_By__r.Name,Primary_Technical_Contact__c,Primary_Marketing_Contact__c,PLT_Owner__r.Name
                    FROM Connectors__r
                    WHERE Name != null
                    AND (NOT Name  like 'Deprecated%')
                )
            FROM Account
            WHERE Id =:accId
        ];
    }

    public pageReference saveAndRedirect(){
        uploadAttachment();
        updateVersionStep(versionId,1);
        return Page.AvalaraTellUs;
    }

    // STEP 1
    public PageReference updateAccountDetail(){
        PageReference p ;
        try{
            update acc;
            update connector;
            p = page.AvalaraSolutionReview;
            p.getParameters().put('Id',acc.Id);
            p.getParameters().put('vid',versionId);
            p.setRedirect(true);
            updateVersionStep(versionId,1);
        }
        catch(exception e){
            ApexPages.addMessages(e);
            p = null;
        }
        return p;
    }

    // STEP 2
    public pagereference saveRecord(){
        PageReference p ;
        try{
            if(knowledge.Sales_Tax_Matrix__c != NULL){
                update knowledge.Sales_Tax_Matrix__r;
            }
            knowledge.Version__c = ApexPages.currentPage().getParameters().get('vid');
            upsert knowledge;
            p = page.AvalaraUploadEvidence;
            p.getParameters().put('Id',acc.Id);
            p.getParameters().put('vid',versionId);
            p.setRedirect(true);
            updateVersionStep(versionId,2);
        }
        catch(exception e){
            ApexPages.addMessages(e);
            p = null;
        }
        return p;
    }

    // STEP 3
    public pageReference uploadAttachment(){
        try{
           // upsert t;
            if(att.Body != NULL){
                att.Description = 'Avalara Launch Center Logo';
                insert att;
                att.Body = NULL;
            }

            update knowledge ;
            PageReference p = page.AvalaraCustomerReference ;
            p.getParameters().put('Id',acc.Id);
            p.getParameters().put('vid',versionId);
            p.setRedirect(true);
            updateVersionStep(versionId,3);
            return p;
        }
        catch(Exception e){
            ApexPages.addMessages(e);
            return null;
        }
    }

    public pagereference updateConnector(){
        try{
            update connector;
        }
        catch(Exception e){
            ApexPages.addMessages(e);

        }
        return null;
    }

    public List<Map<String,Object>> getOpenOpportunitiesMap(){
        List<Map<String,Object>> oppMap = new List<Map<String,Object>>();
        for(Opportunity opp : [
            SELECT Id,Name
            FROM Opportunity
            WHERE Connector__c != NULL AND Connector__c = :connectorId
            AND IsClosed = false
        ]){
           oppMap.add(opp.getPopulatedFieldsAsMap());
        }
        return oppMap;
    }

    public List<GoLive_Implementation__c> getAssociates(){
        return [
            SELECT Account__r.Name
            FROM GoLive_Implementation__c
            WHERE Connector__c =:connectorId AND Calc_Status__c = 'Live'
        ];
    }

    private static String fetchVersion(String connectorId){
        String vId = '';
        List<Version__c> vers = [
            SELECT Id,Name,Connector__r.Name
            FROM Version__c
            WHERE Connector__c = :connectorId
        ];
        if(vers.size() ==1)
           vId = vers[0].Id;

        return vId;
    }

    private pagereference updateVersionStep(String versionId,Decimal step){
        try{
            update new Version__c(Id = versionId,Step__c = step);
        }
        catch(Exception e){
            ApexPages.addMessages(e);
        }
        return NULL;
    }

    @RemoteAction
    public static List<Object> getToolTips(){
        return[
          SELECT Id,Label,Text__c
          FROM Community_Help_Text__mdt
        ];
    }

    @RemoteAction
    public static List<Note__c> fetchVersionNote(String pId){
        return [
          SELECT Id,Name,Body__c,OwnerId,Owner.Username,CreatedDate
          FROM Note__c
          WHERE Private__c = false AND Parent__c =:pId
        ];
    }

    @RemoteAction
    public static Object insertVersionNote(String pId,String bodytext){
        n = new Note__c(
          Parent__c = pId,
          Name = 'Avalara Portal',
          Body__c = bodytext,
          Private__c = false
        );
        insert n;
        return n;
    }

    @RemoteAction
    public static List<SObject> getRequirements(String versionId){
        return [
            SELECT Id, Functional_Requirement_Name__c, Date__c,
                Functional_Matrix_Requirements_Config__r.Core_Type__c,
                Functional_Matrix_Requirements_Config__r.Section__c,
                Functional_Matrix_Requirements_Config__r.SubHeader__c
            FROM Functional_Matrix_Requirement__c
            WHERE
                Functional_Matrix__r.Version__c = :versionId
                AND Functional_Matrix_Requirements_Config__r.Certification_Type__c <> NULL
            ORDER BY Functional_Matrix_Requirements_Config__r.Certification_Type_Sort_Order__c ASC,
                Functional_Matrix_Requirements_Config__r.Subheader_Sort__c ASC,
                Functional_Matrix_Requirements_Config__r.Sort_Order__c ASC  NULLS LAST
        ];
    }

    @Testvisible
    private static Draft_Knowledge__c getKnowledge(String vId) {
        Draft_Knowledge__c k = new Draft_Knowledge__c();
        String query = 'SELECT ';
        for(Schema.FieldSetMember f : SObjectType.Draft_Knowledge__c.FieldSets.CustomerKnowledgeCommunity.getFields()) {
            query += f.getFieldPath() + ', ';
        }
        query += 'Id, Name,Sales_Tax_Matrix__r.Timing_For_Tax_Calculation__c FROM Draft_Knowledge__c WHERE Version__c = :vId AND Approved__c = false LIMIT 1';
        for(Draft_Knowledge__c obj : Database.query(query)){
            k = obj;
            break;
        }
        return k;
    }

    @Testvisible
    private static Connector_KB__kav getConnectorKB(String vId) {
        Connector_KB__kav ckb = new Connector_KB__kav();
        String query = 'SELECT ';
        for(Schema.FieldSetMember f : SObjectType.Draft_Knowledge__c.FieldSets.CustomerKnowledgeCommunity.getFields()) {
            query += f.getFieldPath() + ', ';
        }
        query += 'Id,Sales_Tax_Matrix__r.Timing_For_Tax_Calculation__c FROM Connector_KB__kav WHERE Version__c = :vId AND Language=\'en_US\' AND PublishStatus=\'online\' LIMIT 1';
        for(Connector_KB__kav obj : Database.query(query)){
            ckb = obj;
            break;
        }
        return ckb;
    }

    @TestVisible
    private Functional_Matrix__c toFunctionalMatrix(Draft_Knowledge__c knowledge){
        Functional_Matrix__c fm = new Functional_Matrix__c(
            Id = knowledge.Sales_Tax_Matrix__c,
            Company_Code__c = knowledge.Company_Code__c,
            Address_Validation_Click_Path__c = knowledge.Address_Validation_Click_Path__c,
            Product_Mapping_Click_Path__c = knowledge.Product_Mapping_Click_Path__c,
            Client_Exemption_Click_Path__c = knowledge.Client_Exemption_Click_Path__c,
            Location_Code_Click_Path__c = knowledge.Location_Code_Click_Path__c,
            Line_Level_Addressing__c = knowledge.Line_Level_Addressing__c,
            Timing_For_Tax_Calculation__c = knowledge.Sales_Tax_Matrix__r.Timing_For_Tax_Calculation__c
        );
        return fm;
    }

    private Integer getRandomNumber(Integer size){
        Double d = Math.random() * size;
        return d.intValue();
    }

}