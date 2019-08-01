global with sharing class cc_Ava_ProductService {
 
    /*global virtual override Map<String, Object> getFieldsMap(Map<String, Object> inputData) {
        Map<String,Object> ccrzFields = super.getFieldsMap(inputData); 
         //get the fields returned by the service
         String objectFields = (String)ccrzFields.get('objectFields'); 
         if(!objectFields.contains('LongDesc__c')){
             //if the fields string does not already contain LongDesc, add it
             objectFields += ',LongDesc__c,LongDescRT__c';
         }
        //in PLP, these fields are available on page in CCRZ.prodView.items.models.[number].attributes.prodBean
        //in PDP: CCRZ.prodDetailView.model.attributes.product.prodBean
        objectFields += ',TestLongDesc__c,PDP_Image_Width__c,Product_Features__c,Product_Name_After_Icon__c, Tagline__c,Number_of_Transactions__c,Connector_Id__c';
        ccrzFields.put('objectFields', objectFields);
         
         return ccrzFields; 
        
    }
    
    global virtual override Map<String, Object> getSubQueryMap(Map<String, Object> inputData) {
        ccrz.ccLog.log(System.LoggingLevel.INFO, 'subquerymapo', inputData);

        Map<String,Object> ccrzFields = super.getSubQueryMap(inputData);
        ccrz.ccLog.log(System.LoggingLevel.INFO, 'subquerymapo ootb', ccrzFields);
        if (ccrzFields.containsKey('FILTERED_ProductMedias')) {
        	ccrzFields.put('FILTERED_ProductMedias', '(SELECT Id, Name, RecordTypeId, Product__c, AltMessage__c, Enabled__c, EndDate__c, FilePath__c, Locale__c, MediaType__c, ProductDescription__c, ProductMediaId__c, ProductMediaSource__c, Sequence__c, StartDate__c, StaticResourceName__c, URI__c FROM E_ProductMedias__r WHERE MediaType__c in :mediaFilter AND (Locale__c = :fullLocale OR Locale__c = :langLocale OR Locale__c = :defaultLocale OR Locale__c = null) AND (StartDate__c <=TODAY AND EndDate__c >= TODAY) ORDER BY Sequence__c ASC)');
        } else if (ccrzFields.containsKey('E_ProductMedias__r')) {
            ccrzFields.put('E_ProductMedias__r','(SELECT Id, Name, RecordTypeId, Product__c, AltMessage__c, Enabled__c, EndDate__c, FilePath__c, Locale__c, MediaType__c, ProductDescription__c, ProductMediaId__c, ProductMediaSource__c, Sequence__c, StartDate__c, StaticResourceName__c, URI__c FROM E_ProductMedias__r WHERE (Locale__c = :fullLocale OR Locale__c = :langLocale OR Locale__c = :defaultLocale OR Locale__c = null) AND (StartDate__c <=TODAY AND EndDate__c >= TODAY) ORDER BY Sequence__c ASC)');
        }
        ccrzFields.put('CompositeProducts__r','(SELECT Id, Name, Component__r.Sku__c, Component__r.Name, Component__r.ShortDesc__c, Component__r.LongDesc__c,  Category__c, Component__c, CompositeProductId__c, Composite__c, Description__c, DescriptionRT__c, ExtendedPrice__c, Optional__c, Parent__c, ProductGroup__c, ProductGroup__r.Name, Quantity__c, Sequence__c FROM CompositeProducts__r WHERE Component__r.StartDate__c <=TODAY AND Component__r.EndDate__c >= TODAY AND (Component__r.ProductStatus__c = \'Released\' OR Component__r.ProductStatus__c = \'Not Orderable\') ORDER BY Sequence__c ASC NULLS LAST )');

        ccrz.ccLog.log(System.LoggingLevel.INFO, 'subquerymapo after', ccrzFields);
        return ccrzFields;
    }*/
    
}