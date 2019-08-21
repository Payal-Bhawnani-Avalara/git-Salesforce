trigger ZinfiNoteTrigger on Note (after insert,after update) 
{
    if(Label.IsSyncNote=='true')
    {
         Set<Id> NotesIds = trigger.newMap.keySet();
         ZinfiSyncOnline.sendNoteDetailsFutureCall(NotesIds);
    }
}