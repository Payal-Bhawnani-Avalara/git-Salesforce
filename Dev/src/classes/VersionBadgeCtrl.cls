global with sharing class VersionBadgeCtrl {

    global VersionBadgeCtrl(ApexPages.StandardController ctrl) {}

    @RemoteAction
    global Static List<Badge_Setting__mdt> getSettings(){
        return [
            SELECT Id, Label, Status__c, Type__c,Badge_Resource_Path__c
            FROM Badge_Setting__mdt
        ];
    }

    @RemoteAction
    global static List<Badge__c> getBadges(String vId){
        return [
            SELECT Id, Name, Status__c, Type__c, Date_Achieved__c
            FROM Badge__c
            WHERE Version__c =:vId AND Type__c <> NULL AND Status__c <> NULL
            ORDER BY Sort_Order__c ASC,Type__c DESC, Status__c DESC
        ];
    }

    @RemoteAction
    global static List<Functional_Matrix_Requirement__c> getRequirements(String vId,String type){
        return [
            SELECT Id,Functional_Requirement_Name__c,Date__c,Functional_Matrix_Requirements_Config__r.Core_Type__c,Note__c,
                Functional_Matrix_Requirements_Config__r.Section__c,Functional_Matrix_Requirements_Config__r.SubHeader__c
            FROM Functional_Matrix_Requirement__c
            WHERE Functional_Matrix__r.Version__c =:vId
                AND Functional_Matrix_Requirements_Config__r.Certification_Type__c <> NULL
                AND Functional_Matrix_Requirements_Config__r.Certification_Type__c = :type
            ORDER BY Functional_Matrix_Requirements_Config__r.SubHeader__c ASC, Functional_Matrix_Requirements_Config__r.Sort_Order__c ASC
        ];
    }
}