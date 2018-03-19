/**  
 * Name        : CCOrderItem_TriggerHandler         
 * Author      : RAJA SEKHAR CHALLARI
 * Created Date: APR/24/2017
 * Description : This handler is for CCOrderItem_Trigger is to create an Opportunity Line Item when an order item in order is created in CCOrder Item Object in Cloudcraze.
 **/
public class CCOrderItem_TriggerHandler  extends TriggerHandler{
	public override void beforeInsert(){
        for(ccrz__E_OrderItem__c ccOrderItem : (List<ccrz__E_OrderItem__c>)Trigger.new){
        		if(String.isNotBlank(ccOrderItem.ccrz__Product_Name__c) && ccOrderItem.ccrz__Product_Name__c.equalsIgnoreCase('Avalara BigCommerce Returns')){
				//ccOrderItem.ccrz_Subscription_Frequency__c = 'Annual';
				ccOrderItem.Opportunity_LI_Item_Type__c = 'Recurring';
				ccOrderItem.Opportunity_LI_Model__c = 'Volume Pricing';
				ccOrderItem.Opportunity_LI_Rate_Plan_ID__c = '2c92a0f94d98ec20014db6c3f49233c7';
				ccOrderItem.Opportunity_LI_Rate_Plan_Charge_ID__c = '2c92a0fb4d98f901014db6c3f61b3e37';
				ccOrderItem.Opportunity_LI_Rate_Plan_Charge_Tier_ID__c = '2c92a0fb4d98f901014db6c3f61f3e39';        			
        		}
        }
	}
	public override void afterInsert(){
    	List<opportunityLineItem> oppLineItemList = new List<opportunityLineItem>();
        Set<ID> orderIDSet=new Set<ID>();
        for(ccrz__E_OrderItem__c ccOrderItem : (List<ccrz__E_OrderItem__c>)Trigger.new){
        	orderIDSet.add(ccOrderItem.ccrz__Order__c); 
        }
        List<opportunity> oppList=[select Id, CC_Order__c from opportunity where CC_Order__c IN :orderIDSet];
        for(ccrz__E_OrderItem__c ccOrderItem : (List<ccrz__E_OrderItem__c>)Trigger.new){
        	for(opportunity opp: oppList){
            	if(ccOrderItem.ccrz__Order__c==opp.CC_Order__c){
               		opportunityLineItem oppLineItem= new opportunityLineItem();
                    //opportunity line item fields to be populated here
                    oppLineItem.OpportunityId=opp.ID;
                    oppLineItem.PriceBookEntryID='01u3300001xhj3m';
                    oppLineItem.CPQ_Quantity__c=ccOrderItem.ccrz__Quantity__c;
                    oppLineItem.Quantity=1;
                    opplineItem.Description=ccOrderItem.ccrz__Product_Name__c;
                    //oppLineItem.Pass_Quantity__c=TRUE;
                    oppLineItem.ConnectorID__c=ccOrderItem.Connector_ID__c;
                    oppLineItem.EffectivePrice__c=ccOrderItem.ccrz__Price__c;
                    oppLineItem.ItemType__c=ccOrderItem.Opportunity_LI_Item_Type__c;
                    oppLineItem.Model__c=ccOrderItem.Opportunity_LI_Model__c;
                    oppLineItem.ListPrice__c=ccOrderItem.ccrz__OriginalItemPrice__c;
                    oppLineItem.PRPCId__c=ccOrderItem.Opportunity_LI_Rate_Plan_Charge_ID__c;
                    oppLineItem.PRPId__c=ccOrderItem.Opportunity_LI_Rate_Plan_ID__c;
                    oppLineItem.RPTCId__c=ccOrderItem.Opportunity_LI_Rate_Plan_Charge_Tier_ID__c;
                    oppLineItem.TotalPrice__c=ccOrderItem.ccrz__SubAmount__c;
                    oppLineItem.ProductFamily__c=ccOrderItem.ccrz__ProductType__c;
                    if(String.isNotBlank(opplineItem.Description) && opplineItem.Description.containsIgnoreCase('Pre-Pay Returns')){
                    		oppLineItem.BillingFrequency__c='Annual';
                    		oppLineItem.PriceFormat__c='Per Unit';
                    }
                    else{
						oppLineItem.BillingFrequency__c=ccOrderItem.Subscription_Term__c;
                    }
                    oppLineItem.UnitPrice=0;
                    oppLineItemList.add(oppLineItem);
                }
            }
        }
        if(oppLineItemList.size()>0)
            insert oppLineItemList;
    }
}