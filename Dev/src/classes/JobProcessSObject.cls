global class JobProcessSObject implements Database.Batchable<sObject>, Schedulable, Database.Stateful {
    global String query;
    global String oppId;
    public JobProcessSObject(String tempQuery,String tempoppId){
        query=tempQuery;
        oppId=tempoppId;
    }
    global void execute(SchedulableContext sc) {
         JobProcessSObject job = new JobProcessSObject('Select id from user limit 0',null);
         ID batchprocessid = Database.executeBatch(job,1); 
    }
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator(query);
    }
  
    global void execute(Database.BatchableContext BC, List<sObject> objList) {
        if(objList!=null && objList.size()>0){
        		String tempoppId=oppId;
			Map<Id,Account> mapA=new Map<Id,Account>([select id,(Select Id,PrimaryContact__c From Contacts order by PrimaryContact__c desc nulls last limit 1) from Account where id=:objList]);
			Opportunity o=Database.query('Select '+getSObjectFields('Opportunity')+',(Select '+getSObjectFields('OpportunityLineItem')+' From OpportunityLineItems) From Opportunity Where id=\'0060b00000n9wzr\' OR Id=:tempoppId ');
			//CameleonCPQ__Quote__c cpq=Database.query(' Select From CameleonCPQ__Quote__c Where Id=\'\' ');
			Map<Integer,Opportunity> mapO=new Map<Integer,Opportunity>();
			Integer i=1;
			for(Account a:mapA.values()){
			    Opportunity otemp=o.clone();
			    otemp.Name='IBST-18336';
			    otemp.AccountId=a.Id;
			    otemp.CloseDate=Date.today();
			    mapO.put(i,otemp);
			    i=i+1;
			}
			insert mapO.values();
			i=1;
			Map<Id,CameleonCPQ__Quote__c> mapCPQ=new Map<Id,CameleonCPQ__Quote__c>();
			List<OpportunityLineItem> mapOLI=new List<OpportunityLineItem>();
			for(Opportunity otemp:mapO.values()){
			    Account a=mapA.get(otemp.AccountId);
			    Contact c=a.Contacts[0];
			    CameleonCPQ__Quote__c cpq=new CameleonCPQ__Quote__c();
			    cpq.BillToContact__c=c.Id;
			    cpq.ProvisioningContact__c=c.Id;
			    cpq.ShipToContact__c =c.Id;
			    cpq.CameleonCPQ__AccountId__c=a.Id;
			    cpq.Name='IBST-18336';
			    cpq.OpportunityId__c =otemp.Id;
			    cpq.RecordTypeId='012330000005hdc';
			    cpq.ReadyForZuora__c =true;
			    mapCPQ.put(otemp.Id,cpq);
			    for(OpportunityLineItem oli:o.OpportunityLineItems){
			        OpportunityLineItem oliTem=oli.clone();
			        oliTem.OpportunityId=otemp.Id;
			        oliTem.TotalPrice=null;
			        mapOLI.add(oliTem);
			    }
			}
			insert mapOLI;
			insert mapCPQ.values();
			List<Opportunity> listO=new List<Opportunity>();
			for(CameleonCPQ__Quote__c cpq:mapCPQ.values()){
			    listO.add(new Opportunity(Id=cpq.OpportunityId__c,PROS_Order_Quote__c =cpq.Id));
			}
			update listO;
        }
    }  

    global void finish(Database.BatchableContext BC) { 
        
    }
    public static String getSObjectFields(String sObjectName)
    {
        String sObjectFields='';
        SObjectType objToken = Schema.getGlobalDescribe().get(sObjectName);
        DescribeSObjectResult objDef = objToken.getDescribe();
        Map<String, SObjectField> fields = objDef.fields.getMap(); 
        Set<String> fieldSet = fields.keySet();
        for(String s:fieldSet)
        {
            SObjectField fieldToken = fields.get(s);
            DescribeFieldResult selectedField = fieldToken.getDescribe();
            if(selectedField.isCreateable() && selectedField.isAccessible() && 
               !selectedField.getName().startsWith('n2de__') && 
               !selectedField.getName().startsWith('geopointe__') && 
               !selectedField.getName().startsWith('ffr__'))
            {
                //System.debug(selectedField.getName());
                if(String.isNotBlank(sObjectFields))
                {
                    sObjectFields+=',';
                }
                sObjectFields+=selectedField.getName();
            }
        }
        return sObjectFields;
    }
}