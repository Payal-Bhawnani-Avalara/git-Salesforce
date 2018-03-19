global with sharing class CC_AVA_AI_API {
	@RemoteAction
    global static String getAILoginURL(){
    		return cc_Ava_api_Identity.generateLoginUrl('AvalaraStore');
    }
}