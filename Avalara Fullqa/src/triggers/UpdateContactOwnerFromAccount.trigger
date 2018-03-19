trigger UpdateContactOwnerFromAccount on Account (after update) {
        
        map<Id,Id> AccOwnerMap = new map<Id,Id>();
        
        for(Account a : trigger.new) {
               if(a.OwnerId != trigger.oldMap.get(a.Id).OwnerId) {
                       AccOwnerMap.put(a.Id,a.OwnerId);
               }
        }
        
        list<Contact> ContactsToUpdate = new list<Contact>();
        
        for(Contact c: [select Id, OwnerId, AccountId 
        from Contact where AccountId IN :AccOwnerMap.keySet()]) {
               if(AccOwnerMap.containsKey(c.AccountId)) {
                       Id AccOwnerId = AccOwnerMap.get(c.AccountId);
                       c.OwnerId = AccOwnerId;
                       ContactsToUpdate.add(c);
               }
        }
        
        if(ContactsToUpdate.size() > 0) {
               update ContactsToUpdate;
        }

}