public class AvalaraSearchCtrl {

    @RemoteAction
    public static Object getConnectors(String searchText){
        searchText ='%'+searchText+'%';
        List<Connector__c> connectorsSearch = [FIND :searchText IN NAME FIELDS RETURNING Connector__c(Id)][0];
        List<Connector__c> connectors =  [
            SELECT Id,Name,Vibrancy__c, Platform_Cateogry__c, SAM__r.Name, Author__c,SAM__r.Email,PLT_Owner__c,PLT_Owner__r.Name,PLT_Owner__r.Email,
                Early_Adopter_Sales_Owner__r.Name, Early_Adopter_Sales_Owner__c, SAM__c,Early_Adopter_Sales_Owner__r.Email,
                (SELECT Id,Name,Parent_Version__c FROM Versions__r WHERE Status__c != 'Revoked/Terminated' Order By Sort_Order__c ASC NULLS FIRST)
            FROM Connector__c
            WHERE name LIKE :('%'+searchText+'%')
                AND Vibrancy__c != 'Error'
                AND Vibrancy__c != 'Marketing'
                AND Vibrancy__c != 'Retired'
                AND Vibrancy__c != 'dormant'
        ];

        List<Badge__c> badges = [
            SELECT Id, Name, Status__c, Type__c, Version__c,Date_Achieved__c
            FROM Badge__c
            WHERE Type__c <> NULL
                AND Status__c <> NULL
                AND Version__r.Connector__c IN: connectors
            ORDER BY Sort_Order__c ASC,Type__c DESC, Status__c DESC Nulls Last
        ];

        return new Map<String, List<Object>>{
            'connectors' => connectors,
            'badges' => badges
        };
    }

    @RemoteAction
    public static List<Badge_Setting__mdt> getSettings(){
        return [
            SELECT Id, Label, Status__c, Type__c, Badge_Resource_Path__c
            FROM Badge_Setting__mdt
        ];
    }

    @RemoteAction
    public static List<Contact> getContacts(String name){
        name = '%' + name  +'%';
        return [
            SELECT Id, Name, Email
            FROM Contact
            WHERE Name LIKE :name
            LIMIT 1000
        ];
    }


    @RemoteAction
    public static List<Account> getAccounts(String name){
        name = '%' + name  +'%';
        return [
            SELECT Id, Name
            FROM Account
            WHERE Name LIKE :name
            LIMIT 1000
        ];
    }

    @RemoteAction
    public static List<Case> getCases(String caseNum){
        caseNum = '%' + caseNum  +'%';
        return [
            SELECT Id, CaseNumber, Subject
            FROM Case
            WHERE CaseNumber LIKE :caseNum
            LIMIT 1000
        ];
    }

    @RemoteAction
    public static List<Connector_KB__kav> getArticle(String vId){
        return [
            SELECT Id,KnowledgeArticleId, Version__c, Version__r.Name, Connector_Type__c, Connector_Vibrancy__c,
                Connector__r.Name, Platform_Category__c, Avalara_Professional_Services_Notes__c,Sales_Engineer_Notes__c,
                Support_Plans__c, Implementation_Notes__c, Implementation_Path__c, Contact__r.Name,
                Support_Notes__c, Support_Path__c, Escalation_Contact__r.Name, Who_papers_the_agreement__c,
                API__c, Configuration_Click_Path__c,Company_Code__c,Address_Validation_Click_Path__c,
                Product_Mapping_Click_Path__c, Client_Exemption_Click_Path__c,Location_Code_Click_Path__c,
                Line_Level_Addressing__c, Sales_Engineer_Required__c, Avalara_Professional_Services_Required__c,
                Version__r.Connector__r.Partner_Fee__c, Selling_Information__c, Connector_Description__c, Account__r.Name,
                Sales_Tax_Matrix__c, Timing_For_Tax_Calculation__c, Connector__r.SAM__r.Name,
                Connector__r.Early_Adopter_Sales_Owner__r.Name, Connector__r.Vibrancy__c, Notes__c,Contract_Author__c,
                X_Avalara_Client__c, X_Avalara_Client_Old__c,User_Guide_Documentation__c,User_Guide_URL__c,C_Notes__c,C_User_Implementation_Guide__c,C_Support_Path__c,
                C_Implementation_Path__c,C_Company_Code__c,C_Configuration_Click_Path__c,C_Address_Validation_Click_Path__c,C_Product_Mapping_Click_Path__c,C_Timing_For_Tax_Calculation__c,
                C_Client_Exemption_Click_Path__c,C_Timing_For_Recording_Committing_Tran__c,C_Location_Code_Click_Path__c,C_Line_Level_Addressing__c,C_API__c,Support_Support_Path__c,
                Timing_for_recording_Committing_Transa__c,
                    SI_Documentation__c,Connector_Training__c,Connector_Demo__c,Connector_Communication__c,Connector_Endorsed_by_UX__c,Connector_Download_Location__c,Market_Ready_Notes__c
            FROM Connector_KB__kav
            WHERE Version__c <> NULL
                AND Version__c =:vId LIMIT 1
        ];
    }

    @RemoteAction
    public static List<Functional_Matrix_Requirement__c> getRequirements(String vId,String type){
        return [
            SELECT Id, Functional_Requirement_Name__c,Date__c, Functional_Matrix_Requirements_Config__r.Core_Type__c,Note__c,
                Functional_Matrix_Requirements_Config__r.Section__c, Functional_Matrix_Requirements_Config__r.SubHeader__c
            FROM Functional_Matrix_Requirement__c
            WHERE Functional_Matrix__r.Version__c = :vId
                AND Functional_Matrix_Requirements_Config__r.Certification_Type__c <> NULL
                AND Functional_Matrix_Requirements_Config__r.Certification_Type__c = :type
            ORDER BY Functional_Matrix_Requirements_Config__r.Certification_Type_Sort_Order__c ASC,
                Functional_Matrix_Requirements_Config__r.Subheader_Sort__c ASC,
                Functional_Matrix_Requirements_Config__r.Sort_Order__c ASC  NULLS LAST
        ];
    }

    @RemoteAction
    public static Task createTask(Task tsk){
        tsk.RecordTypeId = Schema.SObjectType.Task.getRecordTypeInfosByName().get('Support Activity').getRecordTypeId();
        tsk.ActivityDate = tsk.ActivityDate == NULL ? getNextBizDay().date() : tsk.ActivityDate;
        insert tsk;
        return tsk;
    }

    @RemoteAction
    public static User getUser(String uId){
        return [
            SELECT Id,Email
            FROM User
            WHERE Id =:uId
        ];
    }

    private static DateTime getNextBizDay(){
        BusinessHours bh = getBusinessHours();
        return BusinessHours.nextStartDate(bh.id, System.now().addDays(1));
    }

    private static BusinessHours bh_cache;
    private static BusinessHours getBusinessHours(){
        if(bh_cache == NULL){
            bh_cache = [
                SELECT Id
                FROM BusinessHours
                WHERE IsDefault = true
            ];
        }
        return bh_cache;
    }
}