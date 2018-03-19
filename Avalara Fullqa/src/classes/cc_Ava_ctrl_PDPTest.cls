@isTest
private class cc_Ava_ctrl_PDPTest {

	@testSetup static void createData() {
		cc_ava_testUtils.initData();
	}
	
	@isTest static void testAvaCtrlPDP_fetchExtraProduct() {
		//signature: ccrz.cc_RemoteActionResult fetchExtraProduct(ccrz.cc_RemoteActionContext ctx, String productId)

		ccrz.cc_RemoteActionContext context = cc_ava_testUtils.createRemoteActionContext();
		ccrz.cc_RemoteActionResult result = ccrz.cc_CallContext.init(context);

		ccrz.cc_RemoteActionResult fetchReturn = cc_Ava_ctrl_PDP.fetchExtraProduct(context, cc_ava_testUtils.myReturnsSku);

		//only requested one sku, so ok to grab listitem by index
		List<Object> fetchDataList = (List<Object>)fetchReturn.data;
		Map<String,Object> fetchDataMap = (Map<String,Object>)fetchDataList[0];

		System.assertEquals(cc_ava_testUtils.myReturnsSku, fetchDataMap.get('SKU'));

	}
}