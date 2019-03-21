public class APIZuoraInvoice {
	public List<Invoice> Records;
    public with sharing class Invoice{
      public String Id;
    }
    
      public static String getInvoiceNumber(String invoiceNumber){ 
             HttpRequest req = new HttpRequest();
             HttpResponse res = new HttpResponse();
             Http http = new Http();
             req.setEndpoint('callout:SalesforceZuoraUser/v1/action/query');
             req.setMethod('POST');
             req.setBody('{"queryString" :"Select id from invoice where InvoiceNumber = \''+String.escapeSingleQuotes(invoiceNumber)+ '\'"}');
             System.debug('req.getBody()>>>'+req.getBody());
             req.setHeader('Content-Type', 'application/json');
             req.setHeader('Accept','application/json');
             if(Test.isRunningTest()){
        		    res = new HttpResponse();
	            res.setHeader('Content-Type', 'application/json');
	            res.setBody('{ "records": [ { "ServiceEndDate": "2016-04-16", "SubscriptionNumber": "AT002848","ChargeAmount": 0,"Id": "2c92a094511d0f890151213f2efc6c0a","ChargeDate": "2015-11-19T11:36:07.000-08:00","ServiceStartDate": "2015-05-14","UnitPrice": 0,"ChargeName": "ADD-ON CONNECTOR RECURRING CHARGE"}]}');
	            res.setStatusCode(200);			
		     }
		     else{
			    res = http.send(req);
		     }
             System.debug('res>>>'+res.getBody());
             APIZuoraInvoice response = null;
             if(res.getStatusCode() == 200) {
             	//put it in try catch
                response = (APIZuoraInvoice)System.JSON.deserialize(res.getBody(),APIZuoraInvoice.class);
                System.debug('==========> deserialize() response = ' + response);
             }
            System.debug('response.Records[0].Id>>>'+response.Records[0].Id);
            return response.Records[0].Id;
     }
}