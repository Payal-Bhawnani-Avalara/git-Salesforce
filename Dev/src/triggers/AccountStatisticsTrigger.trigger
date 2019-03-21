trigger AccountStatisticsTrigger on Account_Statistics__c (after update) {
    AvalaraGoLiveUtil.closeMilestones(Trigger.new, Trigger.old);
}