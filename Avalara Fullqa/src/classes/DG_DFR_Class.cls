public without sharing class DG_DFR_Class {
    public static boolean LeadAfterUpdate_FirstRun = true;
    public static boolean ContactAfterUpdate_FirstRun = true;   
    public static boolean OppCreationFromLead_FirstRun = true; 
    public static boolean AddChangeContactSource_FirstRun = true;
    
    
    public static map<String, DFR_Lead_Status_Mapping__c> getDFRStatusToStage(){
        map<String, DFR_Lead_Status_Mapping__c> mapStatusToStage = new map<String, DFR_Lead_Status_Mapping__c>();   

        if(!test.isRunningTest()){
            mapStatusToStage = DFR_Lead_Status_Mapping__c.getAll();
        }else{
            
            mapStatusToStage.put('Predictive Qualified',new DFR_Lead_Status_Mapping__c(name = 'Predictive Qualified', Funnel_Stage__c = 'PQL', Order__c = 2));
            mapStatusToStage.put('Closed Lost Opportunity',new DFR_Lead_Status_Mapping__c(name = 'Closed Lost Opportunity', Funnel_Stage__c = 'EOL-Lost', Order__c = 0));
            mapStatusToStage.put('Closed Won Opportunity',new DFR_Lead_Status_Mapping__c(name = 'Closed Won Opportunity', Funnel_Stage__c = 'EOL-Won', Order__c = 6));
            mapStatusToStage.put('Open Opportunity',new DFR_Lead_Status_Mapping__c(name = 'Open Opportunity', Funnel_Stage__c = 'MQO', Order__c = 5));
            mapStatusToStage.put('Suspect',new DFR_Lead_Status_Mapping__c(name = 'Suspect', Funnel_Stage__c = 'Suspect', Order__c = 0));
            mapStatusToStage.put('Disqualified',new DFR_Lead_Status_Mapping__c(name = 'Disqualified', Funnel_Stage__c = 'EOL-Disqualified', Order__c = 0));
            mapStatusToStage.put('Nurture',new DFR_Lead_Status_Mapping__c(name = 'Nurture', Funnel_Stage__c = 'EOL-Nurture', Order__c = 0));
            mapStatusToStage.put('Inquiry',new DFR_Lead_Status_Mapping__c(name = 'Inquiry', Funnel_Stage__c = 'Inquiry', Order__c = 1));
            mapStatusToStage.put('MQL',new DFR_Lead_Status_Mapping__c(name = 'MQL', Funnel_Stage__c = 'MQL', Order__c = 3));
            mapStatusToStage.put('Working',new DFR_Lead_Status_Mapping__c(name = 'Working', Funnel_Stage__c = 'Working', Order__c = 4));            
        }
        
        return mapStatusToStage;
    }
    
    
    public static map<String, DFR_Field_Mapping__c > getDFRFieldMapping(){
        map<String, DFR_Field_Mapping__c > mapFieldMapping = new map<String, DFR_Field_Mapping__c >();  

        if(!test.isRunningTest()){ 
            mapFieldMapping = DFR_Field_Mapping__c.getAll();
        }else{
            mapFieldMapping.put('Behavior_Score__c',new DFR_Field_Mapping__c(name = 'Behavior_Score__c', Prospect__c = 'Prospect_Behavior_Score__c', PQL__c='PQL_Behavior_Score__c', MQL__c='MQL_Behavior_Score__c', 
            Working__c='Working_Behavior_Score__c', MQO__c='MQO_Behavior_Score__c', Contact__c='Behavior_Score__c', EOL__c='EOL_Behavior_Score__c'));
            mapFieldMapping.put('infer3__Infer_Score__c',new DFR_Field_Mapping__c(name = 'infer3__Infer_Score__c', Prospect__c = 'Prospect_Infer_Score__c', PQL__c='PQL_Infer_Score__c', MQL__c='MQL_Infer_Score__c', 
            Working__c='Working_Infer_Score__c', MQO__c='MQO_Infer_Score__c', Contact__c='infer3__Infer_Score__c', EOL__c='EOL_Infer_Score__c'));
        }
        
        return mapFieldMapping; 
    }
    
    /*public static map<String, DFR_Lead_Rating_Mapping__c > getDFRRatingMapping(){
        map<String, DFR_Lead_Rating_Mapping__c > mapRatingMapping = new map<String, DFR_Lead_Rating_Mapping__c >(); 

        if(!test.isRunningTest()){
            mapRatingMapping = DFR_Lead_Rating_Mapping__c.getAll();
        }else{
            mapRatingMapping.put('A',new DFR_Lead_Rating_Mapping__c(name = 'A', Status__c = 'MQL'));
            mapRatingMapping.put('B',new DFR_Lead_Rating_Mapping__c(name = 'B', Status__c = 'MQL'));
            mapRatingMapping.put('C',new DFR_Lead_Rating_Mapping__c(name = 'C', Status__c = 'Inquiry'));
            mapRatingMapping.put('P',new DFR_Lead_Rating_Mapping__c(name = 'P', Status__c = 'Predictive Qualified'));
            mapRatingMapping.put('D',new DFR_Lead_Rating_Mapping__c(name = 'D', Status__c = 'Suspect'));
            mapRatingMapping.put('E',new DFR_Lead_Rating_Mapping__c(name = 'E', Status__c = 'Suspect'));
        }
        
        return mapRatingMapping;
    }*/
    
    public static set<String> getDFRBusinessUnits(){
        map<String, DFR_Business_Units__c > mapCS = new map<String, DFR_Business_Units__c >();  
        set<String> setBusinessUnits = new set<String>();

        if(!test.isRunningTest()){
            mapCS = DFR_Business_Units__c.getAll();
        }else{
            mapCS.put('AvaTax',new DFR_Business_Units__c(name = 'AvaTax'));
            mapCS.put('CertCapture',new DFR_Business_Units__c(name = 'CertCapture'));
            mapCS.put('Excise',new DFR_Business_Units__c(name = 'Excise'));
        }
        
        if(!mapCS.IsEmpty()){
            for(String k : mapCS.keySet()){
                setBusinessUnits.add(k.ToUpperCase());
            }
        }
        
        return setBusinessUnits;
    }
    
    public static set<Id> getLeadRecordTypeId(){
        map<String, DFR_Lead_Record_Types__c> mapRecordTypeId = new map<String, DFR_Lead_Record_Types__c>();
        set<Id> listLead_RTID = new set<Id>();  

        if(!test.isRunningTest()){
            mapRecordTypeId = DFR_Lead_Record_Types__c.getAll();
        }else{
            mapRecordTypeId.put('Master Lead Record Type',new DFR_Lead_Record_Types__c(name = 'Master Lead Record Type', Record_Type_ID__c = '01240000000USth'));
        }
        
        for(String k : mapRecordTypeId.keySet()){
            Id RTID = (Id)mapRecordTypeId.get(k).Record_Type_ID__c;
            listLead_RTID.add(RTID);
        }
        
        return listLead_RTID; 
    }
    
    public static map<String, map<String,String>> LeadStageFieldMapping(){
        map<String, Schema.SObjectField> mapLSchema = Schema.SObjectType.Lead.fields.getMap();
        map<String, Schema.SObjectField> mapDFSchema = Schema.SObjectType.Demand_Funnel__c.fields.getMap();
        map<String, DFR_Field_Mapping__c > mapCSFieldMapping = getDFRFieldMapping();
        map<String, map<String,String>> mapStageFieldMapping = new map<String, map<String,String>>();       

        for(String k : mapCSFieldMapping.keySet()){  
            if(mapLSchema.containsKey(k)){ //check if Lead field API name is valid
                String ProspectField = mapCSFieldMapping.get(k).Prospect__c;      
                String PQLField = mapCSFieldMapping.get(k).PQL__c;              
                String MQLField = mapCSFieldMapping.get(k).MQL__c;
                String WorkingField = mapCSFieldMapping.get(k).Working__c;
                String MQOField = mapCSFieldMapping.get(k).MQO__c;
                String EOLField = mapCSFieldMapping.get(k).EOL__c;
                
                //Prospect Field Mapping
                if(mapDFSchema.containsKey(ProspectField)){ //check if DFR field API name is valid
                    String vStage = 'Inquiry';
                    String vField = ProspectField;

                        map<String, String> mapFieldMapping = new map<String, String>();
                        if(mapStageFieldMapping.containsKey(vStage)){
                            mapFieldMapping = mapStageFieldMapping.get(vStage);
                            mapFieldMapping.put(k,vField);
                        }else{
                            mapFieldMapping.put(k,vField);
                        }
                        mapStageFieldMapping.put(vStage,mapFieldMapping);

                }
                
                //PQL Field Mapping
                if(mapDFSchema.containsKey(PQLField)){ //check if DFR field API name is valid
                    String vStage = 'PQL';
                    String vField = PQLField;

                        map<String, String> mapFieldMapping = new map<String, String>();
                        if(mapStageFieldMapping.containsKey(vStage)){
                            mapFieldMapping = mapStageFieldMapping.get(vStage);
                            mapFieldMapping.put(k,vField);
                        }else{
                            mapFieldMapping.put(k,vField);
                        }
                        mapStageFieldMapping.put(vStage,mapFieldMapping);
                }
                
                //MQL Field Mapping
                if(mapDFSchema.containsKey(MQLField)){ //check if DFR field API name is valid
                    String vStage = 'MQL';
                    String vField = MQLField;

                        map<String, String> mapFieldMapping = new map<String, String>();
                        if(mapStageFieldMapping.containsKey(vStage)){
                            mapFieldMapping = mapStageFieldMapping.get(vStage);
                            mapFieldMapping.put(k,vField);
                        }else{
                            mapFieldMapping.put(k,vField);
                        }
                        mapStageFieldMapping.put(vStage,mapFieldMapping);

                }
                
                //Working Field Mapping
                if(mapDFSchema.containsKey(WorkingField)){ //check if DFR field API name is valid
                    String vStage = 'Working';
                    String vField = WorkingField;

                        map<String, String> mapFieldMapping = new map<String, String>();
                        if(mapStageFieldMapping.containsKey(vStage)){
                            mapFieldMapping = mapStageFieldMapping.get(vStage);
                            mapFieldMapping.put(k,vField);
                        }else{
                            mapFieldMapping.put(k,vField);
                        }
                        mapStageFieldMapping.put(vStage,mapFieldMapping);

                }
                                
                //MQO Field Mapping
                if(mapDFSchema.containsKey(MQOField)){ //check if DFR field API name is valid
                    String vStage = 'MQO';
                    String vField = MQOField;

                        map<String, String> mapFieldMapping = new map<String, String>();
                        if(mapStageFieldMapping.containsKey(vStage)){
                            mapFieldMapping = mapStageFieldMapping.get(vStage);
                            mapFieldMapping.put(k,vField);
                        }else{
                            mapFieldMapping.put(k,vField);
                        }
                        mapStageFieldMapping.put(vStage,mapFieldMapping);

                }       
                
                //EOL Field Mapping
                if(mapDFSchema.containsKey(EOLField)){ //check if DFR field API name is valid
                    String vStage = 'EOL';
                    String vField = EOLField;

                        map<String, String> mapFieldMapping = new map<String, String>();
                        if(mapStageFieldMapping.containsKey(vStage)){
                            mapFieldMapping = mapStageFieldMapping.get(vStage);
                            mapFieldMapping.put(k,vField);
                        }else{
                            mapFieldMapping.put(k,vField);
                        }
                        mapStageFieldMapping.put(vStage,mapFieldMapping);

                }                                           
            }
        }
        return mapStageFieldMapping;
    }
      
    public static map<String, map<String,String>> ContactStageFieldMapping(){
        map<String, Schema.SObjectField> mapCSchema = Schema.SObjectType.Contact.fields.getMap();
        map<String, Schema.SObjectField> mapDFSchema = Schema.SObjectType.Demand_Funnel__c.fields.getMap();
        map<String, DFR_Field_Mapping__c > mapCSFieldMapping = getDFRFieldMapping();
        map<String, map<String,String>> mapStageFieldMapping = new map<String, map<String,String>>();       

        for(String k : mapCSFieldMapping.keySet()){ //check if Contact field API name is valid
            String ContactField = mapCSFieldMapping.get(k).Contact__c;
            if(mapCSchema.containsKey(ContactField)){
                String ProspectField = mapCSFieldMapping.get(k).Prospect__c;    
                String PQLField = mapCSFieldMapping.get(k).PQL__c;              
                String MQLField = mapCSFieldMapping.get(k).MQL__c;
                String WorkingField = mapCSFieldMapping.get(k).Working__c;
                String MQOField = mapCSFieldMapping.get(k).MQO__c;
                String EOLField = mapCSFieldMapping.get(k).EOL__c;              
                
                //Prospect Field Mapping
                if(mapDFSchema.containsKey(ProspectField)){ //check if DFR field API name is valid
                    String vStage = 'Inquiry';
                    String vField = ProspectField;

                        map<String, String> mapFieldMapping = new map<String, String>();
                        if(mapStageFieldMapping.containsKey(vStage)){
                            mapFieldMapping = mapStageFieldMapping.get(vStage);
                            mapFieldMapping.put(ContactField,vField);
                        }else{
                            mapFieldMapping.put(ContactField,vField);
                        }
                        mapStageFieldMapping.put(vStage,mapFieldMapping);

                }
                
                //PQL Field Mapping
                if(mapDFSchema.containsKey(PQLField)){ //check if DFR field API name is valid
                    String vStage = 'PQL';
                    String vField = PQLField;

                        map<String, String> mapFieldMapping = new map<String, String>();
                        if(mapStageFieldMapping.containsKey(vStage)){
                            mapFieldMapping = mapStageFieldMapping.get(vStage);
                            mapFieldMapping.put(ContactField,vField);
                        }else{
                            mapFieldMapping.put(ContactField,vField);
                        }
                        mapStageFieldMapping.put(vStage,mapFieldMapping); 

                }
                
                //MQL Field Mapping
                if(mapDFSchema.containsKey(MQLField)){ //check if DFR field API name is valid
                    String vStage = 'MQL';
                    String vField = MQLField;

                        map<String, String> mapFieldMapping = new map<String, String>();
                        if(mapStageFieldMapping.containsKey(vStage)){
                            mapFieldMapping = mapStageFieldMapping.get(vStage);
                            mapFieldMapping.put(ContactField,vField);
                        }else{
                            mapFieldMapping.put(ContactField,vField);
                        }
                        mapStageFieldMapping.put(vStage,mapFieldMapping); 

                }
                
                //Working Field Mapping
                if(mapDFSchema.containsKey(WorkingField)){ //check if DFR field API name is valid
                    String vStage = 'Working';
                    String vField = WorkingField;

                        map<String, String> mapFieldMapping = new map<String, String>();
                        if(mapStageFieldMapping.containsKey(vStage)){
                            mapFieldMapping = mapStageFieldMapping.get(vStage);
                            mapFieldMapping.put(ContactField,vField);
                        }else{
                            mapFieldMapping.put(ContactField,vField);
                        }
                        mapStageFieldMapping.put(vStage,mapFieldMapping);

                }
                
                //MQO Field Mapping
                if(mapDFSchema.containsKey(MQOField)){ //check if DFR field API name is valid
                    String vStage = 'MQO';
                    String vField = MQOField;

                        map<String, String> mapFieldMapping = new map<String, String>();
                        if(mapStageFieldMapping.containsKey(vStage)){
                            mapFieldMapping = mapStageFieldMapping.get(vStage);
                            mapFieldMapping.put(ContactField,vField);
                        }else{
                            mapFieldMapping.put(ContactField,vField);
                        }
                        mapStageFieldMapping.put(vStage,mapFieldMapping);

                }       
                
                //EOL Field Mapping
                if(mapDFSchema.containsKey(EOLField)){ //check if DFR field API name is valid
                    String vStage = 'EOL';
                    String vField = EOLField;

                        map<String, String> mapFieldMapping = new map<String, String>();
                        if(mapStageFieldMapping.containsKey(vStage)){
                            mapFieldMapping = mapStageFieldMapping.get(vStage);
                            mapFieldMapping.put(ContactField,vField);
                        }else{
                            mapFieldMapping.put(ContactField,vField);
                        }
                        mapStageFieldMapping.put(vStage,mapFieldMapping);

                }                                           
            }
        }
        return mapStageFieldMapping;
    }
    
    public static void DFR_LeadPopulateRecyledRejectedDate(list<Lead> tn, map<Id, Lead> oldMap){

        for (integer i=0; i<tn.size(); i++){
            Lead to = oldMap.get(tn[i].Id);
            //Date stamp if status changes to Disqualified or Nurture
            if(tn[i].Status == 'Disqualified' && to.Status <> 'Disqualified'){
                tn[i].Disqualified_Date__c = date.today();
            }else if(tn[i].Status == 'Nurture' && to.Status <> 'Nurture'){
                tn[i].Nurture_Date__c = date.today();
            }
        }
    
    }
    
    public static void DFR_ContactPopulateRecyledRejectedDate(list<Contact> tn, map<Id, Contact> oldMap){

        for (integer i=0; i<tn.size(); i++){
            Contact to = oldMap.get(tn[i].Id);
            //Date stamp if status changes to Disqualified or Nurture
            if(tn[i].ContactStatus__c == 'Disqualified' && to.ContactStatus__c <> 'Disqualified'){
                tn[i].Disqualified_Date__c = date.today();
            }else if(tn[i].ContactStatus__c == 'Nurture' && to.ContactStatus__c <> 'Nurture'){
                tn[i].Nurture_Date__c = date.today();
            }
        }
    
    }
    
    
    /*public static void DFR_LeadRatingChange(list<Lead> tn, map<Id, Lead> oldMap){
        
        map<String, DFR_Lead_Rating_Mapping__c> mapRating = getDFRRatingMapping();
        
        if(oldMap == Null){ //Insert
            for (integer i=0; i<tn.size(); i++){
                if(tn[i].Rating <> Null){
                    //Check if Rating changes results should result to Status change
                    if(mapRating.containsKey(tn[i].Rating)){
                        tn[i].Status = mapRating.get(tn[i].Rating).Status__c;
                        //tn[i].Qual_Method__c = mapRating.get(tn[i].Rating).Qual_Method__c;
                    }
                }       
            }
        }else{ //Update         
            map<String, DFR_Lead_Status_Mapping__c> mapStatusToStage = getDFRStatusToStage();
            
            for (integer i=0; i<tn.size(); i++){
                Lead to = oldMap.get(tn[i].Id);
                if(tn[i].Rating <> to.Rating && tn[i].Rating <> Null){
                    //Check if lead is within the wait period of "Disqualified" or "Nurture"
                    if(tn[i].Status == 'Disqualified' && tn[i].Disqualified_Date__c <> Null){
                        if((tn[i].Disqualified_Date__c.daysBetween(date.today())) < Integer.valueOf(System.Label.Rejected_Wait_Days)){
                            continue;
                        }
                    }else if(tn[i].Status == 'Nurture' && tn[i].Nurture_Date__c <> Null){
                        if((tn[i].Nurture_Date__c.daysBetween(date.today())) < Integer.valueOf(System.Label.Recycled_Wait_Days)){
                            continue;
                        }
                    }
                    
                    //Check if Rating changes results should result to Status change
                    if(mapRating.containsKey(tn[i].Rating)){
                        String NewStatus = mapRating.get(tn[i].Rating).Status__c;
                        //String QualMethod = mapRating.get(tn[i].Rating).Qual_Method__c;
                        
                        if(to.Status == Null){
                            tn[i].Status = NewStatus;
                            //tn[i].Qual_Method__c = QualMethod;
                        }else if(mapStatusToStage.containsKey(to.Status) && mapStatusToStage.containsKey(NewStatus)){
                            if(mapStatusToStage.get(to.Status).Order__c < mapStatusToStage.get(NewStatus).Order__c){
                                tn[i].Status = NewStatus;
                                //tn[i].Qual_Method__c = QualMethod; 
                            }
                        }
                    }
                }       
            }
        }
        
    }*/
    
    /*public static void DFR_ContactRatingChange(list<Contact> tn, map<Id, Contact> oldMap){
        
        map<String, DFR_Lead_Rating_Mapping__c> mapRating = getDFRRatingMapping();
                    
            map<String, DFR_Lead_Status_Mapping__c> mapStatusToStage = getDFRStatusToStage();
            
            for (integer i=0; i<tn.size(); i++){
                Contact to = oldMap.get(tn[i].Id);
                if(tn[i].Rating__c <> to.Rating__c && tn[i].Rating__c <> Null && tn[i].DFR_FromLeadConvert__c == to.DFR_FromLeadConvert__c){
                    //Check if Contact is within the wait period of "Disqualified" or "Nurture"
                    if(tn[i].ContactStatus__c == 'Disqualified' && tn[i].Disqualified_Date__c <> Null){
                        if((tn[i].Disqualified_Date__c.daysBetween(date.today())) < Integer.valueOf(System.Label.Rejected_Wait_Days)){
                            continue;
                        }
                    }else if(tn[i].ContactStatus__c == 'Nurture' && tn[i].Nurture_Date__c <> Null){
                        if((tn[i].Nurture_Date__c.daysBetween(date.today())) < Integer.valueOf(System.Label.Recycled_Wait_Days)){
                            continue;
                        }
                    }
                    
                    //Check if Rating changes results should result to Status change
                    if(mapRating.containsKey(tn[i].Rating__c)){
                        String NewStatus = mapRating.get(tn[i].Rating__c).Status__c;
                        
                        if(to.ContactStatus__c == Null){
                            //tn[i].ContactStatus__c = NewStatus;
                        }else if(mapStatusToStage.containsKey(to.ContactStatus__c) && mapStatusToStage.containsKey(NewStatus)){
                            if(mapStatusToStage.get(to.ContactStatus__c).Order__c < mapStatusToStage.get(NewStatus).Order__c){
                                //tn[i].ContactStatus__c = NewStatus;
                            }
                        }
                    }
                }       
            //}
        }
        
    }*/
    
    public static void CreateLeadDFR(list<Lead> tn){ 
        //Retrieve Business Units included to the DFR tracking
        set<String> setDFRBusinessUnits = getDFRBusinessUnits();
                
        //Retrieve custom setting related to mapping lead statuses to funnel stages 
        map<String, DFR_Lead_Status_Mapping__c> mapStatusToStage = getDFRStatusToStage();
                    
        list<Demand_Funnel__c> DFRInsert = new list<Demand_Funnel__c>();
        
        //Retrieve field mapping between lead and DFR for different funnel stages
        map<String, map<String,String>> LeadStageFieldMapping = LeadStageFieldMapping();
        map<String, String> mapProspectFieldMapping = LeadStageFieldMapping.get('Inquiry');
        map<String, String> mapPQLFieldMapping = LeadStageFieldMapping.get('PQL');
        map<String, String> mapMQLFieldMapping = LeadStageFieldMapping.get('MQL');
        map<String, String> mapWorkingFieldMapping = LeadStageFieldMapping.get('Working');
        
        //Retrive Lead Record type included for DFR
        set<Id> listLeadRecordTypeId = getLeadRecordTypeId();
        
        //Build list of DFR to create if status translates to Prospect, MQL or Working funnel stage.
        for(Lead ld : tn){
            if(listLeadRecordTypeId.contains(ld.RecordTypeId) && ld.OpportunitySubType__c <> Null){
                if(setDFRBusinessUnits.contains(ld.OpportunitySubType__c.ToUpperCase())){
                    if(mapStatusToStage.containsKey(ld.Status)){
                        String vStage = mapStatusToStage.get(ld.Status).Funnel_Stage__c;
                        Demand_Funnel__c DFR = new Demand_Funnel__c();
                        //Prospect
                        if(vStage == 'Inquiry'){                    
                            DFR.Prospect_Date_Entered__c = date.today(); 
                            DFR.Prospect_Entered_From__c = vStage;
                            
                            //Reiterate to set field values to the DFR from the lead
                            for(String k:mapProspectFieldMapping.keySet()){  
                                try {
                                    DFR.put(mapProspectFieldMapping.get(k),ld.get(k));
                                } catch(exception e) {} 
                            }
                            
                            DFR.Pre_Opportunity_Status__c = vStage; 
                            DFR.Business_Unit__c = ld.OpportunitySubType__c;
                            DFR.Lead__c = ld.Id;                            
                            DFRInsert.add(DFR); 
                        }
                        
                        //PQL
                        /*if(vStage == 'PQL'){
                            DFR.PQL_Date_Entered__c = date.today();
                            DFR.PQL_Entered_From__c = 'PQL';
                            
                            //Reiterate to set field values to the DFR from the lead
                            for(String k:mapPQLFieldMapping.keySet()){  
                                try {
                                    DFR.put(mapPQLFieldMapping.get(k),ld.get(k));
                                } catch(exception e) {} 
                            }
                            
                            //DFR.Qual_Method__c = ld.Qual_Method__c;
        
                            DFR.Pre_Opportunity_Status__c = vStage;
                            DFR.Business_Unit__c = ld.OpportunitySubType__c;
                            DFR.Lead__c = ld.Id;
                            DFRInsert.add(DFR); 
                        }*/
                        
                        //MQL
                        if(vStage == 'MQL'){
                            DFR.MQL_Date_Entered__c = date.today();
                            DFR.MQL_Entered_From__c = 'MQL';
                            
                            //Reiterate to set field values to the DFR from the lead
                            for(String k:mapMQLFieldMapping.keySet()){  
                                try {
                                    DFR.put(mapMQLFieldMapping.get(k),ld.get(k));
                                } catch(exception e) {} 
                            }
                            
                            //DFR.Qual_Method__c = ld.Qual_Method__c;
        
                            DFR.Pre_Opportunity_Status__c = vStage;
                            DFR.Business_Unit__c = ld.OpportunitySubType__c;
                            DFR.Lead__c = ld.Id;
                            DFRInsert.add(DFR); 
                        }
                        
                        //Working
                        if(vStage == 'Working'){
                            DFR.Working_Date_Entered__c = date.today();
                            DFR.Working_Entered_From__c = vStage;
                            
                            //Reiterate to set field values to the DFR from the lead
                            for(String k:mapWorkingFieldMapping.keySet()){  
                                try {
                                    DFR.put(mapWorkingFieldMapping.get(k),ld.get(k));
                                } catch(exception e) {} 
                            }
                            
                            DFR.Pre_Opportunity_Status__c = vStage;
                            DFR.Business_Unit__c = ld.OpportunitySubType__c;
                            DFR.Lead__c = ld.Id;
                            DFRInsert.add(DFR);
                        }                                   
                    }
                }
            }
        }
        
        //Insert list of DFRs   
        if (DFRInsert.size()> 0){
            Database.SaveResult[] srInsert = Database.insert(DFRInsert, false); 
            
            for (Database.SaveResult sr : srInsert) {
                if (!sr.isSuccess()) {             
                    for(Database.Error err : sr.getErrors()) {
                        System.debug('DFR Creation Error: ' + err.getMessage() + ' * ' + err.getFields() + ' * ' + err.getStatusCode());
                    }
                }
            }
        }
    }
    
    public static void DFR_LeadStatusChange(list<Lead> tn, map<Id, Lead> oldMap){
                
        //Retrieve custom setting related to mapping lead statuses to funnel stages     
        map<String, DFR_Lead_Status_Mapping__c> mapStatusToStage = getDFRStatusToStage();
            
        list<Lead> listLead = new list<Lead>();
        list<Id> listLID = new list<Id>();
        
        //Retrive Lead Record type included for DFR
        set<Id> listLeadRecordTypeId = getLeadRecordTypeId();
        
        //Identify leads that move from one funnel stage to another based on translating their lead status to funnel stage.
        for (integer i=0; i<tn.size(); i++){
            Lead to = oldMap.get(tn[i].Id);
            if(listLeadRecordTypeId.contains(tn[i].RecordTypeId)){
                if(mapStatusToStage.containsKey(tn[i].Status) && mapStatusToStage.containsKey(to.Status)){
                    String oldStage = mapStatusToStage.get(to.Status).Funnel_Stage__c;
                    String newStage = mapStatusToStage.get(tn[i].Status).Funnel_Stage__c;
                    if(oldStage <> newStage){
                        listLead.add(tn[i]);
                        listLID.add(tn[i].id);
                    }
                }
            }       
        }
        
        if(listLead.size() > 0){
            //Retrieve Business Units included to the DFR tracking
            set<String> setDFRBusinessUnits = getDFRBusinessUnits();
            
            //Retrieve DFR related to leads that move stages.           
            Demand_Funnel__c[] DFRs = [Select d.Lead__c, d.id, d.Pre_Opportunity_Status__c From Demand_Funnel__c d 
                            where d.Lead__c in :listLID and d.Pre_Opportunity_Close_Reason__c = Null and d.Opportunity__c = Null];
            
            //Mapping between Lead and DFR              
            map<id,Demand_Funnel__c> mapLeadDFR = new map<id,Demand_Funnel__c>();
                    
            for(Demand_Funnel__c d: DFRs){
                mapLeadDFR.put(d.Lead__c,d);
            }
            
            //List use for inserting new DFR
            list<Demand_Funnel__c> DFRInsert = new list<Demand_Funnel__c>();
            
            //Mapping use to update existing DFR
            map<id,Demand_Funnel__c> mapDFRUpdate = new map<id,Demand_Funnel__c>();
            
            
            //Retrieve field mapping between lead and DFR for different funnel stages
            map<String, map<String,String>> LeadStageFieldMapping = LeadStageFieldMapping();
            map<String, String> mapProspectFieldMapping = LeadStageFieldMapping.get('Inquiry');
            map<String, String> mapPQLFieldMapping = LeadStageFieldMapping.get('PQL');
            map<String, String> mapMQLFieldMapping = LeadStageFieldMapping.get('MQL');
            map<String, String> mapWorkingFieldMapping = LeadStageFieldMapping.get('Working');
            map<String, String> mapEOLFieldMapping = LeadStageFieldMapping.get('EOL');
            
            for(Lead ld: listLead){
                if(mapLeadDFR.containsKey(ld.id)){ //Check if lead has an active DFR from the map
                    String vStage = mapStatusToStage.get(ld.Status).Funnel_Stage__c;
                    Demand_Funnel__c DFR = mapLeadDFR.get(ld.id); //Get related DFR
                        
                    mapDFRUpdate.put(DFR.id, new Demand_Funnel__c(Id=DFR.id));  //Put related DFR in the map for update
                    
                    //PQL
                    /*if(vStage == 'PQL'){
                        mapDFRUpdate.get(DFR.id).put('PQL_Date_Entered__c',date.today());
                        
                        //Reiterate to set field values to the DFR from the lead
                        for(String k:mapPQLFieldMapping.keySet()){  
                            try {
                                mapDFRUpdate.get(DFR.id).put(mapPQLFieldMapping.get(k),ld.get(k));  
                            } catch(exception e) {} 
                        }
                        
                        mapDFRUpdate.get(DFR.id).put('PQL_Entered_From__c',vStage);
    
                        if(DFR.Pre_Opportunity_Status__c == 'Inquiry'){
                            mapDFRUpdate.get(DFR.id).put('Prospect_Date_Exited__c',date.today());
                            mapDFRUpdate.get(DFR.id).put('Prospect_Exited_To__c',vStage);
                            mapDFRUpdate.get(DFR.id).put('PQL_Entered_From__c',DFR.Pre_Opportunity_Status__c);
                        }
                        
                        mapDFRUpdate.get(DFR.id).put('Pre_Opportunity_Status__c',vStage);
                    }*/
                                        
                    //MQL
                    if(vStage == 'MQL'){
                        mapDFRUpdate.get(DFR.id).put('MQL_Date_Entered__c',date.today());
                        
                        //Reiterate to set field values to the DFR from the lead
                        for(String k:mapMQLFieldMapping.keySet()){  
                            try {
                                mapDFRUpdate.get(DFR.id).put(mapMQLFieldMapping.get(k),ld.get(k));  
                            } catch(exception e) {} 
                        }
                        
                        mapDFRUpdate.get(DFR.id).put('MQL_Entered_From__c',vStage);
                        
                        if(DFR.Pre_Opportunity_Status__c == 'PQL'){
                            mapDFRUpdate.get(DFR.id).put('PQL_Date_Exited__c',date.today());
                            mapDFRUpdate.get(DFR.id).put('PQL_Exited_To__c',vStage);
                            mapDFRUpdate.get(DFR.id).put('MQL_Entered_From__c',DFR.Pre_Opportunity_Status__c);          
                        }else if(DFR.Pre_Opportunity_Status__c == 'Inquiry'){
                            mapDFRUpdate.get(DFR.id).put('Prospect_Date_Exited__c',date.today());
                            mapDFRUpdate.get(DFR.id).put('Prospect_Exited_To__c',vStage);
                            mapDFRUpdate.get(DFR.id).put('MQL_Entered_From__c',DFR.Pre_Opportunity_Status__c);
                        }
                        
                        //mapDFRUpdate.get(DFR.id).put('Qual_Method__c',ld.Qual_Method__c);
                        
                        mapDFRUpdate.get(DFR.id).put('Pre_Opportunity_Status__c',vStage);
                    }
                    
                    //Working
                    if(vStage == 'Working'){
                        mapDFRUpdate.get(DFR.id).put('Working_Date_Entered__c',date.today());
                        
                        //Reiterate to set field values to the DFR from the lead
                        for(String k:mapWorkingFieldMapping.keySet()){  
                            try {
                                mapDFRUpdate.get(DFR.id).put(mapWorkingFieldMapping.get(k),ld.get(k));  
                            } catch(exception e) {} 
                        }

                        mapDFRUpdate.get(DFR.id).put('Working_Entered_From__c',vStage);     
                        
                        if(DFR.Pre_Opportunity_Status__c == 'MQL'){
                            mapDFRUpdate.get(DFR.id).put('MQL_Date_Exited__c',date.today());
                            mapDFRUpdate.get(DFR.id).put('MQL_Exited_To__c',vStage);
                            mapDFRUpdate.get(DFR.id).put('Working_Entered_From__c',DFR.Pre_Opportunity_Status__c);  
                        }else if(DFR.Pre_Opportunity_Status__c == 'PQL'){
                            mapDFRUpdate.get(DFR.id).put('PQL_Date_Exited__c',date.today());
                            mapDFRUpdate.get(DFR.id).put('PQL_Exited_To__c',vStage);
                            mapDFRUpdate.get(DFR.id).put('Working_Entered_From__c',DFR.Pre_Opportunity_Status__c);              
                        }else if(DFR.Pre_Opportunity_Status__c == 'Inquiry'){
                            mapDFRUpdate.get(DFR.id).put('Prospect_Date_Exited__c',date.today());
                            mapDFRUpdate.get(DFR.id).put('Prospect_Exited_To__c',vStage);
                            mapDFRUpdate.get(DFR.id).put('Working_Entered_From__c',DFR.Pre_Opportunity_Status__c);
                        }
                        
                        mapDFRUpdate.get(DFR.id).put('Pre_Opportunity_Status__c',vStage);           
                    } 

                    //Downgraded
                    if(vStage == 'EOL-Nurture' || vStage == 'EOL-Disqualified'){
                        mapDFRUpdate.get(DFR.id).put('Pre_Opportunity_Close_Reason__c',ld.Status);
                        mapDFRUpdate.get(DFR.id).put('Pre_Opportunity_Close_Date__c',date.today());
                        
                        //Reiterate to set field values to the DFR from the lead
                        for(String k:mapEOLFieldMapping.keySet()){  
                            try {
                                mapDFRUpdate.get(DFR.id).put(mapEOLFieldMapping.get(k),ld.get(k));  
                            } catch(exception e) {} 
                        }
                        
                        mapDFRUpdate.get(DFR.id).put('EOL_Date_Entered__c',date.today());
                        mapDFRUpdate.get(DFR.id).put('EOL_Entered_From__c',DFR.Pre_Opportunity_Status__c);
                                            
                        if(DFR.Pre_Opportunity_Status__c == 'Working'){
                            mapDFRUpdate.get(DFR.id).put('Working_Date_Exited__c',date.today());
                            mapDFRUpdate.get(DFR.id).put('Working_Exited_To__c',ld.Status);
                        }else if(DFR.Pre_Opportunity_Status__c == 'MQL'){
                            mapDFRUpdate.get(DFR.id).put('MQL_Date_Exited__c',date.today());
                            mapDFRUpdate.get(DFR.id).put('MQL_Exited_To__c',ld.Status);
                        }else if(DFR.Pre_Opportunity_Status__c == 'PQL'){
                            mapDFRUpdate.get(DFR.id).put('PQL_Date_Exited__c',date.today());
                            mapDFRUpdate.get(DFR.id).put('PQL_Exited_To__c',ld.Status);
                        }else if(DFR.Pre_Opportunity_Status__c == 'Inquiry'){
                            mapDFRUpdate.get(DFR.id).put('Prospect_Date_Exited__c',date.today());
                            mapDFRUpdate.get(DFR.id).put('Prospect_Exited_To__c',ld.Status);
                        }           
                    }                           
                }else{ // Leads that move stages without active DFR
                    if(mapStatusToStage.containsKey(ld.Status) && ld.OpportunitySubType__c <> Null){
                        if(setDFRBusinessUnits.contains(ld.OpportunitySubType__c.ToUpperCase())){
                            String vStage = mapStatusToStage.get(ld.Status).Funnel_Stage__c;
                            Demand_Funnel__c DFR = new Demand_Funnel__c();
                            //Prospect
                            if(vStage == 'Inquiry'){
                                DFR.Prospect_Date_Entered__c = date.today();
                                DFR.Prospect_Entered_From__c = vStage;
                                
                                //Reiterate to set field values to the DFR from the lead
                                for(String k:mapProspectFieldMapping.keySet()){  
                                    try {
                                        DFR.put(mapProspectFieldMapping.get(k),ld.get(k));
                                    } catch(exception e) {} 
                                }
                                
                                DFR.Pre_Opportunity_Status__c = vStage;
                                DFR.Business_Unit__c = ld.OpportunitySubType__c;
                                DFR.Lead__c = ld.Id;                    
                                DFRInsert.add(DFR);
                            }
                            
                            //PQL
                            /*if(vStage == 'PQL'){
                                DFR.PQL_Date_Entered__c = date.today();
                                DFR.PQL_Entered_From__c = 'PQL';
    
                                //Reiterate to set field values to the DFR from the lead
                                for(String k:mapPQLFieldMapping.keySet()){  
                                    try {
                                        DFR.put(mapPQLFieldMapping.get(k),ld.get(k));
                                    } catch(exception e) {} 
                                }
     
                                DFR.Pre_Opportunity_Status__c = vStage;
                                DFR.Business_Unit__c = ld.OpportunitySubType__c;
                                DFR.Lead__c = ld.Id;                            
                                DFRInsert.add(DFR);
                            }*/
    
                            //MQL
                            if(vStage == 'MQL'){
                                DFR.MQL_Date_Entered__c = date.today();
                                DFR.MQL_Entered_From__c = 'MQL';
    
                                //Reiterate to set field values to the DFR from the lead
                                for(String k:mapMQLFieldMapping.keySet()){  
                                    try {
                                        DFR.put(mapMQLFieldMapping.get(k),ld.get(k));
                                    } catch(exception e) {} 
                                }
     
                                DFR.Pre_Opportunity_Status__c = vStage;
                                DFR.Business_Unit__c = ld.OpportunitySubType__c;
                                DFR.Lead__c = ld.Id;                            
                                DFRInsert.add(DFR);
                            }
                            
                            //Working
                            if(vStage == 'Working'){
                                DFR.Working_Date_Entered__c = date.today();
                                DFR.Working_Entered_From__c = vStage;
                                
                                //Reiterate to set field values to the DFR from the lead
                                for(String k:mapWorkingFieldMapping.keySet()){  
                                    try {
                                        DFR.put(mapWorkingFieldMapping.get(k),ld.get(k));
                                    } catch(exception e) {} 
                                }
                                
                                DFR.Pre_Opportunity_Status__c = vStage;
                                DFR.Business_Unit__c = ld.OpportunitySubType__c;
                                DFR.Lead__c = ld.Id;                            
                                DFRInsert.add(DFR);
                            }
                                            
                        }   
                    }       
                }               
            }
            
            //Update existing DFR
            if (mapDFRUpdate.size()> 0){ 
                Database.SaveResult[] srUpdate = Database.Update(mapDFRUpdate.values(),false);
                
                for (Database.SaveResult sr : srUpdate) {
                    if (!sr.isSuccess()) {    
                        System.debug('DFR Update Error: ' + sr.getId());         
                        for(Database.Error err : sr.getErrors()) {
                            System.debug('DFR Update Error: ' + err.getMessage() + ' * ' + err.getFields() + ' * ' + err.getStatusCode());
                        }
                    }
                }
            }
            
            //Create new DFR
            if (DFRInsert.size()> 0){
                Database.SaveResult[] srInsert = Database.Insert(DFRInsert, false); 
                
                for (Database.SaveResult sr : srInsert) {
                    if (!sr.isSuccess()) {             
                        for(Database.Error err : sr.getErrors()) {
                            System.debug('DFR Creation Error: ' + err.getMessage() + ' * ' + err.getFields() + ' * ' + err.getStatusCode());
                        }
                    }
                }
            }
        }
    }
    
    public static void DFR_ContactStatusChange(list<Contact> tn, map<Id, Contact> oldMap){
                
        //Retrieve custom setting related to mapping Contact statuses to funnel stages      
        map<String, DFR_Lead_Status_Mapping__c> mapStatusToStage = getDFRStatusToStage();
            
        list<Contact> listContact = new list<Contact>();
        list<Id> listCID = new list<Id>();
        
        //Retrive Contact Record type included for DFR
        //set<Id> listContactRecordTypeId = getContactRecordTypeId();
        
        //Identify Contacts that move from one funnel stage to another based on translating their Contact status to funnel stage.
        for (integer i=0; i<tn.size(); i++){
            Contact to = oldMap.get(tn[i].Id);
            //if(listContactRecordTypeId.contains(tn[i].RecordTypeId)){
                if(mapStatusToStage.containsKey(tn[i].ContactStatus__c) && mapStatusToStage.containsKey(to.ContactStatus__c)){
                    String oldStage = mapStatusToStage.get(to.ContactStatus__c).Funnel_Stage__c;
                    String newStage = mapStatusToStage.get(tn[i].ContactStatus__c).Funnel_Stage__c;
                    if(oldStage <> newStage){
                        listContact.add(tn[i]);
                        listCID.add(tn[i].id);
                    }
                }
            //}     
        }
        
        if(listContact.size() > 0){
            //Retrieve Business Units included to the DFR tracking
            set<String> setDFRBusinessUnits = getDFRBusinessUnits();
            
            //Retrieve DFR related to Contacts that move stages.            
            Demand_Funnel__c[] DFRs = [Select d.Contact__c, d.id, d.Pre_Opportunity_Status__c From Demand_Funnel__c d 
                            where d.Contact__c in :listCID and d.Pre_Opportunity_Close_Reason__c = Null and d.Opportunity__c = Null];
            
            //Mapping between Contact and DFR               
            map<id,Demand_Funnel__c> mapContactDFR = new map<id,Demand_Funnel__c>();
                    
            for(Demand_Funnel__c d: DFRs){
                mapContactDFR.put(d.Contact__c,d);
            }
            
            //List use for inserting new DFR
            list<Demand_Funnel__c> DFRInsert = new list<Demand_Funnel__c>();
            
            //Mapping use to update existing DFR
            map<id,Demand_Funnel__c> mapDFRUpdate = new map<id,Demand_Funnel__c>();
            
            
            //Retrieve field mapping between Contact and DFR for different funnel stages
            map<String, map<String,String>> ContactStageFieldMapping = ContactStageFieldMapping();
            map<String, String> mapProspectFieldMapping = ContactStageFieldMapping.get('Inquiry');
            map<String, String> mapPQLFieldMapping = ContactStageFieldMapping.get('PQL');
            map<String, String> mapMQLFieldMapping = ContactStageFieldMapping.get('MQL');
            map<String, String> mapWorkingFieldMapping = ContactStageFieldMapping.get('Working');
            map<String, String> mapEOLFieldMapping = ContactStageFieldMapping.get('EOL');
            
            for(Contact ld: listContact){
                if(mapContactDFR.containsKey(ld.id)){ //Check if Contact has an active DFR from the map
                    String vStage = mapStatusToStage.get(ld.ContactStatus__c).Funnel_Stage__c;
                    Demand_Funnel__c DFR = mapContactDFR.get(ld.id); //Get related DFR
                        
                    mapDFRUpdate.put(DFR.id, new Demand_Funnel__c(Id=DFR.id));  //Put related DFR in the map for update
                    
                    //PQL
                    /*if(vStage == 'PQL'){
                        mapDFRUpdate.get(DFR.id).put('PQL_Date_Entered__c',date.today());
                        
                        //Reiterate to set field values to the DFR from the Contact
                        for(String k:mapPQLFieldMapping.keySet()){  
                            try {
                                mapDFRUpdate.get(DFR.id).put(mapPQLFieldMapping.get(k),ld.get(k));  
                            } catch(exception e) {} 
                        }
                        
                        mapDFRUpdate.get(DFR.id).put('PQL_Entered_From__c',vStage);
    
                        if(DFR.Pre_Opportunity_Status__c == 'Inquiry'){
                            mapDFRUpdate.get(DFR.id).put('Prospect_Date_Exited__c',date.today());
                            mapDFRUpdate.get(DFR.id).put('Prospect_Exited_To__c',vStage);
                            mapDFRUpdate.get(DFR.id).put('PQL_Entered_From__c',DFR.Pre_Opportunity_Status__c);
                        }
                        
                        mapDFRUpdate.get(DFR.id).put('Pre_Opportunity_Status__c',vStage);
                    }*/
                                        
                    //MQL
                    if(vStage == 'MQL'){
                        mapDFRUpdate.get(DFR.id).put('MQL_Date_Entered__c',date.today());
                        
                        //Reiterate to set field values to the DFR from the Contact
                        for(String k:mapMQLFieldMapping.keySet()){  
                            try {
                                mapDFRUpdate.get(DFR.id).put(mapMQLFieldMapping.get(k),ld.get(k));  
                            } catch(exception e) {} 
                        }
                        
                        mapDFRUpdate.get(DFR.id).put('MQL_Entered_From__c',vStage);
                        
                        if(DFR.Pre_Opportunity_Status__c == 'PQL'){
                            mapDFRUpdate.get(DFR.id).put('PQL_Date_Exited__c',date.today());
                            mapDFRUpdate.get(DFR.id).put('PQL_Exited_To__c',vStage);
                            mapDFRUpdate.get(DFR.id).put('MQL_Entered_From__c',DFR.Pre_Opportunity_Status__c);          
                        }else if(DFR.Pre_Opportunity_Status__c == 'Inquiry'){
                            mapDFRUpdate.get(DFR.id).put('Prospect_Date_Exited__c',date.today());
                            mapDFRUpdate.get(DFR.id).put('Prospect_Exited_To__c',vStage);
                            mapDFRUpdate.get(DFR.id).put('MQL_Entered_From__c',DFR.Pre_Opportunity_Status__c);
                        }
                        
                        //mapDFRUpdate.get(DFR.id).put('Qual_Method__c',ld.Qual_Method__c);
                        
                        mapDFRUpdate.get(DFR.id).put('Pre_Opportunity_Status__c',vStage);
                    }
                    
                    //Working
                    if(vStage == 'Working'){
                        mapDFRUpdate.get(DFR.id).put('Working_Date_Entered__c',date.today());
                        
                        //Reiterate to set field values to the DFR from the Contact
                        for(String k:mapWorkingFieldMapping.keySet()){  
                            try {
                                mapDFRUpdate.get(DFR.id).put(mapWorkingFieldMapping.get(k),ld.get(k));  
                            } catch(exception e) {} 
                        }

                        mapDFRUpdate.get(DFR.id).put('Working_Entered_From__c',vStage);     
                        
                        if(DFR.Pre_Opportunity_Status__c == 'MQL'){
                            mapDFRUpdate.get(DFR.id).put('MQL_Date_Exited__c',date.today());
                            mapDFRUpdate.get(DFR.id).put('MQL_Exited_To__c',vStage);
                            mapDFRUpdate.get(DFR.id).put('Working_Entered_From__c',DFR.Pre_Opportunity_Status__c);  
                        }else if(DFR.Pre_Opportunity_Status__c == 'PQL'){
                            mapDFRUpdate.get(DFR.id).put('PQL_Date_Exited__c',date.today());
                            mapDFRUpdate.get(DFR.id).put('PQL_Exited_To__c',vStage);
                            mapDFRUpdate.get(DFR.id).put('Working_Entered_From__c',DFR.Pre_Opportunity_Status__c);              
                        }else if(DFR.Pre_Opportunity_Status__c == 'Inquiry'){
                            mapDFRUpdate.get(DFR.id).put('Prospect_Date_Exited__c',date.today());
                            mapDFRUpdate.get(DFR.id).put('Prospect_Exited_To__c',vStage);
                            mapDFRUpdate.get(DFR.id).put('Working_Entered_From__c',DFR.Pre_Opportunity_Status__c);
                        }
                        
                        mapDFRUpdate.get(DFR.id).put('Pre_Opportunity_Status__c',vStage);           
                    } 

                    //Downgraded
                    if(vStage == 'EOL-Nurture' || vStage == 'EOL-Disqualified'){
                        mapDFRUpdate.get(DFR.id).put('Pre_Opportunity_Close_Reason__c',ld.ContactStatus__c);
                        mapDFRUpdate.get(DFR.id).put('Pre_Opportunity_Close_Date__c',date.today());
                        
                        //Reiterate to set field values to the DFR from the Contact
                        for(String k:mapEOLFieldMapping.keySet()){  
                            try {
                                mapDFRUpdate.get(DFR.id).put(mapEOLFieldMapping.get(k),ld.get(k));  
                            } catch(exception e) {} 
                        }
                        
                        mapDFRUpdate.get(DFR.id).put('EOL_Date_Entered__c',date.today());
                        mapDFRUpdate.get(DFR.id).put('EOL_Entered_From__c',DFR.Pre_Opportunity_Status__c);
                                            
                        if(DFR.Pre_Opportunity_Status__c == 'Working'){
                            mapDFRUpdate.get(DFR.id).put('Working_Date_Exited__c',date.today());
                            mapDFRUpdate.get(DFR.id).put('Working_Exited_To__c',ld.ContactStatus__c);
                        }else if(DFR.Pre_Opportunity_Status__c == 'MQL'){
                            mapDFRUpdate.get(DFR.id).put('MQL_Date_Exited__c',date.today());
                            mapDFRUpdate.get(DFR.id).put('MQL_Exited_To__c',ld.ContactStatus__c);
                        }else if(DFR.Pre_Opportunity_Status__c == 'PQL'){
                            mapDFRUpdate.get(DFR.id).put('PQL_Date_Exited__c',date.today());
                            mapDFRUpdate.get(DFR.id).put('PQL_Exited_To__c',ld.ContactStatus__c);
                        }else if(DFR.Pre_Opportunity_Status__c == 'Inquiry'){
                            mapDFRUpdate.get(DFR.id).put('Prospect_Date_Exited__c',date.today());
                            mapDFRUpdate.get(DFR.id).put('Prospect_Exited_To__c',ld.ContactStatus__c);
                        }           
                    }                           
                }else{ // Contacts that move stages without active DFR
                    if(mapStatusToStage.containsKey(ld.ContactStatus__c) && ld.Opportunity_Sub_Type__c <> Null){
                        if(setDFRBusinessUnits.contains(ld.Opportunity_Sub_Type__c.ToUpperCase())){
                            String vStage = mapStatusToStage.get(ld.ContactStatus__c).Funnel_Stage__c;
                            Demand_Funnel__c DFR = new Demand_Funnel__c();
                            //Prospect
                            if(vStage == 'Inquiry'){
                                DFR.Prospect_Date_Entered__c = date.today();
                                DFR.Prospect_Entered_From__c = vStage;
                                
                                //Reiterate to set field values to the DFR from the Contact
                                for(String k:mapProspectFieldMapping.keySet()){  
                                    try {
                                        DFR.put(mapProspectFieldMapping.get(k),ld.get(k));
                                    } catch(exception e) {} 
                                }
                                
                                DFR.Pre_Opportunity_Status__c = vStage;
                                DFR.Business_Unit__c = ld.Opportunity_Sub_Type__c;
                                DFR.Contact__c = ld.Id;                 
                                DFRInsert.add(DFR);
                            }
                            
                            //PQL
                            /*if(vStage == 'PQL'){
                                DFR.PQL_Date_Entered__c = date.today();
                                DFR.PQL_Entered_From__c = 'PQL';
    
                                //Reiterate to set field values to the DFR from the Contact
                                for(String k:mapPQLFieldMapping.keySet()){  
                                    try {
                                        DFR.put(mapPQLFieldMapping.get(k),ld.get(k));
                                    } catch(exception e) {} 
                                }
     
                                DFR.Pre_Opportunity_Status__c = vStage; 
                                DFR.Business_Unit__c = ld.Opportunity_Sub_Type__c;
                                DFR.Contact__c = ld.Id;                         
                                DFRInsert.add(DFR);
                            }*/
    
                            //MQL
                            if(vStage == 'MQL'){
                                DFR.MQL_Date_Entered__c = date.today();
                                DFR.MQL_Entered_From__c = 'MQL';
    
                                //Reiterate to set field values to the DFR from the Contact
                                for(String k:mapMQLFieldMapping.keySet()){  
                                    try {
                                        DFR.put(mapMQLFieldMapping.get(k),ld.get(k));
                                    } catch(exception e) {} 
                                }
     
                                DFR.Pre_Opportunity_Status__c = vStage;
                                DFR.Business_Unit__c = ld.Opportunity_Sub_Type__c;
                                DFR.Contact__c = ld.Id;                         
                                DFRInsert.add(DFR);
                            }
                            
                            //Working
                            if(vStage == 'Working'){
                                DFR.Working_Date_Entered__c = date.today();
                                DFR.Working_Entered_From__c = vStage;
                                
                                //Reiterate to set field values to the DFR from the Contact
                                for(String k:mapWorkingFieldMapping.keySet()){  
                                    try {
                                        DFR.put(mapWorkingFieldMapping.get(k),ld.get(k));
                                    } catch(exception e) {} 
                                }
                                
                                DFR.Pre_Opportunity_Status__c = vStage;
                                DFR.Business_Unit__c = ld.Opportunity_Sub_Type__c;
                                DFR.Contact__c = ld.Id;                         
                                DFRInsert.add(DFR);
                            }
                                            
                        }       
                    }   
                }               
            }
            
            //Update existing DFR
            if (mapDFRUpdate.size()> 0){ 
                Database.SaveResult[] srUpdate = Database.Update(mapDFRUpdate.values(),false);
                
                for (Database.SaveResult sr : srUpdate) {
                    if (!sr.isSuccess()) {    
                        System.debug('DFR Update Error: ' + sr.getId());         
                        for(Database.Error err : sr.getErrors()) {
                            System.debug('DFR Update Error: ' + err.getMessage() + ' * ' + err.getFields() + ' * ' + err.getStatusCode());
                        }
                    }
                }
            }
            
            //Create new DFR
            if (DFRInsert.size()> 0){
                Database.SaveResult[] srInsert = Database.Insert(DFRInsert, false); 
                
                for (Database.SaveResult sr : srInsert) {
                    if (!sr.isSuccess()) {             
                        for(Database.Error err : sr.getErrors()) {
                            System.debug('DFR Creation Error: ' + err.getMessage() + ' * ' + err.getFields() + ' * ' + err.getStatusCode());
                        }
                    }
                }
            }
        }
    }
        
    public static void DFR_OppCreationFromLead(list<Lead> tn, map<Id, Lead> oldMap){
        system.debug('###DFR_OppCreationFromLead1');
        list<Lead> listLead = new list<Lead>();
        map<Id, Lead> mapLead = new map<Id, Lead>();
        
        //Retrive Lead Record type included for DFR
        set<Id> listLeadRecordTypeId = getLeadRecordTypeId();
        
        for (integer i=0; i<tn.size(); i++){
            Lead to = oldMap.get(tn[i].Id);
            if(to.isConverted == false && tn[i].isConverted == true && listLeadRecordTypeId.contains(tn[i].RecordTypeId)){
                mapLead.put(tn[i].id, tn[i]);
                listLead.add(tn[i]);
            }       
        }       
        
        system.debug('###DFR_OppCreationFromLead2' + mapLead.size());
        
        if (!mapLead.IsEmpty()) {
            
            map<Id, list<Demand_Funnel__c>> mapLIDlistDFR= new map<Id, list<Demand_Funnel__c>>();
        
            for(Demand_Funnel__c d : [Select d.Lead__c, d.id, d.Pre_Opportunity_Status__c, d.Pre_Opportunity_Close_Reason__c, d.Opportunity__c 
            From Demand_Funnel__c d 
            where lead__c in :mapLead.keySet()]){
                if(mapLIDlistDFR.containsKey(d.Lead__c)){
                    list<Demand_Funnel__c> listDFR = mapLIDlistDFR.get(d.Lead__c);
                    listDFR.add(d);
                    mapLIDlistDFR.put(d.lead__c, listDFR);
                }else{
                    list<Demand_Funnel__c> listDFR = new list<Demand_Funnel__c>();
                    listDFR.add(d);
                    mapLIDlistDFR.put(d.lead__c, listDFR);
                }                       
            }
            
            system.debug('###DFR_OppCreationFromLead3' + mapLIDlistDFR.size());
            
            map<id,Demand_Funnel__c> mapDFRUpdate = new map<id,Demand_Funnel__c>();
            list<Demand_Funnel__c> listDFRInsert = new list<Demand_Funnel__c>();
            map<id, Opportunity> mapOpportunity = new map<id, Opportunity>();
            map<id, Contact> mapContact = new map<id, Contact>();
            
            //Retrieve field mapping between lead and DFR for MQO funnel stage
            map<String, map<String,String>> LeadStageFieldMapping = LeadStageFieldMapping();
            map<String, String> mapMQOFieldMapping = LeadStageFieldMapping.get('MQO');
            
            String vStage = 'MQO';
            
            //Retrieve Business Units included to the DFR tracking
            set<String> setDFRBusinessUnits = getDFRBusinessUnits();
            
            for(Lead pLead : listLead){
                Lead to = oldMap.get(pLead.Id);
                                
                Boolean vCreateDFR = True;
                Demand_Funnel__c activeDFR;
                
                if(mapLIDlistDFR.containsKey(pLead.Id)){
                    list<Demand_Funnel__c> listDFR = mapLIDlistDFR.get(pLead.Id);
                    
                    for(Demand_Funnel__c d : listDFR){
                        if(d.Pre_Opportunity_Close_Reason__c == Null && d.Opportunity__c == Null && activeDFR == Null){
                            activeDFR = d;
                        }else{
                            mapDFRUpdate.put(d.id, new Demand_Funnel__c(Id=d.id, Contact__c=pLead.ConvertedContactId, Account__c=pLead.ConvertedAccountId));        
                        }               
                    }
                    
                }   
                                        
                if(activeDFR <> Null){ //Update existing DFR related to converted lead              
                    
                    Demand_Funnel__c DFR = activeDFR;
                    mapDFRUpdate.put(DFR.id, new Demand_Funnel__c(Id=DFR.id));  
                    
                    if (pLead.ConvertedContactId <> null){                                              
                        mapDFRUpdate.get(DFR.id).put('Contact__c',pLead.ConvertedContactId);    
                        
                        mapContact.put(pLead.ConvertedContactId, new Contact(Id=pLead.ConvertedContactId, DFR_FromLeadConvert__c = True, ContactStatus__c = to.Status, Rating__c = pLead.Rating));        
                    }
                    if (pLead.ConvertedAccountId <> null){
                        mapDFRUpdate.get(DFR.id).put('Account__c',pLead.ConvertedAccountId);
                    }
                    if (pLead.ConvertedOpportunityId <> null){
                    //, ContactStatus__c = 'Open Opportunity'
                        mapContact.put(pLead.ConvertedContactId, new Contact(Id=pLead.ConvertedContactId, DFR_FromLeadConvert__c = True, Rating__c = pLead.Rating));    
                        mapOpportunity.put(pLead.ConvertedOpportunityId, new Opportunity(Id=pLead.ConvertedOpportunityId, Opportunity_Contact_Source__c = pLead.ConvertedContactId, DFR_FromLeadConvert__c = True));
                                                
                        mapDFRUpdate.get(DFR.id).put('Opportunity__c',pLead.ConvertedOpportunityId);
                        mapDFRUpdate.get(DFR.id).put('MQO_Date_Entered__c',date.today());
    
                        //Reiterate to set field values to the DFR from the lead
                        for(String k:mapMQOFieldMapping.keySet()){  
                            try {
                                mapDFRUpdate.get(DFR.id).put(mapMQOFieldMapping.get(k),pLead.get(k));
                            } catch(exception e) {} 
                        }
    
                        mapDFRUpdate.get(DFR.id).put('MQO_Entered_From__c',vStage);
                        
                        if(DFR.Pre_Opportunity_Status__c == 'Working'){
                            mapDFRUpdate.get(DFR.id).put('Working_Date_Exited__c',Date.Today());
                            mapDFRUpdate.get(DFR.id).put('Working_Exited_To__c',vStage);
                            mapDFRUpdate.get(DFR.id).put('MQO_Entered_From__c',DFR.Pre_Opportunity_Status__c);
                        }else if(DFR.Pre_Opportunity_Status__c == 'MQL'){
                            mapDFRUpdate.get(DFR.id).put('MQL_Date_Exited__c',Date.Today());
                            mapDFRUpdate.get(DFR.id).put('MQL_Exited_To__c',vStage);
                            mapDFRUpdate.get(DFR.id).put('MQO_Entered_From__c',DFR.Pre_Opportunity_Status__c);
                        }else if(DFR.Pre_Opportunity_Status__c == 'PQL'){
                            mapDFRUpdate.get(DFR.id).put('PQL_Date_Exited__c',Date.Today());
                            mapDFRUpdate.get(DFR.id).put('PQL_Exited_To__c',vStage);
                            mapDFRUpdate.get(DFR.id).put('MQO_Entered_From__c',DFR.Pre_Opportunity_Status__c);
                        }else if(DFR.Pre_Opportunity_Status__c == 'Inquiry'){
                            mapDFRUpdate.get(DFR.id).put('Prospect_Date_Exited__c',Date.Today());
                            mapDFRUpdate.get(DFR.id).put('Prospect_Exited_To__c',vStage);
                            mapDFRUpdate.get(DFR.id).put('MQO_Entered_From__c',DFR.Pre_Opportunity_Status__c);
                        }       
                        mapDFRUpdate.get(DFR.id).put('Pre_Opportunity_Status__c',vStage);   
                    }
                    
                    vCreateDFR = False; //Set flag to not create DFR
                }
                
                if(vCreateDFR == True  && pLead.ConvertedOpportunityId <> null && pLead.OpportunitySubType__c <> Null){ //Create DFR for converted lead
                    if(setDFRBusinessUnits.contains(pLead.OpportunitySubType__c.ToUpperCase())){
                        Demand_Funnel__c DFR = new Demand_Funnel__c();
                        
                        if (pLead.ConvertedContactId <> null){                          
                            DFR.Contact__c = pLead.ConvertedContactId;          
                        }
                        if (pLead.ConvertedAccountId <> null){
                            DFR.Account__c = pLead.ConvertedAccountId;
                        }
                        if (pLead.ConvertedOpportunityId <> null){
                            mapOpportunity.put(pLead.ConvertedOpportunityId, new Opportunity(Id=pLead.ConvertedOpportunityId, Opportunity_Contact_Source__c = pLead.ConvertedContactId, DFR_FromLeadConvert__c = True));
                            //, ContactStatus__c = 'Open Opportunity'
                            mapContact.put(pLead.ConvertedContactId, new Contact(Id=pLead.ConvertedContactId, DFR_FromLeadConvert__c = True, Rating__c = pLead.Rating));
                            
                            DFR.Opportunity__c = pLead.ConvertedOpportunityId;
                            DFR.MQO_Date_Entered__c = Date.Today();
        
                            //Reiterate to set field values to the DFR from the lead
                            for(String k:mapMQOFieldMapping.keySet()){  
                                try {
                                    DFR.put(mapMQOFieldMapping.get(k),pLead.get(k));
                                } catch(exception e) {} 
                            }
        
                            DFR.MQO_Entered_From__c = vStage;
                            DFR.Business_Unit__c = pLead.OpportunitySubType__c; 
                            DFR.Pre_Opportunity_Status__c = vStage; 
                            
                            listDFRInsert.add(DFR);
                        }
                    }
                }
            }
                                    
            if (listDFRInsert.size()> 0){       
                Database.SaveResult[] srInsert = Database.insert(listDFRInsert, false); 
                
                for (Database.SaveResult sr : srInsert) {
                    if (!sr.isSuccess()) {             
                        for(Database.Error err : sr.getErrors()) {
                            System.debug('DFR Creation Error: ' + err.getMessage() + ' * ' + err.getFields() + ' * ' + err.getStatusCode());
                        }
                    }
                }
            }
            
            if (mapDFRUpdate.size()> 0){
                Database.SaveResult[] srUpdate = Database.update(mapDFRUpdate.values(), false); 
                
                for (Database.SaveResult sr : srUpdate) {
                    if (!sr.isSuccess()) {        
                        System.debug('DFR Update Error: ' + sr.getId());       
                        for(Database.Error err : sr.getErrors()) {                          
                            System.debug('DFR Update Error: ' + err.getMessage() + ' * ' + err.getFields() + ' * ' + err.getStatusCode());
                        }
                    }
                }
            }
            
            if (mapOpportunity.size()> 0){
                Database.SaveResult[] srUpdate = Database.update(mapOpportunity.values(), false);   
                
                for (Database.SaveResult sr : srUpdate) {
                    if (!sr.isSuccess()) {        
                        System.debug('Opportunity Update Error: ' + sr.getId());       
                        for(Database.Error err : sr.getErrors()) {                          
                            System.debug('Opportunity Update Error: ' + err.getMessage() + ' * ' + err.getFields() + ' * ' + err.getStatusCode());
                        }
                    }
                }
            }       
            
            if (mapContact.size()> 0){
                Database.SaveResult[] srUpdate = Database.update(mapContact.values(), false);   
                
                for (Database.SaveResult sr : srUpdate) {
                    if (!sr.isSuccess()) {        
                        System.debug('Contact Update Error: ' + sr.getId());       
                        for(Database.Error err : sr.getErrors()) {                          
                            System.debug('Contact Update Error: ' + err.getMessage() + ' * ' + err.getFields() + ' * ' + err.getStatusCode());
                        }
                    }
                }
            }       
        }       
    }
    
    public static void OpportunityContactSourceChange(list<Opportunity> tn, map<Id, Opportunity> oldMap){
        list<Opportunity> listOpp = new list<Opportunity>();
        if(oldMap != Null){
            for (integer i=0; i<tn.size(); i++){
                Opportunity to = oldMap.get(tn[i].Id);
                if (to.Opportunity_Contact_Source__c <> tn[i].Opportunity_Contact_Source__c && to.DFR_FromLeadConvert__c == tn[i].DFR_FromLeadConvert__c){
                    /*
                    if (tn[i].Opportunity_Contact_Source__c == Null){
                        DFR_RemoveOpportunity(tn[0].id, to[0].Opportunity_Contact_Source__c);
                    }
                    */
                    if (tn[i].Opportunity_Contact_Source__c <> Null){
                        listOpp.add(tn[i]);                     
                    }
                }
            }
        }else{
            for (integer i=0; i<tn.size(); i++){
                if (tn[i].Opportunity_Contact_Source__c <> Null) {
                    listOpp.add(tn[i]);     
                } 
            }
        }
        
        if(!listOpp.isEmpty()){
            DFR_OpportunityFromContact(listOpp);
        }
    }   
        
    public static void DFR_OpportunityFromContact(list<Opportunity> tn){
        list<Id> listCID = new list<Id>();
        
        for(Opportunity o: tn){
            listCID.add(o.Opportunity_Contact_Source__c);
        }           
        
        if(!listCID.isEmpty()){
            //Retrieve field mapping between contact and DFR for MQO funnel stage       
            map<String, map<String,String>> ContactStageFieldMapping = ContactStageFieldMapping();
            map<String, String> mapMQOFieldMapping = ContactStageFieldMapping.get('MQO');
            
            
            //Retrieve DFR related to Opportunity_Contact_Source__c
            map<Id, Demand_Funnel__c> mapCIDDFR = new map<Id, Demand_Funnel__c>();          
            
            for(Demand_Funnel__c d : [Select d.id, d.Lead__c , d.Pre_Opportunity_Status__c, d.Contact__c    From Demand_Funnel__c d 
            where Contact__c in :listCID and Opportunity__c = Null and d.Pre_Opportunity_Close_Reason__c = Null]){
                mapCIDDFR.put(d.Contact__c, d); 
            }           

            //Retrieve Contact field values related to Opportunity_Contact_Source__c
            String vContactFieldList = '';
            
            for(String k:mapMQOFieldMapping.keySet()){  
                try {
                    vContactFieldList = vContactFieldList + k + ',';
                } catch(exception e) {} 
            }
            
            list<Contact> listContact = new list<Contact>();
            
            if(vContactFieldList <> ''){
                try{
                    vContactFieldList = vContactFieldList.substring(0,vContactFieldList.length() - 1);
                    String soql = 'Select c.id, c.ContactStatus__c, c.Opportunity_Sub_Type__c, ' +  vContactFieldList + ' from Contact c where c.id in :listCID';
                    listContact = Database.query(soql);
                } catch(exception e) {} 
            }
            
            map<Id, Contact> mapContact = new map<Id, Contact>();
            
            for(Contact c : listContact){
                mapContact.put(c.Id, c);
            }
            
            list<Demand_Funnel__c> listDFRInsert = new list<Demand_Funnel__c>();
            map<Id, Demand_Funnel__c> mapDFRUpdate = new map<Id, Demand_Funnel__c>();
            
            //Retrieve Business Units included to the DFR tracking
            set<String> setDFRBusinessUnits = getDFRBusinessUnits();
            
            for(Opportunity o : tn){
                
                if(mapContact.containsKey(o.Opportunity_Contact_Source__c)){
                    Contact c = mapContact.get(o.Opportunity_Contact_Source__c);
                    //c.ContactStatus__c = 'Open Opportunity';
                    
                    Boolean vCreateDFR = True;
                    
                    if(mapCIDDFR.containsKey(o.Opportunity_Contact_Source__c)){
                        Demand_Funnel__c DFR = mapCIDDFR.get(o.Opportunity_Contact_Source__c);
    
                        mapDFRUpdate.put(DFR.id, new Demand_Funnel__c(Id=DFR.id));  
                        
                        mapDFRUpdate.get(DFR.id).put('Account__c',o.AccountId);
                        mapDFRUpdate.get(DFR.id).put('Opportunity__c',o.Id);                            
                        mapDFRUpdate.get(DFR.id).put('MQO_Date_Entered__c',date.today());
                        mapDFRUpdate.get(DFR.id).put('MQO_Entered_From__c','MQO');
                        
                        for(String k:mapMQOFieldMapping.keySet()){  
                            try {
                                mapDFRUpdate.get(DFR.id).put(mapMQOFieldMapping.get(k),c.get(k));
                            } catch(exception e) {} 
                        }
                                     
                        if(DFR.Pre_Opportunity_Status__c == 'Working'){
                            mapDFRUpdate.get(DFR.id).put('Working_Date_Exited__c',Date.Today());
                            mapDFRUpdate.get(DFR.id).put('Working_Exited_To__c','MQO');
                            mapDFRUpdate.get(DFR.id).put('MQO_Entered_From__c','Working');                  
                        }else if(DFR.Pre_Opportunity_Status__c == 'MQL'){
                            mapDFRUpdate.get(DFR.id).put('MQL_Date_Exited__c',Date.Today());
                            mapDFRUpdate.get(DFR.id).put('MQL_Exited_To__c','MQO');
                            mapDFRUpdate.get(DFR.id).put('MQO_Entered_From__c','MQL');
                        }else if(DFR.Pre_Opportunity_Status__c == 'PQL'){
                            mapDFRUpdate.get(DFR.id).put('PQL_Date_Exited__c',Date.Today());
                            mapDFRUpdate.get(DFR.id).put('PQL_Exited_To__c','MQO');
                            mapDFRUpdate.get(DFR.id).put('MQO_Entered_From__c','PQL');
                        }else if(DFR.Pre_Opportunity_Status__c == 'Inquiry'){
                            mapDFRUpdate.get(DFR.id).put('Prospect_Date_Exited__c',Date.Today());
                            mapDFRUpdate.get(DFR.id).put('Prospect_Exited_To__c','MQO');
                            mapDFRUpdate.get(DFR.id).put('MQO_Entered_From__c','Inquiry');
                        }       
                        mapDFRUpdate.get(DFR.id).put('Pre_Opportunity_Status__c','MQO');    
                        
    
                        vCreateDFR = False; //Set DFR creation flag to false
                     }
                     
                     String vOpportunitySubType;
                     
                     if(o.SubType__c <> Null){
                        vOpportunitySubType = o.SubType__c;
                     }else if(c.Opportunity_Sub_Type__c <> Null){
                        vOpportunitySubType = c.Opportunity_Sub_Type__c;
                     }
            
                     if(vCreateDFR == True && vOpportunitySubType <> Null){ //Create DFR since one doesn't exist
                        if(setDFRBusinessUnits.contains(vOpportunitySubType.ToUpperCase())){
                            Demand_Funnel__c DFR = new Demand_Funnel__c();
                                            
                            DFR.Account__c = o.AccountId;
                            DFR.Contact__c = o.Opportunity_Contact_Source__c;
                            DFR.Opportunity__c = o.Id;  
                            
                            DFR.MQO_Date_Entered__c = Date.Today();
                            DFR.MQO_Entered_From__c = 'MQO';
                            DFR.Account__c = o.AccountId;
                            DFR.Opportunity__c = o.Id;  
                                                                
                            for(String k:mapMQOFieldMapping.keySet()){  
                                try {
                                    DFR.put(mapMQOFieldMapping.get(k),c.get(k));
                                } catch(exception e) {} 
                            }
                            
                            DFR.Business_Unit__c = vOpportunitySubType; 
                            DFR.Pre_Opportunity_Status__c = 'MQO';  
                            
                            listDFRInsert.add(DFR);     
                        }
                    }
                    
                    mapContact.put(o.Opportunity_Contact_Source__c,c);
                }
            }
            
            if (listDFRInsert.size()> 0){
                Database.SaveResult[] srInsert = Database.insert(listDFRInsert, false); 
                
                for (Database.SaveResult sr : srInsert) {
                    if (!sr.isSuccess()) {             
                        for(Database.Error err : sr.getErrors()) {
                            System.debug('DFR Creation Error: ' + err.getMessage() + ' * ' + err.getFields() + ' * ' + err.getStatusCode());
                        }
                    }
                }
            }
            
                                
            if (mapDFRUpdate.size()> 0){ 
                Database.SaveResult[] srUpdate = Database.Update(mapDFRUpdate.values(),false);
                
                for (Database.SaveResult sr : srUpdate) {
                    if (!sr.isSuccess()) {             
                        for(Database.Error err : sr.getErrors()) {
                            System.debug('DFR Creation Error: ' + err.getMessage() + ' * ' + err.getFields() + ' * ' + err.getStatusCode());
                        }
                    }
                }
            }
            
            if (mapContact.size()> 0){ 
                Database.SaveResult[] srUpdate = Database.Update(mapContact.values(),false);
                
                for (Database.SaveResult sr : srUpdate) {
                    if (!sr.isSuccess()) {             
                        for(Database.Error err : sr.getErrors()) {
                            System.debug('Contact Update Error: ' + err.getMessage() + ' * ' + err.getFields() + ' * ' + err.getStatusCode());
                        }
                    }
                }
            }
                        
        }
    }
        
    public static void DFR_OpportunityClosed(list<Opportunity> tn, map<Id, Opportunity> oldMap){
        
        list<Id> listConId = new list<Id>();
        //list<Id> listOppId = new list<Id>();
        map<Id, Opportunity> mapOpportunity = new map<Id, Opportunity>();
        
        for (integer i=0; i<tn.size(); i++){
            Opportunity to = oldMap.get(tn[i].Id);
            if(tn[i].IsClosed <> to.IsClosed && tn[i].IsClosed == true && tn[i].Opportunity_Contact_Source__c <> Null){
                listConId.add(tn[i].Opportunity_Contact_Source__c);
                //listOppId.add(tn[i].Id);
                mapOpportunity.put(tn[i].Id, tn[i]);
            }       
        }
        
        if(listConId.size() > 0){
            
            //Retrieve field mapping between contact and DFR for EOL funnel stage
            map<String, map<String,String>> ContactStageFieldMapping = ContactStageFieldMapping();
            map<String, String> mapEOLFieldMapping = ContactStageFieldMapping.get('EOL');
            
            //Retrieve Contact field values related Opportunity_Contact_Source__c
            String vContactFieldList = '';
            for(String k:mapEOLFieldMapping.keySet()){  
                try {
                    vContactFieldList = vContactFieldList + k + ',';
                } catch(exception e) {} 
            }
                        
            map<Id, Contact> mapContact = new map<Id, Contact>();

            if(vContactFieldList <> ''){
                try{
                    vContactFieldList = vContactFieldList.substring(0,vContactFieldList.length() - 1);
                    String soql = 'Select id, ContactStatus__c, ' +  vContactFieldList + ' from Contact where id in :listConId';
                    list<Contact> listCon = Database.Query(soql);
                    if(listCon.size() > 0){
                        for(Contact c1 : listCon){
                            mapContact.put(c1.id,c1);
                        }
                    }
                } catch(exception e) {} 
            }
                            
            Demand_Funnel__c[] listDFR = [Select d.Contact__c, d.Opportunity__c, d.id, d.Pre_Opportunity_Status__c, d.Opportunity__r.OwnerId From Demand_Funnel__c d 
                    where d.Opportunity__c in :mapOpportunity.keySet()];
            
            //Mapping use to update existing DFR
            map<id,Demand_Funnel__c> mapDFRUpdate = new map<id,Demand_Funnel__c>();
                    
            for(Demand_Funnel__c DFR : listDFR){                
                if(mapContact.containsKey(DFR.Contact__c)){
                    Contact c = mapContact.get(DFR.Contact__c);
                                    
                    mapDFRUpdate.put(DFR.id, new Demand_Funnel__c(Id=DFR.id));               
                    mapDFRUpdate.get(DFR.id).put('EOL_Date_Entered__c',date.today());
                    mapDFRUpdate.get(DFR.id).put('EOL_Entered_From__c','MQO');
                    
                    //Reiterate to set field values to the DFR from the contact
                    for(String k:mapEOLFieldMapping.keySet()){  
                        try {
                            mapDFRUpdate.get(DFR.id).put(mapEOLFieldMapping.get(k),c.get(k));
                        } catch(exception e) {} 
                    }
                    
                    if(!mapOpportunity.get(DFR.Opportunity__c).IsWon){
                        mapDFRUpdate.get(DFR.id).put('Opp_Stage_Before_Lost__c', oldMap.get(DFR.Opportunity__c).StageName);
                        //c.ContactStatus__c = 'Closed Lost Opportunity';
                    }else{
                        //c.ContactStatus__c = 'Closed Won Opportunity';
                    }
                    
                    mapContact.put(DFR.Contact__c, c);                  
                }                   
            }
            
            //Update existing DFR
            if (mapDFRUpdate.size()> 0){ 
                Database.SaveResult[] srUpdate = Database.update(mapDFRUpdate.values(),false);
                
                for (Database.SaveResult sr : srUpdate) {
                    if (!sr.isSuccess()) {  
                        System.debug('DFR Update Error: ' + sr.getId());            
                        for(Database.Error err : sr.getErrors()) {                           
                            System.debug('DFR Update Error: ' + err.getMessage() + ' * ' + err.getFields() + ' * ' + err.getStatusCode());
                        }
                    }
                }
            }
            
            //Update Contact
            if (mapContact.size()> 0){ 
                Database.SaveResult[] srUpdate = Database.update(mapContact.values(),false);
                
                for (Database.SaveResult sr : srUpdate) {
                    if (!sr.isSuccess()) {  
                        System.debug('Contact Update Error: ' + sr.getId());            
                        for(Database.Error err : sr.getErrors()) {                           
                            System.debug('Contact Update Error: ' + err.getMessage() + ' * ' + err.getFields() + ' * ' + err.getStatusCode());
                        }
                    }
                }
            }
        }
    }
    
    public static void DFR_OpportunityReOpen(list<Opportunity> tn, map<Id, Opportunity> oldMap){
        
        list<Id> listOppId = new list<Id>();
        
        for (integer i=0; i<tn.size(); i++){
            Opportunity to = oldMap.get(tn[i].Id);
            if(tn[i].IsClosed <> to.IsClosed && tn[i].IsClosed == false && tn[i].Opportunity_Contact_Source__c <> Null){
                listOppId.add(tn[i].Id);
            }       
        }
        
        if(listOppId.size() > 0){
            
            //Retrieve field mapping between contact and DFR for EOL funnel stage
            map<String, map<String,String>> ContactStageFieldMapping = ContactStageFieldMapping();
            map<String, String> mapEOLFieldMapping = ContactStageFieldMapping.get('EOL');
                                        
            Demand_Funnel__c[] listDFR = [Select d.Contact__c, d.id, d.Pre_Opportunity_Status__c, d.Opportunity__r.OwnerId From Demand_Funnel__c d 
                    where d.Opportunity__c in :listOppId];
            
            //Mapping use to update existing DFR
            map<id,Demand_Funnel__c> mapDFRUpdate = new map<id,Demand_Funnel__c>();
            map<Id, Contact> mapContact = new map<Id, Contact>();
                    
            for(Demand_Funnel__c DFR : listDFR){                        
                mapDFRUpdate.put(DFR.id, new Demand_Funnel__c(Id=DFR.id));              
                mapDFRUpdate.get(DFR.id).put('EOL_Date_Entered__c',Null);
                mapDFRUpdate.get(DFR.id).put('EOL_Entered_From__c',Null);
                mapDFRUpdate.get(DFR.id).put('Opp_Stage_Before_Lost__c',Null);              
                
                //Reiterate to set field values to the DFR from the contact
                for(String k:mapEOLFieldMapping.keySet()){  
                    try {
                        mapDFRUpdate.get(DFR.id).put(mapEOLFieldMapping.get(k),Null);
                    } catch(exception e) {} 
                }   
                
                //mapContact.put(DFR.Contact__c, new Contact(Id = DFR.Contact__c, ContactStatus__c = 'Open Opportunity'));          
            }
            
            //Update existing DFR
            if (mapDFRUpdate.size()> 0){ 
                Database.SaveResult[] srUpdate = Database.update(mapDFRUpdate.values(),false);
                
                for (Database.SaveResult sr : srUpdate) {
                    if (!sr.isSuccess()) {  
                        System.debug('DFR Update Error: ' + sr.getId());            
                        for(Database.Error err : sr.getErrors()) {                           
                            System.debug('DFR Update Error: ' + err.getMessage() + ' * ' + err.getFields() + ' * ' + err.getStatusCode());
                        }
                    }
                }
            }
            
            //Update Contact
            if (mapContact.size()> 0){ 
                Database.SaveResult[] srUpdate = Database.update(mapContact.values(),false);
                
                for (Database.SaveResult sr : srUpdate) {
                    if (!sr.isSuccess()) {  
                        System.debug('Contact Update Error: ' + sr.getId());            
                        for(Database.Error err : sr.getErrors()) {                           
                            System.debug('Contact Update Error: ' + err.getMessage() + ' * ' + err.getFields() + ' * ' + err.getStatusCode());
                        }
                    }
                }
            }
        }
    }
    
    public static map<String, String> getLeadToContactFieldMapping(){
        map<String, Schema.SObjectField> mapLSchema = Schema.SObjectType.Lead.fields.getMap();
        map<String, Schema.SObjectField> mapCSchema = Schema.SObjectType.Contact.fields.getMap();
        map<String, String> mapCS = new Map<String, String>();
        map<String, Lead2ContactFieldMapping__c > csLeadToContactFields = new map<String, Lead2ContactFieldMapping__c>();
        
        if(!test.isRunningTest()){
            csLeadToContactFields = Lead2ContactFieldMapping__c.getAll();
        }else{
            csLeadToContactFields.put('1',new Lead2ContactFieldMapping__c(name = '1', Lead_Field__c = 'FirstName', Contact_Field__c = 'FirstName'));
        }

        for(String k:csLeadToContactFields.keySet()){  
            String vLeadField = csLeadToContactFields.get(k).Lead_Field__c;
            String vContactField = csLeadToContactFields.get(k).Contact_Field__c;
            if (vContactField <> Null && vLeadField <> Null){
                if(mapLSchema.containsKey(vLeadField) && mapCSchema.containsKey(vContactField)){
                    mapCS.put(vLeadField,vContactField);
                }
            }
        }
        
        return mapCS; 
    }
    
    public static void LeadConversionLeadToContactMapping(list<Lead> listNew, map<Id, Lead> oldMap){

        list<Lead> listLead = new list<Lead>();
        
        for (Lead tn : listNew){
            Lead to = oldMap.get(tn.Id);
            if(to.isConverted == false && tn.isConverted == true  && tn.ConvertedContactId <> Null){
                listLead.add(tn);
            }       
        }       
        
        if(!listLead.isEmpty()){
            
            map<String, String> mapLead2ContactFields = getLeadToContactFieldMapping();
            
            map<id, Contact> mapContact = new map<id, Contact>();
            
            for(Lead l : listLead){
                mapContact.put(l.ConvertedContactId, new Contact(Id=l.ConvertedContactId)); 
                
                for(String k : mapLead2ContactFields.keySet()){  
                    try {                       
                        mapContact.get(l.ConvertedContactId).put(mapLead2ContactFields.get(k),l.get(k));
                    } catch(exception e) {} 
                }
            }
            
            if (mapContact.size()> 0){

                Database.SaveResult[] srUpdate = Database.Update(mapContact.values(),false);
                    
                for (Database.SaveResult sr : srUpdate) {
                    if (!sr.isSuccess()) {             
                        for(Database.Error err : sr.getErrors()) {
                            System.debug('Contact Update Error: ' + err.getMessage());
                        }
                    }
                }
            }               
        }
    }
}