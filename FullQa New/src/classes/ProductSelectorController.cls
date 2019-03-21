public with sharing class ProductSelectorController {
  //used to ficilitate edititing of tiers
  //public class ChargeHolder{
  //  public Integer id{
  //    get;
  //    set;
  //  }
  //  public boolean editMode{
  //    get{
  //      if(editMode == null){
  //        editMode = false;
  //      }
  //      return editMode;
  //    }
  //    set;
  //  }
  //  public zqu.zCharge charge{
  //    get;
  //    set;
  //  }
  //}
  //used to facilitate editing the chargeGroups
  public class ChargeGroupHolder {

    public Integer id {
      get;
      set;
    }
    public zqu.zChargeGroup chargeGroup {
      get;
      set;
    }
    public string display{
      get;
      set;
    }
    public boolean hasBeenUpdated{
      get{
        if(hasBeenUpdated == null){
          hasBeenUpdated = false;
        }
        return hasBeenUpdated;
      }
      set;
    }
    public Map<string, List<zqu.zCharge>> chargeGroupZIdToChargesMap{
      get{
        if( chargeGroupZIdToChargesMap == null ){
          chargeGroupZIdToChargesMap = new Map<string, List<zqu.zCharge>>();
        }
        return chargeGroupZIdToChargesMap;
      }
      set;
    }
    public List<zqu.zChargeGroup> chargeGroups {
      get{
        if( chargeGroups == null ){
          chargeGroups = new List<zqu.zChargeGroup>();
        }
        return chargeGroups;
      }
      set;
    }
    public List<zqu.zCharge> allCharges{
      get{
        List<zqu.zCharge> output = new List<zqu.zCharge>();
        for(zqu.zChargeGroup cg : chargeGroups){
          output.addAll( cg.zCharges );
        }
        return output;
      }
    }
    public List<Boolean> tiersToEdit{
      get{
        if(tiersToEdit == null){
          tiersToEdit = new List<Boolean>();
        }
        return tiersToEdit;
      }
      set;
    }

  }
  // ------------------------------------------------------------------------
  // --- Constants ---
  // ------------------------------------------------------------------------
  /* Page size for the table with the rate plans */
  public static final Integer PAGE_SIZE = 25;
  /* Select list option for nothing selected */
  public static final String NONE = '-- none --';
  /* */ 
  public static final String TRUESTR = 'True';
  public static final String FALSESTR = 'False';
  // ------------------------------------------------------------------------
  // --- Public VF Attributes ---
  // ------------------------------------------------------------------------
  public List < ChargeGroupHolder > cghList {
    get {
      if (cghList == null) {
        cghList = new List < ChargeGroupHolder > ();
      }
      return cghList;
    }
    set;
  }
  /* Indicate that we successfully loaded the context */
  public Boolean initSuccess {
    get;
    set;
  }
  /* The opportunity context */
  public Opportunity opportunity {
    get;
    set;
  }
  /* List of available customer account(s) that can subscribe */
  public List < zqu__productRatePlan__c > productRatePlanList {
    get;
    set;
  }
  /* Same, but as a map so we can display the selected account */
  public Map < ID, zqu__productRatePlan__c > productRatePlanMap {
    get;
    set;
  }
  /* Standard set controller for the list of product rate plan(s) */
  public ApexPages.StandardSetController productRatePlanSet {
    get {
      if (productRatePlanSet == null) {
        productRatePlanSet = new ApexPages.StandardSetController(new List < zqu__ProductRatePlan__c > ());
      }
      return productRatePlanSet;
    }
    set;
  }
  /* Page size for the subscriber set */
  public Integer productRatePlanSetPageSize {
    get {
      return productRatePlanSet.getPageSize();
    }
    set;
  }
  /* Page number for the subscriber set */
  public Integer productRatePlanSetPageNumber {
    get {
      return productRatePlanSet.getPageNumber();
    }
    set;
  }
  /* Maximum page in the current set */
  public Integer productRatePlanSetMaxPage {
    get {
      return productRatePlanSet.getResultSize() / productRatePlanSet.getPageSize() + 1;
    }
    set;
  }
  /* Result size for the subscriber set */
  public Integer productRatePlanSetResultSize {
    get {
      return productRatePlanSet.getResultSize();
    }
    set;
  }
  /* Boolean to indicate if the subscriber set has next page */
  public Boolean productRatePlanSetHasNext {
    get {
      return productRatePlanSet.getHasNext();
    }
    set;
  }
  /* Boolean to indicate if the subscriber set has previous page */
  public Boolean productRatePlanSetHasPrevious {
    get {
      return productRatePlanSet.getHasPrevious();
    }
    set;
  }
  /* The record for the current page in the set */
  public List < zqu__productRatePlan__c > productRatePlanSetRecords {
    get {
      return productRatePlanSet.getRecords();
    }
    set;
  }
  /* Map that persists the state for the list of billing account (selected/unselected) */
  public Map < ID, Boolean > selectedproductRatePlanMap {
    get;
    set;
  }
  /* Set of selected subscriber billing account(s) */
  public Set < zqu__productRatePlan__c > selectedproductRatePlanSet {
    get;
    set;
  }
  /* Same but as a list, for the VF display */
  public List < zqu__productRatePlan__c > selectedproductRatePlanList {
    get {
      selectedproductRatePlanList = new List < zqu__productRatePlan__c > (selectedproductRatePlanSet);
      selectedproductRatePlanList.sort();
      return selectedproductRatePlanList;
    }
    set;
  }
  /* Customer account that fired the checkbox event */
  public String selectedproductRatePlan {
    get;
    set;
  }
  /* Total count of selected subscribers */
  public Integer selectedproductRatePlanCount {
    get;
    set;
  }
  /* The quote to create */
  public zqu__Quote__c quote {
    get;
    set;
  }
  /* The search text (for subscriber) */
  public String productRatePlanSearchText {
    get;
    set;
  }
  public zqu.LookupComponentOptions optionsForProductLookup {
    get;
    set;
  }
  public ProductLookupController plc {
    get;
    set;
  }
  public boolean productSelected {
    get {
      if (productSelected == null) {
        productSelected = false;
      }
      return productSelected;
    }
    set;
  }
  public boolean showExistingCharges {
    get {
      if (showExistingCharges == null) {
        showExistingCharges = false;
      }
      return showExistingCharges;
    }
    set;
  }
  public String selectedProductId {
    get;
    set;
  }
  public String selectedProductName {
    get;
    set;
  }
  public boolean productRatePlanSelected {
    get {
      if (productRatePlanSelected == null) {
        productRatePlanSelected = false;
      }
      return productRatePlanSelected;
    }
    set;
  }
  public String selectedPriceSchedule {
    get;
    set;
  }
  public String pickedPriceSchedule {
    get;
    set;
  }
  public boolean showRatePlans {
    get {
      if (showRatePlans == null) {
        showRatePlans = false;
      }
      return showRatePlans;
    }
    set;
  }
  public List < zqu.zChargeGroup > ratePlanChargeGroups {
    get {
      if (ratePlanChargeGroups == null) {
        ratePlanChargeGroups = new List < zqu.zChargeGroup > ();
      }
      return ratePlanChargeGroups;
    }
    set;
  }
  public List < SelectOption > priceScheduleValues {
    get {
      if (priceScheduleValues == null) {
        priceScheduleValues = new List < SelectOption > ();
      }
      return priceScheduleValues;
    }
    set;
  }
  public List < string > uniquePriceSchedules {
    get {
      if (uniquePriceSchedules == null) {
        uniquePriceSchedules = new List < string > ();
      }
      return uniquePriceSchedules;
    }
    set;
  }
  public List < SelectOption > addOnConnectorValues {
    get {
      if (addOnConnectorValues == null) {
        addOnConnectorValues = new List < SelectOption > ();
        addOnConnectorValues.add(new SelectOption(NONE, NONE));
        addOnConnectorValues.add(new SelectOption('TRUE', 'True'));
        addOnConnectorValues.add(new SelectOption('FALSE', 'False'));
      }
      return addOnConnectorValues;
    }
    set;
  }
  public String pickedAddOnConnector {
    get;
    set;
  }
  public String selectedAddOnConnector {
    get;
    set;
  }
  public List < Connector__c > matchingConnectors {
    get {
      if (matchingConnectors == null) {
        matchingConnectors = new List < Connector__c > ();
      }
      return matchingConnectors;
    }
    set;
  }
  public List < SelectOption > availableConnectorValues {
    get {
      if (availableConnectorValues == null) {
        availableConnectorValues = new List < SelectOption > ();
      }
      return availableConnectorValues;
    }
    set;
  }
  public String selectedConnector {
    get;
    set;
  }
  public String pickedConnector {
    get;
    set;
  }
  public boolean showConnectors {
    get {
      if (showConnectors == null) {
        showConnectors = false;
      }
      return showConnectors;
    }
    set;
  }
  public boolean showPriceSchedules {
    get {
      if (showPriceSchedules == null) {
        showPriceSchedules = false;
      }
      return showPriceSchedules;
    }
    set;
  }

  public List < SelectOption > serviceLevelValues {
    get {
      if (serviceLevelValues == null) {
        serviceLevelValues = new List < SelectOption > ();
        serviceLevelValues.add(new SelectOption(NONE, NONE));
        serviceLevelValues.add(new SelectOption('Pro', 'Pro'));
        serviceLevelValues.add(new SelectOption('Basic', 'Basic'));
      }
      return serviceLevelValues;
    }
    set;
  }

  public String pickedServiceLevel {
    get;
    set;
  }
  public String selectedServiceLevel {
    get;
    set;
  }
  public String selectedChargeGroupId {
    get;
    set;
  }
  public List < ChargeGroupHolder > existingChargeGroupHolders {
    get {
      if (existingChargeGroupHolders == null) {
        existingChargeGroupHolders = new List < ChargeGroupHolder > ();
      }
      return existingChargeGroupHolders;
    }
    set;
  }
  public boolean showServiceLevel{
    get{
      if(showServiceLevel == null){
        showServiceLevel = true;
      }
      return showServiceLevel;
    }
    set;
  }
  
  public zqu.NotificationOptions notificationOptions {
    get;
    set;
  }

  public string pickedTransactionTier{
    get;
    set;
  }

  public string selectedTransactionTier{
    get;
    set;
  }

  public List < SelectOption > transactionTierValues {
    get {
      if (transactionTierValues == null) {
        transactionTierValues = new List < SelectOption > ();
        //transactionTierValues.add(new SelectOption(NONE, NONE));
        //transactionTierValues.add(new SelectOption('TT1', 'TT1'));
        //transactionTierValues.add(new SelectOption('TT2', 'TT2'));
      }
      return transactionTierValues;
    }
    set;
  }

  public String selectedChargeProductId{
    get;
    set;
  }

  public String selectedTierChargeGroupId{
    get;
    set;
  }

  public String selectedTier{
    get;
    set;
  }

  // ------------------------------------------------------------------------
  // --- Private Attributes ---
  // ------------------------------------------------------------------------
  private List < zqu.zChargeGroup > existingChargeGroups;
  private List<zqu.zChargeGroup> getExistingChargeGroups(){
    if (existingChargeGroups == null) {
      existingChargeGroups = new List < zqu.zChargeGroup > ();
    }
    return existingChargeGroups;
  }
  /*
  private List < zqu.zChargeGroup > existingChargeGroups {
    get {
      if (existingChargeGroups == null) {
        existingChargeGroups = new List < zqu.zChargeGroup > ();
      }
      return existingChargeGroups;
    }
    set;
  }
  */
  private List<zqu.zChargeGroup> existingChargeGroupsToShow{
    get{
      if(existingChargeGroupsToShow == null){
        existingChargeGroupsToShow = new List<zqu.zChargeGroup>();
      }
      return existingChargeGroupsToShow;
    }
    set;
  }

  private List<zqu.zChargeGroup> existingChargeGroupsToHide{
    get{
      if(existingChargeGroupsToHide == null){
        existingChargeGroupsToHide = new List<zqu.zChargeGroup>();
      }
      return existingChargeGroupsToHide;
    }
    set;
  }
  /* The controller passed in parameter */
  private ApexPages.StandardController controller;

  private String quoteId {
    get;
    set;
  }
  private List < string > connectorProductNames {
    get;
    set;
  }
  private Map < Id, Connector__c > connectorMap{
    get{
      if(connectorMap == null){
        connectorMap = new Map<Id, Connector__c>();
      }
      return connectorMap;
    }
    set;
  }

  private integer wrapperIdCounter {
    get {
      if (wrapperIdCounter == null) {
        wrapperIdCounter = 0;
      }
      return wrapperIdCounter;
    }
    set;
  }
  public Map < Integer, ChargeGroupHolder > chargeGroupHolderMap {
    get {
      if (chargeGroupHolderMap == null) {
        chargeGroupHolderMap = new Map < Integer, ChargeGroupHolder > ();
      }
      return chargeGroupHolderMap;
    }
    set;
  }
  private Map<String, zqu__ProductRatePlan__c> productRatePlanZuoraIdMap{
    get{
      if(productRatePlanZuoraIdMap == null){
        productRatePlanZuoraIdMap = new Map<String, zqu__ProductRatePlan__c>();
      }
      return productRatePlanZuoraIdMap;
    }
    set;
  }

  public Set<String> quoteChargeCustomFields{
    get{
      if(quoteChargeCustomFields == null){
        quoteChargeCustomFields = new Set<String>{ 
                                                   'PriceSchedule__c', 
                                                   'TransactionTier__c', 
                                                   'ServiceLevel__c', 
                                                   'Display__c',
                                                   'ConnectorName__c',
                                                   'Connector__c',
                                                   'AddOnConnector__c',
                                                   'DiscountFromList__c',
                                                   'ListPrice__c',
                                                   'TiersEdited__c'
                                                 };
      }
      return quoteChargeCustomFields;
    }
    set;
  }

  public List<selectOption> tierPriceFormats{
    get{
      if(tierPriceFormats == null){
        tierPriceFormats = new List<SelectOption>();
        tierPriceFormats.add(new selectOption('Flat Fee', 'Flat Fee')); 
        tierPriceFormats.add(new selectOption('Per Unit', 'Per Unit'));         
      }
      return tierPriceFormats;
    }
    set;
  }
  // ------------------------------------------------------------------------
  // --- Public Methods ---
  // ------------------------------------------------------------------------
  /*
   *  Constructor
   */
  public ProductSelectorController(ApexPages.StandardController controller) { 
    System.Debug('Entering constructor. ');
    quoteId = controller.getId();
    // Save the controller in attribute
    this.controller = controller;
    // Set up the attributes to their initial values
    initSuccess = false;
    selectedproductRatePlanMap = new Map < ID, Boolean > ();
    selectedproductRatePlanSet = new Set < zqu__productRatePlan__c > ();
    selectedproductRatePlanCount = 0;
    //create the product options when everything has loaded
    optionsForProductLookup = new ProductLookupController().optionsForProductLookup;
    connectorProductNames = getConnectorPicklistValues('ProductName__c');
    existingChargeGroupHolders = getExistingChargeGroupHolders(quoteId);
    System.Debug('existingChargeGroupHolders: ' + existingChargeGroupHolders);
    System.DEbug('chargeGroupHolderMap: ' + chargeGroupHolderMap.values().size());
    notificationOptions = getNotificationOptions();
    // Everything was alright, initialization is successful
    initSuccess = true;
  }
  /*
   *  Advance the set to the next page
   */
  public void next() {
    productRatePlanSet.next();
  }
  /*
   *  Advance the set to the next page
   */
  public void previous() {
    productRatePlanSet.previous();
  }
  /*
   *  On checkbox change (product rate plan selection)
   */
  public void pickRatePlan() {
    Boolean isChecked = selectedproductRatePlanMap.get(selectedproductRatePlan);
    System.debug('##### Working with ' + selectedproductRatePlan + ' which is ' + isChecked);
    if (isChecked) {
      selectedproductRatePlanSet.add(productRatePlanMap.get(selectedproductRatePlan));
      System.debug('###### [MP] product rate Set now contains: ' + selectedproductRatePlanSet);
      selectedproductRatePlanCount++;
    }
    else {
      selectedproductRatePlanSet.remove(productRatePlanMap.get(selectedproductRatePlan));
      selectedproductRatePlanCount--;
    }
    if (selectedproductRatePlanCount > 0) {
      productRatePlanSelected = true;
    }
    else {
      productRatePlanSelected = false;
    }
    cghList = getChargeGroupHolderList();
  }
  /*
   *  On remove selected rate plan
   */
  public void doRemoveRatePlan() {
    selectedproductRatePlanSet.remove(productRatePlanMap.get(selectedproductRatePlan));
    selectedproductRatePlanMap.put(selectedproductRatePlan, false);
    selectedproductRatePlanCount--;
  }
  /*
   *  On search a given product rate plan
   */
  public void doSearch() {
    // Add values to the text entered
    String searchCriteria = '%' + productRatePlanSearchText + '%';
    String ratePlanQuery = buildRatePlanQuery();
    ratePlanQuery += ' AND Name LIKE \'' + searchCriteria + '\'';
    // Query the account list based on the text entered
    productRatePlanList = Database.query(ratePlanQuery);
    // Rebuild the set
    productRatePlanSet = new ApexPages.StandardSetController(productRatePlanList);
    productRatePlanSet.setPageSize(PAGE_SIZE);
    // Rebuild the map
    productRatePlanMap = new Map < ID, zqu__productRatePlan__c > (productRatePlanList);
    // Add those account to the map if they were not already present
    for (zqu__productRatePlan__c customerAccount: productRatePlanList) {
      if (selectedproductRatePlanMap.get(customerAccount.Id) == null) {
        selectedproductRatePlanMap.put(customerAccount.Id, false);
      }
    }
  }
  /*
   *  Clear the search result
   */
  public void doClearSearch() {
    productRatePlanSearchText = null;
    getProductRatePlans();
    // Rebuild the set
    productRatePlanSet = new ApexPages.StandardSetController(productRatePlanList);
    productRatePlanSet.setPageSize(PAGE_SIZE);
    productRatePlanMap = new Map < ID, zqu__productRatePlan__c > (productRatePlanList);
    // Add those account to the map if they were not already present
    for (zqu__productRatePlan__c customerAccount: productRatePlanList) {
      if (selectedproductRatePlanMap.get(customerAccount.Id) == null) {
        selectedproductRatePlanMap.put(customerAccount.Id, false);
      }
    }
  }
  /* 
   * Method that faciliates a product being picked
   */
  public PageReference pickProduct() {
    System.Debug('Picking product.');
    //reset the picked values if a product is picked again
    resetValues();
    //get the product rate plans with the selected product id
    //to get the unique price schdeules
    getProductRatePlans();
    productSelected = true;
    // Read through all the Product Rate Plans and capture the Price Schedule
    //query sfdc product rate plans to get a list of unique price schedules
    //from the custom field synchronized from zuora
    uniquePriceSchedules = getUniquePriceSchedules(productRatePlanList);
    //set the selected product is and name on the lookup options so that
    //the selection will stay when the form is reloaded
    optionsForProductLookup.TargetId = selectedProductId;
    optionsForProductLookup.TargetName = selectedProductName;
    //logic to handle if a connector is availble for the product
    doConnectorLogic();
    //put the existing charge group holders back into the map of all chargeGroupHolders
    for(ChargeGroupHolder cgh : existingChargeGroupHolders){
      chargeGroupHolderMap.put(cgh.Id, cgh);
    }
    System.Debug('chargeGroupHolderMap: ' + chargeGroupHolderMap.values().size());
    return null;
  }
  /*
   *  Action that occurs when the price schedule is selected
   */
  public PageReference pickPriceSchedule() {
    //this is set so the selected price schedule is displayed when the form is reloaded
    pickedPriceSchedule = selectedPriceSchedule;
    //get the rate plans filtered by price schedule
    getProductRatePlans();
    showRatePlans = true;
    if (selectedPriceSchedule == NONE) {
      showRatePlans = false;
    }
    return null;
  }
  /*
   *  Action that occurs when the connector is selected
   */
  public PageReference pickConnector() {
    clearSelectedCharges();
    //this is set so that they selected connecter is displayed when the form is reloaded
    pickedConnector = selectedConnector;
    //set the price schedule from the connector and then get rate plans
    if (selectedConnector == NONE) {
      selectedConnector = null;
      showRatePlans = false;
    }
    else {
      //set the price schedule from the selected connector
      System.Debug('connector: ' + selectedConnector);
        if(connectorMap.containsKey(selectedConnector))
      selectedPriceSchedule = connectorMap.get(selectedConnector).pricing_schedule__c;
      //get the rate plans filtered by price schedule set from connector
      getProductRatePlans();
      showRatePlans = true;
    }
    return null;
  }
  /*
   *  Action that occurs when the service level is selected
   */
  public PageReference pickServiceLevel() {
    clearSelectedCharges();
    //this is set so that the service level is displayed when the form is reloaded
    pickedServiceLevel = selectedServiceLevel;
    getProductRatePlans();
    showRatePlans = true;
    return null;
  }
  /*
   *  Action that occurs when the service level is selected
   */
  public PageReference pickAddOnConnector() {
    clearSelectedCharges();
    //this is set so that the add on connector is displayed when the form is reloaded
    pickedAddOnConnector = selectedAddOnConnector;
    getProductRatePlans();
    showRatePlans = true;
    return null;
  }
  /*
   *  Action that occurs when the service level is selected
   */
  public PageReference pickTransactionTier() {
    clearSelectedCharges();
    //this is set so that the add on connector is displayed when the form is reloaded
    pickedTransactionTier = selectedTransactionTier;
    getProductRatePlans();
    showRatePlans = true;
    return null;
  }
  /*
   * Pick a charge to edit tiers of
   */
  public PageReference pickCharge(){
    //find the charge group holder
    ChargeGroupHolder cgh = chargeGroupHolderMap.get(Integer.valueOf(selectedTierChargeGroupId));
    //find the charge from the product id 
    for(zqu.zCharge zc : cgh.allCharges){
      if(selectedChargeProductId == zc.PRODUCT_RATE_PLAN_CHARGE_SFDC_ID){
        //flip the flag
        //zc.chargeObject.put('TiersEdited__c', 'True');
        if(zc.chargeObject.get('TiersEdited__c') == 'True'){
          zc.chargeObject.put('TiersEdited__c', 'False');
        }
        else{
          zc.chargeObject.put('TiersEdited__c', 'True');
        }
      }
    }
    return null;
  }
  /*
   *  Action to remove a charge group from the quote
   */
  public PageReference removeChargeGroup() {
    System.Debug('selectedChargeGroupId: ' + selectedChargeGroupId);
    ChargeGroupHolder cgh = chargeGroupHolderMap.get(Integer.valueOf(selectedChargeGroupId));
    System.Debug('chargeGroupHolderMap: ' + chargeGroupHolderMap);
    System.Debug('cgh: ' + cgh);
    //get matching charge group to delete
    List<zqu.zChargeGroup> matchingChargeGroups = getMatchingChargeGroup(cgh.chargeGroup);
    //add the groups to the one that was selected
    if(matchingChargeGroups.size() > 0){
      matchingChargeGroups.add(cgh.chargeGroup);
      try{
        zqu.zQuoteUtil.deleteChargeGroups(matchingChargeGroups);
      }
      catch(Exception e){
        appendMessage(ApexPages.Severity.ERROR, e.getMessage());
        return null; 
      }
    }
    //no matching group
    else{
      try{
        zqu.zQuoteUtil.deleteChargeGroup(cgh.chargeGroup);
      }
      catch(Exception e){
        appendMessage(ApexPages.Severity.ERROR, e.getMessage());
        return null; 
      }
    }
    return makeProductSelectorPageRef();
  }
  /*
   *  Action to update the charge group effective price
   */
  public PageReference effectivePriceChange() {
    ChargeGroupHolder cgh = chargeGroupHolderMap.get(Integer.valueOf(selectedChargeGroupId));
    cgh.hasBeenUpdated = true;

    for(zqu.zChargeGroup cg : cgh.chargeGroups){
      try{
        cg.zCharges = zqu.zQuoteUtil.calculateChargesOnEffectivePriceChange(cg.zCharges);
      }
      catch(Exception e){
        appendMessage(ApexPages.Severity.ERROR, e.getMessage());
      }
    }
    return null;
  }
  /*
   *  Action to update the charge group quantity
   */
  public PageReference quantityChange() {
    ChargeGroupHolder cg = chargeGroupHolderMap.get(Integer.valueOf(selectedChargeGroupId));
    cg.hasBeenUpdated = true;
    try{
      cg.chargeGroup.zCharges = zqu.zQuoteUtil.calculateChargesOnQuantityChange(cg.chargeGroup.zCharges);
    }
    catch(Exception e){
      appendMessage(ApexPages.Severity.ERROR, e.getMessage());
    }
    return null;
  }
  /*
   *  Action to update the charge group discount
   */
  public PageReference discountChange() {
    System.Debug('selectedChargeGroupId: ' + selectedChargeGroupId);
    ChargeGroupHolder cg = chargeGroupHolderMap.get(Integer.valueOf(selectedChargeGroupId));
    System.Debug('chargeGroupHolderMap: ' + chargeGroupHolderMap);
    System.Debug('cgh: ' + cg);
    cg.hasBeenUpdated = true;
    try{
      cg.chargeGroup.zCharges = zqu.zQuoteUtil.calculateChargesOnDiscountChange(cg.chargeGroup.zCharges);
    }
    catch(Exception e){
      appendMessage(ApexPages.Severity.ERROR, e.getMessage());
    }
    return null;
  }
  /*
   *  Action to save the charge groups and go to the quote
   */
  public PageReference saveAndClose() {
    if(save()){
      return new PageReference('/' + quoteId);
    }
    return null;
  }
  /*
   *  Action to save the charge group and reload the product selector
   */
  public PageReference saveAndNew() {
    if(save()){
      return makeProductSelectorPageRef();
    }
    return null;
  }
  /*
   * Action to validate the quote, i.e run the rules
   */
  public PageReference validateQuote(){
    System.Debug('Validating Quote');
    List < zqu.zChargeGroup > chargeGroups = new List < zqu.zChargeGroup > ();
    for (ChargeGroupHolder cgh: cghList) {
      chargeGroups.add(cgh.chargeGroup);
    }
    //run rules
    List<zqu.zChargeGroup> allChargesList = new List<zqu.zChargeGroup>();
    allChargesList.addAll(chargeGroups);
    allChargesList.addAll(existingChargeGroups);
    List<String> rulesMessages = Rules.runRules(allChargesList);
    for(String s : rulesMessages){
     appendMessage(ApexPages.Severity.ERROR, s); 
    } 
    return null;
  }
  /*
   * Action to validate the quote and save if its valid
   */
  public PageReference validateAndSaveQuote(){
    System.Debug('Validating and saving Quote');
    List < zqu.zChargeGroup > chargeGroups = new List < zqu.zChargeGroup > ();
    for (ChargeGroupHolder cgh: cghList) {
      chargeGroups.add(cgh.chargeGroup);
    }
    //run rules
    List<zqu.zChargeGroup> allChargesList = new List<zqu.zChargeGroup>();
    allChargesList.addAll(chargeGroups);
    allChargesList.addAll(existingChargeGroups);
    List<String> rulesMessages = Rules.runRules(allChargesList);
    for(String s : rulesMessages){
     appendMessage(ApexPages.Severity.ERROR, s); 
    } 
    //there were no errors
    if(rulesMessages.size() == 0){
      return saveAndClose();
    }
    return null;
  }
  /* 
   * Change  price format
   */
  public PageReference changeTierPriceFormat(){
    //get the selected charge group holder id
    System.Debug('updating tiers for selectedChargeGroupId: ' + selectedTierChargeGroupId);
    ChargeGroupHolder cg = chargeGroupHolderMap.get(Integer.valueOf(selectedTierChargeGroupId)); 
    //get the charges
    for(zqu.zCharge c : cg.allCharges){
      //got the correct charge
      if(c.PRODUCT_RATE_PLAN_CHARGE_SFDC_ID == selectedChargeProductId){
        c.hasCustomTiers = true;
        //get the tiers
        List<zqu__QuoteCharge_Tier__c> currentTiers = c.chargeTiersObjects;
        //do the calculation
        c.populateCustomChargeTiers( currentTiers );
      }
    }
    return null;
  }

  public Pagereference changeTierEffectivePrice(){
    //get the selected charge group holder id
    System.Debug('updating tiers for selectedChargeGroupId: ' + selectedTierChargeGroupId);
    ChargeGroupHolder cg = chargeGroupHolderMap.get(Integer.valueOf(selectedTierChargeGroupId)); 
    //get the charges
    for(zqu.zCharge charge : cg.allCharges){
      if(charge.PRODUCT_RATE_PLAN_CHARGE_SFDC_ID == selectedChargeProductId){
        charge.hasCustomTiers = true;
        List<zqu__QuoteCharge_Tier__c> currentTiers = charge.chargeTiersObjects;
        Integer tierIndex = Integer.ValueOf(selectedTier)-1;
          if(currentTiers.get(tierIndex).zqu__Effective_Price__c  == null){
            currentTiers.get(tierIndex).zqu__Effective_Price__c  = 0;
          }
          if(currentTiers.get(tierIndex).zqu__Price__c * 100.0 != 0)
          currentTiers[tierIndex].zqu__Discount__c  = 100 - currentTiers.get(tierIndex).zqu__Effective_Price__c / currentTiers.get(tierIndex).zqu__Price__c * 100.0;
          charge.populateCustomChargeTiers( currentTiers );
          return null;
      }
    }
    return null;
  }

  public Pagereference changeTierDiscount() {
    //get the selected charge group holder id
    System.Debug('updating tiers for selectedChargeGroupId: ' + selectedTierChargeGroupId);
    ChargeGroupHolder cg = chargeGroupHolderMap.get(Integer.valueOf(selectedTierChargeGroupId)); 
    //get the charges
    for(zqu.zCharge charge : cg.allCharges){
      if (charge.PRODUCT_RATE_PLAN_CHARGE_SFDC_ID == selectedChargeProductId) {
        if (charge.hasCustomTiers == false) {
          charge.DISCOUNT = '0';
          selectedChargeGroupId = selectedTierChargeGroupId;
          discountChange();
        }
        charge.hasCustomTiers = true;
        List < zqu__QuoteCharge_Tier__c > currentTiers = charge.chargeTiersObjects;
        Integer tierIndex = Integer.ValueOf(selectedTier) - 1;
        if (currentTiers.get(tierIndex).zqu__Discount__c == null) {
          currentTiers.get(tierIndex).zqu__Discount__c = 0;
        }
        currentTiers[tierIndex].zqu__Effective_Price__c = currentTiers.get(tierIndex).zqu__Price__c * (100 - currentTiers.get(tierIndex).zqu__Discount__c) / 100.0;
        charge.populateCustomChargeTiers(currentTiers);
        return null;
      }
    }
    return null;
  }

  /* 
   * Change tier ending unit
  */
  public PageReference changeTierEndingUnit(){
    //get the selected charge group holder id
    System.Debug('changing tier ending unit for selectedChargeGroupId: ' + selectedTierChargeGroupId);
    ChargeGroupHolder cg = chargeGroupHolderMap.get(Integer.valueOf(selectedTierChargeGroupId));

    for(zqu.zCharge charge : cg.allCharges){
      if(charge.PRODUCT_RATE_PLAN_CHARGE_SFDC_ID == selectedChargeProductId){
        System.debug('CHARGE UOM'+charge.UNIT_OF_MEASURE);
        zqu__ZUnitOfMeasure__c chargeUOM = [SELECT zqu__Uom_precision__c, zqu__Uom_rounding_mode__c,zqu__Active__c FROM zqu__ZUnitOfMeasure__c WHERE name=: charge.UNIT_OF_MEASURE AND zqu__Active__c = True limit 1];
        Decimal T = 10;
        Double additionScale = 1/(T.pow(Integer.ValueOf(chargeUOM.zqu__Uom_precision__c)));
        charge.hasCustomTiers = true;
        List<zqu__QuoteCharge_Tier__c> currentTiers = charge.chargeTiersObjects;
        Integer tierIndex = Integer.ValueOf(selectedTier)-1;
        // Don't need to change starting unit of next tier, if this tier is the last one
        if(tierIndex == currentTiers.size()-1){ 
          return null;
        }    
        if(currentTiers.get(tierIndex).zqu__EndingUnit__c == null){
          currentTiers.get(tierIndex).zqu__EndingUnit__c = 1 ;
        }
        //ROUND the entered in value to the correct decimal
        if(chargeUOM.zqu__Uom_rounding_mode__c == 'UP'){
          currentTiers.get(tierIndex).zqu__EndingUnit__c = currentTiers.get(tierIndex).zqu__EndingUnit__c.setScale(Integer.ValueOf(chargeUOM.zqu__Uom_precision__c),system.roundingMode.UP);
        }
        else if(chargeUOM.zqu__Uom_rounding_mode__c == 'DOWN'){
          currentTiers.get(tierIndex).zqu__EndingUnit__c = currentTiers.get(tierIndex).zqu__EndingUnit__c.setScale(Integer.ValueOf(chargeUOM.zqu__Uom_precision__c),system.roundingMode.DOWN);
        }
        
        currentTiers[tierIndex + 1].zqu__StartingUnit__c  = currentTiers.get(tierIndex).zqu__EndingUnit__c + additionScale ;
        
        for( Integer i = tierIndex ; i > 0 ; i--){
          if(currentTiers[i].zqu__EndingUnit__c  <  currentTiers[i].zqu__StartingUnit__c ){
            currentTiers[i].zqu__StartingUnit__c = currentTiers[i].zqu__EndingUnit__c - additionScale ;
          }
          if( currentTiers[i-1].zqu__EndingUnit__c > currentTiers[i].zqu__StartingUnit__c){
            currentTiers[i-1].zqu__EndingUnit__c = currentTiers[i].zqu__StartingUnit__c - additionScale ;
          }
        }
        
        for( Integer i = tierIndex ; i < currentTiers.size()-1 ; i++){
          if(currentTiers[i].zqu__EndingUnit__c  >  currentTiers[i+1].zqu__StartingUnit__c ){
            currentTiers[i+1].zqu__StartingUnit__c = currentTiers[i].zqu__EndingUnit__c + additionScale ;
          }
          if( currentTiers[i+1].zqu__StartingUnit__c > currentTiers[i+1].zqu__EndingUnit__c){
            currentTiers[i+1].zqu__EndingUnit__c = currentTiers[i+1].zqu__StartingUnit__c + additionScale ;
          }
        }
        charge.populateCustomChargeTiers( currentTiers );
        return null;
      }
    }
    return null; 
  }

  public void addTier() {
    //Can only add tier to end of list
    //Tier number is last tier + 1
    //Tier From is last tier "To" + 1 uom precision
    //Tier To is empty        
    //get the selected charge group holder id
    System.Debug('adding tier selectedChargeGroupId: ' + selectedTierChargeGroupId);
    ChargeGroupHolder cg = chargeGroupHolderMap.get(Integer.valueOf(selectedTierChargeGroupId));
    for(zqu.zCharge charge : cg.allCharges){
      if(charge.PRODUCT_RATE_PLAN_CHARGE_SFDC_ID == selectedChargeProductId){
        charge.hasCustomTiers = true;
        List < zqu__QuoteCharge_Tier__c > currentTiers = charge.chargeTiersObjects;
        zqu__QuoteCharge_Tier__c newTier = new zqu__QuoteCharge_Tier__c(); //Create new tier
        newTier.name = String.valueOf(currentTiers.size() + 1);
        newTier.zqu__Tier__c = currentTiers.size() + 1;
        newTier.zqu__Price__c = 0;
        newTier.zqu__Effective_Price__c = 0;
        newTier.zqu__Discount__c = 0;
        if (currentTiers.get(currentTiers.size() - 1).zqu__EndingUnit__c != null) {
          newTier.zqu__StartingUnit__c = currentTiers.get(currentTiers.size() - 1).zqu__EndingUnit__c + 1;
        }
        currentTiers.add(newTier);
        charge.populateCustomChargeTiers(currentTiers);
        break;
      }
    }
  }

  public void removeTier() {
    //Cannot remove first tier
    System.Debug('removing tier selectedChargeGroupId: ' + selectedTierChargeGroupId);
    System.Debug('Selected Tier: ' + selectedTier);

    ChargeGroupHolder cg = chargeGroupHolderMap.get(Integer.valueOf(selectedTierChargeGroupId));
    for(zqu.zCharge charge : cg.allCharges){
      if(charge.PRODUCT_RATE_PLAN_CHARGE_SFDC_ID == selectedChargeProductId){        
        charge.hasCustomTiers = true;
        List < zqu__QuoteCharge_Tier__c > currentTiers = charge.chargeTiersObjects;
        Integer tierIndex = Integer.ValueOf(selectedTier) - 1;
        if (currentTiers.get(tierIndex).zqu__StartingUnit__c != null && currentTiers.get(tierIndex).zqu__Tier__c != currentTiers.size() - 2) {
          currentTiers[tierIndex + 1].zqu__StartingUnit__c = currentTiers.get(tierIndex).zqu__StartingUnit__c;
        }
        currentTiers[tierIndex + 1].zqu__Tier__c = currentTiers.get(tierIndex).zqu__Tier__c;
        currentTiers.remove(tierIndex);
        charge.populateCustomChargeTiers(currentTiers);
        break;
      }
    }
  }

  // ------------------------------------------------------------------------
  // --- Private Methods ---
  // ------------------------------------------------------------------------

  private void clearSelectedCharges(){
    //clear the selected charges
    cghList.clear();
    selectedproductRatePlanSet.clear();
    productRatePlanSelected = false;
  }
  private List<zqu.zChargeGroup> getMatchingChargeGroup(zqu.zChargeGroup input){
    List<zqu.zChargeGroup> output = new List<zqu.zChargeGroup>();
    //look in the existing charge groups to hide for a charge group that has the same unique fields set
    for(zqu.zChargeGroup cg : existingChargeGroupsToHide){
      if(cg.zCharges[0].chargeObject.get('PriceSchedule__c') == input.zCharges[0].chargeObject.get('PriceSchedule__c') &&
         cg.zCharges[0].chargeObject.get('TransactionTier__c') == input.zCharges[0].chargeObject.get('TransactionTier__c') &&
         cg.zCharges[0].chargeObject.get('ServiceLevel__c') == input.zCharges[0].chargeObject.get('ServiceLevel__c') &&
         cg.zCharges[0].chargeObject.get('AddOnConnector__c') == input.zCharges[0].chargeObject.get('AddOnConnector__c') &&
         cg.productName == input.productName ){
        output.add(cg);
        //only find one
        break;  
      }
    }
    return output;
  }
  private PageReference makeProductSelectorPageRef() {
    PageReference pr = new PageReference('/apex/ProductSelector?id=' + quoteId);
    pr.setRedirect(true);
    return pr;
  }
  /*
   *  Save the chargeGroups - add new ones and update existing ones
   */
  private Boolean save() {
    if(addNewCharges()){
      return updateExistingCharges();
    }
    return false;
  }
  /*
   *
   */
  private void setQuoteStartDateToSubscriptionStart(){
    List<zqu__Quote__c> quote = [SELECT zqu__SubscriptionTermStartDate__c, zqu__SubscriptionType__c
                                 FROM zqu__Quote__c
                                 WHERE id = :quoteId];
    if(quote[0].zqu__SubscriptionType__c == 'Amend Subscription'){

      if(quote[0].zqu__SubscriptionTermStartDate__c != null){
        quote[0].zqu__StartDate__c = quote[0].zqu__SubscriptionTermStartDate__c;
        update quote;
      }

    }
  }
  /*
   * Method to add new charges to the quote
   */
  private Boolean addNewCharges(){
    setQuoteStartDateToSubscriptionStart();
    //add the new ones
    if (cghList.size() > 0) {
      List < zqu.zChargeGroup > chargeGroups = new List < zqu.zChargeGroup > ();
      for (ChargeGroupHolder cgh : cghList) {
        chargeGroups.addAll(cgh.chargeGroups);
      }

      zqu.GlobalCustomFieldDefinition.CHARGE_FIELDS = quoteChargeCustomFields;
      for(zqu.zChargeGroup cg : chargeGroups){
        for(zqu.zCharge c : cg.zCharges){
          c.chargeObject.put('DiscountFromList__c', c.DISCOUNT);
          c.chargeObject.put('ListPrice__c', c.LIST_PRICE);
        }
      }
      try{
        //add the custom fields from the product rate plan to the quote charge in order
        //to facilate the removing and loading of associated rate plans
        zqu.zQuoteUtil.addChargeGroups(addCustomFieldsToChargeGroups(chargeGroups));
      }
      catch(Exception e){
        appendMessage(ApexPages.Severity.ERROR, formatErrorMessage(e.getMessage()));
        return false; 
      }
    }
    return true;
  }
  /*
   * Method to update the existing charge groups on the quote that have been updated
   */
  private Boolean updateExistingCharges(){
    //update the existing charges
    if (existingChargeGroupHolders.size() > 0) {
      zqu.GlobalCustomFieldDefinition.CHARGE_FIELDS = quoteChargeCustomFields;
      //make sure it has been updated
      List<zqu.zChargeGroup> updatedExistingChargeGroupsList = new List<zqu.zChargeGroup>();
      for(ChargeGroupHolder cgh : existingChargeGroupHolders){
        if(cgh.hasBeenUpdated){
          updatedExistingChargeGroupsList.addAll(cgh.chargeGroups);
        }
      }
      if(updatedExistingChargeGroupsList.size() > 0){
        try{
          zqu.zQuoteUtil.updateChargeGroups(updatedExistingChargeGroupsList);
        }
        catch(Exception e){
          appendMessage(ApexPages.Severity.ERROR, formatErrorMessage(e.getMessage())); 
          return false;
        }
      }
    }
    return true;
  }
  /*
   * Add custom fields from the product rate plan to the quote charge for
   * PriceSchedule__c, TransactionTier__c, ServiceLevel__c, Display__c
   * ConnectorId, Connector
   */
  private List<zqu.zChargeGroup> addCustomFieldsToChargeGroups(List<zqu.zChargeGroup> input){
  List<zqu.zChargeGroup> output = new List<zqu.zChargeGroup>();
   //set the connector id and name if it has beed picked
    if( selectedConnector != null ){
      for(zqu.zChargeGroup cg : input){
        for(zqu.zCharge c : cg.zCharges){
          //find the connector name from the picklist values
          for( SelectOption so : availableConnectorValues ){
            if( selectedConnector == so.getValue() ){
              c.chargeObject.put('Connector__c', so.getValue() );
              c.chargeObject.put('ConnectorName__c', so.getLabel() );
            }
          }
        }
      }
    }
    //use the product rate plan map to find the product rate plan related to the charge group
    for(zqu.zChargeGroup cg : input){
      if(productRatePlanZuoraIdMap.containsKey(cg.productRateplanZuoraID)){
        zqu__ProductRatePlan__c prp = productRatePlanZuoraIdMap.get(cg.productRateplanZuoraID);
        for(zqu.zCharge c : cg.zCharges){
          c.chargeObject.put('PriceSchedule__c', prp.PriceSchedule__c);
          c.chargeObject.put('TransactionTier__c', prp.TransactionTier__c);
          c.chargeObject.put('ServiceLevel__c', prp.ServiceLevel__c); 
          c.chargeObject.put('Display__c', prp.Display__c); 
          c.chargeObject.put('AddOnConnector__c', prp.AddOnConnector__c);          
        }
      }
      output.add(cg);
    }
    return output;
  }
  /*
   * Make a list of charge group holders
   */
  private List < ChargeGroupHolder > makeChargeGroupHolders(List < zqu.zChargeGroup > input) {
    System.Debug('makeChargeGroupHolders for: ' + input.size());
    List < ChargeGroupHolder > output = new List < ChargeGroupHolder > ();
    for (zqu.zChargeGroup cg: input) {

      if(cg.zCharges == null || cg.zCharges.size() == 0){
        continue;
      }
      ChargeGroupHolder cgh = new ChargeGroupHolder();
      cgh.id = wrapperIdCounter;
      wrapperIdCounter++;
      cgh.chargeGroup = cg;
      if(cg.zCharges != null && cg.zCharges.size() > 0){
        cgh.display = (String)cg.zCharges[0].chargeObject.get('Display__c');
      }
      //set the tiersToEdit flags to be false for all the charges
      for(integer i=0; i<cg.zCharges.size(); i++){
        if( i == 0 ){
          cgh.tiersToEdit.add(true);
        }
        else{
          cgh.tiersToEdit.add(false);
        }

      }
      output.add(cgh);
    }
    System.Debug('Before combing charge groups ' + output.size() );
    //combine matching charge group holders to "show" linked charges under the same rate plan in the UI
    output = combineChargeGroupHolders(output);


    System.Debug('After combing charge groups ' + output.size() );
    for (ChargeGroupHolder cgh: output) {
      chargeGroupHolderMap.put(cgh.Id, cgh);
    }
    for(ChargeGroupHolder cgh : existingChargeGroupHolders){
      chargeGroupHolderMap.put(cgh.Id, cgh);
    }

    return output;
  }
  /*
   * Make a map of the charge product rate plan charge sfdc id to the product rate plan zuora id
   */
  private Map<string, string> makeChargeToRatePlanMap(List<ChargeGroupHolder> input){
    Map<string, string> output = new Map<string, string>();
    //make a set of the product rate plan charge sfdc id from the chargegroupsholders
    Set<string> prpcIds = new Set<string>();
    for(ChargeGroupHolder cgh : input){
      if(cgh.chargeGroup.zCharges != null && cgh.chargeGroup.zCharges.size() > 0){
        prpcIds.add( cgh.chargeGroup.zCharges[0].PRODUCT_RATE_PLAN_CHARGE_SFDC_ID);
      }
    }
    //get the product rate plan zuora id from the product rate plan charge
    List<zqu__ProductRatePlanCharge__c> prpcList = [SELECT Id, 
                                                           zqu__ProductRatePlan__r.zqu__ZuoraId__c
                                                    FROM zqu__ProductRatePlanCharge__c
                                                    WHERE Id 
                                                    IN :prpcIds];
    //make a map of the charge sfdc id to the product rate plan zuora id                                                     
    for( zqu__ProductRatePlanCharge__c prpc : prpcList ){
      output.put(prpc.Id, prpc.zqu__ProductRatePlan__r.zqu__ZuoraId__c);
    }
    return output;
  }
  /*
   * combine matching charge group holders, i.e. they have matching custom fields at the chargeObject level
   */
  private List<ChargeGroupHolder> combineChargeGroupHolders(List<ChargeGroupHolder> input){
    List<ChargeGroupHolder> output = new List<ChargeGroupHolder>();
    Map<string, string> chargeToRatePlanIdMap = makeChargeToRatePlanMap(input);
    for(ChargeGroupHolder cgh : input){
      //if display = false then this group should be added to another charge group move to next one
      if( cgh.display == FALSESTR ){
        continue;
      }
      ChargeGroupHolder matchingCgh = findMatchingChagreGroupHolder(cgh, input);

      if( matchingCgh != null ){
        //add the charge group from the matchingCgh to the chargeGroups list
        cgh.chargeGroups.add( matchingCgh.chargeGroup );
        //add the charge group from the cgh to the chargeGroups list
        cgh.chargeGroups.add( cgh.chargeGroup );
      }
      //if no matching group found, just add the charge Group from the holder to the list
      else{
        cgh.chargeGroups.add( cgh.chargeGroup );
      }
      //make the map on the chargeGroupHolder based on the chargeGroups list
      for( zqu.zChargeGroup cg : cgh.chargeGroups ){
        //the cg does not always have the product rate plan zuora id
        //need to get this based on the product rate plan charge sfdc/zuora id
        if(cg.zCharges != null && cg.zCharges.size() > 0){
          cgh.chargeGroupZIdToChargesMap.put( chargeToRatePlanIdMap.get(cg.zCharges[0].PRODUCT_RATE_PLAN_CHARGE_SFDC_ID), cg.zCharges );
        }
      }
      output.add( cgh );
    }
    return output;
  }
  /*
   *  Find a charge group holder whose display = false and the custom fields match the target charge group holder
   */
  private ChargeGroupHolder findMatchingChagreGroupHolder(ChargeGroupHolder target, List<ChargeGroupHolder> input){
    ChargeGroupHolder output;
    for(ChargeGroupHolder cgh : input){
      if(cgh.display == FALSESTR && 
         cgh.chargeGroup.zCharges[0].chargeObject.get('PriceSchedule__c') == target.chargeGroup.zCharges[0].chargeObject.get('PriceSchedule__c') &&
         cgh.chargeGroup.zCharges[0].chargeObject.get('TransactionTier__c') == target.chargeGroup.zCharges[0].chargeObject.get('TransactionTier__c') &&
         cgh.chargeGroup.zCharges[0].chargeObject.get('ServiceLevel__c') == target.chargeGroup.zCharges[0].chargeObject.get('ServiceLevel__c') &&
         cgh.chargeGroup.zCharges[0].chargeObject.get('AddOnConnector__c') == target.chargeGroup.zCharges[0].chargeObject.get('AddOnConnector__c') ){
        output = cgh;
      }
    }
    return output;
  }
  /*
   *  Create the holders for existing charge groups on the quote
   */
  public List < ChargeGroupHolder > getExistingChargeGroupHolders(String quoteId) {
    List < ChargeGroupHolder > output = new List < ChargeGroupHolder > ();
    zqu.GlobalCustomFieldDefinition.CHARGE_FIELDS = quoteChargeCustomFields;
    //the product rate plan zuora id wont be set on the charge group...
    existingChargeGroups = !Test.isRunningTest() ? zqu.zQuoteUtil.getChargeGroups(quoteId) : ProductSelectorControllerTest.existingChargeGroupsTest;
    //existingChargeGroups = zqu.zQuoteUtil.getChargeGroups(quoteId);// : ProductSelectorControllerTest.existingChargeGroupsTest;
    
    //this actuall removes the need to write them to the object maybe
    existingChargeGroups = populateChargeObjectCustomFields(existingChargeGroups);
    for(zqu.zChargeGroup cg : existingChargeGroups){
      if(cg.zCharges != null && cg.zCharges.size() > 0){
        System.Debug(' custom field values of the charge object: ' + cg.zCharges[0].chargeObject );
        if(cg.zCharges[0].chargeObject.get('Display__c') == TRUESTR){
          existingChargeGroupsToShow.add(cg);
        }
        else{
          existingChargeGroupsToHide.add(cg);
        }
      }
    } 
    System.Debug('existingChargeGroups size: ' + existingChargeGroups.size() );

    output = makeChargeGroupHolders(existingChargeGroups);
    if (existingChargeGroups.size() > 0) {
      showExistingCharges = true;
    }
    return output;
  }
  /*
   * Get the custom fields for the zCharge.chargeObject from the sfdc product rate plan object
   * from the product catalog
   */
  private List<zqu.zChargeGroup> populateChargeObjectCustomFields(List<zqu.zChargeGroup> chargeGroups){
  		zqu.GlobalCustomFieldDefinition.CHARGE_FIELDS = quoteChargeCustomFields;
	    System.Debug('populateChargeObjectCustomFields for charge groups: ' + chargeGroups);
	    Set<String> chargeSfdcIdSet = new Set<String>();
	    for(zqu.zChargeGroup cg : chargeGroups){
	      if(cg.zCharges != null && cg.zCharges.size() > 0){
	        chargeSfdcIdSet.add(cg.zCharges[0].PRODUCT_RATE_PLAN_CHARGE_SFDC_ID);
	      }
	    }
	    System.Debug('chargeSfdcIdSet : ' + chargeSfdcIdSet);
	    List<zqu__ProductRatePlanCharge__c> prpcList = [SELECT Id,
	                                                           Name, 
                                                             zqu__ProductRatePlan__c,
	                                                           zqu__ProductRatePlan__r.PriceSchedule__c,
	                                                           zqu__ProductRatePlan__r.TransactionTier__c,
	                                                           zqu__ProductRatePlan__r.Display__c,
	                                                           zqu__ProductRatePlan__r.ServiceLevel__c,
	                                                           zqu__ProductRatePlan__r.AddOnConnector__c


	                                                    FROM zqu__ProductRatePlanCharge__c
	                                                    WHERE Id 
	                                                    IN :chargeSfdcIdSet];
	    System.Debug('prpcList : ' + prpcList);
      List<String> prpIds = new List<String>();
      for(zqu__ProductRatePlanCharge__c prpc : prpcList){
        prpIds.add(prpc.zqu__ProductRatePlan__c);
      }

      System.debug('prpIds: ' + prpIds);
      Map<String, zqu__ProductRatePlan__c> prpMap = new Map<String, zqu__ProductRatePlan__c>([SELECT Id, 
                                                      PriceSchedule__c,
                                                      TransactionTier__c,
                                                      Display__c,
                                                      ServiceLevel__c,
                                                      AddOnConnector__c
                                               FROM zqu__ProductRatePlan__c
                                               WHERE Id IN :prpIds]);

      System.debug('Prpmap: ' + prpMap);
	
	    //make a map of chargeId to product rate plan charge with the queried product rate plan fields
	    Map<String, zqu__ProductRatePlanCharge__c> prpcMap = new Map<String, zqu__ProductRatePlanCharge__c>();
	    for(zqu__ProductRatePlanCharge__c prpc : prpcList){
	      prpcMap.put(prpc.Id, prpc);
	    }
	    System.Debug('prpcMap : ' + prpcMap);
	    //set the fields on the chargeObjects from the map
	    for(zqu.zChargeGroup cg : chargeGroups){
	      if(cg.zCharges != null && cg.zCharges.size() > 0){
	        zqu__ProductRatePlanCharge__c prpc = prpcMap.get(cg.zCharges[0].PRODUCT_RATE_PLAN_CHARGE_SFDC_ID);
	        System.Debug('prpc:' + prpc);
          zqu__ProductRatePlan__c prp = prpMap.get(prpc.zqu__ProductRatePlan__c);
	        for(zqu.zCharge c : cg.zCharges){
            System.debug('Charge object: ' + c.chargeObject);
	          c.chargeObject.put('Display__c', prp.Display__c);
	          c.chargeObject.put('PriceSchedule__c', prp.PriceSchedule__c);
	          c.chargeObject.put('TransactionTier__c', prp.TransactionTier__c);
	          c.chargeObject.put('ServiceLevel__c', prp.ServiceLevel__c);
	          c.chargeObject.put('AddOnConnector__c', prp.AddOnConnector__c);
	          c.chargeObject.put('TiersEdited__c', 'False');
	        }
	      }
	    }
    
    return chargeGroups;
  }
  /*
   *  Create the holders for new charge groups that are going to be added
   */
  private List < ChargeGroupHolder > getChargeGroupHolderList() {

    List < ChargeGroupHolder > output = new List < ChargeGroupHolder > ();
    chargeGroupHolderMap.clear();
    cghList.clear();
    //rate plan ids to add to the quote
    List < string > ratePlanIds = new List < string > ();
    //find any matching rate plans to add to the rate plan id
    //match based on ServiceLevel__c, PriceSchedule__c, TransactionTier__c
    List<string> matchingRatePlans = findMatchingRatePlans(selectedproductRatePlanSet);
    if(matchingRatePlans.size() > 0){
      ratePlanIds.addAll(matchingRatePlans);
    }
    //get the charge groups for the rate plans selected and put them in a list
    for (zqu__productRatePlan__c prp: selectedproductRatePlanSet) {
      ratePlanIds.add(prp.Id);
    }
    System.Debug( 'Making charge group holder list got rate plan ids: ' + ratePlanIds);
    if (ratePlanIds.size() > 0) {
      zqu.GlobalCustomFieldDefinition.CHARGE_FIELDS = quoteChargeCustomFields;
      ratePlanChargeGroups = zqu.zQuoteUtil.getChargeGroups(quoteId, ratePlanIds);
      System.Debug( 'Got charge groups: ' + ratePlanChargeGroups.size());
      ratePlanChargeGroups = populateChargeObjectCustomFields( ratePlanChargeGroups );
      System.Debug( 'Populating custom fields: ' + ratePlanChargeGroups.size());
      output = makeChargeGroupHolders(ratePlanChargeGroups);
    }
    System.Debug( 'Making charge group holder list' + output);
    return output;
  }
  /*
   * Given and input list of rate plans find any in the queried rate plans that have the 
   * same ServiceLevel__c, PriceSchedule__c, TransactionTier__c
  */
  private List<string> findMatchingRatePlans(Set<zqu__ProductRatePlan__c> ratePlans){
    List<string> output = new List<string>();
    //loop through all the rate plans for the product
    for(zqu__ProductRatePlan__c prp : productRatePlanList){
      //loop through the inputed rate plans
      for(zqu__ProductRatePlan__c selectedPrp : ratePlans){
        //if the fields match then we need to add it to the quote
        if(prp.ServiceLevel__c == selectedPrp.ServiceLevel__c &&
           prp.PriceSchedule__c == selectedPrp.PriceSchedule__c &&
           prp.TransactionTier__c == selectedPrp.TransactionTier__c &&
           prp.AddOnConnector__c == selectedPrp.AddOnConnector__c &&
           prp.Display__c == 'False' &&
           prp.Id != selectedPrp.Id)
          output.add(prp.Id);
      }
    }
    return output;
  }
  /*
   *  Reset values that were picked by the user
   */
  private void resetValues() {
    chargeGroupHolderMap.clear();
    cghList.clear();
    pickedServiceLevel = null;
    selectedServiceLevel = null;
    selectedPriceSchedule = null;
    selectedConnector = null;
    selectedTransactionTier = null;
    selectedAddOnConnector = null;
    pickedConnector = null;
    pickedPriceSchedule = null;
    matchingConnectors.clear();
    uniquePriceSchedules.clear();
    selectedproductRatePlanSet.clear();
    showConnectors = false;
    showPriceSchedules = false;
    productRatePlanSelected = false;
  }
  /*
   *  Build the select options for transaction tiers
   */
  private List < SelectOption > getTransactionSelectOptionList() {
    List < SelectOption > output = new List < SelectOption > ();
    output.add(new SelectOption(NONE, NONE));
    
    // for (String s: uniquePriceSchedules) {
    //   output.add(new SelectOption(s, s));
    // }
    return output;
  }

  /*
   *  Build the select options for price schedules
   */
  private List < SelectOption > getPriceScheduleSelectOptionList(List < String > uniquePriceSchedules) {
    List < SelectOption > output = new List < SelectOption > ();
    output.add(new SelectOption(NONE, NONE));
    for (String s: uniquePriceSchedules) {
      output.add(new SelectOption(s, s));
    }
    return output;
  }
  /*
   *  Build select option for connectors
   */
  private List < SelectOption > getavailableConnectorValueselectOptionList(List < Connector__c > matchingConnectors) {
    List < SelectOption > output = new List < SelectOption > ();
    output.add(new SelectOption(NONE, NONE));
    for (Connector__c c: matchingConnectors) {
      output.add(new selectOption(c.Id, c.Name));
    }
    return output;
  }
  /*
   *  Display a message on the VF page
   */
  private void appendMessage(ApexPages.Severity severity, String message) {
    ApexPages.addMessage(new ApexPages.Message(severity, message));
  }
  /*
   *  Build the rate plan query with the selected filters
   */
  private string buildRatePlanQuery() {

    DateTime thour = DateTime.now();
    String mydtstring = thour.format('yyyy-MM-dd'); 

    String ratePlanQuery = 'SELECT Id, Name, PriceSchedule__c, TransactionTier__c, ' + 
                                  'ServiceLevel__c, Display__c, zqu__Description__c, ' +
                                  'zqu__ZuoraId__c, AddOnConnector__c  ' +
                           'FROM zqu__ProductRatePlan__c ' +
                           'WHERE zqu__Deleted__c = false ' +
                           'AND zqu__EffectiveEndDate__c > ' + mydtstring +
                           ' AND zqu__EffectiveStartDate__c <= ' + mydtstring;

                           //'AND Display__c = \'True\'';

    if (!String.isEmpty(selectedProductId)) {
      ratePlanQuery += ' AND zqu__zProduct__c = \'' + selectedProductId + '\'';
    }
    if (!String.isEmpty(selectedPriceSchedule) && selectedPriceSchedule != NONE) {
      ratePlanQuery += ' AND PriceSchedule__c = \'' + selectedPriceSchedule + '\'';
    }
    if (!String.isEmpty(selectedServiceLevel) && selectedServiceLevel != NONE) {
      ratePlanQuery += ' AND ServiceLevel__c = \'' + selectedServiceLevel + '\'';
    }
    if (!String.isEmpty(selectedAddOnConnector) && selectedAddOnConnector!= NONE){
      ratePlanQuery += ' AND AddOnConnector__c = \'' + selectedAddOnConnector + '\'';
    }
    if (!String.isEmpty(selectedTransactionTier) && selectedTransactionTier!= NONE){
      ratePlanQuery += ' AND TransactionTier__c = \'' + selectedTransactionTier + '\'';
    }

    //ratePlanQuery += ' LIMIT 1000'; 

    return ratePlanQuery;
  }
  /*
   *  get the rate plans
   */
  private Boolean getProductRatePlans() {
    productRatePlanZuoraIdMap.clear();
    String ratePlanQuery = buildRatePlanQuery();
    System.Debug('ratePlanQuery: ' + ratePlanQuery);
    productRatePlanList = Database.query(ratePlanQuery);
    System.debug('### Retrieved ' + productRatePlanList.size() + ' product rate plan(s)');
    productRatePlanMap = new Map < ID, zqu__productRatePlan__c > (productRatePlanList);
    List<zqu__ProductRatePlan__c> displayPrpList = new List<zqu__ProductRatePlan__c>();
    for (zqu__productRatePlan__c prp : productRatePlanList) {
      //if the display flag is set add it to the map of pickable rate plans
      if(prp.display__c == TRUESTR){
        displayPrpList.add(prp);
        // Add the account to the map, default selected = false
        selectedproductRatePlanMap.put(prp.Id, false);
      }
      productRatePlanZuoraIdMap.put(prp.zqu__ZuoraId__c, prp);
    }
    // Initialize the standard set (for the table on the VF page)
    productRatePlanSet = new ApexPages.StandardSetController(displayPrpList);
    productRatePlanSet.setPageSize(PAGE_SIZE);

    //4/2/2014 adding TransactionTiers drop down refreshed whenever the rate plans are gotten
    transactionTierValues = getTransactionTiersSelectOptionList(productRatePlanList);

    // Successfully validated the context
    return true;
  }
  /*
   * Get a list of unique transaction tiers from the rate plans
   */
  private List<SelectOption> getTransactionTiersSelectOptionList(List<zqu__ProductRatePlan__c> prpList){
    List<SelectOption> output = new List<SelectOption>();
    output.add(new SelectOption(NONE, NONE));
    Set<String> uniqueTransactionTiers = new Set<String>();
    for(zqu__productRatePlan__c prp : prpList){
      if(!String.isEmpty(prp.TransactionTier__c))
      uniqueTransactionTiers.add(prp.TransactionTier__c);
    }
    List<String> sortedList = new List<String>(uniqueTransactionTiers);
    sortedList.sort();
    for(String s : sortedList){
      output.add(new SelectOption(s, s));
    }
    return output;
  }
  /*
   *  Get a list of picklist values from an existing object field
   */
  private List < String > getConnectorPicklistValues(String fld) {
    List < String > output = new List < String > ();
    // Get the object type of the SObject.
    Schema.sObjectType objType = Connector__c.getSObjectType();
    // Describe the SObject using its object type.
    Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
    // Get a map of fields for the SObject
    Map < String, Schema.SObjectField > fieldMap = objDescribe.fields.getMap();
    // Get the list of picklist values for this field.
    List < Schema.PicklistEntry > values = fieldMap.get(fld).getDescribe().getPickListValues();
    // Add these values to the selectoption list.
    for (Schema.PicklistEntry a: values) {
      output.add(a.getValue());
    }
    return output;
  }
  /*
   *  Get the unique price schedules from the queried rate plans
   */
  private List < string > getUniquePriceSchedules(List < zqu__ProductRatePlan__c > prpList) {
    Set < string > outputSet = new Set < string > ();
    for (zqu__ProductRatePlan__c prp: prpList) {
      if (!String.isEmpty(prp.PriceSchedule__c)) {
        outputSet.add(prp.PriceSchedule__c);
      }
    }
    return new List < string > (outputSet);
  }
  /*
   *  Find the connectors with the passed in price schedules
   */
  private List < Connector__c > getConnectorsForPriceSchedules(List < String > priceSchedules) {
    System.Debug('Getting connectors for priceSchedules: ' + priceSchedules);
    List < Connector__c > output = new List < Connector__c > ();
    if (priceSchedules.size() == 0) {
      return output;
    }
    String connectorQuery = 'SELECT Id, Name, ProductName__c, Pricing_Schedule__c ' +
      'FROM Connector__c ' +
      'WHERE Pricing_Schedule__c= \'';

    String whereClause = String.join(priceSchedules, '\' OR Pricing_Schedule__c = \'');
    whereClause += '\'';
    whereClause += ' ORDER BY Name';
    System.Debug( 'Connector query : ' + connectorQuery + whereClause );
    output = Database.query(connectorQuery + whereClause);
    return output;
  }
  /*
   *  Hanldes logic for if there is a connector related to the product
   *  Handles display of rate plans price schedules and connectors
   */
  private void doConnectorLogic() {
    System.Debug( 'Connector product names : ' + connectorProductNames );
    //check if the connectors product picklist has the selected product
    if (!(new Set < String > (connectorProductNames)).contains(selectedProductName)) {
      System.Debug( 'Connector products names do not have the selected product');
      // Render Price Schedule drop down with values from the PriceSchedules
      //setup the values for the price schedule pickList
      priceScheduleValues = getPriceScheduleSelectOptionList(uniquePriceSchedules);
      if (uniquePriceSchedules.size() > 0) {
        showPriceSchedules = true;
      }
    }
    else {
      System.Debug( 'Connector products names have the selected product');
      //get the connectors with the price schedule
      matchingConnectors = getConnectorsForPriceSchedules(uniquePriceSchedules);
      System.Debug( 'Found matching connectors: ' + matchingConnectors );
      //make a map to look up the connector when its selected
      connectorMap = new Map < Id, Connector__c > (matchingConnectors);
      //reset the list of available connetors for the newly selected product
      availableConnectorValues = getAvailableConnectorValueSelectOptionList(matchingConnectors);
          System.Debug( 'matchingConnectors.size() = ' + matchingConnectors.size());
      
        if (matchingConnectors.size() > 0) {
      
          showConnectors = true;
      }
    }
    //if there are no price schedules or connectors show all the rate plans for the product 
    if (matchingConnectors.size() == 0 && uniquePriceSchedules.size() == 0) {
      showRatePlans = true;
    }
    else {
      showRatePlans = false;
    }
  }
  /* 
    Formats this:
    
    (zChargeGroupActions.addSubscriptionChargeGroups) Insert failed. 
    First exception on row 0; 
    first error: FIELD_CUSTOM_VALIDATION_EXCEPTION, 
    ALERT___Usage Items Cannot be discounted__: 
    []:System.DmlException:Insert failed. 
    First exception on row 0; first error: 
    FIELD_CUSTOM_VALIDATION_EXCEPTION, 
    ALERT___Usage Items Cannot be discounted__: 
    []:(zqu) Class.ProductSelectorController.addNewCharges: 
    line 885, column 1 Class.ProductSelectorController.save: 
    line 866, column 1 Class.ProductSelectorController.saveAndClose: 
    line 774, column 1 Class.ProductSelectorController.validateAndSaveQuote: 
    line 826, column 1

    Into this: 

    Usage Items Cannot be discounted
  */
  private String formatErrorMessage(String s){
    String output = s;
    integer alertIndex = s.indexOf('::');
    integer endAlertIndex = s.indexOf(':::');
    //find the ALERT___ and __:
    if(alertIndex != -1 && endAlertIndex != -1){

      output = s.substring(alertIndex+2, endAlertIndex);
    }
    return output;
  }
  /* 
   * Setup the notification options 
   */
  private zqu.NotificationOptions getNotificationOptions(){
    zqu.NotificationOptions no = new zqu.NotificationOptions();
    no.failureTitle = 'There are validation errors, please fix the following:';
    return no;
  }
}