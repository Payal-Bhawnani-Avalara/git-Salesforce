/**  
 * Name        : MockHttpResponseGeneratorRestAccount
 * Author      : RAJA SEKHAR CHALLARI
 * Created Date: June/29/2017
 * Description : This is a supporting test class for 30 Day Sandbox Extension button on Account which is for sending the account id to BOOMI.
 **/
@isTest
global class MockHttpResponseGeneratorRestAccount implements HttpCalloutMock {
    global httpResponse respond(HttpRequest req){
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type','application/json');
        res.setBody('{"foo":"bar"}');
        res.setStatusCode(200);
        return res;
    }
}