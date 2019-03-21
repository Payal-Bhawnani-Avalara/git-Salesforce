/**  
 * Name        : CCOrder_Trigger         
 * Author      : RAJA SEKHAR CHALLARI
 * Created Date: APR/20/2017
 * Description : This is trigger is to create an Opportunity and ProsQuote when an order is created in CCOrder Object in CloudCraze Application.
 **/
trigger CCOrder_Trigger on ccrz__E_Order__c (after insert){
   // To handle all the trigger context
    new ccOrder_TriggerHandler().run();
      
}