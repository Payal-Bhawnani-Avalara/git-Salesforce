@isTest
private class DG_DFR_Class_TEST {
	//private static Id LeadRT = '01240000000USth'; //Master Lead Record Type
	static{
	TestUtil t=new TestUtil();
	}
	static testMethod void DFR_LeadRatingChange_Test() {
		//Covers DFR_LeadRatingChanges and DFR_PopulateRecyledRejectedDate methods
		
    	test.startTest();
    	
    	set<Id> setLeadRecordTypeId = DG_DFR_Class.getLeadRecordTypeId();
		list<Id> listLeadRecordTypeId = new list<Id>(setLeadRecordTypeId);
    	
    	List<Lead> listLead = new List<Lead>();
			    
	    //Created as Suspect	
    	Lead l1 = new Lead(
	    	Status = 'Suspect',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'E');
	    
	    listLead.add(l1);
	    
	    //Created as Prospect
	    Lead l2 = new Lead(
	    	Status = 'Inquiry',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'C');
	    	listLead.add(l2);   
	    //Created as MQL
	    Lead lMQL = new Lead(
	    	Status = 'MQL',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'C');	
	    listLead.add(lMQL);    	
	    //Created as Rejected	
    	Lead l3 = new Lead(
	    	Status = 'Disqualified',
	    	OpportunitySubType__c = 'AvaTax',
	    	Disqualified_Date__c = date.today() - Integer.valueOf(System.Label.Rejected_Wait_Days) + 1,
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'C');
	    
	    listLead.add(l3);
	    
	    //Created as Recycled
	    Lead l4 = new Lead(
	    	Status = 'Nurture',
	    	OpportunitySubType__c = 'AvaTax',
	    	Nurture_Date__c = date.today() - Integer.valueOf(System.Label.Recycled_Wait_Days) + 1,
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'P');
	    
	    listLead.add(l4);
	    
	   	//Created as Prospect
	    Lead l5 = new Lead(
	    	Status = 'Working',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'C');
	    
	    database.insert(listLead, true);
	    
	    test.stopTest();
	    
	    l1.Rating = 'B';
	    l2.Rating = 'P';
	    l3.Rating = 'A';
	    l4.Rating = 'A';
	    
	    //database.update(listLead, true);
	}
	
	  
    static testMethod void DFR_LeadStatusChange_Test() {
    	//Covers DFR_LeadRatingChanges, CreateLeadDFR and DFR_LeadStatusChange methods
    	
    	test.startTest();
    	
    	set<Id> setLeadRecordTypeId = DG_DFR_Class.getLeadRecordTypeId();
		list<Id> listLeadRecordTypeId = new list<Id>(setLeadRecordTypeId);
    	
    	List<Lead> listLead = new List<Lead>();
			    
	    //Created as Suspect	
    	Lead s1 = new Lead(
	    	Status = 'Suspect',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'E');
	    
	    listLead.add(s1);
	    
	    //Created as Suspect
	    Lead s2 = new Lead(
	    	Status = 'Suspect',
	    	OpportunitySubType__c = 'AvaTax',
	        LeadSource = 'Other', 
	        RecordTypeId = listLeadRecordTypeId[0],
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'E');
	    
	    listLead.add(s2);
	    
	    //Created as Suspect
	    Lead s3 = new Lead(
	    	Status = 'Suspect',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST',  
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'E');
	    
	    listLead.add(s3);
	    
	    //Created as Suspect
	   	Lead s4 = new Lead(
	    	Status = 'Suspect',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST',  
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'E');
	    
	    listLead.add(s4);
	    
	    //Created as Prospect	
    	Lead i1 = new Lead(
	    	Status = 'Inquiry',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'C');
	    
	    listLead.add(i1);
	    
	    //Created as MQL	
    	Lead i2 = new Lead(
	    	Status = 'MQL',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'D');
	    
	    listLead.add(i2);
	    
	    //Created as Prospect	
    	Lead i3 = new Lead(
	    	Status = 'Suspect',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'D');
	    
	    listLead.add(i3);	
	    
	    //Created as Prospect	
    	Lead i4 = new Lead(
	    	Status = 'Suspect',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'D');
	    
	    listLead.add(i4);    
	    
	    
	   //Created as PQL	
    	Lead p1 = new Lead(
	    	Status = 'Suspect',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'P');
	    
	    listLead.add(p1);
	    
	    //Created as PQL	
    	Lead p2 = new Lead(
	    	Status = 'Suspect',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'P');
	    
	    listLead.add(p2);	
	    
	   //Created as PQL	
    	Lead p3 = new Lead(
	    	Status = 'Suspect',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'P');
	    
	    listLead.add(p3);	
	    
	    //Created as MQL	
    	Lead m1 = new Lead(
	    	Status = 'Suspect',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'A');
	    
	    listLead.add(m1);    
	    
	   //Created as MQL	
    	Lead m2 = new Lead(
	    	Status = 'Suspect',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'A');
	    
	    listLead.add(m2);
	    
	    //Created as Working	
    	Lead w1 = new Lead(
	    	Status = 'Working',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = Null);
	    
	    listLead.add(w1);	
	    	    
	    database.insert(listLead, true);	    
	            
        test.stopTest();
	    
	    s1.Rating = 'D'; //Suspect to Prospect
	    s2.Rating = 'P'; //Suspect to PQL
	    s3.Status = 'A'; //Suspect to MQL
	    s4.Status = 'Working'; //Suspect to Working
	    
	    i1.Rating = 'B'; //Prospect to PQL
	    i2.Rating = 'A'; //Prospect to MQL
	    i3.Status = 'Working'; //Prospect to Working
	    i4.Status = 'Nurture'; //Prospect to EOL

	    p1.Rating = 'A'; //PQL to MQL
	    p2.Status = 'Working'; //PQL to Working
	    p3.Status = 'Nurture'; //PQL to EOL
	    
	    m1.Status = 'Working'; //MQL to Working
	    m2.Status = 'Nurture'; //MQL to EOL

	    w1.Status = 'Nurture'; //Working to EOL
	    
	    //database.update(listLead, true);
    }
    
