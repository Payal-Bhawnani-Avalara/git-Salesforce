/**  
 * Name        : restAccount 
 * Author      : RAJA SEKHAR CHALLARI
 * Created Date: June/29/2017
 * Description : This is a class for 30 Day Sandbox Extension button on Account which is for sending the account id to BOOMI.
 **/
global class restAccount {
    
    webservice static string callRestService(string accId){
        system.debug('Account Id is :'+accId);
        string jsonreq =  '{'+ 
                          '"Status": "Success",'+
                          '"Message": "This is a return true stub message.",'+
                          '"Id":'+ accId +'}';
        string endpointURL = 'https://boomiqa1.sanjuan.avalara.com/ws/rest/provisioning/admin/v1/extend/'+accId;
        
        HTTPRequest req = new HTTPRequest();
        req.setEndpoint(endpointUrl);
        string authorizationHeader = 'UDqUCZz86mbbHJOsxyLk';
        req.setHeader('Authorization',authorizationHeader);
        req.setHeader('Content-Type','application/json;chartset=UTF-8');
        req.setMethod('POST');
        req.setBody(jsonreq);
        Http http = new Http();
        
        
        try{
            HttpResponse res = http.send(req);
            system.debug('Response Code :'+res.getStatusCode());
            system.debug('Status : '+res.getStatus());
            System.debug('Response Body is :'+res.getBody());
            
        }
        catch(Exception ex){
            system.debug('Exception is :'+ex.getMessage());
        }
        
        return null;
    }
}