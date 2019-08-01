/**************************************************************************************************************************************************
 Name:  ZLogging 
 ==================================================================================================================================================
 Purpose: Wrapper around Zuora_Message_Log__c object.  Will assist in capturing errors that occur from callouts to Zuora.
 		  **Please note each record should be saved per api call
 --------------------------------------------------------------------------------------------------------------------------------------------------
 History:                                                        
 --------------------------------------------------------------------------------------------------------------------------------------------------
 VERSION AUTHOR              DATE          DETAIL                          
 --------------------------------------------------------------------------------------------------------------------------------------------------
    1.0  Christina Lesnick   06/05/2014    Initial Development
**************************************************************************************************************************************************/

public with sharing class ZLogging {
	public List<Zuora_Message_Log__c> logs = new List<Zuora_Message_Log__c>();

	/**
	Constructor
	**/
	public ZLogging() {
		
	}

	/**
	Add new log entry
	**/ 
	public Log newLog() {
		Log log = new Log();
		logs.add(log.record);
		return log;
	}

	/**
	DML Insert Zuora_Message_Log__c object 
	**/
	public void createMessageLogs() {
		try {
			insert logs;
		}
		catch (DmlException e) {
			System.debug('ZLogging insert error: ' + e.getMessage());
		}
		
	}

	public class Log {
		public Zuora_Message_Log__c record = new Zuora_Message_Log__c();

		/**
		Constructor
		**/
		public Log () {

		}

		/**
		Set the error code 
		**/
		public void setErrorCode(String code) {
			record.Error_Code__c = code;
		}

		/**
		Set the error description 
		**/
		public void setErrorDescription(String description) {
			record.Error_Description__c = description;
		}

		/**
		Set the error message 
		**/
		public void setErrorMessage(String message) {
			record.Error_Message__c = message;
		}

		/**
		Set the origin 
		**/
		public void setOrigin(String origin) {
			record.Origin__c = origin;
		}

		/**
		Set the severity 
		**/
		public void setSeverity(String severity) {
			record.Severity__c = severity;
		}

		/**
		Set the Request that failed
		**/
		public void setRequest(String request) {
			record.Request__c = request;
		}

		/**
		Set the response 
		**/
		public void setResponse(String response) {
			record.Response__c = response;
		}

	}
}