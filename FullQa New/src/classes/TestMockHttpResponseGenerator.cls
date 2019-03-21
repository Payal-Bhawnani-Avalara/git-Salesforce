@isTest
global class TestMockHttpResponseGenerator implements HttpCalloutMock {
	public static String SETUPRESPONSEBODY='{}';
	public static Integer SETUPRESPONSECODE=200;
	public static String SETUPRESPONSECONTENTTYPE='application/json';
	//Create a Mock webservice response
    global HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', SETUPRESPONSECONTENTTYPE);
        res.setBody(SETUPRESPONSEBODY);
        res.setStatusCode(SETUPRESPONSECODE);
        return res;
    }
}