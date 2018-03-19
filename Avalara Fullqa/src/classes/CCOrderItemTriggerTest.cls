/**  
 * Name        : CCOrderItemTriggerTest     
 * Author      : RAJA SEKHAR CHALLARI
 * Created Date: APR/25/2017
 * Description : This is a test class for CCOrderItem_Trigger and this also covers CCOrderItem_TriggerHandlerr which is to create an Opportunity Line Item when an order item in order is created in CCOrder Item Object in Cloudcraze.
 **/
@isTest
public class CCOrderItemTriggerTest {
    static testMethod void createOrderItem(){
        Test.startTest();
        cc_ava_testUtils.setupCustomSetting();
        account testAccount=new account();
        testAccount.name='Test Account';
        insert testAccount;
        ccrz__E_Order__c ccOrder=new ccrz__E_Order__c();
        ccOrder.ccrz__Account__c=testAccount.ID;
        ccOrder.ccrz__OrderDate__c=system.today();
        ccOrder.ccrz__PaymentMethod__c='No Payment Involved';
        insert ccOrder;
        ccrz__E_OrderItem__c ccOrderItem=new ccrz__E_OrderItem__c();
        ccOrderItem.ccrz__Order__c=ccOrder.ID;
        ccOrderItem.ccrz__Quantity__c=2;
        ccOrderItem.ccrz__Price__c=20;
        ccOrderItem.ccrz__SubAmount__c=40;
        insert ccOrderItem;
        List<Opportunity> opportunities=[select Id from opportunity where CC_Order__c =:ccOrder.ID];
        system.assertEquals(1,opportunities.size());
        List<opportunityLineItem> oppLineItem=[select Id from opportunityLineItem where OpportunityId =:opportunities[0].ID];
        system.assertEquals(1,oppLineItem.size());
        Test.stopTest();
        
    }
}