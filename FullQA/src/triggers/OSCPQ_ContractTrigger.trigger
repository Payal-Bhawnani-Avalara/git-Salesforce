/*------------------------------------------------------------------------+
Original Shift(developer@originalshift.com)
Purpose: Trigger on the Contract

Details: - Performs Contract Twin Fielding and deforecasting of orphaned renewal opportunities

History:
Feb 12/19 - Original Shift - Initial Implementation
July 11/19 - Original Shift - Added before update for Avalara to fix twin fielding
------------------------------------------------------------------------+*/
trigger OSCPQ_ContractTrigger on Contract (before insert, before update, after update) {
    if(Trigger.isBefore) {
        if(Trigger.isInsert) {
            (new OSCPQ_ContractTriggerHandler('Default')).onBeforeInsert(Trigger.New);
        }
        else if(Trigger.isUpdate) {
            (new OSCPQ_ContractTriggerHandler('Default')).onBeforeUpdate(Trigger.New, Trigger.oldMap);
        }
    }
    else if(Trigger.isAfter) {
        if(Trigger.isUpdate) { 
        	(new OSCPQ_ContractTriggerHandler('Default')).deforecastOrphanedOpps(Trigger.New, Trigger.OldMap);
        }
    }
}