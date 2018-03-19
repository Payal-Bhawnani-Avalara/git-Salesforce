public without sharing class DG_Account_Class {
	public static Boolean DGAccountClassBeforeInsertExecuted=false;
	public static Boolean DGAccountClassBeforeUpdateExecuted=false;
	
	public static AccountClusterSettings__c getClusterSettings(){
		AccountClusterSettings__c settings = new AccountClusterSettings__c();	

		if(!test.isRunningTest()){
			settings = AccountClusterSettings__c.getInstance();
		}else{
			settings.Enable__c = true;
			settings.Batch_Size__c = 250;
		}
		
		return settings;
	}
	
	public static map<String, AccountClusterCoefficients__c> getAccountClusterCoefficients(){
		map<String, AccountClusterCoefficients__c> mapCS = new map<String, AccountClusterCoefficients__c>();	

		if(!test.isRunningTest()){
			mapCS = AccountClusterCoefficients__c.getAll();
		}else{
			mapCS.put('1',new AccountClusterCoefficients__c(Name='1',  sic_9_flag__c=1,  sic_8_flag__c=1,  sic_7_flag__c=1,  sic_6_flag__c=1,  sic_5_flag__c=1,  
			sic_4_flag__c=1,  sic_3_flag__c=1,  sic_2_flag__c=1,  sic_1_flag__c=1,  nexus_multi_state_unk__c=1,  
			nexus_multi_state_26_50__c=1,  nexus_multi_state_11_25__c=1,  nexus_multi_state_06_10__c=1,  
			nexus_multi_state_02_05__c=1,  nexus_multi_state_01__c=1,  emp_band_unk__c=1,  emp_band_small__c=1,  
			emp_band_mid_mkt_mid_size__c=1,  emp_band_enterprise__c=1,  anlz_sfdc_cust_certcapture__c=1,  
			anlz_sfdc_cust_avatax__c=1,  Constant__c=1,  sic_9_flag_false__c=-1,  sic_8_flag_false__c=-1,  sic_7_flag_false__c=-1,  sic_6_flag_false__c=-1,  sic_5_flag_false__c=-1,  
			sic_4_flag_false__c=-1,  sic_3_flag_false__c=-1,  sic_2_flag_false__c=-1,  sic_1_flag_false__c=-1,  nexus_multi_state_unk_false__c=-1,  
			nexus_multi_state_26_50_false__c=-1,  nexus_multi_state_11_25_false__c=-1,  nexus_multi_state_06_10_false__c=-1,  
			nexus_multi_state_02_05_false__c=-1,  nexus_multi_state_01_false__c=-1,  emp_band_unk_false__c=-1,  emp_band_small_false__c=-1,  
			emp_band_mid_mkt_mid_size_false__c=-1,  emp_band_enterprise_false__c=-1,  anlz_sfdc_cust_certcapture_false__c=-1,  
			anlz_sfdc_cust_avatax_false__c=-1));
			mapCS.put('2',new AccountClusterCoefficients__c(Name='2',  sic_9_flag__c=2,  sic_8_flag__c=2,  sic_7_flag__c=2,  sic_6_flag__c=2,  sic_5_flag__c=2,  
			sic_4_flag__c=2,  sic_3_flag__c=2,  sic_2_flag__c=2,  sic_1_flag__c=2,  nexus_multi_state_unk__c=2,  
			nexus_multi_state_26_50__c=2,  nexus_multi_state_11_25__c=2,  nexus_multi_state_06_10__c=2,  
			nexus_multi_state_02_05__c=2,  nexus_multi_state_01__c=2,  emp_band_unk__c=2,  emp_band_small__c=2,  
			emp_band_mid_mkt_mid_size__c=2,  emp_band_enterprise__c=2,  anlz_sfdc_cust_certcapture__c=2,  
			anlz_sfdc_cust_avatax__c=2,  Constant__c=2,  sic_9_flag_false__c=-2,  sic_8_flag_false__c=-2,  sic_7_flag_false__c=-2,  sic_6_flag_false__c=-2,  sic_5_flag_false__c=-2,  
			sic_4_flag_false__c=-2,  sic_3_flag_false__c=-2,  sic_2_flag_false__c=-2,  sic_1_flag_false__c=-2,  nexus_multi_state_unk_false__c=-2,  
			nexus_multi_state_26_50_false__c=-2,  nexus_multi_state_11_25_false__c=-2,  nexus_multi_state_06_10_false__c=-2,  
			nexus_multi_state_02_05_false__c=-2,  nexus_multi_state_01_false__c=-2,  emp_band_unk_false__c=-2,  emp_band_small_false__c=-2,  
			emp_band_mid_mkt_mid_size_false__c=-2,  emp_band_enterprise_false__c=-2,  anlz_sfdc_cust_certcapture_false__c=-2,  
			anlz_sfdc_cust_avatax_false__c=-2));
			mapCS.put('3',new AccountClusterCoefficients__c(Name='3',  sic_9_flag__c=3,  sic_8_flag__c=3,  sic_7_flag__c=3,  sic_6_flag__c=3,  sic_5_flag__c=3,  
			sic_4_flag__c=3,  sic_3_flag__c=3,  sic_2_flag__c=3,  sic_1_flag__c=3,  nexus_multi_state_unk__c=3,  
			nexus_multi_state_26_50__c=3,  nexus_multi_state_11_25__c=3,  nexus_multi_state_06_10__c=3,  
			nexus_multi_state_02_05__c=3,  nexus_multi_state_01__c=3,  emp_band_unk__c=3,  emp_band_small__c=3,  
			emp_band_mid_mkt_mid_size__c=3,  emp_band_enterprise__c=3,  anlz_sfdc_cust_certcapture__c=3,  
			anlz_sfdc_cust_avatax__c=3,  Constant__c=3,  sic_9_flag_false__c=-3,  sic_8_flag_false__c=-3,  sic_7_flag_false__c=-3,  sic_6_flag_false__c=-3,  sic_5_flag_false__c=-3,  
			sic_4_flag_false__c=-3,  sic_3_flag_false__c=-3,  sic_2_flag_false__c=-3,  sic_1_flag_false__c=-3,  nexus_multi_state_unk_false__c=-3,  
			nexus_multi_state_26_50_false__c=-3,  nexus_multi_state_11_25_false__c=-3,  nexus_multi_state_06_10_false__c=-3,  
			nexus_multi_state_02_05_false__c=-3,  nexus_multi_state_01_false__c=-3,  emp_band_unk_false__c=-3,  emp_band_small_false__c=-3,  
			emp_band_mid_mkt_mid_size_false__c=-3,  emp_band_enterprise_false__c=-3,  anlz_sfdc_cust_certcapture_false__c=-3,  
			anlz_sfdc_cust_avatax_false__c=-3));
		}
		
		return mapCS;
	}
	
	public static map<String, NAICS_To_SIC1__c> getNAICSToSIC1Mapping(){
		map<String, NAICS_To_SIC1__c> mapCS = new map<String, NAICS_To_SIC1__c>();	

		if(!test.isRunningTest()){
			mapCS = NAICS_To_SIC1__c.getAll();
		}else{
			mapCS.put('111110', new NAICS_To_SIC1__c(name='111110', SIC1__c='0'));
			mapCS.put('211111', new NAICS_To_SIC1__c(name='211111', SIC1__c='1'));
			mapCS.put('311119', new NAICS_To_SIC1__c(name='311119', SIC1__c='2'));
			mapCS.put('311811', new NAICS_To_SIC1__c(name='311811', SIC1__c='5'));
			mapCS.put('313320', new NAICS_To_SIC1__c(name='313320', SIC1__c='3'));
			mapCS.put('326212', new NAICS_To_SIC1__c(name='326212', SIC1__c='7'));
			mapCS.put('339116', new NAICS_To_SIC1__c(name='339116', SIC1__c='8'));
			mapCS.put('481111', new NAICS_To_SIC1__c(name='481111', SIC1__c='4'));
			mapCS.put('521110', new NAICS_To_SIC1__c(name='521110', SIC1__c='6'));
			mapCS.put('921110', new NAICS_To_SIC1__c(name='921110', SIC1__c='9'));
		}
		
		return mapCS;
	}
	
	public static void IdentifyAccountCluster(list<Account> listNew, map<Id, Account> mapOld){
			
		list<Account> listAccount = new list<Account>();
		AccountClusterSettings__c settings = getClusterSettings();
		
		if(settings.Enable__c == true){
			if(mapOld == Null){ //Insert
		        for (Account tn : listNew){
		        	listAccount.add(tn);
		        }
			}else{ //Update
				for (Account tn : listNew){
		        	Account to = mapOld.get(tn.Id);
		        	if(tn.EmployeeBand__c <> to.EmployeeBand__c ||
		        	tn.Multi_State_Nexus__c <> to.Multi_State_Nexus__c ||
		        	tn.Calc__c <> to.Calc__c ||
		        	tn.Certs__c <> to.Certs__c ||
		        	tn.CertCaptureCustomer__c <> to.CertCaptureCustomer__c ||
		        	tn.Sic <> to.Sic ||
		        	tn.NaicsCode <> to.NaicsCode){
		        		listAccount.add(tn);
		        	}
		        }
			}
		}
		
		if(!listAccount.isEmpty()){
			CalculateAccountCluster(listAccount, false);
		}
        
	}
	
	public static void CalculateAccountCluster(list<Account> listAccount, Boolean blnBatch){
		try{
			//Retrieve custom setting related to Account Cluster Coefficients		
			map<String, AccountClusterCoefficients__c> mapAccountClusterCoefficients = getAccountClusterCoefficients();
			
			//Retrieve custom setting related to NAICS To SIC translation	
			map<String, NAICS_To_SIC1__c> mapNAICSToSIC1 = getNAICSToSIC1Mapping();
			
			for(Account a : listAccount){
				Boolean sic_1_flag = false;
				Boolean sic_2_flag = false;
				Boolean sic_3_flag = false;
				Boolean sic_4_flag = false;
				Boolean sic_5_flag = false;
				Boolean sic_6_flag = false;
				Boolean sic_7_flag = false;
				Boolean sic_8_flag = false;
				Boolean sic_9_flag = false;
				Boolean emp_band_enterprise = false;
				Boolean emp_band_mid_mkt_mid_size = false;
				Boolean emp_band_small = false;
				Boolean emp_band_unk = false;
				Boolean nexus_multi_state_01 = false;
				Boolean nexus_multi_state_02_05 = false;
				Boolean nexus_multi_state_06_10 = false;
				Boolean nexus_multi_state_11_25 = false;
				Boolean nexus_multi_state_26_50 = false;
				Boolean nexus_multi_state_unk = false;
				Boolean anlz_sfdc_cust_avatax = false;
				Boolean anlz_sfdc_cust_certcapture = false;
				
				String EffectiveSic1 = Null;
				
				if(!string.isBlank(a.NAICSCode)){
					if(mapNAICSToSIC1.containsKey(a.NAICSCode)){
						EffectiveSic1 = mapNAICSToSIC1.get(a.NAICSCode).Sic1__c;
					}
				}
				 
				if(EffectiveSic1 == Null && !string.isBlank(a.Sic)){
					EffectiveSic1 = a.Sic.substring(0,1);
				}
				
				//system.debug('### Effective SIC: ' + EffectiveSic1);
				
				if(EffectiveSic1 == '1'){	
					sic_1_flag = true;
				}
				
				if(EffectiveSic1 == '2'){
					sic_2_flag = true;
				}
				
				if(EffectiveSic1 == '3'){	
					sic_3_flag = true;
				}
				
				if(EffectiveSic1 == '4'){
					sic_4_flag = true;
				}
				
				if(EffectiveSic1 == '5'){
					sic_5_flag = true;
				}
				
				if(EffectiveSic1 == '6'){
					sic_6_flag = true;
				}
				
				if(EffectiveSic1 == '7'){
					sic_7_flag = true;
				}
				
				if(EffectiveSic1 == '8'){
					sic_8_flag = true;
				}
				
				if(EffectiveSic1 == '9'){
					sic_9_flag = true;
				}
				
				if(a.EmployeeBand__c == 'Enterprise'){
					emp_band_enterprise = true;
				}
				
				if(a.EmployeeBand__c == 'Mid-Market'){
					emp_band_mid_mkt_mid_size = true;
				}
				
				if(a.EmployeeBand__c == 'Small'){	
					emp_band_small = true;
				}
				
				if(a.EmployeeBand__c == 'Unknown' || a.EmployeeBand__c == Null){
					emp_band_unk = true;
				}
				
				if(a.Multi_State_Nexus__c == '1'){
					nexus_multi_state_01 = true;
				}
				
				if(a.Multi_State_Nexus__c == '2 to 5'){
					nexus_multi_state_02_05 = true;
				}
				
				if(a.Multi_State_Nexus__c == '6 to 10'){
					nexus_multi_state_06_10 = true;
				}
				
				if(a.Multi_State_Nexus__c == '11 to 25'){
					nexus_multi_state_11_25 = true;
				}
				
				if(a.Multi_State_Nexus__c == '26 to 50'){
					nexus_multi_state_26_50 = true;
				}
				
				if(a.Multi_State_Nexus__c == 'Unknown'){
					nexus_multi_state_unk = true;
				}
				
				if(a.Calc__c == true){
					anlz_sfdc_cust_avatax = true;
				}
				
				if(a.Certs__c == true || a.CertCaptureCustomer__c == true){
					anlz_sfdc_cust_certcapture = true;
				}
				
				String HighestCluster;
				Decimal HighestClusterScore;
				
				for(String k : mapAccountClusterCoefficients.keySet()){
					AccountClusterCoefficients__c cl = mapAccountClusterCoefficients.get(k);
										
					Decimal ClusterScore = cl.Constant__c +
					(sic_1_flag ? cl.sic_1_flag__c : cl.sic_1_flag_false__c) +
					(sic_2_flag ? cl.sic_2_flag__c : cl.sic_2_flag_false__c ) +
					(sic_3_flag ? cl.sic_3_flag__c : cl.sic_3_flag_false__c) +
					(sic_4_flag ? cl.sic_4_flag__c : cl.sic_4_flag_false__c) +
					(sic_5_flag ? cl.sic_5_flag__c : cl.sic_5_flag_false__c) +
					(sic_6_flag ? cl.sic_6_flag__c : cl.sic_6_flag_false__c) +
					(sic_7_flag ? cl.sic_7_flag__c : cl.sic_7_flag_false__c) +
					(sic_8_flag ? cl.sic_8_flag__c : cl.sic_8_flag_false__c) +
					(sic_9_flag ? cl.sic_9_flag__c : cl.sic_9_flag_false__c) +
					(emp_band_enterprise ? cl.emp_band_enterprise__c : cl.emp_band_enterprise_false__c) +
					(emp_band_mid_mkt_mid_size ? cl.emp_band_mid_mkt_mid_size__c : cl.emp_band_mid_mkt_mid_size_false__c) +
					(emp_band_small ? cl.emp_band_small__c : cl.emp_band_small_false__c) +
					(emp_band_unk ? cl.emp_band_unk__c : cl.emp_band_unk_false__c) +
					(nexus_multi_state_01 ? cl.nexus_multi_state_01__c : cl.nexus_multi_state_01_false__c) +
					(nexus_multi_state_02_05 ? cl.nexus_multi_state_02_05__c : cl.nexus_multi_state_02_05_false__c) +
					(nexus_multi_state_06_10 ? cl.nexus_multi_state_06_10__c : cl.nexus_multi_state_06_10_false__c) +
					(nexus_multi_state_11_25 ? cl.nexus_multi_state_11_25__c : cl.nexus_multi_state_11_25_false__c) +
					(nexus_multi_state_26_50 ? cl.nexus_multi_state_26_50__c : cl.nexus_multi_state_26_50_false__c) +
					(nexus_multi_state_unk ? cl.nexus_multi_state_unk__c : cl.nexus_multi_state_unk_false__c) +
					(anlz_sfdc_cust_avatax ? cl.anlz_sfdc_cust_avatax__c : cl.anlz_sfdc_cust_avatax_false__c) +
					(anlz_sfdc_cust_certcapture ? cl.anlz_sfdc_cust_certcapture__c : cl.anlz_sfdc_cust_certcapture_false__c);
					
					//system.debug('### Cluster ' + cl.Name + ' Score: ' + ClusterScore);
					
					if(HighestClusterScore == Null || HighestClusterScore < ClusterScore){
						HighestClusterScore = ClusterScore;
						HighestCluster = cl.Name;
					}
				}
				
				system.debug('### Highest Cluster: ' + HighestCluster);
				
				if(HighestCluster <> Null){				
					a.Cluster__c = HighestCluster;
				}			
			}
			
			if(blnBatch){
				system.debug('### Accounts ready to update: ' + listAccount);
				database.update(listAccount, false);
			}
			
		}catch(exception e){
			System.debug('An exception occurred: ' + e.getMessage());
		}
	}
	
	public static void IdentifyAccountClusterOnBatch(){
			
		Integer BatchSize = 250;	
		
		try{
			AccountClusterSettings__c settings = getClusterSettings();
			BatchSize = settings.Batch_Size__c.intValue();
		}catch(exception e){}		
		
		String sqlstring = 'Select Id, Cluster__c, EmployeeBand__c, Multi_State_Nexus__c, Calc__c, Certs__c, CertCaptureCustomer__c, Sic, NaicsCode from Account where Cluster__c = \'\' AND IsDeleted = FALSE LIMIT :BatchSize';

		list<Account> listAccount = new list<Account>();
				
		try{
			listAccount = Database.query(sqlstring);
		}catch(exception e){}
				
		system.debug('### Batch Size: ' + listAccount.size());
			
		if(listAccount.size() > 0){
    		CalculateAccountCluster(listAccount, true);
		}
	}
	
	/*
	public static void Temp_SimulateCalculateAccountCluster(){
    	set<String> setEmployeeBand = new set<String>{'Enterprise','Mid-Market','Small','Unknown'};
    	set<String> setMultiState = new set<String>{'1','2 to 5','6 - 10','11 to 25','26 to 50','Unknown'};
    	set<String> setNAICS = new set<String>{'111110','211111','311119','311811','313320'};
    	set<String> setNAICS2 = new set<String>{'326212','339116','481111','521110','921110'};
    	Set<Boolean> setCalc = new set<Boolean>{true,false};	
    	Set<Boolean> setCert = new set<Boolean>{true,false};	
    	
		Integer BatchSize = 250;	
		
		try{
			AccountClusterSettings__c settings = getClusterSettings();
			BatchSize = settings.Batch_Size__c.intValue();
		}catch(exception e){}			
    	
    	List<Account> listAccount = new List<Account>();
    	
    	listAccount = [Select Name, EmployeeBand__c,Multi_State_Nexus__c,Calc__c,Certs__c,Sic,NaicsCode from Account where Name <> 'Test Account Cluster' and Cluster__c= '' LIMIT :BatchSize];
    	
    	Integer x = 0;	
    		
    	for(String k : setNAICS2){
    		String vNAICS = k;
    		
    		for(String eb : setEmployeeBand){
    			String vEmployeeBand = eb;
    			
    			for(String ms : setMultiState){
    				String vMultiState = ms;
    				
    				for(Boolean ca : setCalc){
    					Boolean vCalc = ca;
    					Boolean vCert=true;
    					
    					if(listAccount.size() >= (x+1)){
	    					Account a = listAccount[x];
	    					 
	    					a.Name = 'Test Account Cluster';
							a.BillingCountry = 'USA';
							a.BillingState = 'CA';
							a.EmployeeBand__c = vEmployeeBand;
					        a.Multi_State_Nexus__c = vMultiState;
					        a.Calc__c = vCalc;
					        a.Certs__c = vCert;
					        a.NaicsCode = vNAICS;
										        
							x = x + 1;
    					}
    				}
    			}
    		}
    	}    	
    	database.update(listAccount, true);
    }
    
    public static void Temp_IdentifyTestAccountClusterOnBatch(){
			
		Integer BatchSize = 250;	
		
		try{
			AccountClusterSettings__c settings = getClusterSettings();
			BatchSize = settings.Batch_Size__c.intValue();
		}catch(exception e){}		
		
		String sqlstring = 'Select Id, Cluster__c, EmployeeBand__c, Multi_State_Nexus__c, Calc__c, Certs__c, CertCaptureCustomer__c, Sic, NaicsCode from Account where Cluster__c = \'\' AND Name = \'Test Account Cluster\' AND IsDeleted = FALSE LIMIT :BatchSize';
		list<Account> listAccount = new list<Account>();
				
		try{
			listAccount = Database.query(sqlstring);
		}catch(exception e){}
				
		system.debug('### Batch Size: ' + listAccount.size());
			
		if(listAccount.size() > 0){
    		CalculateAccountCluster(listAccount, true);
		}
	}
	
	public static void Temp_ResetAccountClusterOnBatch(){
			
		Integer BatchSize = 250;	
		
		try{
			AccountClusterSettings__c settings = getClusterSettings();
			BatchSize = settings.Batch_Size__c.intValue();
		}catch(exception e){}		
					
				
		String sqlstring = 'Select Id, Cluster__c, EmployeeBand__c, Multi_State_Nexus__c, Calc__c, Certs__c, CertCaptureCustomer__c, Sic, NaicsCode from Account where Cluster__c <> \'\' AND Name = \'Test Account Cluster\' AND IsDeleted = FALSE LIMIT :BatchSize';

		list<Account> listAccount = new list<Account>();
				
		try{
			listAccount = Database.query(sqlstring);
		}catch(exception e){}
		
		system.debug('### Batch Size: ' + listAccount.size());
		
		if(!listAccount.isEmpty()){
			for(Account a : listAccount){
				a.Cluster__c = Null;
			}
			system.debug('### Accounts ready to update: ' + listAccount.size());
			database.update(listAccount,false);
		}
    }
    */
}