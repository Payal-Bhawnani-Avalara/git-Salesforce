public with sharing class QuoteSplit {
  public static final String REMOVEPRODUCT = 'RemoveProduct';
  //map of quote amendment id to boolean if it has sub quote charges
  public static Map<String, Boolean> quoteRatePlanToSubQuoteOnChargeMap{
    get{
      if( quoteRatePlanToSubQuoteOnChargeMap == null ){
        quoteRatePlanToSubQuoteOnChargeMap =  new Map<String,Boolean>();
      }
      return quoteRatePlanToSubQuoteOnChargeMap;
    }
    set;
  }

  public static zqu__Quote__c subQuote;
  public static zqu__Quote__c quote;

  private static List<zqu__QuoteRatePlan__c> qrpList;

  public static boolean createTwo{
    get{
      if(createTwo == null){
        createTwo = false;
      }
      return createTwo;
    }
    set;
  }
  /*
   * Split the quote if necessary to achieve full credit / debit proration
   */
  public static List<String> doQuoteSplit(String quoteId){

    List<String> output = new List<String>();
    createTwo = shouldCreateTwoQuotes(quoteId);
    if(createTwo){
      System.Debug('Creating two quotes');
      output = createTwoQuotes(quoteId);
    }
    else{
      System.Debug('Should create regular quote');
      output.add(quoteId);
    }
    return output;
  }
  /*
   * Find product plan charges that are from a remove product amendment
   * if there is is one with sub quote == true the we should create a sub quote
  */
  public static boolean shouldCreateTwoQuotes(string quoteId){
    if(qrpList != null){
      qrpList.clear();
    }
    if(quoteRatePlanToSubQuoteOnChargeMap != null){
      quoteRatePlanToSubQuoteOnChargeMap.clear();
    }
    boolean output = false;
    //In SFDC find QuoteRatePlans that are from a RemoveProduct amendment
    qrpList = [SELECT Id, 
                      zqu__AmendmentType__c,
                      zqu__ProductRatePlanZuoraId__c,
                      zqu__QuoteAmendment__c,
                      zqu__QuoteAmendment__r.Name,
                      Name
               FROM zqu__QuoteRatePlan__c
               WHERE zqu__Quote__c = :quoteId
               AND zqu__AmendmentType__c = :REMOVEPRODUCT];

    System.Debug('Got qrpList: ' + qrpList);
    //find the product rate plan charges with sub quote == true whose product rate plan zuora id is from the amendment
    List<string> rateplanZIdList = new List<string>();
    for(zqu__QuoteRatePlan__c qrp : qrpList){
      rateplanZIdList.add(qrp.zqu__ProductRatePlanZuoraId__c);
    }

    List<zqu__ProductRatePlan__c> prpList = [SELECT Id,
                                                    zqu__ZuoraId__c
                                             FROM zqu__ProductRatePlan__c
                                             WHERE zqu__ZuoraId__c IN :rateplanZIdList];
    System.Debug('Got prpList: ' + prpList);
    //map to get from the rate plan zuora id to the rate plan sfdc id
    //to get to the sub quote charge                                         
    Map<String,String> rpZToSIdMap = new Map<String,String>();

    List<string> ratePlanSIdList = new List<string>();
    for(zqu__ProductRatePlan__c prp : prpList){
      ratePlanSIdList.add(prp.Id);
      rpZToSIdMap.put(prp.zqu__ZuoraId__c, prp.Id);
    }
    //get the product rate plan charges that are from the quote product rate plan and have sub quote = true
    List<zqu__ProductRatePlanCharge__c> prpcList = [SELECT Id,
                                                           SubQuote__c,
                                                           zqu__ProductRatePlan__c,
                                                           zqu__ProductRatePlan__r.Name
                                                    FROM zqu__ProductRatePlanCharge__c
                                                    WHERE zqu__ProductRatePlan__c IN :ratePlanSIdList
                                                    AND SubQuote__c = 'True'];

    System.Debug('Got prpcList: ' + prpcList);
    //map to get from the rate plan sfdc id to the related charge to be used later to determine what charges to manipulate                                            
    Map<String,String> rpSIdToChargeIdMap = new Map<String, String>();
    for(zqu__ProductRatePlanCharge__c prpc : prpcList){
      rpSIdToChargeIdMap.put(prpc.zqu__ProductRatePlan__c, prpc.Id);
    }
    //make the map of amendent to if it has a sub quote charge
    for(zqu__QuoteRatePlan__c qrp : qrpList){
      //get the product rate plan sfdc id from the amendment zuora id
      string prpSId = rpZToSIdMap.get(qrp.zqu__ProductRatePlanZuoraId__c);
      if( prpSId != null ){
        //see if there is a charge id the rate plan sfdc to charge map
        string chargeId = rpSIdToChargeIdMap.get( prpSId );
        if( chargeId != null ){
          //there is a sub quote charge found
          quoteRatePlanToSubQuoteOnChargeMap.put( qrp.Id, true );
          output = true;
        }
        else{
          //there is no subquote charge found
          quoteRatePlanToSubQuoteOnChargeMap.put( qrp.Id, false );
        }
      }
    }
    System.Debug('should we create two quotes: ' + output);
    System.Debug('quoteRatePlanToSubQuoteOnChargeMap: ' + quoteRatePlanToSubQuoteOnChargeMap);
    return output;
  }
  /*
   * Create the two quotes:
   * Quote 1 ( original ): add one time and recurring charges + add usage charge 
   * + remove old one time and recurring charges -> effective quote start date
   * Quote 2 ( subQuote ) : remove old usage charge -> effective today
   */
  private static List<String> createTwoQuotes(String quoteId){
    //Clone the quote to create sub quote
    cloneQuote(quoteId);
    processOriginalQuote();
    //reload the stuff with the sub quote id
    //this will rebuild the map of rate plan to sub charge on quote to know what to remove
    shouldCreateTwoQuotes(subQuote.Id);
    processSubQuote();
    return new List<String>{quote.Id, subQuote.Id};
  }
  /*
   * Quote 1: add one time and recurring charges + add usage charge 
   * + remove old one time and recurring charges -> effective quote start date
   */
  private static void processOriginalQuote(){
    //Remove the SubQuote == ‘True’ RemoveProduct Amendment from the original quote
    //This information is somewhere in the shouldWeCreateSubQUote
    for(zqu__QuoteRatePlan__c qrp : qrpList){
      if(quoteRatePlanToSubQuoteOnChargeMap.containsKey(qrp.Id) && quoteRatePlanToSubQuoteOnChargeMap.get(qrp.Id)){
        //its a sub quote rate plan, find the related quote amendment and delete it
        //there are no quote rate plan charges
        System.Debug('removing quote amendment: ' + qrp.zqu__QuoteAmendment__r.Name);
        Database.delete(qrp.zqu__QuoteAmendment__c);
        break;
      }
    }
  }
  /*
   * Quote 2: remove old usage charge -> effective today
   */
  private static void processSubQuote(){
    List<string> quoteAmendmentsToDelete = new List<String>();
    //Keep the RemoveProduct Amendment for the SubQuote == ‘True’ on the sub quote
    List<zqu__QuoteRatePlan__c> allQuoteAmendments = [SELECT Id, 
                                                              zqu__AmendmentType__c,
                                                              zqu__ProductRatePlanZuoraId__c,
                                                              zqu__QuoteAmendment__c,
                                                              zqu__QuoteAmendment__r.zqu__Description__c,
                                                              Name
                                                       FROM zqu__QuoteRatePlan__c
                                                       WHERE zqu__Quote__c = :subQuote.Id];
    System.Debug('allQuoteAmendments: ' + allQuoteAmendments);
    System.Debug('deleted qrpList: ' + qrpList);

    for(zqu__QuoteRatePlan__c qrp : allQuoteAmendments){
      if(quoteRatePlanToSubQuoteOnChargeMap.containsKey(qrp.Id) && quoteRatePlanToSubQuoteOnChargeMap.get(qrp.Id)){
        //only condition to ignore
        //it means its the removed usage charge
      }
      else{
        //remove the rate plan and stuff
        System.Debug('removing: ' + qrp.zqu__QuoteAmendment__r.zqu__Description__c);
        quoteAmendmentsToDelete.add(qrp.zqu__QuoteAmendment__c);
      }
    }
    System.Debug('quoteAmendmentsToDelete: ' + quoteAmendmentsToDelete);
    //Remove all other amendments on the sub quote
    Database.delete(quoteAmendmentsToDelete);
    //Set the sub quote start date to today
    subQuote.zqu__StartDate__c = Date.today();
    //TODO THE QUOTE DATE NEEDS TO BE TODAY
    //MAYBE rolling refRESH x3
    update subQuote;
  }
  /*
  Clone and insert the subQuote
  */
  public static void cloneQuote(String quoteId){
    quote = getQuoteInfo(quoteId);
    //quote.name = 'cloned';
    String zSubId = quote.zqu__ZuoraSubscriptionID__c;

    //this is a unique external id, need to remove it
    quote.zqu__ZuoraSubscriptionID__c = '';
    update quote;
    subQuote = quote.clone(false, true, false, false);
    subQuote.name += ' cloned';
    subQuote.zqu__ZuoraSubscriptionID__c = zSubId;
    subQuote.zqu__Status__c = 'New';

    Schema.DescribeSObjectResult dsr = Schema.SObjectType.zqu__Quote__c;
    Schema.RecordTypeInfo defaultrtinfo;
    if(subQuote.zqu__SubscriptionType__c == 'Amend Subscription'){
      defaultrtinfo = dsr.getRecordTypeInfosByName().get('Amendment');
    }
    else if(subQuote.zqu__SubscriptionType__c == 'Renew Subscription'){
      defaultrtinfo = dsr.getRecordTypeInfosByName().get('Renewal');
    }
    else{
      defaultrtinfo = dsr.getRecordTypeInfosByName().get('Default');
    }
    subQuote.RecordTypeId = defaultrtinfo.getRecordTypeId();


    insert subQuote;
    System.Debug('Cloned Quote');
    if(quote.zqu__SubscriptionType__c != 'New Subscription'){
      cloneAmendQuoteObjects(quote.Id, subQuote.Id);
    }
    else{
      clonesubQuoteObjects(quote.Id, subQuote.Id);
    }
  }
  /*
  Handles cloning new quote charges
  */
  private static void clonesubQuoteObjects(String oldQuoteId, String subQuoteId){
    System.Debug('Cloning new quote objects');
    List<zqu__QuoteCharge__c> newQcList = new List<zqu__QuoteCharge__c>();
    List<zqu__QuoteCharge__c> oldQcList = new List<zqu__QuoteCharge__c>();

    //get the quote charges on the old quote
    List<sObject> sObjects = Database.query(getCreatableFieldsSOQL('zqu__QuoteCharge__c', 'zqu__quote__c =\'' + oldQuoteId + '\'' ));  
    //cast sObject as zQuoteCharge
    for(sObject obj : sObjects){
      oldQcList.add((zqu__QuoteCharge__c) obj );
    }

    for(zqu__QuoteCharge__c qc : oldQcList){
      //clone quote charges
      zqu__QuoteCharge__c temp = qc.clone(false, true, false, false);
      //set new quote id
      temp.zqu__Quote__c = subQuoteId;
      newQcList.add(temp);
    }

    if(!newQcList.isEmpty()){
      insert newQcList;
    }
  }
  /*
  Handles cloning amendment quote charges
  */
  private static void cloneAmendQuoteObjects(String oldQuoteId, String subQuoteId){
    System.Debug('Cloning Amend Quote Objects');
    List<List<zqu__QuoteAmendment__c>> amendmentLists = cloneQuoteAmendments(oldQuoteId, subQuoteId);
    //need to set the amendment id on the quote rate plan it is set to the old one
    List<List<zqu__QuoteRatePlan__c>> lists = cloneQuoteRatePlans(oldQuoteId, subQuoteId, amendmentLists);
    List<zqu__QuoteRatePlan__c> oldQrpList = lists[0];
    List<zqu__QuoteRatePlan__c> newQrpList = lists[1];

    cloneQuoteRatePlanCharges(oldQrpList, newQrpList);
  }
  /*
  Matches the quote amendment, returns the matching one if they match
  */
  private static zqu__QuoteAmendment__c matchQuoteAmendment(zqu__QuoteAmendment__c lookup, List<zqu__QuoteAmendment__c> qaList){
    //if this does not suffice will need to do it in the clone quote amendmments and insert them 1 by 1 so the new id is knowm
    for(zqu__QuoteAmendment__c qa : qaList){
      if(lookup.Name == qa.Name &&
         //lookup.CreatedDate == qa.CreatedDate &&
         lookup.zqu__Status__c == qa.zqu__Status__c &&
         lookup.zqu__Description__c == qa.zqu__Description__c &&
         lookup.zqu__DeltaMRR__c == qa.zqu__DeltaMRR__c &&
         lookup.zqu__Type__c == qa.zqu__Type__c &&
         lookup.zqu__TotalAmount__c == qa.zqu__TotalAmount__c &&
         lookup.zqu__DeltaTCV__c == qa.zqu__DeltaTCV__c){
         return qa; 
      }
    }
    return null;
  }
  /*
  Matchs the quote rate plans, returns the matching one if they match
  */
  private static zqu__QuoteRatePlan__c matchQuoteRatePlan(zqu__QuoteRatePlan__c lookup, List<zqu__QuoteRatePlan__c> quoteRatePlanList){
    //if this does not suffice will need to do it in the clone quote rate plan and insert the rate plans 1 by 1
    for(zqu__QuoteRatePlan__c qrp : quoteRatePlanList){
      if(lookup.Name == qrp.Name &&
         //lookup.CreatedDate == qrp.CreatedDate && 
         lookup.zqu__QuoteProductName__c == qrp.zqu__QuoteProductName__c &&
         lookup.zqu__AmendmentType__c == qrp.zqu__AmendmentType__c && 
         lookup.zqu__ProductRatePlanZuoraId__c == qrp.zqu__ProductRatePlanZuoraId__c){
         return qrp; 
      }
    }
    return null;
  }
  /*
  Matches the quote rate plan charge, returns the matching one if they match
  */
  private static zqu__QuoteRatePlanCharge__c matchQuoteRatePlanCharge(zqu__QuoteRatePlanCharge__c lookup, List<zqu__QuoteRatePlanCharge__c> qrpcList){
    //if this does not suffice will need to do it in the clone quote amendmments and insert them 1 by 1 so the new id is knowm
    for(zqu__QuoteRatePlanCharge__c qrpc : qrpcList){
      if(lookup.Name == qrpc.Name &&
         //lookup.CreatedDate == qrpc.CreatedDate && cant do this bc its not a creatable field
         lookup.zqu__Description__c == qrpc.zqu__Description__c &&
         lookup.zqu__Discount__c == qrpc.zqu__Discount__c &&
         lookup.zqu__EffectivePrice__c == qrpc.zqu__EffectivePrice__c &&
         lookup.zqu__ListTotal__c == qrpc.zqu__ListTotal__c &&
         lookup.zqu__MRR__c == qrpc.zqu__MRR__c &&
         lookup.zqu__ProductRatePlanChargeZuoraId__c == qrpc.zqu__ProductRatePlanChargeZuoraId__c &&
         lookup.zqu__Quantity__c == qrpc.zqu__Quantity__c &&
         lookup.zqu__QuoteRatePlanChargeZuoraId__c == qrpc.zqu__QuoteRatePlanChargeZuoraId__c &&
         lookup.zqu__SubscriptionRatePlanChargeZuoraId__c == qrpc.zqu__SubscriptionRatePlanChargeZuoraId__c &&
         lookup.zqu__TCV__c == qrpc.zqu__TCV__c &&
         lookup.zqu__Total__c == qrpc.zqu__Total__c
         ){
         return qrpc; 
      }
    }
    return null;
  }
  /*
  Clone quote rate plan charges
  */
  private static void cloneQuoteRatePlanCharges(List<zqu__QuoteRatePlan__c> oldQrpList, List<zqu__QuoteRatePlan__c> newQrpList){
    List<zqu__QuoteRatePlanCharge__c> oldQrpcList = new List<zqu__QuoteRatePlanCharge__c>();
    List<zqu__QuoteRatePlanCharge__c> newQrpcList = new List<zqu__QuoteRatePlanCharge__c>();
    //make a map of the old qrp id to the new qrp id
    Map<String, String> oldToNewIdMap = new Map<String, String>();
    for(zqu__QuoteRatePlan__c qrp : oldQrpList){
      //find the matching quote rate plan in the new list
      oldToNewIdMap.put(qrp.Id, matchQuoteRatePlan(qrp, newQrpList).Id);
    }   
    //build the where clause
    Set<ID> qrpIds = new Set<ID>();
    for(zqu__QuoteRatePlan__c qrp : oldQrpList){
      qrpIds.add(qrp.Id); 
    } 
    //get the quote rate plan charges for each of the old quote rate plans
    List<sObject> qrpcSObjects = Database.query(getCreatableFieldsSOQL('zqu__QuoteRatePlanCharge__c', buildWhereClause(qrpIds, 'zqu__QuoteRatePlan__c') ));  
    //cast sObjets as quote rate plan charges
    for(SObject obj : qrpcSObjects){
      oldQrpcList.add((zqu__QuoteRatePlanCharge__c) obj );
    }
    for(zqu__QuoteRatePlanCharge__c qrpc : oldQrpcList){
      //clone quote rate plans charges
      zqu__QuoteRatePlanCharge__c temp = qrpc.clone(false, true, false, false);
      //set the new quote rate plan ids
      if(oldToNewIdMap.containsKey(qrpc.zqu__QuoteRatePlan__c)){
        temp.zqu__QuoteRatePlan__c = oldToNewIdMap.get(qrpc.zqu__QuoteRatePlan__c);
        newQrpcList.add(temp);
      }
    }
    if(!newQrpcList.isEmpty()){
      insert newQrpcList;
    }
    //This is a workaround, for new ones it automagically created the charge summaries
    cloneChargeSummaries(oldQrpcList, newQrpcList);
  }
  /*
  Theres a bug or something for amendments these don't get auto generated
  Clone Quote Rate Plan Charge, Charge Summaries
  */
  private static void cloneChargeSummaries(List<zqu__QuoteRatePlanCharge__c> oldQrpcList, List<zqu__QuoteRatePlanCharge__c> newQrpcList ){
    //get all the quote charge summaries for the quote
    List<zqu__QuoteChargeSummary__c> oldQcsList = new List<zqu__QuoteChargeSummary__c>();
    List<zqu__QuoteChargeSummary__c> newQcsList = new List<zqu__QuoteChargeSummary__c>();

    Map<Id, zqu__QuoteRatePlanCharge__c> oldToNewMap = new Map<Id, zqu__QuoteRatePlanCharge__c>();
    for(zqu__QuoteRatePlanCharge__c qrp : oldQrpcList){
      //find the matching quote rate plan charge in the new list
      oldToNewMap.put(qrp.Id, matchQuoteRatePlanCharge(qrp, newQrpcList));
    } 

    //build the where clause
    Set<ID> qrpcIds = new Set<ID>();
    for(zqu__QuoteRatePlanCharge__c qrpc : oldQrpcList){
      qrpcIds.add(qrpc.Id); 
    }
    //get the quote charge summaries
    List<sObject> qcsSObjects = Database.query(getCreatableFieldsSOQL('zqu__QuoteChargeSummary__c', buildWhereClause(qrpcIds, 'zqu__QuoteRatePlanCharge__c') ));  
    //cast sObjects as Quote Charge Summaries
    for(sObject obj: qcsSObjects){
      oldQcsList.add((zqu__QuoteChargeSummary__c) obj );
    }
    //clone each charge summary
    for(zqu__QuoteChargeSummary__c qcs : oldQcsList){
      zqu__QuoteChargeSummary__c temp = qcs.clone(false, true, false, false);

      //need to set the opp
      temp.zqu__Opportunity__c = subQuote.zqu__Opportunity__c;
      if(oldToNewMap.containsKey(qcs.zqu__QuoteRatePlanCharge__c)){
        zqu__QuoteRatePlanCharge__c newQrpc = oldToNewMap.get(qcs.zqu__QuoteRatePlanCharge__c);
        //need to set the quote rate plan charge
        temp.zqu__QuoteRatePlanCharge__c = newQrpc.Id;
        //need to set quote rate plan, this can be taken from the charge
        temp.zqu__QuoteRatePlan__c = newQrpc.zqu__QuoteRatePlan__c;
        newQcsList.add(temp);
      }
    }
    if(!newQcsList.isEmpty()){
      insert newQcsList;
    } 
  }
  /*
  Clone Quote Amendments
  */
  private static List<List<zqu__QuoteAmendment__c>> cloneQuoteAmendments(String oldQuoteId, String subQuoteId){
    List<zqu__QuoteAmendment__c> oldAmendList = new List<zqu__QuoteAmendment__c>();
    List<zqu__QuoteAmendment__c> newAmendList = new List<zqu__QuoteAmendment__c>();
    List<zqu__QuoteAmendment__c> updateList = new List<zqu__QuoteAmendment__c>();

    //get the quote amendments
    List<sObject> amendmentSObjects = Database.query(getCreatableFieldsSOQL('zqu__QuoteAmendment__c', 'zqu__quote__c =\'' + oldQuoteId + '\'' ));  
    //cast sObjets as amendments
    for(sObject obj: amendmentSObjects){
      oldAmendList.add((zqu__QuoteAmendment__c) obj );
    }
    for(zqu__QuoteAmendment__c qa : oldAmendList){
      //clone amendments
      zqu__QuoteAmendment__c temp = qa.clone(false, true, false, false);
      //set new quote id      
      temp.zqu__Quote__c = subQuoteId;
      newAmendList.add(temp);
      //need to remove the zqu__QuoteAmendmentZuoraId__c from the old charge and update it
      //its Text(32) (External ID) (Unique Case Insensitive)
      qa.zqu__QuoteAmendmentZuoraId__c = '';
      updateList.add(qa);
    }
    if(!updateList.isEmpty()){
      update updateList;
    }
    if(!newAmendList.isEmpty()){
      insert newAmendList;
    }
    return new List<List<zqu__QuoteAmendment__c>>{ oldAmendList, newAmendList };  
  }
  /*
  Clone Quote Rate Plans, return the old ones to use when making the charges
  */
  private static List<List<zqu__QuoteRatePlan__c>> cloneQuoteRatePlans(String oldQuoteId, String subQuoteId, List<List<zqu__QuoteAmendment__c>> amendmentLists){
    List<zqu__QuoteAmendment__c> oldAmendList = amendmentLists[0];
    List<zqu__QuoteAmendment__c> newAmendList = amendmentLists[1];
    //make a map of the old qa id to the new qa id
    Map<String, String> oldToNewIdMap = new Map<String, String>();
    for(zqu__QuoteAmendment__c qa : oldAmendList){
      //find the matching quote rate plan in the new list
      oldToNewIdMap.put(qa.Id, matchQuoteAmendment(qa, newAmendList).Id);
    } 
    List<zqu__QuoteRatePlan__c> oldQrpList = new List<zqu__QuoteRatePlan__c>();
    List<zqu__QuoteRatePlan__c> newQrpList = new List<zqu__QuoteRatePlan__c>();
    //get the quote rate plans for the old quote
    List<sObject> ratePlanSObjects = Database.query(getCreatableFieldsSOQL('zqu__QuoteRatePlan__c', 'zqu__quote__c =\'' + oldQuoteId + '\'' ));  
    //cast sObject as quote rate plans
    for(sObject obj : ratePlanSObjects){
      oldQrpList.add((zqu__QuoteRatePlan__c) obj );
    }
    for(zqu__QuoteRatePlan__c qrp : oldQrpList){
      //clone quote rate plans 
      zqu__QuoteRatePlan__c temp = qrp.clone(false, true, false, false);
      //set the new quote id
      temp.zqu__Quote__c = subQuoteId;
      if(oldToNewIdMap.containsKey(temp.zqu__QuoteAmendment__c)){
        temp.zqu__QuoteAmendment__c = oldToNewIdMap.get(temp.zqu__QuoteAmendment__c);
        newQrpList.add(temp);
      }
    }
    if(!newQrpList.isEmpty()){
      insert newQrpList;
    }
    return new List<List<zqu__QuoteRatePlan__c>>{ oldQrpList, newQrpList };
  }
  /*
  Get the information for the quote
  */
  private static zqu__Quote__c getQuoteInfo(String quoteId){
    return (zqu__Quote__c)Database.query(getCreatableFieldsSOQL('zqu__Quote__c', 'id=\'' + quoteId + '\''));
  }
  /*
  Build the where clause
  */
  private static String buildWhereClause(Set<Id> input, String objectName){
    String whereClause = '';
    integer inputSize = input.size();
    integer counter = 0;
    //make the where clause with all the ids
    for(Id tempId : input){
      whereClause += ' ' + objectName + ' =\''+ tempId +'\' '; 
      if(counter != inputSize - 1){
        whereClause += 'OR ';
      }
      counter ++;
    }
    //System.Debug('WHERECLAUSE: ' + whereClause);
    return whereClause;
  }
  /*
  Returns a dynamic SOQL statement for the whole object, includes only creatable fields since we will be inserting a cloned result of this query
  */
  private static string getCreatableFieldsSOQL(String objectName, String whereClause){
    String selects = '';
    if (whereClause == null || whereClause == ''){ return null; }
    // Get a map of field name and field token
    Map<String, Schema.SObjectField> fMap = Schema.getGlobalDescribe().get(objectName.toLowerCase()).getDescribe().Fields.getMap();
    list<string> selectFields = new list<string>();
     
    if (fMap != null){
      // loop through all field tokens (ft)
      for (Schema.SObjectField ft : fMap.values()){
        // describe each field (fd)
        Schema.DescribeFieldResult fd = ft.getDescribe();
        // field is creatable 
        if (fd.isCreateable()){
          selectFields.add(fd.getName());
        }
      }
    }
    if (!selectFields.isEmpty()){
      for (string s:selectFields){
        selects += s + ',';
      }
      if (selects.endsWith(',')){selects = selects.substring(0,selects.lastIndexOf(','));}    
    }
    return 'SELECT ' + selects + ' FROM ' + objectName + ' WHERE ' + whereClause;
  }
}