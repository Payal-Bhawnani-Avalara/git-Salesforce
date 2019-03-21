@isTest//(SeeAllData=true)
private class SolutionExportBatchTest{

    static testmethod void test() {
        // The query used by the batch job.
        String query = 'SELECT Id,CreatedDate,Migration_Status__c FROM Solution';

       // Create some test Solution items to be deleted
       //   by the batch job.
       Solution[] ml = new List<Solution>();
       for (Integer i=0;i<10;i++) {
           Solution m = new Solution(
               SolutionName='SolutionTest ' + i,
               Migration_Status__c = 'test');
           ml.add(m);
       }
       insert ml;

       Test.startTest();
       Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
       SolutionExport c = new SolutionExport();
       //Database.executeBatch(c);
       Test.stopTest();

       // Verify merchandise items got deleted 
       //Integer i = [SELECT COUNT() FROM Solution];
       //System.assertEquals(i, 0);
    }
}