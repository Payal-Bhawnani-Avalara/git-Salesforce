@isTest(SeeAllData = true)
public class TestUtil {
    static {
        TestCreateMetadata tcm=new TestCreateMetadata();
    }
    public static List<Lead> createLead(Integer numberOfRecords,Boolean isInsert) {
            List<Lead> listLeads=new List<Lead>();
        for(Integer i=0;i<numberOfRecords;i++){
            Lead testLead = new Lead();
            testLead.LastName='LastName'+i;
            testLead.Company='CompanyName'+i;
            testLead.Opportunity_Type__c='New';
            testLead.OpportunitySubType__c='AvaTax';
            testLead.Status='Prospect';
            listLeads.add(testLead);            
        }
        if(isInsert){
                insert listLeads;
        }
        return listLeads;
    }
    public static List<Account> createAccount(Id recordTypeId,Integer numberOfRecords,Boolean isInsert) {
            List<Account> listAccounts=new List<Account>();
        for(Integer i=0;i<numberOfRecords;i++){
            Account testAcc = new Account();
            testAcc.RecordTypeId=recordTypeId;
            testAcc.Name = 'my test account'+i;
            testAcc.BillingState = 'CA';
            testAcc.ShippingState = 'CA';
            //testAcc.Type__c = 'Customer';
            listAccounts.add(testAcc);          
        }
        if(isInsert){
                insert listAccounts;
        }
        return listAccounts;
    }
    public static List<Contact> createContact(Id AccountId,Integer numberOfRecords,Boolean isInsert) {
            List<Contact> listContacts=new List<Contact>();
        for(Integer i=0;i<numberOfRecords;i++){
            Contact testContact = new Contact();
            testContact.FirstName = 'firstname';
            testContact.LastName = 'lastname'+i;
            testContact.Email = 'email@mail.me';
            testContact.AccountId = AccountId;
            listContacts.add(testContact);          
        }
        if(isInsert){
                insert listContacts;
        }
        return listContacts;
    }
    public static List<Case> createCase(Id recordTypeId,Integer numberOfRecords,Boolean isInsert) {
            List<Case> listCase=new List<Case>();
        for(Integer i=0;i<numberOfRecords;i++){
            Case testCase = new Case();
            testCase.Status = 'Open';
            testCase.RecordTypeId = recordTypeId;
            listCase.add(testCase);         
        }
        if(isInsert){
                insert listCase;
        }
        return listCase;
    }
    public static List<Opportunity> createOpportunity(Id AccountId,Id recordTypeId,Integer numberOfRecords,Boolean isInsert) {
            List<Opportunity> listOpportunity=new List<Opportunity>();
        for(Integer i=0;i<numberOfRecords;i++){
            Opportunity testOpportunity = new Opportunity();
            testOpportunity.Name = 'my test opportunity'+i;
            testOpportunity.Type = 'New';
            testOpportunity.SubType__c = 'AvaTax';
            testOpportunity.RecordTypeId = recordTypeId;
            testOpportunity.AccountId = AccountId;
            testOpportunity.CloseDate =date.today().addDays(30);
            testOpportunity.StageName ='Verbally Committed';
            testOpportunity.LeadSource = 'Event';
            testOpportunity.Amount = 10.00;
            listOpportunity.add(testOpportunity);           
        }
        if(isInsert){
                insert listOpportunity;
        }
        return listOpportunity;
    }
    //add role 
    public static List<OpportunityContactRole> createOpportunityContactRole(Id OpportunityId,Id ContactID,Id roleId,Integer numberOfRecords,Boolean isInsert) {
            List<OpportunityContactRole> listOpportunityContactRole=new List<OpportunityContactRole>();
        for(Integer i=0;i<numberOfRecords;i++){
            OpportunityContactRole testOpportunityContactRole = new OpportunityContactRole();
            testOpportunityContactRole.OpportunityId = OpportunityId;
            testOpportunityContactRole.contactId = ContactID;
             testOpportunityContactRole.Role= roleId;
            listOpportunityContactRole.add(testOpportunityContactRole);         
        }
        if(isInsert){
                insert listOpportunityContactRole;
        }
        return listOpportunityContactRole;
    }
     //Create Product
    public static List<Product2> createProdcut(Integer numberOfRecords,Boolean isInsert)
    {
          List<Product2> listProduct =new List<Product2>();
        for(Integer i=0;i<numberOfRecords;i++){
            Product2 testProduct = new Product2();
            testProduct.Name = 'my test prodcut'+i;
            testProduct.ProductCode = 'my test prodcut code'+i;
            testProduct.IsActive = true;
            listProduct.add(testProduct);           
        }
        if(isInsert){
                insert listProduct;
        }
        return listProduct;
    }
    
