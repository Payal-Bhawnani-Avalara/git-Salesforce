trigger DG_Account_Trigger on Account (before insert, before update) {
	if(trigger.isBefore && trigger.isInsert && !DG_Account_Class.DGAccountClassBeforeInsertExecuted){
		DG_Account_Class.DGAccountClassBeforeInsertExecuted=true;
		DG_Account_Class.IdentifyAccountCluster(trigger.new , Null);
	}
	
	if(trigger.isBefore && trigger.isUpdate && !DG_Account_Class.DGAccountClassBeforeUpdateExecuted){
		DG_Account_Class.DGAccountClassBeforeUpdateExecuted=true;
		DG_Account_Class.IdentifyAccountCluster(trigger.new , trigger.oldMap);
	}
}