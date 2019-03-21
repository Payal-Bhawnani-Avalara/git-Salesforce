/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class ZSettingsController extends zsfjira.ZRequest {
    @RemoteAction
    global static Map<String,Object> createMeta() {
        return null;
    }
    @RemoteAction
    global static Map<String,Object> describeObjectsMeta(List<String> lstObjects) {
        return null;
    }
    @RemoteAction
    global static Map<String,Object> getAccessibleFieldsODForEnabledConcepts() {
        return null;
    }
    @RemoteAction
    global static Map<String,Object> getAccessibleFieldsOD(List<String> concepts) {
        return null;
    }
    @RemoteAction
    global static Map<String,Object> getAccessibleFields(List<String> concepts) {
        return null;
    }
    @RemoteAction
    global static Map<String,Object> getAddonStatus() {
        return null;
    }
    global static Set<Schema.SObjectType> getAvailableRelatedConceptsToCaseTypes() {
        return null;
    }
    @RemoteAction
    global static Map<String,Boolean> getAvailableRelatedConceptsToCase() {
        return null;
    }
    global static Set<Schema.SObjectType> getAvailableRelatedConceptsToObjectTypes(String baseObject) {
        return null;
    }
    @RemoteAction
    global static Map<String,Boolean> getAvailableRelatedConceptsToObject(String baseObject) {
        return null;
    }
    @RemoteAction
    global static List<zsfjira.ZConceptProperties> getConceptsFields() {
        return null;
    }
    @RemoteAction
    global static String getConfiguredSalesforceUserInJira() {
        return null;
    }
    @RemoteAction
    global static Map<String,Object> getDefaultJiraValues() {
        return null;
    }
    @RemoteAction
    global static List<Map<String,String>> getIssueTypeItems(String projectKey) {
        return null;
    }
    @RemoteAction
    global static Boolean getNeedToSync() {
        return null;
    }
    @RemoteAction
    global static Map<String,Object> getObjectsMeta() {
        return null;
    }
    @RemoteAction
    global static Map<String,Object> getPluginVersion() {
        return null;
    }
    @RemoteAction
    global static List<Map<String,String>> getPriorities() {
        return null;
    }
    @RemoteAction
    global static List<Map<String,String>> getProjectItems() {
        return null;
    }
    @RemoteAction
    global static Map<String,Object> getProjectsWithCategory() {
        return null;
    }
    @RemoteAction
    global static Map<String,Object> getSalesForceEntities() {
        return null;
    }
    @RemoteAction
    global static Map<String,Object> getSyncInfo() {
        return null;
    }
    @RemoteAction
    global static Map<String,Object> getZIssueMetaWithSharedFields() {
        return null;
    }
    @RemoteAction
    global static Map<String,Object> getZIssueMeta() {
        return null;
    }
    @RemoteAction
    global static Map<String,Map<String,Object>> loadConceptsFields() {
        return null;
    }
    @RemoteAction
    global static Map<String,Map<String,Object>> loadFieldsOfConcept(String conceptBase) {
        return null;
    }
    @RemoteAction
    global static Map<String,Object> loadSelectedConceptFields() {
        return null;
    }
    @RemoteAction
    global static Map<String,String> requestAccessToken(String jiraUrl, String oauthToken, String oauthTokenSecret) {
        return null;
    }
    @RemoteAction
    global static Map<String,Object> requestMyself(String jiraUrl, String oauthToken) {
        return null;
    }
    @RemoteAction
    global static Map<String,Object> requestOAuthToken(String jiraUrl) {
        return null;
    }
    @RemoteAction
    global static void saveAddonUrl(String addonUrl) {

    }
    @RemoteAction
    global static void saveAttachmentsSchemas(String jsonSchemas) {

    }
    @RemoteAction
    global static Boolean saveConceptFields(List<Map<String,Object>> selectedProperties) {
        return null;
    }
    @RemoteAction
    global static List<String> saveConceptProperties(Map<String,zsfjira.ZConceptSchema> concepts, Boolean isOndemand) {
        return null;
    }
    @RemoteAction
    global static Boolean saveDefaultJiraValues(Map<String,Object> defaultValues) {
        return null;
    }
    @RemoteAction
    global static void saveDefaultValuesIfNotExists() {

    }
    @RemoteAction
    global static void saveOAuthJiraSettings(String jiraUrl, String username, String oauthToken, Boolean isOnDemand) {

    }
    @RemoteAction
    global static Boolean saveRelatedConceptsToCase(List<String> conceptsToEnable) {
        return null;
    }
    global static Boolean sendToJiraOnDemand(Map<String,zsfjira.ZConceptSchema> concepts, List<String> errorMessages) {
        return null;
    }
    global static Boolean sendToJiraOnPremise(Map<String,zsfjira.ZConceptSchema> concepts, List<String> errorMessages) {
        return null;
    }
    @RemoteAction
    global static Map<String,Object> setAddonStatus(String addonUrl) {
        return null;
    }
    @RemoteAction
    global static Map<String,Object> syncSalesForceEntities(List<Map<String,Object>> entities) {
        return null;
    }
    @RemoteAction
    global static Map<String,Object> synchronizeDataOfConcept(String syncOperation, String concept) {
        return null;
    }
    @Deprecated
    @RemoteAction
    global static Map<String,Object> synchronizeData(String syncOperation) {
        return null;
    }
    @RemoteAction
    global static Map<String,Object> validateSources(Map<String,List<Map<String,String>>> sources) {
        return null;
    }
}
