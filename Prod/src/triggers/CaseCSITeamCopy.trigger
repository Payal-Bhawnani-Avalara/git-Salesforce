trigger CaseCSITeamCopy on Case (before insert, before Update) {

  List<Case> Caseupdates = new List<Case>();
  Caseupdates = Trigger.new;
  
      Map<id, string> userCSITeams = new Map<id, String>();

      List<User> users = [SELECT Id, CSITeamName__c from User where CSITeamName__c!=''];
        for(user u : users) {
            userCSITeams.put(u.Id,u.CSITeamName__c);
            }

      
  for (Case Caseupdate : Caseupdates) {
      
      System.debug('CaseId is: ');
      System.debug(Caseupdate.Id); 
      System.debug('CaseOwnerId is: ');
      System.debug(Caseupdate.OwnerId); 
      System.debug('Userinfo.getUserId() is: ');
      System.debug(UserInfo.getUserId());
      

      if (Caseupdate.OwnerId != null)
      {    
          if( ((String)Caseupdate.OwnerId).startsWith('005'))
          {
      
            Caseupdate.OwnerCSITeam__c = userCSITeams.get(Caseupdate.OwnerId);
  
          }
            else
            {
                
                if ((String)Caseupdate.OwnerId =='00G40000001PgtSEAS') //Onsite
                   Caseupdate.OwnerCSITeam__c ='Onsite';
                else if ((String)Caseupdate.OwnerId =='00G3000000159l5EAA') //Customer Support
                   Caseupdate.OwnerCSITeam__c ='Customer Support';
                else if ((String)Caseupdate.OwnerId =='00G40000001SnUgEAK') //Shift Queue
                   Caseupdate.OwnerCSITeam__c ='Shift Queue';
                else if ((String)Caseupdate.OwnerId =='00G400000011mMpEAI') //SDK
                   Caseupdate.OwnerCSITeam__c ='SDK';
                else if ((String)Caseupdate.OwnerId =='00G40000001QdzYEAS') //Compliance
                   Caseupdate.OwnerCSITeam__c ='Compliance';
                else if ((String)Caseupdate.OwnerId =='00G40000001RTyyEAG') //Delete
                   Caseupdate.OwnerCSITeam__c ='Delete';
                else if ((String)Caseupdate.OwnerId =='00G400000010BlnEAE') //Feedback Form                
                   Caseupdate.OwnerCSITeam__c ='Feedback Form';                
                else if ((String)Caseupdate.OwnerId =='00G40000001TAhREAW') //Notices                
                   Caseupdate.OwnerCSITeam__c ='Compliance';                
              else if ((String)Caseupdate.OwnerId =='00G40000001THqGEAW') //EFile Documents                
                   Caseupdate.OwnerCSITeam__c ='Compliance';                
              else if ((String)Caseupdate.OwnerId =='00G40000001TRkfEAG') //Sage / Intuit                
                   Caseupdate.OwnerCSITeam__c ='Sage / Intuit';    
              else if ((String)Caseupdate.OwnerId =='00G40000001TRkaEAG') //Microsoft / Netsuite                
                   Caseupdate.OwnerCSITeam__c ='Microsoft / Netsuite';    
              else if ((String)Caseupdate.OwnerId =='00G40000001TYElEAO') //Reconciliations                
                   Caseupdate.OwnerCSITeam__c ='Compliance';    
              else if ((String)Caseupdate.OwnerId =='00G40000001kmA9EAI') //Treasury
                   Caseupdate.OwnerCSITeam__c ='Treasury Team';
            
            }
      }

    }
  }