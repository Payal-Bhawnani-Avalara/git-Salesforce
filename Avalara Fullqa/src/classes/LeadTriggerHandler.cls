public class LeadTriggerHandler extends TriggerHandler {
	//https://jira.avalara.com/browse/IBST-8008
    public static boolean isLeadConverted= false;
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

    protected override void afterDelete(){}

    protected override void afterUndelete(){}
    */
   //Helper Methods
  //https://jira.avalara.com/browse/SFCOM-8722?filter=-1
    public void beforeInsertUpdate(){
    		//Get partner rep email of all leads where partner is not populated 
    		Set<String> setPartnerContactEmails=new Set<String>();
    		String EloquaAvalaraCaseSafeID='';
        EloquaAvalaraCaseSafeID =KeyPairValue__c.getInstance('EloquaAvalaraCaseSafeID').Values__c;  
        for(Lead l:(List<Lead>)Trigger.new){
        	l.Partner_Connector_Assigned_Rep__c=null;
            if(l.PartnerName__c!=null){
               l.Prior_Channel_Partner_Name_Change_Date__c = System.today();  
            }
            if(
            		l.PartnerName__c==null && 
            		l.Portal_Contact__c==null && 
            		String.isNotBlank(l.Partner_Rep_Email__c) && 
            		(Trigger.isInsert || (Trigger.isUpdate && l.Partner_Rep_Email__c.equalsIgnoreCase(((Lead)Trigger.oldMap.get(l.Id)).Partner_Rep_Email__c)==false))
            		){
            		setPartnerContactEmails.add(l.Partner_Rep_Email__c.trim());
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
	        for(Lead l:(List<Lead>)Trigger.new){
	            if(
	            		String.isNotBlank(l.Partner_Rep_Email__c) &&
	            		mapPartnerContacts.containsKey(l.Partner_Rep_Email__c.toLowerCase())
	            		){
		            		Contact c=mapPartnerContacts.get(l.Partner_Rep_Email__c.toLowerCase());
		            		l.PartnerName__c=c.AccountId;
		            		l.Portal_Contact__c=c.Id;
		            		l.Prior_Channel_Partner_Name_Change_Date__c = System.today();
	            		}
	            		else if(
			            		String.isNotBlank(l.Partner_Rep_Email__c) && 
			            		(Trigger.isInsert || (Trigger.isUpdate && l.Partner_Rep_Email__c.equalsIgnoreCase(((Lead)Trigger.oldMap.get(l.Id)).Partner_Rep_Email__c)==false))
			            		){
				            		if(l.Partner_Contact_Not_Found_Email_Sent__c==null){
				            			l.Partner_Contact_Not_Found_Email_Sent__c=0;
				            		}
				            		l.Partner_Contact_Not_Found_Email_Sent__c+=1;			            			
			            		}
            		if(l.PartnerName__c!=null && l.Connector__c!=null){
            			partnerIDs.add(l.PartnerName__c);
            			connectorIDs.add(l.Connector__c);
            		}
            	    //https://jira.avalara.com/browse/IBST-7371
                //Devloper : Payal Bhawnani 02/20/2018
            		if(l.Prior_Channel_Partner_Name_Change_Date__c != null && Trigger.isUpdate  ){
                   Integer monthsBetween = l.Prior_Channel_Partner_Name_Change_Date__c.monthsBetween(system.today());
           	       if(l.PartnerName__c!=null &&  l.PartnerName__c != ((Lead)Trigger.oldMap.get(l.Id)).PartnerName__c && monthsBetween>=6 && system.UserInfo.getUserId() ==EloquaAvalaraCaseSafeID){
           	         l.Prior_Channel_Partner_Name_Change_Date__c = System.today();
           	         l.PriorChannelPartnerName__c =  ((Lead)Trigger.oldMap.get(l.Id)).PartnerName__c ;
                 	}
           	    else if(l.PartnerName__c!=null && monthsBetween <6 && l.PartnerName__c != ((Lead)Trigger.oldMap.get(l.Id)).PartnerName__c&& system.UserInfo.getUserId() ==EloquaAvalaraCaseSafeID){
           	         l.ChangedChannelPartnerName__c= l.PartnerName__c;
           	         l.PartnerName__c = ((Lead)Trigger.oldMap.get(l.Id)).PartnerName__c;
           	         l.Channel_Partner_Name_Update_6__c = true;
           	       }else if(l.PartnerName__c!=null &&  l.PartnerName__c != ((Lead)Trigger.oldMap.get(l.Id)).PartnerName__c ){
           	         l.Prior_Channel_Partner_Name_Change_Date__c = System.today();
           	         l.PriorChannelPartnerName__c =  ((Lead)Trigger.oldMap.get(l.Id)).PartnerName__c ;
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
	        		for(Lead l:(List<Lead>)Trigger.new){
	        			if(l.PartnerName__c!=null && l.Connector__c!=null){
	        				l.Partner_Connector_Assigned_Rep__c=mapResellingPartnerRep.get(''+l.PartnerName__c+l.Connector__c);
	        			}
	        		}
	        }	                		
        //}
    }
     //https://jira.avalara.com/browse/IBST-8008
     //Devloper : Payal Bhawnani 01/23/2018
     protected override void afterUpdate(){
      for(Lead l:(List<Lead>)Trigger.new) 
       {
          if (l.IsConverted)
          {
            isLeadConverted = true;
          } 
       }
     }  
}