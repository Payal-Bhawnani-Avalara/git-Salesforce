public with sharing class QSExt01 {
      private final QuoteSheet__c qs;

    
    public QSExt01(ApexPages.StandardController stdController) {
        this.qs = (QuoteSheet__c)stdController.getRecord();
    }
    
  	public Product2 getProduct2() {
        string s = ApexPages.currentPage().getParameters().get('product_c'); 
        return [select name, family from Product2 Limit 1];
        }
}