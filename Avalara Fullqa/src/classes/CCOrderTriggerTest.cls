/**  
 * Name        : CCOrderTriggerTest     
 * Author      : RAJA SEKHAR CHALLARI
 * Created Date: APR/25/2017
 * Description : This is a test class for CCOrder_Trigger and this also covers CCOrder_TriggerHandler which is to create an Opportunity and ProsQuote when an order is created in CCOrder Object in CloudCraze Application.
 **/
@isTest
public class CCOrderTriggerTest {
    static testMethod void orderCreation(){
        Test.startTest();
        account testAccount=new account();
        testAccount.name='Test Account';
        insert testAccount;
        ccrz__E_Order__c ccOrder=new ccrz__E_Order__c();
        ccOrder.ccrz__Account__c=testAccount.ID;
        ccOrder.ccrz__OrderDate__c=system.today();
        ccOrder.ccrz__PaymentMethod__c='No Payment Involved';
        insert ccOrder;
        
        List<Opportunity> opportunities=[select Id from opportunity where CC_Order__c =:ccOrder.ID];
        system.assertEquals(1,opportunities.size());
        List<CameleonCPQ__Quote__c> quotes=[select Id from CameleonCPQ__Quote__c where OpportunityId__c =:opportunities[0].ID];
        system.assertEquals(1,quotes.size());
        Test.stopTest();
    }
}