@isTest
public class cc_Ava_ctrl_AICallbackTest {
    static testmethod void constructorTest() {

        cc_Ava_ctrl_AICallback controller = null;

        Test.startTest();
        controller = new cc_Ava_ctrl_AICallback();
        controller.dummy = 'test';
        Test.stopTest();

        System.assert(controller != null);
        System.assertEquals('test', controller.dummy);
    }

    /*static testmethod void getUserInfoFromJWTTest() {
        String jwt = 'id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjYyQTVENjlFNjRCOEM2N0FGRDM3RDE4QkY4NEQwQzJGNkY1MTgzRDgiLCJ0eXAiOiJKV1QiLCJ4NXQiOiJZcVhXbm1TNHhucjlOOUdMLUUwTUwyOVJnOWcifQ.eyJuYmYiOjE1MDY2OTIyMjUsImV4cCI6MTUwNjY5MjUyNSwiaXNzIjoiaHR0cHM6Ly9haS1zYnguYXZsci5zaCIsImF1ZCI6ImF2YWxhcmFzdG9yZSIsIm5vbmNlIjoiYmZlMmJmZjYxZTZlNTY3OTBhOTI2MDdiZjJhNGRhNDgiLCJpYXQiOjE1MDY2OTIyMjUsInNpZCI6ImEwZTQwZDU3MzdjYjc1MTU2NzY1OWZiMjZjYmIzMTQwIiwic3ViIjoiM2YzYzdiY2VjY2U2NDMxYzliZmE0NGUzZGQzZWE5NzgiLCJhdXRoX3RpbWUiOjE1MDY2OTIyMjUsImlkcCI6IkF2YWxhcmFJZGVudGl0eSIsIm5hbWUiOiJ0b2RkLm1pdGNoZWxsQGF2aW9ub3MuY29tIiwiZ2l2ZW5fbmFtZSI6IlRvZGQiLCJmYW1pbHlfbmFtZSI6Ik1pdGNoZWxsIiwiYW1yIjpbInB3ZCJdfQ.OlnzIokRJOaRLN7gtChdE_t6T9BeNWzTqEOYdzNcbLKfZfiaHzpok43n7PCEgvLUv2S4hs8IUFmogNrrBNr17o4dvKQPem8pVqDkw85zwjOqDasi0aGgkSOdLKnOVeODvrx3OrDWsI9Ot45ctVRV8moRmT8LqxSmInCSWXL1N7vVuUsAbdF-PLScv4MAP0r3kgkWEiLfekiWtCgpHkWUcoW4koISV_LbSkjN92wpcUoVjLRZzGYfq5gHJKwYpT908I58r4N404CKYD9nIkObA_gmW3RwJ3PEY9PLdiN5tHJnb6dI1tu6fv9tjd-etFwxN3R_6ei6LkVi3KOuesJv6g&scope=openid profile&session_state=kgf0qYD0rA65L_G1409JALy8gxJ7WfYMxYjtQ9xM_Uk.e94361de4075f6d694f3332dae7a3f5e';

        Map<String, Object> response = null;

        Test.startTest();
        response = cc_Ava_ctrl_AICallback.getUserInfoFromJWT(jwt);
        Test.stopTest();

        System.assert(response != null);
        System.assertEquals('todd.mitchell@avionos.com', (String)response.get('name'));
    }*/

    static testmethod void getUserInfoForJWTTest() { 
        ccrz.cc_CallContext.storefront = 'DefaultStore';
        cc_Ava_api_IdentityTest.createIdentitySettings('DefaultStore');
        Test.setMock(HttpCalloutMock.class, new cc_Ava_api_IdentityTest.AIServiceMock(200, 'OK', cc_Ava_api_IdentityTest.TEST_USERINFO));

        Map<String, Object> response = null;

        Test.startTest();
        response = cc_Ava_ctrl_AICallback.getUserInfo(cc_Ava_api_IdentityTest.TEST_RETURN_STRING);
        Test.stopTest();

        System.assert(response != null);
        System.assertEquals('todd.mitchell@avionos.com', (String)response.get('name'));
    }

    /*static testmethod void getCustomerAccountsTest() {
        cc_Ava_api_CustomerTest.createBiztechSettings('DefaultStore');
        ccrz.cc_CallContext.storefront = 'DefaultStore';
        Test.setMock(HttpCalloutMock.class, new cc_Ava_api_CustomerTest.BiztechServiceMock(200, 'OK', cc_Ava_api_CustomerTest.CUSTOMER_ACCOUNTS_RESPONSE));

        Map<String, Object> response = null;

        Test.startTest();
        response = cc_Ava_ctrl_AICallback.getAccount('example-165b381c@example.org');
        Test.stopTest();

        System.assert(response != null);
        List<Object> accountList = (List<Object>) response.get('data');
        Map<String, Object> record = (Map<String, Object>) accountList[0];
        System.assertEquals('Biztech Co 48ac5434', (String)record.get('name'));
    }*/
}