/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class QxAuraQuoteProcessController {
    global QxAuraQuoteProcessController() {

    }
    @AuraEnabled
    global static CameleonCPQ.QxAuraQuoteProcessController.GetUIContentResponse getUIContent(String qxSessionCtx, String stepId) {
        return null;
    }
    @AuraEnabled
    global static CameleonCPQ.QxAuraQuoteProcessController.OpenQuoteResponse openQuote(Id crmQuoteId) {
        return null;
    }
global class GetUIContentResponse {
    global String htmlContent {
        get;
    }
    global String initUrl {
        get;
    }
    global GetUIContentResponse() {

    }
}
global class OpenQuoteResponse {
    global CameleonCPQ.QxSessionContext qxSessionContext {
        get;
    }
    global List<CameleonCPQ.QxQuoteStep> steps {
        get;
    }
    global OpenQuoteResponse() {

    }
}
}
