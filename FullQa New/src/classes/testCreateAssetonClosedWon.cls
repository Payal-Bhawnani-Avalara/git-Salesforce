@isTest 

private class testCreateAssetonClosedWon {
    
    /* Commented out on 6/30/2015
    static testMethod void testCreateAssetonClosedWon(){
        
        Account a = [select Id from Account limit 1];
        PricebookEntry pbID = [select Id from PricebookEntry where IsActive=TRUE and Pricebook2.Name='GP SKU\'s' limit 1];
        Opportunity o = new Opportunity();
        OpportunityLineItem ol = new OpportunityLineItem();
        
        o.AccountId = a.Id;
        o.Name = 'test';
        o.StageName = 'Prospecting';
        o.CloseDate = date.today();
        o.Type = 'Existing';
        o.SubType__c = 'Epicor';
        o.Amount = 0;
        insert o;
        
        ol.OpportunityId = o.Id;
        ol.Quantity = 1;
        ol.UnitPrice = 2.00;
        ol.PricebookEntryId = pbId.Id;
        
        insert ol;
        
        //o.StageName= 'Closed Won';
        o.OrderCompletedDate__c = date.today();
        update o;
        
        delete ol;
        delete o;        
        
    }
    */
    
    
}