    //Create pricebook entry
    public static List<PricebookEntry> createPricebookEntry(Id prdId,Integer numberOfRecords,Boolean isInsert)
    {
      Id pricebookId = Test.getStandardPricebookId();
          List<PricebookEntry> listPricebookEntry=new List<PricebookEntry>();
        for(Integer i=0;i<numberOfRecords;i++){
            PricebookEntry testPricebookEntry = new PricebookEntry();
            testPricebookEntry.Pricebook2Id = pricebookId;
            testPricebookEntry.Product2Id = prdId;
            testPricebookEntry.UnitPrice = 10.00;
            testPricebookEntry.IsActive = true;
            listPricebookEntry.add(testPricebookEntry);         
        }
        if(isInsert){
                insert listPricebookEntry;
        }
        return listPricebookEntry;
    }
    
    //add Opportunity Line Item  
    public static List<OpportunityLineItem> createOpportunityLineItem(Id OpportunityId,Id pricebookEntryID, Integer numberOfRecords,Boolean isInsert) {
            List<OpportunityLineItem> listOpportunityLineItem=new List<OpportunityLineItem>();
        for(Integer i=0;i<numberOfRecords;i++){
            OpportunityLineItem testOpportunityLineItem = new OpportunityLineItem();
            testOpportunityLineItem.OpportunityId = OpportunityId;
            testOpportunityLineItem.Quantity = 1;
            testOpportunityLineItem.PricebookEntryId = pricebookEntryID;
            testOpportunityLineItem.UnitPrice = 100.00;
            testOpportunityLineItem.TotalPrice__c = 100.00;
            listOpportunityLineItem.add(testOpportunityLineItem);           
        }
        if(isInsert){
                insert listOpportunityLineItem;
        }
        return listOpportunityLineItem;
    }
    public static List<User> createUser(ID profileId,Id roleId,Integer numberOfRecords,Boolean isInsert) {
            List<User> listUser =new List<User>();
        for(Integer i=0;i<numberOfRecords;i++){
            User testUser = new User();
            testUser.FirstName = 'firstname';
            testUser.LastName = 'lastname'+i;
            testUser.Email = 'test' + i + '@example.com';
            testUser.Alias = 'test' + i;
            testUser.Username = 'test' + i + '@example.com';
            testUser.LocaleSidKey = 'en_US';
            testUser.TimeZoneSidKey = 'GMT';
            testUser.ProfileID = profileId;
            testUser.UserRoleId = roleId;
            testUser.LanguageLocaleKey = 'en_US';
            testUser.EmailEncodingKey = 'UTF-8';
            listUser.add(testUser);         
        }
        if(isInsert){
                insert listUser;
        }
        return listUser;
    }
    public static List<Event> createEvent(Id WhoId,Id WhatId, Id UserID,Integer numberOfRecords,Boolean isInsert) {
            List<Event> listEvent =new List<Event>();
        for(Integer i=0;i<numberOfRecords;i++){
            Event testEvent = new Event();
            testEvent.WhoId = WhoID;
            testEvent.OwnerId = UserID;
            testEvent.IsAllDayEvent = true;
            testEvent.ActivityDate =  Date.today();
            testEvent.WhatId = WhatId;
            listEvent.add(testEvent);           
        }
        if(isInsert){
                insert listEvent;
        }
        return listEvent;
    }
    public static List<Connector__c> createConnector(Id AuthorId,Id ManagedById,Integer numberOfRecords,Boolean isInsert) {
            List<Connector__c> listConnector =new List<Connector__c>();
        for(Integer i=0;i<numberOfRecords;i++){
            Connector__c testConnector = new Connector__c();
            testConnector.Author__c = AuthorId;
            testConnector.Managed_By__c = ManagedById;
            testConnector.Name = 'my test connector'+i;
            listConnector.add(testConnector);           
        }
        if(isInsert){
                insert listConnector;
        }
        return listConnector;
    } 
    
