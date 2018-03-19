public class VersionArticleManager{

    public static void process(List<Version__c> triggerNew){

        List<Connector_KB__kav> articles = new List<Connector_KB__kav>();

        List<Version__c> versions = getVersions(triggerNew);

        for(Version__c v : versions){
            Connector_KB__kav ka = toArticle(v);
            articles.add(ka);
            //articles.add(toArticle(v));
        }


        if(!articles.isEmpty()){
            insert articles;
            FunctionalMatrixSyncUtil.publishNewArticle(new Map<Id, Connector_KB__kav>(articles).keySet());
        }
    }

    public static Connector_KB__kav toArticle(Version__c v){
        Connector_KB__kav ckb = new Connector_KB__kav();
        ckb.Connector__c = v.Connector__c;
        // ckb.Partner_Fee__c = v.Connector__r.Partner_Fee__c;
        ckb.Connector_Description__c = v.Connector__r.Connector_Description__c;
        ckb.Selling_Information__c = v.Connector__r.Connector_EcoSystem_Test__c;
        ckb.Version__c = v.Id;
        if(v.Version_KB__c <> NULL){
            ckb.Title = v.Version_KB__r.SolutionName;
            ckb.UrlName = (v.Connector__r.Name + '-' + v.Name + '-' + v.Version_KB__r.SolutionName).replaceAll('[^a-zA-Z0-9]',' ').normalizeSpace().toLowerCase().replaceAll(' ','-');
            ckb.Unique_Identifier__c = v.Version_KB__c + '||' + v.Id;
            ckb.Account__c = v.Version_KB__r.Account__c;
            ckb.User_Guide_Documentation__c = v.Version_KB__r.User_Guide_Documentation__c;
            ckb.Submit_Demo_Video_url__c = v.Version_KB__r.Submit_Demo_Video_url__c;
            ckb.Submit_User_Guide_url__c = v.Version_KB__r.Submit_User_Guide_url__c;
            ckb.Escalation_Contact__c = v.Version_KB__r.Escalation_Contact__c;
            ckb.Download_User_Guide_Template__c = v.Version_KB__r.Download_User_Guide_Template__c;

            ckb.Configuration_Click_Path__c = v.Version_KB__r.Configuration_Screen__c;
            ckb.Company_Code__c = v.Version_KB__r.Company_Code__c;
            ckb.Product_Mapping_Click_Path__c = v.Version_KB__r.Mapping__c;
            ckb.Client_Exemption_Click_Path__c = v.Version_KB__r.Exemptions__c;
            ckb.Timing_for_Tax_Calculation__c = v.Version_KB__r.Timing_Process_for_Tax_Calc__c;
            ckb.Timing_for_recording_Committing_Transa__c = v.Version_KB__r.Committing_Transactions__c;
            ckb.Line_Level_Addressing__c = v.Version_KB__r.Warehouse_Ship_to_by_Line__c;
            ckb.Notes__c = v.Version_KB__r.Known_Issues__c;
            ckb.API__c = v.Version_KB__r.SDK_Platform__c;
            ckb.Implementation_Path__c = v.Version_KB__r.Implementation_Instructions__c;
            ckb.Support_Support_Path__c  = v.Version_KB__r.Customer_Support_Info__c;
            ckb.Support_Notes__c = v.Version_KB__r.Support_Escalation_Info__c;
            ckb.Core_Notes__c = v.Version_KB__r.Address_Validation_Batch_Utlity__c;
            ckb.Contact__c = v.Version_KB__r.Installation_Contact__c;
        }
        else{
            ckb.Title = v.Name ;
            ckb.UrlName = (v.Connector__r.Name + '-' + v.Name).replaceAll('[^a-zA-Z0-9]',' ').normalizeSpace().toLowerCase().replaceAll(' ','-');
            ckb.Unique_Identifier__c = v.Id;
        }

        return ckb;
    }

    private static List<Version__c> getVersions(List<Version__c> triggerNew){
        return [
            SELECT Name,Version_KB__c,Version_KB__r.SolutionName,Version_KB__r.Account__c,Version_KB__r.User_Guide_Documentation__c,
               Version_KB__r.Submit_Demo_Video_url__c,Version_KB__r.Submit_User_Guide_url__c,Version_KB__r.Escalation_Contact__c,
               Version_KB__r.Download_User_Guide_Template__c,Version_KB__r.Configuration_Screen__c,Version_KB__r.Company_Code__c,
               Version_KB__r.Mapping__c,Version_KB__r.Exemptions__c,Version_KB__r.Timing_Process_for_Tax_Calc__c,Version_KB__r.Committing_Transactions__c,
               Version_KB__r.Warehouse_Ship_to_by_Line__c,Version_KB__r.Known_Issues__c,Version_KB__r.SDK_Platform__c,Version_KB__r.Implementation_Instructions__c,
               Version_KB__r.Customer_Support_Info__c,Version_KB__r.Support_Escalation_Info__c,Version_KB__r.Address_Validation_Batch_Utlity__c,Version_KB__r.Installation_Contact__c,
               Connector__r.Connector_Description__c,Connector__r.Name, Connector__r.Connector_EcoSystem_Test__c
            FROM Version__c
            WHERE Id IN :triggerNew];
    }
}