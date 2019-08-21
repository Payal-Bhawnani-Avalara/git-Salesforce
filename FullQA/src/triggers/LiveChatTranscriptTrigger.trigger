trigger LiveChatTranscriptTrigger on LiveChatTranscript (after delete, after insert, after undelete, after update, before delete, before insert, before update) {
    new LiveChatTranscriptHandler().run();
}