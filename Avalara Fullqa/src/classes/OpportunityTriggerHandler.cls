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
     List<Opportunity_SAM_Split2__c> oppSAMSplitList = new  List<Opportunity_SAM_Split2__c>();
     List<Opportunity_PPM_Split__c> oppPPMSplitList = new  List<Opportunity_PPM_Split__c>();
     for(Opportunity opp: (List<Opportunity>) Trigger.new){
      	//Connector Deal DSP
      	if(String.isNotBlank(opp.Type) && String.isNotBlank(opp.SubType__c) && !opp.SubType__c.equalsIgnoreCase('SOHO') && opp.Type.equalsIgnoreCase('New') && opp.Connector__c!= null 
         && opp.Booked_Date__c != null && !opp.SubType__c.equalsIgnoreCase('EMEA')  )
      	{
      		connectorIdSet.add(opp.Connector__c);
      	}
        //Has Channel Partner MSP
        if(!String.isBlank(opp.PartnerNumber__c) && !opp.PartnerNumber__c.equals('000-000-000')&& String.isNotBlank(opp.PartnerName__c) 
        && String.isNotBlank(opp.Channel_Partner_Category__c) && opp.Booked_Date__c != null && opp.Channel_Partner_Category__c.equalsIgnoreCase('Marketing & Sales Partner')){
            channelPartnerNameSet.add(opp.PartnerName__c);    
        }
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
   	//Stamp DSP SAM/PPM
    if(mapConnector.size()>0 && mapConnector.containsKey(opp.Connector__c)){
      if(!opp.Initial_DSP_SAM_Split_Complete__c && mapConnector.get(opp.Connector__c).SAM__c!=null&& !opp.Initial_DSP_SAM_Split_Complete__c){
         opp.DSP_SAM__c =  mapConnector.get(opp.Connector__c).SAM__c;
         opp.Initial_DSP_SAM_Split_Complete__c = true;
         if(opp.id != null){
         Opportunity_SAM_Split2__c oppDSPSAMSplit = new Opportunity_SAM_Split2__c(Opportunity__c = opp.id,Percent__c=100,SAM_Type__c = 'DSP',Team_Member__c =  opp.DSP_SAM__c,Note__c='--');
	     oppSAMSplitList.add(oppDSPSAMSplit); 
         }
        }      
        if(!opp.Initial_DSP_PPM_Split_Complete__c && mapConnector.get(opp.Connector__c).PPM__c!=null && !opp.Initial_DSP_PPM_Split_Complete__c ){
         opp.DSP_PPM__c = mapConnector.get(opp.Connector__c).PPM__c;
         opp.Initial_DSP_PPM_Split_Complete__c = true;
         if(opp.id != null){
         Opportunity_PPM_Split__c oppDSPPPMSplit = new Opportunity_PPM_Split__c(Opportunity__c = opp.id,Percent__c=100,PMM_Type__c = 'DSP',Team_Member__c =opp.DSP_PPM__c);
	     oppPPMSplitList.add(oppDSPPPMSplit);
         }
        }
      }	  	  
  	  //Stamp MSP SAM/PPM
      if(mapChannelPartner.containsKey(opp.PartnerName__c)){
       if(mapChannelPartner.get(opp.PartnerName__c).Secondary_CDM__c!=null && !opp.Initial_MSP_PPM_Split_Complete__c){
         opp.MSP_PPM__c = mapChannelPartner.get(opp.PartnerName__c).Secondary_CDM__c;
         opp.Initial_MSP_PPM_Split_Complete__c = true;
           if(opp.id != null){
          Opportunity_PPM_Split__c oppMSPPMSplit = new Opportunity_PPM_Split__c(Opportunity__c = opp.id,Percent__c=100,PMM_Type__c = 'MSP',Team_Member__c = opp.MSP_PPM__c);
          oppPPMSplitList.add(oppMSPPMSplit);
           }
       }
       if(mapChannelPartner.get(opp.PartnerName__c).CDM__c!=null && !opp.Initial_MSP_SAM_Split_Complete__c){
         opp.SAM__c =  mapChannelPartner.get(opp.PartnerName__c).CDM__c;
         opp.Initial_MSP_SAM_Split_Complete__c = true;
        if(opp.id != null){
         Opportunity_SAM_Split2__c oppDSPSAMSplit = new Opportunity_SAM_Split2__c(Opportunity__c = opp.id,Percent__c=100,SAM_Type__c = 'MSP',Team_Member__c = opp.SAM__c,Note__c='--');
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
        if(oppList!=null && oppList.size()>0){
            Set<Id> oppIDs=new Set<Id>();
            for(Opportunity o:oppList){
                if(mapOldMap!=null && mapOldMap.containsKey(o.Id) && o.Booked_Date__c!=mapOldMap.get(o.Id).Booked_Date__c){
                    oppIDs.add(o.Id);
                }
            }
            if(oppIDs.size()>0){
                List<OpportunityLineItem> listOLI=[Select Id,OpportunityId,Opportunity.Booked_Date__c,CX911_Opportunity_Line_Item_Booked_Date__c From OpportunityLineItem Where OpportunityId=:oppIDs];
                for(OpportunityLineItem oli:listOLI){
                    oli.CX911_Opportunity_Line_Item_Booked_Date__c=oli.Opportunity.Booked_Date__c;
                }
                TriggerHandler.bypass('OpportunityTriggerHandler');
                update listOLI;
            }
        }
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
    Set<Id> oppIDSet = new Set<Id>();
    for( Opportunity opp : (List<Opportunity>)Trigger.old){
       oppIDSet.add(opp.id);
    }
    List<CameleonCPQ__Quote__c> closedProsQuoteId = [Select Id,OpportunityId__c from CameleonCPQ__Quote__c where CameleonCPQ__Quote__c.OPStatus__c = 'Complete' AND OpportunityId__c IN :oppIDSet];
    Set<Id> prosQuoteID = new  Set<Id>();
    for (CameleonCPQ__Quote__c cpq : closedProsQuoteId){
       prosQuoteID.add(cpq.id);
    }
    for( Opportunity opp : (List<Opportunity>)Trigger.old){
    	if(prosQuoteID.contains(opp.PROS_Order_Quote__c)){
        opp.addError('You cannot delete the Opportunity if Pros Quote Order Status is Complete.');
     	}
    }
 }
}