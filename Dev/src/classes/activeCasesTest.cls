@isTest
private class activeCasesTest {

    static testMethod void myUnitTest() {
        PageReference pageRef = Page.activecases;
        Test.setCurrentPage(pageRef);
      
        activeCases controller = new activeCases();
        controller.getCases();
        
    }
}