     public static List<KeyPairValue__c> createKeyPairValueCustomSetting(String Name,String Values,Integer numberOfRecords,Boolean isInsert) {   
         List<KeyPairValue__c> listKeyPairValueCustomSetting =new List<KeyPairValue__c>();
         for(Integer i=0;i<numberOfRecords;i++){
            KeyPairValue__c testKeyPairValueCustomSetting = new KeyPairValue__c();
            testKeyPairValueCustomSetting.Name = Name;
            testKeyPairValueCustomSetting.Values__c = Values;  
            listKeyPairValueCustomSetting.add(testKeyPairValueCustomSetting);
        }   
        if(isInsert){
                insert listKeyPairValueCustomSetting;
        }
        return listKeyPairValueCustomSetting;
    } 
      public static List<CameleonCPQ__Quote__c> createProsQuote(Id AccountId,Id OpportunityId,Id ContactID,Integer numberOfRecords,Boolean isInsert) {   
         List<CameleonCPQ__Quote__c> listProsQuote=new List<CameleonCPQ__Quote__c>();
         for(Integer i=0;i<numberOfRecords;i++){
            CameleonCPQ__Quote__c testProsQuote = new CameleonCPQ__Quote__c();
            testProsQuote.OpportunityId__c = OpportunityId;
            testProsQuote.Name = 'my test cpq'+i;  
            testProsQuote.CameleonCPQ__AccountId__c = AccountId;
            testProsQuote.BillToContact__c = ContactID;
            testProsQuote.ShipToContact__c = ContactID;
            testProsQuote.ProvisioningContact__c = ContactID;
            listProsQuote.add(testProsQuote);
        }   
        if(isInsert){
                insert listProsQuote;
        }
        return listProsQuote;
    } 
     public static List<Campaign> createCampaign(Id recordTypeId,Integer numberOfRecords,Boolean isInsert) {   
         List<Campaign> listCampaign=new List<Campaign>();
         for(Integer i=0;i<numberOfRecords;i++){
            Campaign testCampaign = new Campaign();
            testCampaign.RecordTypeId = recordTypeId;
            testCampaign.Name = 'my test campaign'+i;  
            testCampaign.Lead_Goals__c = i;
            testCampaign.Num_Expected_Opportunities__c = i;
            testCampaign.StartDate = system.today();
            testCampaign.Budget_Owner__c = 'Avalara';
            testCampaign.CurrencyIsoCode ='USD';
            listCampaign.add(testCampaign);
        }   
        if(isInsert){
                insert listCampaign;
        }
        return listCampaign;
    } 
     public static List<Attachment> createAttachment(Integer numberOfRecords,Boolean isInsert) {   
         List<Attachment> listAttachment=new List<Attachment>();
         for(Integer i=0;i<numberOfRecords;i++){
            Attachment testAttachment = new Attachment();
            testAttachment.Name = 'my test attachment'+i;  
            Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
            testAttachment.body=bodyBlob;
            listAttachment.add(testAttachment);
        }   
        if(isInsert){
                insert listAttachment;
        }
        return listAttachment;
    } 
    
