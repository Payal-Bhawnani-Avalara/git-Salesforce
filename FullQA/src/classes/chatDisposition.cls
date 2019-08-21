public class chatDisposition {
	  List<SelectOption> selectOptions = new List<SelectOption>();
     public List<SelectOption> getSelectItemsList() {   
      Schema.DescribeFieldResult describeResult = LiveChatTranscript.Inbound_Call_Disposition__c.getDescribe();
      List<Schema.PicklistEntry> pickListEntries = describeResult.getPicklistValues();
            
      for( Schema.PicklistEntry eachEntry : pickListEntries) {
         selectOptions.add(new SelectOption(eachEntry.getLabel(), eachEntry.getValue()));    
      }
      return selectOptions;
  }
}