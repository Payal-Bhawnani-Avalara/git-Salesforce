trigger CCCartTriggerBeforeDelete on ccrz__E_Cart__c (before delete) {
    
    List<ccrz__E_Cart__c> cartsDeleted = Trigger.old;
    Set<String> contactIdsInCart = new Set<String>();
    Set<String> accountIdsInCart = new Set<String>();
    
    for(ccrz__E_Cart__c cd : cartsDeleted) {
        if(cd.addContact__c) {
            if(cd.ccrz__Contact__c != null) {
            	contactIdsInCart.add(cd.ccrz__Contact__c);                
            }
            if(cd.ccrz__Account__c != null) {
            	accountIdsInCart.add(cd.ccrz__Account__c);                
            }
        }
    }
    
    System.debug('contactIdsInCart: ' + contactIdsInCart);
    System.debug('accountIdsInCart: ' + accountIdsInCart);

    List<Contact> contactsToDelete = [select Id, FirstName, LastName, CreatedDate, Account.ActiveCustomer__c from Contact where Id in :contactIdsInCart and CreatedDate > :System.today().addDays(-1) and Account.ActiveCustomer__c = false];
    List<Account> accountsToDelete = [select Id, Name, CreatedDate, ActiveCustomer__c from Account where id in :accountIdsInCart and CreatedDate > :System.today().addDays(-1) and Name <> 'CCAnonymous' and ActiveCustomer__c = false];

    System.debug('contactsToDelete: ' + contactsToDelete);
    System.debug('accountsToDelete: ' + accountsToDelete);

    try {
        if(contactsToDelete.size() > 0) {
        	delete contactsToDelete;            
        } else {
            System.debug('no contacts to delete');
        }
    } catch (Exception e) {
        System.debug('ERR: Failed to delete just-created Contact associated with CCCart just deleted. Cause: ' + e.getCause() + ' | Line number: ' + e.getLineNumber() + ' | Type: ' + e.getTypeName() + ' | Message: ' + e.getMessage() + ' | Stack trace: ' + e.getStackTraceString());
    }
    
    try {
        if(accountsToDelete.size() > 0) {
            delete accountsToDelete;
        } else {
            System.debug('no accounts to delete');
        }
    } catch (Exception e) {
        System.debug('ERR: Failed to delete just-created Account associated with CCCart just deleted. Cause: ' + e.getCause() + ' | Line number: ' + e.getLineNumber() + ' | Type: ' + e.getTypeName() + ' | Message: ' + e.getMessage() + ' | Stack trace: ' + e.getStackTraceString());
    }
    
}