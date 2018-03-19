public class AvalaraNewUserCtrl {

    public Request__c req {get;set;}
    public boolean isSuccess {get;set;}
    
    public AvalaraNewUserCtrl(){
        req = new  Request__c();
        isSuccess = false;       
    }
    
    public pageReference insertRequest(){
        try{
            insert req;
            insert new Contact(
                FirstName = req.First_Name__c,
                LastName = req.Last_Name__c,
                Email = req.Email__c,
                Partner_Launch_User_Requests__c = req.Id,
                AccountId = [SELECT Id,AccountId FROM User WHERE Id =:UserInfo.getUserId()].AccountId
            );
            
            isSuccess = true;
        }
        catch(exception e){
            apexpages.addmessages(e);
        }
        return null;       
    }
    
   
}