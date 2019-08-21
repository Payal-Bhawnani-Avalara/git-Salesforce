public class LiveChatTranscriptHandler extends TriggerHandler {
     protected override void beforeInsert(){
    }
    
    protected override void beforeUpdate(){
        //beforeInsertUpdate();
    }
    protected override void beforeDelete(){	
    }
    protected override void afterInsert(){
    	 Map<Id,Id> liveAgentComm = new   Map<Id,Id>();
    	 Set<Id> comAccDataId = new Set<ID>();
    	  for(LiveChatTranscript lCT : (List<LiveChatTranscript>)Trigger.new){
    	  	 System.debug('liveAgentComm 1 >>>>>'+ lCT.Communication_Activity_Data__c);
    	  	if(lCT.Communication_Activity_Data__c != null){
    	  	  comAccDataId.add(lCT.Communication_Activity_Data__c);
    	  	  liveAgentComm.put(lCT.Communication_Activity_Data__c,lCT.id);
    	  	  System.debug('liveAgentComm >>>>>'+ liveAgentComm);
    	  	}
    	  }
    	  if ( comAccDataId.size() > 0 ) {
    	  	 List<Communication_Activity_Data__c> comActListToUpdate = [Select id, Chat_Transcript__c from Communication_Activity_Data__c where id in: comAccDataId  ORDER BY
                createdDate ASC ];
             for(Communication_Activity_Data__c com: comActListToUpdate){
	              com.Chat_Transcript__c = liveAgentComm.get(com.id);
	              System.debug('com id >>>>>'+ liveAgentComm.get(com.id));
                }     
             if(comActListToUpdate.size()>0){
             	 System.debug('com id >>>>>'+ comActListToUpdate);
                 update comActListToUpdate; 
             }     
    	  }
    }
}