     public static List<Zuora__CustomerAccount__c> createZuoraCustomerAccount(Id accountID,Integer numberOfRecords,Boolean isInsert) {   
         List<Zuora__CustomerAccount__c> listZuoraCustomerAccount=new List<Zuora__CustomerAccount__c>();
         for(Integer i=0;i<numberOfRecords;i++){
            Zuora__CustomerAccount__c testZuoraCustomerAccount = new Zuora__CustomerAccount__c();
            testZuoraCustomerAccount.Name = 'my test billing account'+i; 
            testZuoraCustomerAccount.Zuora__Account__c=accountID;
            testZuoraCustomerAccount.Zuora__Zuora_Id__c = 'test'+i;
            listZuoraCustomerAccount.add(testZuoraCustomerAccount);
        }   
        if(isInsert){
                insert listZuoraCustomerAccount;
        }
        return listZuoraCustomerAccount;
    } 
    
    public static List<zqu__Quote__c> createQuote(Id OpportunityId, Integer numberOfRecords, Boolean isInsert) {
        List<zqu__Quote__c> listQuote = new List<zqu__Quote__c>();
        for(Integer i=0; i<numberOfRecords; i++){
            zqu__Quote__c testQuote = new zqu__Quote__c();
            testQuote.Name = 'TestQuote'+i;
            testQuote.zqu__Opportunity__c = OpportunityId;
            testQuote.CurrencyIsoCode = 'USD';
            testQuote.BillingFrequency__c = 'Monthly';
            testQuote.FreeMonths__c = 0;
            testQuote.zqu__Status__c = 'Sent to Z-Billing';
            testQuote.O_P_Status__c = 'Complete';
            listQuote.add(testQuote);
        }
        if(isInsert){
            insert listQuote;
        }
        return listQuote;
    }
    
    public static List<zqu__QuoteAmendment__c> createQuoteAmendment(Id QuoteId, Integer numberOfRecords, Boolean isInsert) {
        List<zqu__QuoteAmendment__c> listQuoteAmendment = new List<zqu__QuoteAmendment__c>();
        for(Integer i=0; i<numberOfRecords; i++){
            zqu__QuoteAmendment__c testQuoteAmendment = new zqu__QuoteAmendment__c();
            testQuoteAmendment.Name = 'TestQuoteAmendment'+i;
            testQuoteAmendment.zqu__Quote__c = QuoteId;
            testQuoteAmendment.CurrencyIsoCode = 'USD';
            listQuoteAmendment.add(testQuoteAmendment);
        }
        if(isInsert){
            insert listQuoteAmendment;
        }
        return listQuoteAmendment;
    }
    
    public static List<zqu__QuoteRatePlan__c> createQuoteRatePlan(Id QuoteId, Id QuoteAmendmentId, Integer numberOfRecords, Boolean isInsert) {
        List<zqu__QuoteRatePlan__c> listQuoteRatePlan = new List<zqu__QuoteRatePlan__c>();
        for(Integer i=0; i<numberOfRecords; i++){
            zqu__QuoteRatePlan__c testQuoteRatePlan = new zqu__QuoteRatePlan__c();
            testQuoteRatePlan.Name = 'TestQuoteRatePlan Connector '+i + '- Monthly';
            //testQuoteRatePlan.Name = 'TestQuoteRatePlan '+i;
            testQuoteRatePlan.zqu__Quote__c = QuoteId;
            testQuoteRatePlan.zqu__QuoteAmendment__c = QuoteAmendmentId;
            testQuoteRatePlan.CurrencyIsoCode = 'USD';
            //testQuoteRatePlan.zqu__QuoteProductName__c = 'Not Avalara AvaTax';
            testQuoteRatePlan.zqu__QuoteProductName__c = i==1 ? 'Avalara Returns' : 'Not Avalara AvaTax';
            //testQuoteRatePlan.zqu__AmendmentType__c = i==2 ? 'RemoveProduct' : 'NewProduct';
            listQuoteRatePlan.add(testQuoteRatePlan);
        }
        if(isInsert){
            insert listQuoteRatePlan;
        }
        return listQuoteRatePlan;
    }
    
