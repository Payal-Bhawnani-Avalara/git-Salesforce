public class PSMSTASOrderEmail {
    public String opportunityId{get;set;}
    public String quoteId{get;set;}
    public String getInstanceName(){
        return [select id,instancename from Organization].instancename;
    }
    public List<OpportunityLineItem> getOppLineItems(){
        return [Select Id,ProductName__c,Description,ItemType__c,CPQ_Quantity__c,ListPrice__c,TotalPrice__c from OpportunityLineItem Where OpportunityId=:opportunityId];
    }
}