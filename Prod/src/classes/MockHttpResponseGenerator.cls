@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        // Create a simulated response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('<edit status="success"><page id="16936" href="https://help.avalara.com/@api/deki/pages/16936?redirects=0" deleted="false" revision="1"><uri.ui>https://help.avalara.com/z_Avalara_Internal/Service_Operations_Work_Area/SANDBOX_-_Partner_KB/PartnerKB__-_Connector_X_(out_of_Z)</uri.ui><title>PartnerKB  - Connector X (out of Z)</title><path>z_Avalara_Internal/Service_Operations_Work_Area/SANDBOX_-_Partner_KB/PartnerKB__-_Connector_X_(out_of_Z)</path><namespace>main</namespace><date.created>2014-01-15T05:14:28Z</date.created></page></edit>');
        res.setStatusCode(200);
        return res;
    }
}