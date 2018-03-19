@isTest
public class goLiveSlaTest {

    public static testMethod void test1() {
        account a = new account(name = 'a');
        insert a;
        GoLive_Implementation__c i = new GoLive_Implementation__c(Account__c = a.id, Calc_Status__c = 's1');
        insert i;
        update i;
        i.Calc_Status__c = 's2';
        update i;
    }

}