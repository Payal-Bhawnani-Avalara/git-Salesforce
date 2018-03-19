global with sharing class cc_Ava_ctrl_PDP {

	public String blank {get; set;}    
    @RemoteAction   
	global static ccrz.cc_RemoteActionResult fetchExtraProduct(ccrz.cc_RemoteActionContext ctx, String productId) {
        ccrz.cclog.log('in here');
        ccrz.cc_RemoteActionResult result = ccrz.cc_CallContext.init(ctx);
        List<String> productIds = new List<String>();
        productIds.add(productId);
        Map<String, Object> inputMap = new Map<String, Object>{
            ccrz.ccapi.API_VERSION => ccrz.ccApi.CURRENT_VERSION,
            ccrz.ccApiProduct.PRODUCTSKULIST => productIds,
            ccrz.ccapi.SIZING => new Map<String, Object>{
                    ccrz.ccApiProduct.ENTITYNAME => new Map<String, Object>{
                        ccrz.ccApi.SZ_DATA => ccrz.ccApi.SZ_M
                    }
            }
        };
        
        Map<String, Object> productData = ccrz.ccApiProduct.fetch(inputMap);
        List<Map<String, Object>> productlist = (List<Map<String, Object>>) productData.get(ccrz.ccApiProduct.PRODUCTLIST);
        result.data = productlist;
        ccrz.cclog.log('prodlist', productlist);
        result.success = true;
        return result;
    }

}