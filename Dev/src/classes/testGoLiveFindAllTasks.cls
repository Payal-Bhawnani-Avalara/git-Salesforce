@isTest

private class testGoLiveFindAllTasks {

static testMethod void testGoLiveFindAllTasks(){

//PageReference pageRef = Page.ActiveCustomers; //replace with your VF page name
//Test.setCurrentPage(pageRef);

ApexPages.currentPage().getParameters().put('ParentAcctId', '006Q0000009R7ZW');

// Instantiate a new controller with all parameters in the page 
GoLiveFindAllTasks controller = new GoLiveFindAllTasks();
List<Task> tasks = controller.getAllGoLiveTasks();
System.assertNotEquals(tasks.size(), null);


}
}