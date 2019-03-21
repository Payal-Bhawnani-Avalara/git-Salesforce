@isTest
public class TestCreateMetadata {	
    static {
    	system.debug('TestCreateMetadata============1');
    		if(Test.isRunningTest()){
    			List<KeyPairValue__c> listKPV=new List<KeyPairValue__c>();
	       listKPV.add(TestUtil.createKeyPairValueCustomSetting('LeadResponseVelocityOwnerChange','test',1,false)[0]);
	       listKPV.add(TestUtil.createKeyPairValueCustomSetting('EloquaAvalaraCaseSafeID','00540000000yXrwAAE',1,false)[0]);
	       
	       listKPV.add(TestUtil.createKeyPairValueCustomSetting('Boomi_API_URL_Sandbox','http://api.salesforce.com/',1,false)[0]);
	       listKPV.add(TestUtil.createKeyPairValueCustomSetting('Boomi_API_Key','123456',1,false)[0]);
	       listKPV.add(TestUtil.createKeyPairValueCustomSetting('Boomi_API_URL_Production','http://api.salesforce.com/',1,false)[0]);
	       listKPV.add(TestUtil.createKeyPairValueCustomSetting('ZTBuyAPICaseSafeID','00533000003RbvNAAS',1,false)[0]);
           listKPV.add(TestUtil.createKeyPairValueCustomSetting('NonConnectorFees','a0n3300000FTiWlAAL',1,false)[0]);
           
	       listKPV.add(TestUtil.createKeyPairValueCustomSetting('EContractActivityTriggerHandler','True',1,false)[0]);
                listKPV.add(TestUtil.createKeyPairValueCustomSetting('LogOpportunityProductHistory','True',1,false)[0]);
	       insert listKPV;
	       system.debug('TestCreateMetadata============2');
    		/*	List<KeyPairValueMdt__c> listKPV=new List<KeyPairValue__c>();
	       listKPV.add(TestUtil.createKeyPairValueCustomSetting('LeadResponseVelocityOwnerChange','test',1,false)[0]);
	       listKPV.add(TestUtil.createKeyPairValueCustomSetting('EloquaAvalaraCaseSafeID','00540000000yXrwAAE',1,false)[0]);
	       insert listKPV;	 */      
    		}
    }
}