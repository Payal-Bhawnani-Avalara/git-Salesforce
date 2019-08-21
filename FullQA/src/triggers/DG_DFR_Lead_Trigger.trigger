trigger DG_DFR_Lead_Trigger on Lead (after insert, after update, before insert, before update) {
    Boolean Disable_DFR = false;
    
    if(Trigger.isUpdate && trigger.isAfter){
        DG_DFR_Class.LeadConversionLeadToContactMapping(trigger.new,trigger.oldMap);
    }   
    
    try{
        if(System.Label.Disable_DFR == '1'){
            Disable_DFR = true;
        }
    }catch(exception e){}
    
    if(!Disable_DFR){
        if(trigger.isBefore && trigger.isInsert){
            //DG_DFR_Class.DFR_LeadRatingChange(trigger.new , Null);
        }
        
        if(trigger.isBefore && trigger.isUpdate){
            DG_DFR_Class.DFR_LeadPopulateRecyledRejectedDate(trigger.new , trigger.oldMap);
            //DG_DFR_Class.DFR_LeadRatingChange(trigger.new , trigger.oldMap);
        }
        
        if(trigger.isInsert && trigger.isAfter){
            DG_DFR_Class.CreateLeadDFR(Trigger.new);        
        }   
         
        if(Trigger.isUpdate && trigger.isAfter){
            if(DG_DFR_Class.LeadAfterUpdate_FirstRun || test.isRunningTest()){              
                DG_DFR_Class.DFR_LeadStatusChange(trigger.new,trigger.oldMap);  
                DG_DFR_Class.LeadAfterUpdate_FirstRun=false;
            }   
            
            if(DG_DFR_Class.OppCreationFromLead_FirstRun || test.isRunningTest()){              
                DG_DFR_Class.DFR_OppCreationFromLead(trigger.new,trigger.oldMap);                       
                DG_DFR_Class.OppCreationFromLead_FirstRun=false;
            }   
        }
    }
}