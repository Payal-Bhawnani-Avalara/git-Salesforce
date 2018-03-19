@isTest  (SeeAllData = true) 

private class testQuoteUpdateOppTerms{

    static testMethod void testQuoteUpdateOppTerms(){
   
     	Account acct = new Account();
        acct.Name='Test Account';
        acct.Industry = 'Automotive';
        acct.Type__c='Customer';
        acct.BillingStreet='100 Ravine Lane NE';
        acct.BillingCity = 'Bainbridge Island';
        acct.BillingState = 'WA';
        acct.BillingPostalCode = '98110';
        insert acct;

        Contact con = makeContact(acct);
        //see all data is on, this is pulling a random account.
        //Account a = [select Id from Account limit 1];
        //Maks Demin 8/15
        Account a = [select Id from Account where Id = :acct.Id limit 1];
        //Maks Demin 8/15 added to try to fix when deploying to prod
        /*
        testQuoteUpdateOppTerms.testQuoteUpdateOppTerms(), Details: System.DmlException: Update failed. 
        First exception on row 0 with id 0014000000H0Kn4AAF; 
        first error: FIELD_FILTER_VALIDATION_EXCEPTION, 
        The contact must exist on this account: [Partner_Commissions_Contact__c] 
        Class.testQuoteUpdateOppTerms.testQuoteUpdateOppTerms: line 21, column 1
        */ 
        a.Partner_Commissions_Contact__c = con.Id;
        update a;        
        Opportunity o = new Opportunity(); 
        OpportunityLineItem ol = new OpportunityLineItem();
        PricebookEntry pbID = [select Id from PricebookEntry where IsActive=TRUE and Pricebook2.Name='GP SKU\'s' and CurrencyIsoCode = 'USD' limit 1];
  
  
        o.AccountId = a.Id;
        o.Name = 'test';
        o.StageName = 'Prospecting';
        o.CloseDate = date.today();
        o.Type = 'Existing';
        o.SubType__c = 'Epicor';
        o.Amount = 0;
        o.CurrencyIsoCode = 'USD';
        insert o;
        
        ol.OpportunityId = o.Id;
        ol.Quantity = 1;
        ol.TotalPrice__c =3.00;
        ol.UnitPrice = 2.00;
        ol.PricebookEntryId = pbId.Id;
        
        insert ol;
 
        Opportunity targetOpp =  [select Id, Quote_Payment_Terms__c from Opportunity where id=:o.Id];
        
        Quote quo = new Quote();
        quo.OpportunityId = targetOpp.Id;
        quo.Name = 'Unit Test';
        quo.PaymentTerms__c = 'Initial Terms';
        
        insert quo;
        
        Quote insertedQuo = [select Id, PaymentTerms__c from Quote where Name='Unit Test' limit 1];
        Opportunity insertedOpp = [select Id, Quote_Payment_Terms__c from Opportunity where id=:o.Id];
        
        insertedOpp.SyncedQuoteId = insertedQuo.Id;
        
        update insertedOpp;
 
        System.assert(insertedQuo.PaymentTerms__c == 'Initial Terms');  
        insertedQuo.PaymentTerms__c = 'New Terms';
        update insertedQuo;

       	Opportunity updatedOpp = [select Id, Quote_Payment_Terms__c from Opportunity where id=:o.Id];
        System.assert(updatedOpp.Quote_Payment_terms__c=='New Terms');

    }
      /**
   * Insert a test contact associated with an account in the db
   */
  public static Contact makeContact(Account testAcc) {

    Contact testContact = new Contact();

    testContact.FirstName = 'firstname';
    testContact.LastName = 'lastname';
    testContact.Email = 'email@mail.me';

    testContact.AccountId = testAcc.Id;

    insert testContact;
    return testContact;
  }
}