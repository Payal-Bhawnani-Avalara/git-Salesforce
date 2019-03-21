@isTest(SeeAllData=true)
private class SolutionExportTest {
    @isTest static void testCallout() {
        
        /****************** Set up test data *******************/
        
        // Retrieve the org's record type for KB Partner
        RecordType testRecordType = [select Id, Name from RecordType where Name='KB Partner' limit 1];
        
        // Create a Solution
        Solution m = new Solution(
            SolutionName='SolutionTest ',// + i,
            Migration_Status__c = 'test',
        	RecordTypeId = testRecordType.Id
        );
        insert m;
        
        // Create an Attachment on the Solution
        Attachment att = new Attachment();
        att.Body = Blob.valueOf('hello world');
        att.Name = 'Test.txt';
        att.parentId = m.id;
        insert att; 

        /************** Initiate the test context **************/
        Test.startTest();
        
        // Create a SolutionExport
        SolutionExport testSolExpo = new SolutionExport();
        testSolExpo.setArticleBody();
        testSolExpo.setEditTime();
        
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        
        /*************** test postCurrentArticle ***************/        
        HttpResponse res = testSolExpo.postCurrentArticle(m);
        
        // Verify response received contains success in the body
        String actualValue = res.getBody();
        String expectedValue = '<edit status="success"><page id="16936" href="https://help.avalara.com/@api/deki/pages/16936?redirects=0" deleted="false" revision="1"><uri.ui>https://help.avalara.com/z_Avalara_Internal/Service_Operations_Work_Area/SANDBOX_-_Partner_KB/PartnerKB__-_Connector_X_(out_of_Z)</uri.ui><title>PartnerKB  - Connector X (out of Z)</title><path>z_Avalara_Internal/Service_Operations_Work_Area/SANDBOX_-_Partner_KB/PartnerKB__-_Connector_X_(out_of_Z)</path><namespace>main</namespace><date.created>2014-01-15T05:14:28Z</date.created></page></edit>';
        System.assertEquals(actualValue, expectedValue);
        
        /*********** test putAttachmentsOnMindtouch ************/ 
        testSolExpo.getArticleAttachments(m);
        HttpResponse resAtt = testSolExpo.putAttachmentsOnMindtouch(att,m);
        
        actualValue = resAtt.getBody();
        expectedValue = '<edit status="success"><page id="16936" href="https://help.avalara.com/@api/deki/pages/16936?redirects=0" deleted="false" revision="1"><uri.ui>https://help.avalara.com/z_Avalara_Internal/Service_Operations_Work_Area/SANDBOX_-_Partner_KB/PartnerKB__-_Connector_X_(out_of_Z)</uri.ui><title>PartnerKB  - Connector X (out of Z)</title><path>z_Avalara_Internal/Service_Operations_Work_Area/SANDBOX_-_Partner_KB/PartnerKB__-_Connector_X_(out_of_Z)</path><namespace>main</namespace><date.created>2014-01-15T05:14:28Z</date.created></page></edit>';
        System.assertEquals(actualValue, expectedValue);
        
        /****************** test Page button *******************/
        SolutionExport.postFromSolution(m.Id);

        /********************** End the test *******************/
        Test.stopTest();
    }
}