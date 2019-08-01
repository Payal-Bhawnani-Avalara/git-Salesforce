/**
 * When FULLQA refreshes, there is a group of users who are in FULLQA, but not PROD.
 * This group of people are now in prod, but inactive. 
 * This class will update those users to active in FULLQA
 */

public with sharing class UpdateCUPDevsBatchable implements Database.Batchable<SObject> {
    public Database.QueryLocator start( Database.BatchableContext context ) {
        String query = 'select id FROM User where Profile.Name = \'Ava2 Developer\' and Manager.Name = \'Von Taylor\' and IsActive = false';
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
          u.IsActive = true; 
        }
        update users;
      }
    }

    public void finish( Database.BatchableContext context ) {   
     AsyncApexJob a = [Select Id from AsyncApexJob where Id = :context.getJobId()];  
       system.abortJob(a.id);
    }
}