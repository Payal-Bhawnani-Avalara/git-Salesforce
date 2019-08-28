/**
 * Created by jags on 2019-08-19.
 */
@isTest
public with sharing class q2cExtConfigController_Test{
	@testSetup
	static void testSetup(){
		Product2 bundle = OSCPQ_TestFactory.createBasicRenewableProduct(1, true);
		Product2 child1 = OSCPQ_TestFactory.createBasicRenewableProduct(2, true);
		Product2 child2 = OSCPQ_TestFactory.createBasicRenewableProduct(3, true);
		SBQQ__ProductFeature__c feat1 = createExtConfigFeature(bundle, 1, true);
		SBQQ__ProductFeature__c feat2 = createFeature(bundle, 2, true);
		SBQQ__ProductOption__c option1 = createOption(bundle, child1, feat1, 10, true);
		SBQQ__ProductOption__c option2 = createOption(bundle, child2, feat2, 10, true);
		Codex__c codex = createCodex(child1, true);
		List<PricebookEntry> PBEList = OSCPQ_TestFactory.createPBEntries(new List<Product2>{bundle,child1,child2}, true);
	}

	/*
     * Test that executes lightning cmp calls
     */
	@isTest
	static void simulateCmpTest() {
		SBQQ__ProductOption__c option = [SELECT Id, SBQQ__ConfiguredSKU__c FROM SBQQ__ProductOption__c LIMIT 1];
		List<String> codex = new List<String>();
		for(Codex__c c : [SELECT Id FROM Codex__c]){
			codex.add(c.Id);
		}
		Test.startTest();
		SBQQ__ProductFeature__c feat = q2cExtConfigController.getFeature(option.SBQQ__ConfiguredSKU__c);
		Map<String, Object> featureMap = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(feat));
		q2cExtConfigController.tableWrapper records = q2cExtConfigController.getRecords(featureMap,codex);
		Test.stopTest();
		System.assert(feat.External_Config_Object__c == 'Codex__c', 'The external config feature was not found');
		System.assert(records.tableRows.size() == 1, 'No codexes were returned');
		if(records.tableRows.size() > 1){
			q2cExtConfigController.tableRowWrapper row;
			for(q2cExtConfigController.tableRowWrapper rw : records.tableRows){
				row = rw;
			}
			System.assert(row.selected == true, 'Codex row should be selected');
		}
	}

	public static SBQQ__ProductFeature__c createExtConfigFeature(Product2 bundle, Integer counter, Boolean insertFlag){
		SBQQ__ProductFeature__c feat = new SBQQ__ProductFeature__c(
				Name = 'Simple Feature ' + counter,
				SBQQ__MinOptionCount__c = 0,
				SBQQ__Number__c = 10,
				SBQQ__ConfiguredSKU__c = bundle.Id,
				External_Config_Display_Fields__c = 'Display_Fields',
				External_Config_Filter_Value__c = 'Return Code',
				External_Config_Object__c = 'Codex__c',
				External_Config_Operator__c = 'equals',
				External_Config_Product_Field__c = 'Product__c',
				External_Config_Target_Field__c = 'Return_Code__c',
				External_Config_Tested_Field__c = 'RecordTypeName__c'
		);
		if(insertFlag){
			insert feat;
		}
		return feat;
	}

	public static SBQQ__ProductFeature__c createFeature(Product2 bundle, Integer counter, Boolean insertFlag){
		SBQQ__ProductFeature__c feat = new SBQQ__ProductFeature__c(
				Name = 'Simple Feature ' + counter,
				SBQQ__MinOptionCount__c = 0,
				SBQQ__Number__c = 10,
				SBQQ__ConfiguredSKU__c = bundle.Id
		);
		if(insertFlag){
			insert feat;
		}
		return feat;
	}

	public static SBQQ__ProductOption__c createOption(Product2 bundle, Product2 child, SBQQ__ProductFeature__c feat,
			Integer counter, Boolean insertFlag){
		SBQQ__ProductOption__c option = new SBQQ__ProductOption__c(
				SBQQ__Number__c = counter,
				SBQQ__ConfiguredSKU__c = bundle.Id,
				SBQQ__OptionalSKU__c = child.Id,
				SBQQ__Feature__c = feat.Id,
				SBQQ__Type__c = 'Accessory',
				SBQQ__Quantity__c = 1
		);
		if(insertFlag){
			insert option;
		}
		return option;
	}

	public static Codex__c createCodex(Product2 prod, Boolean insertFlag){
		Id RecordTypeIdCodex = Schema.SObjectType.Codex__c.getRecordTypeInfosByName().get('Return Code').getRecordTypeId();
		Codex__c codex = new Codex__c(
				Jurisdiction__c = 'AB',
				Return_Code__c = 'ABC',
				RecordTypeId = RecordTypeIdCodex,
				CountryCode__c = 'USA',
				Product__c = prod.Id,
				Return_Description__c = 'Test',
				Taxpayer_Type__c = 'Test',
				Effective_Date__c = system.today()
		);
		if(insertFlag){
			insert codex;
		}
		return codex;
	}
}