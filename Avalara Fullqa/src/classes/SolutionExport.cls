global class SolutionExport implements Database.Batchable<sObject>, Database.AllowsCallouts{
    
	/************************************************************************/
    /*********************** Variables and Constructor **********************/
	/************************************************************************/    
    
    // Declare SolutionExport Variables
    public String articleBody {get; set;}
    public String editTime {get; set;}
    public DateTime initialTime {get; set;}
    public Static String migratorNotes {get; set;}
    public Static String migrationStatus {get; set;}
    public Static DateTime migrationTime {get; set;}
    public Static String mtURL {get; set;}
    public Solution sol;

    // Default Constructor
    public SolutionExport(){}   
    
	/************************************************************************/
    /****************************** Batch Apex ******************************/
	/************************************************************************/
    
	// Start Batch
    global Database.QueryLocator start(Database.BatchableContext BC){
        RecordType solutionRecordType = [select Id, Name from RecordType where Name='KB Partner' limit 1];
        String query = (	
        	'SELECT ' +
                'Id,' + 
                'SolutionName,' +
                'Connector_Name__c,' +
                'Connector_Version__c,' +
                'Configuration_Screen__c,' +
                'Company_Code__c,' +
                'Mapping__c,' +
                'Exemptions__c,' +
                'Entity_Use_Codes__c,' +
                'Customer_Support_Info__c,' +
                'User_Guide_Documentation__c,' +
                'Implementation_Instructions__c,' +
                'Account__c,' +
                'Account__r.Name,' +
                'Account__r.Description,' +
                'Account__r.Global__c,' +
                'Account__r.CertCaptureCustomer__c,' +
                'Status,' +
                'Connector_Type__c,' +
                'SDK_Platform__c,' +
                'Transaction_Signature__c,' +
                'Customer_Maint_Process_Utility__c,' +
                'Address_Validation_Batch_Utlity__c,' +
                'Filter_Tax_Calc_by_State__c,' +
                'Warehouse_Ship_to_by_Line__c,' +
                'Committing_Transactions__c,' +
                'Known_Issues__c,' +
                'Internal_Contact__c,' +
                'Internal_Contact__r.Name,' +
                'Installation_Contact__c,' +
                'Installation_Contact__r.Name,' +
                'Escalation_Contact__c,' +    	
                'Escalation_Contact__r.Name,' +
            	'RecordTypeId ' +
            'FROM ' +
                'Solution ' +
            'WHERE ' +
                'RecordTypeID = ' +  '\'' + solutionRecordType.Id + '\''
        );
        return Database.getQueryLocator(query);
    }
   
    // Execute Batch
    global void execute(Database.BatchableContext BC, List<Solution> scope){
        // For each solution in the scope, 
        // Set the article body and post the article
        for(Solution s : scope){
			this.sol = s;
			setArticleBody();
            postCurrentArticle(s);

			// Upload the attachments
			List<Attachment> attachmentList = getArticleAttachments(s);
			for(Attachment a : attachmentList){
				// HTTP Put them to Mindtouch
				putAttachmentsOnMindtouch(a,s);
			}
            
            // Write back to Solution
            s.Migration_Status__c = SolutionExport.migrationStatus;
            s.MindTouch_URL__c = SolutionExport.mtURL;
            s.Migration_Start_Time__c = SolutionExport.migrationTime;
            s.Migration_Completion_Time__c = SolutionExport.migrationTime;
            s.Migrator_Notes__c = SolutionExport.migratorNotes;
            update s;            
		}		
    } 
    
    // Finish Batch
    global void finish(Database.BatchableContext BC){
        AsyncApexJob a = 
            [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
             TotalJobItems, CreatedBy.Email
             FROM AsyncApexJob WHERE Id =
             :BC.getJobId()];
        
        // Send an email to the Apex job's submitter 
        //   notifying of job completion. 
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {a.CreatedBy.Email};
            mail.setToAddresses(toAddresses);
        mail.setSubject('Record Clean Up Status: ' + a.Status);
        mail.setPlainTextBody
            ('The batch Apex job processed ' + a.TotalJobItems +
             ' batches with '+ a.NumberOfErrors + ' failures.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });        
    }    
    
	/************************************************************************/
    /*********************** Formatting & HTTP Methods **********************/
	/************************************************************************/	

    // Set editTime
   	//   Required field in Mindtouch
    // 	 Also sets initialTime for SFDC migration detail fields
    public Void setEditTime() {
        this.initialTime = System.now();
    	this.editTime = String.valueOf(initialTime);
        this.editTime = editTime.replace('-','');
        this.editTime = editTime.replace(':','');
        this.editTime = editTime.replace(' ','');
    }
    
	// For the page layout custom button, to pass in the current article Id.
    public Solution querySingleArticle(String solId){
        
        // Retrieve the record type before processing the solution
        RecordType KBPartnerRecordType = [select Id, Name from RecordType where Name='KB Partner' limit 1];
        
        // Use the record type retrieved to filter the Solutions in question
        Solution returnArticle = new Solution();
        returnArticle = [
            SELECT 
                Id, 
                SolutionName,
                Connector_Name__c,
                Connector_Version__c,
                Configuration_Screen__c,
                Company_Code__c,
                Mapping__c,
                Exemptions__c,
                Entity_Use_Codes__c,
                Customer_Support_Info__c,
                User_Guide_Documentation__c,
                Implementation_Instructions__c,
                Account__c,
                Account__r.Name,
                Account__r.Description,
                Account__r.Global__c,
                Account__r.CertCaptureCustomer__c,
                Status,
                Connector_Type__c,
                SDK_Platform__c,
                Transaction_Signature__c,
                Customer_Maint_Process_Utility__c,
                Address_Validation_Batch_Utlity__c,
                Filter_Tax_Calc_by_State__c,
                Warehouse_Ship_to_by_Line__c,
                Committing_Transactions__c,
                Known_Issues__c,
                Internal_Contact__c,
                Internal_Contact__r.Name,
                Installation_Contact__c,
                Installation_Contact__r.Name,
                Escalation_Contact__c,    	
                Escalation_Contact__r.Name,
            	RecordTypeId
            FROM 
                Solution 
            WHERE 
                Id = :solId
            AND
                RecordTypeID = :KBPartnerRecordType.Id

            LIMIT 1
        ];
        
        return returnArticle;
    }	
    
	// A method that sits behind the custom button    
    webservice static void postFromSolution(String solId)
    {
       	SolutionExport currentSolExp = new SolutionExport();
        currentSolExp.sol = currentSolExp.querySingleArticle(solId);
		currentSolExp.setArticleBody();
        currentSolExp.postCurrentArticle(currentSolExp.sol);

        List<Attachment> attachmentList = [
			SELECT 
				Id, 
				Name, 
				Body,
				ParentId
			FROM 
				Attachment 
			WHERE
				ParentId=:currentSolExp.sol.Id
        	Limit 9
        ];

        //List<Attachment> attachmentList = getArticleAttachments(currentSolExp.sol);
        for(Attachment a : attachmentList){
            // HTTP Put them to Mindtouch
            currentSolExp.putAttachmentsOnMindtouch(a,currentSolExp.sol); 
        }
        // Finally, commit back to solution migration fields
        currentSolExp.sol.Migration_Status__c = SolutionExport.migrationStatus;
        currentSolExp.sol.MindTouch_URL__c = SolutionExport.mtURL;
        currentSolExp.sol.Migration_Start_Time__c = SolutionExport.migrationTime;
        currentSolExp.sol.Migration_Completion_Time__c = SolutionExport.migrationTime;
        currentSolExp.sol.Migrator_Notes__c = SolutionExport.migratorNotes;
        update currentSolExp.sol;
    }
    	
	// Takes the created Article, puts an attachment on the Article.
	public HttpResponse putAttachmentsOnMindtouch(Attachment A, Solution S){
		HttpRequest req = new HttpRequest(); 
 
		// Set the endpoint for article migration at Mindtouch side.
		req.setEndpoint('https://help.avalara.com/%40api/deki/pages/=z_Avalara_Internal%252fService_Operations_Work_Area%252fSANDBOX_-_Partner_KB%252f' + EncodingUtil.urlEncode(S.SolutionName.remove('PartnerKB  - '), 'UTF-8') + '/files/=' + EncodingUtil.urlEncode(A.Name, 'UTF-8'));
        // Set the HTTP method
		req.setMethod('PUT');     

        // Specify the required user name and password to access the endpoint     
        List<Mindtouch_Credentials__c> credentials = Mindtouch_Credentials__c.getall().values();
		String username = credentials[0].User_Name__c;
        String password = credentials[0].Password__c; 
		Blob headerValue = Blob.valueOf (username + ':' + password);
		String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
		req.setHeader('Authorization', authorizationHeader);
		
        // Create a new http object to send the request object     
		// A response object is generated as a result of the request    
		req.setBodyAsBlob(A.Body);
		Http http = new Http();
		HTTPResponse res = http.send(req);
        return res;
	}
	
    // Retrieves a list of attachments associated with a Solution
    //   Limited to 9 results, per SFDC web service callout restrictions
	public List<Attachment> getArticleAttachments(Solution S){
		List<Attachment> attachmentList = [
			SELECT 
				Id, 
				Name, 
				Body,
				ParentId
			FROM 
				Attachment 
			WHERE
				ParentId=:S.Id
        	Limit 9
        ];
			
		Return attachmentList;
	}
    	
	// Posts a single article to Mindtouch
    //public Void postCurrentArticle(Solution S){
    public HttpResponse postCurrentArticle(Solution S){
        
	
        // Set the edit time (required field on Mindtouch)
		setEditTime();
        
		// Instantiate a new HttpRequest
        HttpRequest req = new HttpRequest(); 

        // Mindtouch Service Account Personal space for testing:
        //req.setEndpoint('https://help.avalara.com/%40api/deki/pages/=User:ServiceAutomation%252fSFDC%252f' + EncodingUtil.urlEncode(S.SolutionName.remove('PartnerKB - '), 'UTF-8') + '/contents?edittime=' + this.editTime);
        
		// Production Endpoint: https://help.avalara.com/z_Avalara_Internal/Service_Operations_Work_Area/SANDBOX_-_Partner_KB
		req.setEndpoint('https://help.avalara.com/%40api/deki/pages/=z_Avalara_Internal%252fService_Operations_Work_Area%252fSANDBOX_-_Partner_KB%252f' + EncodingUtil.urlEncode(S.SolutionName.remove('PartnerKB  - '), 'UTF-8') + '/contents?edittime=' + this.editTime);
		
        // Set the HTTP method to POST
        req.setMethod('POST');     
        
        // Specify the required user name and password to access the endpoint     
        // As well as the header and header information      
        // (get credentials from custom settings)
        List<Mindtouch_Credentials__c> credentials = Mindtouch_Credentials__c.getall().values();
		String username = credentials[0].User_Name__c;
        String password = credentials[0].Password__c; 
        Blob headerValue = Blob.valueOf (username + ':' + password);
        String authorizationHeader = 'BASIC ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
		
        // Create a new http object to send the request object     
        // A response object is generated as a result of the request    
        req.setBody(this.articleBody);
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug(res.getBody());
        
        // Parse the response to write fields back to the solution.
        // Generate the HTTP response as an XML stream
        XmlStreamReader reader = res.getXmlStreamReader();
        
        // Run XML stream through parser class
        SolutionExport.Response[] responses = parseResponses(reader);
        
        // Set SFDC KB Migration Detail Fields from Mindtouch API response
    /*
        S.Migration_Status__c = responses[0].status;
        S.MindTouch_URL__c = responses[0].mindtouchURL;
        S.Migration_Start_Time__c = this.initialTime;
        S.Migration_Completion_Time__c = this.initialTime;
        S.Migrator_Notes__c = 'Article migrated by script';
	*/
        system.debug('!%! ' + responses[0].status);
        migrationStatus = responses[0].status;
        mtURL = responses[0].mindtouchURL;
        migrationTime = this.initialTime;
        migratorNotes = 'Article migrated by script';
        
        return res;
    }
    
	// Sets the body of the article with fields from the current Solution
	//   Requires sol to be set with the current Solutiion.
    public Void setArticleBody(){
        this.articleBody = (
            // Overview Heading
            '<h2>Connector Overview</h2>' +
			'<p>&nbsp;</p>' +
            
            // Description
            '<p>' +        
            this.sol.Account__r.Description +
            '</p><p>&nbsp;</p>' +
            
            // Standard Information Table
            '<table border="1" cellpadding="1" cellspacing="1" style="width: 100%; table-layout: fixed;"><tbody>' + 
            '<tr><td style="width: 232px;"><p style="text-align: right;">Connector Name</p></td><td style="width: 449px;">' + this.sol.Connector_Name__c + '</td></tr>' +
            '<tr><td style="width: 232px;"><p style="text-align: right;">Connector Version</p></td><td style="width: 449px;">' + this.sol.Connector_Version__c + '</td></tr>' +
            '<tr><td style="width: 232px;"><p style="text-align: right;">Configuration Screen</p></td><td style="width: 449px;">' + 		this.sol.Configuration_Screen__c + '</td></tr>' +
            '<tr><td style="width: 232px;"><p style="text-align: right;">Company Code</p></td><td style="width: 449px;">' + 				this.sol.Company_Code__c + '</td></tr>' +
            '<tr><td style="width: 232px;"><p style="text-align: right;">Mapping</p></td><td style="width: 449px;">' + 						this.sol.Mapping__c + '</td></tr>' +
            '<tr><td style="width: 232px;"><p style="text-align: right;">Exemptions</p></td><td style="width: 449px;">' + 					this.sol.Exemptions__c + '</td></tr>' +
            '<tr><td style="width: 232px;"><p style="text-align: right;">Entity Use Codes</p></td><td style="width: 449px;">' + 			this.sol.Entity_Use_Codes__c + '</td></tr>' +
            '<tr><td style="width: 232px;"><p style="text-align: right;">Customer Support Info</p></td><td style="width: 449px;">' + 		this.sol.Customer_Support_Info__c + '</td></tr>' +
            '<tr><td style="width: 232px;"><p style="text-align: right;">User Guide</p></td><td style="width: 449px;">' + 					this.sol.User_Guide_Documentation__c + '</td></tr>' +
            '<tr><td style="width: 232px;"><p style="text-align: right;">Implementation Instructions</p></td><td style="width: 449px;">' +	this.sol.Implementation_Instructions__c + '</td></tr>' +
            '</tbody></table>' +
            
            //Pro User Information Table
            '<div class="mt-style-conditional style-wrap" if="user.seated" title="Conditional Text (Pro-Member only)">' +
            '<p><strong><span style="background-color:#ffff00;">This information below is only Visible to Pro / Internal Users</span></strong></p>' +
            '<table border="1" cellpadding="1" cellspacing="1" style="width: 100%; table-layout: fixed;"><tbody>' +
			'<tr><td style="width: 226px; text-align: right;">Salesforce Account</td><td style="width: 445px;">' + this.sol.Account__r.Name + '</td></tr>' +
			'<tr><td style="width: 226px; text-align: right;">Connector Type</td><td style="width: 445px;">' + this.sol.Connector_Type__c + '</td></tr>' +
			'<tr><td style="width: 226px; text-align: right;">SDK Platform</td><td style="width: 445px;">' + this.sol.SDK_Platform__c + '</td></tr>' +
			'<tr><td style="width: 226px; text-align: right;">Transaction Signature</td><td style="width: 445px;">' + this.sol.Transaction_Signature__c + '</td></tr>' +
			'<tr><td style="width: 226px; text-align: right;">Customer Maintenance Process / Utility</td><td style="width: 445px;">' + this.sol.Customer_Maint_Process_Utility__c + '</td></tr>' +
			'<tr><td style="width: 226px; text-align: right;">Address Validation / Batch Utility</td><td style="width: 445px;">' + this.sol.Address_Validation_Batch_Utlity__c + '</td></tr>' +
			'<tr><td style="width: 226px; text-align: right;">Filter Tax Calc by State</td><td style="width: 445px;">' + this.sol.Filter_Tax_Calc_by_State__c + '</td></tr>' +
			'<tr><td style="width: 226px; text-align: right;">Warehouse / Ship to by Line</td><td style="width: 445px;">' + this.sol.Warehouse_Ship_to_by_Line__c + '</td></tr>' +
			'<tr><td style="width: 226px; text-align: right;">Committing Transactions</td><td style="width: 445px;">' + this.sol.Committing_Transactions__c + '</td></tr>' +
			'<tr><td style="width: 226px; text-align: right;">Known Issues</td><td style="width: 445px;">' + this.sol.Known_Issues__c + '</td></tr>' +
			'<tr><td style="width: 226px; text-align: right;">Internal Contact</td><td style="width: 445px;">' + this.sol.Internal_Contact__r.Name + '</td></tr>' +
			'<tr><td style="width: 226px; text-align: right;">Installation Contact</td><td style="width: 445px;">' + this.sol.installation_Contact__r.Name + '</td></tr>' +
			'<tr><td style="width: 226px; text-align: right;">Escalation Contact</td><td style="width: 445px;">' + this.sol.escalation_Contact__r.Name + '</td></tr>' +
			'<tr><td style="width: 226px; text-align: right;">Global Capability</td><td style="width: 445px;">' + this.sol.Account__r.Global__c + '</td></tr>' +
			'<tr><td style="width: 226px; text-align: right;">CertCapture Integration</td><td style="width: 445px;">' + this.sol.Account__r.CertCaptureCustomer__c + '</td></tr>' +
			'<tr><td style="width: 226px; text-align: right;">Connector Certified For:</td><td style="width: 445px;">' + '??' + '</td></tr>' +
			'</tbody></table>' +
            
            // Sales Notes Section
            '<p><span style="font-size:18px;">Sales Notes:</span></p>' +
			'<p>&nbsp;</p>' +
            '(Enter Sales Notes Here)' +
			'<p>&nbsp;</p></div><p>&nbsp;</p>'
		);    
    }

    
	/************************************************************************/
    /*********************** XML Response Processing ************************/
	/************************************************************************/
	
    // Response class processes the XML response from Mindtouch API calls
    public class Response{
        public String status;
        public String mindTouchURL; 
    }
    
	// parseResponses returns a list of responses that include a status and destination URL
    public Response[] parseResponses(XmlStreamReader reader) {
        Response[] responses = new Response[0];
        while(reader.hasNext()) {
            //  Start at the beginning of the response and make sure that it is a response
            if (reader.getEventType() == XmlTag.START_ELEMENT) {
                //if ('edit' == reader.getLocalName()) {
                    //  Pass the response to the parseResponse method (below) 
                    Response response = parseResponse(reader);
                    responses.add(response);
                //}
            }
            reader.next();
        }
        return responses;
    }
    
    // Parse through the XML, determine the status and mindTouchURL
    Response parseResponse(XmlStreamReader reader) {
        Response response = new Response();
        response.status = reader.getAttributeValue(null, 'status');
        while(reader.hasNext()) {
            if (reader.getEventType() == XmlTag.END_ELEMENT) {
                break;
            } else if (reader.getEventType() == XmlTag.CHARACTERS) {
                response.mindTouchURL = reader.getText();
            }
            reader.next();
        }
        return response;
    }     
}