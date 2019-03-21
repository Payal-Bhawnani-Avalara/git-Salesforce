global class JobProcessSObject implements Database.Batchable<sObject>, Schedulable, Database.Stateful {
    global String query;
    public JobProcessSObject(String tempQuery){
        query=tempQuery;
    }
    global void execute(SchedulableContext sc) {
         JobProcessSObject job = new JobProcessSObject('Select id from user limit 0');
         ID batchprocessid = Database.executeBatch(job,50); 
    }
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator(query);
    }
  
    global void execute(Database.BatchableContext BC, List<sObject> objList) {
        if(objList!=null && objList.size()>0){
            Set<String> masterObjectIDs=new Set<String>();
            for(SObject obj:objList){
                masterObjectIDs.add(String.valueOf(obj.get('Id')));
            }
            Map<Id,Integer> mapAcc=new Map<Id,Integer>();
            for(Zuora__Subscription__c s:[Select Id,Zuora__Account__c,Opportunity__c, Opportunity__r.Type,Zuora__Status__c,Zuora__SubscriptionEndDate__c From Zuora__Subscription__c Where (Opportunity__c=null OR Opportunity__r.Type != 'NFR') AND (Zuora__Status__c != 'Cancelled' OR (Zuora__Status__c = 'Cancelled' AND Zuora__SubscriptionEndDate__c>TODAY) ) AND Zuora__Account__c=:masterObjectIDs]){
                if(!mapAcc.containsKey(s.Zuora__Account__c)){
                    mapAcc.put(s.Zuora__Account__c,0); 
                }
                Integer count=mapAcc.get(s.Zuora__Account__c);
                count+=1;
				 mapAcc.put(s.Zuora__Account__c,count);                
            }
            List<Account> listA=new List<Account>();
            for(String accId:mapAcc.keySet()){
                listA.add(new Account(Id=accId,ActiveSubscriptionCount__c=mapAcc.get(accId)));
            }
            for(String accId:masterObjectIDs){
                if(!mapAcc.containsKey(accId)){
                    listA.add(new Account(Id=accId,ActiveSubscriptionCount__c=0));
                }
            } 
           // update listA; 
            Database.SaveResult[] dsrList=Database.update(listA,false);
			Utility.createApexLog('JobProcessSObject Reset Active Flag', 'Failed', listA.size(), listA.size(),'Error', 1,' '+masterObjectIDs,true);            
           // Utility.createApexLog('JobProcessSObject Reset Active Flag '+objRollup.Id, dsrList,true);             
            /*Map<Id,Integer> mapAcc=new Map<Id,Integer>();
            for(Zuora__Subscription__c s:[Select Id,Zuora__Account__c,Opportunity__c, Opportunity__r.Type,Zuora__Status__c,Zuora__SubscriptionEndDate__c From Zuora__Subscription__c Where Zuora__Account__c=:masterObjectIDs]){
                if(!mapAcc.containsKey(s.Zuora__Account__c)){
                    mapAcc.put(s.Zuora__Account__c,0);
                }
                Integer count=mapAcc.get(s.Zuora__Account__c);
                if(
                    (s.Opportunity__c==null || s.Opportunity__r.Type != 'NFR') && 
                    (s.Zuora__Status__c != 'Cancelled' || 
                     (s.Zuora__Status__c == 'Cancelled' && s.Zuora__SubscriptionEndDate__c>Date.today()) )){
                         count+=1;
                     }
				 mapAcc.put(s.Zuora__Account__c,count);                
            }
            List<Account> listA=new List<Account>();
            for(String accId:mapAcc.keySet()){
                listA.add(new Account(Id=accId,ActiveSubscriptionCount__c=mapAcc.get(accId)));
            }
            update listA;*/
           /* 
            List<Account> listAccounts=[Select Id,ActiveSubscriptionCount__c, (Select Id,Opportunity__c, Opportunity__r.Type,Zuora__Status__c,Zuora__SubscriptionEndDate__c From Subscriptions__r) From Account Where Id=:masterObjectIDs];
            for(Account a:listAccounts){
                a.ActiveSubscriptionCount__c=0;
                for(Zuora__Subscription__c s:a.Subscriptions__r){
                    if(
                        (s.Opportunity__c==null || s.Opportunity__r.Type != 'NFR') && 
                        (s.Zuora__Status__c != 'Cancelled' || 
                         (s.Zuora__Status__c == 'Cancelled' && s.Zuora__SubscriptionEndDate__c>Date.today()) )){
                        a.ActiveSubscriptionCount__c+=1;
                    }
                }
            }
            update listAccounts; */          
            /*List<Account> listAccounts=[Select Id,ActiveSubscriptionCount__c, (Select Id From Subscriptions__r Where (Opportunity__c=null OR Opportunity__r.Type != 'NFR') AND (Zuora__Status__c != 'Cancelled' OR (Zuora__Status__c = 'Cancelled' AND Zuora__SubscriptionEndDate__c>TODAY) )) From Account Where Id=:masterObjectIDs];
            for(Account a:listAccounts){
                a.ActiveSubscriptionCount__c=a.Subscriptions__r.size();
            }
            database.update(listAccounts,false);*/
            /*List<sObject> listSObject=new List<sObject>();
            Type sObjType=Type.forName('Account');  
            List<AggregateResult> arList=[Select Zuora__Account__c, count(Id) ActiveSubscriptionCount__c From Zuora__Subscription__c Where (Opportunity__c=null OR Opportunity__r.Type != 'NFR') AND (Zuora__Status__c != 'Cancelled' OR (Zuora__Status__c = 'Cancelled' AND Zuora__SubscriptionEndDate__c>TODAY) ) Group by Zuora__Account__c Having Zuora__Account__c=:masterObjectIDs];
            for(AggregateResult ar:arList){
                sObject sObj;
                sObj= (sObject) sObjType.newInstance();
                sObj.put('Id',ar.get('Zuora__Account__c'));
                sObj.put('ActiveSubscriptionCount__c',ar.get('ActiveSubscriptionCount__c'));
                listSObject.add(sObj); 
            }
            update listSObject;*/
        }
    }  

    global void finish(Database.BatchableContext BC) { 
        
    }

}