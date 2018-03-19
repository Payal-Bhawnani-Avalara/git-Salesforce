@isTest
public class cc_ava_AddressMockValid implements HttpCalloutMock {
    public HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('ContentType', 'text/json');
        response.setBody('{"Address": {"County": "COOK","FipsCode": "1703114000","CarrierRoute": "C015","PostNet": "606061784994","AddressType": "H","Line1": "101 N Wacker Dr","City": "Chicago","Region": "IL","PostalCode": "606061784","Country": "US"},"ResultCode": "Success", "Messages": [ { "Summary":"Message" } ]}');
        response.setStatusCode(200);
        System.debug('INSIDE ADDRESS MOCK');
        return response;
    }
}