/**
 * qtcExternalConfigurator.cls
 * @Controller for external configurator in Salesforce CPQ 
 *
**/
public with sharing class qtcExternalConfigurator2{

    	//General properties
        public String jsonInput {get;set;}
        public String bundleId {get;set;}
        public String accountId {get;set;}
 		private Map<String, Object> jsonResults;
    	public List<Object> returnOptions {get;set;}
 		public String debugOutput {get;set;}
        private Integer selectedOptionCount;
		
        public Integer selectedQty {get;set;}
        public Boolean submitJSON {get;set;}
        public String quoteName {get;set;}
        public Map<String, SBQQ__ProductFeature__c> featuresList {get;set;}
      	public Map <String, List<SBQQ__ProductFeature__c>> mapFeatureObject {get;set;}
        public Map <String, String> mapObjectFilters {get;set;}
        public Map<ID, ID> prodToOptionMap {get;set;}
    	
    	//Reconfiguration properties
    	public Map<String, Object> productObjsMap {get;set;}
    	public Set<String> existingCodex {get;set;}

    	//Codex properties
    	public String codexQueryStr {get;set;}
        public List<CodexWrapper> codexRecords; //{get;set;}
       	public List<SelectedCodexWrapper> selectedCodex {
       		get { system.debug('gettingselectedCodex, selectedCodex:'+selectedCodex); 
                  if(selectedCodex==null)
                  	selectedCodex= new List<SelectedCodexWrapper>();
             	return selectedCodex; 
            } 
            set;
        }
        private Set<Id> setSelectedCodexes;
        private Set<Id> setAddedOptions;
        public List<codOptionsWrapper> codOptionsNew {get;set;}
        public Integer codexRecordCount {get; set;}
        public Integer codPageNumber {get;set;}
        public Integer codPageSize {get;set;}
        public Map<String, String> prodToCMap {get;set;}
    	public Map<String, String> cToPMap {get;set;}
        public Boolean showCodex {get;set;}
    	public List<SelectedCodexWrapper> lstWrapper {get;set;}
    	public List<SelectedCodexWrapper> lstSetController {get;set;}
        
 
    
    	//CustomIterable obj;
		
    	//Connector properties
    	public String connectorQueryStr {get;set;}
        public List<ConnectorsWrapper> connectorRecords {get;set;}
        public List<SelectedConsWrapper> selectedCons {
    		get { system.debug('gettingselectedCons, selectedCons:'+selectedCons); 
                  if(selectedCons==null)
                  	selectedCons= new List<SelectedConsWrapper>();
             	return selectedCons; 
            } 
            set;
		}
        public List<conOptionsWrapper> conOptionsNew {get;set;}
        public Integer connectorRecordCount {get; set;}
        public Integer conPageNumber {get;set;}
        public Integer conPageSize {get;set;}
        public Map<String, String> prodToConMap {get;set;}
    	public Map<String, String> conToPMap {get;set;}
    	public Boolean showConnector {get;set;}
        public Set<String> existingConnectors {get;set;}
		public List<Object> connectorOptions {get;set;}
    	public Integer codCount {get;set;}
    	public Integer conCount {get;set;}

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
    	       
    
    
//Constructor    
public QtcExternalConfigurator2(){
    showCodex=false;
    submitJSON=false;    
    setSelectedCodexes = new Set<Id>();
    selectedOptionCount=0;
    codCount=0;
    conCount=0;
   	getCodexRecords();
    getConnectorRecords();
    selectedCodex = new List<SelectedCodexWrapper>();
    selectedCons = new List<SelectedConsWrapper>();
    setAddedOptions=new Set<Id>();
 	productObjsMap = new Map<String, Object>(); 
    returnOptions = new List<Object>();
    jsonResults = new Map<String, Object>();
}

public PageReference jsonProcess(){

        System.debug('JSON input: ' + json.serializepretty(jsonInput));     
                
    	//call method to get existing configuration Ids    
    	getReconfigIds(jsonInput);
        system.debug('jsonInput: '+jsonInput);
        
       
        //Display connectors or codex
        List<SBQQ__ProductFeature__c> codFeats = [SELECT ID FROM SBQQ__ProductFeature__c WHERE External_Config_Object__c='Codex__c' and SBQQ__ConfiguredSKU__c=:bundleId];
        List<SBQQ__ProductFeature__c> conFeats = [SELECT ID FROM SBQQ__ProductFeature__c WHERE External_Config_Object__c='Connector__c' and SBQQ__ConfiguredSKU__c=:bundleId];
              	showCodex = codFeats.size()>0 ? true : false;	
    			showConnector = conFeats.size()>0 ? true : false;

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
    
    //Get Connector Records for initial page
	public List<ConnectorsWrapper> getConnectorRecords(){
    	connectorRecords = new List<ConnectorsWrapper>();
                for(Connector__c c : [SELECT Id, Name, Default_Self_Serve__c, Product__c, ProductName__c FROM Connector__c WHERE ProductLine__c ='Excise']) {
                    ConnectorsWrapper cw=new ConnectorsWrapper(c);
                    cw.selected = setSelectedCodexes.contains(c.Id);
					connectorRecords.add(cw);
                }
        system.debug('Initial connector records ====> '+connectorRecords);
        return connectorRecords;
    }
    
    //Get existing Selections from Configuration
    public void getReconfigIds(String jsonInput){
        
        //Deserialize Untyped JSON
        jsonResults = (Map<String, Object>)JSON.deserializeUntyped(jsonInput);
        	//system.debug('json untyped ---> ' +jsonResults.get('product'));
            system.debug('untyped keys: '+jsonResults.keyset()); 
        Map<String,Object> quote = (Map<String,Object>)jsonResults.get('quote');
        accountId=(Id)quote.get('SBQQ__Account__c');
        quoteName=(string)quote.get('Name');
         system.debug('bundleid: '+bundleId+' quote name: '+quoteName);
      
        //Set Redirect Values
        Map<String, Object> redirectMap = (Map<String, Object>)jsonResults.get('redirect');
        	redirectMap.put('auto','false');
        	redirectMap.put('save','true');
        
        existingCodex = new Set<String>();
        existingConnectors = new Set<String>();
                   
        //Start at product level
        productObjsMap = (Map<String, Object>)jsonResults.get('product');
        	//system.debug('product objs: '+productObjsMap);
        bundleId = (Id)productObjsMap.get('configuredProductId');       
        system.debug('bundleid: '+bundleId+' quote name: '+quoteName);
 
        //Get option configurations (features)
        Map<String, Object> optionConfigMap = (Map<String, Object>)productObjsMap.get('optionConfigurations');
        	system.debug('option configs===> '+optionConfigMap.keyset());
        	
        	//Get Options for Returns  
        	if(optionConfigMap.containskey('By Return')){
                system.debug('===>GETTING EXISTING RETURNS LINES.........');
        		returnOptions = (List<Object>)optionConfigMap.get('By Return');
        			for (Object option: returnOptions){
            			Map<String, Object> existingOptions = (Map<String, Object>)option;
                			system.debug('Existing Options List========> '+existingOptions);
                    	if((Boolean)existingOptions.get('selected')) {
                        selectedOptionCount++;
                    }
        			//Get Read Only    
                	for(Object readOnly : existingOptions.keyset()){
                  	  if(readOnly =='readOnly'){
                    	    Map<String, Object> readOnlyObjs = (Map<String, Object>)existingOptions.get('readOnly');
                        	   //system.debug('readOnly==> '+readOnlyObjs);
                     	//Get Line level
                     	for(Object line : readOnlyObjs.keyset()){
                        	 if(line == 'line'){
                            	Map<String, Object> lines = (Map<String, Object>)readOnlyObjs.get('line');
                               		//system.debug('line==> '+lines);
                             	for(Object attribute : lines.keyset()){
                             	    if(attribute == 'Return_Code__c'){
                                	    String codexId = String.valueOf(lines.get('Return_Code__c'));
                                    	existingCodex.add(codexID);
                                     		//system.debug('adding codex: '+codexId);
                                     }
                                 	if(attribute == 'Connector__c'){
                                     	String connector = String.valueOf(lines.get('Connector__c'));
                                     existingConnectors.add(connector);
                                     	//system.debug('adding connector: '+connector);
                                 	}
                             	}
                     	  	}	
                     	}
                  	}
               	}	                           
           	  }   
        	}
        //get existing Connector options
        if(optionConfigMap.containskey('Connectors')){
            	system.debug('===>GETTING EXISTING CONNECTORS LINES.........');
        	connectorOptions = (List<Object>)optionConfigMap.get('Connectors');
        		for (Object option: connectorOptions){
            		Map<String, Object> existingOptions = (Map<String, Object>)option;
                		system.debug('Existing Options List========> '+existingOptions);
                    if((Boolean)existingOptions.get('selected')) {
                        selectedOptionCount++;
                    }
        		//Get Read Only    
                for(Object readOnly : existingOptions.keyset()){
                    if(readOnly =='readOnly'){
                        Map<String, Object> readOnlyObjs = (Map<String, Object>)existingOptions.get('readOnly');
                           //system.debug('readOnly==> '+readOnlyObjs);
                     //Get Line level
                     for(Object line : readOnlyObjs.keyset()){
                         if(line == 'line'){
                            Map<String, Object> lines = (Map<String, Object>)readOnlyObjs.get('line');
                               //system.debug('line==> '+lines);
                             for(Object attribute : lines.keyset()){
                                 if(attribute == 'Connector__c'){
                                     String connector = String.valueOf(lines.get('Connector__c'));
                                     existingConnectors.add(connector);
                                     	//system.debug('adding connector: '+connector);
                                 }
                             }
                     	  }
                     }
                  }
               }                           
            }   
        }
        	system.debug('Codex list==> '+existingCodex);   
        	codCount = existingCodex.size();
        	system.debug('Connector list==> '+existingConnectors); 
        	conCount = existingCodex.size();
        	system.debug('conCount= '+conCount);

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
        	List<Connector__c> existingConObjs = [SELECT ID, Name, Product__c, ProductName__c, Default_Self_Serve__c FROM Connector__c WHERE ID in:existingConnectors];
        	List<ConnectorsWrapper> existingConWraps = new List<ConnectorsWrapper>();
       			for(Connector__c con : existingConObjs){
                    ConnectorsWrapper cw = new ConnectorsWrapper(con);
                    	existingConWraps.add(cw);
        		}
        		system.debug('Existing con wraps==> '+existingConWraps);
        		
        			for(ConnectorsWrapper c : existingConWraps){
            			SelectedConsWrapper scw = new SelectedConsWrapper(c);
                    		selectedCons.add(scw);
                    		setSelectedCodexes.add(scw.connector.Id);
        			}
        			system.debug('SelectedConnectors ==> '+selectedCons);
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
          if(codexRecords == null)
              return null;
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
        //call method to show upper selected records pane
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
        //call method to show upper selected records pane
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
	            cToPMap.put(c.codex.Id, c.codexProduct);
                setAddedOptions.add(c.codex.Id);
            }
            system.debug('Selected codex to product map includes: '+ cToPMap.size());
        return cToPMap;
    }
    
    //Create a map of Connector to Product records from Selected CodexWrapper 
    public Map<String, String> getConProdMap (List<SelectedConsWrapper> conWraps){
        Map<String, String> cToPMap = new Map<String, String>();
            for(SelectedConsWrapper c:conWraps){
                cToPMap.put(c.connector.Id, c.conProduct);
                setAddedOptions.add(c.connector.Id);
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
    
    //Method to remove selected Connectors from Selected Wrapper
    public void removeConns(){
        List<SelectedConsWrapper> newSelectedCons = new List<SelectedConsWrapper>();
        Set<String> consToRemove = new Set<String>();
        for(SelectedConsWrapper scw:selectedCons) {
            if(!scw.isSelected) {
                newSelectedCons.add(scw);
            } else {
                setSelectedCodexes.remove(scw.connector.Id);
                consToRemove.add(scw.connector.Id);
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
        }
        removeCodexes(codexToRemove);
        selectedCodex = selectedCodexes;
     
    }

    private string getCodexId(Object option) {
        string codexId='';
        Map<String, Object> optionFieldMap = (Map<String, Object>)option;
        Map<String,Object> configData = (Map<String,Object>)optionFieldMap.get('configurationData');
        if(configData.containsKey('Return_Code__c'))
            codexId=(string)configData.get('Return_Code__c');
        else if(optionFieldMap.containsKey('readOnly')) {
           Map<String,Object> readOnlyMap = (Map<String,Object>)optionFieldMap.get('readOnly');
            if(readOnlyMap.containsKey('line')) {
                Map<String,Object> lineMap = (Map<String,Object>)readOnlyMap.get('line');
                if(lineMap.containsKey('Return_Code__c')) {
                    codexId = (string)lineMap.get('Return_Code__c');
                }
            }           
        }
        return codexId;
    }
    
    private string getConnectorId(Object option) {
        string connectorId='';
        Map<String, Object> optionFieldMap = (Map<String, Object>)option;
        Map<String,Object> configData = (Map<String,Object>)optionFieldMap.get('configurationData');
        if(configData.containsKey('Connector__c'))
            connectorId=(string)configData.get('Connector__c');
        else if(optionFieldMap.containsKey('readOnly')) {
           Map<String,Object> readOnlyMap = (Map<String,Object>)optionFieldMap.get('readOnly');
            if(readOnlyMap.containsKey('line')) {
                Map<String,Object> lineMap = (Map<String,Object>)readOnlyMap.get('line');
                if(lineMap.containsKey('Connector__c')) {
                    connectorId = (string)lineMap.get('Connector__c');
                }
            }           
        }
        return connectorId;
    }
    
    private void updateCodexOptions(List<Object> options) {
        Map<String,Object> productObjsMap = (Map<String, Object>)jsonResults.get('product');
 		
        //Get option configurations (features)
        Map<String, Object> optionConfigMap = (Map<String, Object>)productObjsMap.get('optionConfigurations');
        optionConfigMap.put('By Return',options); 
        productObjsMap.put('optionConfigurations',optionConfigMap);
        jsonResults.put('product',productObjsMap);
        system.debug('new options:'+JSON.serialize(options));
    }
    
     private void updateConOptions(List<Object> options) {
        Map<String,Object> productObjsMap = (Map<String, Object>)jsonResults.get('product');
 		
        //Get option configurations (features)
        Map<String, Object> optionConfigMap = (Map<String, Object>)productObjsMap.get('optionConfigurations');
        optionConfigMap.put('Connectors',options); 
        productObjsMap.put('optionConfigurations',optionConfigMap);
        jsonResults.put('product',productObjsMap);
        system.debug('new options:'+JSON.serialize(options));
    }
    
    private void removeCodexes(Set<String> codexToRemove) {
        List<Object> newOptions = new List<Object>();    
        Integer index=0;
        for(Object option:returnOptions) {
            string codexId = getCodexId(option);
            system.debug('===> checking codex:'+codexId+' index: '+index);
            Map<String,Object> optionMap = (Map<String,Object>)option;                   
            if(!String.isBlank(codexId)) {
                if(codexToRemove.contains(codexId)) {
                    if(((Map<String,Object>)optionMap.get('configurationData')).size() > 0) {
                       continue;
                    }
                    else {
                       system.debug('removing codex:'+codexId);
                       optionMap.put('selected',false);
                   }
                }
                optionMap.put('index',index);
                ++index;
	            newOptions.add(option);
	          
            }
        } 
        returnOptions = newOptions;
//        updateCodexOptions(newOptions);
        String jtest=JSON.serialize(jsonResults);
 		debugOutput=jtest;
        system.debug('====>JSON TO CPQ===> '+ jtest);

        jsonInput=jtest;
        submitJSON=true;
    }
    
    private void removeConnectors(Set<String> consToRemove) {
        List<Object> newOptions = new List<Object>();    
        Integer index=0;
        for(Object option:returnOptions) {
            string connectorId = getConnectorId(option);
            system.debug('===> checking connector:'+connectorId+' index: '+index);
            Map<String,Object> optionMap = (Map<String,Object>)option;                   
            if(!String.isBlank(connectorId)) {
                if(consToRemove.contains(connectorId)) {
                    if(((Map<String,Object>)optionMap.get('configurationData')).size() > 0) {
                       continue;
                    }
                    else {
                       system.debug('removing connector:'+connectorId);
                       optionMap.put('selected',false);
                   }
                }
                optionMap.put('index',index);
                ++index;
	            newOptions.add(option);
	          
            }
        } 
        returnOptions = newOptions;
//        updateCodexOptions(newOptions);
        String jtest=JSON.serialize(jsonResults);
 		debugOutput=jtest;
        system.debug('====>JSON TO CPQ===> '+ jtest);

        jsonInput=jtest;
        submitJSON=true;
    }
  
    //Convert Selections to Option configuration and update JSON
    public PageReference updateSelections(){
      
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
                system.debug('New cod option wraps:'+ codOptionsNew);
    
              //add codex options to configuration
              Set<String> selCodexes = new Set<String>();                                
                Integer i=0;    
                for(codOptionsWrapper o: codOptionsNew){
                    if(o.qty>0 && o.isSelected && !selCodexes.contains(o.codexId)){
                        string oId = o.optionId;
                        integer optCount=codexOptionCounter.get(oId);
                                Map<String, Object> newOption = new Map<String,Object>();
                        newOption.put('optionId',o.optionId);
                        newOption.put('selected',true);
                        newOption.put('ProductCode',o.productCode);
                        newOption.put('ProductName',o.productName);
                        newOption.put('index',selectedOptionCount++);
                        newOption.put('Quantity',1);
                        Map<String,Object> configData = new Map<String,Object>();
                        configData.put('Return_Code__c',o.codexId);
                        configData.put('Return_Code_Label__c',o.retLabel);
                        newOption.put('configurationData',configData);
                        newOption.put('readOnly',new Map<String,Object>());
                        returnOptions.add(newOption);   
                          system.debug('Adding new option: '+newOption);
                     }
                }
        }
        
        //Add selected connectors 
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
                List<Connector__c> connectorList = [Select ID, Name FROM Connector__c WHERE ID in:conOptionMap.keyset()];
                	for(Connector__c con : connectorList){
                        SBQQ__ProductOption__c opt = conOptionMap.get(con.Id);
                        String pCode = opt.SBQQ__ProductCode__c;
                        String pName = opt.SBQQ__ProductName__c;
                    conOptionsNew.add(new conOptionsWrapper(opt, con.Id, pCode, pName, con));
                }      
                system.debug('New con options:'+ conOptionsNew);
    
            //add connector options to configuration
             Set<String> selCons = new Set<String>();                                
                Integer i=0;    
                for(conOptionsWrapper o: conOptionsNew){
                    if(o.qty>0 && o.isSelected && !selCons.contains(o.connectorId)){
                        string oId = o.optionId;
                        integer optCount=conOptionCounter.get(oId);
                                Map<String, Object> newOption = new Map<String,Object>();
                        newOption.put('optionId',o.optionId);
                        newOption.put('selected',true);
                        newOption.put('ProductCode',o.productCode);
                        newOption.put('ProductName',o.productName);
                        newOption.put('index',selectedOptionCount++);
                        newOption.put('Quantity',1);
                        Map<String,Object> configData = new Map<String,Object>();
                        configData.put('Connector__c',o.connectorId);
                        newOption.put('configurationData',configData);
                        newOption.put('readOnly',new Map<String,Object>());
                        connectorOptions.add(newOption);   
                          system.debug('Adding new option: '+newOption);
                     }
                }
        	}
        
        //serialize json for broadcast back to cpq    
        jsonInput=JSON.serialize(jsonResults);
        submitJSON=true;
        return null;
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

   /* public class FeatureWrapper{
        public SBQQ__ProductFeature__c feat{get;set;}
        public List<OptionsWrapper> options{get;set;}

        public FeatureWrapper(SBQQ__ProductFeature__c feature, List<OptionsWrapper> myOptions){
            feat=feature;
            options=myOptions;
        }
    }*/


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