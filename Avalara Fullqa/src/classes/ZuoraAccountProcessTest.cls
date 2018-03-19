@isTest
private class ZuoraAccountProcessTest {

    static testMethod void myUnitTest() {
        ZuoraAccountProcess zap=new ZuoraAccountProcess();
        zap.attachment.body=Blob.valueOf('aaaa');
        zap.attachment.Name='Test.txt';
        zap.upload();
        zap.attachment.body=Blob.valueOf('aaaa');
        zap.attachment.Name='Test.csv';
        zap.upload();        
        
        ZuoraAccountProcessNow zapn=new ZuoraAccountProcessNow();
        zapn.getRecords();
    }
}