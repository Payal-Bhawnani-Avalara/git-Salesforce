global with sharing class cc_hk_PricingAva extends ccrz.cc_hk_Pricing {
    
    global virtual override Map<String,Object> processPriceGroupPricing(Map<String,Object> inputData) {
        
        try {
			ccrz__E_PriceGroup__c priceGroup = fetchPriceGroupDetails(ccrz.cc_CallContext.priceGroupId, new List<String> { '' });
			System.debug('PRC first'+ priceGroup);
			if (priceGroup != null && (priceGroup.ccrz__PriceGroupPricelists__r.size() > 0)) {
				Set<String> pricelistIDs = new Set<String>();
				for (ccrz__E_PriceGroupPricelist__c pgp: priceGroup.ccrz__PriceGroupPricelists__r) {
					pricelistIDs.add(pgp.ccrz__Pricelist__c);
				}
				System.debug('PRC second' + pricelistIDs);
				Map<String, Decimal> itemQuantities = new Map<String, Decimal>(); 
				for (ccrz__E_PriceGroupItem__c pgi: priceGroup.ccrz__PriceGroupItems__r) {
					itemQuantities.put(pgi.ccrz__Product__r.ccrz__SKU__c, pgi.ccrz__Quantity__c);
				}
				inputData.put(PARAM_PL_IDS, pricelistIDs);
				inputData.put(PG_QTY_ITEMS, itemQuantities);
				List<ccrz__E_PriceListItem__c> items = fetchPricelistItems(inputData);
				inputData.put(PARAM_PL_ITEMS, items);
			}
		}
		catch (QueryException e) {
			System.debug(System.LoggingLevel.ERROR, 'There are no price groups matching ID ' + ccrz.cc_CallContext.priceGroupId);
		}
		return inputData;
    }
    
}