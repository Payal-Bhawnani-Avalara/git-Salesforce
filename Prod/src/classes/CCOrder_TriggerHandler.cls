/**  
 * Name        : CCOrder_TriggerHandler     
 * Author      : RAJA SEKHAR CHALLARI
 * Created Date: APR/24/2017
 * Description : This is a handler for CCOrder_Trigger which is to create an Opportunity and ProsQuote when an order is created in CCOrder Object in CloudCraze Application.
 **/
public class CCOrder_TriggerHandler extends TriggerHandler {
    
   /* public override void afterInsert(){
     // To store the list of opportunity andpros quote that will be inserted at the end
     List<opportunity> oppList = new List<opportunity>();
     List<CameleonCPQ__Quote__c> prosQuoteList=new List<CameleonCPQ__Quote__c>();
     // Iterate over newly created orders to create associated opportunity and PRO's Quote 
     Set<Id> campaignIDs=new Set<Id>();
     for(ccrz__E_Order__c ccOrder : (List<ccrz__E_Order__c>)Trigger.new){
     	campaignIDs.add(ccOrder.Lead_CampaignId__c);
     }
     Map<Id,Campaign> mapCartCampaigns=new Map<Id,Campaign>([Select Id From Campaign Where Id=:campaignIDs]); 
     for(ccrz__E_Order__c ccOrder : (List<ccrz__E_Order__c>)Trigger.new)
     {
      opportunity opp = new opportunity();
      // populating fields of opportunity from ccorder
      opp.name = ccOrder.Opportunity_Name__c;
      opp.RecordTypeID = ccOrder.Opportunity_RecordTypeID__c;
      opp.Type = ccOrder.Opportunity_Type__c;
      opp.SubType__c = ccOrder.Opportunity_SubType__c;
      opp.LeadSource = ccOrder.Opportunity_Lead_Source__c;
      opp.StageName = ccOrder.Opportunity_Stage__c;	
      opp.CloseDate = ccOrder.ccrz__OrderDate__c;
      opp.Amount = ccOrder.ccrz__SubtotalAmount__c;
      opp.AccountId=ccOrder.ccrz__Account__c;
      opp.CurrencyIsoCode = ccOrder.ccrz__CurrencyISOCode__c;
      opp.CC_Order__c=ccOrder.Id;
      // opp.ForecastCategory = ccOrder.Forecast_Category__c;
      opp.PartnerName__c = ccOrder.Opportunity_Partner_ID__c;
      // opportunity population end here
      if(String.isNotBlank(ccOrder.Lead_CampaignId__c) && mapCartCampaigns.containsKey(ccOrder.Lead_CampaignId__c)){
      	opp.CampaignId=ccOrder.Lead_CampaignId__c;
      }
      oppList.add(opp);
     }
     if(oppList.size()>0)
        insert oppList;
     // ProsQuote Population Starts Here.
     for(opportunity opt: oppList)
     {
      ccrz__E_Order__c ccOrder=(ccrz__E_Order__c)Trigger.newMap.get(opt.CC_Order__c);
      if(opt.name == ccOrder.Opportunity_Name__c)
      {
       CameleonCPQ__Quote__c prosQuote= new CameleonCPQ__Quote__c();
       prosQuote.Name	= ccOrder.Opportunity_Name__c ;
       prosQuote.RecordTypeId = ccOrder.PROS_Quote_RecordTypeID__c;
       prosQuote.CameleonCPQ__AccountId__c = ccOrder.ccrz__Account__c ;
       // Sourced from Resulting Opportunity in Creation workflow
       prosQuote.OpportunityId__c = opt.id; 
       prosQuote.CameleonCPQ__AccountId__c=ccOrder.ccrz__Account__c;
       prosQuote.BillToContact__c = ccOrder.ccrz__Contact__c;
       prosQuote.ShipToContact__c = ccOrder.ccrz__Contact__c;
       prosQuote.ProvisioningContact__c = ccOrder.ccrz__Contact__c;
       prosQuote.PaymentMethod__c = ccOrder.ccrz__PaymentMethod__c;
       // ReadyForZuora__c	N/A	"TRUE"
       prosQuote.ReadyForZuora__c = TRUE ;
       prosQuote.ContractEffectiveDate__c = ccOrder.ccrz__OrderDate__c;
       prosQuote.CustomerAcceptanceDate__c = ccOrder.ccrz__OrderDate__c;
       prosQuote.ServiceActivationDate__c = ccOrder.ccrz__OrderDate__c;
       prosQuote.InitialTerm__c  = ccOrder.PROS_Quote_Initial_Term__c;
       prosQuote.RenewalTerm__c = ccOrder.PROS_Quote_Renewal_Term__c;
       // prosQuote.PaymentTerm__c = ccOrder.PROS_Quote_Payment_Term__c; formula field
       prosQuote.PaymentMethodId__c = ccOrder.PROS_Quote_Payment_Token__c;
       prosQuoteList.add(prosQuote);
      }
     }
     if(prosQuoteList.size()>0)
        insert prosQuoteList;
     }*/
}