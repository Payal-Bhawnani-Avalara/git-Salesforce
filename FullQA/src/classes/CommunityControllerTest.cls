@isTest(SeeAllData=true)

public class CommunityControllerTest {
   
     static testMethod void testFetchCustomerOpenCases() {
      Test.startTest(); 
        List <Case> listCase = CommunityController.fetchCustomerOpenCases();
	      // System.assert(listCase.size()==1);
	        
	   Test.stopTest();
     }
     static testMethod void testFetchPartnerOpenCases() {
      Test.startTest(); 
        List <Case> listCase = CommunityController.fetchPartnerOpenCases();
	      // System.assert(listCase.size()==1);
	        
	   Test.stopTest();
     }
     static testMethod void testFetchPartnerClosedCases() {
      Test.startTest(); 
        List <Case> listCase = CommunityController.fetchPartnerClosedCases();
	      // System.assert(listCase.size()==1);
	        
	   Test.stopTest();
     }
     static testMethod void testFetchCustomerClosedCases() {
      Test.startTest(); 
        List <Case> listCase = CommunityController.fetchCustomerClosedCases();
	      // System.assert(listCase.size()==1);
	        
	   Test.stopTest();
     }
}