public class OpportunityTriggerHandler extends TriggerHandler {
	///Opportunity > BookedValue__c  sum into Campaign.TotalBookedValue__c
	//SELECT BookedValue__c , CampaignId FROM Opportunity WHERE isDeleted = false AND ding_date__c != null AND type = 'New' AND campaignid != '70140000000Tm0gAAC' AND campaignid != '70140000001LPHRAA4' AND campaignid != '70140000000F4uqAAC' AND campaignid != '70140000000Tm0WAAS' AND campaignid != '701400000004ti7AAA' ORDER BY Id DESC NULLS LAST
	
	///Opportunity > Ding_Value__c  count into Campaign.DingCount__c
	//SELECT Ding_Value__c , CampaignId FROM Opportunity WHERE isDeleted = false AND ding_date__c != null AND type = 'New' AND campaignid != '70140000000Tm0gAAC' AND campaignid != '70140000001LPHRAA4' AND campaignid != '70140000000F4uqAAC' AND campaignid != '70140000000Tm0WAAS' AND campaignid != '701400000004ti7AAA' ORDER BY Id DESC NULLS LAST
	
	///Opportunity > IsWon count into Connector__c.No_Closed_Won_Opps__c
	//SELECT IsWon , Connector__c FROM Opportunity WHERE isDeleted = false AND stagename = 'Closed Won' ORDER BY Id DESC NULLS LAST
	
	//Opportunity > Counter__c  sum into Connector__c.X2017_YTD_Opp_Actual__c
	//SELECT Counter__c , Connector__c FROM Opportunity WHERE isDeleted = false AND closedate = THIS_YEAR AND type = 'New' ORDER BY Id DESC NULLS LAST
	
	//Opportunity > Count__c  sum into User.Current_FY_Dings__c
	//SELECT Count__c , OwnerId FROM Opportunity WHERE isDeleted = false AND ding_date__c = THIS_YEAR ORDER BY Id DESC NULLS LAST
	
	//Opportunity > BookedValue__c  sum into Account.Total_Revenue__c
	//SELECT BookedValue__c , PartnerName__c FROM Opportunity WHERE isDeleted = false AND ding_value__c > 0 AND booked_date__c = THIS_YEAR ORDER BY Id DESC NULLS LAST
	
	//Opportunity > Counter__c  sum into Account.Total_Deals__c
	//SELECT Counter__c , PartnerName__c FROM Opportunity WHERE isDeleted = false AND ding_value__c > 0 AND booked_date__c = THIS_YEAR ORDER BY Id DESC NULLS LAST
	
	//Opportunity > Counter__c  sum into Account.Total_Opps__c
	//SELECT Counter__c , PartnerName__c FROM Opportunity WHERE isDeleted = false AND createddate = THIS_YEAR ORDER BY Id DESC NULLS LAST
	
	//Opportunity > Count__c  count into Contact.No_of_Won_Partner_Sales_Ops__c
	//SELECT Count__c , PartnerSalesRep__c FROM Opportunity WHERE iswon = TRUE AND closedate = THIS_YEAR ORDER BY Id DESC NULLS LAST
	
	 //Trigger Handler Methods
     protected override void beforeInsert(){
     beforeInsertUpdate();
     }

  	protected override void beforeUpdate(){
  	 beforeInsertUpdate();
  	 }

