public with sharing class SubscriptionTriggerHandler extends TriggerHandler {
    // Zuora__Subscription__c > Ding_Value__c  max into Opportunity.Ding_Value__c
    //SELECT Ding_Value__c , Opportunity__c FROM Zuora__Subscription__c WHERE isDeleted = false AND ding_value__c > 0 ORDER BY Ding_Month__c DESC NULLS LAST LIMIT 1
    
    //Zuora__Subscription__c > Ding_Year__c  max into Opportunity.Ding_Year__c
    //SELECT Ding_Year__c , Opportunity__c FROM Zuora__Subscription__c WHERE isDeleted = false AND ding_value__c > 0 ORDER BY Ding_Month__c DESC NULLS LAST LIMIT 1
    
    //Zuora__Subscription__c > Ding_Month__c  max into Opportunity.Ding_Month__c
    //SELECT Ding_Month__c , Opportunity__c FROM Zuora__Subscription__c WHERE isDeleted = false AND ding_value__c > 0 ORDER BY Ding_Month__c DESC NULLS LAST LIMIT 1
    
    ///Zuora__Subscription__c > Count__c  sum into Account.ActiveSubscriptionCount__c
    //SELECT Count__c , Zuora__Account__c FROM Zuora__Subscription__c WHERE isDeleted = false AND zuora__status__c != 'Cancelled' AND opportunity__r.type != 'NFR' AND opportunity__r.subtype__c != 'Included'
    
    ///Zuora__Subscription__c > Zuora__ContractEffectiveDate__c  minimum into Account.First_Purchase_Date__c
    //SELECT Zuora__ContractEffectiveDate__c , Zuora__Account__c FROM Zuora__Subscription__c WHERE isDeleted = false ORDER BY Zuora__ContractEffectiveDate__c ASC NULLS LAST LIMIT 1
  	protected override void afterInsert(){
  		updateRollups((List<Zuora__Subscription__c>) Trigger.new);
  	} 
  	
  	protected override void afterUpdate(){
  		updateRollups((List<Zuora__Subscription__c>) Trigger.new);
  	}

  	protected override void afterDelete(){
  		updateRollups((List<Zuora__Subscription__c>) Trigger.old);
  	}

  	protected override void afterUndelete(){
  		updateRollups((List<Zuora__Subscription__c>) Trigger.new);
  	}
    public static void updateRollups(List<Zuora__Subscription__c> listZSPC){
    		if(listZSPC!=null && listZSPC.size()>0){
    			if(!System.isBatch() && !System.isFuture() && !System.isScheduled()){
    				Map<Id,Zuora__Subscription__c> mapSP=new Map<Id,Zuora__Subscription__c>(listZSPC);
    				updateRollupsFuture(mapSP.keySet());
    			}
    		}	
    }
    @future    	
    public static void updateRollupsFuture(Set<Id> setZSPC){
    		if(setZSPC!=null && setZSPC.size()>0){
    			List<Zuora__Subscription__c> listZSPC=[select Id,Zuora__Account__c,Opportunity__c From Zuora__Subscription__c Where Id=:setZSPC ALL ROWS];
    			System.debug('listZSPC====='+listZSPC);
    			Set<Id> accountIDs=new Set<Id>();
    			Set<Id> opportunityIDs=new Set<Id>();
    			Set<Id> zuoraSubscriptionIDs=new Set<Id>();
    			for(Zuora__Subscription__c zspc:listZSPC){
    				accountIDs.add(zspc.Zuora__Account__c);
    				opportunityIDs.add(zspc.Opportunity__c);
    			}
    			if(accountIDs.size()>0){
    				List<Account> listAccounts=[Select Id,First_Purchase_Date__c,ActiveSubscriptionCount__c,
    											(Select Id,Zuora__ContractEffectiveDate__c,Zuora__Status__c,Opportunity__c,Opportunity__r.Type,Opportunity__r.SubType__c,Zuora__SubscriptionEndDate__c 
    											From Zuora__Subscriptions__r ORDER BY Zuora__ContractEffectiveDate__c ASC NULLS LAST) 
    											From Account Where Id=:accountIDs];
    				for(Account a:listAccounts){
    					a.ActiveSubscriptionCount__c=0;
    					if(a.First_Purchase_Date__c==null && a.Zuora__Subscriptions__r.size()>0){
    						a.First_Purchase_Date__c=a.Zuora__Subscriptions__r[0].Zuora__ContractEffectiveDate__c;
    					}
    					for(Zuora__Subscription__c s:a.Zuora__Subscriptions__r){
    						//&& s.Opportunity__r.SubType__c != 'Included' Aaron asekd to remove
	    					if((s.Opportunity__c==null || (s.Opportunity__c!=null && s.Opportunity__r.Type != 'NFR' )) && 
	    						(
	    							s.Zuora__Status__c != 'Cancelled' || 
	    							(s.Zuora__Status__c == 'Cancelled' && s.Zuora__SubscriptionEndDate__c>Date.today())
	    					    ) 
	    						){
	    						a.ActiveSubscriptionCount__c=a.ActiveSubscriptionCount__c+1;
	    					}
    					}
    				}
				//by pass account trigger 
				TriggerHandler.bypass('AccountTriggerHandler');
				Database.SaveResult[] dsrList=Database.update(listAccounts,false);
				Utility.createApexLog('SubscriptionTriggerHandler', dsrList,true);
				//update listAccounts;
				TriggerHandler.clearBypass('AccountTriggerHandler');	    				
    			}
    			if(opportunityIDs.size()>0){
    				List<Opportunity> listOpportunities=[Select Id,Opportunity_Connector_Summary__c,
    													(Select Id,Ding_Value__c,Ding_Year__c,Ding_Month__c From Subscriptions__r) 
    													From Opportunity Where Id=:opportunityIDs];
    				for(Opportunity o:listOpportunities){
					if(o.Subscriptions__r.size()>0){
						o.Ding_Value__c=o.Subscriptions__r[0].Ding_Value__c;
						o.Ding_Month__c=o.Subscriptions__r[0].Ding_Month__c;
						o.Ding_Year__c=o.Subscriptions__r[0].Ding_Year__c; 
					}
    				}
				TriggerHandler.bypass('OpportunityTriggerHandler');
				Database.SaveResult[] dsrList=Database.update(listOpportunities,false);
				Utility.createApexLog('SubscriptionTriggerHandler', dsrList,true);
				TriggerHandler.clearBypass('OpportunityTriggerHandler');	      				
    			}
			    			
    		}
    }
}