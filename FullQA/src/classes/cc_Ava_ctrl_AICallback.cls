// MKTG-8680
global with sharing class cc_Ava_ctrl_AICallback {
   /* public String dummy {get; set;}

    public cc_Ava_ctrl_AICallback() {
    }

    @RemoteAction
    global static Map<String, Object> getUserInfo(String data) {
        Map<String, Object> response = null;
        if (data != null) {
            Map<String, String> parms = parseParameters(data);
            String code = parms.get('access_token');

            if (code != null) {
                cc_Ava_api_Identity.IdentityResponse res = cc_Ava_api_Identity.userInfo(ccrz.cc_CallContext.storefront, code);
                response = res.data;
            }
        }
        return response;
    }
    private static Map<String, String> parseParameters(String parms) {
        Map<String, String> parmMap = new Map<String, String>();
        if (parms != null) {
            List<String> values = parms.split('&');
            for (String s : values) {
                List<String> chunks = s.split('=');
                if (chunks.size() == 2) {
                    parmMap.put(chunks[0], chunks[1]);
                }
            }
        }
        return parmMap;
    }
    /*@RemoteAction
    global static Map<String, Object> getAccount(String data) {
        Map<String, Object> response = null;
        if (data != null) {
            cc_Ava_api_Customer.CustomerResponse resp = cc_Ava_api_Customer.getCustomerAccounts(data, ccrz.cc_CallContext.storefront);
            response = resp.data;
        }
        return response;
    }*/
  
}