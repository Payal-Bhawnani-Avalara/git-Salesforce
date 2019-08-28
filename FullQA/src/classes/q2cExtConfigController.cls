/**------------------------------------------------------------------------+
Original Shift(developer@originalshift.com)
Purpose: Apex controller for q2cExtconfig lightning component fo fetch record data
based on bundle external config custom field on Features.

Details: - Retrieves Feature custom fields
		 - Retrieves records based on Feature custom field configuration
		 - Creates wrappers and returns records referenced by the Feature in a format
		 to be iterated over and displayed in the q2cExtConfig lightning component

History:
Aug 19/19 - Original Shift - Initial Implementation
------------------------------------------------------------------------+*/

public class q2cExtConfigController{

	/**
	  * Method called by q2cExtConfig lightning component to retrieve the feature data for querying ext config records.
	  *
	  * @param    bundleId    String Id of the bundle product being configured
	  * @return   SBQQ__ProductFeature__c    The feature in the bundle that has an external object configured
	  */
	@AuraEnabled
	public static SBQQ__ProductFeature__c getFeature(String bundleId){
		SBQQ__ProductFeature__c feature = [
				SELECT Id, Name, External_Config_Object__c, External_Config_Display_Fields__c,
						External_Config_Product_Field__c, External_Config_Filter_Value__c, External_Config_Operator__c,
						External_Config_Target_Field__c, External_Config_Tested_Field__c
				FROM SBQQ__ProductFeature__c
				WHERE
				SBQQ__ConfiguredSKU__c = :bundleId AND External_Config_Object__c != ''
				LIMIT 1
		];
		return feature;
	}

	/**
	  * Method called by q2cExtConfig lightning component to retrieve the records described by the feature data.
	  *
	  * @param    feature    		Product Feature record represented as a Map.
	  * @param    selected			List of strings containing the selected records.
	  * @return   tableWrapper   	A custom wrapper containing the queried object, corresponding feature options and
	  * 						  	field definition of the queried records.
	  */
	@AuraEnabled
	public static tableWrapper getRecords(Map<String, Object> feature, List<String> selected){
		String objName = (String) feature.get('External_Config_Object__c');
		String display = (String) feature.get('External_Config_Display_Fields__c');
		String product = (String) feature.get('External_Config_Product_Field__c');
		String tested = (String) feature.get('External_Config_Tested_Field__c');
		String operator = (String) feature.get('External_Config_Operator__c');
		String value = (String) feature.get('External_Config_Filter_Value__c');
		Id id = (Id) feature.get('Id');

		//Get the product options for the Ext Config Feature
		List<SBQQ__ProductOption__c> productOptions = new List<SBQQ__ProductOption__c>([
				SELECT Id, SBQQ__OptionalSKU__c,
						SBQQ__OptionalSKU__r.Name, SBQQ__OptionalSKU__r.ProductCode
				FROM SBQQ__ProductOption__c
				WHERE SBQQ__Feature__c = :id
		]);

		List<String> featureProducts = new List<String>();
		for(SBQQ__ProductOption__c po : productOptions){
			featureProducts.add(po.SBQQ__OptionalSKU__c);
		}

		List<tableColumnWrapper> tableColumns = new List<tableColumnWrapper> ();
		//Get the object definition for the feature External_Config_Object__c
		DescribeSObjectResult objResult = Schema.getGlobalDescribe().get(objName).getDescribe();

		//Get the fields defined by the feature External_Config_Display_Fields__c
		List<FieldSetMember> fieldSetMemberList = readFieldSet(display, objName);
		List<String> fields = new List<String>();

		//Convert FieldSetMember list into a string list of fields
		for(FieldSetMember fsMemberObj : fieldSetMemberList){
			fields.add(fsMemberObj.getFieldPath());
		}

		//Create a tableColumnWrapper for each field, describing it the Ext Config
		for(String field : fields){
			tableColumnWrapper colWrapper = new tableColumnWrapper();
			DescribeFieldResult fieldResult = objResult.fields.getMap().get(field).getDescribe();
			colWrapper.label = fieldResult.getLabel();
			colWrapper.fieldName = fieldResult.getName();
			colWrapper.type = String.valueOf(fieldResult.getType()).toLowerCase();
			colWrapper.sortable = true;
			tableColumns.add(colWrapper);
		}

		//Create the query from feature fields
		String query;
		if(fields.size() > 0){
			String queryFields;
			if(fields.contains('Name')){
				queryFields = 'Id, ' + getListToString(fields) + ', ' + product;
			} else{
				queryFields = 'Id, Name, ' + getListToString(fields) + ', ' + product;
			}
			String whereClause = getWhereClause(tested, operator, value) + ' AND ' + product + ' IN :featureProducts';
			query = getFullQuery(queryFields, objName, whereClause);
		}

		//Create a List of tableRowWappers defining the table data in each row
		List <SObject> tableRecords = Database.query(query);
		List <tableRowWrapper> tableRows = new List <tableRowWrapper>();
		for(SObject record : tableRecords){
			tableRowWrapper row = new tableRowWrapper();
			row.Id = record.Id;
			row.selected = selected.contains(record.Id) ? true : false;
			row.fields = new List<tableDataWrapper>();
			for(String field : fields){
				DescribeFieldResult fieldResult = objResult.fields.getMap().get(field).getDescribe();
				tableDataWrapper data = new tableDataWrapper();
				data.label = fieldResult.getLabel();
				data.data = (String) record.get(fieldResult.getName());
				data.type = String.valueOf(fieldResult.getType()).toLowerCase();
				row.fields.add(data);
			}
			tableRows.add(row);
		}

		//Package all the data into a tableWrapper
		tableWrapper tableWrapper = new tableWrapper();
		tableWrapper.tableRecord = tableRecords;
		tableWrapper.tableColumn = tableColumns;
		tableWrapper.tableOptions = productOptions;
		tableWrapper.tableRows = tableRows;

		return tableWrapper;
	}

