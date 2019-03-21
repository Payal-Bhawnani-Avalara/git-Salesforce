trigger CreateAssetonClosedWon on Opportunity (after insert, after update) {

String Uid = UserInfo.getUserId();

     for(Opportunity o: trigger.new){ 
      if(o.OrderCompletedDate__c != null && o.HasOpportunityLineItem == true && Uid != '00540000002Jg6CAAS' && Uid != '00540000001VkdoAAC'){
         String opptyId = o.Id;
         OpportunityLineItem[] OLI = [Select UnitPrice, Quantity, PricebookEntry.Product2Id, PricebookEntry.Product2.Name, Description, Converted_to_Asset__c  
                                      From OpportunityLineItem 
                                      where OpportunityId = :opptyId  and Converted_to_Asset__c = false];
         Asset[] ast = new Asset[]{};
         Asset a = new Asset();
         for(OpportunityLineItem ol: OLI){
            a = new Asset();
        a.AccountId = o.AccountId;
            a.Product2Id = ol.PricebookEntry.Product2Id;
            a.Quantity = ol.Quantity;
            a.Price =  ol.UnitPrice;
            a.PurchaseDate = o.CloseDate;
            a.Status = 'Purchased';
            a.Description = ol.Description;
            a.Name = ol.PricebookEntry.Product2.Name;
            a.Opportunity__c = o.Id;
            ast.add(a);
            ol.Converted_to_Asset__c = true;
       }
      update OLI; 
      insert ast;
     }
    }
}