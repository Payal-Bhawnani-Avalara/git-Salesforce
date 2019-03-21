public class PartnerNumberGenerator{

    public string newPartnerNumber{get;set;}
    
    public PartnerNumberGenerator(){
        boolean unusedNumber = false;
        newPartnerNumber=PartnerNumberNew();
        while (unusedNumber == false)
        {
       		Account[] matchingAccts = [select Id from Account where PartnerNumber__c = :newPartnerNumber];
            if (matchingAccts.size()==0)
                unusedNumber=true;
            else
                newPartnerNumber=PartnerNumberNew();
        }
     }
    
    //returns a random Integer
	public static Integer getRandomNumber(Integer size){
		Double d = math.random() * size;
		return d.intValue();
	}
   	//returns new random partner number (may be in use)
    public static string PartnerNumberNew(){
     	
        Integer i = PartnerNumberGenerator.getRandomNumber(999);
        i = 100 ; //fix the first three digits to 100 to match sitemanager.
		Integer j = PartnerNumberGenerator.getRandomNumber(999);
        Integer k = PartnerNumberGenerator.getRandomNumber(999);
        String PartnerNumber= ('000'+string.valueof(i)).right(3)+'-'+('000'+string.valueof(j)).right(3)+'-'+('000'+string.valueof(k)).right(3);
        
        //System.Debug(PartnerNumber);
        return PartnerNumber;
    }
}