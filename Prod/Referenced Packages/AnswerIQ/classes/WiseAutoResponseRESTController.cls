/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
@RestResource(urlMapping='/auto-response/*')
global class WiseAutoResponseRESTController {
    global WiseAutoResponseRESTController(ApexPages.StandardController controller) {

    }
    global static void performAction(Case currentCase, wisespt.WiseAutoResponseRESTController.Action action) {

    }
    @Deprecated
    global static void performAction(String caseId, wisespt.WiseAutoResponseRESTController.Action action) {

    }
    @HttpPost
    global static void performActions(String caseId, String macroId, List<wisespt.WiseAutoResponseRESTController.Action> actions) {

    }
    global static void performEmailAction(String caseId, String contactId, wisespt.WiseAutoResponseRESTController.Action action) {

    }
    global static void respond(String caseId, String macroId, Integer statusCode, String errorCode, String message, Boolean updateWisePrediction) {

    }
    @HttpGet
    global static void status() {

    }
    global static void updateWisePrediction(String caseId, String macroId, String errorCode, String errorMessage) {

    }
global class Action {
    global Map<String,String> fieldValues;
    global String name;
    global String objectType;
    global Action() {

    }
}
}
