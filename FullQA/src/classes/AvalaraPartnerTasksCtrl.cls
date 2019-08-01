public without sharing class AvalaraPartnerTasksCtrl {
    public String sVersionId{get;set;}
    public Decimal completedTasks {get;set;}
    public Decimal totalTasks {get;set;}
    
    public Map<String,List<Partner_Launch_Task__c>> getMapTasksByType(){
        completedTasks = 0;
        totalTasks = fetchTasks().size();
        List<Partner_Launch_Task__c> tasks = fetchTasks();
        
        Map<String,List<Partner_Launch_Task__c>> taskMap = new Map<String,List<Partner_Launch_Task__c>>();
        for(Partner_Launch_Task__c plt : tasks){
           if(plt.Complete__c){
               completedTasks++;    
           }
            if(!taskMap.containsKey(plt.Type__c)){
                taskMap.put(plt.Type__c,new List<Partner_Launch_Task__c>());
                   
            } 
            taskMap.get(plt.Type__c).add(plt);    
            
        }
        return taskMap;
    }
    
    private List<Partner_Launch_Task__c> fetchTasks(){
        return [
            SELECT Id,Name, Type__c,Complete__c 
            FROM Partner_Launch_Task__c 
            WHERE Version__c =:sVersionId AND Type__c != NULL ORDER BY Type__c ASC,Sort_Order__c ASC
        ];
    }
}