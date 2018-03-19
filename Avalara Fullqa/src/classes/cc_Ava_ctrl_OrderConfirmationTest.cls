@isTest
private class cc_Ava_ctrl_OrderConfirmationTest {

	@testSetup static void createData() {
		cc_ava_testUtils.initData();
	}

	@isTest static void testAvaOrderConfirmation_fetchProductsOrdered() {
		ccrz.cc_RemoteActionContext context = cc_ava_testUtils.createRemoteActionContext();
		ccrz.cc_RemoteActionResult result = ccrz.cc_CallContext.init(context);
		List<String> productSkus = new List<String>{cc_ava_testUtils.myReturnsSku};
		System.debug('productSkus to send to fetchProductsOrdered: ' + productSkus);	
		ccrz.cc_RemoteActionResult orderConfirm = cc_Ava_ctrl_OrderConfirmation.fetchProductsOrdered(context, productSkus);
		System.debug('fetchProductsOrdered result: ' + orderConfirm);

		//did the controller get product data?
		System.assertEquals(true, orderConfirm.success);

		//were recurring and non-recurring prices correct?
		Map<String,Object> confirmData = (Map<String,Object>)orderConfirm.data;
		Map<String,Object> confPriceResults = (Map<String,Object>)confirmData.get('PriceResults');
		for(Object obj : confPriceResults.values()) {
			Map<String,Object> tm = (Map<String,Object>)obj;
			List<Object> tmPes = (List<Object>)tm.get('priceEntries');
			for(Object tmp : tmPes) {
				Map<String,Object> tmp2 = (Map<String,Object>)tmp;
				if(tmp2.get('recurringPrice')==true) {
					System.assertEquals(0,tmp2.get('price'));					
				} else if(tmp2.get('recurringPrice')==false) {
					System.assertEquals(10,tmp2.get('price'));
				}
			}
		}

	}
}