    static testMethod void DFR_OppCreationFromLead_TEST() {
    	test.startTest();
    	
    	set<Id> setLeadRecordTypeId = DG_DFR_Class.getLeadRecordTypeId();
		list<Id> listLeadRecordTypeId = new list<Id>(setLeadRecordTypeId);
    	
    	List<Lead> listLead = new List<Lead>();
			    
	    //Created as Suspect	
    	Lead l1 = new Lead(
	    	Status = 'Suspect',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'E');
	    
	    listLead.add(l1);
	    
	    //Created as Prospect
	    Lead l2 = new Lead(
	    	Status = 'Inquiry',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'D');
	    	
	    listLead.add(l2);
	    
	    //Created as PQL	
	    Lead l3 = new Lead(
	    	Status = 'Suspect',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'P');
	    
	    listLead.add(l3);
	    
	    //Created as MQL	
	    Lead l4 = new Lead(
	    	Status = 'Suspect',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'A');
	    
	    listLead.add(l4);
	    
	   	//Created as Working
	    Lead l5 = new Lead(
	    	Status = 'Working',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA');
	    
	    listLead.add(l5);
    	
    	try{
    		database.insert(listLead, false);
    	}catch(exception e){}
	    
	    test.stopTest();
	    
	    //Convert Lead from Suspect
	    LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
    	
		List<Database.LeadConvert> leadConverts = new List<Database.LeadConvert>();		
		
		for(Lead l : listLead){
			Database.LeadConvert lc = new database.LeadConvert();
	        lc.setLeadId(l.Id);
	        lc.setDoNotCreateOpportunity(false);		
	        lc.setConvertedStatus(convertStatus.MasterLabel);
	        leadConverts.add(lc);  
		}
		
		List<Database.LeadConvertResult> lcrList = Database.convertLead(leadConverts, false);
    }
    
	static testMethod void DFR_LostThenReOpen_Test() {
		
    	test.startTest();
    	
    	Account a = new Account(
	        Name = 'Test Company',
	        BillingCountry = 'USA',
	        BillingState = 'CA'
        );
        
        insert a;        
        	    
	    Contact c = new Contact(
			LastName = 'Test',
	        FirstName = 'Test',
	        Email = 'atest@test.net',
	        MailingCountry = 'USA',
	        MailingState = 'CA',
	        Opportunity_Sub_Type__c = 'AvaTax',
	        AccountId = a.id
        );
                        
        insert c;
        
        test.stopTest();
        
        Opportunity o = new Opportunity(
            Name = 'Test Opp', 
            AccountId = a.Id,
            StageName = 'MQL',
            CloseDate = System.today(),
            SubType__c = 'AvaTax',
            Opportunity_Contact_Source__c = c.id
        );
        
        insert o;        
        
        o.StageName = 'Closed Lost';
        o.ClosedLostReason__c = 'Pricing Issue';
        
        update o;
        
        o.StageName = 'MQL';
        
        update o;
        
	}
	
	static testMethod void DFR_OppCreationFromContact_TEST() {
    	test.startTest();
    	
    	set<Id> setLeadRecordTypeId = DG_DFR_Class.getLeadRecordTypeId();
		list<Id> listLeadRecordTypeId = new list<Id>(setLeadRecordTypeId);
    	
    	List<Lead> listLead = new List<Lead>();
			    
	    //Created as Suspect		    
    	Lead l1 = new Lead(
	    	Status = 'Suspect',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'E');
	    
	    listLead.add(l1);
	    
	    //Created as Prospect
	    Lead l2 = new Lead(
	    	Status = 'Inquiry',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'D');
	    	
	    listLead.add(l2);
	    
	   	//Created as PQL	
	    Lead l3 = new Lead(
	    	Status = 'Suspect',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'P');
	    
	    listLead.add(l3);
	    
	    //Created as MQL	
	    Lead l4 = new Lead(
	    	Status = 'MQL',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA',
	    	Rating = 'A');
	    
	    listLead.add(l4);
	    
	    //Created as Working
	    Lead l5 = new Lead(
	    	Status = 'Working',
	    	OpportunitySubType__c = 'AvaTax',
	    	RecordTypeId = listLeadRecordTypeId[0],
	        LeadSource = 'Other', 
	    	State ='CA', 
	    	Phone = '+1.213.111.1111', 
	    	LastName = 'TEST', 
	    	FirstName = 'TEST', 
	    	Company = 'Test Company',
	    	Email = 'atest@test.net', 
	    	Country = 'USA');
	    
	    listLead.add(l5);
    	
    	try{
    		database.insert(listLead, false);
    	}catch(exception e){}
	    
	    test.stopTest();
	    
	    //Convert Lead from Suspect
	    LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
    	
		List<Database.LeadConvert> leadConverts = new List<Database.LeadConvert>();		
		
		for(Lead l : listLead){
			Database.LeadConvert lc = new database.LeadConvert();
	        lc.setLeadId(l.Id);
	        lc.setDoNotCreateOpportunity(true);		
	        lc.setConvertedStatus(convertStatus.MasterLabel);
	        leadConverts.add(lc);  
		}
		
		List<Database.LeadConvertResult> lcrList = Database.convertLead(leadConverts, false);
		
		list<Opportunity> listOpp = new list<Opportunity>();
		
		for (Database.LeadConvertResult lcr : lcrList){
            Opportunity o = new Opportunity(
            Name = 'Test Opp', 
            AccountId = lcr.getAccountId(),
            StageName = 'MQL',
            CloseDate = System.today(),
            SubType__c = 'AvaTax',
            Opportunity_Contact_Source__c = lcr.getContactId());
            listOpp.add(o);
        }
        
        try{
        	database.insert(listOpp, false);
        }catch(exception e){}
        
        for(Opportunity o : listOpp){
        	o.StageName = 'Closed Won';
        }
        
        try{
        	database.update(listOpp, false);
        }catch(exception e){}
    }
    
    static testMethod void DFR_ContactStatusChange_Test() {
    	//Covers DFR_LeadRatingChanges, CreateLeadDFR and DFR_LeadStatusChange methods
    	
    	test.startTest();     
    	
    	Account a = new Account(
	        Name = 'test account a',
	        AccountNumber = 'TestAcct a',
	        BillingCountry = 'USA',
	        BillingState = 'CA'
        );
        
        insert a;
        
        List<Contact> listContact = new List<Contact>();
			    
	    //Created as Suspect	
    	Contact s1 = new Contact(
	    	ContactStatus__c = 'Suspect',
	    	Opportunity_Sub_Type__c = 'AvaTax',
			LastName = 'Test',
	        FirstName = 'Test',
	        Email = 'atest@test.net',
	        MailingCountry = 'USA',
	        MailingState = 'CA',
	        AccountId = a.id,
	    	Rating__c = 'E');
	    
	    listContact.add(s1);
	    
	    //Created as Suspect
	    Contact s2 = new Contact(
	    	ContactStatus__c = 'Suspect',
	    	Opportunity_Sub_Type__c = 'AvaTax',
			LastName = 'Test',
	        FirstName = 'Test',
	        Email = 'atest@test.net',
	        MailingCountry = 'USA',
	        MailingState = 'CA',
	        AccountId = a.id,
	    	Rating__c = 'E');
	    
	    listContact.add(s2);
	    
	    //Created as Suspect
	    Contact s3 = new Contact(
	    	ContactStatus__c = 'Suspect',
			Opportunity_Sub_Type__c = 'AvaTax',
			LastName = 'Test',
	        FirstName = 'Test',
	        Email = 'atest@test.net',
	        MailingCountry = 'USA',
	        MailingState = 'CA',
	        AccountId = a.id,
	    	Rating__c = 'E');
	    
	    listContact.add(s3);
	    
	    //Created as Suspect
	   	Contact s4 = new Contact(
	    	ContactStatus__c = 'Suspect',
	    	Opportunity_Sub_Type__c = 'AvaTax',
			LastName = 'Test',
	        FirstName = 'Test',
	        Email = 'atest@test.net',
	        MailingCountry = 'USA',
	        MailingState = 'CA',
	        AccountId = a.id,
	    	Rating__c = 'E');
	    
	    listContact.add(s4);
	    
	    //Created as Prospect	
    	Contact i1 = new Contact(
	    	ContactStatus__c = 'Suspect',
	    	Opportunity_Sub_Type__c = 'AvaTax',
			LastName = 'Test',
	        FirstName = 'Test',
	        Email = 'atest@test.net',
	        MailingCountry = 'USA',
	        MailingState = 'CA',
	        AccountId = a.id,
	    	Rating__c = 'D');
	    
	    listContact.add(i1);
	    
	    //Created as Prospect	
    	Contact i2 = new Contact(
	    	ContactStatus__c = 'Suspect',
	    	Opportunity_Sub_Type__c = 'AvaTax',
			LastName = 'Test',
	        FirstName = 'Test',
	        Email = 'atest@test.net',
	        MailingCountry = 'USA',
	        MailingState = 'CA',
	        AccountId = a.id,
	    	Rating__c = 'D');
	    
	    listContact.add(i2);
	    
	    //Created as Prospect	
    	Contact i3 = new Contact(
	    	ContactStatus__c = 'Suspect',
	    	Opportunity_Sub_Type__c = 'AvaTax',
			LastName = 'Test',
	        FirstName = 'Test',
	        Email = 'atest@test.net',
	        MailingCountry = 'USA',
	        MailingState = 'CA',
	        AccountId = a.id,
	    	Rating__c = 'D');
	    
	    listContact.add(i3);	
	    
	    //Created as Prospect	
    	Contact i4 = new Contact(
	    	ContactStatus__c = 'Inquiry',
	    	Opportunity_Sub_Type__c = 'AvaTax',
			LastName = 'Test',
	        FirstName = 'Test',
	        Email = 'atest@test.net',
	        MailingCountry = 'USA',
	        MailingState = 'CA',
	        AccountId = a.id,
	    	Rating__c = 'C');
	    
	    listContact.add(i4);    
	    
	    
	   //Created as PQL	
    	Contact p1 = new Contact(
	    	ContactStatus__c = 'Suspect',
	    	Opportunity_Sub_Type__c = 'AvaTax',
			LastName = 'Test',
	        FirstName = 'Test',
	        Email = 'atest@test.net',
	        MailingCountry = 'USA',
	        MailingState = 'CA',
	        AccountId = a.id,
	    	Rating__c = 'P');
	    
	    listContact.add(p1);
	    
	    //Created as PQL	
    	Contact p2 = new Contact(
	    	ContactStatus__c = 'Suspect',
	    	Opportunity_Sub_Type__c = 'AvaTax',
			LastName = 'Test',
	        FirstName = 'Test',
	        Email = 'atest@test.net',
	        MailingCountry = 'USA',
	        MailingState = 'CA',
	        AccountId = a.id,
	    	Rating__c = 'P');
	    
	    listContact.add(p2);	
	    
	   //Created as PQL	
    	Contact p3 = new Contact(
	    	ContactStatus__c = 'Suspect',
	    	Opportunity_Sub_Type__c = 'AvaTax',
			LastName = 'Test',
	        FirstName = 'Test',
	        Email = 'atest@test.net',
	        MailingCountry = 'USA',
	        MailingState = 'CA',
	        AccountId = a.id,
	    	Rating__c = 'P');
	    
	    listContact.add(p3);	
	    
	    //Created as MQL	
    	Contact m1 = new Contact(
	    	ContactStatus__c = 'MQL',
	    	Opportunity_Sub_Type__c = 'AvaTax',
			LastName = 'Test',
	        FirstName = 'Test',
	        Email = 'atest@test.net',
	        MailingCountry = 'USA',
	        MailingState = 'CA',
	        AccountId = a.id,
	    	Rating__c = 'A');
	    
	    listContact.add(m1);    
	    
	   //Created as MQL	
    	Contact m2 = new Contact(
	    	ContactStatus__c = 'Suspect',
	    	Opportunity_Sub_Type__c = 'AvaTax',
			LastName = 'Test',
	        FirstName = 'Test',
	        Email = 'atest@test.net',
	        MailingCountry = 'USA',
	        MailingState = 'CA',
	        AccountId = a.id,
	    	Rating__c = 'A');
	    
	    listContact.add(m2);
	    
	    //Created as Working	
    	Contact w1 = new Contact(
	    	ContactStatus__c = 'Working',
	    	Opportunity_Sub_Type__c = 'AvaTax',
			LastName = 'Test',
	        FirstName = 'Test',
	        Email = 'atest@test.net',
	        MailingCountry = 'USA',
	        MailingState = 'CA',
	        AccountId = a.id,
	    	Rating__c = Null);
	    
	    listContact.add(w1);	
	    	    
	    database.insert(listContact, true);	    
	            
        test.stopTest();
	    
	    s1.Rating__c = 'D'; //Suspect to Prospect
	    s2.Rating__c = 'P'; //Suspect to PQL
	    s3.ContactStatus__c = 'A'; //Suspect to MQL
	    s4.ContactStatus__c = 'Working'; //Suspect to Working
	    
	    i1.Rating__c = 'P'; //Prospect to PQL
	    i2.Rating__c = 'A'; //Prospect to MQL
	    i3.ContactStatus__c = 'Working'; //Prospect to Working
	    i4.ContactStatus__c = 'Nurture'; //Prospect to EOL

	    p1.Rating__c = 'A'; //PQL to MQL
	    p2.ContactStatus__c = 'Working'; //PQL to Working
	    p3.ContactStatus__c = 'Nurture'; //PQL to EOL
	    
	    m1.ContactStatus__c = 'Working'; //MQL to Working
	    m2.ContactStatus__c = 'Nurture'; //MQL to EOL

	    w1.ContactStatus__c = 'Nurture'; //Working to EOL
	    
	    database.update(listContact, true);
    }
	
}