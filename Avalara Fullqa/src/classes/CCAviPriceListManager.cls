public with sharing class CCAviPriceListManager {

    public Map<String, Object> price(List<String> skus) {
        List<Map<String, Object>> productMapList = new List<Map<String,Object>>();
        for (String s : skus) {
            Map<String,Object> productMap = new Map<String,Object>{
                ccrz.cc_hk_Pricing.PROD_MAP_SKU => s
            };
            productMapList.add(productMap);
        }


        Map<String,Object> pricingProductInput = new Map<String,Object>{
            ccrz.cc_hk_Pricing.PARAM_PRODUCT_MAP => productMapList
        };

        ccrz.cc_hk_Pricing pricingHook = ccrz.cc_hk_Pricing.getInstance(null);
        Map<String,Object> priceReturn = pricingHook.price(pricingProductInput);

        return priceReturn;
    }

    public Map<String, List<PriceListItemTier>> getPriceListItemTier(List<String> skus) {
        Map<String, Object> priceReturn = price(skus);
        return getPriceListItemTier(priceReturn);
    }

    public Map<String, List<PriceListItemTier>> getPriceListItemTier(Map<String, Object> priceReturn) {
        Map<String, List<PriceListItemTier>> tierMap = new Map<String, List<PriceListItemTier>>();

        if (priceReturn != null) {
            Map<String, Map<String, Object>> priceResults = (Map<String, Map<String, Object>>) priceReturn.get(ccrz.cc_hk_Pricing.PRICE_RESULTS);
            Map<Id, List<ccrz__E_PriceModifier__c>> ruleMods = (Map<Id, List<ccrz__E_PriceModifier__c>>) priceReturn.get(ccrz.cc_hk_Pricing.RULE_MODS);
            Map<String, ccrz__E_Rule__c> rulesData = (Map<String, ccrz__E_Rule__c>) priceReturn.get(ccrz.cc_hk_Pricing.RULES_DATA);
            if (priceResults != null && ruleMods != null && rulesData != null) {
                Map<String, String> priceListIds = new Map<String, String>();
                for (String s : priceResults.keySet()) {
                    Map<String, Object> skuResults = priceResults.get(s);
                    if (skuResults != null) {
                        List<Object> priceEntries = (List<Object>) skuResults.get(ccrz.cc_hk_Pricing.PRICE_MAP_ENTRIES);
                        if (priceEntries != null && !priceEntries.isEmpty()) {
                            Map<String, Object> priceEntry = (Map<String, Object>) priceEntries[0];
                            priceListIds.put(s, (String) priceEntry.get('listItemID'));
                        }
                    }
                }
                if (!priceListIds.isEmpty()) {
                    for (String s : priceListIds.keySet()) {
                        String priceListId = priceListIds.get(s);
                        ccrz__E_Rule__c rule = rulesData.get(priceListId);
                        if (rule != null) {
                            String ruleType = rule.ccrz__RuleType__c;
                            String ruleSource = rule.ccrz__RuleSource__c;
                            String ruleId = rule.Id;
                            if (ruleType == 'Tiered' && ruleSource == 'Pricing' && ruleId != null) {
                                List<ccrz__E_PriceModifier__c> mods = (List<ccrz__E_PriceModifier__c>) ruleMods.get(ruleId);
                                if (mods != null) {
                                    List<PriceListItemTier> tiers = new List<PriceListItemTier>();
                                    for (ccrz__E_PriceModifier__c mod : mods) {
                                        PriceListItemTier tier = new PriceListItemTier();
                                        tier.quantity = mod.ccrz__Quantity__c;
                                        tier.discountType = mod.ccrz__DiscountType__c;
                                        tier.amount = mod.ccrz__Amount__c;
                                        tiers.add(tier);
                                    }
                                    tierMap.put(s, tiers);
                                }
                            }
                        }
                    }
                }
            }
        }
        
        return tierMap;
    }

    public class PriceListItemTier {
        public Decimal quantity {get; set;}
        public String discountType {get; set;} 
        public Decimal amount {get; set;}
    }

}