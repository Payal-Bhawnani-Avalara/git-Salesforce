@isTest
public class WisePredictionTriggerHandlerTest {
	
    static testMethod void testSupportPredictionPositive(){
	    	Test.startTest();	
	    	User serviceOps = [Select id from User where id = '00540000002LujsAAC'];
	    	System.runAs(serviceOps){
				//create cases of recordtype Cancellation and changed status to deprovisioning 
		        Id supportCaseRecTypeId=Schema.SObjectType.Case.getRecordTypeInfosByName().get('Support Case v2').getRecordTypeId();
		        Case c =TestUtil.createCase(supportCaseRecTypeId,1,false)[0];
                c.origin = 'Web - Avalara Account';
                insert c;
	            wisespt__WisePrediction__c wP = TestUtil.createWisePrediction(c.id,1,false)[0];
	            wP.wisespt__WiseTags__c= '{"CX_911_Support_Business_Area__c": [{"confident": true, "tag": "Sales & Use Tax"}],"CX_911_Support_Product__c": [{"confident": true, "tag": "Avatax"}],"CX_911_Support_Category__c": [{"confident": true, "tag": "AvaTax Tax Content"}], "CX_911_Support_Reason__c": [{"confident": true, "tag": "Rate"}],"CX_911_Support_Reason_Detail__c": [{"confident": true, "tag": "due to address"}]}';
	            insert wP;
	            wisespt__WisePrediction__c wPError = [Select wisespt__Wise_ParseJSON_Response_Error__c,wisespt__CaseID__r.CX_911_Support_Business_Area__c,
	            wisespt__CaseID__r.CX_911_Support_Product__c,wisespt__CaseID__r.CX_911_Support_Category__c,wisespt__CaseID__r.CX_911_Support_Reason__c,
	            wisespt__CaseID__r.CX_911_Support_Reason_Detail__c,wisespt__Wise_ParseJSON_Response_Error_Text__c from wisespt__WisePrediction__c where id=:wP.id ];
	            /*System.assertEquals(wPError.wisespt__Wise_ParseJSON_Response_Error__c,false);
	            System.assertEquals(String.isNotBlank(wPError.wisespt__Wise_ParseJSON_Response_Error_Text__c),false);
	            System.assertEquals(String.isNotBlank(wPError.wisespt__CaseID__r.CX_911_Support_Business_Area__c),true);
	            System.assertEquals(String.isNotBlank(wPError.wisespt__CaseID__r.CX_911_Support_Product__c),true);
	            System.assertEquals(String.isNotBlank(wPError.wisespt__CaseID__r.CX_911_Support_Category__c),true);
	            System.assertEquals(String.isNotBlank(wPError.wisespt__CaseID__r.CX_911_Support_Reason__c),true);
	            System.assertEquals(String.isNotBlank(wPError.wisespt__CaseID__r.CX_911_Support_Reason_Detail__c),true); */ 
	    	}
            Test.stopTest();   
    }
    static testMethod void testSupportPredictionNegetive(){
	    	Test.startTest();	
	    	User serviceOps = [Select id from User where id = '00540000002LujsAAC'];
	    	System.runAs(serviceOps){
				//create cases of recordtype Cancellation and changed status to deprovisioning 
		        Id supportCaseRecTypeId=Schema.SObjectType.Case.getRecordTypeInfosByName().get('Support Case v2').getRecordTypeId();
		        Case c =TestUtil.createCase(supportCaseRecTypeId,1,true)[0];
	            wisespt__WisePrediction__c wP = TestUtil.createWisePrediction(c.id,1,false)[0];
	            wP.wisespt__WiseTags__c= '{"CX_911_Support_Category__c": [{"confident": true, "tag": "Returns Prof. Svcs"}], "CX_911_Support_Reason_Detail__c": [{"confident": true, "tag": "customer was collecting tax but did not file - Prof. Svcs"}], "CX_911_Support_Product__c": [{"confident": true, "tag": "Avatax Returns"}], "CX_911_Support_Business_Area__c": [{"confident": true, "tag": "Sales & Use Tax"}], "CX_911_Support_Reason__c": [{"confident": true, "tag": "Backfiling"}]}';
	            insert wP;
	            wisespt__WisePrediction__c wPError = [Select wisespt__Wise_ParseJSON_Response_Error__c,wisespt__CaseID__r.CX_911_Support_Business_Area__c,
	            wisespt__CaseID__r.CX_911_Support_Product__c,wisespt__CaseID__r.CX_911_Support_Category__c,wisespt__CaseID__r.CX_911_Support_Reason__c,
	            wisespt__CaseID__r.CX_911_Support_Reason_Detail__c,wisespt__Wise_ParseJSON_Response_Error_Text__c from wisespt__WisePrediction__c where id=:wP.id ];
                //System.assertEquals(wPError.wisespt__Wise_ParseJSON_Response_Error__c,true);
	            //System.assertEquals(String.isNotBlank(wPError.wisespt__Wise_ParseJSON_Response_Error_Text__c),true);
	            System.assertEquals(String.isNotBlank(wPError.wisespt__CaseID__r.CX_911_Support_Business_Area__c),false);
	            System.assertEquals(String.isNotBlank(wPError.wisespt__CaseID__r.CX_911_Support_Product__c),false);
	            System.assertEquals(String.isNotBlank(wPError.wisespt__CaseID__r.CX_911_Support_Category__c),false);
	            System.assertEquals(String.isNotBlank(wPError.wisespt__CaseID__r.CX_911_Support_Reason__c),false);
	            System.assertEquals(String.isNotBlank(wPError.wisespt__CaseID__r.CX_911_Support_Reason_Detail__c),false); 
	    	}
            Test.stopTest();   
              
    }
}