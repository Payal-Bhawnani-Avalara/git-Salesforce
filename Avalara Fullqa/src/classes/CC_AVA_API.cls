public with sharing class CC_AVA_API {
	public String getCartDefaultCampaignValues(){
		String CartDefaultCampaignValues='';
		Map<String,String> mapCartDefaultCampaignValues=new Map<String,String>();
		for(CC_AVA_KeyPairValue__c k: [Select Name,Value__c From CC_AVA_KeyPairValue__c Where Type__c='CartDefaultCampaignValues']){
			mapCartDefaultCampaignValues.put(k.Name,String.isBlank(k.Value__c)?'':k.Value__c);
		}
		CartDefaultCampaignValues=JSON.serialize(mapCartDefaultCampaignValues);
		return CartDefaultCampaignValues;
	}
    
}