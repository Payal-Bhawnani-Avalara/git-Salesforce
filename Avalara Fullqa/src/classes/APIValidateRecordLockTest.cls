@isTest
private class APIValidateRecordLockTest {
	private static Account a;
	private static Contact c;
	private static Opportunity o;
	private static CameleonCPQ__Quote__c cpq;
    static testMethod void testvalidateRecordLock() {
    		APIValidateRecordLock.SkipForUnitTest=false;
		List<ObjectFieldLock__mdt> listObjMDT=[Select Id,Error_Message__c,Lockable_Fields__c,Never_Editable_Fields__c,Notes__c,
												Object_Name__c,User_Special_Permissions__c ,Other_Fields__c,Always_Editable_Fields__c,
												Locked_Field__c,Was_Record_Locked_Field__c,Exclude_User_IDs__c,EDW_Freeze_Field__c,
												Always_Allow_Permission__c
												From ObjectFieldLock__mdt 
												Where Object_Name__c='Opportunity' AND Is_Active__c=true];
		ObjectFieldLock__mdt objMDT;
		if(listObjMDT!=null && listObjMDT.size()==1){
			objMDT=listObjMDT[0];
		}    	
    		User ztbuyAPIUser=[Select id from User Where Id='00533000003RbvNAAS'];
    		Finance_Operations_Close_Event__c foce=new Finance_Operations_Close_Event__c(Booking_Period_Start_Date__c=Date.today().addDays(-10),Booking_Period_End_Date__c=Date.today().addDays(10));
    		insert foce;
   	 	Test.startTest();
	  	//Create an account
    	  	 Id emeaAccountTypeId=[Select Id from RecordType where DeveloperName='EMEA_Account' limit 1].Id;
      	 a =TestUtil.createAccount(emeaAccountTypeId,1,true)[0];
       	//create a contact 
      	 c =TestUtil.createContact(a.Id,5,true)[0];
      	 //create Opportunity
      	 Id defaultOppRecTypeId=[Select Id from RecordType where DeveloperName='Default_OppRecType' limit 1].Id;
      	 o = TestUtil.createOpportunity(a.id,defaultOppRecTypeId,1,true)[0];
      	 //create pros quote
      	 cpq = TestUtil.createProsQuote(a.id,o.id,c.id,1,false)[0];
      	// cpq.OPStatus__c = Constants.PROS_QUOTE_STATUS_COMPLETE;
      	 insert cpq;
      	 System.runAs(ztbuyAPIUser){
	      	 cpq.SentToZBillingDate__c=Date.today();
	      	 update cpq;
      	 }

      	 //Check if user dont have permissions and record is locked.
       	try{
         	   update o;
        	}
        catch(Exception e){
       	   Boolean expectedExceptionThrown =  e.getMessage().contains(objMDT.Error_Message__c) ? true : false;
           System.AssertEquals(expectedExceptionThrown, true);
        }
        //Give unlock permissions to user
        User currentUser=new User(Id=UserInfo.getUserId(),Special_Permission__c='CanUpdateLockedOpportunities');
        update currentUser;
        //UnLock Opportunity
        o.Locked__c=false;
        update o;
        //Now Opportunity is locked. Login as another user and try to update
        User salesUser=[Select id from User Where Profile.Name='Ava2 Sales Person' AND  IsActive=true limit 1];
      	 System.runAs(salesUser){
      	 	o.Locked__c=true;
	       	try{
	         	   update o;
	        	}
	        catch(Exception e){
	       	   Boolean expectedExceptionThrown =  e.getMessage().contains(objMDT.Error_Message__c) ? true : false;
	           System.AssertEquals(expectedExceptionThrown, true);
	        }
      	 } 
		//lock again and then try to unlock as a user who dont have permissions
        o.Locked__c=true;
        update o;		
      	 System.runAs(salesUser){
      	 	o.Locked__c=false;
	       	try{
	         	   update o;
	        	}
	        catch(Exception e){
	       	   Boolean expectedExceptionThrown =  e.getMessage().contains(objMDT.Error_Message__c) ? true : false;
	           System.AssertEquals(expectedExceptionThrown, true);
	        }
      	 }   
      	 //unlock again and update never editable fields
        o.Locked__c=false;
        update o;
        if(String.isNotBlank(objMDT.Never_Editable_Fields__c)){
        		List<String> listFields=objMDT.Never_Editable_Fields__c.split(',');
        		Opportunity updateO=new Opportunity(Id=o.Id);
        		for(String field:listFields){
        			updateO.put(field,null);
        		}
	       	try{
	         	   update updateO;
	        	}
	        catch(Exception e){
	       	   Boolean expectedExceptionThrown =  e.getMessage().contains(objMDT.Error_Message__c) ? true : false;
	           System.AssertEquals(expectedExceptionThrown, true);
	        }        		
        }      
        //freeze all data
        foce.EDW_Booking_Freeze_Date__c=DateTime.now();
        update foce;
  
        	             	        
      	Test.stopTest();
        //unlock after freeze
       	try{
	        o.Locked__c=false;
	        update o; 
        	}
        catch(Exception e){
       	   Boolean expectedExceptionThrown =  e.getMessage().contains(objMDT.Error_Message__c) ? true : false;
           System.AssertEquals(expectedExceptionThrown, true);
        }          
		currentUser.Special_Permission__c='CanUpdateFrozenOpportunity';
        update currentUser;     
        o.Locked__c=false;
        update o;               
    }
}