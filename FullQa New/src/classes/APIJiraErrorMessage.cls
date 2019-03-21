public with sharing class APIJiraErrorMessage {
	public cls_errorMessages[] errorMessages;
	public cls_errors errors;
	public class cls_errorMessages {
	}
	public class cls_errors {
		public String project;	//project is required
	}
	public static APIJiraErrorMessage parse(String json){
		return (APIJiraErrorMessage) System.JSON.deserialize(json, APIJiraErrorMessage.class);
	}

	/*static testMethod void testParse() {
		String json=		'{"errorMessages":[],"errors":{"project":"project is required"}}';
		fromJSON obj = parse(json);
		System.assert(obj != null);
	}*/    
}