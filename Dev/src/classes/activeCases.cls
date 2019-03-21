public with sharing class activeCases {
   // ApexPages.StandardSetController must be instantiated 
      // for standard list controllers 
    
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
	                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
	                	[Select Id, Age_Bucket__c, Account.Name/*,Account.Latitude__c,Account.Longitude__c*/,Subject from Case where  IsClosed=False and (Owner.Name <> 'Delete') AND (RecordType.Name NOT IN ('CAM Case', 'Feedback Form', 'NPS Response'))]));
            }
            setCon.setPageSize(2000);
            return setCon;
        }
        set;
    }

    // Initialize setCon and return a list of records 
    
    public List<Case> getCases() {
         return (List<Case>) setCon.getRecords();
    }


}