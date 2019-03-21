public class GoLiveFindAllTasks{
    private final List<Task> tasks;
        static string currId = ApexPages.currentPage().getParameters().get('ParentAcctId');

    
    public GoLiveFindAllTasks() {
        tasks = [Select Subject, ActivityDate, Status, owner.name, GoLive_Product__c from Task WHERE Type = 'GoLive' and WhatId IN(SELECT ID FROM GoLive__c WHERE Related_to_Account__c = :currId) ORDER BY ActivityDate];
    }

    public List<Task> getAllGoLiveTasks() {
        return tasks;
    }
}