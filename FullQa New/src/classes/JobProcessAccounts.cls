//This class will make Opportunity Contact Role Primary if Opportunity has only one contact role 
/*CRON :JobProcessAccounts m = new JobProcessAccounts('Select id from Account');
        String seconds = '0'; //Execute at Zero Seconds
        String minutes = '5'; //Execute at every 0 minute of hour
        String hours = '12'; // Execute at 1 AM
        String dayOfMonth = '*'; // Execute Every Day of the Month
        String month = '*'; //Execute every Month
        String dayOfWeek = '?'; //Execute on all 7 days of the Week
        //ID oppbatchprocessid = Database.executeBatch(m,200);  
        
        //Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        String sch = seconds + ' ' + minutes + ' ' + hours + ' ' + dayOfMonth + ' ' + month + ' ' + dayOfWeek;
        //String sch = '0 0 01 * * ?';
        system.schedule('JobProcessAccounts Run Everyday at 12:05pm', sch, m);  */
global class JobProcessAccounts implements Database.Batchable<sObject>, Schedulable, Database.Stateful, Database.AllowsCallouts {
    global String query;
    public JobProcessAccounts(String tempQuery){
        query=tempQuery;
    }
    global void execute(SchedulableContext sc) {
         JobProcessAccounts job = new JobProcessAccounts('Select id from Account');
         ID batchprocessid = Database.executeBatch(job,200); 
    }
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator(query);
    }
  
    global void execute(Database.BatchableContext BC, List<Account> objList) {
        if(objList!=null && objList.size()>0){
			Map<Id,Account> mapAccounts=new Map<Id,Account>([Select Id,ActiveSubscriptionCount__c,CPO_Overall_Score__c,First_Purchase_Date__c,
															(Select Id,	Zuora__MRR__c From Zuora__R00N40000001kyLcEAI__r Where Zuora__MRR__c!=0),
															(Select Id From Zuora__Subscriptions__r limit 1) 
															From Account Where Id=:objList]);
            Map<Id,Integer> mapAcc=new Map<Id,Integer>();
            Map<Id,Date> mapAccFirstpurchaseDate=new Map<Id,Date>();
            for(Zuora__Subscription__c s:[Select Id,Zuora__Account__c,Opportunity__c, Opportunity__r.Type,Zuora__Status__c,Zuora__SubscriptionEndDate__c ,
            								Zuora__ContractEffectiveDate__c
            								 From Zuora__Subscription__c 
            								 Where (Opportunity__c=null OR Opportunity__r.Type != 'NFR') AND 
            								 (Zuora__Status__c != 'Cancelled' OR (Zuora__Status__c = 'Cancelled' AND Zuora__SubscriptionEndDate__c>TODAY) ) 
            								 AND Zuora__Account__c=:mapAccounts.keySet() ORDER BY Zuora__ContractEffectiveDate__c ASC NULLS LAST]){
                if(!mapAcc.containsKey(s.Zuora__Account__c)){
                    mapAcc.put(s.Zuora__Account__c,0); 
                }
                Integer count=mapAcc.get(s.Zuora__Account__c);
                count+=1;
         		mapAcc.put(s.Zuora__Account__c,count);  
         		if(!mapAccFirstpurchaseDate.containsKey(s.Zuora__Account__c) && s.Zuora__ContractEffectiveDate__c!=null){
         			mapAccFirstpurchaseDate.put(s.Zuora__Account__c,s.Zuora__ContractEffectiveDate__c);
         		}              
            }
            List<Account> accountsToUpdate=new List<Account>();
            Set<Id> accountIDs=new Set<Id>();
            List<Zuora__CustomerAccount__c> listZCA=new List<Zuora__CustomerAccount__c>();
            for(Account a:mapAccounts.values()){
            		Boolean updateAcc=false;
            		if(mapAcc.containsKey(a.Id) && mapAcc.get(a.Id)!=a.ActiveSubscriptionCount__c){
            			a.ActiveSubscriptionCount__c=mapAcc.get(a.Id);
            			updateAcc=true;
            		}
            		else if(!mapAcc.containsKey(a.Id) && a.ActiveSubscriptionCount__c!=0){
            			a.ActiveSubscriptionCount__c=0;
            			updateAcc=true;
            		}

            		if(a.ActiveSubscriptionCount__c==0 && a.Zuora__Subscriptions__r.size()==1 && a.Zuora__R00N40000001kyLcEAI__r.size()>0){
            			for(	Zuora__CustomerAccount__c ca:a.Zuora__R00N40000001kyLcEAI__r){
            				ca.Zuora__MRR__c=0;
            			}
            			listZCA.addAll(a.Zuora__R00N40000001kyLcEAI__r);
            		}
            		if(a.ActiveSubscriptionCount__c==0 && a.CPO_Overall_Score__c!=100 && a.Zuora__Subscriptions__r.size()==1){
            			a.CPO_Overall_Score__c=100;
            			updateAcc=true;
            		}
            		if(a.First_Purchase_Date__c==null && mapAccFirstpurchaseDate.containsKey(a.Id)){
            			a.First_Purchase_Date__c=mapAccFirstpurchaseDate.get(a.Id);
            			accountIDs.add(a.Id);
            			updateAcc=true;
            		}  
            		if(updateAcc){
            			accountsToUpdate.add(a);
            		}            		          		
            }
          //  	TriggerHandler.bypass('ZuoraCustomerAccountTriggerHandler');	
            //	TriggerHandler.bypass('AccountTriggerHandler');            
            if(accountsToUpdate.size()>0){
            		update accountsToUpdate;
            		/*if(accountIDs.size()>0){
            			CC_AVA_BizTech_API.sendCPUUserChanged(accountIDs);
            		}*/
        			//Database.SaveResult[] dsrList=Database.update(accountsToUpdate,false);
     			//Utility.createApexLog('JobProcessSObject Reset Active Flag', 'Failed', accountsToUpdate.size(), accountsToUpdate.size(),'Error', 1,' '+mapAccounts.keySet(),true);               	
            }
            if(listZCA.size()>0){
            		update listZCA;
            }
            /*List<Account> listA=new List<Account>();
            for(String accId:mapAcc.keySet()){
                listA.add(new Account(Id=accId,ActiveSubscriptionCount__c=mapAcc.get(accId)));
            }
            for(String accId:masterObjectIDs){
                if(!mapAcc.containsKey(accId)){
                    listA.add(new Account(Id=accId,ActiveSubscriptionCount__c=0));
                }
            } */
           // update listA; 
        //    Database.SaveResult[] dsrList=Database.update(listA,false);
     // Utility.createApexLog('JobProcessSObject Reset Active Flag', 'Failed', listA.size(), listA.size(),'Error', 1,' '+masterObjectIDs,true);          
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