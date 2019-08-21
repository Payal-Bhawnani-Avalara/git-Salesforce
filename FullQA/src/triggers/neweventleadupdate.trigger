trigger neweventleadupdate on event(after insert, after update) {
  map<id,lead> leads = new map<id,lead>(), updates = new map<id,lead>();
  // Check for any leads in this trigger.
  for(event record:trigger.new) {
    if(record.whoid!=null&&record.whoid.getsobjecttype()==lead.sobjecttype) {
      leads.put(record.whoid,null);
    }
  }
  // Query existing values.
  leads.putall([select id,ISEvent_Date__c from lead where id in :leads.keyset()]);
  for(event record:trigger.new) {
    // If there is a lead and that lead has no event date, update the lead.
    if (record.whoid != null && leads.get(record.whoid)!=null && leads.get(record.whoid).ISEvent_Date__c==null) {
      leads.get(record.whoid).ISEvent_Date__c=record.startdatetime;
      updates.put(record.whoid,leads.get(record.whoid));
    }
  }
  // Update all leads that had an updated value.
  update updates.values();
}