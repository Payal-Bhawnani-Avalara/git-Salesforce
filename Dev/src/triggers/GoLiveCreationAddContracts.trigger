trigger GoLiveCreationAddContracts on GoLive__c (before insert) {

    List<GoLive__c> golivesnew = new List<GoLive__C>();
    golivesnew = Trigger.new;
  
    for (GoLive__C golive : golivesnew)
    {
      

        System.debug('golivecreation trigger Asset: ');
        System.debug(golive.Asset__c);
        
        List<Asset> assets = [Select Id, AccountId from Asset where Id = :golive.Asset__c];
        
        If (assets.size()>0)
            {
            System.debug('golivecreation trigger Asset Account: ');
            System.debug(assets[0].AccountId);
                
            golive.Related_to_Account__c=assets[0].AccountId;
        
            List<Contract> prodcontracts= [SELECT Id,AccountId, ProductID__c FROM Contract where AccountId = :assets[0].AccountId and ProductID__C like 'P%'  order by ProductID__C desc Limit 1];
            if (prodcontracts.size()>0)
            {
                System.debug('golivecreation Prod Contract: ');
                System.debug(prodcontracts[0].Id);
                golive.Link_to_Production_Account__c = prodcontracts[0].Id;
            }
            List<Contract> devcontracts = [SELECT Id,AccountId, ProductID__c FROM Contract where AccountId = :assets[0].AccountId and ProductID__C like 'D%' order by ProductID__C desc Limit 1];
            if (devcontracts.size()>0)
            {
                System.debug('golivecreation Dev Contract: ');
                System.debug(devcontracts[0].Id);
                golive.Link_to_Dev_Contract__c = devcontracts[0].Id;
            }
                
        }
        
    }
    
}