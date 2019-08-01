/*------------------------------------------------------------------------+
Original Shift(developer@originalshift.com)
Purpose: Batch class for handling order automation

Details: - Batch class used to automatically renewal forecast and/or quote based on metadata configuration.
		 - Also will handle contract activation based on metadata configuration.

History:
Feb 12/19 - Original Shift - Initial Implementation
May 19/19 - Original Shift - Added settings for Avalara to allow for manual order activation and automated contracting.
July 11/19 - Original Shift - Modification to the Contracting Handling to only contact after the NetSuite Order Id is set.
------------------------------------------------------------------------+*/
global class OSCPQ_OrderAutomation_Batch implements Database.Batchable<SObject>{
	private String settingsAPIName = 'Default';
	@TestVisible private CPQ_Setting__mdt settings = OSCPQ_Utils.getContractSettings(settingsAPIName);

	/*
	* Constructor - takes a metadata record API name, so that
	*  more scenarios can be accommodated as needed in an implementation.
	*  For example, Partner quotes may not have the same level of automation
	*/
	public OSCPQ_OrderAutomation_Batch(String sAPIName){
		if(sAPIName != null && sAPIName != ''){
			CPQ_Setting__mdt tmpSettings = OSCPQ_Utils.getContractSettings(sAPIName);
			if(tmpSettings != null){
				settingsAPIName = sAPIName;
				settings = tmpSettings;
			}
		}
	}

	/*
	 * Start method to retrieve scope of the batch.
	 * Will dynamically build the appropriate query based on the metadata settings
	 */
	global Database.QueryLocator start(Database.BatchableContext bc){
		Id cpqOrderRecordType = Schema.SObjectType.Order.getRecordTypeInfosByDeveloperName().get('CPQ').getRecordTypeId();
		if(settings == null || settings.Ordering_AutomaticActivation__c == 'Never'){
			//abort job if the settings do not specify auto-activation
			System.abortJob(bc.getJobId());
		}

		//Only run the query/batch if automation settings are set accordingly
		if(settings.Ordering_AutomaticActivation__c == 'Manual'){
			return Database.getQueryLocator('SELECT Id, Status, EffectiveDate, SBQQ__PriceCalcStatus__c, NetSuite_Sales_Order_Id__c FROM Order WHERE RecordTypeId = :cpqOrderRecordType AND Status = \'Activated\' AND SBQQ__Contracted__c = FALSE');
		} else{
			return Database.getQueryLocator('SELECT Id, Status, EffectiveDate, SBQQ__PriceCalcStatus__c, NetSuite_Sales_Order_Id__c FROM Order WHERE RecordTypeId = :cpqOrderRecordType AND Status = \'Draft\'');
		}
	}

	/*
	 * Execute function, where the bulk of the logic occurs
	 */
	global void execute(Database.BatchableContext bc, List<Order> scope){
		List<Order> ordersToUpdateNow = new List<Order>();
		List<Id> orderIdsToContract = new List<Id>(); //List of all Order Ids that we should contract in a separate transaction

		for(Order order : scope){
			Boolean activated = false; //Flag used to say that the current contract being iterated on has had changes made.

			//Handle Activation
			if(order.Status != 'Activated' && (order.SBQQ__PriceCalcStatus__c == 'Not Needed' || order.SBQQ__PriceCalcStatus__c == 'Completed')){ //This if statement SHOULD be handled via the start method's query, but being safe
				if(settings.Ordering_AutomaticActivation__c == 'OnCreate' ||
						(settings.Ordering_AutomaticActivation__c == 'OnStartDate' && Date.today() >= order.EffectiveDate)){
					order.Status = 'Activated';
					activated = true;
				}
			}

			//Handle Contracting
			if(order.Status == 'Activated' && settings.Contracting_GenerationPoint__c == 'Order' && order.NetSuite_Sales_Order_Id__c != null){
				orderIdsToContract.add(order.Id);
			}

			if(activated && settings.Ordering_AutomaticActivation__c != 'Manual'){
				ordersToUpdateNow.add(order);
			}
		}

		//If there were activated orders, then update them
		if(!ordersToUpdateNow.isEmpty()){
			update ordersToUpdateNow;
		}
		//If there are orders that need to be contracted, then queue up the job to do so.
		if(!orderIdsToContract.isEmpty()){
			OSCPQ_OrderAutomation_Queueable queueJob = new OSCPQ_OrderAutomation_Queueable(orderIdsToContract, settings);
			System.enqueueJob(queueJob);
		}
	}

	/*
	 * Final function that will check the job status; if any errors occurs, creates a QTC Error record
	 */
	global void finish(Database.BatchableContext bc){
		// Get the ID of the AsyncApexJob representing this batch job
		// from Database.BatchableContext.
		// Query the AsyncApexJob object to retrieve the current job's information.
		AsyncApexJob a = [
				SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, ExtendedStatus, CreatedById
				FROM AsyncApexJob
				WHERE Id = :bc.getJobId()
		];

		if(a.NumberOfErrors > 0 || Test.isRunningTest()){
			OSCPQ_Error__c err = OSCPQ_Utils.createQTCError('CPQ_OrderAutomation_Batch ' + a.Status, //Subject
					'CPQ', //targetPackage
					'Order Automation', //process
					'CPQ_OrderAutomation_Batch', //classMethodName
					'Total Errors: ' + a.NumberOfErrors + '\n' + a.ExtendedStatus, //Description
					a.CreatedById, //runningUserId
					true
			);
		}
	}
}