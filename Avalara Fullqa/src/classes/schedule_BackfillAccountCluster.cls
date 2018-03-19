global class schedule_BackfillAccountCluster implements Schedulable {
	 	
    global static void execute(SchedulableContext sc) {
		IdentifyAccountClusterOnBatch();        
        
        datetime vNow = datetime.Now();
    
    	DateTime newDateTime = vNow.addMinutes(10);
       
        String day = string.valueOf(newDateTime.day());
        String month = string.valueOf(newDateTime.month());
        String hour = string.valueOf(newDateTime.hour());
        String minute = string.valueOf(newDateTime.minute());
        String second = string.valueOf(newDateTime.second());
        String year = string.valueOf(newDateTime.year()); 
        
        String strJobName = 'Job-' + second + '_' + minute + '_' + hour + '_' + day + '_' + month + '_' + year;
        String strSchedule = '0 ' + minute + ' ' + hour + ' ' + day + ' ' + month + ' ?' + ' ' + year;
        System.schedule(strJobName, strSchedule, new schedule_BackfillAccountCluster());
    }

    public static void IdentifyAccountClusterOnBatch(){
    	DG_Account_Class.IdentifyAccountClusterOnBatch();
    }
}