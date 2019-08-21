/**
 * qtcExternalConfigurator.cls
 * @Controller for external configurator in Salesforce CPQ 
 *
**/
public with sharing class qtcExternalConfigurator{

    	//General properties
		public JSON2Apex myConfig {get;set;}
        public String jsonInput {get;set;}
        public String bundleId {get;set;}
        public String accountId {get;set;}
    	public Map<String, Object> jsonResults {get;set;}
   		public String jsonOutput {get;set;}
		
    	//Configuration properties
        public List<FeatureWrapper> features {get;set;}
        public Map<String,OptionsWrapper> poWrapSelected {get;set;}
        public Map<String,OptionsWrapper> poWrapSelectedCodex {get;set;}
        public Map<String,OptionsWrapper> poWrapNew {get;set;}
        private Map<String,String> product_to_Options {get;set;}
        private Map<String,String> options_to_Feature {get;set;}
        public Map<String,Integer> optionCounterSelected {get;set;}
        public Map<String,Integer> optionCounterSelectedAsset {get;set;}
        public Integer selectedQty {get;set;}
        public Boolean submitJSON {get;set;}
        public String quoteName {get;set;}
        public Map<String, SBQQ__ProductFeature__c> featuresList {get;set;}
      	public Map <String, List<SBQQ__ProductFeature__c>> mapFeatureObject {get;set;}
        public Map <String, String> mapObjectFilters {get;set;}
        public Map<ID, ID> prodToOptionMap {get;set;}

    	//Codex properties
    	public String codexQueryStr {get;set;}
        public List<CodexWrapper> codexRecords; //{get;set;}
        public List<SelectedCodexWrapper> selectedCodex {get;set;}
        private Set<Id> setSelectedCodexes;
        private Set<Id> setAddedOptions;
        public List<codOptionsWrapper> codOptionsNew {get;set;}
        public List<extConfigWrapper> externalObjs {get;set;}
        public Integer codexRecordCount {get; set;}
        public Integer codPageNumber {get;set;}
        public Integer codPageSize {get;set;}
        public Map<String, String> prodToCMap {get;set;}
    	public Map<String, String> cToPMap {get;set;}
        public Boolean showCodex {get;set;}
    	public List<SelectedCodexWrapper> lstWrapper {get;set;}
    	public List<SelectedCodexWrapper> lstSetController {get;set;}
        public Set<String> existingCodex {get;set;}
 
    
    	//CustomIterable obj;
		
    	//Connector properties
    	public String connectorQueryStr {get;set;}
        public List<ConnectorsWrapper> connectorRecords {get;set;}
        public List<SelectedConsWrapper> selectedCons {get;set;}
        public List<conOptionsWrapper> conOptionsNew {get;set;}
        public Integer connectorRecordCount {get; set;}
        public Integer conPageNumber {get;set;}
        public Integer conPageSize {get;set;}
        public Map<String, String> prodToConMap {get;set;}
    	public Map<String, String> conToPMap {get;set;}
    	public Boolean showConnector {get;set;}
        public Set<String> existingConnectors {get;set;}

    	//Pagination for codex selection pane
        public ApexPages.StandardSetController con {
            get{
                if(con == null){
                    con = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id, Name, Product__c, CountryCode__c, Jurisdiction__c, 
                                                                                        Return_Code__c FROM Codex__c 
                                                                                        WHERE RecordTypeName__c ='Return Code']));
                    con.setPageSize(20);
                }
                return con;
            }
            set;
        }
    	
    	//Pagination controller for selected codex pane
    	//public ApexPages.StandardSetController cons {get; set;} 
       
    
    