    public static List<zqu__QuoteCharge__c> createQuoteCharge(Id QuoteId, Id ProductRatePlanChargeId, Id ConnectorId, Integer numberOfRecords, Boolean isInsert) {
        List<zqu__QuoteCharge__c> listQuoteCharge = new List<zqu__QuoteCharge__c>();
        for(Integer i=0; i<numberOfRecords; i++){
            zqu__QuoteCharge__c testQuoteCharge = new zqu__QuoteCharge__c();
            testQuoteCharge.Name = 'TestQuoteCharge'+i;
            testQuoteCharge.zqu__Quote__c = QuoteId;
            testQuoteCharge.zqu__RatePlanCharge_ZuoraID__c = ProductRatePlanChargeId;
            testQuoteCharge.Connector__c = ConnectorId;
            testQuoteCharge.CurrencyIsoCode = 'USD';
            testQuoteCharge.PriceSchedule__c = 'CertCapture Managed Services';
            listQuoteCharge.add(testQuoteCharge);
        }
        if(isInsert){
            insert listQuoteCharge;
        }
        return listQuoteCharge;
    }
    
    public static List<zqu__QuoteRatePlanCharge__c> createQuoteRatePlanCharge(Id QuoteRatePlanId, Id ConnectorId, Integer numberOfRecords, Boolean isInsert) {
        List<zqu__QuoteRatePlanCharge__c> listQuoteRatePlanCharge = new List<zqu__QuoteRatePlanCharge__c>();
        for(Integer i=0; i<numberOfRecords; i++){
            zqu__QuoteRatePlanCharge__c testQuoteRatePlanCharge = new zqu__QuoteRatePlanCharge__c();
            testQuoteRatePlanCharge.Name = 'TestQuoteRatePlanCharge'+i;
            testQuoteRatePlanCharge.zqu__QuoteRatePlan__c = QuoteRatePlanId;
            testQuoteRatePlanCharge.Connector__c = ConnectorId;
            testQuoteRatePlanCharge.CurrencyIsoCode = 'USD';
            testQuoteRatePlanCharge.PriceSchedule__c = 'Enterprise';
            listQuoteRatePlanCharge.add(testQuoteRatePlanCharge);
        }
        if(isInsert){
            insert listQuoteRatePlanCharge;
        }
        return listQuoteRatePlanCharge;
    }
    
