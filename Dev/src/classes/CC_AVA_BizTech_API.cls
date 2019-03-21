global with sharing class CC_AVA_BizTech_API {
  @RemoteAction
    global static CCAccountWrapper getBizTechAccountAndContact(String email){
        //This method get data from BizTech API
        CCAccountWrapper obj; 
        if(String.isNotBlank(email)){
      	HttpRequest req = new HttpRequest(); 
      	req.setTimeout(120000);
          req.setMethod('GET');          
	      req.setEndpoint('callout:'+getNamedCredentialName()+'/customer/customer-accounts?onlineAuthorizedContactEmail='+EncodingUtil.urlEncode(email,'UTF-8'));
	      req.setHeader('Authorization', '{!$Credential.Username} '+'{!$Credential.Password}');      
          Http http = new Http();
          HTTPResponse res = http.send(req);   
          System.debug('BODY==: '+res.getBody());
          System.debug('STATUS==:'+res.getStatus());
          System.debug('STATUS_CODE==:'+res.getStatusCode());       
          //If request is successful then deserialize JSON and apply logic  
          if(res.getStatusCode()==200){
              String json=res.getBody();    //'{"data":[{"id":"0010n00000H1pEvAAJ","name":"Biztech Co 48ac5434","contacts":[{"id":"0030n00000FGZgkAAH","email":"example-165b381c@example.org","firstName":"first-d4d66dbd","lastName":"last-f4b64d0e","street":"1100 2nd Ave","city":"Seattle","state":"WA","country":"US","postalCode":"98101","isBillingContact":true,"isPrimaryContact":false,"onlineAuthorized":true}]},{"id":"0010n00000H1pEvAAJ","name":"Biztech Co 48ac5434","contacts":[{"id":"0030n00000FGeVTAA1","email":"example-165b381c@example.org","firstName":"first-d4d66dbd","lastName":"last-f4b64d0e_2","street":"1100 2nd Ave","city":"Seattle","state":"WA","country":"US","postalCode":"98101","isBillingContact":true,"isPrimaryContact":false,"onlineAuthorized":true}]}]}';
              system.debug('json====='+json);
              obj = CCAccountWrapper.parse(json);
              if(obj!=null){
                  if(obj.data==null || obj.data.size()==0){
                      obj.isSuccess=false;
                      obj.errorMessage='No data found for this email.';                    
                  }
                  else if(obj.data.size()>1){
                      obj.hasMoreThanOneAccount=true;
                      obj.isSuccess=false;
                      obj.errorMessage='More than one accounts found.';
                  }
                  else if(obj.data[0].contacts==null || obj.data[0].contacts.size()>1){
                      obj.hasMoreThanOneContact=true;
                      obj.isSuccess=false;
                      obj.errorMessage='More than one accounts found.';
                  }
                  else{
                      obj.hasMoreThanOneAccount=false;
                      obj.hasMoreThanOneContact=false;
                      obj.isSuccess=true;
                      obj.errorMessage='';                    
                  }                
              }
              else{
                  obj=new CCAccountWrapper();
                  obj.isSuccess=false;
                  obj.errorMessage='No data found for this email.';
              }
          }
          else{
                obj=new CCAccountWrapper();
                obj.isSuccess=false;
                obj.errorMessage=res.getStatusCode()+' '+res.getBody();          
          }          
        }
        else{
              obj=new CCAccountWrapper();
              obj.isSuccess=false;
              obj.errorMessage='Please provide valid email.';          
        }
        return obj;
    }   
    
    public static void sendContactAuthorizedIdentityChanged(Set<Id> conId){ 
        if(conId != null && !conId.isEmpty()){
        List<Contact> lstCon = [select Id,AccountId from Contact where Id In: conId];
       String strTemplate='{';
         strTemplate+='"topic":"customer",';
         strTemplate+='"event":"bulk_contact_state_change",';
         strTemplate+='"context":{';
         strTemplate+='"contacts":[';
     strTemplate+='PLACEHOLDER';
         strTemplate+=']';
         strTemplate+='}';
         strTemplate+='}';   
       List<String> listContactsJSON=new List<String>();
       
       for (Contact con : lstCon){
          String contactJSON='{';
           contactJSON+='"contactId":"'+con.Id+'"'+',';
           contactJSON+='"customerAccountId":"'+con.AccountId+'"';
           contactJSON+='}';
           listContactsJSON.add(contactJSON);
           
         if(math.mod(listContactsJSON.size(),49)==0 || listContactsJSON.size()==lstCon.size()){                      
          String finalJSON=strTemplate.replace('PLACEHOLDER',String.join(listContactsJSON,','));                     
         
          HTTPRequest req = new HTTPRequest();
          req.setTimeout(120000);
	       req.setEndpoint('callout:'+getNamedCredentialName()+'/event-notifications-publisher/events');
	       req.setHeader('Authorization', '{!$Credential.Username} '+'{!$Credential.Password}');           
          req.setHeader('Content-Type','application/json;chartset=UTF-8');
          req.setMethod('POST');
          req.setBody(finalJSON);
          Http http = new Http();
          HttpResponse res ;
          if(Test.isRunningTest()){
          	res=new HttpResponse();
	        res.setHeader('Content-type', 'application/json');
	        res.setBody('{"test"}:"test"}');
	        res.setStatusCode(200);           	
          	
          }
          else
          {
         	res = http.send(req);
          }          
          system.debug('Response Code :'+res.getStatusCode());
          system.debug('Status : '+res.getStatus());
          System.debug('Response Body is :'+res.getBody());      
      }
       } 
    }
  }
 public static void sendCPUUserChanged(Set<Id> accId){ 
        if(accId != null && !accId.isEmpty()){
       // List<Account> lstAcc = [select Id from Account where Id In: accId];
        //system.debug('===lstAcc'+lstAcc);
         system.debug('===accId'+accId);
         String strTemplate='{';
         strTemplate+='"topic":"customer",';
         strTemplate+='"event":"customer_account_state_change",';
         strTemplate+='"context":{';
         strTemplate+='"customerAccountIds":[';
         strTemplate+='PLACEHOLDER';
         strTemplate+=']';
         strTemplate+='}';
         strTemplate+='}'; 
         List<String> listAccountJSON=new List<String>();
       for (Id acc : accId){
           String accountJSON='"'+acc+'"';
           listAccountJSON.add(accountJSON);
       }   
        system.debug('listAccountJSON : '+ listAccountJSON);
        // if(math.mod(listAccountJSON.size(),49)==0 || listAccountJSON.size()==lstAcc.size()){                      
          String finalJSON=strTemplate.replace('PLACEHOLDER',String.join(listAccountJSON,','));                     
           system.debug('finalJSON : '+ finalJSON);
          HTTPRequest req = new HTTPRequest();
          req.setTimeout(120000);
	      req.setEndpoint('callout:'+getNamedCredentialName()+'/event-notifications-publisher/events');
	      req.setHeader('Authorization', '{!$Credential.Username} '+'{!$Credential.Password}');       
          req.setHeader('Content-Type','application/json;chartset=UTF-8');
          req.setMethod('POST');
          req.setBody(finalJSON);
          Http http = new Http();
          HttpResponse res;
          if(Test.isRunningTest()){
          	res=new HttpResponse();
	        res.setHeader('Content-type', 'application/json');
	        res.setBody('{"test"}:"test"}');
	        res.setStatusCode(200);           	
          }
          else
          {
         	res = http.send(req);
          }
          system.debug('Response Code :'+res.getStatusCode());
          system.debug('Status : '+res.getStatus());
          System.debug('Response Body is :'+res.getBody());      
      
    //} 
   }
  }
			
	private static String getNamedCredentialName(){
		String namedCredentialName='BIZTECH_API_SANDBOX';
		String sandboxName=CC_AVA_Util.getSandboxName();
		if(sandboxName=='prod'){
			namedCredentialName='BIZTECH_API_PRODUCTION';
		}
		return namedCredentialName;
	}
}