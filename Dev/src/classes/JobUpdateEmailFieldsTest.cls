@isTest
private class JobUpdateEmailFieldsTest {

    static testMethod void testEmailFieldUpdate() {
        /*ObjectEmailField__mdt o=new ObjectEmailField__mdt(
        														Name='Contact',
        														DeveloperName='Contact',
        														Object_API_Name__c='Contact',
        														Batch_Size__c=50,
        														Email_Field_API_Name__c='Email',
        														Exclude_Email_Ends_With__c='@avalara.co',
        														Exclude_User_ID__c='',
        														ByPassTrigger__c='ContactTriggerHandler');*/
        //insert o;
            //Create partner account
        Id partnerAccountRecordTypeId=[select id From RecordType Where sObjectType='Account' and DeveloperName='Partner_Certification' limit 1].Id;
        Account partnerAccount=TestUtil.createAccount(partnerAccountRecordTypeId,1,true)[0];
        Contact partnerContact=TestUtil.createContact(partnerAccount.Id,1,false)[0];
        partnerContact.Email='partnercontact@example.com';
        partnerContact.Partner_Rep_Email__c='example@avalara.com';
        insert partnerContact;        
        Test.startTest();
        JobSandboxPostRefresh j=new JobSandboxPostRefresh();
        j.runApexClass(null);	
        
        DateTime dt=Datetime.now();
		String hour = String.valueOf(dt.hour()); 
		String min = String.valueOf(dt.addMinutes(2).minute()); 
		String ss = String.valueOf(dt.second());
		String year = String.valueOf(dt.year());
		String month = String.valueOf(dt.month() ); 
		String day = String.valueOf(dt.day());		
		//parse to cron expression
		String nextFireTime = ss + ' ' + min + ' ' + hour + ' ' + day +' '+month+' ? ' + year;
		
		JobUpdateEmailFields s = new JobUpdateEmailFields('Select id from User limit 0',null,null); 
		System.schedule('JobUpdateEmailFields Test Started At ' + String.valueOf(Datetime.now()), nextFireTime, s);          
        
        Test.stopTest();
        partnerContact=[Select Id,Email,Partner_Rep_Email__c From Contact Where Id=:partnerContact.Id];
        System.assertEquals(partnerContact.Partner_Rep_Email__c,'example@avalara.com');
        if([Select isSandbox from Organization].isSandbox){
        		System.assertEquals(partnerContact.Email,'partnercontact=example.com@example.com');
        }
        else{
        		System.assertEquals(partnerContact.Email,'partnercontact=example.com@example.com');	
        }
    }
}