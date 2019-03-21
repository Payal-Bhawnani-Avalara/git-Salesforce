/**  
 * Name        : restAccountTest 
 * Author      : RAJA SEKHAR CHALLARI
 * Created Date: June/29/2017
 * Description : This is a test class for 30 Day Sandbox Extension button on Account which is for sending the account id to BOOMI.
 **/
@isTest
public class restAccountTest {

    public static testMethod void restAccountID(){
        Account  acc = new Account ();
        acc.Name = ' REST ACCOUNT BOOMI Test';
        insert acc;
        
        
        update acc;
        
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGeneratorRestAccount() );
        restAccount.callRestService(acc.Id);
    }

}