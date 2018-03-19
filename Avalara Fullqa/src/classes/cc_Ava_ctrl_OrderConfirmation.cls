global with sharing class cc_Ava_ctrl_OrderConfirmation {

	public String blank {get; set;}

	@RemoteAction
	global static ccrz.cc_RemoteActionResult fetchProductsOrdered(ccrz.cc_RemoteActionContext ctx, List<String> productSkus) {

        ccrz.cc_RemoteActionResult result = ccrz.cc_CallContext.init(ctx);

        Map<String, Object> productsToFetch = new Map<String, Object>{
            ccrz.ccapi.API_VERSION => ccrz.ccApi.CURRENT_VERSION,
            ccrz.ccApiProduct.PRODUCTSKULIST => productSkus,
            ccrz.ccapi.SIZING => new Map<String, Object>{
            	ccrz.ccApiProduct.ENTITYNAME => new Map<String, Object>{
            		ccrz.ccApi.SZ_DATA => ccrz.ccApi.SZ_L
            	}
            },
            ccrz.ccApiProduct.PARAM_INCLUDE_PRICING => true
        };

        result.success = false;

        try {
        	Map<String, Object> productData = ccrz.ccApiProduct.fetch(productsToFetch);
        	if(productData.size()>0) {
        		System.debug('productData: ' + productData);
        		result.data = productData;
        		result.success=true;
        	} else {
        		result.data = 'could not fetch ordered product data, sadly';
        	}
        } catch (Exception e) {
			result.success = false;
			System.debug(LoggingLevel.ERROR,'ERR:Error getting ordered product data: ' + e.getCause() + ' at line ' + e.getLineNumber());	
        }

        return result;

	}

}