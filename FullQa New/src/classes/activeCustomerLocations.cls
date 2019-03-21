public with sharing class activeCustomerLocations {
     // ApexPages.StandardSetController must be instantiated 
      // for standard list controllers 
    
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
            	 String ownerFilter = ApexPages.currentPage().getParameters().get('owner');
            	string strQuery='select id,name,latitude__c, longitude__c, type__c, Owner.LastName from Account  where ActiveCustomer__c=TRUE and Owner.LastName=\''+ ownerFilter+'\' and latitude__c != null';
	                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(strQuery));
            }
            setCon.setPageSize(2000);
            return setCon;
        }
        set;
    }

    // Initialize setCon and return a list of records 
    
    public List<Account> getAccounts() {
         return (List<Account>) setCon.getRecords();
    }
}