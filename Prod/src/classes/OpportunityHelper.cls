public class OpportunityHelper {
      public static void updateMKscoreOpp(Opportunity opp,Contact con){
       if(con.mk_customer_fit_avatax_score__c != null && 
		   	 	      (opp.MK_Customer_Fit_Score_AvaTax__C ==null || 
		   	 	      (opp.MK_Customer_Fit_Score_AvaTax__C !=null && opp.MK_Customer_Fit_Score_AvaTax__C != con.mk_customer_fit_avatax_score__c))){
	                      //System.debug('opp.MK_Customer_Fit_Score_AvaTax__>>>C'+con.get(ocr.contactId).mk_customer_fit_avatax_score__c );
	                      System.debug('opp.MK_Customer_Fit_Score_AvaTax__>>>C'+ opp.MK_Customer_Fit_Score_AvaTax__C );
	                      opp.MK_Customer_Fit_Score_AvaTax__C =  con.mk_customer_fit_avatax_score__c;
	                      System.debug('opp.MK_Customer_Fit_Score_AvaTax__>>>C'+con.mk_customer_fit_avatax_score__c );
                    }
                    
                   if(con.MK_Customer_Fit_Score_CC__c !=null && 
                     (opp.MK_Customer_Fit_Score_CC__c ==null || 
                     (opp.MK_Customer_Fit_Score_CC__c !=null && opp.MK_Customer_Fit_Score_CC__c != con.MK_Customer_Fit_Score_CC__c))){
                      opp.MK_Customer_Fit_Score_CC__c =  con.MK_Customer_Fit_Score_CC__c;
                     }
                    if(con.MK_Customer_Fit_Score_Comms__c != null &&
                      (opp.MK_Customer_Fit_Score_Comms__c == null
                      || (opp.MK_Customer_Fit_Score_Comms__c !=null && opp.MK_Customer_Fit_Score_Comms__c != con.MK_Customer_Fit_Score_Comms__c))){
                       opp.MK_Customer_Fit_Score_Comms__c =  con.MK_Customer_Fit_Score_Comms__c;
                    }
                    if(con.mk_lead_avatax_score__c != null &&
                       (opp.MK_Lead_Score_AvaTax__c ==null || 
                       (opp.MK_Lead_Score_AvaTax__c !=null && opp.MK_Lead_Score_AvaTax__c != con.mk_lead_avatax_score__c))){
                       opp.MK_Lead_Score_AvaTax__c =  con.mk_lead_avatax_score__c;
                    }
                    if(con.MK_Lead_Score_CC__c != null &&
                      (opp.MK_Lead_Score_CC__c ==null || 
                      (opp.MK_Lead_Score_CC__c != null && opp.MK_Lead_Score_CC__c != con.MK_Lead_Score_CC__c))){
                      opp.MK_Lead_Score_CC__c =  con.MK_Lead_Score_CC__c;
                    }
                    if(con.MK_Lead_Score_Comms__c != null && 
                     (opp.MK_Lead_Score_Comms__c ==null || 
                     (opp.MK_Lead_Score_Comms__c!= null && opp.MK_Lead_Score_Comms__c != con.MK_Lead_Score_Comms__c))){
                      opp.MK_Lead_Score_Comms__c =  con.MK_Lead_Score_Comms__c;
                    }  
      }
}