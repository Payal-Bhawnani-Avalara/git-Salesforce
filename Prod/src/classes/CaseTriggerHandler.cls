public class CaseTriggerHandler extends TriggerHandler {

    //Trigger Handler Methods
    protected override void beforeInsert(){
            beforeInsertUpdate();
    }

    protected override void beforeUpdate(){
            beforeInsertUpdate();
    }

  
  //  protected override void beforeDelete(){}

    protected override void afterInsert(){
            afterInsertUpdate();
    }

    /*protected override void afterUpdate(){
    		afterInsertUpdate();
    }*/

    //protected override void afterDelete(){}

    //protected override void afterUndelete(){}
    
    //Helper Methods
  
    public void beforeInsertUpdate(){
    	    //TECHDEBT: Payal 11/14/2017
        //This code will check VAT number IBST-6148
         /*Map<String,VATNumberRegex__c> vatNumber = VATNumberRegex__c.getAll();
         Id mrsRegistrationCountryAccountTypeId=[Select Id from RecordType where DeveloperName='MRS_Registration_Country' limit 1].Id;
	   	  for(Case c : (List<Case>)Trigger.new ){
	   	    if(
	   	      String.isNotBlank(c.EMEA_Country__c) && 
     	      vatNumber.containsKey(c.EMEA_Country__c) && 
     	      String.isNotBlank(c.VAT_Number__c)
     	      && c.RecordTypeId==mrsRegistrationCountryAccountTypeId){
		   	       c.VAT_Number_Format_Status__c = Utility.vatNumberVerification(c.EMEA_Country__c,c.VAT_Number__c,c.VAT_Number_Format_Status__c);  
	   	      }
        }*/
        //TECHDEBT: NAVEES 9/14/2017
        //This code will link case with account. This code is not needed if we can make 
        //PROD_AvaTax_Account__c an external id. right now there are lots of duplicates and nulls 
        
        //Find all cases where accountid is null and Treasury_Account_ID__c is populated
        Id treasuryServiceCaseId=[select Id from RecordType where DeveloperName='Treasury_Service_Case'].Id;
        Set<String> setTreasuryAccountIDs=new Set<String>();
        for(Case c:(List<Case>)Trigger.new){
            if(c.RecordTypeId==treasuryServiceCaseId && c.AccountId==null && String.isNotBlank(c.Treasury_Account_ID__c)){
                setTreasuryAccountIDs.add(c.Treasury_Account_ID__c);
            }
        }
        //Find all accounts where PROD_AvaTax_Account__c is same as case Treasury_Account_ID__c
        if(setTreasuryAccountIDs.size()>0){
            Map<String,Account> mapAccountIDs=new Map<String,Account>();
            for(Account a:[Select Id,PROD_AvaTax_Account__c, 
                                (Select Id From Contacts Where ComplianceContact__c=true and LeftCompany__c=false Order By CreatedDate Desc limit 1) 
                                From Account Where PROD_AvaTax_Account__c=:setTreasuryAccountIDs]){
                mapAccountIDs.put(a.PROD_AvaTax_Account__c.toLowerCase(),a);
            }
            //(Select Id, ParentId, MemberId, TeamTemplateMemberId, TeamRoleId From TeamMembers) 
            //Id complianceID=[select Id from CaseTeamRole Where Name='Compliance'].Id;
            //List<CaseTeamMember> listCaseTeamMembers=new List<CaseTeamMember>();
            for(Case c:(List<Case>)Trigger.new){
                if(c.RecordTypeId==treasuryServiceCaseId && c.AccountId==null && String.isNotBlank(c.Treasury_Account_ID__c) 
                   && mapAccountIDs.containsKey(c.Treasury_Account_ID__c.toLowerCase())){
                    c.AccountId=mapAccountIDs.get(c.Treasury_Account_ID__c.toLowerCase()).Id;
                    if(c.ContactId==null && mapAccountIDs.get(c.Treasury_Account_ID__c.toLowerCase()).Contacts.size()==1){
                            c.ContactId=mapAccountIDs.get(c.Treasury_Account_ID__c.toLowerCase()).Contacts[0].Id;
                           /* for(Contact con:mapAccountIDs.get(c.Treasury_Account_ID__c.toLowerCase()).Contacts){
                                    listCaseTeamMembers.add(new CaseTeamMember(ParentId = c.Id, MemberId = con.Id, TeamRoleId = complianceID));
                            }*/
                    }
                }
            }  
            //database.insert(listCaseTeamMembers,false);          
        }
       
    }
    public void afterInsertUpdate(){
        Id treasuryServiceCaseId=[select Id from RecordType where DeveloperName='Treasury_Service_Case'].Id;
        Set<Id> treasuryAccountIDs=new Set<Id>();
        Set<Id> caseAccountIDs=new Set<Id>();
        Map<Id,Account> mapAccounts=new Map<Id,Account>();
        for(Case c:(List<Case>)Trigger.new){
        		if(c.AccountId!=null){
        			caseAccountIDs.add(c.AccountId);
        			mapAccounts.put(c.AccountId,new Account(Id=c.AccountId,Open_Cases__c=0));
        		}
            if(c.RecordTypeId==treasuryServiceCaseId && c.AccountId!=null){
                treasuryAccountIDs.add(c.AccountId);
            }
        }
        if(treasuryAccountIDs.size()>0){
                List<CaseTeamMember> listCaseTeamMembers=new List<CaseTeamMember>();
                Id complianceID=[select Id from CaseTeamRole Where Name='Compliance'].Id;
            Map<String,Account> mapAccountIDs=new Map<String,Account>();
            for(Account a:[Select Id, (Select Id From Contacts Where ComplianceContact__c=true) 
                                From Account Where Id=:treasuryAccountIDs]){
                mapAccountIDs.put(a.Id,a);
            }  
            for(Case c:(List<Case>)Trigger.new){
                if(c.RecordTypeId==treasuryServiceCaseId && c.AccountId!=null){
                    for(Contact con:mapAccountIDs.get(c.AccountId).Contacts){
                            listCaseTeamMembers.add(new CaseTeamMember(ParentId = c.Id, MemberId = con.Id, TeamRoleId = complianceID));
                    }
                }
            }
            database.insert(listCaseTeamMembers,false);                         
        }
		//AggregateResult[] groupedResults= [select AccountId,count(Id) OpenCases From Case Where IsClosed=false AND AccountId=:caseAccountIDs group by AccountId]; 
		
		for (AggregateResult ar : [select AccountId,count(Id) OpenCases From Case Where IsClosed=false AND AccountId=:caseAccountIDs group by AccountId]){
			mapAccounts.put(String.valueOf(ar.get('AccountId')),new Account(Id=String.ValueOf(ar.get('AccountId')),Open_Cases__c=Integer.valueOf(ar.get('OpenCases'))));
		}
		//by pass account trigger 
		TriggerHandler.bypass('CaseTriggerHandler');
		TriggerHandler.bypass('AccountTriggerHandler');
		database.update(mapAccounts.values(),false);
		TriggerHandler.clearBypass('CaseTriggerHandler');
		TriggerHandler.clearBypass('AccountTriggerHandler');		              
    }
    public static boolean b=false;
       //A boolean that is set and then checked at the beginning of update triggers to be sure they only execute once
        public static  void  recursiveHelper (Boolean tempBool){
          b=tempBool;
        }
    protected override void afterUpdate(){
        //This code will Send Outbout call to Boomi API if case status change to Deprovisioning
      String ZTBuyAPICaseSafeID='';
      ZTBuyAPICaseSafeID =KeyPairValue__c.getInstance('ZTBuyAPICaseSafeID').Values__c;  
      Set<Id> caseId = new Set<Id>();
      Set<Id> caseIdIIA = new Set<Id>();
          for( Case c : (List<Case>)Trigger.new)
      {
          Case oldCase = (Case)trigger.oldMap.get(c.Id);
          if(c.Approved_By_Billing__c==true && oldCase.Approved_By_Billing__c==false && c.Status == 'Confirmed' && String.isBlank(c.CNCL_by_Avalara__c)){
           //if(c.Related_Amendment_s__c != null && c.Related_Amendment_s__c != 'N/A'){
                    caseId.add(c.Id);
          //  }
          }
          //BATS-499
          if(String.isNotBlank(c.Invoice_Number__c) && String.isblank(oldCase.Invoice_Number__c)){
               caseIdIIA.add(c.id);
           }
          /*if(contactId.size() > 100){
           con.addError('More than 100 Contacts are updated');
           return;
          }*/
      }     
      if(caseId.size() > 0 && caseId.size() <= 100 && !System.isFuture() && !System.isBatch() && !System.isScheduled() && !b && system.UserInfo.getUserId() != ZTBuyAPICaseSafeID){
        // future method call
            sendFutureCaseStatusDeprovisioning(caseId);
            recursiveHelper(true);
        }
        //add queable also // Create new field to error on Batch class Large text box 
       if(caseIdIIA.size() > 0 && !System.isFuture() && !System.isBatch() && !System.isScheduled()){
         // future method call change it to batch method in try catch 
           // getInvoiceItems(caseIdIIA);
           if(caseIdIIA.size() > 0  && !System.isBatch() && !System.isFuture() && !System.isQueueable() && !System.isScheduled()){
		         JobCreateInvoiceItems job = new JobCreateInvoiceItems(caseIdIIA);
		         ID batchprocessid = Database.executeBatch(job,10); 
    	    }
        }
        afterInsertUpdate();
    }
   
    @future(callout=true)
        public static void sendFutureCaseStatusDeprovisioning(Set<Id> caseId){
          APIBoomi.sendCaseStatusDeprovisioning(caseId);
        }  
     /*@future(callout=true)
        public static void getInvoiceItems(Set<Id> caseIdIIA){
          APIZuora.getInvoiceLineItem(caseIdIIA);
        }  */
}