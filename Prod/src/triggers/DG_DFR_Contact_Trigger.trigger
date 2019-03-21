trigger DG_DFR_Contact_Trigger on Contact (after insert, after update, before insert, before update) {
	Boolean Disable_DFR = false;
	
	try{
		if(System.Label.Disable_DFR == '1'){
			Disable_DFR = true;
		}
	}catch(exception e){}
	
	if(!Disable_DFR){	
		if(trigger.isBefore && trigger.isUpdate){
			DG_DFR_Class.DFR_ContactPopulateRecyledRejectedDate(trigger.new , trigger.oldMap);
			//DG_DFR_Class.DFR_ContactRatingChange(trigger.new , trigger.oldMap);
		}
		
		if(Trigger.isUpdate && trigger.isAfter){
	  		if(DG_DFR_Class.ContactAfterUpdate_FirstRun || test.isRunningTest()){  			
				DG_DFR_Class.DFR_ContactStatusChange(trigger.new,trigger.oldMap); 	
	    		DG_DFR_Class.ContactAfterUpdate_FirstRun=false;
			}	
	  	}
	}
}