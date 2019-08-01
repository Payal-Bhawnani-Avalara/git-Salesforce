@isTest
private class CC_AVA_AI_APITest {

    static testMethod void testGetAILoginURL() {
    	cc_Ava_api_IdentityTest.createIdentitySettings('AvalaraStore');
        CC_AVA_AI_API.getAILoginURL();
        
    }
}