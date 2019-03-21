public class APIBookingTemplate {

	public String externalId {get;set;} 
	public String customerAccountId {get;set;} 
	public String type {get;set;}
	public String status {get;set;} 
	public String effectiveFrom {get;set;} 
	public List<AddItem> addItems {get;set;} 
	public List<DropItem> dropItems {get;set;} 

	public class AddItem { 
		public String externalId {get;set;} 
		public String invoiceOwnerId {get;set;} 
		public Decimal quantity {get;set;} 
		public String featureDetailId {get;set;} 
		public String cpqId {get;set;} 
		//public String endOfAgreementBehavior {get;set;} 
		//public Decimal discountAmount {get;set;} 
		public Decimal discountPercentage {get;set;} 
		public String accessStart {get;set;} 
		public String termStart {get;set;} 
		public String termEnd {get;set;} 
		public String billingFrequency {get;set;} 
		public String connectorId {get;set;} 
		public Decimal discountedExtendedAmount {get;set;} 
		public Decimal listPrice {get;set;} 
	}
	public class DropItem {
		public String externalId {get;set;} 
		public Decimal quantity {get;set;} 
		public String addRateplanChargeId {get;set;} 
		public String effectiveFrom {get;set;} 
	}
}