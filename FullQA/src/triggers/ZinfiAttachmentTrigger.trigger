trigger ZinfiAttachmentTrigger on Attachment (after insert) {
if(Label.IsSyncNote=='true')
    {
         Set<Id> Ids = trigger.newMap.keySet();
         ZinfiSyncOnline.sendAttachDetailsFutureCall(Ids);
    }


}