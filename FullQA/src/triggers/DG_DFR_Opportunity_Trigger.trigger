trigger DG_DFR_Opportunity_Trigger on Opportunity (after insert, after update) {
    Boolean Disable_DFR = false;
    
    try{
        if(System.Label.Disable_DFR == '1'){
            Disable_DFR = true;
        }
    }catch(exception e){}
    
    if(!Disable_DFR){
        if(trigger.isInsert && trigger.isAfter){
            DG_DFR_Class.OpportunityContactSourceChange(trigger.new, Null);
        } 
        
        if(trigger.isUpdate && trigger.isAfter){
            if(DG_DFR_Class.AddChangeContactSource_FirstRun || test.isRunningTest()){           
                DG_DFR_Class.OpportunityContactSourceChange(trigger.new, trigger.oldMap);
                DG_DFR_Class.AddChangeContactSource_FirstRun=false; 
            }       
            
            DG_DFR_Class.DFR_OpportunityClosed(trigger.new, trigger.oldMap);
            DG_DFR_Class.DFR_OpportunityReOpen(trigger.new, trigger.oldMap);
            
        }
    }
}