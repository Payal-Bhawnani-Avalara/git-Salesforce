@isTest
public class LiveChatTranscriptHandlerTest {
      static testMethod void test_LiveAgentAfterInset() {
      	
        Communication_Activity_Data__c cAD = TestUtil.createCommunicationActivityData(1,true)[0];
      	 
        LiveChatVisitor visitor = TestUtil.createLiveChatVisitor(1,true)[0];
       
        Test.startTest();

        LiveChatTranscript tx =  TestUtil.createLiveChatTranscript(visitor.id,1,false)[0];
        tx.Communication_Activity_Data__c = cAD.id;
        insert tx;

        Test.stopTest();
        
        Communication_Activity_Data__c comAD = [Select id,Chat_Transcript__c from Communication_Activity_Data__c where id =: cAD.id];
        
        System.assertEquals(comAD.Chat_Transcript__c, tx.id);
      }
}