public with sharing class SubscriptionProductChargeTriggerHandler extends TriggerHandler {
    //create logic to concatinate  
    ///Zuora__SubscriptionProductCharge__c > ConnectorLookup__r > Name  into Opportunity.Opportunity_Connector_Summary__c
    //SELECT ConnectorLookup__r.Name , Opportunity__c FROM Zuora__SubscriptionProductCharge__c WHERE isDeleted = false AND subscription_status__c = 'Active' AND zuora__type__c = 'Recurring' AND (NOT connector_name__c LIKE '%Non Connector%') ORDER BY Id DESC NULLS LAST
    
    ///Zuora__SubscriptionProductCharge__c > Item_Count__c  sum into Account.AvaTaxOnsiteProductCount__c
    //SELECT Item_Count__c , Zuora__Account__c FROM Zuora__SubscriptionProductCharge__c WHERE isDeleted = false AND zuora__account__r.activecustomer__c = TRUE AND (zuora__productname__c = 'Avalara SalesTax II' OR zuora__productname__c = 'Avalara SalesTax PC+' OR zuora__subscription__r.name LIKE 'AS%' OR zuora__productname__c = 'Avalara TaxRates' OR zuora__productname__c = 'Avalara LaserBridge' OR priceschedule__c = 'ONSITE' OR zuora__rateplanname__c LIKE '%ONSITE%') ORDER BY Id DESC NULLS LAST
    
    ///Zuora__SubscriptionProductCharge__c > ConnectorLookup__r > Name concat text into Account.Connector_Summary__c comma seperated
    //SELECT ConnectorLookup__r.Name , Zuora__Account__c FROM Zuora__SubscriptionProductCharge__c WHERE isDeleted = false AND subscription_status__c = 'Active' AND zuora__type__c = 'Recurring' AND (NOT connector_name__c LIKE '%Non Connector%') ORDER BY Id DESC NULLS LAST
    
    ///Zuora__SubscriptionProductCharge__c > Annual_Recurring_Revenue__c  sum into Account.Initial_Calc_Value__c
    //SELECT Annual_Recurring_Revenue__c , Zuora__Account__c FROM Zuora__SubscriptionProductCharge__c WHERE isDeleted = false AND zuora__productname__c = 'Avalara AvaTax' AND zuora__type__c = 'Recurring' ORDER BY Id DESC NULLS LAST
    
    ///Zuora__SubscriptionProductCharge__c > RollupProductName__c  concat text into Account.Product_Summary__c
    //SELECT RollupProductName__c , Zuora__Account__c FROM Zuora__SubscriptionProductCharge__c WHERE isDeleted = false AND subscription_status__c = 'Active' AND opportunity__r.subtype__c != 'Included' AND connectorlookup__r.aip_enabled_platform__c = FALSE ORDER BY rollupproductname__c ASC NULLS LAST
    
    ///Zuora__SubscriptionProductCharge__c > Zuora__Quantity__c  max into Account.Prepaid_Returns__c
    //SELECT Zuora__Quantity__c , Zuora__Account__c FROM Zuora__SubscriptionProductCharge__c WHERE (isDeleted = false OR zuora__rateplanname__c LIKE '%Pre-Paid Returns Service%' OR zuora__rateplanname__c LIKE '%Purchased Managed Returns%') AND zuora__type__c = 'Recurring' ORDER BY Zuora__Quantity__c DESC NULLS LAST LIMIT 1
    
    ///Zuora__SubscriptionProductCharge__c > Connector__c  connector into Zuora__Subscription__c.Subscription_Primary_Connector__c
    //SELECT Connector__c , Zuora__Subscription__c FROM Zuora__SubscriptionProductCharge__c WHERE isDeleted = false AND zuora__type__c = 'Recurring' AND connector__c != 'a0n3300000FTiWlAAL' ORDER BY zuora__totalcontractvalue__c DESC NULLS LAST , connector_name__c ASC NULLS LAST LIMIT 1
    
    /// Zuora__SubscriptionProductCharge__c > Returns_Estimate__c  sum into Zuora__Subscription__c.Total_Returns_Estimate__c
    //SELECT Returns_Estimate__c , Zuora__Subscription__c FROM Zuora__SubscriptionProductCharge__c WHERE isDeleted = false ORDER BY Id DESC NULLS LAST
    
    ///Zuora__SubscriptionProductCharge__c > Connector_Name__c  concat into Zuora__Subscription__c.Primary_Connector__c
    //SELECT Connector_Name__c , Zuora__Subscription__c FROM Zuora__SubscriptionProductCharge__c WHERE isDeleted = false AND (NOT name LIKE '%ADD-ON CONNECTOR%') AND (NOT connector_name__c LIKE '%Non Connector%') ORDER BY Id DESC NULLS LAST
    
    ///Zuora__SubscriptionProductCharge__c > Extended_List_Amount__c  sum into Zuora__Subscription__c.Total_List_Amount__c
    //SELECT Extended_List_Amount__c , Zuora__Subscription__c FROM Zuora__SubscriptionProductCharge__c WHERE isDeleted = false AND (NOT name LIKE '%Avalara Returns Service%') AND (NOT name LIKE '%Margin%') ORDER BY Id DESC NULLS LAST
    
    ///Zuora__SubscriptionProductCharge__c > Zuora__ExtendedAmount__c  sum into Zuora__Subscription__c.Total_Sale_Amount__c
    //SELECT Zuora__ExtendedAmount__c , Zuora__Subscription__c FROM Zuora__SubscriptionProductCharge__c WHERE isDeleted = false AND (NOT name LIKE '%Avalara Returns Service%') AND (NOT name LIKE '%Margin%') ORDER BY Id DESC NULLS LAST
    
    //opportunity, account,Zuora__Subscription__c
    
    //Trigger Handler Methods
  	//protected override void beforeInsert(){}

  	//protected override void beforeUpdate(){}
    
    //protected override void beforeDelete(){}

  	protected override void afterInsert(){
  		updateRollups((List<Zuora__SubscriptionProductCharge__c>) Trigger.new);
  	}
  	
  	protected override void afterUpdate(){
  		updateRollups((List<Zuora__SubscriptionProductCharge__c>) Trigger.new);
  	}

  	protected override void afterDelete(){
  		updateRollups((List<Zuora__SubscriptionProductCharge__c>) Trigger.old);
  	}

  	protected override void afterUndelete(){
  		updateRollups((List<Zuora__SubscriptionProductCharge__c>) Trigger.new);
  	}
    public static void updateRollups(List<Zuora__SubscriptionProductCharge__c> listZSPC){
    		if(listZSPC!=null && listZSPC.size()>0){
    			if(!System.isBatch() && !System.isFuture() && !System.isScheduled()){
    				Map<Id,Zuora__SubscriptionProductCharge__c> mapSP=new Map<Id,Zuora__SubscriptionProductCharge__c>(listZSPC);
    				updateRollupsFuture(mapSP.keySet());
    			}
    		}	
    }
    @future    	
    public static void updateRollupsFuture(Set<Id> setZSPC){
    		if(setZSPC!=null && setZSPC.size()>0){
    			List<Zuora__SubscriptionProductCharge__c> listZSPC=[select Id,Zuora__Account__c,Opportunity__c,Zuora__Subscription__c From Zuora__SubscriptionProductCharge__c Where Id=:setZSPC  ALL ROWS];
    			System.debug('listZSPC====='+listZSPC);
    			Set<Id> accountIDs=new Set<Id>();
    			Set<Id> opportunityIDs=new Set<Id>();
    			Set<Id> zuoraSubscriptionIDs=new Set<Id>();
    			for(Zuora__SubscriptionProductCharge__c zspc:listZSPC){
    				accountIDs.add(zspc.Zuora__Account__c);
    				opportunityIDs.add(zspc.Opportunity__c);
    				zuoraSubscriptionIDs.add(zspc.Zuora__Subscription__c);
    			}
    			if(accountIDs.size()>0){
    				//(zspc.Zuora__Subscription__c!=null && zspc.Zuora__Subscription__r.Name.startsWithIgnoreCase('AS')) || is not needed according to Aaron
    				List<Account> listAccounts=[Select Id,Connector_Summary__c,AvaTaxOnsiteProductCount__c,ActiveCustomer__c, Initial_Calc_Value__c,Product_Summary__c,Prepaid_Returns__c,
    											(Select Id,Item_Count__c,Zuora__ProductName__c,Zuora__Subscription__c,Zuora__Subscription__r.Name,PriceSchedule__c,Zuora__RateplanName__c,
    											ConnectorLookup__c,ConnectorLookup__r.Name,Subscription_Status__c,Connector_Name__c ,Annual_Recurring_Revenue__c,RollupProductName__c,
    											Opportunity__c,Opportunity__r.SubType__c,ConnectorLookup__r.AIP_Enabled_Platform__c,Zuora__Type__c,Zuora__Quantity__c
    											From Zuora__R00N40000001lGjTEAU__r) 
    											From Account Where Id=:accountIDs];
    				for(Account a:listAccounts){
    					a.AvaTaxOnsiteProductCount__c=0;
    					a.Connector_Summary__c='';
    					a.Initial_Calc_Value__c=0;
    					a.Product_Summary__c='';
    					a.Prepaid_Returns__c=0;
    					for(Zuora__SubscriptionProductCharge__c zspc:a.Zuora__R00N40000001lGjTEAU__r){
    						if(
    								a.ActiveCustomer__c &&  zspc.Item_Count__c!=null && 
    								(
    									(String.isNotBlank(zspc.Zuora__ProductName__c) &&
    									(zspc.Zuora__ProductName__c.equalsIgnoreCase('Avalara SalesTax II') || 
    									zspc.Zuora__ProductName__c.equalsIgnoreCase('Avalara SalesTax PC+') ||     									
    									zspc.Zuora__ProductName__c.equalsIgnoreCase('Avalara TaxRates') || 
    									zspc.Zuora__ProductName__c.equalsIgnoreCase('Avalara LaserBridge'))) ||  
    									(String.isNotBlank(zspc.PriceSchedule__c) && zspc.PriceSchedule__c.equalsIgnoreCase('ONSITE')) || 
    									(String.isNotBlank(zspc.Zuora__RatePlanName__c) && zspc.Zuora__RatePlanName__c.containsIgnoreCase('ONSITE')) 
    								)
    						 ){
    							a.AvaTaxOnsiteProductCount__c=a.AvaTaxOnsiteProductCount__c+zspc.Item_Count__c;
    						}
    						if(
    							String.isNotBlank(zspc.Subscription_Status__c) && zspc.Subscription_Status__c.equalsIgnoreCase('Active') && 
    							String.isNotBlank(zspc.Zuora__Type__c) && zspc.Zuora__Type__c.equalsIgnoreCase('Recurring') &&   						
    							zspc.ConnectorLookup__c!=null
    						  ){
    							a.Connector_Summary__c=a.Connector_Summary__c+' '+zspc.ConnectorLookup__r.Name;
    						}
    						if(
    							zspc.Annual_Recurring_Revenue__c!=null && 
    							String.isNotBlank(zspc.Zuora__ProductName__c) && zspc.Zuora__ProductName__c.equalsIgnoreCase('Avalara AvaTax') && 
    							String.isNotBlank(zspc.Zuora__Type__c) && zspc.Zuora__Type__c.equalsIgnoreCase('Recurring')
    						  ){
    							a.Initial_Calc_Value__c=a.Initial_Calc_Value__c+zspc.Annual_Recurring_Revenue__c;
    						}
    						if(
    							String.isNotBlank(zspc.RollupProductName__c) && 
    							String.isNotBlank(zspc.Subscription_Status__c) && zspc.Subscription_Status__c.equalsIgnoreCase('Active') &&  
    							(zspc.Opportunity__c==null || String.isBlank(zspc.Opportunity__r.SubType__c) || zspc.Opportunity__r.SubType__c.equalsIgnoreCase('Included')==false) && 
    							(zspc.ConnectorLookup__c==null || zspc.ConnectorLookup__r.AIP_Enabled_Platform__c == false) &&
    							a.Product_Summary__c.containsIgnoreCase(zspc.RollupProductName__c)==false
    							){
    								a.Product_Summary__c=a.Product_Summary__c+' '+zspc.RollupProductName__c;
    						   }
    						if(
    							zspc.Zuora__Quantity__c!=null && zspc.Zuora__Quantity__c>a.Prepaid_Returns__c && 
    							(String.isNotBlank(zspc.Zuora__RatePlanName__c) && (zspc.Zuora__RatePlanName__c.containsIgnoreCase('Pre-Paid Returns Service') || zspc.Zuora__RatePlanName__c.containsIgnoreCase('Purchased Managed Returns'))) && 
    							String.isNotBlank(zspc.Zuora__Type__c) && zspc.Zuora__Type__c.equalsIgnoreCase('Recurring')
    						){
    							a.Prepaid_Returns__c=zspc.Zuora__Quantity__c;
    						} 
 
    					}
    				}
				//by pass account trigger 
				TriggerHandler.bypass('AccountTriggerHandler');
				Database.SaveResult[] dsrList=Database.update(listAccounts,false);
				Utility.createApexLog('SubscriptionProductChargeTriggerHandler', dsrList,true);
				TriggerHandler.clearBypass('AccountTriggerHandler');	
    			}
    			if(opportunityIDs.size()>0){
    				List<Opportunity> listOpportunities=[Select Id,Opportunity_Connector_Summary__c,
    													(Select Id,ConnectorLookup__c,ConnectorLookup__r.Name,Subscription_Status__c,Zuora__Type__c From Subscription_Product_Charges__r) 
    													From Opportunity Where Id=:opportunityIDs];
    				for(Opportunity o:listOpportunities){
    					o.Opportunity_Connector_Summary__c='';
	    				for(Zuora__SubscriptionProductCharge__c zspc:o.Subscription_Product_Charges__r){
						if(
							String.isNotBlank(zspc.Subscription_Status__c) && zspc.Subscription_Status__c.equalsIgnoreCase('Active') && 
							String.isNotBlank(zspc.Zuora__Type__c) && zspc.Zuora__Type__c.equalsIgnoreCase('Recurring') &&   						
							zspc.ConnectorLookup__c!=null
						  ){
							o.Opportunity_Connector_Summary__c=o.Opportunity_Connector_Summary__c+' '+zspc.ConnectorLookup__r.Name;
						}
	    				}
    				}
				TriggerHandler.bypass('OpportunityTriggerHandler');
				Database.SaveResult[] dsrList=Database.update(listOpportunities,false);
				Utility.createApexLog('SubscriptionProductChargeTriggerHandler', dsrList,true);
				TriggerHandler.clearBypass('OpportunityTriggerHandler');	    				    				
    			}
    			if(zuoraSubscriptionIDs.size()>0){
    				List<Zuora__Subscription__c> listZuoraSubscription=[Select Id,Name,Subscription_Primary_Connector__c,Total_Returns_Estimate__c,Primary_Connector__c,
    																	Total_List_Amount__c,Total_Sale_Amount__c,
    																	(Select Id,Name,Connector__c,Zuora__Type__c,Zuora__TotalContractValue__c,Returns_Estimate__c,Connector_Name__c,
    																	Extended_List_Amount__c,Zuora__ExtendedAmount__c,ConnectorLookup__c 
    																	From Zuora__Subscription_Product_Charges__r Order By Zuora__TotalContractValue__c ASC NULLS FIRST ) 
    																	From Zuora__Subscription__c Where Id=:zuoraSubscriptionIDs];
    				for(Zuora__Subscription__c s:listZuoraSubscription){
    					s.Subscription_Primary_Connector__c=null;
    					s.Total_Returns_Estimate__c=0;
    					s.Primary_Connector__c='';
    					s.Total_List_Amount__c=0;
    					s.Total_Sale_Amount__c=0;
    					for(Zuora__SubscriptionProductCharge__c zspc:s.Zuora__Subscription_Product_Charges__r){
    						if(
    							String.isNotBlank(zspc.ConnectorLookup__c) && 
    							zspc.ConnectorLookup__c != 'a0n3300000FTiWlAAL' && 
    							String.isNotBlank(zspc.Zuora__Type__c) && zspc.Zuora__Type__c.equalsIgnoreCase('Recurring')  
    						){
    							s.Subscription_Primary_Connector__c=zspc.ConnectorLookup__c;
    						}
    						s.Total_Returns_Estimate__c=s.Total_Returns_Estimate__c+zspc.Returns_Estimate__c;
    						if(
    							String.isNotBlank(zspc.Connector_Name__c) &&
    							zspc.Name.containsIgnoreCase('ADD-ON CONNECTOR')==false &&
    							zspc.Connector_Name__c.containsIgnoreCase('Non Connector')==false
    							){
    							s.Primary_Connector__c=s.Primary_Connector__c+' '+zspc.Connector_Name__c;
    						}    						
    						if(
    							zspc.Extended_List_Amount__c!=null &&
    							zspc.Name.containsIgnoreCase('Avalara Returns Service')==false &&
    							zspc.Name.containsIgnoreCase('Margin')==false
    							){
    							s.Total_List_Amount__c=s.Total_List_Amount__c+zspc.Extended_List_Amount__c; 
    						}    						
    						if(
    							zspc.Zuora__ExtendedAmount__c!=null &&
    							zspc.Name.containsIgnoreCase('Avalara Returns Service')==false &&
    							zspc.Name.containsIgnoreCase('Margin')==false
    							){
    							s.Total_Sale_Amount__c=s.Total_Sale_Amount__c+zspc.Zuora__ExtendedAmount__c;
    						}  						    						
    					}
    				}
				TriggerHandler.bypass('SubscriptionTriggerHandler');
				Database.SaveResult[] dsrList=Database.update(listZuoraSubscription,false);
				Utility.createApexLog('SubscriptionProductChargeTriggerHandler', dsrList,true);
				TriggerHandler.clearBypass('SubscriptionTriggerHandler');	        				
    			}    			    			
    		}
    }
}