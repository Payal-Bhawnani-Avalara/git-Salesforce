global class CCAccountWrapper{
	public cls_data[] data;
    public String errorMessage;    
    public Boolean isSuccess;
    public Boolean hasMoreThanOneAccount;
    public Boolean hasMoreThanOneContact;
	class cls_data {
		/*public String id;	//0010n00000H1pEvAAJ
		public String name;	//Biztech Co 48ac5434
		public cls_contacts[] contacts;*/
		public String id;	//0010n00000H1pEvAAJ
		public String name;	//Biztech Co 48ac5434
		public boolean isActive;
		public boolean isCupUser;
		public String camId;	//00533000003RbvNAAS
		public String supportLevel;	//Standard Support
		public String camName;	//ZTBuy API
		public cls_contacts[] contacts;		
	}
	class cls_contacts {
		public String id;	//0030n00000FGZgkAAH
		public String email;	//example-165b381c@example.org
		public String firstName;	//first-d4d66dbd
		public String lastName;	//last-f4b64d0e
		public String street;	//1100 2nd Ave
		public String city;	//Seattle
		public String state;	//WA
		public String country;	//US
		public String postalCode;	//98101
		public boolean isBillingContact;
		public boolean isPrimaryContact;
		public boolean onlineAuthorized;
	}
	public static CCAccountWrapper parse(String json){
		return (CCAccountWrapper) System.JSON.deserialize(json, CCAccountWrapper.class);
	}


}