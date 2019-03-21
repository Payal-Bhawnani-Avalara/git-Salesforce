public with sharing class AvalaraGoLiveUtil {

    public static void closeMilestones(List<Account_Statistics__c> newStatistics, List<Account_Statistics__c> oldStatistics){
        Map<String, String> fieldSettings = getSettings();
        List<Case> cases = new List<Case>();
        Map<Id, Account_Statistics__c> statisticsMap = new Map<Id, Account_Statistics__c>([
            SELECT Id,
                (SELECT Id FROM Cases1__r WHERE RecordType.Name ='Implementation' AND isClosed = false AND Implementation_Product__c IN ('Avalara AvaTax','Avalara CertCapture','Avalara Returns')),
                (SELECT Id FROM Cases__r WHERE RecordType.Name ='Implementation' AND isClosed = false AND Implementation_Product__c IN ('Avalara AvaTax','Avalara CertCapture','Avalara Returns'))
            FROM Account_Statistics__c
            WHERE Id IN:newStatistics
        ]);

        Map<String, List<Case>> fieldCasesMap = new Map<String, List<Case>>();
        for(Integer i = 0; i < newStatistics.size(); i++){
            for(String f : fieldSettings.values()){
                try {
                    if(newStatistics[i].get(f) <> NULL /*&& oldStatistics[i].get(f) == NULL*/){
                        if(fieldCasesMap.get(f) == NULL){
                            fieldCasesMap.put(f, new List<Case>());
                        }
                        fieldCasesMap.get(f).addAll(statisticsMap.get(newStatistics[i].Id).Cases1__r);
                        fieldCasesMap.get(f).addAll(statisticsMap.get(newStatistics[i].Id).Cases__r);
                        //
                        cases.addAll(statisticsMap.get(newStatistics[i].Id).Cases1__r);
                        cases.addAll(statisticsMap.get(newStatistics[i].Id).Cases__r);
                    }
                }
                catch(Exception ex){
                    // ignore errors because of invalid field names
                    System.debug('###'+ex);
                }
            }
        }


        Map<String, CaseMilestone> milestoneMap = getCaseMilestoneMap(cases);

        Set<Id> milestoneIds = new Set<Id>();
        List<CaseMilestone> milestones = new List<CaseMilestone>();
        for(String fld : fieldCasesMap.keySet()){
            for(Case c : fieldCasesMap.get(fld)){
                if(milestoneMap.get(c.Id + '||' + fld) <> NULL && !milestoneIds.contains(milestoneMap.get(c.Id + '||' + fld).Id)) {
                    CaseMilestone m = milestoneMap.get(c.Id + '||' + fld);
                    m.CompletionDate = System.today();
                    milestones.add(m);
                    milestoneIds.add(m.Id);
                }
            }
        }

        Database.update(milestones, false);
    }

    /*
    * Go through the collective response and update the corresponging fields
    **/
    public static void setData(Case cs, String productType, List<AvalaraGoLiveModel.GoLiveResponse> responses){
        if(productType == 'Avalara CertCapture'){
            if(responses[0] <> NULL && responses[0].createdDate <> NULL && cs.AvaTax_PX_Data_Feed_Dev__r.CC_Account_CC_Date_Provisioned__c == NULL){
                cs.AvaTax_PX_Data_Feed_Dev__r.CC_Account_CC_Date_Provisioned__c = System.today();
            }
            if(responses[1] <> NULL && responses[1].createdDate <> NULL && cs.AvaTax_PX_Data_Feed_Dev__r.CC_1st_Customer_Creation_Date__c == NULL){
                cs.AvaTax_PX_Data_Feed_Dev__r.CC_1st_Customer_Creation_Date__c = System.today();
            }
            if(responses[2] <> NULL && responses[2].createdDate <> NULL && cs.AvaTax_PX_Data_Feed_Dev__r.CC_1st_Certificate_Creation_Date__c == NULL){
                cs.AvaTax_PX_Data_Feed_Dev__r.CC_1st_Certificate_Creation_Date__c = System.today();
            }
            if(responses[3] <> NULL && responses[3].createdDate <> NULL && cs.PX_Data_Feed__r.CC_Account_CC_Date_Provisioned__c == NULL){
                cs.PX_Data_Feed__r.CC_Account_CC_Date_Provisioned__c = System.today();
            }
            if(responses[4] <> NULL && responses[4].createdDate <> NULL && cs.PX_Data_Feed__r.CC_1st_Customer_Creation_Date__c == NULL){
                cs.PX_Data_Feed__r.CC_1st_Customer_Creation_Date__c = System.today();
            }
            if(responses[5] <> NULL && responses[5].createdDate <> NULL && cs.PX_Data_Feed__r.CC_1st_Certificate_Creation_Date__c == NULL){
                cs.PX_Data_Feed__r.CC_1st_Certificate_Creation_Date__c = System.today();
            }
        }

        else if(productType == 'Avalara AvaTax'){
            if(responses[0] <> NULL && responses[0].effectiveDate <> NULL){
                cs.AvaTax_PX_Data_Feed_Dev__r.CX_911_Account_Activation_Date__c = Date.valueOf(responses[0].effectiveDate);
            }
            if(responses[1] <> NULL && responses[1].createdDate <> NULL){
                cs.AvaTax_PX_Data_Feed_Dev__r.CX_911_Company_Created_Date__c = Date.valueOf(responses[1].createdDate);
            }
            if(responses[2] <> NULL && responses[2].createdDate <> NULL){
                cs.AvaTax_PX_Data_Feed_Dev__r.CX_911_Nexus_Created_Date__c = Date.valueOf(responses[2].createdDate);
            }
            if(responses[3] <> NULL && responses[3].effectiveDate <> NULL){
                cs.PX_Data_Feed__r.CX_911_Account_Activation_Date__c = Date.valueOf(responses[3].effectiveDate);
            }
            if(responses[4] <> NULL && responses[4].createdDate <> NULL){
                cs.PX_Data_Feed__r.CX_911_Company_Created_Date__c = Date.valueOf(responses[4].createdDate);
            }
            if(responses[5] <> NULL && responses[5].createdDate <> NULL){
                cs.PX_Data_Feed__r.CX_911_Nexus_Created_Date__c = Date.valueOf(responses[5].createdDate);
            }
        }

        else {
        	 System.debug('responses[0]>>>' + responses);
            if( responses[0] <> NULL && responses[0].value <> NULL && responses[0].isFundingSetup == true && cs.AvaTax_PX_Data_Feed_Dev__r.CX_911_Funding_POA_Complete__c == NULL && responses[0].value.size() > 0 ){
            	    System.debug('responses[0]>>>' + responses[0]);
                cs.AvaTax_PX_Data_Feed_Dev__r.CX_911_Funding_POA_Complete__c = System.today();
            }
            // check if it returns record
            // check if field already has value
            if(
                responses[1] <> NULL && responses[1].value <> NULL
                && cs.AvaTax_PX_Data_Feed_Dev__r.CX_911_Filing_Request_Submitted__c == NULL && responses[1].value.size() > 0
            ){
            	 System.debug('responses[1]>>>' + responses[1]);
              cs.AvaTax_PX_Data_Feed_Dev__r.CX_911_Filing_Request_Submitted__c = System.today();
            }
            if(responses[2] <> NULL && responses[2].createdDate <> NULL){
            	    System.debug('responses[2]>>>' + responses[2]);
                cs.AvaTax_PX_Data_Feed_Dev__r.CX_911_Filing_Calendar_Creation__c = Date.valueOf(responses[2].createdDate);
            }

            if(responses[3] <> NULL && responses[3].Name <> NULL){
                 System.debug('responses[3]>>>' + responses[3]);
                String value = responses[3].Name;
                if(cs.AvaTax_PX_Data_Feed_Dev__r.CX_911_CUP_Filing_Calendars_Done__c == NULL && value == 'FilingRequested'){
                    cs.AvaTax_PX_Data_Feed_Dev__r.CX_911_CUP_Filing_Calendars_Done__c = System.today();
                }
                else if(cs.AvaTax_PX_Data_Feed_Dev__r.CX_911_First_Filing__c == NULL && value == 'FirstFiling') {
                    cs.AvaTax_PX_Data_Feed_Dev__r.CX_911_First_Filing__c = System.today();
                }
                else if(cs.AvaTax_PX_Data_Feed_Dev__r.CX_911_Normal_Compliance__c == NULL && value == 'Active') {
                    cs.AvaTax_PX_Data_Feed_Dev__r.CX_911_Normal_Compliance__c = System.today();
                }
            }


            if(responses[4] <> NULL && cs.PX_Data_Feed__r.CX_911_Funding_POA_Complete__c == NULL){
            	 System.debug('responses[4]>>>' + responses[4]);
                cs.PX_Data_Feed__r.CX_911_Funding_POA_Complete__c = System.today();
            }

            // check if it returns record
            // check if field already has value
            if(
                responses[5] <> NULL && responses[5].value <> NULL
                && cs.PX_Data_Feed__r.CX_911_Filing_Request_Submitted__c == NULL && responses[5].value.size() > 0
            ){
            	  System.debug('responses[5]>>>' + responses[5]); 	   
                cs.PX_Data_Feed__r.CX_911_Filing_Request_Submitted__c = System.today();
            }

            if(responses[6] <> NULL && responses[6].createdDate <> NULL &&  cs.PX_Data_Feed__r.CX_911_Filing_Calendar_Creation__c == NULL){
            	    System.debug('responses[6]>>>' + responses[6]);
                cs.PX_Data_Feed__r.CX_911_Filing_Calendar_Creation__c = Date.valueOf(responses[6].createdDate);
            }

            if(responses[7] <> NULL && responses[7].Name <> NULL){
            	   System.debug('responses[7]  1>>>' + responses[7]);
                String value = responses[7].Name;
                if(cs.PX_Data_Feed__r.CX_911_CUP_Filing_Calendars_Done__c == NULL && value == 'FilingRequested'){
                    cs.PX_Data_Feed__r.CX_911_CUP_Filing_Calendars_Done__c = System.today();
                }
                else if(cs.PX_Data_Feed__r.CX_911_First_Filing__c == NULL && value == 'FirstFiling') {
                	System.debug('responses[7]  2>>>' + responses[7]);
                    cs.PX_Data_Feed__r.CX_911_First_Filing__c = System.today();
                }
                else if(cs.PX_Data_Feed__r.CX_911_Normal_Compliance__c == NULL && value == 'Active') {
                 	System.debug('responses[7]  3>>>' + responses[7]);
                    cs.PX_Data_Feed__r.CX_911_Normal_Compliance__c = System.today();
                }
            }
        }
    }

    /*
    * Get data from the API based on different productType
    **/
    public static List<AvalaraGoLiveModel.GoLiveResponse> getData(Case c, String productType){
        List<AvalaraGoLiveModel.GoLiveResponse> responses = new List<AvalaraGoLiveModel.GoLiveResponse>();
        if(productType == 'Avalara AvaTax'){
            responses.addAll(getAvaTaxData(c.AvaTax_PX_Data_Feed_Dev__r.Account__r.PROD_AvaTax_Account__c));
            responses.addAll(getAvaTaxData(c.PX_Data_Feed__r.Account__r.PROD_AvaTax_Account__c));
        }
        else if(productType == 'Avalara CertCapture'){
            responses.addAll(getCertCaptureData(c.AvaTax_PX_Data_Feed_Dev__r.Account__r.PROD_AvaTax_Account__c));
            responses.addAll(getCertCaptureData(c.PX_Data_Feed__r.Account__r.PROD_AvaTax_Account__c));
        }
        else {
        	    System.debug('productType>>>'+ productType);
        	    System.debug('Account id >>>'+c.AvaTax_PX_Data_Feed_Dev__r.Account__r.PROD_AvaTax_Account__c);
            responses.addAll(getAvaTaxReturnData(c.AvaTax_PX_Data_Feed_Dev__r.Account__r.PROD_AvaTax_Account__c));
              System.debug('Account id >>>'+c.PX_Data_Feed__r.Account__r.PROD_AvaTax_Account__c);
            responses.addAll(getAvaTaxReturnData(c.PX_Data_Feed__r.Account__r.PROD_AvaTax_Account__c));
        }
            System.debug('responses>>>'+ responses); 
        return responses;
    }

    /*
    * Get avataxdata
    **/
    public static List<AvalaraGoLiveModel.GoLiveResponse> getAvaTaxData(String accNum){
        List<AvalaraGoLiveModel.GoLiveResponse> result = new List<AvalaraGoLiveModel.GoLiveResponse>{
            accNum == NULL ? new AvalaraGoLiveModel.GoLiveResponse() : AvalaraGoLiveAPI.accountActivation(accNum),
            NULL,
            NULL
        };
        AvalaraGoLiveModel.GoLiveResponse companyRes = accNum == NULL ? new AvalaraGoLiveModel.GoLiveResponse() : AvalaraGoLiveAPI.companyActivation(accNum);

        // NOTE : Aaron wants us to iterate through all the company ids returned and make
        // callouts in loop
        for(AvalaraGoLiveModel.ValueX obj : companyRes.value){
            if(obj <> NULL && obj.createdDate <> NULL){
                AvalaraGoLiveModel.GoLiveResponse resCom = new AvalaraGoLiveModel.GoLiveResponse();
                resCom.createdDate = obj.createdDate;
                result[1] = resCom;
            }
            if(result[2] == NULL){
                AvalaraGoLiveModel.GoLiveResponse nexusRes = AvalaraGoLiveAPI.nexusSetup(obj.id);
                if(nexusRes <> NULL && nexusRes.value <> NULL){
                    for(AvalaraGoLiveModel.ValueX vx : nexusRes.value){
                        if(vx.createdDate <> NULL){
                            AvalaraGoLiveModel.GoLiveResponse resCom = new AvalaraGoLiveModel.GoLiveResponse();
                            resCom.createdDate = vx.createdDate;
                            result[2] = resCom;
                            break;
                        }
                    }
                }
            }
            //if all done break out of loop
            if(result[1] <> NULL && result[2] <> NULL){
                break;
            }
        }
        return result;
    }

    /*
    * Get certcap
    **/
    public static List<AvalaraGoLiveModel.GoLiveResponse> getCertCaptureData(String accNum){
        List<AvalaraGoLiveModel.GoLiveResponse> result = new List<AvalaraGoLiveModel.GoLiveResponse>{
            NULL, NULL, NULL
        };
        AvalaraGoLiveModel.GoLiveResponse res = accNum == NULL ? new AvalaraGoLiveModel.GoLiveResponse() : AvalaraGoLiveAPI.companyActivation(accNum);
        // NOTE : Aaron wants us to iterate through all the company ids returned and make
        // callouts in loop
        for(AvalaraGoLiveModel.ValueX obj : res.value){
            if(obj <> NULL && obj.id <> NULL){
                if(result[0] == NULL){
                    AvalaraGoLiveModel.GoLiveResponse r = AvalaraGoLiveAPI.certCapture(obj.id);
                    if(r.status <> NULL && (r.status.equalsIgnoreCase('finished') || r.status.equalsIgnoreCase('Provisioned'))){
                        r.createdDate = System.today().format();
                        result[0] = r;
                    }
                }
                if(result[1] == NULL){
                    AvalaraGoLiveModel.GoLiveResponse r = AvalaraGoLiveAPI.firstCustomer(obj.id);
                    if(r.value <> NULL && r.value.size() > 0){
                        r.createdDate = System.today().format();
                        result[1] = r;
                    }
                }
                if(result[2] == NULL){
                    AvalaraGoLiveModel.GoLiveResponse r = AvalaraGoLiveAPI.firstCertificate(obj.id);
                    if(r.value <> NULL && r.value.size() > 0){
                        r.createdDate = System.today().format();
                        result[2] = r;
                    }
                }
            }
            //if all done break out of loop
            if(result[0] <> NULL && result[1] <> NULL && result[2] <> NULL){
                break;
            }
        }
        return result;
    }

    /*
    * Get returns
    **/
    public static List<AvalaraGoLiveModel.GoLiveResponse> getAvaTaxReturnData(String accNum){
        List<AvalaraGoLiveModel.GoLiveResponse> result = new List<AvalaraGoLiveModel.GoLiveResponse>{
            NULL, NULL, NULL, NULL
        };
        // NOTE : Aaron wants us to iterate through all the company ids returned and make
        // callouts in loop
        AvalaraGoLiveModel.GoLiveResponse res = accNum == NULL ? new AvalaraGoLiveModel.GoLiveResponse() : AvalaraGoLiveAPI.companyActivation(accNum);
        AvalaraGoLiveModel.GoLiveResponse r;
        System.debug('res>>>>'+res);
        System.debug('r>>>>'+r);
        for(AvalaraGoLiveModel.ValueX obj : res.value){
            if(obj <> NULL && obj.id <> NULL){
                if(result[0] == NULL){
                    r = AvalaraGoLiveAPI.powerAttorneyFunding(obj.id);
                    System.debug('before result[0]>>>'+   result[0]);
                    System.debug('before r>>>'+   r);
                    if( r.isFundingSetup == true){
                        result[0] = r;
                      System.debug('  result[0]>>>'+   result[0]);
                    }
                }
                if(result[1] == NULL){
                    r = AvalaraGoLiveAPI.filingRequests(obj.id);
                    if(r <> NULL && r.value <> NULL && r.value.size() > 0){
                        result[1] = r;
                    }
                }
                if(result[2] == NULL){
                    r = AvalaraGoLiveAPI.calendarCreation(obj.id);
                    if(r <> NULL && r.value <> NULL && r.value.size() > 0){
                        result[2] = r;
                    }
                }
                if(result[3] == NULL){
                    r = AvalaraGoLiveAPI.doneFilingCalendar(obj.id);
                    if(r.name <> NULL && r.name <> 'NotConfiguredForCompliance'){
                        result[3] = r;
                    }
                }
            }
            //if all done break out of loop
            if(result[0] <> NULL && result[1] <> NULL && result[2] <> NULL && result[3] <> NULL){
                break;
            }
        }
        return result;
    }


    /*
    * Get settings for custom metadata
    **/
    private static Map<String, String> metadataMap;
    private static Map<String, String> getSettings(){
        if(metadataMap == NULL){
            metadataMap = new Map<String, String>();
            for(ImplementationMilestones__mdt mdt : [
                SELECT Id, Field_Name__c, MilestoneTypeID__c
                FROM ImplementationMilestones__mdt
                WHERE Object__c = 'Account_Statistics__c' AND Active__c = true
            ]){
                metadataMap.put(mdt.MilestoneTypeID__c, mdt.Field_Name__c.toLowerCase());
            }
        }

        return metadataMap;
    }

    private static Map<String, CaseMilestone> getCaseMilestoneMap(List<Case> cases){
        Map<String, String> metadataMap = getSettings();
        Map<String, CaseMilestone> milestoneMap = new Map<String, CaseMilestone>();

        for(CaseMilestone obj : [
            SELECT Id, MilestoneTypeId, CaseId
            FROM CaseMilestone
            WHERE CaseId IN:cases AND IsCompleted = false AND MilestoneTypeId IN:metadataMap.keyset()
        ]){
            milestoneMap.put(obj.CaseId +'||'+ metadataMap.get(obj.MilestoneTypeId), obj);

        }
        return milestoneMap;
    }

}