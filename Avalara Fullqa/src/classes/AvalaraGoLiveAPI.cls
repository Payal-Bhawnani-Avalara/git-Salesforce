public with sharing class AvalaraGoLiveAPI {
    public static final String NAMED_CREDENTIAL = 'callout:AvaMilestoneAutomationSvc_PRODUCTION/api/v2';

    public static AvalaraGoLiveModel.GoLiveResponse accountActivation(String sId){
        String res = HTTPUtil.doRequest('GET', NAMED_CREDENTIAL + '/accounts/'+sId, null, null, null);
        return (AvalaraGoLiveModel.GoLiveResponse)JSON.deserialize(res, AvalaraGoLiveModel.GoLiveResponse.class);
    }

    public static AvalaraGoLiveModel.GoLiveResponse companyActivation(String sId){
        List<AvalaraGoLiveModel.GoLiveResponse> r = new List<AvalaraGoLiveModel.GoLiveResponse>();
        String res = HTTPUtil.doRequest('GET', NAMED_CREDENTIAL + '/companies', null,
            new Map<String, String>{'$filter' => 'accountId eq \'' + sid + '\''}, null);
        return (AvalaraGoLiveModel.GoLiveResponse)JSON.deserialize(res, AvalaraGoLiveModel.GoLiveResponse.class);
    }

    public static AvalaraGoLiveModel.GoLiveResponse nexusSetup(String sId){
        String res = HTTPUtil.doRequest('GET', NAMED_CREDENTIAL + '/companies/'+sId+'/nexus', null, null, null);
        return (AvalaraGoLiveModel.GoLiveResponse)JSON.deserialize(res, AvalaraGoLiveModel.GoLiveResponse.class);
    }

    public static AvalaraGoLiveModel.GoLiveResponse powerAttorneyFunding(String cId){
        String res = HTTPUtil.doRequest('GET',NAMED_CREDENTIAL + '/companies/' + cId + '/funding/configuration', null, null, null);
        return (AvalaraGoLiveModel.GoLiveResponse)JSON.deserialize(res, AvalaraGoLiveModel.GoLiveResponse.class);
    }

    public static AvalaraGoLiveModel.GoLiveResponse filingRequests(String cId){
        String res = HTTPUtil.doRequest('GET',NAMED_CREDENTIAL + '/companies/' + cId + '/filingrequests', null, null, null);
        return (AvalaraGoLiveModel.GoLiveResponse)JSON.deserialize(res, AvalaraGoLiveModel.GoLiveResponse.class);
    }

    public static AvalaraGoLiveModel.GoLiveResponse calendarCreation(String cId){
        String res = HTTPUtil.doRequest('GET',NAMED_CREDENTIAL + '/companies/' + cId + '/filingcalendars', null, null, null);
        return (AvalaraGoLiveModel.GoLiveResponse)JSON.deserialize(res, AvalaraGoLiveModel.GoLiveResponse.class);
    }

    public static AvalaraGoLiveModel.GoLiveResponse doneFilingCalendar(String cId){
        String res = HTTPUtil.doRequest('GET',NAMED_CREDENTIAL + '/companies/' + cId + '/filingstatus', null, null, null);
        res = '{"name":' + res  + '}';
        return (AvalaraGoLiveModel.GoLiveResponse)JSON.deserialize(res, AvalaraGoLiveModel.GoLiveResponse.class);
    }

    public static AvalaraGoLiveModel.GoLiveResponse certCapture(String cId){
        String res = HTTPUtil.doRequest('GET', NAMED_CREDENTIAL +'/companies/'+ cId + '/certificates/setup', null, null, null);
        return (AvalaraGoLiveModel.GoLiveResponse)JSON.deserialize(res, AvalaraGoLiveModel.GoLiveResponse.class);
    }

    public static AvalaraGoLiveModel.GoLiveResponse firstCustomer(String cId){
        String res = HTTPUtil.doRequest('GET',NAMED_CREDENTIAL + '/companies/'+ cId +'/customers', null, null, null);
        return (AvalaraGoLiveModel.GoLiveResponse)JSON.deserialize(res, AvalaraGoLiveModel.GoLiveResponse.class);
    }

    public static AvalaraGoLiveModel.GoLiveResponse firstCertificate(String cId){
        String res = HTTPUtil.doRequest('GET',NAMED_CREDENTIAL + '/companies/'+ cId +'/certificates', null, null, null);
        return (AvalaraGoLiveModel.GoLiveResponse)JSON.deserialize(res, AvalaraGoLiveModel.GoLiveResponse.class);
    }
}