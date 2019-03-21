trigger CreatePartnerNumberIfNecessary on Account (before update) {
for (Account acct : Trigger.new) 
    {
       if (acct.PartnerNumber__c==null && (acct.Partner_Contract_Signed_Date__c !=null || acct.DSP_Agreement_Signed__c!=null))
       {
          acct.PartnerNumber__c=PartnerNumberGenerator.PartnerNumberNew();
          acct.ActivePartner__c=TRUE;

       }
    }         
}