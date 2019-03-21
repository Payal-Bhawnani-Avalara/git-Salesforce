public class HTTPUtil {

    public static String doRequest(
        String method,
        String endpoint,
        Map<String, String> headers,
        Map<String, String> urlParams,
        String payload
    ){

        HttpRequest req = new HttpRequest();
        req.setTimeout(120000);
        if(headers <> NULL){
            setHeaders(req, headers);
        }
        req.setMethod(method);
        req.setTimeout(120000);
        if(payload != NULL){
            req.setBody(payload);
        }
        req.setEndpoint(getEndpoint(endpoint, urlParams));
        System.debug('HTTPUtil Endpoint=>'+ req.getEndpoint());
        Http h = new Http();
        String res = '{}';
        HttpResponse r = h.send(req);
        res = r.getBody();
        System.debug('HTTPUtil Response=>'+ res + r.getstatuscode());
        return res;
    }

    public static String toUrlParams( Map<String,String> params){
        List<String> paramsList = new List<String>();
        for(String k :params.keySet()){
            paramsList.add(k + '=' + urlEncode(params.get(k)));
        }
        return String.join(paramsList, '&');
    }

    public static String urlEncode(String s){
        return EncodingUtil.urlEncode(s, 'utf-8')
            .replace('+', '%20')
            .replace('*', '%2A')
            .replace('%7E', '~');
    }

    private static void setHeaders(HttpRequest req, Map<String , String> headers){
        for(String k : headers.keySet()){
            req.setHeader(k, headers.get(k));
        }
    }

    private static String getEndpoint(String endpoint, Map<String, String> urlParams){
        if(urlParams != NULL && !urlParams.isEmpty()){
            endpoint = endpoint + '?' + toUrlParams(urlParams);
        }
        return endpoint;
    }
}