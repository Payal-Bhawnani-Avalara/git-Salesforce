global class JobCreateBookingDeltaJiraTicket implements Database.Batchable<sObject>, Schedulable, Database.Stateful, Database.AllowsCallouts {
    global List<Id> oppIDs;
    public JobCreateBookingDeltaJiraTicket(List<Id> tempoppIDs){
        oppIDs=tempoppIDs;
    }
    global void execute(SchedulableContext sc) {
         JobCreateBookingDeltaJiraTicket job = new JobCreateBookingDeltaJiraTicket(null);
         ID batchprocessid = Database.executeBatch(job,22); 
    }
    global Database.QueryLocator start(Database.BatchableContext BC) {
    		List<Id> listOppIDs=oppIDs;
    		String query='Select Id,JIRATicketURL__c,Jira_Error__c From Opportunity Where Id=:listOppIDs AND JIRATicketURL__c=null';
        return Database.getQueryLocator(query);
    }
  
    global void execute(Database.BatchableContext BC, List<Opportunity> objList) {
    		if(objList!=null && objList.size()>0){
    			List<Opportunity> listOpportunities=[Select Id,JIRATicketURL__c,Jira_Error__c,Owner.UserName,Booked_Date__c From Opportunity Where Id=:objList AND JIRATicketURL__c=null];
    			if(listOpportunities!=null && listOpportunities.size()>0){
    				Map<String,KeyPairValueMdt__mdt> mapKPV=new Map<String,KeyPairValueMdt__mdt>();
    				for(KeyPairValueMdt__mdt kpv:[SELECT Id, Label, DeveloperName,Value__c FROM KeyPairValueMdt__mdt Where DeveloperName IN ('BookingDeltaIssueJiraJSON','BookingDeltaIssueJiraCommentJSON','BookingDeltaIssueJiraCreateComment','BookingDeltaIssueJiraCreateWatcher','BookingDeltaIssueJiraAssign','BookingDeltaIssueJiraAssigneeJSON')]){
		    			mapKPV.put(kpv.DeveloperName,kpv);		
    				}
    				List<String> jiraIssuesJSON=new List<String>();
    				for(Opportunity o:listOpportunities){
    					//jiraIssuesJSON.add(mapKPV.get('BookingDeltaIssueJiraJSON').Value__c.replace('@@Opportunity__c@@',o.Id));
    					String json=mapKPV.get('BookingDeltaIssueJiraJSON').Value__c.replace('@@Opportunity__c@@',o.Id);
                        System.debug('json===='+json);
	    				String BookingDeltaIssuesJiraJSON=json;//mapKPV.get('BookingDeltaIssuesJiraJSON').Value__c.replace('@@ISSUES_JSON@@',String.join(jiraIssuesJSON,','));
	    				BookingDeltaIssuesJiraJSON=BookingDeltaIssuesJiraJSON.replace('@@SALESFORCE_URL@@',System.Url.getSalesforceBaseUrl().toExternalForm());
	    				System.debug('BookingDeltaIssuesJiraJSON===='+BookingDeltaIssuesJiraJSON.replace(' ',''));
                        if(o.Booked_Date__c != null){
                        	BookingDeltaIssuesJiraJSON=BookingDeltaIssuesJiraJSON.replace('@@BookedDate@@',o.Booked_Date__c.year()+'-'+o.Booked_Date__c.month()+'-'+o.Booked_Date__c.day());
                        }
	    				APIJira.createJiraTicket(BookingDeltaIssuesJiraJSON,''); 
	    				System.debug('APIJira.ErrorMessage===='+APIJira.ErrorMessage);
	    				System.debug('APIJira.responseObj===='+APIJira.responseObj);    	
	    				if(String.isNotBlank(APIJira.ErrorMessage)){
	    					o.Jira_Error__c=APIJira.ErrorMessage;
	    				}	
	    				else if(APIJira.responseObj!=null && String.isNotBlank(APIJira.responseObj.key)){
	    					o.JIRATicketURL__c='https://jira.avalara.com/browse/'+APIJira.responseObj.key;
	    					o.Jira_Error__c='';
	    					String owner=o.Owner.UserName;
	    					owner=owner.substring(0,owner.indexOf('@'));
	    					if(mapKPV.get('BookingDeltaIssueJiraAssign')!=null && mapKPV.get('BookingDeltaIssueJiraAssign').Value__c=='TRUE'){
		    					try{
		    						String bodyData=mapKPV.get('BookingDeltaIssueJiraAssigneeJSON').Value__c;
		    						APIJira.updateJiraTicket('rest/api/2/issue/'+APIJira.responseObj.key+'/assignee',bodyData,'PUT');
		    					}
		    					catch(Exception ex){o.Jira_Error__c=ex.getMessage();}
	    					}	    					
	    					if(mapKPV.get('BookingDeltaIssueJiraCreateWatcher')!=null && mapKPV.get('BookingDeltaIssueJiraCreateWatcher').Value__c=='TRUE'){
		    					try{
		    						String bodyData='"'+owner+'"';
		    						APIJira.updateJiraTicket('rest/api/2/issue/'+APIJira.responseObj.key+'/watchers',bodyData,null);
		    					}
		    					catch(Exception ex){o.Jira_Error__c=ex.getMessage();}
	    					}
	    					if(mapKPV.get('BookingDeltaIssueJiraCreateComment')!=null && mapKPV.get('BookingDeltaIssueJiraCreateComment').Value__c=='TRUE'){
		    					try{
								String bodyData=mapKPV.get('BookingDeltaIssueJiraCommentJSON').Value__c;
								bodyData=bodyData.replace('@@OpportunityOwner@@',owner);

								bodyData=bodyData.replace('@@OpportunityURL@@',System.Url.getSalesforceBaseUrl().toExternalForm()+'/'+o.Id);
								System.debug('bodyData===='+bodyData);
								APIJira.updateJiraTicket('rest/api/2/issue/'+APIJira.responseObj.key+'/comment',bodyData,null);
		    					}
		    					catch(Exception ex){o.Jira_Error__c=ex.getMessage();}	    		
	    					}			
	    				}			
    				}
				update listOpportunities;
    			}    			
    		}
    }
    global void finish(Database.BatchableContext BC) { 
        
    }        
}