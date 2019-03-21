trigger SendNotificationOnOppWon on Opportunity (after update) {
for (Opportunity opp : Trigger.new) 
    {
        Opportunity oldOpp = Trigger.oldMap.get(opp.ID);
        
        if (oldOpp.Ding_Value__c == null && opp.Ding_Value__c != null )
        {
            Account[] wonAccount = [select name from account where id=:opp.AccountId limit 1];
            User[] wonUser = [select name from User where id=:opp.OwnerId limit 1];
  
            Integer nextDing = integer.valueOf(opp.Ding_Value__c);
            
            Decimal dollars;
            dollars = opp.BookedValue__c.intValue();
            
            If(wonAccount.size()==1 && wonUser.size()==1)
            {
                ClosedWonNotify.SendDing(nextDing,wonUser[0].Name,opp.SubType__c, wonAccount[0].Name, dollars.format(),(String)opp.Id );
                //System.debug('Closed Won Notify');
            }
        }
    }
}