global with sharing class cc_Ava_ctrl_header {
	public Boolean isRedirect {get;private set;}
	public String redirectLoc {get;private set;}

	public cc_Ava_ctrl_header(){
		Map<String,Ava_In_Maintenance__c> inMaintenanceSetting = Ava_In_Maintenance__c.getAll();
		Ava_In_Maintenance__c avaDevEnv = inMaintenanceSetting.get('Ava Dev Environment');
		isRedirect = avaDevEnv.Turn_Off_Site_for_Maintenance__c;
		redirectLoc = (String)avaDevEnv.URL_for_redirection__c;
	}

}