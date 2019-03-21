trigger OpportunityLineItemTrigger on OpportunityLineItem (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
    new OpportunityLineItemTriggerHandler().run();
}