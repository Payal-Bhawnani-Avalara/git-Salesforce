public with sharing class QQButton_Controller {
	 @AuraEnabled
    public static void qqAddSOWItem(String opportunityId){
        Opportunity op = [SELECT Id, QQ_Add_On_Professional_Services_LI__c FROM Opportunity WHERE Id=:opportunityId];
        op.QQ_Add_On_Professional_Services_LI__c =true;
        update op;
    }
    
     @AuraEnabled
    public static void qqAddSOW(String opportunityId){
        Opportunity op = [SELECT Id, QQ_Add_On_Professional_Services__c FROM Opportunity WHERE Id=:opportunityId];
        op.QQ_Add_On_Professional_Services__c =true;
        update op;
    }
    
     @AuraEnabled
    public static void qqBCRet(String opportunityId){
        Opportunity op = [SELECT Id, QQ_Big_Commerce_Returns__c FROM Opportunity WHERE Id=:opportunityId];
        op.QQ_Big_Commerce_Returns__c =true;
        update op;
    }
    
     @AuraEnabled
    public static void qqQBOConnectPromo(String opportunityId){
        Opportunity op = [SELECT Id, QQ_QBO_Promo__c FROM Opportunity WHERE Id=:opportunityId];
        op.QQ_QBO_Promo__c =true;
        update op;
    }
    
     @AuraEnabled
    public static void qqSandboxExt(String opportunityId){
        Opportunity op = [SELECT Id, QQ_Sandbox_Extension__c FROM Opportunity WHERE Id=:opportunityId];
        op.QQ_Sandbox_Extension__c =true;
        update op;
    }
    
    @AuraEnabled
    public static void qqNFR(String opportunityId){
        Opportunity op = [SELECT Id, QQ_NFR__c FROM Opportunity WHERE Id=:opportunityId];
        op.QQ_NFR__c =true;
        update op;
    }
}