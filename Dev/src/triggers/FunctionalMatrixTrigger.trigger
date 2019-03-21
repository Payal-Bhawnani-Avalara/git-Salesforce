trigger FunctionalMatrixTrigger on Functional_Matrix__c (before insert, after insert, after update) {
	if(!FunctionalMatrixHandler.doNotExecuteTrigger){
	    if(Trigger.isBefore){
	        FunctionalMatrixHandler.enforceSingleFM(Trigger.new);
	    }
	    if(Trigger.isAfter &&  Trigger.isInsert){
	        FunctionalMatrixRequirementHandler.process(Trigger.new);
	    }
	    if(Trigger.isAfter){
	        FunctionalMatrixToBadge.processBadge(Trigger.newMap, Trigger.oldMap);
	        if(Trigger.isUpdate) FunctionalMatrixHandler.syncToConnectorKB(Trigger.newMap, Trigger.oldMap);
	    }
	}
}