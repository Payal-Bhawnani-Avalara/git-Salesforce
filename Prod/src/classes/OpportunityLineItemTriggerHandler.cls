public with sharing class OpportunityLineItemTriggerHandler  extends TriggerHandler {
    //Trigger Handler Methods
  	protected override void beforeInsert(){
  		beforeInsertUpdate();
  	}

  	protected override void beforeUpdate(){ 
  		//https://jira.avalara.com/browse/ITBSE-977
  		//this code will change Zuora IDs when Professional Service team will change type from Usage to One Time for special orders
		Map<Id,OpportunityLineItem> oppsOLI=new Map<Id,OpportunityLineItem>();
		List<OpportunityLineItem> oliList=(List<OpportunityLineItem>)Trigger.new;
		Map<Id,OpportunityLineItem> mapOldOLIs=(Map<Id,OpportunityLineItem>) Trigger.oldMap;
		for( OpportunityLineItem oli : oliList){
			if(
				oli.ItemType__c=='One-Time' &&  
				mapOldOLIs.get(oli.Id).ItemType__c=='Usage' && 
				oli.ProductFamily__c=='Avalara Professional Services' &&
				oli.PRPCId__c=='2c92a0ff5876eea8015877f7700713ba' &&
				oli.PRPId__c=='2c92a0fd5876e49c015877f76ebf1f1a' && 
				oli.RPTCId__c=='2c92a0ff5876eea8015877f7700913bd'
				){
					oli.PRPCId__c='2c92a0fd59b56b850159b957444e14e5';
					oli.PRPId__c='2c92a0ff59b56b9b0159b95743131239'; 
					oli.RPTCId__c='2c92a0fd59b56b850159b957444f14e6';		
    					oli.EffectivePrice__c=oli.BookedValue__c;
                    	oli.UnitPrice=oli.BookedValue__c;
    					oli.TotalPrice__c=oli.BookedValue__c;	
    					oli.BillingFrequency__c=null;
    					oli.ListPrice__c=oli.BookedValue__c;
                    	oli.UsagePrice__c=oli.BookedValue__c;
    					//oli.PriceFormat__c = 'Per Unit';	
    					oppsOLI.put(oli.OpportunityId,oli);				
			}
		} 
		if(oppsOLI!=null && oppsOLI.size()>0){
			List<Opportunity> listOpps=[Select Id,(Select Id,OneTimeTotal__c,AnnualizedListPrice__c,NetTotalNoDropsTOT__c 
										From PROS_Quotes__r order by lastmodifieddate desc limit 1) From Opportunity Where Id=:oppsOLI.keySet()];
			List<CameleonCPQ__Quote__c> listProsQuote=new List<CameleonCPQ__Quote__c>();
			for(Opportunity o:listOpps){
				OpportunityLineItem oli=oppsOLI.get(o.Id);
				if(o.PROS_Quotes__r.size()==1 && oli!=null){
					CameleonCPQ__Quote__c q=o.PROS_Quotes__r[0];
					if(q.OneTimeTotal__c==null){
						q.OneTimeTotal__c=0;
					}
					if(q.AnnualizedListPrice__c==null){
						q.AnnualizedListPrice__c=0;
					}
					if(q.NetTotalNoDropsTOT__c==null){
						q.NetTotalNoDropsTOT__c=0;
					}
					q.OneTimeTotal__c+=oli.BookedValue__c;
					q.AnnualizedListPrice__c+=oli.BookedValue__c;
					q.NetTotalNoDropsTOT__c+=oli.BookedValue__c;	
					listProsQuote.add(q);									
				}
			}
			TriggerHandler.bypass('ProsQuoteTriggerHandler');
			update listProsQuote;
		} 

  	}

   // protected override void beforeDelete(){}

    protected override void afterInsert(){
    		//calculateBookingValue(Trigger.new); //Disabled per IBST-19902
        logHistory((Map<Id,OpportunityLineItem>)Trigger.newMap,null,'Insert');
        TriggerHandler.bypass('OpportunityLineItemTriggerHandler');
    }

    protected override void afterDelete(){
    		
        logHistory((Map<Id,OpportunityLineItem>)Trigger.oldMap,null,'Delete');        
    }

    protected override void afterUndelete(){
    		//calculateBookingValue(Trigger.new); //Disabled per IBST-19902
        logHistory((Map<Id,OpportunityLineItem>)Trigger.newMap,null,'UnDelete');  
        TriggerHandler.bypass('OpportunityLineItemTriggerHandler');      
    }
	protected override void afterUpdate(){
		//calculateBookingValue(Trigger.new); //Disabled per IBST-19902
        logHistory((Map<Id,OpportunityLineItem>)Trigger.newMap,(Map<Id,OpportunityLineItem>)Trigger.oldMap,'Update');  
        TriggerHandler.bypass('OpportunityLineItemTriggerHandler');      
    }
    //Helper Methods   
    
    /* Method below disabled per IBST-19902
    public void calculateBookingValue(List<OpportunityLineItem> listOLI){
    		if(listOLI!=null && listOLI.size()>0){
    			Boolean calculateBooking=false;
    			KeyPairValueMdt__mdt m=[Select Value__c from KeyPairValueMdt__mdt Where DeveloperName='CalculateBookingOnOpportunityProduct'];
    			if(Test.isRunningTest() || (m!=null && String.isNotBlank(m.Value__c) && m.Value__c.equalsIgnoreCase('true'))){
    				calculateBooking=true;
    			}
    			if(calculateBooking && !System.isBatch() && !System.isFuture() && !System.isQueueable() && !System.isScheduled()){
	    			Map<Id,Opportunity> mapOppIDs=new Map<Id,Opportunity>([Select Id From Opportunity 
	    																Where Id IN (Select OpportunityId From OpportunityLineItem Where Id=:listOLI) 
	    																AND Opportunity.Locked__c=false]);
	    			if(mapOppIDs!=null && mapOppIDs.size()>0){
	    				calculateBookingsFuture(mapOppIDs.keySet());
	    			}
    			}
    		}
    } 
    @future(callout=true)
    public static void calculateBookingsFuture(Set<Id> oppIDs){
    		if(oppIDs!=null && oppIDs.size()>0){
    			//TriggerHandler.bypass('OpportunityLineItemTriggerHandler');
    			APIBookings.calculateBookings(oppIDs);
    		}
    }
	*/
    public void beforeInsertUpdate(){
    		//https://jira.avalara.com/browse/ITBSE-1018
    		List<OpportunityLineItem> oliList=(List<OpportunityLineItem>)Trigger.new;
    		Map<String,OpportunityLineItem> ratePlanOpportunityLineItems=new Map<String,OpportunityLineItem>(); 
    		Set<Id> oppIDs=new Set<Id>(); 
    		for(OpportunityLineItem oli:oliList){
    			if(String.isNotBlank(oli.PRPId__c) && String.isNotBlank(oli.Model__c) && !oli.Model__c.equalsIgnoreCase('Discount-Percentage') && 
    				oli.EffectivePrice__c!=null && oli.CPQ_Quantity__c!=null && oli.CPQ_Quantity__c!=0){
    				oppIDs.add(oli.OpportunityId);
    			}
    			if(String.isNotBlank(oli.PRPId__c) && String.isNotBlank(oli.Model__c) && oli.Model__c.equalsIgnoreCase('Discount-Percentage')){
    				ratePlanOpportunityLineItems.put(oli.PRPId__c,oli);
    			}    			
    		}
    		if(oppIDs.size()>0){
    			Map<Id,Id> mapOppAccIDs=new Map<Id,Id>();
    			Map<String,Zuora__SubscriptionProductCharge__c> mapAccZSPC=new Map<String,Zuora__SubscriptionProductCharge__c>();
    			for(Opportunity o:[Select Id,AccountId,PROS_Order_Quote__r.OPStatus__c From Opportunity Where Id=:oppIDs AND PROS_Order_Quote__r.OPStatus__c NOT IN ('Complete','Canceled','Rejected')]){
    				mapOppAccIDs.put(o.Id,o.AccountId);
    			}
    			for(Zuora__SubscriptionProductCharge__c zspc:[Select Id,Zuora__Account__c,Zuora__Model__c,Zuora__RatePlanId__c,Zuora__Price__c,Extended_List_Amount__c 
    														 From Zuora__SubscriptionProductCharge__c 
    														 Where Zuora__Account__c=:mapOppAccIDs.values() AND 
    														 Zuora__Model__c='Discount-Percentage' AND Zuora__RatePlanId__c!=null
    														 AND Zuora__Price__c!=null AND Zuora__Price__c!=0]){
    				mapAccZSPC.put(zspc.Zuora__Account__c+zspc.Zuora__RatePlanId__c,zspc);
    			}
	    		for(OpportunityLineItem oli:oliList){
	    			if(String.isNotBlank(oli.PRPId__c) && String.isNotBlank(oli.Model__c) && !oli.Model__c.equalsIgnoreCase('Discount-Percentage') && 
	    				oli.EffectivePrice__c!=null && oli.CPQ_Quantity__c!=null && oli.CPQ_Quantity__c!=0){
	    				Id oppAccId=mapOppAccIDs.get(oli.OpportunityId);
	    				if(oppAccId!=null && mapAccZSPC.containsKey(oppAccId+oli.PRPId__c)){
	    					Zuora__SubscriptionProductCharge__c zspc=mapAccZSPC.get(oppAccId+oli.PRPId__c);
	    					oli.EffectivePrice__c=oli.EffectivePrice__c*(1+(zspc.Zuora__Price__c/-100));
	    					oli.TotalPrice__c=oli.EffectivePrice__c;
	    					if(String.isNotBlank(oli.BillingFrequency__c)){
	    						if(oli.BillingFrequency__c.equalsIgnoreCase('Monthly')){
	    							oli.TotalPrice__c=oli.EffectivePrice__c*12;
	    						}
	    						else if(oli.BillingFrequency__c.equalsIgnoreCase('Quarterly')){
	    							oli.TotalPrice__c=oli.EffectivePrice__c*4;
	    						}
	    						else if(oli.BillingFrequency__c.equalsIgnoreCase('Semi-Annual')){
	    							oli.TotalPrice__c=oli.EffectivePrice__c*2;
	    						}
	    						else if(oli.BillingFrequency__c.equalsIgnoreCase('Annual')){
	    							oli.TotalPrice__c=oli.EffectivePrice__c*1;
	    						}	    							    							    						
	    					}
	    					
	    					OpportunityLineItem discountPercentageOLI=ratePlanOpportunityLineItems.get(oli.PRPId__c);
	    					discountPercentageOLI.ListPrice__c=0;
	    					discountPercentageOLI.EffectivePrice__c=0;
	    					discountPercentageOLI.TotalPrice__c=0;
	    				}
	    			}
	    		}    			
    		}
    }
    
    public static void logHistory(Map<Id,OpportunityLineItem> oliNew,Map<Id,OpportunityLineItem> oliOld,String action){
        //check KeyPairValue if active then log LogOpportunityProductHistory
        Boolean logHistory=false;
        try{
            logHistory =Boolean.valueOf(KeyPairValue__c.getInstance('LogOpportunityProductHistory').Values__c);  
        }
        catch(Exception ex){}
        if(logHistory && oliNew!=null && oliNew.size()>0 && String.isNotBlank(action)){
            Map<String,String> mapOLIFields=Utility.getSObjectFieldsAndLabels('OpportunityLineItem');
            List<Opportunity_Product_History__c> listOPH=new  List<Opportunity_Product_History__c> ();
            for(OpportunityLineItem oli:oliNew.values()){
                List<String> updatedFields=new List<String>();
                OpportunityLineItem oldOLI;
                if(oliOld!=null){
                    oldOLI=oliOld.get(oli.Id);
                }
                String newValue='';
                String oldValue='';   
                if(action=='Insert'){
                    newValue=JSON.serialize(oli,false);
                }                
                else if(action=='Update' && oldOLI!=null){
                    for(String fieldName:mapOLIFields.keySet()){
                        if(fieldName!='LastModifiedDate' && fieldName!='SystemModstamp' && fieldName!='LastModifiedById' && oli.get(fieldName)!=oldOLI.get(fieldName)){
                            updatedFields.add(fieldName);
                        }
                    }
                    if(updatedFields.size()>0){
                        newValue=JSON.serialize(oli,false);
                        oldValue=JSON.serialize(oldOLI,false);
                    }
                }
                else if(action=='Delete'){
                    oldValue=JSON.serialize(oli,false);
                }
                else if(action=='UnDelete'){
                    newValue=JSON.serialize(oli,false);
                }    
                if(String.isNotBlank(oldValue) || String.isNotBlank(newValue)){
                    Opportunity_Product_History__c oph=new Opportunity_Product_History__c(
                                                                                            Opportunity__c=oli.OpportunityId ,
                                                                                            Opportunity_Product_Id__c=oli.Id,
                                                                                            Action__c=action,
                                                                                            Updated_Fields__c=String.join(updatedFields, ','),
                                                                                            New_Value__c=newValue,
                                                                                            Old_Value__c=oldValue);
                    listOPH.add(oph);
                }
            }
            insert listOPH;
        }
    }
}