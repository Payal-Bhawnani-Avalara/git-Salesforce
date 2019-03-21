global class JobProcessRollup implements Database.Batchable<AggregateResult>, Schedulable, Database.Stateful {
/*CRON :JobProcessRollup m = new JobProcessRollup('Select Name,count(Id) from User group by Name limit 0',null,null,null,null,null);
        String seconds = '0'; //Execute at Zero Seconds
        String minutes = '0'; //Execute at every 0 minute of hour
        String hours = '02'; // Execute at 1 AM
        String dayOfMonth = '*'; // Execute Every Day of the Month
        String month = '*'; //Execute every Month
        String dayOfWeek = '?'; //Execute on all 7 days of the Week
        ID oppbatchprocessid = Database.executeBatch(m,200);  
        
        //Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        String sch = seconds + ' ' + minutes + ' ' + hours + ' ' + dayOfMonth + ' ' + month + ' ' + dayOfWeek;
        //String sch = '0 0 01 * * ?';
        system.schedule('JobProcessRollup Run Everyday at 2am', sch, m);  */	
	global Set<Id> setIDs;
	global Id lastParentID;
	global Id lastRollupID;
	global List<Id> realTimeIDs;
	global Id rollupId;
	global String sObjectName;
	global Rollup__c objRollup{get;set;}
	public String query {get;set;}
	public JobProcessRollup(String q,Rollup__c tempObj,Set<Id> tempsetIDs,List<Id> tempRealTimeIDs,String tempsObjectName,Id tempRollupId){
		query=q;
		objRollup=tempObj;
		realTimeIDs=tempRealTimeIDs;
		sObjectName=tempsObjectName;
		rollupId=tempRollupId;
		if(tempsetIDs!=null){
			if(setIDs==null){
				setIDs=new Set<Id>();
			}
			setIDs.addAll(tempsetIDs);
		}
	}	
    global void execute(SchedulableContext sc) {
         JobProcessRollup job = new JobProcessRollup('Select Name,count(Id) from User group by Name limit 0',null,null,null,null,null);
         ID batchprocessid = Database.executeBatch(job,100); 
    }	
    global  Iterable<AggregateResult> start(Database.BatchableContext BC) {
    //		String query='select Connector__c,count(Id) No_Closed_Won_Opps__c from Opportunity Where IsWon=true and StageName=\'Closed Won\' AND Connector__c!=null Group By Connector__c';
    		//string query='select id from opportunity';
    		//System.debug('query==='+query);
        //return Database.getQueryLocator(query);
        //return new AggregateResultIterable(query);
        lastParentID=null;
        lastRollupID=null;
    		System.debug('query==='+query);
        return new AggregateResultIterable(query);      
    }
    global void execute(Database.BatchableContext BC, List<sObject> objARList) {
    		if(objARList!=null && objARList.size()>0 && objRollup!=null){
    			List<sObject> listSObject=new List<sObject>();
    			for(sObject obj:objARList){
    				AggregateResult ar=(AggregateResult) obj;
				sObject sObj;
				Type sObjType=Type.forName(objRollup.Object_API_Name__c);
				if (null!=sObjType)
				{
				    sObj= (sObject) sObjType.newInstance();
				    sObj.put('Id',ar.get(objRollup.Relationship_Id_Field__c));
				    sObj.put(objRollup.Destination_Field_API_Name__c,ar.get(objRollup.Aggregate_Field_Alias__c));
				    listSObject.add(sObj);    
				}    				
    			}
                //TriggerHandler.bypass('OpportunityTriggerHandler');
                Database.SaveResult[] dsrList=Database.update(listSObject,false);
                Utility.createApexLog('JobProcessRollup '+objRollup.Id, dsrList,true);    			
    			//Database.update(listSObject,false);
    			System.debug('objRollup.Has_Limit__c===='+objRollup.Has_Limit__c);
    			System.debug('objRollup.Limit__c===='+objRollup.Limit__c);
    			System.debug('listSObject.size()===='+listSObject.size());
    			if(objRollup.Has_Limit__c && objRollup.Limit__c>0 && listSObject.size()==objRollup.Limit__c && (realTimeIDs==null || realTimeIDs.size()==0 )){
    				lastParentID=listSObject[0].Id;
    				lastRollupID=objRollup.Id;
    			}
    		}
    }    
    global void finish(Database.BatchableContext BC) { 
    		System.debug('lastParentID===='+lastParentID);
    		System.debug('lastRollupID===='+lastRollupID);
    		Set<Id> tempIds=new Set<Id>();
    		if(setIDs!=null){
    			tempIds.addAll(setIDs);
    		}
    		else
    		{
    			setIDs=new Set<Id>();
    		}
    		String query1='Select Id,Object_API_Name__c,Relationship_Id_Field__c,Destination_Field_API_Name__c,Aggregate_Field_Alias__c,Batch_Size__c,SOQL_Query__c,	Has_Limit__c,Limit__c,Child_Object_API_Name__c From Rollup__c Where Active__c=true ';
    		if(realTimeIDs!=null && realTimeIDs.size()>0 && rollupId!=null){
    			query1+=' AND Id=:rollupId';
    		}
    		else if(realTimeIDs==null){
    			query1+=' AND (Id!=:tempIds OR Id=:lastRollupID) limit 1';
    		}
    		else{
    			query1+=' limit 0';
    		}
    		//Select Id,Object_API_Name__c,Relationship_Id_Field__c,Destination_Field_API_Name__c,Aggregate_Field_Alias__c,Batch_Size__c,SOQL_Query__c,	Has_Limit__c,Limit__c,Child_Object_API_Name__c 
		//		    		from Rollup__c 
		//		    		Where Active__c=true AND (Id!=:tempIds OR Id=:lastRollupID) limit 1
    		for(Rollup__c o:Database.query(query1)){
    			if(!tempIds.contains(o.Id) || o.Id==lastRollupID){
	    			tempIds.add(o.Id);
	    			setIDs.addAll(tempIds);
	    			String query=o.SOQL_Query__c;
	    			if(realTimeIDs==null && o.Has_Limit__c && o.Limit__c>0){
	    				if(lastParentID!=null){
	    					query+=' Having '+o.Relationship_Id_Field__c+'>\''+lastParentID+'\'';
	    				}
	    				query+=' Order by '+o.Relationship_Id_Field__c;
	    				query +=' LIMIT '+o.Limit__c;
	    			}
	    			else if(realTimeIDs!=null && realTimeIDs.size()>0 && sObjectName==o.Child_Object_API_Name__c){
	    				List<String> listS=new List<String>();
	    				for(String s:realTimeIDs){
	    					listS.add('\''+s+'\'');
	    				}
	    				query+=' Having '+o.Relationship_Id_Field__c+' IN ('+String.join(listS,',')+')';
	    			}
	    			System.debug('query11========='+query);
		         JobProcessRollup job = new JobProcessRollup(query,o,setIDs,realTimeIDs,sObjectName,null);
		         ID batchprocessid = Database.executeBatch(job,Integer.valueOf(o.Batch_Size__c)); 
    			}    			
    		} 
    		system.debug('setIDs===='+setIDs);
	}    	
    public static void runJobNow(){
         JobProcessRollup job = new JobProcessRollup('Select Name,count(Id) from User group by Name limit 0',null,null,null,null,null);
         ID batchprocessid = Database.executeBatch(job,100); 			
    }    
}