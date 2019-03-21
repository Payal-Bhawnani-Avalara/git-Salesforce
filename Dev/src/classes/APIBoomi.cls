global with sharing class APIBoomi {
    
    public static void sendCaseStatusDeprovisioning(Set<Id> caseId){ 
          if(caseId != null && !caseId.isEmpty()){
        List<Case> lstCase = [select Id,Accountid, Account.name,CurrencyIsoCode,Cancel_Notify_Date__c,Cancellation_Effective_Date__c,Charge_Number__c,CNCL_by_Avalara__c from Case where Id In: caseId];
       //Related_Amendment_s__c
        Boolean IsSandbox=[select IsSandbox From Organization].IsSandbox;
            String endpointURL='';
            String authKey='';
            if(IsSandbox==false){
                    endpointURL=KeyPairValue__c.getInstance('Boomi_API_URL_Production').Values__c;
                    authKey=KeyPairValue__c.getInstance('Boomi_API_Key').Values__c;
            }
            else{
                    endpointURL=KeyPairValue__c.getInstance('Boomi_API_URL_Sandbox').Values__c;
                    authKey=KeyPairValue__c.getInstance('Boomi_API_Key').Values__c;         
            }
         List<String> listCaseJSON=new List<String>();
         List<String> tempAmendment= new List<String>();
         List<String> listAmendmentJSON=new List<String>();
         
         for (Case c : lstCase){
          String strTemplate='{';
           strTemplate+='"Idempotency-Key":"'+c.Id+'"'+',';
           strTemplate+='"sfCaseId":"'+c.Id+'"'+',';
           strTemplate+='"businessActivity":"Cancellation"'+',';
           strTemplate+='"businessActivitySource":"Salesforce.Cases"'+',';
           strTemplate+='"sfCustomerId":"'+c.AccountID+'"'+',';
           strTemplate+='"sfAccountName":"'+c.Account.name+'"'+',';
           strTemplate+='"cancelType":"Partial"'+',';
           /*if(String.isBlank(c.CNCL_by_Avalara__c) || c.CNCL_by_Avalara__c!='Nonpayment'){
           	strTemplate+='"cancelType":"Partial"'+',';
           }
           else{
           	strTemplate+='"cancelType":"NonPayment"'+',';
           }*/
           strTemplate+='"currency":"'+c.CurrencyIsoCode+'"'+',';
           strTemplate+='"list":[';
           strTemplate+='PLACEHOLDER';
           strTemplate+=']';
           strTemplate+='}';
           
           
          if(String.isNotBlank(c.Charge_Number__c)){
              tempAmendment= c.Charge_Number__c.split(';');
           }
            
            for(String amendmentId : tempAmendment ){
              String amendmentJSON='{';
              amendmentJSON+='"cancelDate":"'+c.Cancel_Notify_Date__c+'"'+',';
              amendmentJSON+='"cancelEffectiveDate":"'+c.Cancellation_Effective_Date__c+'"'+',';
              amendmentJSON+='"orderDate":"'+Date.today()+'"'+',';
              //amendmentJSON+='"cancelAmendCode":"'+amendmentId.replaceAll( '\\s+', '')+'"';
              amendmentJSON+='"chargeNumber":"'+amendmentId.replaceAll( '\\s+', '')+'"';
              amendmentJSON+='}';
              listAmendmentJSON.add(amendmentJSON);
            }
           
           if(math.mod(listCaseJSON.size(),49)==0 || listCaseJSON.size()==lstCase.size()){	                  
            String finalJSON=strTemplate.replace('PLACEHOLDER',String.join(listAmendmentJSON,','));                    
         
	          HTTPRequest req = new HTTPRequest();
	          req.setTimeout(120000);
	          req.setEndpoint(endpointURL);
	          req.setHeader('Secure', +authKey);
	          req.setHeader('Content-Type','application/json;chartset=UTF-8');
	          req.setMethod('POST');
	          req.setBody(finalJSON);
	          Http http = new Http();
	          HttpResponse res = http.send(req);
	          system.debug('Response Code :'+res.getStatusCode());
	          system.debug('Response Code :'+ finalJSON);
	          system.debug('Status : '+res.getStatus());
	          System.debug('Response Body is :'+res.getBody());      
        }
       } 
    }
  }
}