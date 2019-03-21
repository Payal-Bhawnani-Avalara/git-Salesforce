public with sharing class Constants {
    //picklist values

	public static final String LEAD_STATUS_SUSPECT = 'Suspect';
	public static final String LEAD_STATUS_INQUIRY = 'Inquiry';
	public static final String LEAD_STATUS_MQL = 'MQL';
	public static final String LEAD_STATUS_PROCESSING = 'Processing';
	public static final String LEAD_STATUS_WORKING = 'Working';
	public static final String LEAD_STATUS_DISQUALIFIED = 'Disqualified';
	public static final String LEAD_STATUS_NURTURE = 'Nurture';
	public static final String LEAD_STATUS_CONVERTED = 'Converted';

	public static final String CONTACT_STATUS_SUSPECT = 'Suspect';
	public static final String CONTACT_STATUS_INQUIRY = 'Inquiry';
	public static final String CONTACT_STATUS_MQL = 'MQL';
	public static final String CONTACT_STATUS_PROCESSING = 'Processing';
	public static final String CONTACT_STATUS_WORKING = 'Working';
	public static final String CONTACT_STATUS_DISQUALIFIED = 'Disqualified';
	public static final String CONTACT_STATUS_NURTURE = 'Nurture';
    
    public static final String PROS_QUOTE_STATUS_COMPLETE = 'Complete';
    public static final String PROS_QUOTE_STATUS_CANCELED = 'Canceled';
    public static final String PROS_QUOTE_STATUS_NEW = 'New';
    public static final Set<String> DO_NOT_DELETE_STATUS =new Set<String>{PROS_QUOTE_STATUS_COMPLETE,PROS_QUOTE_STATUS_CANCELED};
    
	//Error Message
	public static final String LEAD_CANNOT_INSERT_UPDATE_LEAD_FOR_GDPR='You cant insert/update this lead with this email because of GDPR.';
	public static final String CONTACT_CANNOT_INSERT_UPDATE_CONTACT_FOR_GDPR='You cant insert/update this contact with this email because of GDPR.';
    public static final String PROS_QUOTE_CANNOT_DELETE_STATUS_COMPLETE_CANCELED='You cannot delete the Pros Quote Order if Pros Quote Order Status is Submitted/Complete/Canceled or Opportunity is closed..';
    public static final String Opportunity_CANNOT_DELETE_CLOSED_OPPORTUNITY='You cannot delete the Opportunity if Pros Quote Order Status is Submitted/Complete/Canceled or Opportunity is closed.';
    public static final String INVALID_ID='Invalid Record Id. Please contact administrator.';
    public static final String FILL_REQUIRED_FIELDS='Please fill in all required fields.';
    public static final String MERGE_PERMISSION='Merging Accounts is reserved for a select group of SFDC users. If you believe you should have these permissions, please contact DG-MktOpsData.';
}