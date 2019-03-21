@isTest
public class cc_Ava_util_HttpTest {

    public static void testEmptyConstructor(){
        cc_Ava_util_Http util = new cc_Ava_util_Http();
        Integer statusCode = util.statusCode;
        String status = util.status;
        
        System.assertEquals(util.requestContentType, null);
        System.assertEquals(util.endpoint, null);
        System.assertEquals(util.body, null);
        System.assertEquals(util.method, cc_Ava_util_Http.REQUEST_TYPE.GET);
        System.assertEquals(statusCode, null);
        System.assertEquals(status, null);
    } 

    @isTest
    public static void testException(){
        cc_Ava_util_Http util = new cc_Ava_util_Http();
        cc_Ava_util_HttpTestMock testMock = new cc_Ava_util_HttpTestMock();
        testMock.throwException = true;
        Test.setMock(HttpCalloutMock.class, testMock);
        Boolean threwException = false;
        Test.startTest();
        util.submitRequest();
        Test.stopTest();
        System.assert(util.requestErrors);
    }

    @isTest
    public static void testFullConstructor(){
        Test.setMock(HttpCalloutMock.class, new cc_Ava_util_HttpTestMock());
        Test.startTest();
        cc_Ava_util_Http util = new cc_Ava_util_Http('http://avionos.com', cc_Ava_util_Http.CONTENT_TYPE.JSON, '{ "userName":"test@avionos.com”, "password": "password", "firstName":"firstName","lastName":"lastName","email":"email@avionos.com"}');
        util.addQueryParameter('isOrganization', 'true');
        util.setBody('test');
        util.addQueryParameter('param1', 'value1');
        util.addQueryParameter('param2', 'value2');
        util.submitRequest();
        Test.stopTest();
        System.assertEquals(200, util.statusCode);
        System.assertEquals('OK', util.status);
    }



    @isTest
    public static void testResetState(){
        Test.setMock(HttpCalloutMock.class, new cc_Ava_util_HttpTestMock());
        Test.startTest();
        cc_Ava_util_Http util = new cc_Ava_util_Http('http://avionos.com', cc_Ava_util_Http.CONTENT_TYPE.JSON, '{ "userName":"test@avionos.com”, "password": "password", "firstName":"firstName","lastName":"lastName","email":"email@avionos.com"}');
        util.addQueryParameter('isOrganization', 'true');
        util.setBody('test');
        util.addQueryParameter('param1', 'value1');
        util.addQueryParameter('param2', 'value2');
        util.submitRequest();
        util.resetState();
        Test.stopTest();

        System.assertEquals(util.requestContentType, null);
        System.assertEquals(util.endpoint, null);
        System.assertEquals(util.body, null);
        System.assertEquals(util.method, null);
        System.assertEquals(util.statusCode, null);
        System.assertEquals(util.status, null);

    }

    public class cc_Ava_util_HttpTestMock implements HttpCalloutMock {
        public cc_Ava_util_HttpTestMock() {
            throwException = false;
        }
    
        public HTTPResponse respond(HttpRequest request){
            if(throwException){
                throw new cc_Ava_util_Http.cc_Ava_util_HttpException('Test Exception');
            }
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setStatus('OK');
            return response;
        }
    
        public Boolean throwException {get; set;}
    }
}