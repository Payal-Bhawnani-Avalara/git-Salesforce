global with sharing class cc_hk_OrderAva {

	/*global virtual override Map<String,Object> place(Map<String,Object> inputData) {

		//TO FIX: CURRENTLY (2017-05-04) MAJORITEMS DO NOT GET UPDATED BECAUSE THE CALL TO PLACE() METHOD BEFORE INSERT OF MAJORITEMS DOES NOT HAVE ACCESS TO MINORITEMS, AND TIER IS A CHILDITEM, AND TIER TELLS US PRICEGROUP
		//ALSO CALLCONTEXT DOES NOT CONTAIN PRICEGROUP IN HERE
		//WE DO HAVE THE CARTID SO WE CAN SOQL BUT WOULD PREFER NOT TO..!!!

		//System.debug('ORDERAVA inputData: ' + JSON.serializePretty(inputData));

		Map<String,Object> result = super.place(inputData);

		system.debug('>>>>>>>>>>>>>ORDER PLACE STEP: ' + result.get('placeStep'));
		system.debug('ORDERAVA inputData at this step: ' + inputData);
		system.debug('ORDERAVA callcontext pricegroupid: ' + ccrz.cc_CallContext.priceGroupId);
		System.debug('ORDERAVA callcontext currPageParameters: ' + ccrz.cc_CallContext.currPageParameters);
		System.debug('ORDERAVA super result: ' + result);
		System.debug('ORDERAVA orderitems only: ' + result.get('orderItems'));
		System.debug('ORDERAVA orderchilditems only: ' + result.get('orderChildItems'));

		/* we have a list of orderitems about to insert, and we need to get from here to fields on the correct pricelistitem
		we'll infer the pricelistitem for each product via three-stage breadth-first filter:
			filter 1: orderItem[tier.correspondingPricelist]->pricelist (this will rule out 2/3 of pricelistitems immediately)
			filter 2: for pricelistitems found in filter 1:
				filter 2a: orderitems.ccproductid->pricelistitem.product
				//unfortunately only MAJOR cartitems are included in return from place() at any step so need to find subprodterms indirectly
				filter 2b: findSubprodTerm: cart.id->cart.cartitems[minor].subprodterm
				filter 2c: findSubprodTerm->pricelistitem.subprodterm
			now we should have exactly one pricelistitem, which should have the appropriate fields to insert into ccorderitem
		

		//update order with payment token before inserting
		if(result.get('placeStep') == 'createOrderPre') {
			System.debug('<<><><><><><><><> ORDER INFO:' + result.get('order'));
			ccrz__E_Order__c myOrder = (ccrz__E_Order__c)result.get('order');
			myOrder.PROS_Quote_Payment_Token__c = ccrz.cc_CallContext.currPageParameters.get('paymentToken');
			System.debug('<<><><><><><><><> ORDER INFO AFTER ADDING PAYMENT TOKEN:' + result.get('order'));
		}

		//at start step we won't have a cartid; thereafter we will

		if(result.get('placeStep') == ccrz.cc_hk_Order.STEP_CREATE_ORDER_ITEMS_PRE || result.get('placeStep') == ccrz.cc_hk_Order.STEP_CREATE_ORDER_CHILD_ITEMS_PRE) {
			//we'll need cartitems in order to transfer subprodterms, cpq quantity, and all pricelistitem fields (the latter for majoritems)
			ccrz__E_Cart__c myCart = (ccrz__E_Cart__c)inputData.get('cart');
			String myCartId = myCart.Id;
			List<ccrz__E_CartItem__c> allCartItems = [select ccrz__Product__c, ccrz__SubProdTerm__c, CPQ_Quantity__c, Connector_Id__c from ccrz__E_CartItem__c where ccrz__Cart__c = :myCartId];

			//the place() method is called multiple times, once for majoritems (orderItems) and once for minoritems (orderChildItems)
			List<ccrz__E_OrderItem__c> myOrderItemsMajor = new List<ccrz__E_OrderItem__c>((List<ccrz__E_OrderItem__c>)result.get('orderItems'));
			List<ccrz__E_OrderItem__c> myOrderItemsMinor = new List<ccrz__E_OrderItem__c>((List<ccrz__E_OrderItem__c>)result.get('orderChildItems'));
			List<String> myProductIdsOrderedAll = new List<String>();
			for(ccrz__E_OrderItem__c oi : myOrderItemsMajor) {
				myProductIdsOrderedAll.add((String)oi.get('ccrz__Product__c'));
			}
			for(ccrz__E_OrderItem__c oi : myOrderItemsMinor) {
				myProductIdsOrderedAll.add((String)oi.get('ccrz__Product__c'));
			}

			List<ccrz__E_Product__c> productsOrdered = [select Name, Corresponding_Price_Group__c from ccrz__E_Product__c where Id in :myProductIdsOrderedAll];

			//get active pricegroup from tier among items ordered
			List<String> activePriceGroup = new List<String>();
			//if(productsOrdered.isEmpty()==false) {
			//	for(ccrz__E_Product__c po : productsOrdered) {
			//		if(po.Corresponding_Price_Group__c != null) {
			//			activePriceGroup.add(po.Corresponding_Price_Group__c);
			//		}
			//	}
			//}

			String myActivePriceGroupId = ccrz.cc_CallContext.priceGroupId;
			activePriceGroup.add(myActivePriceGroupId);

			//get the pricelist for this price group via price group pricelist
			List<ccrz__E_PriceGroupPricelist__c> activePricelist = [select ccrz__PriceGroup__c, ccrz__Pricelist__c from ccrz__E_PriceGroupPricelist__c where ccrz__PriceGroup__c in :activePriceGroup];
			//there should only ever be one active pricelist


			//2017-05-08 NO LONGER NECESSARY BECAUSE GRABBING PRICEGROUP FROM CALLCONTEXT (SET IN CONTROLLER.PLACEORDER)
			/* at the 'major items' stage (placeStep==orderItemsPre) the orderitems don't know about the pricing tier
			and the transaction level ccproduct isn't accessible AND callcontext pricegroup isn't populated,
			so need to grab tier based on cart info (which we do have) 
			//if(result.get('placeStep')=='orderItemsPre') {

			//	Set<String> myCartItemProductIds = new Set<String>();
			//	for(ccrz__E_CartItem__c mci : allCartItems) {
			//		myCartItemProductIds.add((String)mci.ccrz__Product__c);
			//	}
			//	List<ccrz__E_Product__c> myCartProducts = [select Name, Corresponding_Price_Group__c from ccrz__E_Product__c where Id in :myCartItemProductIds];

			//	//get active pricegroup from tier in cart
			//	List<String> myActivePriceGroup = new List<String>();

			//	//2017-05-08 NOT NECESSARY, NOW GETTING PRICEGROUP FROM CALLCONTEXT
			//	if(myCartProducts.isEmpty()==false) {
			//		for(ccrz__E_Product__c po : myCartProducts) {
			//			if(po.Corresponding_Price_Group__c != null) {
			//				myActivePriceGroup.add(po.Corresponding_Price_Group__c);
			//			}
			//		}
			//	}

			//	String myActivePriceGroupId = ccrz.cc_CallContext.priceGroupId;
			//	myActivePriceGroup.add(myActivePriceGroupId);

			//	List<ccrz__E_PriceGroupPricelist__c> myActivePricelist = [select ccrz__PriceGroup__c, ccrz__Pricelist__c from ccrz__E_PriceGroupPricelist__c where ccrz__PriceGroup__c in :myActivePriceGroup];

			//	if(myActivePricelist.isEmpty()==false) {
			//		activePriceList = myActivePricelist;
			//	}

			//}

			if(activePricelist.isEmpty()==false){
				String activePriceListId = activePricelist[0].ccrz__Pricelist__c;

				//this method gets called twice so need to make sure we grab pricelistitems not for minoritems only

				//get pricelistitems for this pricelist; include any fields we're going to have to sent to orderitems
				List<ccrz__E_PriceListItem__c> activePriceListItems = [select Name, ccrz__Product__c, ccrz__SubProdTerm__c, Opportunity_LI_Rate_Plan_Charge_Tier_ID__c, Opportunity_LI_Rate_Plan_ID__c, Opportunity_LI_Item_Type__c, Opportunity_LI_Model__c, Opportunity_LI_Rate_Plan_Charge_ID__c, ccrz__Price__c from ccrz__E_PriceListItem__c where ccrz__Pricelist__c =:activePriceListId];

				//map from product to pricelistitem (so we can later map from product to orderitem) -- faster than nested loops
				Map<String,ccrz__E_PriceListItem__c> productId2PriceListItem = new Map<String,ccrz__E_PriceListItem__c>();

				//find pricelistitems on this pricelist for each product ordered..which we already have
				System.debug('productsOrdered right before populating map: ' + productsOrdered);
				for(ccrz__E_PriceListItem__c pli : activePriceListItems) {
					for(ccrz__E_Product__c po : productsOrdered) {
						//also check for matching subprodterms
						for(ccrz__E_CartItem__c ci : allCartItems) {
							if(pli.ccrz__Product__c == po.Id && pli.ccrz__SubProdTerm__c == ci.ccrz__SubProdTerm__c) {
								productId2PriceListItem.put(po.Id, pli);
							}
						}
					}
				}

				System.debug('magical map: ' + productId2PriceListItem);

				//now add those values from pricelistitems to orderitems..both times this is called
				for (ccrz__E_OrderItem__c oimn : myOrderItemsMinor) {
					if (productId2PriceListItem.get(oimn.ccrz__Product__c) != null) {
						oimn.Opportunity_LI_Rate_Plan_Charge_Tier_ID__c = productId2PriceListItem.get(oimn.ccrz__Product__c).Opportunity_LI_Rate_Plan_Charge_Tier_ID__c;
						oimn.Opportunity_LI_Rate_Plan_Charge_ID__c = productId2PriceListItem.get(oimn.ccrz__Product__c).Opportunity_LI_Rate_Plan_Charge_ID__c;
						oimn.Opportunity_LI_Rate_Plan_ID__c = productId2PriceListItem.get(oimn.ccrz__Product__c).Opportunity_LI_Rate_Plan_ID__c;
						oimn.Opportunity_LI_Item_Type__c = productId2PriceListItem.get(oimn.ccrz__Product__c).Opportunity_LI_Item_Type__c;
						oimn.Opportunity_LI_Model__c = productId2PriceListItem.get(oimn.ccrz__Product__c).Opportunity_LI_Model__c;
					}
				}
				for (ccrz__E_OrderItem__c oimj : myOrderItemsMajor) {
					if (productId2PriceListItem.get(oimj.ccrz__Product__c) != null) {
						oimj.Opportunity_LI_Rate_Plan_Charge_Tier_ID__c = productId2PriceListItem.get(oimj.ccrz__Product__c).Opportunity_LI_Rate_Plan_Charge_Tier_ID__c;
						oimj.Opportunity_LI_Rate_Plan_Charge_ID__c = productId2PriceListItem.get(oimj.ccrz__Product__c).Opportunity_LI_Rate_Plan_Charge_ID__c;
						oimj.Opportunity_LI_Rate_Plan_ID__c = productId2PriceListItem.get(oimj.ccrz__Product__c).Opportunity_LI_Rate_Plan_ID__c;
						oimj.Opportunity_LI_Item_Type__c = productId2PriceListItem.get(oimj.ccrz__Product__c).Opportunity_LI_Item_Type__c;
						oimj.Opportunity_LI_Model__c = productId2PriceListItem.get(oimj.ccrz__Product__c).Opportunity_LI_Model__c;
					}
				}

			}

			//now that we have pricelistitems, do the (easier) copy of subprodterm and cpq quantity from cartitems to orderitems

			//now create a map from each cart item product to its corresponding subprodterm and another to cpq quantity
			//it might be better to do this in a bean but this is so simple it may be easier to just be flexible
			Map<String,String> product2SubProdTerm = new Map<String,String>();
			Map<String,Decimal> product2CPQQuantity = new Map<String,Decimal>();
			Map<String,String> product2ConnectorId = new Map<String,String>();
			//grab product->subprodterm (so we can look this up and cpq quantity in one loop
			//cpq quantity is the same for all cartitems in the same cart because tier is atomic per cart, so just grab cpq quantity from any cccartitem with a nonnull cpqquantity
			for(ccrz__E_CartItem__c ci : allCartItems) {
				product2SubProdTerm.put(ci.ccrz__Product__c,ci.ccrz__SubProdTerm__c);
				product2CPQQuantity.put(ci.ccrz__Product__c,ci.CPQ_Quantity__c);
				product2ConnectorId.put(ci.ccrz__Product__c,ci.Connector_Id__c);
			}

			//now add subprodterms and number of transactions to the correct ccorderitems
			for (ccrz__E_OrderItem__c oimn : myOrderItemsMinor) {
				oimn.ccrz__SubProdTerm__c = product2SubProdTerm.get(oimn.ccrz__Product__c);
				oimn.CPQ_Quantity__c = product2CPQQuantity.get(oimn.ccrz__Product__c);
				oimn.Connector_Id__c= product2ConnectorId.get(oimn.ccrz__Product__c);
			}
			for (ccrz__E_OrderItem__c oimj : myOrderItemsMajor) {
				oimj.ccrz__SubProdTerm__c = product2SubProdTerm.get(oimj.ccrz__Product__c);
				oimj.CPQ_Quantity__c = product2CPQQuantity.get(oimj.ccrz__Product__c);
				oimj.Connector_Id__c= product2ConnectorId.get(oimj.ccrz__Product__c);
			}


			System.debug('ORDERAGA orderitems after loop: ' + result.get('orderItems'));
			System.debug('and the list of products in this order: ' + myProductIdsOrderedAll);
			System.debug('and the actual products ordered: ' + productsOrdered);
			System.debug('should be only one active pricegroup but let us see: ' +activePriceGroup);


		}

		return result;
	}*/

}