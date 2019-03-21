public with sharing class APIBookings{
    public static void calculateBookings(Set<Id> oppIDs){
            if(oppIDs!=null && oppIDs.size()>0){                
                Map<Id,Opportunity> mapOpportunities=new Map<Id,Opportunity>([Select Id,OwnerId,AccountId,Type,PROS_Order_Quote__c,Connector__c,
                                                                            (Select Id,ContractEffectiveDate__c,Access_Start_Override__c,InvoiceOwnerId__c,ActualFreeMonths__c 
                                                                            From PROS_Quotes__r Order by CreatedDate Desc limit 1),                                                                                                                                                                                                                         
                                                                            (Select Id,Quantity,RPTCId__c,PRPCId__c,End_of_Agreement_Behavior__c,DiscountAmount__c,
                                                                            TotalPrice__c,ListPrice__c,BillingFrequency__c,AmendmentType__c From OpportunityLineItems)
                                                                            From Opportunity Where Id=:oppIDs]);
            if(mapOpportunities!=null && mapOpportunities.size()>0){
                String oppLineItemId;
                List<OpportunityLineItem> oliList=new List<OpportunityLineItem>();
                Map<String,Opportunity> oppMap=new Map<String,Opportunity>();
                String namedCredentialName='Bookings_API_FQA';
                if(![SELECT IsSandbox FROM Organization LIMIT 1].IsSandbox){
                    namedCredentialName='Bookings_API_Prod';
                }
                for(Opportunity o:mapOpportunities.values()){
                    CameleonCPQ__Quote__c cpq=null;
                    if(o.PROS_Quotes__r.size()==1){
                        cpq=o.PROS_Quotes__r[0];
                    }
                    if(cpq!=null && o.OpportunityLineItems.size()>0){   
                        
                        Date effectiveFrom=Date.today();
                        //loop through all line items to create JSON
                        APIBookingTemplate abt=new APIBookingTemplate();
                        abt.externalId=o.Id;
                        abt.customerAccountId=o.AccountId;
                        abt.type=o.Type;
                        abt.status='Active';
                        abt.effectiveFrom=formatDate(effectiveFrom);
                        if(cpq.ContractEffectiveDate__c!=null && 
                            String.isNotBlank(cpq.Access_Start_Override__c) && 
                            cpq.Access_Start_Override__c=='Yes'){
                            abt.effectiveFrom=formatDate(cpq.ContractEffectiveDate__c);
                        }
                        
                        abt.addItems=new List<APIBookingTemplate.AddItem>();        
                        abt.dropItems=new List<APIBookingTemplate.DropItem>();
                        for(OpportunityLineItem oli:o.OpportunityLineItems){
                            oppLineItemId=oli.Id;
                            if(String.isNotBlank(oli.AmendmentType__c) && oli.AmendmentType__c.equalsIgnoreCase('RemoveProduct')){
                                APIBookingTemplate.DropItem di=new APIBookingTemplate.DropItem();
                                di.externalId = oli.Id;
                                di.quantity = oli.Quantity;
                                di.effectiveFrom=abt.effectiveFrom;
                                di.addRateplanChargeId = oli.PRPCId__c;
                                abt.dropItems.add(di);
                            }  
                            else{
                                APIBookingTemplate.AddItem ai=new APIBookingTemplate.AddItem();
                                ai.externalId = oli.Id;
                                ai.invoiceOwnerId =o.OwnerId;
                                ai.quantity = oli.Quantity;
                                ai.featureDetailId ='null';
                                ai.cpqId = oli.RPTCId__c;
                                //ai.endOfAgreementBehavior = oli.End_of_Agreement_Behavior__c;
                                //ai.discountAmount = oli.DiscountAmount__c;
                                ai.discountPercentage =  0;//ask for more info
                                ai.accessStart = abt.effectiveFrom;
                                ai.termStart = formatDate(effectiveFrom);
                                ai.termEnd=formatDate(effectiveFrom.addMonths(12));
                                if(cpq.ActualFreeMonths__c!=null){
                                    ai.termStart=formatDate(effectiveFrom.addMonths(Integer.valueOf(cpq.ActualFreeMonths__c)));
                                    ai.termEnd=formatDate(effectiveFrom.addMonths(Integer.valueOf(cpq.ActualFreeMonths__c)).addMonths(12));
                                }
                                ai.billingFrequency = oli.BillingFrequency__c;
                                if(String.isBlank(ai.billingFrequency)){
                                    ai.billingFrequency='Annual';
                                }
                                ai.connectorId = o.Connector__c;
                                ai.discountedExtendedAmount = oli.TotalPrice__c;
                                ai.listPrice = oli.ListPrice__c;
                                abt.addItems.add(ai);
                            }                           
                        }               
                        //END       
                        string json=JSON.serialize(abt);    
                        system.debug('requestString====='+json);
                        HTTPRequest req = new HTTPRequest();
                        req.setTimeout(120000);
                        req.setEndpoint('callout:'+namedCredentialName);
                        req.setHeader('Authorization', '{!$Credential.Username} '+'{!$Credential.Password}');
                        req.setMethod('POST');
                        req.setHeader('Content-Type','application/json');
                        req.setBody(json);
                        Http http = new Http();
                        HttpResponse res;
                        if(Test.isRunningTest()){
                                res = new HttpResponse();
                            res.setHeader('Content-Type', 'application/json');
                            res.setBody('{"data":{"items":[{"externalId":"'+oppLineItemId+'","bookedValues":{"nonEstimatedBookedValueComponent":11,"estimatedBookedValueComponent":22}}],"dropItems":[]}}');
                            res.setStatusCode(200);         
                        }
                        else{
                            res = http.send(req);
                        }
                        String responseString='';
                        APIBookingResultTemplate ab=null;
                        if(res.getStatusCode()==200 || res.getStatusCode()==201){
                            responseString=res.getBody();
                            system.debug('responseString====='+responseString); 
                            ab=APIBookingResultTemplate.parse(responseString);
                        }
                        else{
                            responseString=res.getBody();
                            system.debug('responseString====='+responseString);  
                        }   
                        oppMap.put(o.Id,new Opportunity(Id=o.Id,Non_Estimated_Booked_Value__c=0,Estimated_Booked_Value__c=0,Booking_API_Result__c='Request:'+json+'\r\nResponse:'+responseString));
                        if(ab!=null && ab.data!=null){
                            if(ab.data.items!=null && ab.data.items.size()>0){
                                for(APIBookingResultTemplate.Items i: ab.data.items){
                                    oliList.add(new OpportunityLineItem(Id=i.externalId,Non_Estimated_Booked_Value__c=i.bookedValues.nonEstimatedBookedValueComponent,Estimated_Booked_Value__c=i.bookedValues.estimatedBookedValueComponent));
                                }
                            }
                            if(ab.data.dropItems!=null && ab.data.dropItems.size()>0){
                                for(APIBookingResultTemplate.DropItems i: ab.data.dropItems){
                                    oliList.add(new OpportunityLineItem(Id=i.externalId,Non_Estimated_Booked_Value__c=i.bookedValues.nonEstimatedBookedValueComponent,Estimated_Booked_Value__c=i.bookedValues.estimatedBookedValueComponent));
                                }
                            }                            
                        }
                    }
                    update oliList;
                    //calculate sum and update opportunity
                    AggregateResult[] sumResults = [select OpportunityId,
                                                          sum(Non_Estimated_Booked_Value__c) Non_Estimated_Booked_Value__c,
                                                          sum(Estimated_Booked_Value__c) Estimated_Booked_Value__c  
                                                    from opportunitylineitem 
                                                    where opportunityid=:oppMap.keySet() 
                                                    group by opportunityid];
                    for (AggregateResult ar : sumResults)  {
                        Object nonEstimatedBookedValue=ar.get('Non_Estimated_Booked_Value__c');
                        Object estimatedBookedValue=ar.get('Estimated_Booked_Value__c');
                        Object OpportunityId=ar.get('OpportunityId');
                        if(OpportunityId!=null && oppMap.containsKey(String.valueOf(OpportunityId))){
                                Opportunity opp=oppMap.get(String.valueOf(OpportunityId));
                                if(nonEstimatedBookedValue!=null){
                                    opp.Non_Estimated_Booked_Value__c=Double.valueOf(nonEstimatedBookedValue);
                                }
                                if(estimatedBookedValue!=null){
                                    opp.Estimated_Booked_Value__c=Double.valueOf(estimatedBookedValue);
                                }                               
                        }
                    }                   
                    
                    update oppMap.values();
                } //END: for loop for Opportunity
            }//END:if(mapOpportunities!=null && mapOpportunities.size()>0)          
            }// END: if(oppIDs!=null && oppIDs.size()>0)
    }//END: calculateBookings
    public static String formatDate(Date dt){
        String result='';
        if(dt!=null){
            String month=String.valueOf(dt.month());
            month=month.length()==1?'0'+month:month;
            String day=String.valueOf(dt.day());
            day=day.length()==1?'0'+day:day;            
            result=dt.year()+'-'+month+'-'+day;
        }
        return result;
    }
}

/* Sample JSON
json+='{';
  json+='"externalId": "0060b00000n0miZAAQ",';
  json+='"customerAccountId": "0010b00002AihxMAAR",';
  json+='"type": "New Sale",';
  json+='"status": "Active",';
  json+='"effectiveFrom": "9/18/2018",';
  json+='"addItems": [';
    json+='{';
      json+='"externalId": "0060b00000n0miZAAQ44",';
      json+='"invoiceOwnerId": "00540000001hPyTAAU",';
      json+='"quantity": 1,';
      json+='"featureDetailId": "null",';
      json+='"cpqId": "2c92a0fe5ccf4b90015ce6af1af16a11",';
      json+='"endOfAgreementBehavior": "Renew",';
      json+='"discountAmount": 0,';
      json+='"discountPercentage": 0,';
      json+='"accessStart": "9/18/2018",';
      json+='"termStart": "1/18/2018",';
      json+='"termEnd": "01/18/2019",';
      json+='"billingFrequency": "Annual",';
      json+='"connectorId": "a0n4000000ChMvgAAF",';
      json+='"discountedExtendedAmount":0,';
      json+='"listPrice": 4950';
    json+='}';
  json+=']';
json+='}';
*/