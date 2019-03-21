/**
 * When sandboxes refresh, all users' email addresses have @example.com appended to them.
 * This is a safety feature to prevent unexpected or unwanted emails to be sent from sandbox to users.
 * This class reverts all active users' email addresses by removing the @example.com.
 * https://help.salesforce.com/HTViewSolution?id=000193090&language=en_US
 */
public with sharing class RevertUserEmailsBatchable implements Database.Batchable<SObject> {

   
    public Database.QueryLocator start( Database.BatchableContext context ) {
       
        String query = 'SELECT id,Profileid,email FROM User WHERE isActive = true AND IsSandboxUser__c=true';
        
        Boolean sandbox;
        for(Organization o:[Select isSandbox from Organization limit 1]){
            sandbox = o.isSandbox;
        }
        
        if(sandbox == TRUE){
        	return Database.getQueryLocator(query);
        } else if (Test.isRunningTest()){
        	return Database.getQueryLocator(query + ' limit 1');	    
        } else {
            return Database.getQueryLocator(query + ' limit 0');
        }
    }

    public void execute( Database.BatchableContext context, List<User> users ) {
      if(users!=null && users.size()>0){
        for ( User u : users ) {
        	  u.Email = u.Email.replace('=','@'); 
          //to remove appended domain 
          String addedPhrase = '@example.com'; 
          u.Email = u.Email.remove(addedPhrase); 
          System.debug( 'user sandbox email: ' + u.email );
          //u.email = u.email.replace('@example.com', '').replace('=', '@');
          // u.profileId.IsSsoEnabled = false;
          System.debug( 'user reverted email: ' + u.email );
        }
        update users;
      }
    }

    public void finish( Database.BatchableContext context ) {   
     AsyncApexJob a = [Select Id from AsyncApexJob where Id = :context.getJobId()];  
       system.abortJob(a.id);
    }
}