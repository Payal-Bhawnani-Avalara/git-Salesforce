public class ContactTriggerHandler extends TriggerHandler {
	
	
	//Trigger Handler Methods
    protected override void beforeInsert(){
    		beforeInsertUpdate();
    }

    protected override void beforeUpdate(){
    		beforeInsertUpdate();
    }

    /*
    protected override void beforeDelete(){}

  	protected override void afterInsert(){}

    private void beforeInsertUpdate(){} 

  	protected override void afterDelete(){}

  	protected override void afterUndelete(){}
	*/
    //Helper Methods
    public void beforeInsertUpdate(){
    		//Get partner rep email of all contacts where partner is not populated 
    		Set<String> setPartnerContactEmails=new Set<String>();
    		Set<Id> accountIdContactOnwerUpdate = new Set<ID>();
    		String EloquaAvalaraCaseSafeID='';
        EloquaAvalaraCaseSafeID =KeyPairValue__c.getInstance('EloquaAvalaraCaseSafeID').Values__c;  
        for(Contact c:(List<Contact>)Trigger.new){
        		c.Partner_Connector_Assigned_Rep__c=null;
        		if(c.Channel_Partner_Name__c!=null){
        		  c.Prior_Channel_Partner_Name_Change_Date__c = System.today();
        		 }
            if(
            		c.Channel_Partner_Name__c==null && 
            		c.Channel_Partner_Sales_Rep__c==null && 
            		String.isNotBlank(c.Partner_Rep_Email__c) && 
            		(Trigger.isInsert || (Trigger.isUpdate && c.Partner_Rep_Email__c.equalsIgnoreCase(((Contact)Trigger.oldMap.get(c.Id)).Partner_Rep_Email__c)==false))
            		){
            		setPartnerContactEmails.add(c.Partner_Rep_Email__c.trim());
            }
              //https://jira.avalara.com/browse/IBST-8008
             //Devloper : Payal Bhawnani 01/23/2018
            if(!LeadTriggerHandler.isLeadConverted && Trigger.isUpdate ){
	        	 
	        	  	 Contact oldCon = (Contact)trigger.oldMap.get(c.Id);
	        	     if(c.ContactStatus__c != oldCon.ContactStatus__c && (c.ContactStatus__c =='Working' || c.Cadence_Stage__c == 'Working' )) {
	        	     	c.Status_Change_Date_Working__c = system.now();
	        	     }
	        	  
	        }  
            // Contact oldCon  = (Contact)trigger.oldMap.get(c.Id);
           if(c.accountid != null ){  
              accountIdContactOnwerUpdate.add(c.AccountId);
          }    
        }
        //get most recent contact where email match with partner rep email
        //if(setPartnerContactEmails.size()>0){
        Set<Id> partnerIDs=new Set<Id>();
        Set<Id> connectorIDs=new Set<Id>();        
        Map<String,Contact> mapPartnerContacts=new Map<String,Contact>();
        	for(Contact c:[Select Id,AccountId,Email From Contact 
        						Where Email!=null AND AccountId!=null AND Email=:setPartnerContactEmails 
        						Order By CreatedDate DESC]){
				String key=c.Email.toLowerCase();
				if(!mapPartnerContacts.containsKey(key)){
        				mapPartnerContacts.put(key,c);
				}
        		}
	        for(Contact c:(List<Contact>)Trigger.new){
	            if(
	            		c.Channel_Partner_Name__c==null && 
	            		c.Channel_Partner_Sales_Rep__c==null && 
	            		String.isNotBlank(c.Partner_Rep_Email__c) &&
	            		mapPartnerContacts.containsKey(c.Partner_Rep_Email__c.toLowerCase())
	            		){
		            		Contact con=mapPartnerContacts.get(c.Partner_Rep_Email__c.toLowerCase());
		            		c.Channel_Partner_Name__c=con.AccountId;
		            		c.Channel_Partner_Sales_Rep__c=con.Id;
		            		c.Prior_Channel_Partner_Name_Change_Date__c = System.today();
	            		}
	            		else if(
			            		c.Channel_Partner_Name__c==null && 
			            		c.Channel_Partner_Sales_Rep__c==null && 
			            		String.isNotBlank(c.Partner_Rep_Email__c) && 
			            		(Trigger.isInsert || (Trigger.isUpdate && c.Partner_Rep_Email__c.equalsIgnoreCase(((Contact)Trigger.oldMap.get(c.Id)).Partner_Rep_Email__c)==false))
			            		){
				            		if(c.Partner_Contact_Not_Found_Email_Sent__c==null){
				            			c.Partner_Contact_Not_Found_Email_Sent__c=0;
				            		}
				            		c.Partner_Contact_Not_Found_Email_Sent__c+=1;		 	            			
			            		}
            		if(c.Channel_Partner_Name__c!=null && c.Contact_Connector__c!=null){
            			partnerIDs.add(c.Channel_Partner_Name__c);
            			connectorIDs.add(c.Contact_Connector__c);
            		}
            		//https://jira.avalara.com/browse/IBST-7371
                //Devloper : Payal Bhawnani 02/20/2018
            		if(c.Prior_Channel_Partner_Name_Change_Date__c != null && Trigger.isUpdate  ){
                   Integer monthsBetween = c.Prior_Channel_Partner_Name_Change_Date__c.monthsBetween(system.today());
           	       if(c.Channel_Partner_Name__c!=null &&  c.Channel_Partner_Name__c != ((Contact)Trigger.oldMap.get(c.Id)).Channel_Partner_Name__c && monthsBetween>=6 && system.UserInfo.getUserId() ==EloquaAvalaraCaseSafeID){
           	         c.Prior_Channel_Partner_Name_Change_Date__c = System.today();
           	         c.PriorChannelPartnerName__c =  ((Contact)Trigger.oldMap.get(c.Id)).Channel_Partner_Name__c ;
                 	}
           	    else if(c.Channel_Partner_Name__c!=null && monthsBetween <6 && c.Channel_Partner_Name__c != ((Contact)Trigger.oldMap.get(c.Id)).Channel_Partner_Name__c&& system.UserInfo.getUserId() ==EloquaAvalaraCaseSafeID){
           	         c.ChangedChannelPartnerName__c= c.Channel_Partner_Name__c;
           	         c.Channel_Partner_Name__c = ((Contact)Trigger.oldMap.get(c.Id)).Channel_Partner_Name__c;
           	         c.Channel_Partner_Name_Update_6__c = true;
           	       }else if (c.Channel_Partner_Name__c!=null &&  c.Channel_Partner_Name__c != ((Contact)Trigger.oldMap.get(c.Id)).Channel_Partner_Name__c ){
           	          c.Prior_Channel_Partner_Name_Change_Date__c = System.today();
           	          c.PriorChannelPartnerName__c =  ((Contact)Trigger.oldMap.get(c.Id)).Channel_Partner_Name__c ;
           	       }
                 }			            		
	        } 
	        if(partnerIDs.size()>0){
	        		Map<String,Id> mapResellingPartnerRep=new Map<String,Id>();
	        		for(Reselling_Partner__c rp:[Select Id,Assigned_Sales_Rep__c,Reselling_Partner__c,Connector__c 
	        									From Reselling_Partner__c 
	        									Where Assigned_Sales_Rep__c!=null AND Reselling_Partner__c=:partnerIDs AND Connector__c=:connectorIDs]){
	        			mapResellingPartnerRep.put(''+rp.Reselling_Partner__c+rp.Connector__c,rp.Assigned_Sales_Rep__c);
	        		}
	        		for(Contact c:(List<Contact>)Trigger.new){
	        			
	        			if(c.Channel_Partner_Name__c!=null && c.Contact_Connector__c!=null){
	        				c.Partner_Connector_Assigned_Rep__c=mapResellingPartnerRep.get(''+c.Channel_Partner_Name__c+c.Contact_Connector__c);
	        			}
	        		}
	        }
	     //Update Contact owner same as account owner
         if(accountIdContactOnwerUpdate.size()>0){
          	Map<Id,Account> mapAccountIDs=new Map<Id,Account>([Select Id,OwnerId,ActiveCustomer__c,Owner.ProfileId From Account 
          													Where Id=:accountIdContactOnwerUpdate AND ActiveCustomer__c = true  
          													AND Owner.ProfileId IN ('00e400000017J9dAAE','00e400000017BsLAAU','00e33000000x35xAAA')]);
	          for(Contact c:(List<Contact>)Trigger.new){
	            if( mapAccountIDs.containsKey(c.AccountId) && c.OwnerId != mapAccountIDs.get(c.AccountId).OwnerId){
	            		c.OwnerId = mapAccountIDs.get(c.AccountId).OwnerId;
	            }
	         }
       }
    }
    	protected override void afterUpdate(){
    	 Set<Id> contactId = new Set<Id>();
    	  for( Contact con : (List<Contact>)Trigger.new)
      {
          Contact oldCon = (Contact)trigger.oldMap.get(con.Id);
          if(con.Authorized_Identity_Contact__c != oldCon.Authorized_Identity_Contact__c ){
                    contactId.add(con.Id);
          }
         /* if(contactId.size() > 100){
           con.addError('More than 100 Contacts are updated');
           return;
          }*/
      }     
      if(contactId.size() > 0 && contactId.size() <= 100 && !System.isFuture() && !System.isBatch() && !System.isScheduled()){
      	// future method call
            sendFutureContactAuthorizedIdentityChanged(contactId);
        }
    	 }  
    	 
    @future(callout=true)
    	public static void sendFutureContactAuthorizedIdentityChanged(Set<Id> conId){
    	  CC_AVA_BizTech_API.sendContactAuthorizedIdentityChanged(conId);
    	}
    	 //CC_AVA_BizTech_API.sendContactAuthorizedIdentityChanged(contactId);
}