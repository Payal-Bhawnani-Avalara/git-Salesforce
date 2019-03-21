//https://jira.avalara.com/browse/ITBSE-973?filter=-1
public with sharing class VersionClone {
	public Version__c majorVersion{get;set;}
	public Version__c subVersion{get;set;}
    public VersionClone(ApexPages.StandardController stdController) {
        this.majorVersion = (Version__c)stdController.getRecord();
        this.subVersion=new Version__c();
    }
    public PageReference saveSubVersion(){
    		FunctionalMatrixHandler.doNotExecuteTrigger=true;
    		this.majorVersion=Database.query('Select Connector__r.Name,Version_KB__r.SolutionName,'+Utility.getSObjectFields('Version__c')+',(Select '+Utility.getSObjectFields('Badge__c')+' From Badges__r),(Select id From Connector_KB__r),(Select '+Utility.getSObjectFields('Functional_Checklist__c')+' From Functional_Checklists__r),(Select '+Utility.getSObjectFields('Functional_Matrix__c')+' From 	Functional_Matrix__r) From Version__c Where Id=\''+majorVersion.Id+'\' ');
    		String versionName=this.subVersion.Name;
    		Decimal sortOrder=this.subVersion.Sort_Order__c;
    		this.subVersion=this.majorVersion.clone();
    		this.subVersion.Parent_Version__c=this.majorVersion.Id;
    		this.subVersion.Name=versionName;
    		this.subVersion.Sort_Order__c=sortOrder;
    		insert this.subVersion;
    		
    		List<Functional_Checklist__c> listFC=new List<Functional_Checklist__c>();
    		for(Functional_Checklist__c fc:this.majorVersion.Functional_Checklists__r){
    			Functional_Checklist__c clonedFC=fc.clone();
    			clonedFC.Version__c=this.subVersion.Id;
    			listFC.add(clonedFC);
    		}
    		insert listFC;
    		
    		Map<Id,Functional_Matrix__c> fmMap=new Map<Id,Functional_Matrix__c>();
    		for(Functional_Matrix__c fm:this.majorVersion.Functional_Matrix__r){
    			Functional_Matrix__c clonedFM=fm.clone();
    			clonedFM.Version__c=this.subVersion.Id;
    			fmMap.put(fm.Id,clonedFM);
    		}
    		insert fmMap.values();    		
    		
    		List<Badge__c> listBadges=new List<Badge__c>();
    		for(Badge__c b:this.majorVersion.Badges__r){
    			Badge__c clonedBadge=b.clone();
    			clonedBadge.Version__c=this.subVersion.Id;
    			clonedBadge.Functional_Matrix_Ext_Id__c=null;
    			clonedBadge.Functional_Matrix__c=null;
    			if(b.Functional_Matrix__c!=null && fmMap.containsKey(b.Functional_Matrix__c)){
    				clonedBadge.Functional_Matrix__c=fmMap.get(b.Functional_Matrix__c).Id;
    				//clonedBadge.Functional_Matrix_Ext_Id__c=fmMap.get(b.Functional_Matrix__c).Id;
    			}
    			listBadges.add(clonedBadge);
    		}
    		insert listBadges;
    		
		List<Functional_Matrix_Requirement__c> listFMROld=Database.query('Select '+Utility.getSObjectFields('Functional_Matrix_Requirement__c')+' From Functional_Matrix_Requirement__c Where 	Functional_Matrix__r.Version__c=\''+majorVersion.Id+'\' ');
		List<Functional_Matrix_Requirement__c> listFMR=new List<Functional_Matrix_Requirement__c>();  
		for(Functional_Matrix_Requirement__c fmr:listFMROld){
			Functional_Matrix_Requirement__c clonedFMR=fmr.clone();
			clonedFMR.Functional_Matrix__c=null;
			clonedFMR.External_Id__c=null;
			if(fmr.Functional_Matrix__c!=null && fmMap.containsKey(fmr.Functional_Matrix__c)){
				clonedFMR.Functional_Matrix__c=fmMap.get(fmr.Functional_Matrix__c).Id;
				//clonedFMR.External_Id__c=fmMap.get(fmr.Functional_Matrix__c).Id;				
			}
			listFMR.add(clonedFMR);
		}  
		insert listFMR;		
    		
    		List<Connector_KB__kav> oldCKBIDs=new List<Connector_KB__kav>();
    		oldCKBIDs.addAll(this.majorVersion.Connector_KB__r);
    		List<Connector_KB__kav> listOldCKB=Database.query('select '+Utility.getSObjectFields('Connector_KB__kav')+' From Connector_KB__kav  Where Version__c=\''+majorVersion.Id+'\'  AND Id=:oldCKBIDs' );
    		List<Connector_KB__kav> listCKB=new List<Connector_KB__kav>();
    		for(Connector_KB__kav ckb:listOldCKB){
    			Connector_KB__kav clonedCKB=ckb.clone();
    			clonedCKB.Version__c=this.subVersion.Id;
    			clonedCKB.Title = this.subVersion.Name;
    			clonedCKB.UrlName = (this.majorVersion.Connector__r.Name + '-' +this.subVersion.Name + '-' + this.majorVersion.Version_KB__r.SolutionName).replaceAll('[^a-zA-Z0-9]',' ').normalizeSpace().toLowerCase().replaceAll(' ','-')+this.subVersion.Id;
    			clonedCKB.Address_Validation_Functional_Matrix__c=null;
    			clonedCKB.Comm_Functional_Matrix__c=null;
    			clonedCKB.Sales_Tax_Matrix__c=null;
    			if(ckb.Address_Validation_Functional_Matrix__c!=null  && fmMap.containsKey(ckb.Address_Validation_Functional_Matrix__c)){
    				clonedCKB.Address_Validation_Functional_Matrix__c=fmMap.get(ckb.Address_Validation_Functional_Matrix__c).Id;
    			}
    			if(ckb.Comm_Functional_Matrix__c!=null  && fmMap.containsKey(ckb.Comm_Functional_Matrix__c)){
    				clonedCKB.Comm_Functional_Matrix__c=fmMap.get(ckb.Comm_Functional_Matrix__c).Id;
    			}
    			if(ckb.Sales_Tax_Matrix__c!=null  && fmMap.containsKey(ckb.Sales_Tax_Matrix__c)){
    				clonedCKB.Sales_Tax_Matrix__c=fmMap.get(ckb.Sales_Tax_Matrix__c).Id;
    			}    			    			
    			listCKB.add(clonedCKB);
    		}
        if(!listCKB.isEmpty()){
            insert listCKB;
            FunctionalMatrixSyncUtil.publishNewArticle(new Map<Id, Connector_KB__kav>(listCKB).keySet());
        }
    		PageReference pr=new PageReference('/'+this.subVersion.Id);
    		pr.setRedirect(true);
    		return pr;
    }    
}