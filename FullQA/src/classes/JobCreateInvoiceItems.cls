global class JobCreateInvoiceItems implements Database.Batchable<sObject>, Schedulable, Database.Stateful, Database.AllowsCallouts {
    global Set<Id> caseIDs;
    public JobCreateInvoiceItems(Set<Id> tempcaseIDs){
        caseIDs=tempcaseIDs;
    }
    global void execute(SchedulableContext sc) {
         JobCreateInvoiceItems job = new JobCreateInvoiceItems(null);
         ID batchprocessid = Database.executeBatch(job,22); 
    }
    global Database.QueryLocator start(Database.BatchableContext BC) {
    	Set<Id> setCaseIDs=caseIDs;
    	String query='Select id,account.Zuora_Account_ID__c,Invoice_Number__c from Case where id In:setCaseIDs AND Invoice_Number__c!=null';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Case> caseList) {
      	if(caseList!=null && caseList.size()>0){
      	  caseList = [Select id,account.Zuora_Account_ID__c,Invoice_Number__c from Case where id In:caseList AND Invoice_Number__c !=null];
          List<Invoice_Line_Item__c>  invItemList = [Select id,Zuora_Invoice_Line_Item_Id__c,Item_Date__c,Name,Case__c,Original_Amount__c,ServiceStartDate__c,ServiceEndDate__c 
                                                    from Invoice_Line_Item__c Where Case__c =:caseList AND Zuora_Invoice_Line_Item_Id__c!=null];
          Map<String,Invoice_Line_Item__c> invItemMap = new Map<String,Invoice_Line_Item__c>();
          for(Invoice_Line_Item__c inL:invItemList){
               invItemMap.put(inL.Zuora_Invoice_Line_Item_Id__c,inL);
           }
         // Map<String,List<InvoiceItem>> mapInvInvItems = new   Map<String,List<InvoiceItem>>();
         for(Case c:caseList){
         	try{
         		String invoiceIDfromNumber = APIZuoraInvoice.getInvoiceNumber(c.Invoice_Number__c);
                APIZuora.ResponseList resList = APIZuora.getInvoiceLineItem(invoiceIDfromNumber);
                System.debug('==========> deserialize() response = ' + resList);
                if(resList!= null && resList.records.size() !=null && resList.records.size()>0){
                for(APIZuora.InvoiceItem rec :resList.records){
                   if(!invItemMap.containsKey(rec.id)){
                       Invoice_Line_Item__c newInvItem = new Invoice_Line_Item__c();
                       newInvItem.Zuora_Invoice_Line_Item_Id__c = rec.id;
                       newInvItem.Case__c =c.id;
                       if(String.isNotBlank(rec.chargeDate)){
                             Datetime chargeDate = (DateTime)JSON.deserialize(rec.chargeDate,DateTime.class);
                             System.debug('rec>>>'+rec);
                             newInvItem.Item_Date__c = chargeDate;    
                       }
                       if(String.isNotBlank(rec.chargeName)){
                            newInvItem.Name = rec.chargeName;        
                       }
                       if(String.isNotBlank(rec.SubscriptionNumber)){
                            newInvItem.Subscription_Name__c = rec.SubscriptionNumber;        
                       }
                       if(String.isNotBlank(rec.UnitPrice)){
                            newInvItem.New_Adjustment__c =decimal.valueOf(rec.UnitPrice);
                       }
                       if(String.isNotBlank(rec.ChargeAmount)){
                           newInvItem.Original_Amount__c= decimal.valueOf(rec.ChargeAmount);           
                       }
                        if(String.isNotBlank(rec.ServiceStartDate)){
                            newInvItem.ServiceStartDate__c=date.valueof(rec.ServiceStartDate);            
                       }
                       if(String.isNotBlank(rec.serviceEndDate)){
                            newInvItem.ServiceEndDate__c=date.valueof(rec.serviceEndDate);          
                       }
                        invItemList.add(newInvItem); 
                        System.debug('invItemList >>>'+invItemList);
                       }         
                    } 
                 }
              } catch(Exception ex){
    			    // b.Notes__c=ex.getMessage();
    			     System.debug('ex.getMessage();====='+ex.getMessage());
			   } 
        }
        upsert invItemList;
      
      	}
    }
    global void finish(Database.BatchableContext BC) { 
        
    }    
}