	/**
	  * Method to get fieldset members based on field set name and object name.
	  *
	  * @param    fieldSetName	String name of a field set API name.
	  * @param    objectName	String of object API name to retrieve field set fields.
	  * @return   List   		A list of fieldset members from a specific object.
	  */
	public static List<Schema.FieldSetMember> readFieldSet(String fieldSetName, String objectName){
		Map <String, Schema.SObjectType> globalDescribeMap = Schema.getGlobalDescribe();
		Schema.SObjectType SObjectTypeObj = globalDescribeMap.get(objectName);
		Schema.DescribeSObjectResult describeSObjectResultObj = SObjectTypeObj.getDescribe();
		Schema.FieldSet fieldSetObj = describeSObjectResultObj.fieldSets.getMap().get(fieldSetName);
		return fieldSetObj.getFields();
	}

	/**
	  * Method to return SELECT query string based on list of field api names.
	  *
	  * @param    fieldList		List of String field API names to be converted into a comma separated string.
	  * @return   String   		A comma separated string of field API names.
	  */
	public static String getListToString(List<String> fieldList){
		String queryString = '';
		Boolean check = false;
		for(String s : fieldList){
			if(check) queryString += ', ';
			queryString += s;
			check = true;
		}
		return queryString;
	}

	/**
	  * Method to return WHERE clause for query string given Field Name, Operator and Filter Value.
	  *
	  * @param    fieldName		String API name of field to include in WHERE clause.
	  * @param    operator		Plain text string of representing a logical operator.
	  * @param    filterValue	String fieldName is to be compared to in the WheRE clause.
	  * @return   String   		A string representing the WHERE segment of a SOQL statement.
	  */
	public static String getWhereClause(String fieldName, String operator, String filterValue){
		String whereClauseStr = 'WHERE ' + fieldName + ' ' + operatorSwitch(operator) + filterValue + '\'';
		return whereClauseStr;
	}

	/**
	  * Method to return full query string given parameters.
	  *
	  * @param    fieldString	String of fields to be queried in SOQL statement.
	  * @param    objName		String API name of object to be queried in SOQL statement.
	  * @param    whereClause	String fieldName is to be compared to in the WheRE clause.
	  * @return   String   		A string representing the WHERE segment of a SOQL statement.
	  */
	public static String getFullQuery(String fieldString, String objName, String whereClause){
		String fullQueryString = 'SELECT ' + fieldString + ' FROM ' + objName + ' ' + whereClause;
		return fullQueryString;
	}

	/**
	  * Method to switch operator from human readable text to logical operator.
	  *
	  * @param    operator	String of human readable comparator.
	  * @return   String   	A string of a logical operator.
	  */
	public static String operatorSwitch(String operator){
		Map <String, String> opMap = new Map <String, String>();
		opMap.put('equals', '=\'');
		opMap.put('not equals', '!=\'');
		opMap.put('less than', '<');
		opMap.put('greater than', '>');
		opMap.put('greater or equals', '>=');
		opMap.put('starts with', 'LIKE');
		opMap.put('ends with', 'LIKE');
		opMap.put('contains', 'LIKE');
		String transOperator = opMap.get(operator);
		return transOperator;
	}

	/**
	  * Constructor for tableColumnWrapper, field to be displayed in a table column.
	  * label - Label of the field.
	  * fieldName - API name of the field.
	  * type - Data type the field.
	  *
	  */
	public class tableColumnWrapper{
		@AuraEnabled
		public String label{ get; set; }
		@AuraEnabled
		public String fieldName{ get; set; }
		@AuraEnabled
		public String type{ get; set; }
		@AuraEnabled
		public Boolean sortable{ get; set; }
	}

	/**
	  * Constructor for tableWrapper, all data queried to be passed back the q2cExtConfig lightning component.
	  * tableRecord - Raw list of records returned from SOQL query.
	  * tableColumn - List of tableColumnWrappers representing the columns of the table to be displayed.
	  * tableOptions - Raw list of Product Options return from a SOQL query of Feature Product Options.
	  * tableRows - List of tableRowWrappers for each record in the queried dataset.
	  */
	public class tableWrapper{
		@AuraEnabled
		public List<SObject> tableRecord{ get; set; }
		@AuraEnabled
		public List<tableColumnWrapper> tableColumn{ get; set; }
		@AuraEnabled
		public List<SObject> tableOptions{ get; set; }
		@AuraEnabled
		public List<tableRowWrapper> tableRows{ get; set; }
	}

	/**
	  * Constructor for tableDataWrapper, wrapper to iterate over in the display of each rows data to be displayed.
	  * label - Label of the data, or field name.
	  * data - String of a single field's data returned from SOQL query.
	  * type - Data type the queried data.
	  */
	public class tableDataWrapper{
		@AuraEnabled
		public String label{ get; set; }
		@AuraEnabled
		public String data{ get; set; }
		@AuraEnabled
		public String type{ get; set; }
	}

	/**
	  * Constructor for tableRowWrapper, wrapper to iterate over in the display of each rows to be displayed.
	  * Id - Id of the record represented by the row.
	  * selected - Boolean if the record's row has been previously selected.
	  * fields - List of tableDataWrappers containing all queried fields for the record.
	  */
	public class tableRowWrapper{
		@AuraEnabled
		public Id Id{ get; set; }
		@AuraEnabled
		public Boolean selected{ get; set; }
		@AuraEnabled
		public List<tableDataWrapper> fields{ get; set; }
	}
}