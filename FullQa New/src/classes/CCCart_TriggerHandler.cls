/**  
 * Name        : CCCart_TriggerHandler     
 * Author      : RAJA SEKHAR CHALLARI
 * Created Date: MAY/22/2017
 * Description : This a trigger handler class for CCCart_Trigger whic is to create a lead when CCCart populates without payment token( payment method) and with buyer email.
 **/
public class CCCart_TriggerHandler extends TriggerHandler {

    /*public override void afterInsert(){
       //leadCreationForIncompleteCart(); 
       handleAfterInsertUpdate();
    }
    public override void afterUpdate(){
        //leadCreationForIncompleteCart();
        handleAfterInsertUpdate();
    }
    public void handleAfterInsertUpdate(){
    		Set<String> campaignIDs=new Set<String>();
    		Set<String> cartContactIDs=new Set<String>();
        for(ccrz__E_Cart__c ccCart : (List<ccrz__E_Cart__c>)Trigger.new){
          campaignIDs.add(ccCart.Lead_CampaignId__c);
          cartContactIDs.add(ccCart.ccrz__Contact__c);
        }
        Map<Id,Campaign> mapCartCampaigns=new Map<Id,Campaign>([Select Id From Campaign Where Id=:campaignIDs]);   
        Map<Id,Contact> mapCartContacts=new Map<Id,Contact>([Select Id From Contact Where Id=:cartContactIDs]);   
        List<CampaignMember> listCampaignMembers=new List<CampaignMember>(); 
        	
        for(ccrz__E_Cart__c ccCart : (List<ccrz__E_Cart__c>)Trigger.new){
          if(String.isNotBlank(ccCart.Lead_CampaignId__c) && mapCartCampaigns.containsKey(ccCart.Lead_CampaignId__c) && 
           String.isNotBlank(ccCart.ccrz__Contact__c) && mapCartContacts.containsKey(ccCart.ccrz__Contact__c)){
          	listCampaignMembers.add(new CampaignMember(CampaignId=ccCart.Lead_CampaignId__c, ContactId= ccCart.ccrz__Contact__c, Status='Responded'));
          }
        }
        if(listCampaignMembers!=null && listCampaignMembers.size()>0){
        		Database.upsert(listCampaignMembers,false);
        }        
    }
   /* public void leadCreationForIncompleteCart(){
        
        //Variables definitions
        Set<String> buyerEmails=new Set<String>();
        Set<String> leadPresenceByEmail=new Set<String>();
        List<Lead> leadRecords=new List<Lead>();
		Map<Id,ccrz__E_Cart__c> newCartMap=(Map<Id,ccrz__E_Cart__c>)Trigger.newMap;
 		List<campaignMember> cMemberList= new List<campaignMember>();
        
        //To fetc all the buyer emails from carts where payment method is not populated
        for(ccrz__E_Cart__c ccCart : (List<ccrz__E_Cart__c>)Trigger.new){
            if(String.isEmpty(ccCart.ccrz__PaymentMethod__c) && String.isNotEmpty(ccCart.ccrz__BuyerEmail__c) ){
              buyerEmails.add(ccCart.ccrz__BuyerEmail__c); 
            }
        } 
        if(buyerEmails.size()>0){
            //To fetch all the emails for which lead is already present
            for(Lead leadRecord : [Select Id, Email from lead where Email IN: buyerEmails]){
                leadPresenceByEmail.add(leadRecord.email);
            }
            
            // Create leads for all the cart for which lead is not present
          	for(ccrz__E_Cart__c ccCart : (List<ccrz__E_Cart__c>)Trigger.new){
            	if(buyerEmails.contains(ccCart.ccrz__BuyerEmail__c) && !leadPresenceByEmail.contains(ccCart.ccrz__BuyerEmail__c)){
                    Lead newLead=new Lead(); 
                    //add all the cart values to lead instance
                    newLead.LastName = ccCart.ccrz__BuyerLastName__c;
                    newLead.FirstName = ccCart.ccrz__BuyerFirstName__c;
                    newLead.Company = ccCart.ccrz__BuyerCompanyName__c;	
                    newLead.Email =  ccCart.ccrz__BuyerEmail__c;
                    newLead.Status = ccCart.LeadStatus__c;
                    newLead.OpportunitySubType__c = ccCart.Opportunity_SubType__c;
                    //newLead.CampaignId = ccCart.Campaign__c;
                    newLead.Lead_Source_Most_Recent__c = ccCart.Lead_Source_Most_Recent__c;
                    newLead.Web_Property__c = ccCart.Web_Property__c;
                    newLead.Interest_in_Products_Services__c = ccCart.Interest_in_Products_Services__c;
                    newLead.Offer__c = ccCart.Offer__c;
                    newLead.Method_of_Contact_Lead__c = ccCart.MethodofContact__c;
                    newLead.CC_Cart__c = ccCart.Id;
                    
                    //add lead to list of leads
                    leadRecords.add(newLead);
                }
          	}
            if(leadRecords.size()>0){
                insert leadRecords;
				for(Lead leadRec:leadRecords){
					if(String.IsNotEmpty(newCartMap.get(leadRec.CC_Cart__c).Campaign__c)){
                        campaignMember cMember=new campaignMember();
                        cMember.CampaignId=newCartMap.get(leadRec.CC_Cart__c).Campaign__c;
                        cMember.LeadId=leadRec.Id;
                        //cMember.status='Pending';
                        cMemberList.add(cMember);
					}
				}
				if(cMemberList.size()>0){
					insert cMemberList;
				}
            }
        }
    }*/
}