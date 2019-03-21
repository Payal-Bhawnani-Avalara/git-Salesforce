trigger RHX_QuoteChargeSummary on zqu__QuoteChargeSummary__c (after delete, after insert, after undelete, after update, before delete) {
 
    /* List<zqu__QuoteChargeSummary__c> qcsnew = new List<zqu__QuoteChargeSummary__c>();
    qcsnew = Trigger.new;
    
    for(zqu__QuoteChargeSummary__c qcs : qcsnew){
        System.debug('quotecreation trigger zqu__Quote__c: ');
        System.debug(qcs.Quote__c);
        
        List<zqu__Quote__c> quotes = [Select Id, O_P_Status__c from zqu__Quote__c where Id = :qcs.Quote__c];
        
        if(quotes.size()>0){
        System.debug('quotecreation trigger zqu__Quote__c: ');
        System.debug(quotes[0].O_P_Status__c);
        
    if(quotes[0].O_P_Status__c == 'New'){    
    Type rollClass = System.Type.forName('rh2', 'ParentUtil');
    if(rollClass != null) {
     rh2.ParentUtil pu = (rh2.ParentUtil) rollClass.newInstance();
        if (trigger.isAfter) {
            pu.performTriggerRollups(trigger.oldMap, trigger.newMap, new String[]{'zqu__QuoteChargeSummary__c'}, null);
        }
    }
    }
    }
}
}*/

 Type rollClass = System.Type.forName('rh2', 'ParentUtil');
    
    if(rollClass != null) {
     rh2.ParentUtil pu = (rh2.ParentUtil) rollClass.newInstance();
        if (trigger.isAfter) {
            pu.performTriggerRollups(trigger.oldMap, trigger.newMap, new String[]{'zqu__QuoteChargeSummary__c'}, null);
        }
    }
}