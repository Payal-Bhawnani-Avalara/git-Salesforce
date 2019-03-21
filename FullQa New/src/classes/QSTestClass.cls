@isTest
private class QSTestClass {

    static testMethod void myUnitTest() {

	PageReference pageRef = Page.qsdet;

	Test.setCurrentPageReference(pageRef);



	QuoteSheet__c QS = new QuoteSheet__c();
	ApexPages.StandardController sc = new ApexPages.standardController(QS);

// create an instance of the controller

QSExt01 MyPageCon  = new QSExt01(sc);


Product2 p2 = MyPageCon.GetProduct2();
System.AssertNotEquals(NULL,p2.name);

	}
}