public class CFSearch {
	@AuraEnabled
    public static List<Connector__c> searchConnectors(String searchString){
        //return [Select Id,Name From Connector__c limit 10];
		String newSearchText = '%'+searchString+'%';
        system.debug('newSearchText==='+newSearchText);
       // List<Connector__c> connectorsSearch = [FIND :searchString IN NAME FIELDS RETURNING Connector__c(Id)][0];
        List<Connector__c> connectors =  [
            SELECT Id,Name, Expanded__c,Vibrancy__c, Platform_Cateogry__c, SAM__r.Name, Author__c,SAM__r.Email,PLT_Owner__c,PLT_Owner__r.Name,PLT_Owner__r.Email,
                Early_Adopter_Sales_Owner__r.Name, Early_Adopter_Sales_Owner__c, SAM__c,Early_Adopter_Sales_Owner__r.Email,
                (SELECT Id,Name FROM Versions__r WHERE Parent_Version__c=null AND Status__c != 'Revoked/Terminated' Order By Sort_Order__c ASC NULLS FIRST)
            FROM Connector__c
            WHERE Name LIKE :newSearchText AND 
                 Vibrancy__c != 'Error'
                AND Vibrancy__c != 'Marketing'
        ];  
        return connectors;
    }
	@AuraEnabled
    public static List<Version__c> getSubVersions(Id vId){
        List<Version__c> versions =  [
            SELECT Id,Name,
            (Select Id, Name, Status__c, Type__c, Version__c,Date_Achieved__c 
             From Badges__r 
             WHERE Type__c <> NULL AND Status__c <> NULL) FROM Version__c 
            WHERE Parent_Version__c=:vId AND Status__c != 'Revoked/Terminated' 
            Order By Sort_Order__c ASC NULLS FIRST
        ];  
        return versions;
    } 
	@AuraEnabled
    public static List<Badge__c> getBadges(Id vId){
        List<Badge__c> badges =  [
            Select Id, Name, Status__c, Type__c, Version__c,Date_Achieved__c 
             From Badge__c 
             WHERE Type__c <> NULL AND Status__c <> NULL AND Version__c=:vId
        ];  
        return badges;
    }     
}