    //protected override void beforeDelete(){}
    public void beforeInsertUpdate(){
     Set<ID> connectorIdSet = new Set<Id>();
     Set<ID> channelPartnerNameSet = new Set<Id>();
     Map<Id,Connector__c> mapConnector=new Map<Id,Connector__c>();
     Map<Id,Account> mapChannelPartner=new Map<Id,Account>();
     List<Opportunity_Role_Split__c> oppSAMSplitList = new  List<Opportunity_Role_Split__c>();
     List<Opportunity_Role_Split__c> oppPPMSplitList = new  List<Opportunity_Role_Split__c>();
     /* String OpportunityRecordTypeExclude='';
      try{
      	OpportunityRecordTypeExclude =KeyPairValue__c.getInstance('OpportunityRecordTypeExclude').Values__c;     
      }
      catch(Exception ex){} */ 
      Set<Date> oppBookDates=new Set<Date>();
     for(Opportunity opp: (List<Opportunity>) Trigger.new){
     	/*
     	if(opp.PriceBook2Id==null && !OpportunityRecordTypeExclude.contains(opp.RecordTypeId)){
     		opp.PriceBook2Id='01s33000000VfLP';
     	}*/
     	if(opp.Booked_Date__c != null){
     		oppBookDates.add(opp.Booked_Date__c);
     	 Integer monthsBetween = opp.Booked_Date__c.monthsBetween(system.today());
     	
      	//Connector Deal DSP
      	// && !opp.SubType__c.equalsIgnoreCase('SOHO')
      	if(String.isNotBlank(opp.Type) && String.isNotBlank(opp.SubType__c) && opp.Type.equalsIgnoreCase('New') && opp.Connector__c!= null 
         && (opp.Booked_Date__c != null && monthsBetween<=1) && !opp.SubType__c.equalsIgnoreCase('EMEA')  )
      	{
      		connectorIdSet.add(opp.Connector__c);
      	}
        //Has Channel Partner MSP
        if(/*!String.isBlank(opp.PartnerNumber__c) && !opp.PartnerNumber__c.equals('000-000-000')&&*/ String.isNotBlank(opp.PartnerName__c) 
        && String.isNotBlank(opp.Channel_Partner_Category__c) && (opp.Booked_Date__c != null && monthsBetween<=1) && (opp.Channel_Partner_Category__c.equalsIgnoreCase('Marketing & Sales Partner') || opp.Channel_Partner_Category__c.equalsIgnoreCase('Accounting & Consulting Partner'))){
            channelPartnerNameSet.add(opp.PartnerName__c);    
        }
      }
     }
     List<Finance_Operations_Close_Event__c> listFOCE;
     if(oppBookDates!=null && oppBookDates.size()>0){
     	listFOCE=[Select Id,Booking_Period_Start_Date__c,Booking_Period_End_Date__c,EDW_Booking_Freeze_Date__c From Finance_Operations_Close_Event__c Where Booking_Period_Start_Date__c<=:oppBookDates AND Booking_Period_End_Date__c>=:oppBookDates];
     }
    //channel Parnter MSP
    if(channelPartnerNameSet.size()>0){
    		mapChannelPartner=new Map<Id,Account>([Select id,CDM__c,Secondary_CDM__c from Account where id in:channelPartnerNameSet]);
    }
   //Connector Deal DSP
   if(connectorIdSet.size()>0){
   		mapConnector=new Map<Id,Connector__c>([Select id,SAM__c,Suppress_Partner_Split__c,PPM__c from Connector__c where id =:connectorIdSet AND Suppress_Partner_Split__c = false]);
    }
   for(Opportunity opp: (List<Opportunity>) Trigger.new){
   	if(opp.Booked_Date__c==null){
   		opp.Finance_Operations_Close_Event__c=null;
   		opp.EDW_Booking_Freeze_Date__c=null;
   	}
   	else if(listFOCE!=null && listFOCE.size()>0){
   		for(Finance_Operations_Close_Event__c foce:listFOCE){
   			if(opp.Booked_Date__c!=null && opp.Booked_Date__c>=foce.Booking_Period_Start_Date__c && opp.Booked_Date__c<=foce.Booking_Period_End_Date__c){
   				opp.Finance_Operations_Close_Event__c=foce.Id;
   				opp.EDW_Booking_Freeze_Date__c=foce.EDW_Booking_Freeze_Date__c;
   				break;
   			}
   		}
   	}
   	//Stamp DSP SAM/PPM
    if(mapConnector.size()>0 && mapConnector.containsKey(opp.Connector__c)){
      if(!opp.Initial_DSP_SAM_Split_Complete__c && mapConnector.get(opp.Connector__c).SAM__c!=null&& !opp.Initial_DSP_SAM_Split_Complete__c){
         opp.DSP_SAM__c =  mapConnector.get(opp.Connector__c).SAM__c;
         opp.Initial_DSP_SAM_Split_Complete__c = true;
         if(opp.id != null){
         Opportunity_Role_Split__c oppDSPSAMSplit = new Opportunity_Role_Split__c(Opportunity__c = opp.id,Percent__c=100,Role__c='SAM',Role_Type__c = 'DSP',Team_Member__c =  opp.DSP_SAM__c,Note__c='--');
	     oppSAMSplitList.add(oppDSPSAMSplit); 
         }
        }      
        if(!opp.Initial_DSP_PPM_Split_Complete__c && mapConnector.get(opp.Connector__c).PPM__c!=null && !opp.Initial_DSP_PPM_Split_Complete__c ){
         opp.DSP_PPM__c = mapConnector.get(opp.Connector__c).PPM__c;
         opp.Initial_DSP_PPM_Split_Complete__c = true;
         if(opp.id != null){
         Opportunity_Role_Split__c oppDSPPPMSplit = new Opportunity_Role_Split__c(Opportunity__c = opp.id,Percent__c=100,Role__c='PMM',Role_Type__c = 'DSP',Team_Member__c =opp.DSP_PPM__c);
	     oppPPMSplitList.add(oppDSPPPMSplit);
         }
        } 
     }
  	  //Stamp MSP SAM/PPM
      if(mapChannelPartner.size()>0 && mapChannelPartner.containsKey(opp.PartnerName__c)){
       if(mapChannelPartner.get(opp.PartnerName__c).Secondary_CDM__c!=null && !opp.Initial_MSP_PPM_Split_Complete__c){
         opp.MSP_PPM__c = mapChannelPartner.get(opp.PartnerName__c).Secondary_CDM__c;
         opp.Initial_MSP_PPM_Split_Complete__c = true;
           if(opp.id != null){
          Opportunity_Role_Split__c oppMSPPMSplit = new Opportunity_Role_Split__c(Opportunity__c = opp.id,Percent__c=100,Role__c='PMM',Role_Type__c = 'MSP',Team_Member__c = opp.MSP_PPM__c);
          oppPPMSplitList.add(oppMSPPMSplit);
           }
       }
       if(mapChannelPartner.get(opp.PartnerName__c).CDM__c!=null && !opp.Initial_MSP_SAM_Split_Complete__c){
         opp.SAM__c =  mapChannelPartner.get(opp.PartnerName__c).CDM__c;
         opp.Initial_MSP_SAM_Split_Complete__c = true;
        if(opp.id != null){
         Opportunity_Role_Split__c oppDSPSAMSplit = new Opportunity_Role_Split__c(Opportunity__c = opp.id,Percent__c=100,Role__c='SAM',Role_Type__c = 'MSP',Team_Member__c = opp.SAM__c,Note__c='--');
         oppSAMSplitList.add(oppDSPSAMSplit);
        }
       }
  	 }
    }
     if(oppSAMSplitList.size()>0){
         upsert oppSAMSplitList;
       }
       if(oppPPMSplitList.size()>0){
         upsert oppPPMSplitList;
       }
  }
  	protected override void afterInsert(){
  		updateRollups((List<Opportunity>) Trigger.new);
  		afterInsertUpdate();
  	} 
  	
