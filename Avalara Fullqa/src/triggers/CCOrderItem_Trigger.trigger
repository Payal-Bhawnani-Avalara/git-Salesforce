/**  
 * Name        : CCOrderItem_Trigger         
 * Author      : RAJA SEKHAR CHALLARI
 * Created Date: APR/23/2017
 * Description : This trigger is to create an Opportunity Line Item when an order item in order is created in CCOrder Item Object in Cloudcraze.
 **/
trigger CCOrderItem_Trigger on ccrz__E_OrderItem__c (after insert,before insert) {
  //Handler to handle all the context of cc order item contexts
    new CCOrderItem_TriggerHandler().run();
  
}