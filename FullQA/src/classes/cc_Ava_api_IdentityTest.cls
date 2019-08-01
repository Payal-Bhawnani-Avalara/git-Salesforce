@isTest
public class cc_Ava_api_IdentityTest {
    
    static testmethod void decodeJWTTest() {
        String jwt = 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjYyQTVENjlFNjRCOEM2N0FGRDM3RDE4QkY4NEQwQzJGNkY1MTgzRDgiLCJ0eXAiOiJKV1QiLCJ4NXQiOiJZcVhXbm1TNHhucjlOOUdMLUUwTUwyOVJnOWcifQ.eyJuYmYiOjE1MDY2OTIyMjUsImV4cCI6MTUwNjY5MjUyNSwiaXNzIjoiaHR0cHM6Ly9haS1zYnguYXZsci5zaCIsImF1ZCI6ImF2YWxhcmFzdG9yZSIsIm5vbmNlIjoiYmZlMmJmZjYxZTZlNTY3OTBhOTI2MDdiZjJhNGRhNDgiLCJpYXQiOjE1MDY2OTIyMjUsInNpZCI6ImEwZTQwZDU3MzdjYjc1MTU2NzY1OWZiMjZjYmIzMTQwIiwic3ViIjoiM2YzYzdiY2VjY2U2NDMxYzliZmE0NGUzZGQzZWE5NzgiLCJhdXRoX3RpbWUiOjE1MDY2OTIyMjUsImlkcCI6IkF2YWxhcmFJZGVudGl0eSIsIm5hbWUiOiJ0b2RkLm1pdGNoZWxsQGF2aW9ub3MuY29tIiwiZ2l2ZW5fbmFtZSI6IlRvZGQiLCJmYW1pbHlfbmFtZSI6Ik1pdGNoZWxsIiwiYW1yIjpbInB3ZCJdfQ.OlnzIokRJOaRLN7gtChdE_t6T9BeNWzTqEOYdzNcbLKfZfiaHzpok43n7PCEgvLUv2S4hs8IUFmogNrrBNr17o4dvKQPem8pVqDkw85zwjOqDasi0aGgkSOdLKnOVeODvrx3OrDWsI9Ot45ctVRV8moRmT8LqxSmInCSWXL1N7vVuUsAbdF-PLScv4MAP0r3kgkWEiLfekiWtCgpHkWUcoW4koISV_LbSkjN92wpcUoVjLRZzGYfq5gHJKwYpT908I58r4N404CKYD9nIkObA_gmW3RwJ3PEY9PLdiN5tHJnb6dI1tu6fv9tjd-etFwxN3R_6ei6LkVi3KOuesJv6g&scope=openid profile&session_state=kgf0qYD0rA65L_G1409JALy8gxJ7WfYMxYjtQ9xM_Uk.e94361de4075f6d694f3332dae7a3f5e';

        Map<String, Object> response = null;

        Test.startTest();
        response = cc_Ava_api_Identity.decodeJWT(jwt);
        Test.stopTest();

        System.assert(response != null);
        System.assertEquals('todd.mitchell@avionos.com', (String)response.get('name'));
    }

    static testmethod void generateLoginUrlTest() {
        createIdentitySettings('DefaultStore');

        String response = null;

        Test.startTest();
        response = cc_Ava_api_Identity.generateLoginUrl('DefaultStore');
        Test.stopTest();

        System.assert(response != null);
        System.assert(response.startsWith(TEST_URL));
    }

    static testmethod void userInfoTest() {
        createIdentitySettings('DefaultStore');
        Test.setMock(HttpCalloutMock.class, new AIServiceMock(200, 'OK', TEST_USERINFO));

        cc_Ava_api_Identity.IdentityResponse response = null;

        Test.startTest();
        response = cc_Ava_api_Identity.userInfo('DefaultStore', 'bearertoken');
        Test.stopTest();

        System.assert(response != null);
        System.assert(response.data != null);
        System.assertEquals('todd.mitchell@avionos.com', response.data.get('name'));
    }

