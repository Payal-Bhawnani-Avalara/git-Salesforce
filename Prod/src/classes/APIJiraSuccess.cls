public with sharing class APIJiraSuccess {
	public String id;	//799745
	public String key;	//IBST-13402
	public String self;	//https://jira.avalara.com/rest/api/2/issue/799745
	public static APIJiraSuccess parse(String json){
		return (APIJiraSuccess) System.JSON.deserialize(json, APIJiraSuccess.class); 
	}

	/*static testMethod void testParse() {
		String json=		'{"id":"799745","key":"IBST-13402","self":"https://jira.avalara.com/rest/api/2/issue/799745"}';
		fromJSON obj = parse(json);
		System.assert(obj != null);
	}    */
}