    public static List<zqu__QuoteChargeSummary__c> createQuoteChargeSummary(Id QuoteId, Id OpportunityId, Id QuoteChargeId, List<zqu__QuoteRatePlan__c> QuoteRatePlanList, Id QuoteRatePlanChargeId, Integer numberOfRecords, Boolean isInsert) {
        List<zqu__QuoteChargeSummary__c> listQuoteChargeSummary = new List<zqu__QuoteChargeSummary__c>();
        for(Integer i=0; i<numberOfRecords; i++){
            zqu__QuoteChargeSummary__c testQuoteChargeSummary = new zqu__QuoteChargeSummary__c();
            testQuoteChargeSummary.Name = 'TestQuoteChargeSummary'+i;
            testQuoteChargeSummary.zqu__Opportunity__c = OpportunityId;
            testQuoteChargeSummary.zqu__Quote_Charge__c = QuoteChargeId;
            testQuoteChargeSummary.zqu__QuoteRatePlanCharge__c = QuoteRatePlanChargeId;
            testQuoteChargeSummary.Quote__c = QuoteId;
            testQuoteChargeSummary.zqu__QuoteRatePlan__c = QuoteRatePlanList[i].Id;
            testQuoteChargeSummary.CurrencyIsoCode = 'USD';
            testQuoteChargeSummary.zqu__Type__c = 'Recurring';
            testQuoteChargeSummary.zqu__Quantity__c = 50;
            testQuoteChargeSummary.zqu__ListPrice__c = 1200;
            testQuoteChargeSummary.zqu__EffectivePrice__c = 1000;
            testQuoteChargeSummary.HideLineItem__c = false;
            testQuoteChargeSummary.zqu__Period__c = 'Month';
            listQuoteChargeSummary.add(testQuoteChargeSummary);
        }
        if(isInsert){
            insert listQuoteChargeSummary;
        }
        return listQuoteChargeSummary;
    }
      public static List<CaseComment> createCaseComment(Integer numberOfRecords,Id parentID,Boolean isInsert) {   
         List<CaseComment> listCaseComment=new List<CaseComment>();
         for(Integer i=0;i<numberOfRecords;i++){
            CaseComment testCaseComment = new CaseComment();
            testCaseComment.ParentId = parentID; 
            testCaseComment.CommentBody='Unit Test Case Comment Body'+i;
            listCaseComment.add(testCaseComment);
        }   
        if(isInsert){
                insert listCaseComment;
        }
        return listCaseComment;
    } 
     public static List<CampaignMember> createCampaignMember(Id campaignId,String status,Integer numberOfRecords,Boolean isInsert) {   
         List<CampaignMember> listCampaignMember=new List<CampaignMember>();
         for(Integer i=0;i<numberOfRecords;i++){
            CampaignMember testCampaignMember = new CampaignMember();
            testCampaignMember.CampaignId = campaignId; 
            testCampaignMember.status=status;
            listCampaignMember.add(testCampaignMember);
        }   
        if(isInsert){
                insert listCampaignMember;
        }
        return listCampaignMember;
    } 
      public static List<Solution> createSolution(Integer numberOfRecords,Boolean isInsert) {   
     List<Solution> listSolution=new List<Solution>();
     for(Integer i=0;i<numberOfRecords;i++){
        Solution testSolution = new Solution();
        testSolution.SolutionName = 'TestSolution'+i;
        listSolution.add(testSolution);
    }    
        if(isInsert){
            insert listSolution;
        }
        return listSolution;
    } 
     public static List<Version__c> createVersion(Id connectorId, Id solutionId, Integer numberOfRecords,Boolean isInsert) {   
     List<Version__c> listVersion=new List<Version__c>();
     for(Integer i=0;i<numberOfRecords;i++){
        Version__c testVersion = new Version__c();
        testVersion.Name = 'TestVersion'+i;
        testVersion.Connector__c = connectorId;
            testVersion.Version_KB__c = solutionId;
        listVersion.add(testVersion);
    }    
        if(isInsert){
            insert listVersion;
        }
        return listVersion;
    } 
     public static List<Connector_KB__kav> createConnectorKB(Id versionId, Id solutionId, Integer numberOfRecords,Boolean isInsert) {   
     List<Connector_KB__kav> listConnectorKB=new List<Connector_KB__kav>();
     for(Integer i=0;i<numberOfRecords;i++){
        Connector_KB__kav testConnectorKB = new Connector_KB__kav();
        testConnectorKB.Title = 'TestVersion'+i;
        testConnectorKB.UrlName = 'TestVersionUrl'+i;
        testConnectorKB.Version__c = versionId;
            testConnectorKB.Unique_Identifier__c = solutionId + '||' + versionId;
        listConnectorKB.add(testConnectorKB);
    }    
        if(isInsert){
            insert listConnectorKB;
        }
        return listConnectorKB;
    } 
    public static List<Zuora__Subscription__c> createZuoraSubscription(Id accountID,Integer numberOfRecords,Boolean isInsert) {   
         List<Zuora__Subscription__c> listZuoraSubscription=new List<Zuora__Subscription__c>();
         for(Integer i=0;i<numberOfRecords;i++){
            Zuora__Subscription__c testZuoraSubscription = new Zuora__Subscription__c();
            testZuoraSubscription.Zuora__Account__c = accountID; 
            testZuoraSubscription.name='testZuoraSubscription'+i;
            listZuoraSubscription.add(testZuoraSubscription);
        }   
        if(isInsert){
                insert listZuoraSubscription;
        }
        return listZuoraSubscription;
    } 
     public static List<Zuora__SubscriptionProductCharge__c> createZuoraSubscriptionCharge(Id accountID,Id subscriptionID,Integer numberOfRecords,Boolean isInsert) {   
         List<Zuora__SubscriptionProductCharge__c> listZuoraSubscriptionCharge=new List<Zuora__SubscriptionProductCharge__c>();
         for(Integer i=0;i<numberOfRecords;i++){
            Zuora__SubscriptionProductCharge__c testZuoraSubscriptionCharge = new Zuora__SubscriptionProductCharge__c();
            testZuoraSubscriptionCharge.Zuora__Account__c = accountID; 
            testZuoraSubscriptionCharge.name='testZuoraSubscriptionCharge'+i;
            testZuoraSubscriptionCharge.Zuora__Price__c = 123;
            testZuoraSubscriptionCharge.Zuora__Model__c = 'Flat Fee Pricing';
            testZuoraSubscriptionCharge.Zuora__Type__c = 'Recurring';
            testZuoraSubscriptionCharge.Zuora__Subscription__c = subscriptionID;
            listZuoraSubscriptionCharge.add(testZuoraSubscriptionCharge);
        }   
        if(isInsert){
                insert listZuoraSubscriptionCharge;
        }
        return listZuoraSubscriptionCharge;
    } 
      public static List<Sertifi2_0__TestContract__c> createSertifiTestContract(Id prosQuoteID,Integer numberOfRecords,Boolean isInsert) {   
         List<Sertifi2_0__TestContract__c> listSertifiTestContract=new List<Sertifi2_0__TestContract__c>();
         for(Integer i=0;i<numberOfRecords;i++){
            Sertifi2_0__TestContract__c testSertifiTestContract = new Sertifi2_0__TestContract__c();
            testSertifiTestContract.name='testSertifiTestContract'+i;
            testSertifiTestContract.PROSQuote__c = prosQuoteID;
            listSertifiTestContract.add(testSertifiTestContract);
        }   
        if(isInsert){
                insert listSertifiTestContract;
        }
        return listSertifiTestContract;
    } 
     public static List<Sertifi2_0__EContractActivity__c> createSertifiTestContractActivity(Id contractID,Integer numberOfRecords,Boolean isInsert) {   
         List<Sertifi2_0__EContractActivity__c> listSertifiTestContractActivity=new List<Sertifi2_0__EContractActivity__c>();
         for(Integer i=0;i<numberOfRecords;i++){
            Sertifi2_0__EContractActivity__c testSertifiTestContractActivity = new Sertifi2_0__EContractActivity__c();
            testSertifiTestContractActivity.name='testSertifiTestContract'+i;
            testSertifiTestContractActivity.Sertifi2_0__TestContract__c =contractID;
            listSertifiTestContractActivity.add(testSertifiTestContractActivity);
        }   
        if(isInsert){
                insert listSertifiTestContractActivity;
        }
        return listSertifiTestContractActivity;
    }
    
