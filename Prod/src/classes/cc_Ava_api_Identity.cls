// MKTG-8651
public with sharing class cc_Ava_api_Identity {
    public static IdentityResponse userInfo(String storefront, String code) {

        IdentityResponse response = new IdentityResponse();

        try {
            CC_Ava_Identity_Settings__c settings =  getAISetting(storefront);
             
            cc_Ava_util_Http httpRequest = new cc_Ava_util_Http();
            httpRequest.method = cc_Ava_util_Http.REQUEST_TYPE.GET;
            httpRequest.requestContentType = cc_Ava_util_Http.CONTENT_TYPE.JSON;
            String urlString = settings.Base_URL__c;
            urlString += settings.UserInfo_Path__c;
            //httpRequest.endpoint = settings.Ping_URL__c;
            httpRequest.endpoint = urlString;
            httpRequest.addHeader('Authorization' , 'Bearer ' + code);

            HttpResponse httpResponse = httpRequest.submitRequest();

            if (!httpRequest.requestErrors) {

                if (httpResponse.getStatusCode() == 200) {
                    String responseBody =  httpResponse.getBody(); 
                    if (String.isNotBlank(responseBody)) {
                        response.data = (Map<String, Object>) JSON.deserializeUntyped(responseBody);
                    }
                    response.success = true;
                    response.responseCode  = httpResponse.getStatusCode();
                }
                else {
                    response.success = false;
                    response.responseCode  = httpResponse.getStatusCode();
                }
            }
            else {
                System.debug(System.LoggingLevel.ERROR, httpRequest.requestException);
                response.success = false;
                response.message = httpRequest.requestException.getMessage();
                response.data = new Map<String,Object>{'error' => httpRequest.requestException.getMessage(),'cause' => httpRequest.requestException.getCause(),'lineno' => httpRequest.requestException.getLineNumber(),'stack' => httpRequest.requestException.getStackTraceString()};
            }
        }
        catch (Exception e) {
            System.debug(System.LoggingLevel.ERROR, e);
            response.success = false;
            response.message = e.getMessage();
            response.data = new Map<String,Object>{'error' => e.getMessage(),'cause' => e.getCause(),'lineno' => e.getLineNumber(),'stack' => e.getStackTraceString()};
        }

        return response;
    }

    public class IdentityResponse {

        public String message {get; set;}
        public Boolean success {get; set;}
        public Integer responseCode {get; set;}

        public Map<String, Object> data {get; set;}

    }
    public static Map<String, Object> decodeJWT(String jwt) {
        Map<String, Object> claims = null;
        if (jwt != null) {

            String[] parts = jwt.split('\\.');
            String headerBase64UrlEncode = parts[0];
            String claimSetBase64UrlEncode = parts[1];
            String signedBlobBase64UrlEncoded = parts[2];

            String headerBase64Encode = EncodingUtil.urlDecode(headerBase64UrlEncode, 'UTF-8');
            String header = EncodingUtil.base64Decode(headerBase64Encode).toString();

            String claimSetBase64Encode = EncodingUtil.urlDecode(claimSetBase64UrlEncode, 'UTF-8');
            String claimSet = EncodingUtil.base64Decode(claimSetBase64Encode).toString();

            claims = (Map<String, Object>) JSON.deserializeUntyped(claimSet);

        }
        return claims;

    }

    public static String generateLoginUrl(String storefront) {
        CC_Ava_Identity_Settings__c settings =  getAISetting(storefront);
        String urlString = settings.Base_URL__c;
        urlString += settings.Login_Path__c;
        urlString += '?returnUrl=';

        String returnUrl = settings.Authorize_Path__c;
        returnUrl += '?response_type=' + settings.Response_Type__c;
        returnUrl += '&client_id=' + settings.Client_Id__c;
        returnUrl += '&scope=' + settings.Scopes__c;
        returnUrl += '&redirect_uri=' + EncodingUtil.urlEncode(settings.Callback_Url__c, 'UTF-8');
        returnUrl += '&nonce=' + generateNonce();
        urlString += EncodingUtil.urlEncode(returnUrl, 'UTF-8');

        return urlString;

    }
	public static CC_Ava_Identity_Settings__c getAISetting(String storefront){
		storefront=getStoreName(storefront);
		String sandboxName=CC_AVA_Util.getSandboxName();
		String instancename=[select id,instancename From organization limit 1].instancename;
		instancename=instancename.tolowercase();
		CC_Ava_Identity_Settings__c settings =  CC_Ava_Identity_Settings__c.getInstance(storefront);
		settings.Callback_Url__c=settings.Callback_Url__c.replace('@@SANDBOXNAME@@',sandboxName);
		settings.Callback_Url__c=settings.Callback_Url__c.replace('@@INSTANCENAME@@',instancename);
		return settings;
	}
	public static String getStoreName(String storefront){
		String sandboxName=CC_AVA_Util.getSandboxName();
 		if(String.isNotBlank(sandboxName) && sandboxName=='prod'){
 			storefront=storefront+'_prod';
		}
		else{
			storefront=storefront+'_sandbox';
		}	
		return storefront;	
	}

    public static String generateNonce() {
        Integer random = integer.valueOf(DateTime.now().getTime()) + Crypto.getRandomInteger();
        String str = string.valueOf(random);
        Blob key = Blob.valueOf(str);
        Blob keyHash = Crypto.generateDigest('MD5', key);
        String hexDigest = EncodingUtil.convertToHex(keyHash);
        return hexDigest;
    }

}