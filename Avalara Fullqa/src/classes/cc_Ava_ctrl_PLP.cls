global with sharing class cc_Ava_ctrl_PLP {

	public String blank {get; set;}    
    @RemoteAction   
	global static ccrz.cc_RemoteActionResult fetchExtraProduct(ccrz.cc_RemoteActionContext ctx, List<String> productIds) {
        ccrz.cclog.log('in here');
        ccrz.cc_RemoteActionResult result = ccrz.cc_CallContext.init(ctx);
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
    
    @RemoteAction   
	global static ccrz.cc_RemoteActionResult fetchExtraCategory(ccrz.cc_RemoteActionContext ctx, List<String> categoryIds) {
        ccrz.cclog.log('in here');
        ccrz.cc_RemoteActionResult result = ccrz.cc_CallContext.init(ctx);
        Map<String, Object> inputMap = new Map<String, Object>{
            ccrz.ccapi.API_VERSION => ccrz.ccApi.CURRENT_VERSION,
            ccrz.ccApiCategory.CATEGORYIDLIST  => categoryIds,
            ccrz.ccapi.SIZING => new Map<String, Object>{
                    ccrz.ccApiCategory.ENTITYNAME => new Map<String, Object>{
                        ccrz.ccApi.SZ_DATA => ccrz.ccApi.SZ_M
                    }
            }
        };
        
        Map<String, Object> categoryData = ccrz.ccApiCategory.fetch(inputMap);
        List<Map<String, Object>> categorylist = (List<Map<String, Object>>) categoryData.get(ccrz.ccApiCategory.CATEGORYLIST);
        result.data = categorylist;
        ccrz.cclog.log('category list', categorylist);
        result.success = true;
        return result;
    }

}