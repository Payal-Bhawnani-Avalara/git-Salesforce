global with sharing class cc_Ava_ctrl_ConfigFlow {

	public String blank {get; set;}  
	public String cartID {get; set;}
	public String baseUrl {get; set;}
	public String ZuoraPageID {get; set;}

  @RemoteAction
  global static ccrz.cc_RemoteActionResult getZuoraIframe(ccrz.cc_RemoteActionContext ctx)
  {
      ccrz.cc_RemoteActionResult signResult = ccrz.cc_CallContext.init(ctx);
      System.debug('Inside cc_ava_PaymentController');
      //System.debug('**XX**Parameter Id='+ApexPages.currentPage().getParameters().get('currentCartId'));
      // Do not initialize the keys more than once   
      system.debug('calling init hosted pagekeys');
      Http http = new Http();
      HttpRequest req = new HttpRequest();
      String sandboxName=CC_AVA_Util.getSandboxName();
      String customSettingName='Zuora_'+sandboxName+'_configflow';
      Zuora_Customer_Config3__c  mc1 = Zuora_Customer_Config3__c.getValues(customSettingName); // Read the password from Custom Setting
      String baseurl = mc1.Zuora_ApiBaseurl__c;
      String uriBaseurl = mc1.Zuora_UriBaseurl__c;
      String endpoint = baseUrl + '/v1/rsa-signatures';
      String gatewayName = mc1.Zuora_GatewayName__c;
      String paymentGateway = mc1.Zuora_paymentGateway__c;
      req.setEndpoint('callout:ZUORA_ENDPOINT'+'/v1/rsa-signatures');
      req.setHeader('apiAccessKeyId', '{!$Credential.Username}');
      req.setHeader('apiSecretAccessKey', '{!$Credential.Password}');
      req.setHeader('Accept', 'application/json');
      req.setHeader('Content-Type', 'application/json');
      system.debug('calling init hosted pagekeys');
      String ZuoraPageID = mc1.Zuora_PageId__c;
      String body = '{"uri": "{uri}", "method": "POST","pageId": "{pageId}", "retainValues": "true"}'.replace('{uri}', uriBaseUrl + '/apps/PublicHostedPageLite.do').replace('{pageId}', ZuoraPageID);
      req.setMethod('POST');
       
      // Add the authorization to the rest request
      zqu.RestHelper restHelper = new zqu.RestHelper();
      
       
      //req.setEndpoint(endpoint);
      req.setBody(body);
      System.debug('***getHostedPageKeys: req = ' + req);
      System.debug('***getHostedPageKeys: body = ' + req.getBody());
       
      HttpResponse res;
      Map < String, Object > result;
      try {
          res = http.send(req);
          System.debug('***getHostedPageKeys: response = ' + res.getBody());
          result = (Map < String, Object >)JSON.deserializeUntyped(res.getBody());
          result.put('pageId',ZuoraPageID);
          result.put('apiBaseUrl',baseurl);
          result.put('uriBaseUrl',uriBaseurl);
          result.put('gatewayName',gatewayName); 
          result.put('paymentGateway',paymentGateway);      
      }
      catch(Exception e) {
          result = new Map < String, Object > {
              'success' => 'false', 'reasons' => new List < String > {
                  e.getMessage()
                      }
          };
          result.put('pageId',ZuoraPageID);
          result.put('apiBaseUrl',baseurl);
          result.put('uriBaseUrl',uriBaseurl);
          result.put('gatewayName',gatewayName); 
          result.put('paymentGateway',paymentGateway);
      }
       
      System.debug(result);
      // Initialize the rsaSignatureResult from the deserialize map object
  		signResult.data = result;
      return signResult;
  }

	@RemoteAction
	global static ccrz.cc_RemoteActionResult fetchCompositeProducts(ccrz.cc_RemoteActionContext ctx, List<String> productSkus) {
    
        // setup object js will use
        ccrz.cc_RemoteActionResult result = ccrz.cc_CallContext.init(ctx);
        System.debug('ctx in fetchCompositeProducts: ' + ctx);
        
        // setup request for whatever skus user wants; ensure that we're returning according to current api version
        // SZ_L is smallest dataset that includes composite product info; compositeProducts is List<Map<String, Object>>
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

        //get data from product api
        try {
        	//get initial (top-level) product list
        	Map<String, Object> productData = ccrz.ccApiProduct.fetch(productsToFetch);
        	System.debug('productData in fetchCompositeProducts: ' + productData);
			//need cast to remove metadata about api response
			List<Map<String, Object>> productList = (List<Map<String, Object>>) productData.get(ccrz.ccAPIProduct.PRODUCTLIST);
			System.debug('productList from productData in fetchCompositeProducts: ' + productList);
			List<Object> compositeList = new List<Object>();
			for(Map<String, Object> someProduct : productList) {
				compositeList.add(someProduct.get('compositeProductsS'));
			}
			//each product has only one compositeProductsS list (however many members that list has) so grab the first=0only item
			Object compositeProductList = compositeList[0];
			//convert it to a list of objects..fine because Object is more abstract than List / contains no info List doesn't
			List<Object> comps = (List<Object>)compositeProductList;
			//but we just need the sfid for each component product, so iterate through the list of Objects and add the 'component' property from each Object to our new id list
			List<Object> idsList = new List<Object>();
			//and we also need a map from sfid to product group so we can add this before returning
			Map<Object,Object> productsAndGroups = new Map<Object,Object>();
			Map<Object,Object> productToPG = new Map<Object,Object>();
			for(Object o : comps) {
				Map<String,Object> whatMap = (Map<String,Object>)o;
				idsList.add(whatMap.get('component'));
				productsAndGroups.put(whatmap.get('component'),whatmap.get('productGroupR'));
				for(Object ob : productsAndGroups.values()){
					Map<String,Object> tempMap = (Map<String,Object>)ob;
					if(tempMap!=null) {
						productToPG.put(whatmap.get('component'),tempMap.get('sfdcName'));
					}
				}
			}
			//idsList LOOKS like a list of strings but because it's actually a list of objects we need to convert it to a List<String> instead
			//because String is more concrete than Object we can't just cast automatically, so need to iterate and do a String.valueOf on each Object
			List<String> sendableIds = new List<String>();
			for (Object o : idsList) {
				sendableIds.add(String.valueOf(o));
			}
			//ok now that we have the list of component sfids, we can pass this list to the cc product api
	        Map<String, Object> compositeProductsToFetch = new Map<String, Object>{
	            ccrz.ccapi.API_VERSION => ccrz.ccApi.CURRENT_VERSION,
	            ccrz.ccApiProduct.PRODUCTIDLIST => sendableIds,
	            ccrz.ccapi.SIZING => new Map<String, Object>{
	            	ccrz.ccApiProduct.ENTITYNAME => new Map<String, Object>{
	            		ccrz.ccApi.SZ_DATA => ccrz.ccApi.SZ_L
	            	}
	            },
            ccrz.ccApiProduct.PARAM_INCLUDE_PRICING => true
	        };
	        //and put the results in here
        	Map<String, Object> compositeProductData = ccrz.ccApiProduct.fetch(compositeProductsToFetch);
			//need cast to remove metadata about api response, just like before
			List<Map<String, Object>> compositeProductReturn = (List<Map<String, Object>>) compositeProductData.get(ccrz.ccAPIProduct.PRODUCTLIST);
			//make a map of THIS data for lookup to add to wrapper list
			Map<String,Map<String,Object>> compositeProductMap = new Map<String,Map<String,Object>>();
			//populate this map
			for(Map<String,Object> cpr : compositeProductReturn) {
				compositeProductMap.put(String.valueOf(cpr.get('sfid')),cpr);
			}

			//put it all in our wrapper object to return
			List<groupableProduct> groupableProductReturn = new List<groupableProduct>();
			for(String cpid : compositeProductMap.keySet()) {
				groupableProduct gp = new groupableProduct();
				//put the sfid in the wrapper
				gp.sfid = cpid;
				//put the product info in the wrapper
				gp.productInfo = compositeProductMap.get(cpid);
				//put the product group in the wrapper
				gp.groupName = productToPG.get(cpid);
				groupableProductReturn.add(gp);
			}

			//group by product group
			List<groupWithProducts> groupsWithProducts = new List<groupWithProducts>();
			//first build list of unique group names
			Set<String> uniqueGroupNames = new Set<String>();
			for(groupableProduct gp : groupableProductReturn) {
				uniqueGroupNames.add(String.valueOf(gp.groupName));
			}
			//for each unique groupname, create a list of corresponding groupableProducts and add this list to groupWithProducts
			for(String s : uniqueGroupNames) {
				//initialize a list of products for this particular group
				List<groupableProduct> productsThisGroup = new List<groupableProduct>();
				//assign products from this group to the initialized list
				for(groupableProduct gp : groupableProductReturn) {
					if(String.valueOf(gp.groupName)==s) {
						productsThisGroup.add(gp);
					}
				}
				//create new groupWithProducts and assign the two properties (groupName and list of products w/full info)
				groupWithProducts gwp = new groupWithProducts();
				gwp.groupName = s;
				gwp.productsThisGroupOnly = productsThisGroup;
				groupsWithProducts.add(gwp);
			}

			result.data = groupsWithProducts;
			result.success = TRUE;

        } catch (Exception e) {
        	result.success = FALSE;
        	System.debug('error: ' + e + ' at line ' + e.getLineNumber() + ' with stack trace ' + e.getStackTraceString());
        }

        return result;
	}

	//wrapper for product data plus group
	@testVisible
	public class groupableProduct {
		public String sfid;
		public Object productInfo;
		public Object groupName;
	}

	//wrapper for product group with corresponding product data inside
	@testVisible
	public class groupWithProducts {
		public String groupName;
		public List<groupableProduct> productsThisGroupOnly;
	}

	//structured address as recd from configflow page and as sendable to address verification service
	@testVisible
	global class avaVerifiableAddress {
		public String Line1;
		public String Line2;
		public String City;
		public String Region;
		public String Country;
		public String PostalCode;
		public String Phone;
	}

	//to return to page when user inputs address and page asks for existing customer match
	@testVisible
	global class matchInfo {
		public Contact matchedContact;
		public Lead matchedLead;
		public String newConvertedContactId;
		public String newConvertedAccountId;
		public Boolean activeCustomer = false;
		public Boolean kickout = false;
	}

	@RemoteAction
	global static ccrz.cc_RemoteActionResult verifyAddress(ccrz.cc_RemoteActionContext ctx, avaVerifiableAddress addressToVerify) {
		ccrz.cc_RemoteActionResult result = ccrz.cc_CallContext.init(ctx);

		Map<String, Object> inputToValidate = new Map<String, Object>{
			ccrz.ccApiConfig.STORE_NAME => 'AvalaraStore',
			'Line1' => addressToVerify.Line1,
			'Line2' => addressToVerify.Line2,
			'City' => addressToVerify.City,
			'Region' => addressToVerify.Region,
			'Country' => addressToVerify.Country,
			'PostalCode' => addressToVerify.PostalCode
		};

		ccrz.ccLogic addressLogic = new ccava.ccLogicValidateAddress();

		//call address verification service
		result.success = false;
		try {
			Map<String, Object> addressVerificationResult = addressLogic.postProcess(addressLogic.process(addressLogic.preProcess(new Map<String,Object>{
				'data' => inputToValidate
				})));

			Map<String,Object> outputData = (Map<String,Object>)addressVerificationResult.get('data');
			System.debug('resulting verified address: ' + outputData);
			System.debug('and full response from address verification call: ' + addressVerificationResult);

			result.data = addressVerificationResult;
			result.success = true;

		} catch (Exception e) {
			System.debug(LoggingLevel.ERROR,'ERR:Error verifying address: ' + e.getCause() + ' at line ' + e.getLineNumber());
		}

		return result;
	}

	@RemoteAction
	global static ccrz.cc_RemoteActionResult calculateTax(ccrz.cc_RemoteActionContext ctx, String cartId) {
		//assumes that cart.ccrz__ShipTo__c has already been populated (by CC Contact Address record) and verified
		//also assumes that TaxCalculationAPI has been overriden with Avalara market template info

		ccrz.cc_RemoteActionResult result = ccrz.cc_CallContext.init(ctx);

		ccava.cc_avalara_AvaTax15TaxCalculation taxService = new ccava.cc_avalara_AvaTax15TaxCalculation();
		System.debug('taxService in calculateTax: ' + taxService);

		//call market template
		try {
			Decimal response = taxService.getTaxAmount(new Map<String,Object>{'CARTID' => cartId});
			System.debug('taxservice response in calculateTax: ' + response);

			result.data = response;
			result.success=true;
		} catch (Exception e) {
			result.success = false;
			System.debug(LoggingLevel.ERROR,'ERR:Error calculating tax: ' + e.getCause() + ' at line ' + e.getLineNumber());
		}

		return result;
	}

	@RemoteAction
	global static ccrz.cc_RemoteActionResult matchEmail(ccrz.cc_RemoteActionContext ctx, String emailAddress, String encCartId) {
		ccrz.cc_RemoteActionResult result = ccrz.cc_CallContext.init(ctx);
		result.success = false;

		String myEmailAddress = emailAddress;

		//matching log is simple now but put put in helper methods to simplify future complication
		List<Lead> myMatchingLeads = leadsMatched(myEmailAddress);
		if(myMatchingLeads.isEmpty()) {
			List<Contact> myMatchingContacts = contactsMatched(myEmailAddress);
			if(myMatchingContacts.isEmpty()) {
				//mark cart with addContact=true
				try {
					ccrz__E_Cart__c myCart = [select Id, ccrz__EncryptedId__c, addContact__c from ccrz__E_Cart__c where ccrz__EncryptedId__c = :encCartId];					
					myCart.addContact__c = true;
					update myCart;
				} catch (Exception e) {
					System.debug(LoggingLevel.ERROR,'ERR:Error updating CCCart.addContact: ' + e.getCause() + ' at line ' + e.getLineNumber());
				}
				result.success = false;
				result.data = 'no matched contacts';
			} else {
				result.success = true;
				matchInfo myMatchInfo = new matchInfo();
				//return first matching contact only (as per bluejeans conversation with aaron 2017-05-15)
				myMatchInfo.matchedContact = myMatchingContacts[0];
				if(isActiveCustomer(myMatchingContacts)) {
					myMatchInfo.activeCustomer = true;
					myMatchInfo.kickout = true;
				}
				result.data = myMatchInfo;
			}
		} else {
			matchInfo myMatchInfo = new matchInfo();
			//return first matching lead only (as per cloudcraze-avalara standup 2017-05-15 via dezbah citing aaron)
			myMatchInfo.matchedLead = myMatchingLeads[0];
			result.success = true;
			result.data = myMatchInfo;
		}

		return result;
	}

	//2017-05-18 MATCHING EMAIL ADDRESS ONLY; REMOVE THIS METHOD IF DECISION FINAL
	@RemoteAction
	global static ccrz.cc_RemoteActionResult matchAddress(ccrz.cc_RemoteActionContext ctx, String addressLine1, String phoneString) {
		ccrz.cc_RemoteActionResult result = ccrz.cc_CallContext.init(ctx);

		String myAddress = addressLine1;
		String myPhone = phoneString;

		//first turn the address into some or options


		return result;
	}

	@RemoteAction
	global static ccrz.cc_RemoteActionResult addConfiguredProductToCart(ccrz.cc_RemoteActionContext ctx, String dynamicKitSku, String componentProducts, String selectedTierId, String selectedBillingFrequency, String leadInfoJSON) {
		//NOTE: this method assumes specific relatedproductgroupnames (used directly below); even if display names change, do NOT change ccrelatedproductgroup.name

		//setup cart add as atomic transaction
		Savepoint sp = Database.setSavepoint();
		Boolean wasSuccessful = false;

		//set active price group based on selected tier id
		ccrz__E_Product__c selectedTier = [select Id, Name, Corresponding_Price_Group__r.Id, Number_of_Transactions__c, ccrz__SKU__c from ccrz__E_Product__c where Id = :selectedTierId][0];
	    String selectedPriceGroupId = (String)selectedTier.Corresponding_Price_Group__r.Id;
        System.debug('selectedPriceGroupId: ' + selectedPriceGroupId);

		//we'll add the tier sku to the cart in order to convert it to an opportunityproduct later
		String selectedTierSku = (String)selectedTier.ccrz__SKU__c;
		ctx.priceGroupId = selectedPriceGroupId;

		System.debug('callcontext before init: ' + ccrz.cc_CallContext.effAccountId);

		//initialize return object
		ccrz.cc_RemoteActionResult result = ccrz.cc_CallContext.init(ctx);
		System.debug('callcontext storeFrontSettings after init: ' + JSON.serialize(ccrz.cc_CallContext.storeFrontSettings));
		System.debug('callcontext currUser after init: ' + ccrz.cc_CallContext.currUser);
		//System.debug('callcontext currContact after init: ' + ccrz.cc_CallContext.currContact);
		System.debug('callcontext effAccountId after init: ' + ccrz.cc_CallContext.effAccountId);
		System.debug('callcontext currAccount after init: ' + ccrz.cc_CallContext.currAccount);
		System.debug('callcontext currAccountGroup after init: ' + ccrz.cc_CallContext.currAccountGroup);
		System.debug('callcontext priceGroup after init: ' + ccrz.cc_CallContext.priceGroup);
		System.debug('callcontext isGuest after init: ' + ccrz.cc_CallContext.isGuest);

    
		String mySelectedDynamicKitSku = dynamicKitSku;
		String mySelectedTierId = selectedTierId;
		String mySelectedBillingFrequency = selectedBillingFrequency;
		System.debug('leadInfoJSON======'+leadInfoJSON);
		Map<String,Object> myLeadInfo = (Map<String,Object>)JSON.deserializeUntyped(leadInfoJSON);
		System.debug('myLeadInfo======'+myLeadInfo);
		//will need to reinsert subprodtermid immediately before pricing
		String mySubProdTermId = '';
		//..into the cartitem for the correct product
		String myMasterProductId = '';

		//will use this for manually setting subprodterms and connectorids before price() call
		Map<String,String> productId2SubProdTermId = new Map<String,String>();
		Map<String,String> productId2ConnectorId = new Map<String,String>();

    	//create line item for dynamic kit
		ccrz.ccApiCart.LineData lineItemDk = new ccrz.ccApiCart.LineData();
		lineItemDk.quantity = 1;
		lineItemDk.sku = mySelectedDynamicKitSku;
		//temporarily store TransactionlevelId in label because ccrz.ccApiCart.LineData doesn't include TransactionLevelId; the NEW__ flag will be used (and cleared) later
		lineItemDk.label = 'NEW__' + mySelectedTierId;

		//initialize list of cccart line items
		List<ccrz.ccApiCart.LineData> lineItemsToAdd = new List<ccrz.ccApiCart.LineData>();
		
		// add the dynamic kit to list of items
		lineItemsToAdd.add(lineItemDk);
		
		List<Object> myComponentProducts = (List<Object>)JSON.deserializeUntyped(componentProducts);
		//create line item for each component product and add to list of line items to be added as a minoritem
		//first initialize minorLines property on dynamic kit lineitem
		lineItemDk.minorItems = new List<ccrz.ccApiCart.LineData>();

		//now add each of the components as minorLines
		for(Object obj : myComponentProducts) {
			//cast the generic object to a map for lookup
			//this gets us to properties 'groupName' and 'productsThisGroupOnly' (which has further subproperties, including sfid of each component product)
			Map<String,Object> tempMap = (Map<String,Object>)obj;
			if(tempMap.get('groupName') != 'Tier'){
				//this gets us to productsThisGrouponly e.g. sfid=>actualsfid, productInfo=>deeper subproperties (including sku)
				Map<String,Object> tempMapInner = (Map<String,Object>)tempMap.get('productsThisGroupOnly');
				//this gets us to productInfo
				Map<String,Object> tempMapInner2 = (Map<String,Object>)tempMapInner.get('productInfo');
				ccrz.ccApiCart.LineData tempLineItem = new ccrz.ccApiCart.LineData();
				//quantity is always 1 at least for now
				tempLineItem.quantity = (Integer)tempMapInner2.get('quantity');
				tempLineItem.sku = (String)tempMapInner2.get('SKU');
				tempLineItem.parentSku = mySelectedDynamicKitSku;
				if(tempMap.get('groupName')=='Product' || tempMap.get('groupName')=='Integrations') {
					//pick subProd TermId based on parameter passed from page ('Monthly' or 'Yearly')
					List<Object> tempListInner = (List<Object>)tempMapInner2.get('subProdTerms');
					for (Object ob : tempListInner) {
						Map<String,Object> tempMapInner3 = (Map<String,Object>)ob;
						if(tempMapInner3.get('installmentFrequencyUOM') == mySelectedBillingFrequency) {
							tempLineItem.subProdTermId = (String)tempMapInner3.get('sfid');
							//use mySubProdTermId to update cart line item before repricing
							mySubProdTermId = tempLineItem.subProdTermId;
							myMasterProductId = (String)tempMapInner.get('sfid');
							productId2SubProdTermId.put((String)tempMapInner.get('sfid'),tempLineItem.subProdTermId);
						}
					}
					//grab connector id for later
					if(tempMapInner.get('connectorId')!=null) {
						productId2ConnectorId.put((String)tempMapInner.get('sfid'),(String)tempMapInner.get('connectorId'));
					}
					//add Products as minor items, but..
					lineItemDk.minorItems.add(tempLineItem);
					//lineItemsToAdd.add(tempLineItem);
					//add Add-ons as major items
				} else if(tempMap.get('groupName')=='Add-ons') {
					lineItemsToAdd.add(tempLineItem);
				} else if(tempMap.get('groupName')=='StandAlone') {
					tempLineItem.parentSku = null;
                    tempLineItem.price = (Decimal)tempMapInner2.get('price');
                    if (tempLineItem.price == null) {
                        //tempLineItem.price = 54.0;
						CCAviPriceListManager a = new CCAviPriceListManager();
						Decimal currentQty = (Decimal)tempMapInner2.get('quantity');
						List<String> alist = new List<String>();
						String currentSku = (String)tempMapInner2.get('SKU');
						alist.add(currentSku);
						Map<String,Object> productPriceListItemTier = a.getPriceListItemTier(alist);
						List<CCAviPriceListManager.PriceListItemTier> tiers = (List<CCAviPriceListManager.PriceListItemTier>)productPriceListItemTier.get(currentSku);
						for(CCAviPriceListManager.PriceListItemTier tier: tiers){
						    if(currentQty >= (Decimal)tier.quantity){
						       //tempLineItem.price = 54.0;(tier.amount);
						       tempLineItem.price = (Decimal)tier.amount;
						    }
						}

                    }
					lineItemsToAdd.add(tempLineItem);
				}
			}
		}

		//add transaction level separately
		ccrz.ccApiCart.LineData transactionLevelLineItem = new ccrz.ccApiCart.LineData();
		transactionLevelLineItem.quantity = 1;
		transactionLevelLineItem.sku = selectedTierSku;
		transactionLevelLineItem.parentSku = mySelectedDynamicKitSku;
		lineItemDk.minorItems.add(transactionLevelLineItem);

		//now that we have an appropriate List<ccrz.ccApiCart.LineData>() ready to add -- go ahead and call the addTo
		try {
			//setup request object
			Map<String,Object> addToCartRequest = new Map<String,Object>{
	            ccrz.ccapi.API_VERSION => ccrz.ccApi.CURRENT_VERSION,
				ccrz.ccApiCart.LINE_DATA => lineItemsToAdd,
				ccrz.ccApi.SIZING => new Map<String,Object>{
					ccrz.ccApiCart.ENTITYNAME => new Map<String,Object>{
						ccrz.ccApi.SZ_REFETCH => TRUE
					}
				}
			};

			System.debug('addToCartRequest: ' + addToCartRequest);
			//actually call addTo method; returns the cart object list because we specified SZ_REFETCH=>true in request object
			Map<String,Object> newCartLineItems = ccrz.ccApiCart.addTo(addToCartRequest);
			System.debug('results of ccapicart.addto call: ' + newCartLineItems);

			//now add subprodterms to the minoritems before repricing (since ccApiCart.addTo does not add subprodterms for minoritems as of v4.6 2017-05-22)
			//our variables are mySubProdTermId and myMasterProductId
			//we need to use soql+dml because the cart has been persisted to the database
			Map<String, Object> newCartReturn = (Map<String,Object>)newCartLineItems;
			List<Object> myCartItemList = (List<Object>)newCartReturn.get('cartList');
			String myNewCartId = '';
			if(myCartItemList != null && !myCartItemList.isEmpty()) {
				Map<String,Object> myCartItemMap = (Map<String,Object>)myCartItemList[0];
				myNewCartId = (String)myCartItemMap.get('sfid');
			}

			//add subprodterm and number of transactions to every cartitem that is cartitemtype==minor and !=tier
			List<ccrz__E_CartItem__c> myCartLineItems = [select Name, ccrz__Product__c, ccrz__cartItemType__c, ccrz__SubProdTerm__c, CPQ_Quantity__c from ccrz__E_CartItem__c where ccrz__Cart__c = :myNewCartId];
			for(ccrz__E_CartItem__c ci : myCartLineItems) {
				if(ci.ccrz__cartItemType__c == 'Minor' && ci.ccrz__Product__c != mySelectedTierId) {
					ci.ccrz__SubProdTerm__c = productId2SubProdTermId.get(ci.ccrz__Product__c);
					ci.CPQ_Quantity__c = selectedTier.Number_of_Transactions__c;
					ci.Connector_Id__c = productId2ConnectorId.get(ci.ccrz__Product__c);
				}
			}
			update myCartLineItems;


			//reprice the cart so that the subprodterm price is applied
			//need this price() call in order to make sure cart reflects subscription prices (ootb, price() is called on cart page view, but we're skipping the ootb cart page)
			Map<String,Object> repriceCartRequest = new Map<String,Object>{
	            ccrz.ccapi.API_VERSION => ccrz.ccApi.CURRENT_VERSION,
				ccrz.ccApiCart.CART_ENCID => newCartLineItems.get(ccrz.ccApiCart.CART_ENCID)
			};

			Map<String,Object> repricedCart = ccrz.ccApiCart.price(repriceCartRequest);

			//now that the cart is repriced, set cccart.validationstatus manually (normally done on cart page but again we're bypassing that)
			String thisCartEncId = (String)newCartLineItems.get(ccrz.ccApiCart.CART_ENCID);
			ccrz__E_Cart__c thisCart = [select ccrz__ValidationStatus__c, Lead_Interest_Prod_Services__c, Lead_MethodContact__c, Lead_Offer__c, Lead_OpptSubType__c, Lead_Source_Most_Recent__c, Lead_WebProperty__c, Lead_Source__c from ccrz__E_Cart__c where ccrz__EncryptedId__c = :thisCartEncId][0];

			//mark cart as validated (b/c not checking for disallow anon, since anon users will always be allowed)
			thisCart.ccrz__ValidationStatus__c = 'CartAuthUserValidated';
			
			//populate lead fields on cart
			thisCart.Lead_Interest_Prod_Services__c = (String)myLeadInfo.get('Lead_Interest_Prod_Services__c');
			thisCart.Lead_MethodContact__c = (String)myLeadInfo.get('Lead_MethodContact__c');
			thisCart.Lead_Most_Recent_Conversion_Date__c = Datetime.now();
			thisCart.Lead_Offer__c = (String)myLeadInfo.get('Lead_Offer__c');
			thisCart.Lead_OpptSubType__c = (String)myLeadInfo.get('Lead_OpptSubType__c');
			thisCart.Lead_Source_Most_Recent__c = (String)myLeadInfo.get('Lead_Source_Most_Recent__c');
			thisCart.Lead_WebProperty__c = (String)myLeadInfo.get('Lead_WebProperty__c');
			thisCart.Lead_Source__c = (String)myLeadInfo.get('Lead_Source__c');
			thisCart.Lead_CampaignId__c = (String)myLeadInfo.get('Lead_CampaignId__c');
			//not populating Lead_PartnerId__c yet as per avawiki https://avalara.atlassian.net/wiki/display/MT/6+-+Lead+Creation (2017-05-15)
			//thisCart.Lead_PartnerId__c = (String)myLeadInfo.get('Lead_PartnerId__c');
			update thisCart;

			//get a list of the returned cccartitems to return
			List<Map<String, Object>> returnedCartData = (List<Map<String, Object>>)newCartLineItems.get(ccrz.ccAPICart.CART_OBJLIST);
			result.success = true;
			result.data = returnedCartData;

			wasSuccessful = (Boolean)newCartLineItems.get(ccrz.ccApi.SUCCESS);

			//now move transaction level id into the correct field
			//there's only one cart
			Map<String,Object> myCart = returnedCartData[0];
			List<Object> myCartItems = (List<Object>)myCart.get('ECartItemsS');
			String cartItemIdForTransactionLevelId = '';
			String insertedTransactionLevelId = '';

			//find the cccartitem with the just-recorded transactionlevelid
			for(Object ci : myCartItems) {
				Map<String,Object> thisCartItem = (Map<String,Object>)ci;
				if(thisCartItem.get('itemLabel') != null) {
					String labelString = (String)thisCartItem.get('itemLabel');
					if(labelString.startsWith('NEW__')) {
						cartItemIdForTransactionLevelId = (String)thisCartItem.get('sfid');
						insertedTransactionLevelId = labelString.remove('NEW__');
					}			
				}
			}

			//update that cccartitem
			ccrz__E_CartItem__c cartItemForTransactionLevelId = [select TransactionLevelId__c, ccrz__ItemLabel__c from ccrz__E_CartItem__c where Id=:cartItemIdForTransactionLevelId][0];
			cartItemForTransactionLevelId.TransactionLevelId__c = insertedTransactionLevelId;
			cartItemForTransactionLevelId.ccrz__ItemLabel__c = null;
			update cartItemForTransactionLevelId;

			//also update the cart itself with that transactionlevelid
			String myCartEncId = (String)myCart.get('encryptedId');
			ccrz__E_Cart__c myCartObject = [select Transaction_Level_Id__c from ccrz__E_Cart__c where ccrz__EncryptedId__c = :myCartEncId];
			myCartObject.Transaction_Level_Id__c = mySelectedTierId;
			update myCartObject;

		} catch(Exception e) {
			System.debug(LoggingLevel.ERROR,'ERR:Error adding to cart: ' + e.getCause() + ' at line ' + e.getLineNumber());
		}

		if(!wasSuccessful) {
			Database.rollback(sp);
		}

		return result;

	}

	@RemoteAction
	global static ccrz.cc_RemoteActionResult addContactInfoToCart(ccrz.cc_RemoteActionContext ctx, String cartEncId, String matchedContactId, String matchedLeadId, String shippingAddressJSON) {
		ccrz.cc_RemoteActionResult result = ccrz.cc_CallContext.init(ctx);

		Boolean isContactFound = false;
		Boolean isLeadFound = false;

		String cartContactId;
		String cartAccountId;

		String buyerFirstName;
		String buyerLastName;
		String buyerEmail;
		String buyerPhone;
		String buyerCompanyName;

		//if we get a matched contact from the page, then populate buyer info with that

		if(matchedContactId.length()>0) {
			Contact matchedContact = [select Id, AccountId, FirstName, LastName, Email, Phone, Account.Name from Contact where Id = :matchedContactId];
			cartContactId = matchedContact.Id;
			cartAccountId = matchedContact.AccountId;
			buyerFirstName = matchedContact.FirstName;
			buyerLastName = matchedContact.LastName;
			buyerEmail = matchedContact.Email;
			buyerPhone = matchedContact.Phone;
			buyerCompanyName = matchedContact.Account.Name;
			isContactFound = true;
		System.debug('matchedContact: ' + matchedContact);
		}
		System.debug('buyerEmail after contact check and before lead check: ' + buyerEmail);
		//if we get a matched lead from the page, then populate buyer info with that
		//(note: even if there exists both a matched contact and a matched lead, the page should send only matched contact XOR matched lead to this method; preference in case of matched lead and matched contact is set in the matchEmail method called by the page earlier)
		if(matchedLeadId.length()>0) {
			Lead matchedLead = [select Id, FirstName, LastName, Email, Phone, Company from Lead where Id=:matchedLeadId];
			Database.LeadConvert lc = new Database.LeadConvert();
			lc.setLeadId(matchedLead.Id);
			LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
			lc.setConvertedStatus(convertStatus.MasterLabel);
			lc.setDoNotCreateOpportunity(true);
			lc.setOwnerId(UserInfo.getUserId());
			try {
				Database.LeadConvertResult lcr = Database.convertLead(lc);
				cartContactId = lcr.getContactId();
				cartAccountId = lcr.getAccountId();
				isLeadFound = true;
			} catch (Exception e) {
				System.debug(LoggingLevel.ERROR,'ERR:Error attempting to convert matched lead: ' + e.getCause() + ' at line ' + e.getLineNumber());
			}
			buyerFirstName = matchedLead.FirstName;
			buyerLastName = matchedLead.LastName;
			buyerEmail = matchedLead.Email;
			buyerPhone = matchedLead.Phone;
			buyerCompanyName = matchedLead.Company;
		System.debug('matchedLead: ' + matchedLead);
		}
		System.debug('buyerEmail after contact check and after lead check: ' + buyerEmail);
		//update cart with contact and account info
		ccrz__E_Cart__c thisCart = [select ccrz__Contact__c, ccrz__Account__c, addContact__c, ccrz__EncryptedId__c from ccrz__E_Cart__c where ccrz__EncryptedId__c = :cartEncId][0];
		//if no matched contact or lead, then cartContactId and cartAccountId will both be null; also addContact__c will be null (more robust since persisted)
		//if addContact__c is false, then we already have the contact and account info we need
		Map<String,Object> newContactAndAccountInfo = (Map<String,Object>)JSON.deserializeUntyped(shippingAddressJSON);
        String street = (String)newContactAndAccountInfo.get('Address1');
        if (newContactAndAccountInfo.get('Address2') != null) {
            street += ' ' + (String)newContactAndAccountInfo.get('Address2');
        }
		if(!thisCart.addContact__c) {
			thisCart.ccrz__Contact__c = cartContactId;
			thisCart.ccrz__Account__c = cartAccountId;
			//update null contact address fields -- shipping/other only (billing will be updated in placeOrder)
			try {
				Contact thisContact = [select Id, Name, OtherStreet, OtherCity, OtherState, OtherCountry, OtherPostalCode, MailingStreet, MailingCountry, MailingState, MailingCity, MailingPostalCode from Contact where Id = :cartContactId][0];
				if(thisContact.OtherStreet==null && thisContact.OtherStreet==null) {
					thisContact.OtherStreet = street;
					thisContact.OtherCity = (String)newContactAndAccountInfo.get('City');
					thisContact.OtherState = (String)newContactAndAccountInfo.get('Region');
					thisContact.OtherPostalCode = (String)newContactAndAccountInfo.get('PostalCode');
					thisContact.OtherCountry = (String)newContactAndAccountInfo.get('Country');
				}
				update thisContact;
			} catch (Exception e) {
				System.debug(LoggingLevel.ERROR,'ERR:Error updating matched contact with new otheraddress info: ' + e.getCause() + ' at line ' + e.getLineNumber());				
			}

		} else { //if addContact__c is true, then we need to create a new contact and account based on shippingAddressJSON
			Account newAccount = new Account(
				Name = (String)newContactAndAccountInfo.get('Company'),
				//format this properly
        ShippingStreet = street,
				ShippingCity = (String)newContactAndAccountInfo.get('City'),
				ShippingState = (String)newContactAndAccountInfo.get('Region'),
				ShippingPostalCode = (String)newContactAndAccountInfo.get('PostalCode'),
				ShippingCountry = (String)newContactAndAccountInfo.get('Country')
			);
			try {
				insert newAccount;
			} catch (Exception e) {
				System.debug(LoggingLevel.ERROR,'ERR:Error inserting new account: ' + e.getCause() + ' at line ' + e.getLineNumber());				
			}

			//assuming the new account has been created, create a new contact and link with that account
			Contact newContact = new Contact(
				AccountId = newAccount.Id,
				FirstName = (String)newContactAndAccountInfo.get('FirstName'),
				LastName = (String)newContactAndAccountInfo.get('LastName'),
				Email = (String)newContactAndAccountInfo.get('Email'),
				Phone = (String)newContactAndAccountInfo.get('Phone'),
				OtherStreet = street,
				OtherCity = (String)newContactAndAccountInfo.get('City'),
				OtherState = (String)newContactAndAccountInfo.get('Region'),
				OtherPostalCode = (String)newContactAndAccountInfo.get('PostalCode'),
				OtherCountry = (String)newContactAndAccountInfo.get('Country')
			);
			try {
				insert newContact;				
			} catch (Exception e) {
				System.debug(LoggingLevel.ERROR,'ERR:Error inserting new contact: ' + e.getCause() + ' at line ' + e.getLineNumber());							
			}

			thisCart.ccrz__Contact__c = newContact.Id;
			thisCart.ccrz__Account__c = newAccount.Id;

			System.debug('buyerEmail before looking at new contact and account info: ' + buyerEmail);

			//since we don't have any existing contact or lead in this else block, we won't have already populated buyerInfo
			//so now we need to populate buyer info based on shippingAddressJSON passed by the page
			buyerFirstName = (String)newContactAndAccountInfo.get('FirstName');
			buyerLastName = (String)newContactAndAccountInfo.get('LastName');
			buyerEmail = (String)newContactAndAccountInfo.get('Email');
			buyerPhone = (String)newContactAndAccountInfo.get('Phone');
			buyerCompanyName = (String)newContactAndAccountInfo.get('Company');
		}

		//in any case, create new cccontactaddress and assign to cart.shipto
		thisCart.ccrz__ShipTo__c = createContactAddress(shippingAddressJSON);
		//also add buyer info
		System.debug('buyerEmail right before updating cart: ' + buyerEmail);
		System.debug('this cart to update: ' + thisCart.ccrz__EncryptedId__c);
		thisCart.ccrz__BuyerFirstName__c = buyerFirstName;
		thisCart.ccrz__BuyerLastName__c = buyerLastName;
		thisCart.ccrz__BuyerEmail__c = buyerEmail;
		thisCart.ccrz__BuyerCompanyName__c = buyerCompanyName;
		thisCart.ccrz__BuyerPhone__c = buyerPhone;
		try {
			update thisCart;
			System.debug('new thisCart in configflow: ' + thisCart);
		} catch (Exception e) {
			System.debug(LoggingLevel.ERROR,'ERR:Error updating cart with buyer and shipping info: ' + e.getCause() + ' at line ' + e.getLineNumber());										
		}

		result.success = true;
		result.data = 'updated contact info in cart appropriately';

		return result;
	}

	@RemoteAction
	global static ccrz.cc_RemoteActionResult placeOrder(ccrz.cc_RemoteActionContext ctx, String cartEncId, String priceGroupId, String billingAddressJSON, String paymentToken) {
		//2017-05-22 NOTE currently tested only with placeholder paymentToken, but if page is calling this method correctly then shouldn't make a difference

		//set pricegroup from page
		ctx.priceGroupId = priceGroupId;

		//initialize return object
		ccrz.cc_RemoteActionResult result = ccrz.cc_CallContext.init(ctx);
		/* need to use cc_CallContext.currPageParameters to store payment token because we need paymentToken in order hook 
		(because ccorder needs to have payment token populated before insert),
		cc_CallContext is available in order hook,
		and cc_CallContext.currPageParameters is the only property of cc_CallContext that accepts arbitrary data
		*/
		ccrz.cc_CallContext.currPageParameters.put('paymentToken',paymentToken);

		String myEncCartId = cartEncId;

		//populate cart.billto
		ccrz__E_Cart__c thisCart = [select ccrz__Contact__c, ccrz__Account__c, addContact__c, ccrz__BillTo__c from ccrz__E_Cart__c where ccrz__EncryptedId__c = :myEncCartId][0];
		String myContactId = thisCart.ccrz__Contact__c;
		thisCart.ccrz__BillTo__c = createContactAddress(billingAddressJSON);

		try {
			update thisCart;
		} catch (Exception e) {
			System.debug(LoggingLevel.ERROR,'ERR:Error adding billing address to cart: ' + e.getCause() + ' at line ' + e.getLineNumber());	
		}
		//update associated contact if address fields null -- billing/mailing address only
		try {
			Map<String,Object> myBillingAddress = (Map<String,Object>)JSON.deserializeUntyped(billingAddressJSON);
			Contact thisContact = [select Id, Name, OtherStreet, OtherCity, OtherState, OtherCountry, OtherPostalCode, MailingStreet, MailingCountry, MailingState, MailingCity, MailingPostalCode,	Authorized_Identity_Contact__c from Contact where Id = :myContactId][0];
				thisContact.Authorized_Identity_Contact__c=true;
			if(thisContact.MailingStreet==null && thisContact.MailingStreet==null) {
				thisContact.MailingStreet = (String)myBillingAddress.get('Address1') + ' ' + (String)myBillingAddress.get('Address2');
				thisContact.MailingCity = (String)myBillingAddress.get('City');
				thisContact.MailingState = (String)myBillingAddress.get('Region');
				thisContact.MailingPostalCode = (String)myBillingAddress.get('PostalCode');
				thisContact.MailingCountry = (String)myBillingAddress.get('Country');
			}
			update thisContact;
		} catch (Exception e) {
			System.debug(LoggingLevel.ERROR,'ERR:Error updating matched contact with new billing address info: ' + e.getCause() + ' at line ' + e.getLineNumber());				
		}


		Map<String,Object> placeOrderRequest = new Map<String,Object>{
		    ccrz.ccapi.API_VERSION => ccrz.ccApi.CURRENT_VERSION,
			ccrz.ccApiCart.CART_ENCID => myEncCartId
			//ccApiCart.PAYMENTDATA => ,
			//ccApiCart.TRANSPAYMENTDATA => ,
			//ccApiCart.PAYMENTRESULT => 
		};
		System.debug('placeorder request object: ' + placeOrderRequest);

		try {

			result.success = false;

			Map<String,Object> placedOrder = ccrz.ccApiCart.place(placeOrderRequest);
			System.debug('placedOrder: ' +  placedOrder);

			if(placedOrder.get('success')==true) {
				
				result.success = true;


				/*2017-05-05 THIS FUNCTIONALITY HAS BEEN MOVED TO cc_hk_OrderAva SO THAT TRIGGERS ON ORDERITEM AFTER INSERT WILL HAVE VALUES THEY NEED; LEAVING CODE HERE UNTIL INTEGRATION TESTING COMPLETE

				//now update ccorderitem.subprodterms AND ccorderitem.cpqquantity
				//both of these pieces of information are on cccartitems
				//we can get from ccorderitem->ccorder-[ccoriginatingcart]->cccart->cccartitem.product<->ccorderitem.product

				//need to soql for cpqquantity field since not in return anyway
				List<ccrz__E_OrderItem__c> itemsJustOrdered = [select ccrz__Order__r.ccrz__OriginatedCart__c, ccrz__Product__c, ccrz__Product__r.Name, ccrz__Product__r.ccrz__SKU__c, ccrz__SubProdTerm__c, CPQ_Quantity__c from ccrz__E_OrderItem__c where ccrz__Order__c = :justPlacedOrderId];
				//all order items have the same originating cart so ok to grab the first one
				String cartOriginatingJustPlacedOrder = itemsJustOrdered[0].ccrz__Order__r.ccrz__OriginatedCart__c;
				//grab all cccartitems from that cart with their subprodterm and cpqquantity
				List<ccrz__E_CartItem__c> myCartItems = [select ccrz__SubProdTerm__c, CPQ_Quantity__c, ccrz__Product__c from ccrz__E_CartItem__c where ccrz__Cart__c = :cartOriginatingJustPlacedOrder];
				
					//now create a map from each cart item product to its corresponding subprodterm and another to cpq quantity
					//it might be better to do this in a bean but this is so simple it may be easier to just be flexible
					//Map<String,String> product2SubProdTerm = new Map<String,String>();
					//Map<String,Decimal> product2CPQQuantity = new Map<String,Decimal>();
					////grab product->subprodterm (so we can look this up and cpq quantity in one loop
					////cpq quantity is the same for all cartitems in the same cart because tier is atomic per cart, so just grab cpq quantity from any cccartitem with a nonnull cpqquantity
					//for(ccrz__E_CartItem__c ci : myCartItems) {
					//	product2SubProdTerm.put(ci.ccrz__Product__c,ci.ccrz__SubProdTerm__c);
					//	product2CPQQuantity.put(ci.ccrz__Product__c,ci.CPQ_Quantity__c);

					//}
					//System.debug('WHAT DOES OUR MAP FROM PRODUCT TO SUBPDOTERM LOOK LIKE NOW ' + product2SubProdTerm);

					////now add subprodterms and number of transactions to the correct ccorderitems
					//for(ccrz__E_OrderItem__c oi : itemsJustOrdered) {
					//	oi.ccrz__SubProdTerm__c = product2SubProdTerm.get(oi.ccrz__Product__c);
					//	oi.CPQ_Quantity__c = product2CPQQuantity.get(oi.ccrz__Product__c);
					//}

					//System.debug('AND NOW HOW DOES OUR UPDATED COLLECTION OF ORDERITEMS LOOK ' + itemsJustOrdered);

					//update itemsJustOrdered;
				*/

				//now manipulate the confirmation url so that confirmation page knows which items were ordered
				String justPlacedOrderId = (String)placedOrder.get('orderId');
				ccrz__E_Order__c myOrder = [select Id, ccrz__EncryptedId__c, ccrz__BuyerEmail__c, ccrz__CCEmailAddress__c from ccrz__E_Order__c where Id = :justPlacedOrderId];
				List<ccrz__E_OrderItem__c> itemsJustOrdered = [select ccrz__Order__r.ccrz__OriginatedCart__c, ccrz__Product__c, ccrz__Product__r.Name, ccrz__Product__r.ccrz__SKU__c, ccrz__SubProdTerm__c, CPQ_Quantity__c from ccrz__E_OrderItem__c where ccrz__Order__c = :justPlacedOrderId];
				System.debug('myOrder: ' + myOrder);
				System.debug('itemsJustOrdered: ' + itemsJustOrdered);

				ccrz.cc_hk_Order myOrderHook = new ccrz.cc_hk_Order();

				System.debug('myOrderHook just before placeTarget: ' + myOrderHook);
				System.debug('myEncCartId just before placeTarget: ' + myEncCartId);
				System.debug('myOrder just before placeTarget: ' + myOrder);
				Map<String,Object> myPlaceTarget = myOrderHook.placeTarget(new Map<String,Object>{
					ccrz.cc_hk_Order.PARAM_ENC_CART_ID => myEncCartId,
					ccrz.cc_hk_Order.PARAM_ORDER => myOrder
				});
				System.debug('myPlaceTarget: ' + myPlaceTarget);

				List<String> myParameterList = new List<String>();
				for(ccrz__E_OrderItem__c i : itemsJustOrdered) {
					String tempString = i.ccrz__Product__r.ccrz__SKU__c;
					myParameterList.add(tempString);
				}
				System.debug('myParameterList: ' + myParameterList);

				String myParameter = String.join(myParameterList,',');

				System.debug('ccrz.cc_hk_Order.PARAM_PLACE_TARGET: ' + ccrz.cc_hk_Order.PARAM_PLACE_TARGET);
				String newConfirmationURL = (String)myPlaceTarget.get(ccrz.cc_hk_Order.PARAM_PLACE_TARGET);
				System.debug('newConfirmationURL: ' + newConfirmationURL);

				if(String.isNotBlank(newConfirmationURL)){
					result.data = new Map<String,Object>{
						'placedOrder' => placedOrder,
						'orderId' => myOrder.ccrz__EncryptedId__c,
						'buyerEmail' => myOrder.ccrz__BuyerEmail__c,
						'placeURL' => newConfirmationURL,
						'parameterName' => 'productsOrdered',
						'parameterList' => myParameter
					};
				} else {
					result.data = 'error generating confirmation url ' + placedOrder;
				}

			}
		} catch (Exception e) {
			result.success = false;
			System.debug(LoggingLevel.ERROR,'ERR:Error placing order: ' + e.getCause() + ' at line ' + e.getLineNumber() + ' with stack trace ' + e.getStackTraceString());
		}

		return result;
	}

	//2017-05-22 DEPRECATE removeItemFromCart AND REMOVE CODE ONCE DECISION FINAL
	@RemoteAction
	global static ccrz.cc_RemoteActionResult removeItemFromCart(ccrz.cc_RemoteActionContext ctx, String cartEncId, String itemToRemoveId) {

		ccrz.cc_RemoteActionResult result = ccrz.cc_CallContext.init(ctx);

		String myCartEncId = cartEncId;
		String myItemToRemoveId = itemToRemoveId;

		List<ccrz.ccApiCart.LineData> itemsToRemove = new List<ccrz.ccApiCart.LineData>();
		ccrz.ccApiCart.LineData itemToRemove = new ccrz.ccApiCart.LineData();
		itemToRemove.sfid = myItemToRemoveId;
		itemsToRemove.add(itemToRemove);

		Map<String,Object> removeRequest = new Map<String,Object>{
            ccrz.ccapi.API_VERSION => ccrz.ccApi.CURRENT_VERSION,
			ccrz.ccApiCart.CART_ENCID => myCartEncId,
			ccrz.ccApiCart.LINE_DATA => itemsToRemove
		};

		System.debug('and here is the removeFrom request object ' + removeRequest);

		try {
			Map<String,Object> removeResponse = ccrz.ccApiCart.removeFrom(removeRequest);

			//removeItem blanks out the cart.validationstatus, so need to reset that in order to place order
			String thisCartEncId = (String)removeResponse.get(ccrz.ccApiCart.CART_ENCID);
			ccrz__E_Cart__c thisCart = [select ccrz__ValidationStatus__c from ccrz__E_Cart__c where ccrz__EncryptedId__c = :thisCartEncId][0];

			//mark cart as validated (b/c not checking for disallow anon)
			thisCart.ccrz__ValidationStatus__c = 'CartAuthUserValidated';
			update thisCart;

			result.data = removeResponse;
			result.success = true;
		} catch (Exception e) {
			result.success = false;
			System.debug(LoggingLevel.ERROR,'ERR:Error removing item from cart: ' + e.getCause() + ' at line ' + e.getLineNumber());
		}
		return result;
	}

	@RemoteAction
	global static ccrz.cc_RemoteActionResult removeCart(ccrz.cc_RemoteActionContext ctx, String cartEncId) {

		Savepoint sp = Database.setSavepoint();
		Boolean wasSuccessful = false;

		ccrz.cc_RemoteActionResult result = ccrz.cc_CallContext.init(ctx);
		result.success = false;
		String myCartEncId = cartEncId;
		Map<String,Object> removeRequest = new Map<String,Object>{
			ccrz.ccapi.API_VERSION => ccrz.ccApi.CURRENT_VERSION,
			ccrz.ccApiCart.CART_ENCID => myCartEncId
		};

		try {
			Map<String,Object> removeResult = ccrz.ccApiCart.removeCart(removeRequest);
			wasSuccessful = (Boolean)removeResult.get(ccrz.ccApi.SUCCESS);
			system.debug('was remove cart successful? ' + wasSuccessful);
			system.debug('entire return from apicart.removecart:' + removeResult);
			result.success = wasSuccessful;

		} catch (Exception e) {
			result.success = false;
			System.debug(LoggingLevel.ERROR,'ERR:Error removing cart: ' + e.getCause() + ' at line ' + e.getLineNumber());	
		}

		if(!wasSuccessful) {
			Database.rollback(sp);
		}

		return result;
 
	}

	// The remote method call for fetch Tierd pricing from product SKU ID 

	@RemoteAction
	global static ccrz.cc_RemoteActionResult fetchProductsTieredPricing(ccrz.cc_RemoteActionContext ctx, List<String> productSkus){
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
        try{

   			Map<String, Object> productData = ccrz.ccApiProduct.fetch(productsToFetch);
			List<Map<String, Object>> productList = (List<Map<String, Object>>) productData.get(ccrz.ccAPIProduct.PRODUCTLIST);
			CCAviPriceListManager a = new CCAviPriceListManager();
			Map<String,Object> productPriceListItemTier = a.getPriceListItemTier(productSkus);
			for(Map<String, Object> someProduct : productList) {
			    String sku = String.valueOf(someProduct.get('SKU'));
			    if(productPriceListItemTier.containsKey(sku)){
			        someProduct.put('tierPricingInfo',productPriceListItemTier.get(sku));
			        System.debug(someProduct.get('tierPricingInfo'));
			    }    
			}
			result.data = productList;
			result.success = true;

        } catch (Exception e) {
        	result.success = false;
        	System.debug('error: ' + e + ' at line ' + e.getLineNumber() + ' with stack trace ' + e.getStackTraceString());
        }

        return result;

	}


	//begin helper methods

	/*reason for limit 1 is avalara business decision (confirmed by aaron zapf and lauren elliot):
	if multiple leads or contacts match user-input email address, then use the first record returned
	(should be extremely rare) (2017-05-22)
	*/
	public static List<Lead> leadsMatched(String emailAddress) {
		List<Lead> matchedLeads = [select Id from Lead where isConverted = false and Email = :emailAddress limit 1];
		return matchedLeads;
	}

	public static List<Contact> contactsMatched(String emailAddress) {
		List<Contact> matchedContacts = [select Id, Account.ActiveCustomer__c from Contact where Email = :emailAddress limit 1];
		return matchedContacts;
	}

	//if in the future we decide to use more complex criteria to check for active customer status, then we may need to return more Account fields in soql query that results in matchedContacts parameter
	public static Boolean isActiveCustomer(List<Contact> matchedContacts) {
		Boolean isMatched = false;
		for(Contact c : matchedContacts) {
			if(c.Account.ActiveCustomer__c==true) {
				isMatched = true;
			}
		}
		return isMatched;
	}

	//include no field requirements here; field requirements should be set only in browser and in database (i.e. endpoints)
	public static String createContactAddress(String shippingAddressJSON) {
		Map<String,Object> myShippingAddress = (Map<String,Object>)JSON.deserializeUntyped(shippingAddressJSON);
		ccrz__E_ContactAddr__c contactAddrShipTo = new ccrz__E_ContactAddr__c(
			ccrz__FirstName__c = (String)myShippingAddress.get('FirstName'),
			ccrz__LastName__c = (String)myShippingAddress.get('LastName'),
			ccrz__CompanyName__c = (String)myShippingAddress.get('Company'),
			ccrz__AddressFirstline__c = (String)myShippingAddress.get('Address1'),
			ccrz__AddressSecondline__c = (String)myShippingAddress.get('Address2'),
			ccrz__City__c = (String)myShippingAddress.get('City'),
			ccrz__Country__c = (String)myShippingAddress.get('Country'),
			ccrz__StateISOCode__c = (String)myShippingAddress.get('Region'),
			ccrz__State__c = (String)myShippingAddress.get('Region'),
			ccrz__PostalCode__c = (String)myShippingAddress.get('PostalCode'),
			ccrz__Email__c = (String)myShippingAddress.get('Email'),
			ccrz__DaytimePhone__c = (String)myShippingAddress.get('Phone')
		);
		try {
			insert contactAddrShipTo;
			return contactAddrShipTo.Id;
		} catch (Exception e) {
			System.debug(LoggingLevel.ERROR,'ERR:Error creating CCContactAddress: ' + e.getCause() + ' at line ' + e.getLineNumber());
			return 'no contact address';
		}
	}


}