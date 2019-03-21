@isTest
public class CCAviPriceListManagerTest {

   /* static testmethod void getPriceListItemTierTest() {
        CCAviTestUtil util = new CCAviTestUtil();
        Map<String, Object> m = util.initData();

        ccrz__E_Product__c product = (ccrz__E_Product__c) m.get('product');
        ccrz__E_PriceList__c priceList = (ccrz__E_PriceList__c) m.get('priceList');
        List<ccrz__E_PriceListItem__c> pliList = [SELECT Id FROM ccrz__E_PriceListItem__c WHERE ccrz__PriceList__c = :priceList.Id]; 

        ccrz__E_Rule__c rule = new ccrz__E_Rule__c(
            ccrz__Relation__c='Pricelist Item',
            ccrz__Name__c='PLI-tiered-pricing-rule',
            ccrz__RuleType__c='Tiered',
            ccrz__CurrencyISOCode__c='USD',
            ccrz__RuleSource__c='Pricing',
            ccrz__Enabled__c=true);
        insert rule;
        
        ccrz__E_PriceModifier__c modifier = new ccrz__E_PriceModifier__c(ccrz__DiscountType__c='Price', ccrz__Amount__c=100.00, ccrz__Quantity__c=100);
        insert modifier;

        ccrz__E_RulePricingModifier__c rpm = new ccrz__E_RulePricingModifier__c(ccrz__Rule__c=rule.Id, ccrz__PriceModifier__c=modifier.Id);
        insert rpm;
        
        ccrz__E_RuleTargetPLI__c pliRule = new ccrz__E_RuleTargetPLI__c(ccrz__E_Rule__c=rule.Id, ccrz__E_PriceListItem__c=pliList[0].Id);
        insert pliRule;

        Map<String, List<CCAviPriceListManager.PriceListItemTier>> tierMap = null;

        Test.startTest();
        CCAviPriceListManager manager = new CCAviPriceListManager();
        tierMap = manager.getPriceListItemTier(new List<String> {product.ccrz__SKU__c});
        Test.stopTest();

        System.assert(tierMap != null);
        List<CCAviPriceListManager.PriceListItemTier> tierList = tierMap.get(product.ccrz__SKU__c);
        System.assert(tierList != null);
        System.assertEquals(1, tierList.size());
        System.assertEquals('Price', tierList[0].discountType);
        System.assertEquals(100.00, tierList[0].amount);
        System.assertEquals(100, tierList[0].quantity);

    }*/

}