//Constructor    
public QtcExternalConfigurator(){

    submitJSON=false;    
    setSelectedCodexes = new Set<Id>();
   	getCodexRecords();
    selectedCodex = new List<SelectedCodexWrapper>();
    selectedCons = new List<SelectedConsWrapper>();
    setAddedOptions=new Set<Id>();
 
}

    public PageReference jsonProcess(){

        System.debug('JSON input: ' + json.serializepretty(jsonInput));
        
                
    	//call method to get existing configuration Ids    
    	getReconfigIds(jsonInput);
        
        
        //Get Bundle ID from the JSON
        String configIdLabel='configuredProductId';
        Integer loc2=jsonInput.indexOf('configuredProductId') + configIdLabel.length()+3;
        bundleId=jsonInput.substring(loc2, loc2+18);
            system.debug('Bundle product id is: ' + bundleId);

        //Replace the Standard text
        Map<String,String> standardFixes=new Map<String,String>();
        standardFixes.put('SBQQ__', 'SBQQ_');
        standardFixes.put('SBQQSC__', 'SBQQSC_');
        standardFixes.put('__c', '_c');
        standardFixes.put('__r', '_r');
            system.debug('Running replacement job...');

        //Update the JSON string from CPQ using standard fixes map
        //Replace "__" with "_" so the JSON2Apex class can parse cleanly/without issue
        for(String s:standardFixes.keySet()){
            jsonInput=jsonInput.replace(s, standardFixes.get(s));
        }

        //Get the Features from the Bundle using Bundle ID
        for(SBQQ__ProductFeature__c  feat:[Select id, Name, Replacement_Name__c from SBQQ__ProductFeature__c where SBQQ__ConfiguredSKU__c=:bundleId Order by SBQQ__Number__c ]){
            String featureName='"' + feat.Name + '"';
            String replaceName='"' + feat.Replacement_Name__c + '"';
            
            //Replace the Feature Name with Replacement Name
            //NOTE: Replacement Name is used as a JSON2Apex-friendly formatted representation (Feature1, Feature2, etc)
            jsonInput=jsonInput.replace(featureName, replaceName);
        }
            system.debug('INITIAL EDITED INPUT: ' + jsonInput);
        	System.debug('Log JSONinput=====> ' + json.serializepretty(jsonInput));
        
        //Display connectors or codex
        List<SBQQ__ProductFeature__c> codFeats = [SELECT ID FROM SBQQ__ProductFeature__c WHERE External_Config_Object__c='Codex__c' and SBQQ__ConfiguredSKU__c=:bundleId];
        List<SBQQ__ProductFeature__c> conFeats = [SELECT ID FROM SBQQ__ProductFeature__c WHERE External_Config_Object__c='Connector__c' and SBQQ__ConfiguredSKU__c=:bundleId];
			System.debug('Codex feature count: '+codFeats.size());
        	System.debug('Connector feature count: '+conFeats.size());

                if(codFeats.size()>0){
                    showCodex=true;
                }
                else{
                    showCodex=false;
                }
                if(conFeats.size()>0){
                    showConnector=true;
                }
                else{
                    showConnector=false;
                }         
        			system.debug('Show codex: '+showCodex);
           			system.debug('Show connector: '+showConnector);

        
        	product_to_Options=new Map<String,String>();
            options_to_Feature=new Map<String,String>();
			
        	        
            //Parse the scrubbed JSON input
            myConfig=JSON2Apex.parse(jsonInput);
                system.debug('Parsed JSONinput: ' + myConfig);

            //Invoke initial processes
            customObjectsMap();
            
            gatherSearchableFeatures();

            accountId=myConfig.quote.SBQQ_Account_c;
            quoteName=myConfig.quote.Name;
                system.debug('Quote name is: ' + myConfig.quote.Name);
        
        
        return null;
    }

    //Method to get list of external config objects referenced by features of the current bundle based on Prod Id
    public pageReference customObjectsMap(){

        //Bundle ID from JSONprocess -- used to get features, objects and other details
        system.debug('Bundle Product Id is' + bundleId);

        //Get list of Custom objects from features
        List <String> configObjects = new List<String>();
        List <SBQQ__ProductFeature__c> featuresList = [Select Id, External_Config_Object__c, External_Config_Display_Fields__c, External_Config_Filter_Value__c, External_Config_Operator__c,
                                 External_Config_Product_Field__c, External_Config_Search_Fields__c, External_Config_Target_Field__c, External_Config_Tested_Field__c
                                 FROM SBQQ__ProductFeature__c where External_Config_Object__c != null and SBQQ__ConfiguredSKU__c=:bundleId ];
            for(SBQQ__ProductFeature__c f:featuresList) {
                configObjects.add(f.External_Config_Object__c);
            }
                  //  system.debug('Features returned: '+ featuresList);
                  //  system.debug('Configuration returned: '+ configObjects);

        //Create map of feature to custom objects and custom object to filter fields
        Map <String, List<SBQQ__ProductFeature__c>> mapFeatureObject = new Map <String, List<SBQQ__ProductFeature__c>>();
        Map <String, String> mapObjectFilters = new Map <String, String>();
            for(SBQQ__ProductFeature__c feat:featuresList){
                mapFeatureObject.put(feat.External_Config_Object__c,featuresList);
                mapObjectFilters.put(feat.External_Config_Object__c, getWhereClause(feat.External_Config_Tested_Field__c, feat.External_Config_Operator__c, feat.External_Config_Filter_Value__c));
                }
               // system.debug('Map of features:objects '+ mapFeatureObject);
               // system.debug('Map of objects:filters '+ mapObjectFilters);

        //Create map of Feature Object : Field Sets
        Map <String, String> mapObjectFieldset = mapObjectFieldset(featuresList);

                      
        //Get list of valid options
        List<ID> validOptions = new List<ID>(getOptionsModel(bundleId));

        //Create map of Optional ProductID to Option ID
        prodOptMap(bundleId);

        //For Codex, get field set members and filter field values
        if(mapObjectFieldset.ContainsKey('Codex__c')){
            String codexFieldSet = mapObjectFieldset.get('Codex__c');
            
            List<Schema.FieldSetMember> fieldSetMemberList = readFieldSet(codexFieldSet, 'Codex__c');
            List<String> codexFsFields = new List<String>();
            Integer codexColumnsCt = codexFsFields.size();
                     
            //Get fields to include in Codex query
            for(Schema.FieldSetMember fsMemberObj : fieldSetMemberList){
                codexFsFields.add(fsMemberObj.getFieldPath());
            }
                
            //Generate SELECT query string for Codex
            if(codexFsFields.size() > 0){
                    String codexQueryFields = getListToString(codexFsFields);
                        
            //Generate WHERE clause for query string
                String codexWhereClause = mapObjectFilters.get('Codex__c');
    
            //Take SELECT fields string and WHERE clause string to generate full query string
                if(codexWhereClause != null){
                    String codexQueryStr = 'SELECT Id, Name, Product__c, ' + codexQueryFields +' FROM Codex__c ' + codexWhereClause +'AND Product__r.Id IN :validOptions';
                        system.debug('Codex query string is: ' + codexQueryStr);
    
                }
            }

        }
               
        if(mapObjectFieldset.ContainsKey('Connector__c')){
            String connectorFieldSet = mapObjectFieldset.get('Connector__c');
            
            List<Schema.FieldSetMember> fieldSetMemberList = readFieldSet(connectorFieldSet, 'Connector__c');
            List<String> connectorFsFields = new List<String>();
            Integer connectorColumnsCt = connectorFsFields.size();
                     
            //Get fields to include in Connector query
            for(Schema.FieldSetMember fsMemberObj : fieldSetMemberList){
                connectorFsFields.add(fsMemberObj.getFieldPath());
            }
                
            //Generate SELECT query string for Connector
            if(connectorFsFields.size() > 0){
                    String connectorQueryFields = getListToString(connectorFsFields);
                        
            	//Generate WHERE clause for query string
                String connectorWhereClause = mapObjectFilters.get('Connector__c');
    
            	//Take SELECT fields string and WHERE clause string to generate full query string
                if(connectorWhereClause != null){
                    String connectorQueryStr = 'SELECT Id, Product__c, ProductName__c,' + connectorQueryFields +' FROM Connector__c ' + connectorWhereClause +'AND Product__r.Id IN :validOptions';
                        
            	//Execute the query and add results to wrapper class              
                connectorRecords = new List<ConnectorsWrapper>();
                    for(Connector__c c : Database.query(connectorQueryStr)) {
                        ConnectorsWrapper cw=new ConnectorsWrapper(c);
                        cw.selected = setSelectedCodexes.contains(c.Id);
                        connectorRecords.add(cw);
                    }
                }
            }
        }
        
    return null;

    }

    //Get Codex Records for initial page
	public List<CodexWrapper> getCodexRecords(){
    	codexRecords = new List<CodexWrapper>();
                for(Codex__c c : (List<Codex__c>)con.getRecords()) {
                    CodexWrapper cw = new CodexWrapper(c);
                    cw.selected = setSelectedCodexes.contains(c.Id);
					codexRecords.add(cw);
                }
        return codexRecords;
    }
    
    //Get existing Selections from Configuration
    public void getReconfigIds(String jsonInput){
        
        //Deserialize Untyped JSON
        Map<String, Object> jsonResults = (Map<String, Object>)JSON.deserializeUntyped(jsonInput);
        	system.debug('json untyped ---> ' +jsonResults.get('product'));
            system.debug('untyped keys: '+jsonResults.keyset()); 
        
        //Set Redirect Values
        Map<String, Object> redirectMap = (Map<String, Object>)jsonResults.get('redirect');
        	redirectMap.put('auto','true');
        	redirectMap.put('save','true');
          		//system.debug('redirectMap ==> ' + redirectMap);
				system.debug('new json results==> '+jsonResults);
        	
        String jsonOutput = JSON.serialize(jsonResults);
        	system.debug('JSON Output Results====> '+jsonOutput);
        
        existingCodex = new Set<String>();
        existingConnectors = new Set<String>();
                   
        //Start at product level
        Map<String, Object> productObjsMap = (Map<String, Object>)jsonResults.get('product');
        	system.debug('product objs: '+productObjsMap);
        
        //Get option configurations (features)
        Map<String, Object> optionConfigMap = (Map<String, Object>)productObjsMap.get('optionConfigurations');
        	system.debug('option configs===> '+optionConfigMap.keyset());
        
        	//Get Options    
        	List<Object> returnOptions = (List<Object>)optionConfigMap.get('By Return');
        		for (Object option: returnOptions){
            		Map<String, Object> existingOptions = (Map<String, Object>)option;
                		system.debug('existingOptions ==> '+existingOptions);
                
        		//Get Read Only    
                for(Object readOnly : existingOptions.keyset()){
                    if(readOnly =='readOnly'){
                        Map<String, Object> readOnlyObjs = (Map<String, Object>)existingOptions.get('readOnly');
                           system.debug('readOnly==> '+readOnlyObjs);
                     //Get Line level
                     for(Object line : readOnlyObjs.keyset()){
                         if(line == 'line'){
                            Map<String, Object> lines = (Map<String, Object>)readOnlyObjs.get('line');
                               system.debug('line==> '+lines);
                             for(Object attribute : lines.keyset()){
                                 if(attribute == 'Return_Code__c'){
                                     String codexId = String.valueOf(lines.get('Return_Code__c'));
                                     existingCodex.add(codexID);
                                     	system.debug('adding codex: '+codexId);
                                 }
                                 if(attribute == 'Connector__c'){
                                     String connector = String.valueOf(lines.get('Connector__c'));
                                     existingConnectors.add(connector);
                                     	system.debug('adding connector: '+connector);
                                 }
                             }
                     	  }
                     }
                  }
               }                           
            }        
        	system.debug('Codex list==> '+existingCodex);        
        	system.debug('Connector list==> '+existingConnectors); 
        	
        	//take set of strings and add to Selected Codex Wrappers
        	List<CodexWrapper> existingCodWraps = new List<CodexWrapper>();
			List<Codex__c> existingCodObjs = [SELECT ID, Name, Return_Code__c, Jurisdiction__c, Product__c, CountryCode__c FROM Codex__c WHERE ID in:existingCodex];
        		for(Codex__c cod : existingCodObjs){
                    CodexWrapper cw = new CodexWrapper(cod);
                    	existingCodWraps.add(cw);
        		}
        		system.debug('Existing cod wraps==> '+existingCodWraps);
        		
        			for(CodexWrapper c : existingCodWraps){
            			SelectedCodexWrapper scw = new SelectedCodexWrapper(c);
                    		selectedCodex.add(scw);
                    		setSelectedCodexes.add(scw.codex.Id);
        			}
        			system.debug('SelectedCodex ==> '+selectedCodex);
        	      	
        	//take set of strings and add to Selected Connectors
        	List<Connector__c> existingConObjs = [SELECT ID, Name, Product__c, ProductName__c FROM Connector__c WHERE ID in:existingConnectors];
        
    }
    
   		//CODEX RECORD PAGINATION METHODS
    	// indicates whether there are more records after the current page set.
        public Boolean hasNext {
            get {
                return con.getHasNext();
            }
            set;
        }
        // indicates whether there are more records before the current page set.
        public Boolean hasPrevious {
            get {
                return con.getHasPrevious();
            }
            set;
        }
        // returns the page number of the current page set
        public Integer pageNumber {
            get {
                return con.getPageNumber();
            }
            set;
        } 
        // returns the first page of records
        public void first() {
            con.first();
        }
        // returns the last page of records
        public void last() {
            con.last();
        }
        // returns the previous page of records
        public void previous() {
            con.previous();
        }
        // returns the next page of records
        public void next() {
            con.next();
        }
        // returns the PageReference of the original page, if known, or the home page.
        public void cancel() {
            con.cancel();
        }

    
    //Take selected Codex records and add to selected wrapper
    public pageReference gatherSelectedCodex(){
         //List<Codex__c> selCodexList = new List<Codex__c>();
          for(CodexWrapper c : codexRecords){
                if(c.selected == true){
                    if(!setSelectedCodexes.contains(c.codex.Id)) {
                    	selectedCodex.add(new SelectedCodexWrapper(c));
                    	setSelectedCodexes.add(c.codex.Id);
                    	//selCodexList.add(c.codex);
                    }
                }
            }
        
        //lld test
        updateSelections();
        return null;
    }
    
    //Take selected Connector records and add to selected wrapper
    public pageReference gatherSelectedCons(){
          for(ConnectorsWrapper c : connectorRecords){
                if(c.selected == true){
                    if(!setSelectedCodexes.contains(c.connector.Id)) {
	                    selectedCons.add(new SelectedConsWrapper(c));
                        setSelectedCodexes.add(c.connector.Id);
                    }
                }
            }
            system.debug('Selected connectors list includes '+ selectedCons.size()+' records');
        updateSelections();
        return null;
    }

    //Get map of Product ID:Option ID based on bundle Id
    public Map<ID, SBQQ__ProductOption__c> prodOptMap(String bundleId){
        Map<ID, SBQQ__ProductOption__c> prodToOptionMap = new Map<ID, SBQQ__ProductOption__c>();
        List<SBQQ__ProductOption__c> optionsList = [SELECT ID, SBQQ__ProductName__c, SBQQ__ProductCode__c, SBQQ__OptionalSKU__c FROM SBQQ__ProductOption__c WHERE SBQQ__ConfiguredSKU__c=:bundleId];
            for(SBQQ__ProductOption__c o:optionsList){
                prodToOptionMap.put(o.SBQQ__OptionalSKU__c, o);
            }
            //system.debug('Map of Product ID to Option ID: ' +prodToOptionMap);
        return prodToOptionMap;
    }
    
    //Create a map of Codex to Product records from Selected CodexWrapper 
    public Map<String, String> getCodexProdMap (List<SelectedCodexWrapper> codWraps){
        Map<String, String> cToPMap = new Map<String, String>();
            for(SelectedCodexWrapper c:codWraps){
  //              if(!setAddedOptions.contains(c.codex.Id)) {
	                cToPMap.put(c.codex.Id, c.codexProduct);
                    setAddedOptions.add(c.codex.Id);
  //              }
            }
            system.debug('Selected codex to product map includes: '+ cToPMap.size());
        return cToPMap;
    }
    
    //Create a map of Connector to Product records from Selected CodexWrapper 
    public Map<String, String> getConProdMap (List<SelectedConsWrapper> conWraps){
        Map<String, String> cToPMap = new Map<String, String>();
            for(SelectedConsWrapper c:conWraps){
                cToPMap.put(c.connector.Id, c.conProduct);
            }
            system.debug('Selected codex to product map includes: '+ cToPMap.size());
        return cToPMap;
    }
    
    //Create map of Feature Object : Field Sets
    public Map<String, String> mapObjectFieldset(List<SBQQ__ProductFeature__c> featList){
            Map <String, String> mapObjFieldset = new Map <String, String>();
            for(SBQQ__ProductFeature__c feat:featList){
                mapObjFieldset.put(feat.External_Config_Object__c,feat.External_Config_Display_Fields__c);
                }
                //system.debug('Map of features:field sets '+ mapObjFieldset);
            return mapObjFieldset;
    }

    //Create map of Feature to Config Target Field
    public Map<SBQQ__ProductFeature__c, String> getTargetFieldsMap(List<SBQQ__ProductFeature__c> feats){
        Map<SBQQ__ProductFeature__c, String> targetFieldsMap = new Map<SBQQ__ProductFeature__c, String>();
            for(SBQQ__ProductFeature__c f:feats){
                targetFieldsMap.put(f, f.External_Config_Target_Field__c);
            }
            //system.debug('Target fields map: '+ targetFieldsMap);
        return targetFieldsMap;
    }

    //Method to clear selections in Codex Wrapper
    public void resetCodex(){
        for(CodexWrapper c : codexRecords){
                c.selected = false;
        }        
    }
    
    //Method to clear selections in Connectors Wrapper
    public void resetCons(){
        for(ConnectorsWrapper c : connectorRecords){
                c.selected = false;
        }        
    }
    
    //Method to remove selected Connectors from Selected Wrapper
    public void removeConns(){
    /*    List<Integer> deleteCList = new List<Integer>();
        	for(integer i = 0; i<selectedCons.size(); i++){
               if(selectedCons[i].isSelected == true){
                    deleteCList.add(i);
               }
                else{
                    i++;
                }
        	} 
        for(integer x : deleteCList){
            selectedCons.remove(x);
        }
*/
        List<SelectedConsWrapper> newSelectedCons = new List<SelectedConsWrapper>();
        for(SelectedConsWrapper scw:selectedCons) {
            if(!scw.isSelected) {
                newSelectedCons.add(scw);
            } else {
                setSelectedCodexes.remove(scw.connector.Id);
            }
        }
        selectedCons = newSelectedCons;
    }

    //Method to remove selected Codex from Selected Codex wrapper
     public void removeCodex(){
        List<SelectedCodexWrapper> selectedCodexes = new List<SelectedCodexWrapper>();
        Set<String> codexToRemove = new Set<String>();
        for(SelectedCodexWrapper scw : selectedCodex) {
            if(!scw.isSelected) {
                selectedCodexes.add(scw);
            } else {
                setSelectedCodexes.remove(scw.codex.Id);
                codexToRemove.add(scw.codex.Id);
            }
            removeCodexes(codexToRemove);
        }
        selectedCodex = selectedCodexes;
     
    }

    private void removeCodexes(Set<String> codexToRemove) {
        
            
        List<JSON2Apex.Options> jsonCodexOptions = myConfig.product.OptionConfigurations.Feature_2;
 		List<JSON2Apex.Options> newOptions = new List<JSON2Apex.Options>();
        Integer index=0;
        System.debug('opts to del: '+codexToRemove);
        for(JSON2Apex.Options opt:jsonCodexOptions) {
           system.debug('Return_Code__c: '+opt.configurationData.Return_Code_c);
           if(!codexToRemove.contains(opt.configurationData.Return_Code_c)) {
               system.debug('adding :'+opt.configurationData.Return_Code_c);
               opt.Index = index++;
               newOptions.add(opt);
           }
        }                         
        myConfig.product.OptionConfigurations.Feature_2 = newOptions;
        //Serialize the new configuration JSON and set to new JSON String
        String jtest=JSON.serialize(myConfig);
            system.debug('New JSON string is: '+ jtest); 
 
        //Fix blank string
        String blankline='"' + 'line' + '"' +':null';

        //Set the fixes back to include underscores and namespace prefixes
        jtest=jtest.replaceAll('SBQQ_', 'SBQQ__');
        jtest=jtest.replaceAll('_c', '__c');
        jtest=jtest.replaceAll('_r', '__r');   
        jtest=jtest.replaceAll('SBQQSC_', 'SBQQSC__');
        jtest=jtest.replaceAll('SBQQ___', 'SBQQ__');
        jtest=jtest.replace('type_Z', 'type');
        jtest=jtest.replace(blankline,'');
        jtest=jtest.replace('_c', '__c');
        jtest=jtest.replace('___c', '__c');

        for(SBQQ__ProductFeature__c  feat:[Select id, Name, Replacement_Name__c from SBQQ__ProductFeature__c where SBQQ__ConfiguredSKU__c=:bundleId Order by SBQQ__Number__c ]){
            String featureName='"' + feat.Name + '"';
            String replaceName='"' + feat.Replacement_Name__c + '"';
            //system.debug(featureName);
            //system.debug(replaceName);
            jtest=jtest.replace(replaceName, featureName);

        }
     
        system.debug('====>JSON TO CPQ===> '+ jtest);

        jsonInput=jtest;
        submitJSON=true;
    }

    //Method to create maps of product:option, option:feature
    public void createOptionProductMap(Set<ID> featureIds){
        for(SBQQ__ProductOption__c options:[Select id, SBQQ__OptionalSKU__c,SBQQ__Feature__c from SBQQ__ProductOption__c where SBQQ__Feature__c IN: featureIds]){
            product_to_Options.put(options.SBQQ__OptionalSKU__c, options.id);
            options_to_Feature.put(options.id, options.SBQQ__Feature__c);
        }
    }

    
    //Convert Selections to Option configuration and update JSON
    public PageReference updateSelections(){

        for(FeatureWrapper f:features){
            if(f.feat == null)
            	continue;
            String featureId=f.feat.id;

            List<JSON2Apex.Options> jsonOptions;
                if(f.feat.Replacement_Name__c=='Feature_1'){
                    jsonOptions=myConfig.product.OptionConfigurations.Feature_1;
                }else if(f.feat.Replacement_Name__c=='Feature_2'){
                    jsonOptions=myConfig.product.OptionConfigurations.Feature_2;
                }else if(f.feat.Replacement_Name__c=='Feature_3'){
                    jsonOptions=myConfig.product.OptionConfigurations.Feature_3;
                }else if(f.feat.Replacement_Name__c=='Feature_4'){
                    jsonOptions=myConfig.product.OptionConfigurations.Feature_4;
                }else if(f.feat.Replacement_Name__c=='Feature_5'){
                    jsonOptions=myConfig.product.OptionConfigurations.Feature_5;
                }

            for(OptionsWrapper o:f.options){
                //Selections that have been previously added
                if(o.qty>0 && o.isSelected){
                    Integer originalCount=optionCounterSelected.get(o.productOptionId);
                    system.debug('Original Count: ' + originalCount);
                    Integer j=0;
                    
                    if(o.qty > originalCount){
                       
                        for(Integer i=originalCount; i<o.qty; i++){
                            //Add new option to Class
                            JSON2Apex.Options myNewOption=new JSON2Apex.Options();
                            myNewOption.selected=true;
                            myNewOption.optionId=o.productOptionId;
                            myNewOption.ProductCode=o.ProductCode;
                            myNewOption.ProductName=o.ProductName;
                            myNewOption.Quantity=1;
                            myNewOption.Index=i+1;
                            jsonOptions.add(myNewOption);
                            myNewOption.configurationData = new JSON2Apex.configurationData();
                            //myNewOption.readOnly = new JSON2Apex.ReadOnly();
                            system.debug('Adding option to class...');
                        }
                   
                        system.debug('JSON Options: ' + jsonOptions);
                    }
                }

                //Options that are new and never existed 
                if(o.qty>0 && !o.isSelected){
                        for(Integer i=0; i<o.qty; i++){
                            JSON2Apex.Options myNewOption=new JSON2Apex.Options();
                            myNewOption.selected=true;
                            myNewOption.optionId=o.productOptionId;
                            myNewOption.productCode=o.ProductCode;
                            myNewOption.productName=o.ProductName;
                            myNewOption.Quantity=1;
                            myNewOption.Index=i;
                            // myNewOption.configurationData myConfigData = new JSON2Apex.configurationData();
                            // myConfigData.Return_Code_c=o.Cod;

                            //myNewOption.readOnly=new JSON2Apex.readOnly();
                            jsonOptions.add(myNewOption);
                        }              
                }
            }
        }
        
        //Convert selected Codex into list of Options that should be added to the configuration       
        if(showCodex){
            //system.debug('Features: ' + features);
            Map<ID, SBQQ__ProductOption__c> prodToOptionMapT = prodOptMap(bundleId);
            Map<String, Integer> codexOptionCounter=new Map<String,Integer>();
            Map<String, String> codToProdMap = getCodexProdMap(selectedCodex);
            	
            Set<String> codOptIds = new Set<String>();         	
            Map<String, SBQQ__ProductOption__c> codexOptionMap = new Map<String, SBQQ__ProductOption__c> ();
                    for(String cod: codToProdMap.keyset()){
                        String prod = codToProdMap.get(cod);
                        SBQQ__ProductOption__c opt = prodToOptionMapT.get(prod);
                            codexOptionMap.put(cod, opt);
                        codOptIds.add(opt.Id);
                        }
                    //system.debug('Codex to Option Map has ' +codexOptionMap.size());
                    //system.debug('Option Ids set: '+codOptIds);
            
            for(SBQQ__ProductOption__c opt: codexOptionMap.values()){
                    String oId = opt.Id;
                        if(codexOptionCounter.containskey(oId)){
                           codexOptionCounter.put(oId, codexOptionCounter.get(oId)+1);                    
                        }
                        else{
                             codexOptionCounter.put(oId, 1);
                        }
            }
                system.debug('Codex option counter: '+ codexOptionCounter);
        
            //Add options to wrapper that will be used to add to class
            codOptionsNew = new List<codOptionsWrapper>();
                //Set <String> codOptions = codexOptionMap.keyset();   
            	List<Codex__c> codexList = [Select ID, Name, Return_Code__c FROM Codex__c WHERE ID in:codexOptionMap.keyset() AND ID NOT IN:existingCodex];
            		system.debug('Codex list: '+codexList);
                for(Codex__c cod : codexList){
                        SBQQ__ProductOption__c opt = codexOptionMap.get(cod.Id);
                        String pCode = opt.SBQQ__ProductCode__c;
                        String pName = opt.SBQQ__ProductName__c;
                    	String retLabel = cod.Return_Code__c;
                    codOptionsNew.add(new codOptionsWrapper(opt, cod.Id, pCode, pName, cod));
                }      
                system.debug('New cos:'+ codOptionsNew);
    
            
            List<JSON2Apex.Options> jsonCodexOptions = myConfig.product.OptionConfigurations.Feature_2;
            Set<String> selCodexes = new Set<String>();
            for(JSON2Apex.Options sCod:jsonCodexOptions) {
                selCodexes.add(sCod.configurationData.Return_Code_c);
            }
                                     
                Integer i=jsonCodexOptions.size();//0;
    
                for(codOptionsWrapper o: codOptionsNew){
                    if(o.qty>0 && o.isSelected && !selCodexes.contains(o.codexId)){
                        string oId = o.optionId;
                        integer optCount=codexOptionCounter.get(oId);
                        JSON2Apex.Options myNewOption=new JSON2Apex.Options();
                                  myNewOption.selected=true;
                                  myNewOption.optionId=o.productOption.id;
                                  myNewOption.productCode=o.productCode;
                                  myNewOption.productName=o.productName;
                                  myNewOption.Quantity=1;
                                  myNewOption.Index=optCount+i++;
                        		  //myNewOption.Return_Code_Label_c=o.retLabel;
                                  myNewOption.configurationData = new JSON2Apex.ConfigurationData();
                                  myNewOption.configurationData.Return_Code_c= o.codexId;
                        		  myNewOption.configurationData.Return_Code_Label_c= o.retLabel;
                                  //myNewOption.readOnly=new JSON2Apex.readOnly();
                              jsonCodexOptions.add(myNewOption);
                          system.debug('Adding new option: '+myNewOption);
                     }
                }
        }
        
        //Add selected connectors to the configuration
        if(showConnector){
            //system.debug('Features: ' + features);
            Map<ID, SBQQ__ProductOption__c> prodToOptionMapT = prodOptMap(bundleId);
            Map<String, Integer> conOptionCounter=new Map<String,Integer>();
            Map<String, String> conToProdMap = getConProdMap(selectedCons);
            Set<String> conOptIds = new Set<String>();
            Map<String, SBQQ__ProductOption__c> conOptionMap = new Map<String, SBQQ__ProductOption__c> ();
                    for(String con: conToProdMap.keyset()){
                        String prod = conToProdMap.get(con);
                        SBQQ__ProductOption__c opt = prodToOptionMapT.get(prod);
                            conOptionMap.put(con, opt);
                        conOptIds.add(opt.Id);
                        }
                    system.debug('Connector to Option Map has ' +conOptionMap.size());
                    system.debug('Option Ids set: '+conOptIds);
            
            for(SBQQ__ProductOption__c opt: conOptionMap.values()){
                    String oId = opt.Id;
                        if(conOptionCounter.containskey(oId)){
                           conOptionCounter.put(oId, conOptionCounter.get(oId)+1);                    
                        }
                        else{
                             conOptionCounter.put(oId, 1);
                        }
            }
                system.debug('Connector option counter: '+ conOptionCounter);
        
            //Add options to wrapper that will be used to add to class
            conOptionsNew = new List<conOptionsWrapper>();
                //Set <String> conOptions = conOptionMap.keyset();
                List<Connector__c> connectorList = [Select ID, Name FROM Connector__c WHERE ID in:conOptionMap.keyset()];
                	for(Connector__c con : connectorList){
                        SBQQ__ProductOption__c opt = conOptionMap.get(con.Id);
                        String pCode = opt.SBQQ__ProductCode__c;
                        String pName = opt.SBQQ__ProductName__c;
                    conOptionsNew.add(new conOptionsWrapper(opt, con.Id, pCode, pName, con));
                }      
                system.debug('New con options:'+ conOptionsNew);
    
            
            List<JSON2Apex.Options> jsonConnectorOptions = myConfig.product.OptionConfigurations.Feature_5;
            Set<String> selCons = new Set<String>();
            for(JSON2Apex.Options sCod:jsonConnectorOptions) {
                selCons.add(sCod.configurationData.Connector_c);
            }
                   
                Integer i=jsonConnectorOptions.size();//0;
    
                for(conOptionsWrapper o: conOptionsNew){
                    if(o.qty>0 && o.isSelected && !selCons.contains(o.connectorId)){
                        string oId = o.optionId;
                        integer optCount=conOptionCounter.get(oId);
                        JSON2Apex.Options myNewOption=new JSON2Apex.Options();
                                  myNewOption.selected=true;
                                  myNewOption.optionId=o.productOption.id;
                                  myNewOption.productCode=o.productCode;
                                  myNewOption.productName=o.productName;
                                  myNewOption.Quantity=1;
                                  myNewOption.Index=optCount+i++;
                                  myNewOption.configurationData = new JSON2Apex.ConfigurationData();
                                  myNewOption.configurationData.Connector_c= o.connectorId;
                                  //myNewOption.readOnly=new JSON2Apex.readOnly();
                              jsonConnectorOptions.add(myNewOption);
                          system.debug('Adding new option: '+myNewOption);
                     }
                }
       	}
        

        //Set Redirect to QLE after broadcast
        myConfig.redirect.auto=true;

        //Update config JSON to save JSON back to CPQ
        myConfig.redirect.save=true;

        //Fix blank string
        String blankline='"' + 'line' + '"' +':null';

        //Serialize the new configuration JSON and set to new JSON String
        String jtest=JSON.serialize(myConfig);
            system.debug('New JSON string is: '+ jtest); 

        //Set the fixes back to include underscores and namespace prefixes
        jtest=jtest.replaceAll('SBQQ_', 'SBQQ__');
        jtest=jtest.replaceAll('_c', '__c');
        jtest=jtest.replaceAll('_r', '__r');   
        jtest=jtest.replaceAll('SBQQSC_', 'SBQQSC__');
        jtest=jtest.replaceAll('SBQQ___', 'SBQQ__');
        jtest=jtest.replace('type_Z', 'type');
        jtest=jtest.replace(blankline,'');
        jtest=jtest.replace('_c', '__c');
        jtest=jtest.replace('___c', '__c');

        for(SBQQ__ProductFeature__c  feat:[Select id, Name, Replacement_Name__c from SBQQ__ProductFeature__c where SBQQ__ConfiguredSKU__c=:bundleId Order by SBQQ__Number__c ]){
            String featureName='"' + feat.Name + '"';
            String replaceName='"' + feat.Replacement_Name__c + '"';
            //system.debug(featureName);
            //system.debug(replaceName);
            jtest=jtest.replace(replaceName, featureName);

        }
     
        system.debug('====>JSON TO CPQ===> '+ jtest);
		system.debug('jsonOutput==> ' +jsonOutput);
        
        jsonInput=jtest;
        //jsonInput=jsonOutput;
        submitJSON=true;
        return null;
    }

    
    //Method to get features and options for reference in updating JSON configuration 
    public void gatherSearchableFeatures(){
        features=new List<FeatureWrapper>();
        poWrapSelectedCodex=new Map<String,OptionsWrapper>();
        poWrapNew=new Map<String,OptionsWrapper>();
        poWrapSelected=new Map<String,OptionsWrapper>();
        optionCounterSelected=new Map<String,Integer>();

        Map<ID,SBQQ__ProductFeature__c> featureMap=new Map<ID,SBQQ__ProductFeature__c>();

        for(SBQQ__ProductFeature__c  feat:[Select id, Name, Replacement_Name__c from SBQQ__ProductFeature__c where SBQQ__ConfiguredSKU__c=:bundleId Order by SBQQ__Number__c ]){
            featureMap.put(feat.id,feat);
        }
		
        //Create maps of product:option, option:feature using set of Feature IDs from Feature Map
        createOptionProductMap(featureMap.keySet());

        for(String s:featureMap.keySet()){
            SBQQ__ProductFeature__c pFeat=featureMap.get(s);
            Map<String,OptionsWrapper> poWrapSelected_f=new Map<String,OptionsWrapper>();
            Map<String,OptionsWrapper> poWrapSelectedCodex_f=new Map<String,OptionsWrapper>();
            Map<String,OptionsWrapper> poWrapNew_f=new Map<String,OptionsWrapper>();
            List<OptionsWrapper> fullList=new List<OptionsWrapper>();

            List<JSON2Apex.Options> options=new List<JSON2Apex.Options>();

            if(pFeat.Replacement_Name__c=='Feature_1'){
                options=myConfig.product.OptionConfigurations.Feature_1;
            }

            if(pFeat.Replacement_Name__c=='Feature_2'){
                options=myConfig.product.OptionConfigurations.Feature_2;
            }

            if(pFeat.Replacement_Name__c=='Feature_3'){
                options=myConfig.product.OptionConfigurations.Feature_3;
            }

            if(pFeat.Replacement_Name__c=='Feature_4'){
                options=myConfig.product.OptionConfigurations.Feature_4;
            }

            if(pFeat.Replacement_Name__c=='Feature_5'){
                options=myConfig.product.OptionConfigurations.Feature_5;
            }

            
                for(JSON2Apex.Options opt:options ){

                    if(opt.selected==true && opt.readOnly==null){ //Check if Selected, If True then add quantities to poCounter for that option
                            if(poWrapSelected_f.containsKey(opt.optionId)){
                                OptionsWrapper oWrap=poWrapSelected_f.get(opt.optionId);
                                oWrap.qty=oWrap.qty+1;
                                poWrapSelected_f.put(opt.optionId,oWrap);
                                optionCounterSelected.put(opt.optionId,optionCounterSelected.get(opt.optionId) + 1);
                            }else{
                                poWrapSelected_f.put(opt.optionId, new OptionsWrapper(opt.productCode, opt.productName, opt.optionId, 1, true));
                                optionCounterSelected.put(opt.optionId,1);
                            }

                          
                    }else if (opt.selected==true && opt.readOnly!=null){
                        if(opt.readOnly.line!=null){

                                if(poWrapSelected_f.containsKey(opt.optionId)){
                                    OptionsWrapper oWrap=poWrapSelected_f.get(opt.optionId);
                                    oWrap.qty=oWrap.qty+1;
                                    poWrapSelected_f.put(opt.optionId,oWrap);
                                    optionCounterSelected.put(opt.optionId,optionCounterSelected.get(opt.optionId) + 1);
                                }else{
                                    poWrapSelected_f.put(opt.optionId, new OptionsWrapper(opt.productCode, opt.productName, opt.optionId, 1, true));
                                    optionCounterSelected.put(opt.optionId,1);
                                }
                        }else{
                                if(poWrapSelected_f.containsKey(opt.optionId)){
                                    OptionsWrapper oWrap=poWrapSelected_f.get(opt.optionId);
                                    oWrap.qty=oWrap.qty+1;
                                    poWrapSelected_f.put(opt.optionId,oWrap);
                                    optionCounterSelected.put(opt.optionId,optionCounterSelected.get(opt.optionId) + 1);
                                }else{
                                    poWrapSelected_f.put(opt.optionId, new OptionsWrapper(opt.productCode, opt.productName, opt.optionId, 1,true));
                                    optionCounterSelected.put(opt.optionId,1);
                                }
                        }
                        
                    }else{//Not Selected
                        //Auto Add it to the Option Wrapper Class
                        poWrapNew_f.put(opt.optionId, new OptionsWrapper(opt.productCode, opt.productName, opt.optionId, 0, false));
                    }
                    
                }
            fullList.addAll(poWrapNew_f.values());
            	system.debug('fullList: ' +fullList);
            fullList.addAll(poWrapSelected_f.values());
                system.debug('fullList: ' +fullList);
            fullList.addAll(poWrapSelectedCodex_f.values());
            	system.debug('fullList: ' +fullList);
            features.add(new FeatureWrapper(pFeat, fullList));
				poWrapSelectedCodex_f.putAll(poWrapSelectedCodex_f);
            poWrapNew.putAll(poWrapNew_f);
            poWrapSelected.putAll(poWrapSelected_f);
            //Add to Master Maps

            //features.add(new FeatureWrapper(pFeat, poWrapSelected.values()));
        }

        system.debug(poWrapSelected);
        //Query Product Options
        Map<ID,List<SBQQ__ProductOption__c>> optionsMap=new Map<ID,List<SBQQ__ProductOption__c>>();

        for(SBQQ__ProductOption__c opt:[Select id,SBQQ__OptionalSKU__c, SBQQ__Number__c,SBQQ__ProductCode__c,SBQQ__ConfiguredSKU__c, SBQQ__ProductName__c,SBQQ__Feature__c from SBQQ__ProductOption__c where SBQQ__Feature__c IN:featureMap.keySet() Order by SBQQ__Number__c]){
            List<SBQQ__ProductOption__c> optionsTemp=new List<SBQQ__ProductOption__c>();
            if(optionsMap.containsKey(opt.SBQQ__Feature__c)){
                    optionsTemp=optionsMap.get(opt.SBQQ__Feature__c);
                    optionsTemp.add(opt);
                    optionsMap.put(opt.SBQQ__Feature__c, optionsTemp);
                }else{
                    optionsTemp.add(opt);
                    optionsMap.put(opt.SBQQ__Feature__c, optionsTemp);
                }
        }

        system.debug('Feature Map: ' +featureMap);
        system.debug('Options Map: ' +optionsMap);
        
        //Create Feature/Option Wrapper
        for(String featid: featureMap.keySet() ){
            List<OptionsWrapper> myOptions=new List<OptionsWrapper>();
            if(optionsMap.containsKey(featid)){
               for(SBQQ__ProductOption__c opt: optionsMap.get(featid)){
                    //myOptions.add(new OptionsWrapper(opt, false));
                } 
            }
            
            features.add(new FeatureWrapper(featureMap.get(featid), myOptions));
        }

    }
    //Search filters entry
    public PageReference searchCodex(){
       
        //codexRecords=tempCodexList;
        return null;
    }

       
    //Method to get fieldset members based on field set name and object name
    public static List<Schema.FieldSetMember> readFieldSet(String fieldSetName, String objectName){
        Map <String, Schema.SObjectType> globalDescribeMap = Schema.getGlobalDescribe(); 
        Schema.SObjectType SObjectTypeObj = globalDescribeMap.get(objectName);
        Schema.DescribeSObjectResult describeSObjectResultObj = SObjectTypeObj.getDescribe();

            system.debug('====>' + DescribeSObjectResultObj.FieldSets.getMap().get(fieldSetName));

        Schema.FieldSet fieldSetObj = DescribeSObjectResultObj.FieldSets.getMap().get(fieldSetName);

        List<Schema.FieldSetMember> fieldSetMemberList =  fieldSetObj.getFields();
            system.debug('fieldSetMemberList ====>' + fieldSetMemberList);  
            return fieldSetObj.getFields(); 
    } 

    //Method to return SELECT query string based on list of field api names
    public String getListToString(List<String> fieldList){
        String queryString ='';
        Boolean check = false;
        for(String s:fieldList) {
            if (check) queryString += ', ';
                queryString += s;
                    check=true;
        }
        return queryString;
    }

    //Method to return WHERE clause for query string given Field Name, Operator and Filter Value
    public String getWhereClause(String fieldName, String operator, String filterValue){
        string whereClauseStr ='WHERE '+ fieldName +' '+ operatorSwitch(operator)+filterValue+ '\'';
            system.debug('WHERE clause string is: '+ '"' + whereClauseStr);
        return whereClauseStr;

    }
   
    //Method to return full query string given parameters
    public String getFullQuery(String fieldString, String objName, String whereClause){
        String fullQueryString = 'SELECT '+fieldString+ ' FROM '+ objName + ' '+ whereClause;
        return fullQueryString;
    } 

    //Switch translate operator
    public static String operatorSwitch(String operator){
        Map <String, String> opMap = new Map <String, String>();
            opMap.put('equals', '=\'');
            opMap.put('not equals', '!=\'');
            opMap.put('less than', '<');
            opMap.put('greater than', '>');
            opMap.put('greater or equals', '>=');
            opMap.put('starts with', 'LIKE');
            opMap.put('ends with', 'LIKE');
            opMap.put('contains', 'LIKE');

        String transOperator = opMap.get(operator);
            system.debug('Translated operator is: ' + transOperator);

        return transOperator;
    }

    //Method to get list of Optional Product Ids given Product Bundle ID
    public List<ID> getOptionsModel(string prodId){
        List<ID> optionProductIdList = new List<ID>();
        List<SBQQ__ProductOption__c> optionsModelList = [SELECT SBQQ__OptionalSKU__c FROM SBQQ__ProductOption__c WHERE SBQQ__ConfiguredSKU__c=:prodId];
            for(SBQQ__ProductOption__c o:optionsModelList){
                optionProductIdList.add(o.SBQQ__OptionalSKU__c);
            }
            system.debug('Valid options include: '+optionProductIdList);
      return optionProductIdList;
    }

    //Wrapper for initial Codex records before selection
    public class CodexWrapper{
        public List<Codex__c> codexRecords{get;set;}
        public Codex__c codex{get;set;}
        public Boolean selected {get; set;}
        public string codexName {get;set;}
        public string codexProduct {get;set;}
        public string countryCode {get;set;}
        public string jurisdiction {get;set;}
        public string returnCode {get;set;}
        public Boolean isDisabled {get; set;}
        public CodexWrapper(Codex__c c){
            this.codex = c;
            this.selected = false;
            this.codexName = c.Name;
            this.codexProduct = c.Product__c;
            this.countryCode = c.CountryCode__c;
            this.jurisdiction = c.Jurisdiction__c;
            this.returnCode = c.Return_Code__c;
            this.isDisabled = false;
        }
    }

    //Wrapper for initial Connectors before selection
    public class ConnectorsWrapper{
        public List<Connector__c> connectorRecords {get;set;}
        public Connector__c connector {get;set;}
        public Boolean selected {get;set;}
        public string connectorName {get;set;}
        public string defaultImp {get;set;}
        public string connectorProduct {get;set;}
        public string conProductName {get;set;}
        
        public ConnectorsWrapper(Connector__c cons){
            connector = cons;
            this.selected = false;
            this.connectorName = cons.Name;
            this.defaultImp = cons.Default_Self_Serve__c;
            this.connectorProduct = cons.Product__c;
            this.conProductName=cons.ProductName__c;

        }
    }
    
    //Wrapper for selected Codex records
    public class SelectedCodexWrapper{
        public CodexWrapper selectedCodex{get;set;}
        public Codex__c codex{get;set;}
        public Boolean isSelected{get;set;}
        public string codexName{get;set;}
        public string codexProduct{get;set;}
        public string countryCode{get;set;}
        public string jurisdiction{get;set;}
        public string returnCode{get;set;}
        public string codexId{get;set;}

        public SelectedCodexWrapper(CodexWrapper cod){
            this.selectedCodex = cod;
            this.isSelected = false;
            this.codex = cod.codex;
            this.codexProduct = cod.codexProduct;
            this.countryCode = cod.countryCode;
            this.jurisdiction = cod.jurisdiction;
            this.returnCode = cod.returnCode;
            this.codexId = cod.codex.id;
        }
    }
 
    //Wrapper for selected Connectors
    public class SelectedConsWrapper{
        public ConnectorsWrapper selectedCon {get;set;}
        public Connector__c connector{get;set;}
        public Boolean isSelected {get;set;}
        public String conName{get;set;}
        public String conProduct{get;set;}
        public String conProductName{get;set;}
        public string defaultImp {get;set;}

        public SelectedConsWrapper(ConnectorsWrapper selCon){
            selectedCon=selCon;
            connector=selCon.connector;
            this.isSelected=false;
            this.conName=selCon.connectorName;
            this.conProduct=selCon.connectorProduct;
            this.conProductName=selCon.conProductName;
            this.defaultImp=selCon.defaultImp;
        }
    }
    //Wrapper for External Object Records
    public class ExtConfigWrapper{
        public string objId {get;set;}
        public string recordName {get;set;}

        //public string objName {get;set;}
        public ExtConfigWrapper(string oId){
           this.objId = oId;
           //this.objName = oId.Name;
        }
    }


    public class ConfigurationWrapper{
        public List<FeatureWrapper> features{get;set;}
    }

    public class FeatureWrapper{
        public SBQQ__ProductFeature__c feat{get;set;}
        public List<OptionsWrapper> options{get;set;}

        public FeatureWrapper(SBQQ__ProductFeature__c feature, List<OptionsWrapper> myOptions){
            feat=feature;
            options=myOptions;
        }
    }


    public class codOptionsWrapper{
        public String productCode{get;set;}
        public String productName{get;set;}
        public SBQQ__ProductOption__c productOption{get;set;}
        public Boolean isSelected{get;set;}
        public Integer qty{get;set;}
        public Id codexId{get;set;}
        public String optionId{get;set;}
        public String retLabel{get;set;}
        public Codex__c codex{get;set;}
        
        public codOptionsWrapper(SBQQ__ProductOption__c option, Id cod, String pCode, String pName, Codex__c codex){
           productOption=option;
           codex=codex;
           qty=1;
           isSelected=true;
           productName=pName;
           productCode=pCode;
           codexId=cod;
           this.optionId=option.Id;
           this.retLabel=codex.Return_Code__c;
           }
        }
    
    public class OptionsWrapper{
        public String productCode{get;set;}
        public String productName{get;set;}
        public String productOptionId{get;set;}
        public Boolean qtyEditable{get;set;}
        public Boolean isSelected{get;set;}
        public Integer topIndex{get;set;}
        public Integer qty{get;set;}
        public OptionsWrapper( String pCode, String pName, String pOptionId, Integer qty, Boolean selected){
           productCode=pCode;
           productName=pName;
           productOptionId=pOptionId;
           this.qty=qty;
           isSelected=selected;
           qtyEditable=true;
        }
    }
    
    public class conOptionsWrapper{
        public String productCode {get;set;}
        public String productName {get;set;}
        public SBQQ__ProductOption__c productOption {get;set;}
        public Boolean isSelected {get;set;}
        public Integer qty {get;set;}
        public String connectorId {get;set;}
        public String optionId {get;set;}
        public Connector__c connector {get;set;}
        public String connectorName {get;set;}
        
        
        public conOptionsWrapper(SBQQ__ProductOption__c option, String conId, String pCode, String pName, Connector__c con){
           productOption=option;
           qty=1;
           isSelected=true;
           productName=pName;
           productCode=pCode;
           connectorId=conId;
           this.optionId=option.Id;
           connector=con;
           this.connectorName=con.Name;
                      
           }
        }

}