  	protected override void afterUpdate(){
  		updateRollups((List<Opportunity>) Trigger.new);
  		afterInsertUpdate();
  		//super.afterInsert();
  	}

  	protected override void afterDelete(){
  		updateRollups((List<Opportunity>) Trigger.old);
  	}

  	protected override void afterUndelete(){
  		updateRollups((List<Opportunity>) Trigger.new);
  	}
	
	public static void afterInsertUpdate(){
        List<Opportunity> oppList=(List<Opportunity>)Trigger.new;
        Map<Id,Opportunity> mapOldMap;
        if(Trigger.oldMap!=null && Trigger.oldMap.size()>0){
        		mapOldMap=(Map<Id,Opportunity>)Trigger.oldMap;
        }
        List<Opportunity_Role_Split__c> orsList = new  List<Opportunity_Role_Split__c>();
        for(Opportunity o:[Select Id,OwnerId,Owner.ManagerId,(Select Id,Team_Member__c,Percent__c From Opportunity_Role_Splits__r Where Role__c=:'Manager') From Opportunity Where isClosed=false AND Id=:oppList]){
        		if(o.OwnerId!=null && o.Owner.ManagerId!=null){
        			Boolean createORS=true;
	        		for(Opportunity_Role_Split__c ors:o.Opportunity_Role_Splits__r){
	        			if(o.Owner.ManagerId==ors.Team_Member__c){
	        				createORS=false;
	        			}
	        			else{
	        				ors.Percent__c=0;
	        				orsList.add(ors);
	        			}
	        		}
	        		if(createORS){
			         Opportunity_Role_Split__c ors = new Opportunity_Role_Split__c(Opportunity__c = o.id,Percent__c=100,Role__c='Manager',Team_Member__c = o.Owner.ManagerId,Note__c='');
			         orsList.add(ors);	        			
	        		}
        		}
        }
        upsert orsList;
        
        //BATS-694
        if(Trigger.isInsert && !System.isFuture() && !System.isBatch() && !System.isScheduled() && !System.isQueueable()){
        	updateMKScoreFuture(Trigger.newMap.keySet());
        }
        
        
       /* if(oppList!=null && oppList.size()>0){
            Set<Id> oppIDs=new Set<Id>();
            for(Opportunity o:oppList){
                if(mapOldMap!=null && mapOldMap.containsKey(o.Id) && o.Booked_Date__c!=mapOldMap.get(o.Id).Booked_Date__c){
                    oppIDs.add(o.Id);
                }
            }
            //You can only have 100 scheduled Apex jobs at one time.
            if(oppIDs.size()>0 && !System.isFuture() && !System.isBatch() && !System.isScheduled()){
            	    //IBST-10879 Update line item booked date stamping routing to be called 10 min after condition met
            	    //Schedule Class JobProcessOpportunityLineItem
                Datetime executeTime = (System.now()).addSeconds(10);
                String cronExpression = Utility.GetCRONExpression(executeTime);
                JobProcessOpportunityLineItem job = new JobProcessOpportunityLineItem(oppIDs);
                System.schedule('ScheduledJob ' + executeTime.getTime(),cronExpression,job);
            }
        }*/
	}
	@future    	
    public static void updateMKScoreFuture(Set<Id> setOppIDs){
    	List<Opportunity> oppList = [Select id,accountId,MK_Customer_Fit_Score_AvaTax__C,MK_Customer_Fit_Score_CC__c,MK_Customer_Fit_Score_Comms__c,MK_Lead_Score_AvaTax__c,
    	                             MK_Lead_Score_CC__c,MK_Lead_Score_Comms__c,(SELECT OpportunityId,ContactId,contact.mk_customer_fit_avatax_score__c,contact.MK_Customer_Fit_Score_CC__c,Contact.MK_Customer_Fit_Score_Comms__c,
                                     Contact.mk_lead_avatax_score__c,contact.MK_Lead_Score_CC__c,contact.MK_Lead_Score_Comms__c FROM OpportunityContactRoles) from Opportunity where id In : setOppIDs AND  Locked__c = false];
    	                             system.debug('oppList>>>'+oppList);
        //To populate MK socre from Contact related to Account 
        Set<Id> accountID = new Set<Id>();
        for(Opportunity opp : opplist){
          if(opp.accountid != null){
           accountID.add(opp.accountid);
          }
        }
        Map<Id,Account> accMap = new  Map<Id,Account>([Select id,(Select id,mk_customer_fit_avatax_score__c,MK_Customer_Fit_Score_CC__c,MK_Customer_Fit_Score_Comms__c,
                                 mk_lead_avatax_score__c,MK_Lead_Score_CC__c,MK_Lead_Score_Comms__c from Contacts where mk_customer_fit_avatax_score__c!= null OR 
                                 MK_Customer_Fit_Score_CC__c!=null OR MK_Customer_Fit_Score_Comms__c !=null OR mk_lead_avatax_score__c!=null OR 
                                 MK_Lead_Score_CC__c!= null OR MK_Lead_Score_Comms__c != null ORDER BY createddate Desc) from Account where id IN:accountID]);
                                 
                                     
    	//For Opportunities created for Contact use OCR                                 
    	Set<Id> contactIdSet = new Set<Id>();
        for(Opportunity opp: oppList){
	        for(OpportunityContactRole ocr : opp.OpportunityContactRoles){  
	          if(ocr.ContactId != null){
	              contactIdSet.add(ocr.ContactId);      
	          }        	                      
            }
        }
       
    	Map<Id,Contact> conMap =new Map<Id,Contact>([Select id,mk_customer_fit_avatax_score__c,MK_Customer_Fit_Score_CC__c,MK_Customer_Fit_Score_Comms__c,
                          mk_lead_avatax_score__c,MK_Lead_Score_CC__c,MK_Lead_Score_Comms__c from Contact where id IN: contactIdSet AND (mk_customer_fit_avatax_score__c!= null OR 
                          MK_Customer_Fit_Score_CC__c!=null OR MK_Customer_Fit_Score_Comms__c !=null OR mk_lead_avatax_score__c!=null OR MK_Lead_Score_CC__c!= null OR MK_Lead_Score_Comms__c != null) ]);
                          system.debug('conMap>>'+conMap);
       //if(conMap.values().size()>0){                             
        for(Opportunity opp: oppList){
         if(conMap.values().size()>0){
        	for(OpportunityContactRole ocr :opp.OpportunityContactRoles ){
		   	 	if(conMap.containsKey(ocr.contactId)){
		   	 		OpportunityHelper.updateMKscoreOpp(opp,conMap.get(ocr.contactId));
		   	 	}
        	}
        } else if(accMap.values().size()>0 && accMap.get(opp.AccountId).Contacts.size() >0){
	      	   //opp.CampaignId = conCM.get(accMap.get(opp.AccountId).Contacts[0].Id)[0].CampaignId;
	      	   OpportunityHelper.updateMKscoreOpp(opp,accMap.get(opp.AccountId).Contacts[0]);
	      	}
        }
       
      //}
       update oppList;        
    }
    public static void updateRollups(List<Opportunity> listOpportunity){
    		/*if(listOpportunity!=null && listOpportunity.size()>0){
    			if(!System.isBatch() && !System.isFuture() && !System.isScheduled()){
    				Map<Id,Opportunity> mapSP=new Map<Id,Opportunity>(listOpportunity);
    				updateRollupsFuture(mapSP.keySet());
    			}
    		}	*/
    }	
   /* @future    	
    public static void updateRollupsFuture(Set<Id> setOppIDs){
    		if(setOppIDs!=null && setOppIDs.size()>0){
    			Set<Id> setExcludeCampaigns=new Set<Id>{'70140000000Tm0gAAC','70140000001LPHRAA4','70140000000F4uqAAC','70140000000Tm0WAAS','701400000004ti7AAA'};
    			List<Opportunity> listOpps=[Select Id,CampaignId,Connector__c From Opportunity Where Id=:setOppIDs ALL ROWS];
    			Set<Id> campaignIDs=new Set<Id>();
    			Set<Id> connectorIDs=new Set<Id>();
    			for(Opportunity o:listOpps){
    				if(!setExcludeCampaigns.contains(o.CampaignId)){
    					campaignIDs.add(o.CampaignId);
    				}
    				connectorIDs.add(o.Connector__c);
    			}
    			if(campaignIDs.size()>0){
    				Map<Id,Campaign> mapCampaigns=new Map<Id,Campaign>();
				AggregateResult[] groupedResults=[Select CampaignId,sum(BookedValue__c) TotalBookedValue,count(Id) DingCount 
													From  Opportunity 
													Where Type = 'New' AND Ding_Date__c!=null AND IsDeleted=false 
													Group By CampaignId 
													Having CampaignID=:campaignIDs]; 
				for (AggregateResult ar : groupedResults){
					mapCampaigns.put(String.valueOf(ar.get('CampaignId')),new Campaign(Id=String.ValueOf(ar.get('CampaignId')),TotalBookedValue__c=Double.valueOf(ar.get('TotalBookedValue')),DingCount__c=Integer.valueOf(ar.get('DingCount'))));
				}
				//by pass account trigger 
				TriggerHandler.bypass('CampaignTriggerHandler');
				Database.SaveResult[] dsrList=Database.update(mapCampaigns.values(),false);
				Utility.createApexLog('OpportunityTriggerHandler', dsrList,true);
				TriggerHandler.clearBypass('CampaignTriggerHandler');					    				
    			}
    			if(connectorIDs.size()>0){
    				List<Connector__c> conList=new List<Connector__c>();
				AggregateResult[] groupedResults=[select Connector__c,count(Id) NoClosedWonOpps From Opportunity Where StageName='Closed Won' group by Connector__c
													Having Connector__c=:connectorIDs]; 
				for (AggregateResult ar : groupedResults){
					conList.add(new Connector__c(Id=String.valueOf(ar.get('Connector__c')),No_Closed_Won_Opps__c=Integer.valueOf(ar.get('NoClosedWonOpps'))));
				} 
				Database.SaveResult[] dsrList=Database.update(conList,false);
				Utility.createApexLog('OpportunityTriggerHandler', dsrList,true);				   				
    			}
    		} 
    }	*/
    //Helper Methods
    //IBST-6181
    //Disable Delete on Opportunities when Order is Complete
    protected override void beforeDelete(){
            //Trigger.old[0].addError('You cannot delete the Opportunity.');
    Set<Id> oppIDSet = new Set<Id>();
    for( Opportunity opp : (List<Opportunity>)Trigger.old){
       oppIDSet.add(opp.id);
    }
     List<CameleonCPQ__Quote__c> closedProsQuoteId = [Select Id,OpportunityId__c,SentToZBillingDate__c,OPStatus__c from CameleonCPQ__Quote__c where OPStatus__c IN : Constants.DO_NOT_DELETE_STATUS AND OpportunityId__c IN :oppIDSet];
    Set<Id> prosQuoteID = new  Set<Id>();
    for (CameleonCPQ__Quote__c cpq : closedProsQuoteId){
        //if(cpq.OPStatus__c==Constants.PROS_QUOTE_STATUS_CANCELED ||cpq.OPStatus__c ==Constants.PROS_QUOTE_STATUS_COMPLETE){
            prosQuoteID.add(cpq.id); 
      //}
    }
    for( Opportunity opp : (List<Opportunity>)Trigger.old){
    	if(prosQuoteID.contains(opp.PROS_Order_Quote__c) || opp.IsClosed == true){
        opp.addError(Constants.Opportunity_CANNOT_DELETE_CLOSED_OPPORTUNITY);
     	}
    }
 }
}