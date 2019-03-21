@isTest
private class DG_Account_Class_TEST {
	TestUtil t=new TestUtil();
    static testMethod void CalculateAccountCluster_Test() {
    	set<String> setEmployeeBand = new set<String>{'Enterprise','Mid-Market','Small'};
    	set<String> setMultiState = new set<String>{'1','2 to 5','6 - 10','11 to 25','26 to 50'};
    	map<String, NAICS_To_SIC1__c> NAICSToSIC1Mapping = DG_Account_Class.getNAICSToSIC1Mapping();  	
    	
    	List<Account> listAccount = new List<Account>();
    	
    	Integer x = 0;
    	
    	for(String k : NAICSToSIC1Mapping.keySet()){
    		String vNAICS = k;
    		
    		for(String eb : setEmployeeBand){
    			String vEmployeeBand = eb;
    			
    			for(String ms : setMultiState){
    				String vMultiState = ms; 
    				Boolean vCalc;
    				Boolean vCert;
    				
    				if(math.mod(x,2) == 0){
    					vCalc = true;
    					vCert = false;
    				}else{
    					vCalc = false;
    					vCert = true;
    				}
    							
					Account a = new Account(
				        Name = 'Test Company',
				        BillingCountry = 'USA',
				        BillingState = 'CA',
				        EmployeeBand__c = vEmployeeBand, 
				        Multi_State_Nexus__c = vMultiState, 
				        Calc__c = vCalc, 
				        Sic = Null, 
				        NaicsCode = vNAICS
			        );
			        
			        listAccount.add(a);
			        
			        x = x + 1;
    			}
    		}
    	}
    	
    	database.insert(listAccount, true);
    }
    
    
    static testMethod void IdentifyAccountClusterOnBatch(){    	
    	List<Account> listAccount = new List<Account>();
    	
    	for(Integer x = 0; x < 10; x++){ 							
			Account a = new Account(
		        Name = 'Test Company',
		        BillingCountry = 'USA',
		        BillingState = 'CA',
		        EmployeeBand__c = 'Enterprise', 
		        Multi_State_Nexus__c = '26 to 50', 
		        Calc__c = true,  
		        Sic = string.valueOf(x), 
		        NaicsCode = Null
	        );
			        
			listAccount.add(a);
    	}
    	
    	database.insert(listAccount, true);
    	
    	for(Account a : listAccount){
    		a.Cluster__c = Null;
    	}
    	
    	database.update(listAccount, true);
    	
    	DG_Account_Class.IdentifyAccountClusterOnBatch();
    }
    
    static testMethod void schedule_BackfillAccountCluster_Test() {
    	
    	String CRON_EXP = '0 0 * * * ? *';
    
        Test.startTest();
        
        String jobId = System.schedule(
            '_ClusterTestBackfill: AB',
            CRON_EXP,
            new schedule_BackfillAccountCluster() 
        );
        
        Test.stopTest();

    }
}