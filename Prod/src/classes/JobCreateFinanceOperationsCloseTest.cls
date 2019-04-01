@isTest
private class JobCreateFinanceOperationsCloseTest {
    
    @isTest 
    public static void testJobCreateFinanceOperationsClose(){
        Test.startTest(); 
            JobCreateFinanceOperationsCloseEvents job = new JobCreateFinanceOperationsCloseEvents();
            ID batchprocessid = Database.executeBatch(job,1);   
            JobCreateFinanceOperationsCloseEvents m = new JobCreateFinanceOperationsCloseEvents();
            String seconds = '0'; //Execute at Zero Seconds
            String minutes = '30'; //Execute at every 0 minute of hour
            String hours = '*'; // Execute at 1 AM
            String dayOfMonth = '15'; // Execute Every 15 Day of the Month
            String month = '*'; //Execute every Month
            String dayOfWeek = '?'; //Execute on all 7 days of the Week
            //ID oppbatchprocessid = Database.executeBatch(m,200);  

            //Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
            String sch = seconds + ' ' + minutes + ' ' + hours + ' ' + dayOfMonth + ' ' + month + ' ' + dayOfWeek;
            //String sch = '0 0 01 * * ?';
            system.schedule('JobCreateFinanceOperationsCloseEvents Run Everyday 30 minutes', sch, m);               
        Test.stopTest();
    }
}