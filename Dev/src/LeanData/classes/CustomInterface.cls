/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class CustomInterface {
    global CustomInterface() {

    }
    global virtual List<SObject> customFilter(SObject primary, List<SObject> matchedSObjects, String parameter) {
        return null;
    }
    global virtual List<SObject> customRoutingRule(SObject primary, List<SObject> secondaries, String arg) {
        return null;
    }
    global virtual String customRoutingRule(SObject candidate, List<SObject> matchedLeadList, List<SObject> matchedAccountList, String arg) {
        return null;
    }
    global virtual String customRoutingRule(SObject primary, Map<String,SObject> chosenSObjects, String parameter) {
        return null;
    }
    global virtual List<SObject> customTiebreakerRule(SObject primary, List<SObject> matchedSObjects, String parameter) {
        return null;
    }
    global virtual Set<String> getCustomAccountFields() {
        return null;
    }
    global virtual Set<String> getCustomContactFields() {
        return null;
    }
    global virtual Set<String> getCustomLeadFields() {
        return null;
    }
    global virtual Id getLeadOwnerIdFromChosenAccount(Lead candidateLead, Account chosenAccount) {
        return null;
    }
    global virtual Id getLeadOwnerIdFromChosenAccount(Lead candidateLead, Account chosenAccount, String nodeName) {
        return null;
    }
    global virtual Id getLeadOwnerIdFromChosenLead(Lead candidateLead, Lead chosenLead) {
        return null;
    }
    global virtual Id getLeadOwnerIdFromChosenLead(Lead candidateLead, Lead chosenLead, String nodeName) {
        return null;
    }
    global static Id getMappedOwner(SObject sobj, String mapName) {
        return null;
    }
    global virtual void postProcessAllTriggeredLeads(List<Lead> leads) {

    }
    global virtual void preRoutingCallback(List<Lead> candidateLeads, List<Lead> matchedLeads, List<Account> matchedAccounts) {

    }
    global virtual void processUnroutedLead(Lead lead) {

    }
    global virtual void processUnroutedLeads(List<Lead> leads) {

    }
}