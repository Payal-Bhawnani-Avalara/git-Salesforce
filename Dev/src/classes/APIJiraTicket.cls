public with sharing class APIJiraTicket {
	public String expand;	//renderedFields,names,schema,operations,editmeta,changelog,versionedRepresentations
	public String id;	//798981
	public String self;	//https://jira.avalara.com/rest/api/2/issue/798981
	public String key;	//IBST-13364
	public cls_fields fields;
	public class cls_fields {
		public String summary;	//BookingsRC-FinancePostManipulation
		public cls_status status;
		public cls_priority priority;
		public cls_issuetype issuetype;
		public cls_subtasks[] subtasks;
		public cls_customfield_11907 customfield_11907;
		public String customfield_25706;	//USA
		public cls_customfield_25707 customfield_25707;
		public cls_timetracking timetracking;
		public cls_customfield_26806 customfield_26806;
		public cls_customfield_15904 customfield_15904;
		public cls_customfield_15905 customfield_15905;
		public Integer workratio;	//-1
		public cls_customfield_22403 customfield_22403;
		public cls_customfield_22400 customfield_22400;
		public String customfield_26303;	//https://avalara.my.salesforce.com/0060b00000n0OPJAA2
		public List<String> labels;
		public cls_customfield_17802 customfield_17802;
		public cls_reporter reporter;
		public cls_customfield_16700 customfield_16700;
		public cls_watches watches;
		public String updated;	//2018-09-07T09:20:49.460-0700
		public String description;	//Bookings Delta to be addressed for month end and root cause identified for permanent fix.
		public cls_customfield_26711 customfield_26711;
		public cls_customfield_26713 customfield_26713;
		public String customfield_26714;	//Please update weekly Summary here:
		public List<cls_issuelinks> issueLinks;
		public cls_customfield_20802 customfield_20802;
		public cls_customfield_20800 customfield_20800;
		public cls_customfield_20801 customfield_20801;
		public String created;	//2018-09-05T15:47:13.231-0700
		public cls_assignee assignee;
		public cls_customfield_23600 customfield_23600;
		public cls_customfield_23601 customfield_23601;
		public cls_votes votes;
		public cls_worklog worklog;
		public cls_customfield_26901 customfield_26901;
		public String customfield_26915;	//<div class="panel" style="background-color: #EAECFF;border-width: 1px;"><div class="panelContent" style="background-color: #EAECFF;">

		public cls_duedate duedate;
		public cls_creator creator;
		public String customfield_21202;	//The values vary by more than $5.
		public cls_customfield_19124 customfield_19124;
		public String customfield_21201;	//The values should match within $5.
		public cls_customfield_19125 customfield_19125;
		public String customfield_21200;	//Compared Bookings Engine booked value to Salesforce opportunity amount.
		public cls_customfield_19120 customfield_19120;
		public cls_customfield_19112 customfield_19112;
		public cls_customfield_19113 customfield_19113;
		public cls_customfield_19111 customfield_19111;
		public cls_customfield_19117 customfield_19117;
		public cls_customfield_12716 customfield_12716;
		public String customfield_23807;	//1) Does the Supplier make guarantees around the safe-guarding and use of our data? (Yes/NO)
		public String customfield_23808;	//1) If this is a contract for Physical Goods are they insured until they are delivered at our desired premise? (CIP Incoterms) 
		public String customfield_23809;	//1) What is the term (length) of the contract?
		public cls_customfield_19105 customfield_19105;
		public String customfield_23811;	//1) Does breach of contract by either party reserve the right for the other party to terminate without penalty? (Yes/NO)
		public String customfield_18000;	//<div class="panel" style="background-color: #EAECFF;border-width: 1px;"><div class="panelContent" style="background-color: #EAECFF;">
		public String customfield_28600;	//<div class="panel" style="background-color: #000000;border-width: 1px;"><div class="panelContent" style="background-color: #FFA07A;">
		public String customfield_26200;	//******************
		public cls_progress progress;
		public cls_project project;
		public String resolutiondate;	//2018-09-07T09:20:49.451-0700
		public String customfield_22003;	//Thu Sep 06 14:46:39 PDT 2018
		public String customfield_10000;	//14605_*:*_1_*:*_65286389_*|*_10219_*:*_1_*:*_0_*|*_10519_*:*_1_*:*_3148_*|*_10120_*:*_1_*:*_1712878_*|*_16407_*:*_1_*:*_29942021_*|*_10520_*:*_1_*:*_52671794
		public cls_comment comment;
		public cls_customfield_19700 customfield_19700;
		public String customfield_27933;	//The path to enter (if user-defined) or retrieve (if defined by the accounting software) the <a href="https://help.avalara.com/001_Avalara_AvaTax/Find_Your_Home_Page/002_All_About_Company_Codes">company code</a>. See the Company Code page if you're not sure what that should look like.
		public cls_customfield_27936 customfield_27936;
		public String customfield_27935;	//The short marketing blurb can be seen on the heading of every connector landing page, right under the connector name. Usually 1-2 sentences, e.g., "Whether you are opening your first store or migrating from another shopping cart, 3dCart has over 100 features designed to grow your online business."
		public cls_aggregateprogress aggregateprogress;
		public cls_customfield_20902[] customfield_20902;
		public String customfield_27711;	//<b>Required:</b> Attach the accounting software logo (on a transparent background)
		public cls_customfield_15301 customfield_15301;
		public cls_customfield_27730 customfield_27730;
		public cls_customfield_26401 customfield_26401;
		public cls_customfield_26400 customfield_26400;
		public cls_customfield_13107 customfield_13107;
	}
	public class cls_resolution {
		public String self;	//https://jira.avalara.com/rest/api/2/resolution/1
		public String id;	//1
		public String description;	//A fix for this issue is checked into the tree and tested.
		public String name;	//Fixed
	}
	public class cls_customfield_19206 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/21300
		public String value;	//Trival
		public String id;	//21300
	}
	public class cls_issuelinks {
		public String id;	//544322
		public String self;	//https://jira.avalara.com/rest/api/2/issueLink/544322
		public cls_type type;
		public cls_inwardIssue inwardIssue;
	}
	public class cls_type {
		public String id;	//10200
		public String name;	//Causality
		public String inward;	//caused by
		public String outward;	//causes
		public String self;	//https://jira.avalara.com/rest/api/2/issueLinkType/10200
	}
	public class cls_inwardIssue {
		public String id;	//738460
		public String key;	//ITBSE-1176
		public String self;	//https://jira.avalara.com/rest/api/2/issue/738460
		public cls_fields fields;
	}
	public class cls_status {
		public String self;	//https://jira.avalara.com/rest/api/2/status/10219
		public String description;	//
		public String iconUrl;	//https://jira.avalara.com/images/icons/statuses/closed.png
		public String name;	//Done
		public String id;	//10219
		public cls_statusCategory statusCategory;
	}
	public class cls_statusCategory {
		public String self;	//https://jira.avalara.com/rest/api/2/statuscategory/3
		public Integer id;	//3
		public String key;	//done
		public String colorName;	//green
		public String name;	//Done
	}
	public class cls_priority {
		public String self;	//https://jira.avalara.com/rest/api/2/priority/4
		public String iconUrl;	//https://jira.avalara.com/images/icons/priorities/minor.svg
		public String name;	//Minor
		public String id;	//4
	}
	public class cls_issuetype {
		public String self;	//https://jira.avalara.com/rest/api/2/issuetype/11
		public String id;	//11
		public String description;	//Support Request issue for various tasks and internal requests.
		public String iconUrl;	//https://jira.avalara.com/images/icons/issuetypes/exclamation.png
		public String name;	//Support Request
		public boolean subtask;
	}
	public class cls_subtasks {
	}
	public class cls_customfield_11907 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/14826
		public String value;	//I Will Retest on My Own
		public String id;	//14826
	}
	public class cls_customfield_25707 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/31499
		public String value;	//Yes
		public String id;	//31499
	}
	public class cls_timetracking {
	}
	public class cls_customfield_26806 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/32867
		public String value;	//No
		public String id;	//32867
	}
	public class cls_customfield_15904 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/17400
		public String value;	//One-time
		public String id;	//17400
	}
	public class cls_customfield_15905 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/17404
		public String value;	//Monthly
		public String id;	//17404
	}
	public class cls_customfield_22403 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/24803
		public String value;	//Unchecked
		public String id;	//24803
	}
	public class cls_customfield_22400 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/24801
		public String value;	//Unchecked
		public String id;	//24801
	}
	public class cls_customfield_17802 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/20000
		public String value;	//FTE
		public String id;	//20000
	}
	public class cls_reporter {
		public String self;	//https://jira.avalara.com/rest/api/2/user?username=clayton.wiggins
		public String name;	//clayton.wiggins
		public String key;	//clayton.wiggins
		public String emailAddress;	//clayton.wiggins@avalara.com
		public String displayName;	//Clay Wiggins
		public boolean active;
		public String timeZone;	//America/Los_Angeles
	}
	public class cls_customfield_16700 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/18400
		public String value;	//Publish New
		public String id;	//18400
	}
	public class cls_watches {
		public String self;	//https://jira.avalara.com/rest/api/2/issue/IBST-13364/watchers
		public Integer watchCount;	//2
		public boolean isWatching;
	}
	public class cls_customfield_26711 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/32652
		public String value;	//No
		public String id;	//32652
	}
	public class cls_customfield_26713 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/32658
		public String value;	//Red
		public String id;	//32658
	}
	public class cls_customfield_20802 {
		public String self;	//https://jira.avalara.com/rest/api/2/user?username=UnassignedUser
		public String name;	//UnassignedUser
		public String key;	//unassigneduser
		public String emailAddress;	//UnassignedUserRobot@avalara.com
		public String displayName;	//UnassignedUser
		public boolean active;
		public String timeZone;	//America/Los_Angeles
	}
	public class cls_customfield_20800 {
		public String self;	//https://jira.avalara.com/rest/api/2/user?username=UnassignedUser
		public String name;	//UnassignedUser
		public String key;	//unassigneduser
		public String emailAddress;	//UnassignedUserRobot@avalara.com
		public String displayName;	//UnassignedUser
		public boolean active;
		public String timeZone;	//America/Los_Angeles
	}
	public class cls_customfield_20801 {
		public String self;	//https://jira.avalara.com/rest/api/2/user?username=UnassignedUser
		public String name;	//UnassignedUser
		public String key;	//unassigneduser
		public String emailAddress;	//UnassignedUserRobot@avalara.com
		public String displayName;	//UnassignedUser
		public boolean active;
		public String timeZone;	//America/Los_Angeles
	}
	public class cls_assignee {
		public String self;	//https://jira.avalara.com/rest/api/2/user?username=clayton.wiggins
		public String name;	//clayton.wiggins
		public String key;	//clayton.wiggins
		public String emailAddress;	//clayton.wiggins@avalara.com
		public String displayName;	//Clay Wiggins
		public boolean active;
		public String timeZone;	//America/Los_Angeles
	}
	public class cls_customfield_23600 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/26602
		public String value;	//System SFDC
		public String id;	//26602
	}
	public class cls_customfield_23601 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/31700
		public String value;	//Booking Investigation
		public String id;	//31700
	}
	public class cls_votes {
		public String self;	//https://jira.avalara.com/rest/api/2/issue/IBST-13364/votes
		public Integer votes;	//0
		public boolean hasVoted;
	}
	public class cls_worklog {
		public Integer startAt;	//0
		public Integer maxResults;	//20
		public Integer total;	//0
		public cls_worklogs[] worklogs;
	}
	public class cls_worklogs {
	}
	public class cls_customfield_26901 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/32503
		public String value;	//No
		public String id;	//32503
	}
	public class cls_duedate {

	}
	public class cls_creator {
		public String self;	//https://jira.avalara.com/rest/api/2/user?username=clayton.wiggins
		public String name;	//clayton.wiggins
		public String key;	//clayton.wiggins
		public String emailAddress;	//clayton.wiggins@avalara.com
		public String displayName;	//Clay Wiggins
		public boolean active;
		public String timeZone;	//America/Los_Angeles
	}
	public class cls_customfield_19124 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/21244
		public String value;	//Yes
		public String id;	//21244
	}
	public class cls_customfield_19125 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/21246
		public String value;	//Contract effective date
		public String id;	//21246
	}
	public class cls_customfield_19120 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/21235
		public String value;	//Salesforce
		public String id;	//21235
	}
	public class cls_customfield_19112 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/21222
		public String value;	//Yes
		public String id;	//21222
	}
	public class cls_customfield_19113 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/21224
		public String value;	//Partner
		public String id;	//21224
	}
	public class cls_customfield_19111 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/21220
		public String value;	//Yes
		public String id;	//21220
	}
	public class cls_customfield_19117 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/21227
		public String value;	//Yes
		public String id;	//21227
	}
	public class cls_customfield_12716 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/17000
		public String value;	//Assigned
		public String id;	//17000
	}
	public class cls_customfield_19105 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/21216
		public String value;	//1-100
		public String id;	//21216
	}
	public class cls_progress {
		public Integer progress;	//0
		public Integer total;	//0
	}
	public class cls_project {
		public String self;	//https://jira.avalara.com/rest/api/2/project/21000
		public String id;	//21000
		public String key;	//IBST
		public String name;	//Urgent Care (IBST)
	}
	public class cls_comment {
		public cls_comments[] comments;
		public Integer maxResults;	//3
		public Integer total;	//3
		public Integer startAt;	//0
	}
	public class cls_comments {
		public String self;	//https://jira.avalara.com/rest/api/2/issue/798981/comment/1724412
		public String id;	//1724412
		public cls_author author;
		public String body;	//[~jennifer.martindale] - this upgrade quote has failed to land successfully in Zuora because the subscription in Zuora has a status of Cancelled - the History on this subscription that you cancelled it (either intentionally or under some background process that runs under your name).
		public cls_updateAuthor updateAuthor;
		public String created;	//2018-09-06T00:13:12.947-0700
		public String updated;	//2018-09-06T00:13:12.947-0700
	}
	public class cls_author {
		public String self;	//https://jira.avalara.com/rest/api/2/user?username=clayton.wiggins
		public String name;	//clayton.wiggins
		public String key;	//clayton.wiggins
		public String emailAddress;	//clayton.wiggins@avalara.com
		public String displayName;	//Clay Wiggins
		public boolean active;
		public String timeZone;	//America/Los_Angeles
	}
	public class cls_updateAuthor {
		public String self;	//https://jira.avalara.com/rest/api/2/user?username=clayton.wiggins
		public String name;	//clayton.wiggins
		public String key;	//clayton.wiggins
		public String emailAddress;	//clayton.wiggins@avalara.com
		public String displayName;	//Clay Wiggins
		public boolean active;
		public String timeZone;	//America/Los_Angeles
	}
	public class cls_customfield_19700 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/21900
		public String value;	//Billing Project
		public String id;	//21900
	}
	public class cls_customfield_27936 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/33964
		public String value;	//Sales and Use
		public String id;	//33964
	}
	public class cls_aggregateprogress {
		public Integer progress;	//0
		public Integer total;	//0
	}
	public class cls_customfield_20902 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/23702
		public String value;	//AB Test
		public String id;	//23702
	}
	public class cls_customfield_15301 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/26627
		public String value;	//Dept Other
		public String id;	//26627
	}
	public class cls_customfield_27730 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/33756
		public String value;	//Discovery
		public String id;	//33756
	}
	public class cls_customfield_26401 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/32105
		public String value;	//No Access
		public String id;	//32105
		public cls_child child;
	}
	public class cls_child {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/32104
		public String value;	//No Access
		public String id;	//32104
	}
	public class cls_customfield_26400 {
		public String self;	//https://jira.avalara.com/rest/api/2/customFieldOption/32103
		public String value;	//No Access
		public String id;	//32103
		public cls_child child;
	}
	public class cls_customfield_13107 {
		public String self;	//https://jira.avalara.com/rest/api/2/user?username=UnassignedUser
		public String name;	//UnassignedUser
		public String key;	//unassigneduser
		public String emailAddress;	//UnassignedUserRobot@avalara.com
		public String displayName;	//UnassignedUser
		public boolean active;
		public String timeZone;	//America/Los_Angeles
	}
	public static APIJiraTicket parse(String json){
		return (APIJiraTicket) System.JSON.deserialize(json, APIJiraTicket.class);
	}

	/*static testMethod void testParse() {
		
		fromJSON obj = parse(json);
		System.assert(obj != null);
	}*/
}