    public static List<Account_Profile__c> createAccountProfile(Integer numberOfRecords,Boolean isInsert,Account a) {
        List<Account_Profile__c> listAccountAp=new List<Account_Profile__c>();
        for(Integer i=0;i<numberOfRecords;i++){
        Account_Profile__c testAp = new Account_Profile__c();
        testAp.Name = 'my test account Profile'+i;
        testAp.Account__c = a.id;
        listAccountAp.add(testAp);          
        }
        if(isInsert){
            insert listAccountAp;
        }
        return listAccountAp;
    } 
    
     public static List<Connector_of_Interest__c> createConnectorOfInterest(Integer numberOfRecords,Boolean isInsert,Id OpportunityID,ID ConnectorId) {
        List<Connector_of_Interest__c> listConnOfInterest=new List<Connector_of_Interest__c>();
        for(Integer i=0;i<numberOfRecords;i++){
        Connector_of_Interest__c testCOI = new Connector_of_Interest__c();
        testCOI.Opportunity__c = OpportunityID;
        testCOI.Connector__c = ConnectorId;
        listConnOfInterest.add(testCOI);          
        }
        if(isInsert){
            insert listConnOfInterest;
        }
        return listConnOfInterest;
    } 
     public static List<Account_Statistics__c> createAccountStatistics(Id accountId,Integer numberOfRecords,Boolean isInsert) {
        List<Account_Statistics__c> listAccountStatistics=new List<Account_Statistics__c>();
        for(Integer i=0;i<numberOfRecords;i++){
        Account_Statistics__c testAccStat = new Account_Statistics__c();
        testAccStat.Account__c = accountId;
        listAccountStatistics.add(testAccStat);          
        }
        if(isInsert){
            insert listAccountStatistics;
        }
        return listAccountStatistics;
    } 
     public static List<Compliance_Item__c> createComplianceItem(Integer numberOfRecords,Boolean isInsert) {
        List<Compliance_Item__c> listComplianceItem=new List<Compliance_Item__c>();
        for(Integer i=0;i<numberOfRecords;i++){
	        Compliance_Item__c testComItem = new Compliance_Item__c();
	        listComplianceItem.add(testComItem);          
        }
        if(isInsert){
            insert listComplianceItem;
        }
        return listComplianceItem;
    } 
    public static List<wisespt__WisePrediction__c> createWisePrediction(Id caseId,Integer numberOfRecords,Boolean isInsert) {
        List<wisespt__WisePrediction__c> listWisePrediction=new List<wisespt__WisePrediction__c>();
        for(Integer i=0;i<numberOfRecords;i++){
	        wisespt__WisePrediction__c testWisePrediction = new wisespt__WisePrediction__c();
	        testWisePrediction.wisespt__CaseID__c= caseId;
	        listWisePrediction.add(testWisePrediction);          
        }
        if(isInsert){
            insert listWisePrediction;
        }
        return listWisePrediction;
    } 
    public static List<SST_Onboarding__c> createSSTOnboarding(Integer numberOfRecords,Boolean isInsert) {
        List<SST_Onboarding__c> listSSTOnboarding=new List<SST_Onboarding__c>();
        for(Integer i=0;i<numberOfRecords;i++){
	        SST_Onboarding__c testSSTOnboarding = new SST_Onboarding__c();
	        listSSTOnboarding.add(testSSTOnboarding);          
        }
        if(isInsert){
            insert listSSTOnboarding;
        }
        return listSSTOnboarding;
    } 
     public static List<Communication_Activity_Data__c> createCommunicationActivityData(Integer numberOfRecords,Boolean isInsert) {
        List<Communication_Activity_Data__c> listCommunicationActivityData=new List<Communication_Activity_Data__c>();
        for(Integer i=0;i<numberOfRecords;i++){
	        Communication_Activity_Data__c testCommunicationActivityData = new Communication_Activity_Data__c();
	        listCommunicationActivityData.add(testCommunicationActivityData);          
        }
        if(isInsert){
            insert listCommunicationActivityData;
        }
        return listCommunicationActivityData;
    } 
     public static List<LiveChatVisitor> createLiveChatVisitor(Integer numberOfRecords,Boolean isInsert) {
        List<LiveChatVisitor> listLiveChatVisitor=new List<LiveChatVisitor>();
        for(Integer i=0;i<numberOfRecords;i++){
	        LiveChatVisitor testLiveChatVisitor = new LiveChatVisitor();
	        listLiveChatVisitor.add(testLiveChatVisitor);          
        }
        if(isInsert){
            insert listLiveChatVisitor;
        }
        return listLiveChatVisitor;
    } 
      public static List<LiveChatTranscript> createLiveChatTranscript(Id visitorId,Integer numberOfRecords,Boolean isInsert) {
        List<LiveChatTranscript> listLiveChatTranscript=new List<LiveChatTranscript>();
        for(Integer i=0;i<numberOfRecords;i++){
	        LiveChatTranscript testLiveChatTranscript = new LiveChatTranscript();
	        testLiveChatTranscript.liveChatVisitorId= visitorId;
	        listLiveChatTranscript.add(testLiveChatTranscript);          
        }
        if(isInsert){
            insert listLiveChatTranscript;
        }
        return listLiveChatTranscript;
    } 
}