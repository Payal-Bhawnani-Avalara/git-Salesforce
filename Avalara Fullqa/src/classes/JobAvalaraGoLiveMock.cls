Public class JobAvalaraGoLiveMock implements HttpCalloutMock {

    Public HTTPResponse respond(HTTPRequest req) {
        String body = '';
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        if(req.getEndPoint().contains('filingrequests')){
          body = '{"id":"123456","name" : "FilingRequested"}';
        }
        else if(req.getEndPoint().contains('filingcalendars')){
          body = '{"id":"123456","name": "FirstFiling"}';
        }
        else if(req.getEndPoint().contains('filingstatus')){
          body = '"FirstFiling"';
        }
        else{
          body = '{"effectiveDate":"2018-05-05","createdDate": "2015-01-28T10:57:23.983","companyId": "51095","id":"123456","value":[{"effectiveDate":"2018-05-05","createdDate": "2015-01-28T10:57:23.983","companyId": "51095","id":"123456"}]}';
        }
        res.setBody(body);
        res.setStatusCode(200);
        return res;
    }
}