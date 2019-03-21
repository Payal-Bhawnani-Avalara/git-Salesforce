trigger valDurations on GoLive_Implementation_Duration__c (before insert, before update) {
    STOWD.API.ValidateDurations();
}