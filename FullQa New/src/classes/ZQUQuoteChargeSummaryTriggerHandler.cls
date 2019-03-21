public with sharing class ZQUQuoteChargeSummaryTriggerHandler extends TriggerHandler{
    ///zqu__QuoteChargeSummary__c > ExtendedActualAnnual__c  sum into zqu__Quote__c.ExtendedActualAnnual_CAM__c
    ///SELECT ExtendedActualAnnual__c , Quote__c FROM zqu__QuoteChargeSummary__c WHERE isDeleted = false AND (cambookinglogic1__c = TRUE OR cambookinglogic2__c = TRUE OR cambookinglogic3__c = TRUE OR cambookinglogic4__c = TRUE OR cambookinglogic5__c = TRUE) ORDER BY Id DESC NULLS LAST
    
    ///zqu__QuoteChargeSummary__c > ExtendedActualAnnual__c  sum into zqu__Quote__c.ExtendedActualAnnual__c
    ///SELECT ExtendedActualAnnual__c , Quote__c FROM zqu__QuoteChargeSummary__c WHERE isDeleted = false AND extendedactualannual__c > 0 ORDER BY Id DESC NULLS LAST
    
    ///zqu__QuoteChargeSummary__c > ConnectorID__c  concatinate with space into zqu__Quote__c.Quote_Primary_Connector__c
    //SELECT ConnectorID__c , Quote__c FROM zqu__QuoteChargeSummary__c WHERE isDeleted = false AND (zqu__product_rate_plan_name__c LIKE '%Connector%' OR zqu__product_rate_plan_name__c LIKE '%platform%') ORDER BY zqu__totalprice__c DESC NULLS LAST , connector_name__c ASC NULLS LAST LIMIT 1
    
    ///zqu__QuoteChargeSummary__c > ExtendedActual__c sum into zqu__Quote__c.ExtendedActual_CAM__c
    //SELECT ExtendedActual__c , Quote__c FROM zqu__QuoteChargeSummary__c WHERE isDeleted = false AND (cambookinglogic1__c = TRUE OR cambookinglogic2__c = TRUE OR cambookinglogic3__c = TRUE OR cambookinglogic4__c = TRUE OR cambookinglogic5__c = TRUE) ORDER BY Id DESC NULLS LAST
    
    ///zqu__QuoteChargeSummary__c > ExtendedList__c sum into zqu__Quote__c.ExtendedList__c
    //SELECT ExtendedList__c , Quote__c FROM zqu__QuoteChargeSummary__c WHERE isDeleted = false AND extendedlist__c > 0 ORDER BY Id DESC NULLS LAST
    
    ///zqu__QuoteChargeSummary__c > ExtendedList__c  sum into zqu__Quote__c.ExtendedList_CAM__c
    //SELECT ExtendedList__c , Quote__c FROM zqu__QuoteChargeSummary__c WHERE isDeleted = false AND (cambookinglogic1__c = TRUE OR cambookinglogic2__c = TRUE OR cambookinglogic3__c = TRUE OR cambookinglogic4__c = TRUE OR cambookinglogic5__c = TRUE) ORDER BY Id DESC NULLS LAST
    
    ///zqu__QuoteChargeSummary__c > ExtendedActual__c  sum into zqu__Quote__c.ExtendedActual__c
    //SELECT ExtendedActual__c , Quote__c FROM zqu__QuoteChargeSummary__c WHERE (isDeleted = false AND quote__r.billingfrequency__c != 'Monthly' AND zqu__type__c != 'Usage') OR (isDeleted = false AND quote__r.billingfrequency__c = 'Monthly' AND productname_typeconcat__c != 'Avalara AvaTax Recurring' AND productname_typeconcat__c != 'Avalara CertCapture Recurring' AND zqu__type__c != 'Usage' AND productname_typeconcat__c != 'Avalara AvaTax Global Recurring' AND productname_typeconcat__c != 'Avalara Returns Recurring' AND productname_typeconcat__c != 'Avalara TrustFile Recurring') OR (isDeleted = false AND quote__r.billingfrequency__c = 'Monthly' AND zqu__type__c != 'Usage' AND quote__r.freemonths__c = 0) ORDER BY Id DESC NULLS LAST
    
    ///zqu__QuoteChargeSummary__c > Corp_Booked_Value__c sum into Opportunity.ARR__c
    //SELECT Corp_Booked_Value__c , zqu__Opportunity__c FROM zqu__QuoteChargeSummary__c WHERE isDeleted = false AND zqu__type__c = 'Recurring' AND quote_status__c = 'Sent to Z-Billing' AND opstatus__c = 'Complete' AND zqu__opportunity__r.bookedvalue__c > 0 AND corp_booked_value__c > 0 ORDER BY Id DESC NULLS LAST
    
    //zqu__QuoteChargeSummary__c > Count__c sum into Opportunity.Contains_Drops_Zuora__c
    //SELECT Count__c , zqu__Opportunity__c FROM zqu__QuoteChargeSummary__c WHERE isDeleted = false AND amendment_type__c = 'RemoveProduct' ORDER BY Id DESC NULLS LAST
    
    //zqu__QuoteChargeSummary__c > Rollup_Opportunity_Product_Summary__c text into Opportunity.Product_Summary__c
    //SELECT Rollup_Opportunity_Product_Summary__c , zqu__Opportunity__c FROM zqu__QuoteChargeSummary__c WHERE isDeleted = false AND quote__r.zqu__status__c != 'New' ORDER BY rollup_opportunity_product_summary__c ASC NULLS LAST
    
  //protected override void beforeInsert(){}

    //protected override void beforeUpdate(){}

  //  protected override void beforeDelete(){}

    protected override void afterInsert(){
        updateRollups((List<zqu__QuoteChargeSummary__c>) Trigger.new);
    } 
    
    protected override void afterUpdate(){
        updateRollups((List<zqu__QuoteChargeSummary__c>) Trigger.new);
    }

    protected override void afterDelete(){
        updateRollups((List<zqu__QuoteChargeSummary__c>) Trigger.old);
    }

    protected override void afterUndelete(){
        updateRollups((List<zqu__QuoteChargeSummary__c>) Trigger.new);
    }
    
    
    public static void updateRollups(List<zqu__QuoteChargeSummary__c> listQuoteChargeSummary){
            if(listQuoteChargeSummary!=null && listQuoteChargeSummary.size()>0){
                if(!System.isBatch() && !System.isFuture() && !System.isScheduled() && !System.isQueueable()){
                    Map<Id,zqu__QuoteChargeSummary__c> mapSP=new Map<Id,zqu__QuoteChargeSummary__c>(listQuoteChargeSummary);
                    updateRollupsFuture(mapSP.keySet());
                }
            }   
    } 
    @future     
    public static void updateRollupsFuture(Set<Id> setQCSIDs){
            if(setQCSIDs!=null && setQCSIDs.size()>0){
                List<zqu__QuoteChargeSummary__c> listQCS=[Select Id,Quote__c,zqu__Opportunity__c From zqu__QuoteChargeSummary__c Where Id=:setQCSIDs ALL ROWS];
                Set<Id> setQuoteId=new Set<Id>();
                Set<Id> setOppId=new Set<Id>();
                for(zqu__QuoteChargeSummary__c qcs:listQCS){
                    setQuoteId.add(qcs.Quote__c);
                    setOppId.add(qcs.zqu__Opportunity__c);
                }
                if(setQuoteId.size()>0){
                    Set<String> productnameTypeconcat=new Set<String>{'Avalara AvaTax Recurring','Avalara CertCapture Recurring','Avalara AvaTax Global Recurring','Avalara Returns Recurring','Avalara TrustFile Recurring'};
                    List<zqu__Quote__c> listQuotes=[Select Id,ExtendedActualAnnual__c,ExtendedActualAnnual_CAM__c,Quote_Primary_Connector__c,ExtendedActual_CAM__c,ExtendedList__c,
                                                    ExtendedList_CAM__c,ExtendedActual__c,BillingFrequency__c,FreeMonths__c,
                                                    (Select Id,ExtendedActualAnnual__c,ConnectorID__c,ExtendedList__c,ExtendedActual__c,
                                                    Cambookinglogic1__c,Cambookinglogic2__c,Cambookinglogic3__c,Cambookinglogic4__c,Cambookinglogic5__c,
                                                    zqu__Product_Rate_Plan_Name__c,zqu__Type__c,Productname_Typeconcat__c 
                                                    From Quote_Charge_Summarys__r) 
                                                    From zqu__Quote__c Where Id=:setQuoteId];
                    for(zqu__Quote__c q:listQuotes){
                        q.ExtendedActualAnnual__c=0;
                        q.ExtendedActualAnnual_CAM__c=0;
                        //q.Quote_Primary_Connector__c='';
                        q.Quote_Primary_Connector__c=null;
                        q.ExtendedActual_CAM__c=0;
                        q.ExtendedList__c=0;
                        q.ExtendedList_CAM__c=0;
                        q.ExtendedActual__c=0;

                        for(zqu__QuoteChargeSummary__c qcs:q.Quote_Charge_Summarys__r){
                            if(qcs.ExtendedActualAnnual__c>0 && (qcs.Cambookinglogic1__c || qcs.Cambookinglogic2__c || qcs.Cambookinglogic3__c || qcs.Cambookinglogic4__c || qcs.Cambookinglogic5__c)){
                                q.ExtendedActualAnnual_CAM__c+=qcs.ExtendedActualAnnual__c;
                            }       
                            if(qcs.ExtendedActualAnnual__c>0){
                                q.ExtendedActualAnnual__c+=qcs.ExtendedActualAnnual__c;
                            }    
                            if(String.isNotBlank(qcs.ConnectorID__c) && String.isNotBlank(qcs.zqu__Product_Rate_Plan_Name__c) && 
                            (qcs.zqu__Product_Rate_Plan_Name__c.containsIgnoreCase('Connector') || qcs.zqu__Product_Rate_Plan_Name__c.containsIgnoreCase('platform'))){
                                q.Quote_Primary_Connector__c=qcs.ConnectorID__c;
                            }
                            if(qcs.ExtendedActual__c>0 && (qcs.Cambookinglogic1__c || qcs.Cambookinglogic2__c || qcs.Cambookinglogic3__c || qcs.Cambookinglogic4__c || qcs.Cambookinglogic5__c)){
                                q.ExtendedActual_CAM__c+=qcs.ExtendedActual__c;
                            }     
                            if(qcs.ExtendedList__c>0){
                                q.ExtendedList__c+=qcs.ExtendedList__c;
                            } 
                                if(qcs.ExtendedList__c>0 && (qcs.Cambookinglogic1__c || qcs.Cambookinglogic2__c || qcs.Cambookinglogic3__c || qcs.Cambookinglogic4__c || qcs.Cambookinglogic5__c)){
                                q.ExtendedList_CAM__c+=qcs.ExtendedList__c;
                            }  
                            if(
                                (q.BillingFrequency__c!='Monthly' && qcs.zqu__Type__c!='Usage') ||
                                (q.BillingFrequency__c=='Monthly' && qcs.zqu__Type__c!='Usage' && !productnameTypeconcat.contains(qcs.Productname_Typeconcat__c)) ||
                                (q.BillingFrequency__c=='Monthly' && qcs.zqu__Type__c!='Usage' && q.FreeMonths__c==0)
                              ){
                                q.ExtendedActual__c+=qcs.ExtendedActual__c;
                            }
                                                                                                                                                                                    
                        }           
                    }
              //  TriggerHandler.bypass('ZQUQuoteChargeSummaryTriggerHandler');
                Database.SaveResult[] dsrList=Database.update(listQuotes,false);
                Utility.createApexLog('ZQUQuoteChargeSummaryTriggerHandler', dsrList,true);
                //TriggerHandler.clearBypass('OpportunityTriggerHandler');                      
                }
                if(setOppId.size()>0){
                    List<Opportunity> listOpportunities=[Select Id,ARR__c,Contains_Drops_Zuora__c,Product_Summary__c,BookedValue__c,
                                                (Select Id,Corp_Booked_Value__c,Count__c,Rollup_Opportunity_Product_Summary__c,zqu__Type__c,
                                                        Quote_Status__c,Opstatus__c,Amendment_Type__c,Quote__r.zqu__Status__c,Quote__c,
                                                        zqu__Opportunity__r.BookedValue__c,zqu__Period__c 
                                                        From zqu__Quote_Charge_Summarys__r) 
                                                From Opportunity Where Id=:setOppId];
                    for(Opportunity o:listOpportunities){
                        o.ARR__c=0;
                        o.Contains_Drops_Zuora__c=0;
                        o.Product_Summary__c='';
                        for(zqu__QuoteChargeSummary__c qcs:o.zqu__Quote_Charge_Summarys__r){
					       /* System.debug('zqu__Period__c======='+qcs.zqu__Period__c);
					        System.debug('Corp_Booked_Value__c======='+qcs.Corp_Booked_Value__c );
					        System.debug('zqu__Type__c======='+qcs.zqu__Type__c);
					        System.debug('Quote_Status__c======='+qcs.Quote_Status__c);
					        System.debug('Opstatus__c======='+qcs.Opstatus__c);
					        System.debug('BookedValue__c======='+qcs.zqu__Opportunity__r.BookedValue__c);      */                  	
                            if(qcs.Corp_Booked_Value__c>0 && qcs.zqu__Type__c=='Recurring' && qcs.Quote_Status__c=='Sent to Z-Billing' && qcs.Opstatus__c=='Completed' && qcs.zqu__Opportunity__r.BookedValue__c>0){
                                o.ARR__c+=qcs.Corp_Booked_Value__c;
                            }
                            if(qcs.Count__c>0 && qcs.Amendment_Type__c=='RemoveProduct'){
                                o.Contains_Drops_Zuora__c+=qcs.Count__c;
                            }
                            if(qcs.Quote__c!=null && qcs.Quote__r.zqu__Status__c!='New' && String.isNotBlank(qcs.Rollup_Opportunity_Product_Summary__c)){
                                o.Product_Summary__c+=' '+qcs.Rollup_Opportunity_Product_Summary__c;
                            }
                        }
                    } 
              //  TriggerHandler.bypass('OpportunityTriggerHandler');
                Database.SaveResult[] dsrList=Database.update(listOpportunities,false);
                Utility.createApexLog('ZQUQuoteChargeSummaryTriggerHandler', dsrList,true);
                //TriggerHandler.clearBypass('OpportunityTriggerHandler');                                      
                }
            }
    }   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
         
}