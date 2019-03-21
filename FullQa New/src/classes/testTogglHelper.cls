@isTest  (SeeAllData = false) 

public class testTogglHelper {
    
    static testmethod void testLeadType() {
   	//	Lead lead = new Lead(Email = 'test@test.com', LastName='test', Company='test', LeadSource = '123');
  ///  	insert lead;
  	Lead l=TestUtil.createLead(1,true)[0];
        
        System.assertEquals('Lead', TogglHelper.GetObjectType(l.Id));
    }
}