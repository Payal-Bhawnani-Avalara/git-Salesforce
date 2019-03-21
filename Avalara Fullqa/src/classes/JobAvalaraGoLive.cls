public class JobAvalaraGoLive implements Database.Batchable<sObject>,Database.allowscallouts, Schedulable{

    private String productType;
    private String additionalWhere;

    public JobAvalaraGoLive(String productType){
        this.productType = productType;
    }

    public JobAvalaraGoLive(String productType, String additionalWhere){
        this.productType = productType;
        this.additionalWhere = additionalWhere;
    }

    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(
            'SELECT Id, AvaTax_PX_Data_Feed_Dev__r.CX_911_Funding_POA_Complete__c,PX_Data_Feed__r.CX_911_Funding_POA_Complete__c,AvaTax_PX_Data_Feed_Dev__r.CX_911_Filing_Calendar_Creation__c,AvaTax_PX_Data_Feed_Dev__r.Account__r.PROD_AvaTax_Account__c, AvaTax_PX_Data_Feed_Dev__r.CX_911_CUP_Filing_Calendars_Done__c, AvaTax_PX_Data_Feed_Dev__r.CX_911_First_Filing__c, AvaTax_PX_Data_Feed_Dev__r.CX_911_Normal_Compliance__c, AvaTax_PX_Data_Feed_Dev__r.CX_911_Filing_Request_Submitted__c, '
                +' PX_Data_Feed__r.Account__r.PROD_AvaTax_Account__c, PX_Data_Feed__r.CX_911_CUP_Filing_Calendars_Done__c, PX_Data_Feed__r.CX_911_First_Filing__c, PX_Data_Feed__r.CX_911_Normal_Compliance__c, PX_Data_Feed__r.CX_911_Filing_Request_Submitted__c,'+
                +' PX_Data_Feed__r.CC_Account_CC_Date_Provisioned__c, PX_Data_Feed__r.CC_1st_Customer_Creation_Date__c, PX_Data_Feed__r.CC_1st_Certificate_Creation_Date__c, AvaTax_PX_Data_Feed_Dev__r.CC_Account_CC_Date_Provisioned__c, AvaTax_PX_Data_Feed_Dev__r.CC_1st_Customer_Creation_Date__c, AvaTax_PX_Data_Feed_Dev__r.CC_1st_Certificate_Creation_Date__c' +
            ' FROM Case'+
            ' WHERE RecordType.Name =\'Implementation\' AND isClosed = false AND Implementation_Product__c =:productType '
            + (String.isBlank(additionalWhere) ? '' : additionalWhere)
        );
    }

    public void execute(Database.BatchableContext BC, List<Case> scope){
        Map<String,Account_Statistics__c> statisticsMap = new Map<String,Account_Statistics__c>();
        Map<String,List<AvalaraGoLiveModel.GoLiveResponse>> responseMap = new Map<String,List<AvalaraGoLiveModel.GoLiveResponse>>();

        for(Case cs : scope){
            AvalaraGoLiveUtil.setData(cs, productType, AvalaraGoLiveUtil.getData(cs, productType));
            if(cs.AvaTax_PX_Data_Feed_Dev__c <> NULL){
                statisticsMap.put(cs.AvaTax_PX_Data_Feed_Dev__c,cs.AvaTax_PX_Data_Feed_Dev__r);
                System.debug('cs.AvaTax_PX_Data_Feed_Dev__c,cs.AvaTax_PX_Data_Feed_Dev__r>>'+cs.AvaTax_PX_Data_Feed_Dev__c);
                System.debug('cs.AvaTax_PX_Data_Feed_Dev__c,cs.AvaTax_PX_Data_Feed_Dev__r>>'+cs.AvaTax_PX_Data_Feed_Dev__r);
            }
            if(cs.PX_Data_Feed__c <> NULL){
                statisticsMap.put(cs.PX_Data_Feed__c,cs.PX_Data_Feed__r);
            }

        }

        update statisticsMap.values();
    }

    public void finish(Database.BatchableContext BC){
    }

    public void execute(SchedulableContext sc) {
        Database.executeBatch(this,1);   
    }
   
    public static void schedule(){
       String sch = '';
       sch = '0 0 5,13,19 * * ? *';
       system.schedule('JobAvalaraGoLive Avalara AvaTax Run Everyday 5,13,19', sch, new JobAvalaraGoLive('Avalara AvaTax'));
       system.schedule('JobAvalaraGoLive Avalara CertCapture Run Everyday 5,13,19', sch, new JobAvalaraGoLive('Avalara CertCapture'));
       system.schedule('JobAvalaraGoLive Avalara Returns Run Everyday 5,13,19', sch, new JobAvalaraGoLive('Avalara Returns'));
    }

  
}