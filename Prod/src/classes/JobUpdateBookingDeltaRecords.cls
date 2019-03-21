/*CRON :JobUpdateBookingDeltaRecords m = new JobUpdateBookingDeltaRecords();
        String seconds = '0'; //Execute at Zero Seconds
        String minutes = '5'; //Execute at every 0 minute of hour
        String hours = '8,9,10,11,12,13,14,15,16,17,20,2,5'; // Execute at 1 AM
        String dayOfMonth = '*'; // Execute Every Day of the Month
        String month = '*'; //Execute every Month
        String dayOfWeek = '?'; //Execute on all 7 days of the Week
        //ID oppbatchprocessid = Database.executeBatch(m,200);  
        
        //Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        String sch = seconds + ' ' + minutes + ' ' + hours + ' ' + dayOfMonth + ' ' + month + ' ' + dayOfWeek;
        //String sch = '0 0 01 * * ?';
        system.schedule('JobUpdateBookingDeltaRecords Run Everyday at 8,12,16,1', sch, m);  */
global class JobUpdateBookingDeltaRecords implements Database.Batchable<sObject>, Schedulable, Database.Stateful, Database.AllowsCallouts {
    global void execute(SchedulableContext sc) {
         JobUpdateBookingDeltaRecords job = new JobUpdateBookingDeltaRecords();
         ID batchprocessid = Database.executeBatch(job,99); 
    }
    global Database.QueryLocator start(Database.BatchableContext BC) {
    		String query='Select Id from BookingsDelta__c where Opportunity__r.JIRATicketURL__c!=null AND Booking_Issue_Resolved_Date__c=null';
        return Database.getQueryLocator(query);
    }
  
    global void execute(Database.BatchableContext BC, List<BookingsDelta__c> objList) {
    		if(objList!=null && objList.size()>0){
   			objList=[Select Id,Booking_Issue_Resolved_By__c,Booking_Issue_Resolved_Date__c,Bookings_Root_Cause__c,Opportunity__c,Notes__c,Opportunity__r.JIRATicketURL__c 
    					From BookingsDelta__c where Opportunity__r.JIRATicketURL__c!=null AND Booking_Issue_Resolved_Date__c=null AND Id=:objList];
    			if(objList!=null && objList.size()>0){
    				for(BookingsDelta__c b:objList){
    					try{
					String ticketNumber=b.Opportunity__r.JIRATicketURL__c.substring(b.Opportunity__r.JIRATicketURL__c.indexOf('IBST'));		
				   APIJiraTicket obj=APIJira.getJiraTicket(ticketNumber);
				   b.Bookings_Root_Cause__c='';
				   List<String> rootCauses=new List<String>();
					if(obj!=null && String.isBlank(APIJira.ErrorMessage) && obj.fields!=null){
						if(obj.fields.issueLinks!=null && obj.fields.issueLinks.size()>0){
							for(APIJiraTicket.cls_issuelinks c:obj.fields.issueLinks){
								if(c.inwardIssue!=null && c.inwardIssue.fields!=null && String.isNotBlank(c.inwardIssue.fields.summary)){
							    		rootCauses.add(c.inwardIssue.fields.summary);
								}
							}							
						}
						b.Bookings_Root_Cause__c=String.join(rootCauses,',');
						if(obj.fields.assignee!=null && String.isNotBlank(obj.fields.assignee.displayName)){
							b.Booking_Issue_Resolved_By__c=obj.fields.assignee.displayName;
						}
						if(String.isNotBlank(obj.fields.resolutiondate)){
							Date resolutionDate;
							try{
								String s=obj.fields.resolutiondate;
								s=s.substring(0,s.indexof('T'));
								List<String> dt=s.split('-');
								resolutionDate=Date.newinstance(Integer.valueOf(dt[0]),Integer.valueOf(dt[1]),Integer.valueOf(dt[2]));								
							}
							catch(Exception ex){}
							b.Booking_Issue_Resolved_Date__c=resolutionDate;
						}
						if(obj.fields.comment!=null && obj.fields.comment.comments!=null && obj.fields.comment.comments.size()>0){
							b.Notes__c=obj.fields.comment.comments[obj.fields.comment.comments.size()-1].body;
						}
					}
					else{
						b.Notes__c=APIJira.ErrorMessage;
					}
    				}
    				catch(Exception ex){
    					b.Notes__c=ex.getMessage();
    					System.debug('ex.getMessage();====='+ex.getMessage());
					}
    				}
				update objList;
    			}    			
    		}
    }
    global void finish(Database.BatchableContext BC) { 
        
    }        
}