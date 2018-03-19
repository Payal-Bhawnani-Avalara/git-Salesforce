/**  
 * Name        : CCCart_Trigger     
 * Author      : RAJA SEKHAR CHALLARI
 * Created Date: MAY/22/2017
 * Description : This trigger is to create a lead when CCCart populates without payment token( payment method) and with buyer email.
 **/
trigger CCCart_Trigger on ccrz__E_Cart__c (before insert, before update, after insert, after update, after delete) {

     //Handler to handle all the context of CCCart
    new CCCart_TriggerHandler().run();
 }