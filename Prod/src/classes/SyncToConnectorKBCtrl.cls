public with sharing class SyncToConnectorKBCtrl {
	private String fmId;

	public SyncToConnectorKBCtrl(ApexPages.StandardController controller) {
		fmId = controller.getId();
	}

	public Pagereference sync(){
		List<Functional_Matrix__c> fms = Database.query(
			'SELECT ' +
				String.join(new List<String>(Functional_Matrix__c.SObjectType.getDescribe().fields.getMap().keySet()), ',') +
			'  FROM Functional_Matrix__c WHERE Id=:fmId'
		);

		FunctionalMatrixHandler.syncToConnectorKB(fms);
		return new Pagereference('/' + fmId);
	}
}