    public static void createIdentitySettings(String storefront) {
        CC_Ava_Identity_Settings__c settings = new CC_Ava_Identity_Settings__c();
        settings.Name = cc_Ava_api_Identity.getStoreName(storefront);
        settings.Authorize_Path__c = '/connect/authorize/login';
        settings.Base_URL__c = 'https://ai-dummy.avlr.sh';
        settings.Callback_Path__c = '/apex/CC_Ava_AICallback';
        settings.Callback_Url__c = 'https://dummy-avalaracommunity.cs17.force.com/apex/CC_Ava_AICallback';
        settings.Client_Id__c = 'avalarastore';
        settings.Login_Path__c = '/account/login';
        settings.UserInfo_Path__c = '/connect/userinfo';
        settings.Response_Type__c = 'id_token token';
        settings.Scopes__c = 'openid profile avatax_api';
        insert settings;
    }

    public class AIServiceMock implements HttpCalloutMock {

        public Integer code {get; set;}
        public String status {get; set;}
        public String body {get; set;}

        public AIServiceMock(Integer code, String status, String body) {
            this.code = code;
            this.status = status;
            this.body = body;
        }

        public HTTPResponse respond(HTTPRequest request) {
            HttpResponse response = new HttpResponse();
            response.setBody(this.body);
            response.setStatusCode(this.code);
            response.setStatus(this.status);
            return response;
        }
    }

    public final static String TEST_RETURN_STRING = 'id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjM4NjlFNTM2MjI2QkZGODZFMTRGMTVBQTRDQjgxQzM3QzM2OTI2NDIiLCJ0eXAiOiJKV1QiLCJ4NXQiOiJPR25sTmlKcl80YmhUeFdxVExnY044TnBKa0kifQ.eyJuYmYiOjE1MDgzNDIwMTYsImV4cCI6MTUwODM0MjMxNiwiaXNzIjoiaHR0cHM6Ly9haS1zYnguYXZsci5zaCIsImF1ZCI6ImF2YWxhcmFzdG9yZSIsIm5vbmNlIjoiMzJmMjRlY2RlNGNkNzM1NWFhNmEzMjNlNTlmNzRhM2UiLCJpYXQiOjE1MDgzNDIwMTYsImF0X2hhc2giOiJycTZheFZId2pScDNFak1US0RzY19BIiwic2lkIjoiMTk3ZmY3ZGYyMTcwMTI5OTYzYTk2OWMxOTkxNGIyMGMiLCJzdWIiOiIzZjNjN2JjZWNjZTY0MzFjOWJmYTQ0ZTNkZDNlYTk3OCIsImF1dGhfdGltZSI6MTUwODM0MjAxNiwiaWRwIjoiQXZhbGFyYUlkZW50aXR5IiwiYW1yIjpbInB3ZCJdfQ.EPrO9pUiK8ml4mX0a8b0DTigAskNMMOTkF6pjIWiibOzUcSCDjNfV0jikHhGHrmam_bb_pQlsNY55xG7q_Qj8sbiEA5JV1S26Aw3zKYGeSu0rdNZECoRyDRvRiRH9x0SqsYzKBSONXEv_2dKALqxxb1Hv0mEDzzR4KmWF-AzVQSkNrux8BpQx67xKnSx9lLcfktauqymNHrEKP5ECGpJxKwCd9YFBnZx0aQ_0vPhmb60_ISeiOds-gm6ZCLEsvmnfriU6tNEQHbwggTsLEFeh4g3ZzqvcNQELQwutVxV4qfnJ640d4b-zQfhXDgqxuxQnDuA5Vk-k47PAaDENbm9bQ&access_token=ad01c9a32a9ba44bd9f56aba8d0cd2f2c980795568433dd2fae6aeb1dcf29eed&token_type=Bearer&expires_in=3600&scope=openid%20profile%20avatax_api&session_state=TkWB48J5gMAk8vTbF1bg8yXXyuRhGgwzCuUh0VNZo_0.69eae267efc2bf173f4ec86e31987aef';
    public final static String TEST_URL = 'https://ai-dummy.avlr.sh/account/login?returnUrl=%2Fconnect%2Fauthorize%2Flogin%3Fresponse_type%3Did_token+token%26client_id%3Davalarastore%26scope%3Dopenid+profile+avatax_api%26redirect_uri%3Dhttps%253A%252F%252Fdummy-avalaracommunity.cs17.force.com%252Fapex%252FCC_Ava_AICallback%26nonce%3D';
    public final static String TEST_USERINFO = '{"sub":"3f3c7bcecce6431c9bfa44e3dd3ea978","name":"todd.mitchell@avionos.com","given_name":"Todd","family_name":"Mitchell"}';
}