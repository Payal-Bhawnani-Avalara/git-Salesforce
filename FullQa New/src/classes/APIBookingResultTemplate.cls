public class APIBookingResultTemplate {

	public class DropItems {
		public String externalId;
		public BookedValues bookedValues;	
	}

	public class BookedValues {
		public Decimal nonEstimatedBookedValueComponent;
		public Decimal estimatedBookedValueComponent;
	}

	public Data data;

	public class Items {
		public String externalId;
		public BookedValues bookedValues;
	}

	public class Data {
		public List<Items> items;
		public List<DropItems> dropItems;
	}

	
	public static APIBookingResultTemplate parse(String json) {
		return (APIBookingResultTemplate) System.JSON.deserialize(json, APIBookingResultTemplate.class);
	}
}