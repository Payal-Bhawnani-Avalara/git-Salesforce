@isTest
private class CC_AVA_API_Test {

    static testMethod void testgetCartDefaultCampaignValues() {
        CC_AVA_KeyPairValue__c c=new CC_AVA_KeyPairValue__c(Name='test',value__c='test',type__c='CartDefaultCampaignValues');
        insert c;
        CC_AVA_API a=new CC_AVA_API();
        a.getCartDefaultCampaignValues();
        
    }
}