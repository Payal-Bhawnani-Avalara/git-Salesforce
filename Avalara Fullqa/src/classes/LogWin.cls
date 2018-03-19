public with sharing class LogWin {
   public static HttpRequest buildWebServiceRequest(integer sendDingNumber, string sendDingFor, string sendDingProduct, string sendDingCustomer, string dingAmount, string sendDingOppId)
    {
        //Build HTTP Request object
        HttpRequest req = new HttpRequest();
        Http http = new Http();
		req.setMethod('GET');

        //req.SetHeader('X-Parse-Application-Id','odlSEiucFLcPCluS7FSmXR1DI7n06BsWg4H8JpK3');
        //req.SetHeader('X-Parse-Master-Key','m3pV0Tgt7I9tJiZ248ZLrylrKIY0NyMEI94n375m');
        //req.SetHeader('Content-Type','application/json');
        //req.setEndpoint('https://api.parse.com/1/push');
 
        //req.setBody('{"channels": [""],"data": {"alert": "Ding #'+sendDingNumber+' - '+sendDingFor+' sold '+sendDingProduct+' to '+sendDingCustomer+' for $'+dingAmount+'","badge": '+sendDingNumber+',"sound": "Ding.caf","OppId": "'+sendDingOppId+'"}}');
        req.setEndpoint('http://api.stathat.com/c?ukey=Mjg4NyCoeUpAeKjRztZrxE1JXQGD&key=j0WKabdw9fgq7uGpcg3nyCBHcVNj&count=1000'); 
        return req;
     }

    public static HttpResponse invokeWebService(Http h, HttpRequest req)
    {
     HttpResponse res = h.send(req);
     return res;
    }
    
    @Future(callout=true)
    public static void writeToStatHat(integer sendDingNumber, string sendDingFor, string sendDingProduct, string sendDingCustomer, string dingAmount, string sendDingOppId)
    {
          Http h = new Http();
          HttpRequest req = buildWebServiceRequest(sendDingNumber,sendDingFor,sendDingProduct,sendDingCustomer,dingAmount,sendDingOppId);
          HttpResponse resp = invokeWebService(h, req);
          System.debug(resp.getBody());
          return;
    }
    
    public static void handleWebServiceResponse(HttpResponse res){

     //Parse and apply logic to the res message
}


    static testMethod void testWebService(){
        RecordType customerType= [select id,name from RecordType where name='Customer Account Type' limit 1];
        Account acct = new Account(Name='Test Account',RecordType=customerType,Type__c='Customer');
        insert acct;
        User usr= [select id,name from User limit 1];
 
        Opportunity opp = new Opportunity(Type='New',Amount=123,CloseDate=date.newInstance(2070, 12, 31), Name = 'TestOpp',StageName = 'Closed Won');
        insert opp;
        opp.AccountId = acct.Id;
        opp.OwnerId=usr.Id;
        Account wonAccount = [select name from account where id=:opp.AccountId limit 1];
        User wonUser = [select name from User where id=:opp.OwnerId limit 1];
        Decimal dollars= opp.Amount.intValue();
      //First, build the http request
      HttpRequest req = buildWebServiceRequest(55,wonUser.Name,opp.Name, wonAccount.Name, dollars.format(),(String)opp.Id );
   
      //NOTE - WE DO NOT EXECUTE THE METHOD, invokeWebService. 
      
      //Now, since we can't execute the actual web service, 
      //write apex code to build a sample HttpResponse object
      HttpResponse res = new HttpResponse();
      //Apply test data and attributes to the HttpResponse object as needed
      handleWebServiceResponse(res);
  
    }
}