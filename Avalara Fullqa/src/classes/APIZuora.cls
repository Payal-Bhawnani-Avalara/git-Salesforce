global with sharing class APIZuora {
   public String size;
   public string done;
   public list<Record> Records;
   public with sharing class Record {
        public String ServiceEndDate;
        public String SubscriptionNumber;
        public string ChargeAmount;
        public String Id;
        public String chargeDate;
        public String ServiceStartDate;
        public string UnitPrice;
        public String chargeName;
    }
    public static APIZuora getInvoiceLineItem(String invoiceId){ 
             HttpRequest req = new HttpRequest();
             HttpResponse res = new HttpResponse();
             Http http = new Http();
             req.setEndpoint('callout:SalesforceZuoraUser/v1/action/query');
             req.setMethod('POST');
             req.setBody('{"queryString" :"Select id,chargeDate,chargeName,ChargeAmount,SubscriptionNumber,ServiceStartDate,serviceEndDate,UnitPrice from invoiceitem where invoiceid = \''+String.escapeSingleQuotes(invoiceId)+ '\'"}');
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
             APIZuora response = null;
             if(res.getStatusCode() == 200) {
             	//put it in try catch
                response = (APIZuora)System.JSON.deserialize(res.getBody(),APIZuora.class);
                System.debug('==========> deserialize() response = ' + response);
            }
            return response;
     }
}