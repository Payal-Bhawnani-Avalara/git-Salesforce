({
waiting: function(component, event, helper) {
  component.set("v.HideSpinner", true);
 },
 doneWaiting: function(component, event, helper) {
  component.set("v.HideSpinner", false);
 },
   doInit : function(component, event) {

      //  var action = component.get("c.findApps");
        //action.setCallback(this, function(a) {



            // the function that reads the url parameters
            var getUrlParameter = function getUrlParameter(sParam) {
                var sPageURL = decodeURIComponent(window.location.search.substring(1)),
                    sURLVariables = sPageURL.split('&'),
                    sParameterName,
                    i;

                for (i = 0; i < sURLVariables.length; i++) {
                    sParameterName = sURLVariables[i].split('=');

                    if (sParameterName[0] === sParam) {
                        return sParameterName[1] === undefined ? true : sParameterName[1];
                    }
                }
            };

            //set the src param value to my src attribute
         var contactId=getUrlParameter('cId');   
         console.log('contactId==='+contactId);
         if(contactId===undefined){
             console.log('show error===');
             component.set("v.render", false);
         }
         else
         {
         	component.set("v.cId", contactId);
             component.set("v.render", true);
     		//call apex class method
    		var action = component.get('c.initPartnerDeveloperBio');
            action.setParams({  cId : contactId });
			action.setCallback(this,function(response){
                //store state of response
                var state = response.getState();
                console.log('state==='+state);
                if (state === "SUCCESS") {
                    //set response value in objClassController attribute on component
                    //component.set('v.objClassController', response.getReturnValue());
                    
                    var result=response.getReturnValue();
                    var resultJSON = JSON.stringify(result);
                    console.log('resultJSON11==='+resultJSON);
                    
                    if(result.errorMessage!=''){
                        console.log('result.errorMessage==='+result.errorMessage);
                       // component.find('cmpMessage').set('v.message', result.errorMessage);
                       // component.set("v.render", false);
                        var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            title : 'Error Message',
                            message:result.errorMessage,
                            //messageTemplate: 'Mode is pester ,duration is 5sec and Message is overrriden',
                            duration:' 50000000',
                            key: 'info_alt',
                            type: 'error',
                            mode: 'pester'
                        });
                        toastEvent.fire();
                        component.find('btnSubmit').set("v.disabled", true);
                    }
                    else{
                        component.set("v.accountName", result.accountName);
						component.set("v.website", result.website);
                        component.set("v.street", result.street);
                        component.set("v.city", result.city);
                        component.set("v.state", result.state);
                        component.set("v.country", result.country);
                        component.set("v.postalcode", result.postalcode);
                        component.set("v.firstname", result.firstname);
                        component.set("v.lastname", result.lastname);
                        component.set("v.email", result.email);
                        component.set("v.phone", result.phone);
                        component.set("v.empvalue", result.empvalue);
                        //console.log('result.empvalue===='+result.empvalue);
                        component.set("v.empoptions", result.empoptions);
                        component.set("v.clienttypeoptions", result.clienttypeoptions);
                        component.set("v.clienttypeselected", result.clienttypeselected);
                        component.set("v.programmingoptions", result.programmingoptions);
                        component.set("v.programmingselected", result.programmingselected);
                        component.set("v.apptypeoptions", result.apptypeoptions);
                        component.set("v.apptypeselected", result.apptypeselected);
                        //component.set("v.notes", result.notes);
                        component.set("v.companyInformation", result.companyInformation);
                        component.set("v.servicesOffered", result.servicesOffered);
                        component.set("v.referenceClients", result.referenceClients);
                    }
                }
                else if (state === "ERROR") {
                var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " + 
                                     errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }                    
                }
   			});
      		$A.enqueueAction(action);             
         }



        	//var settings = a.getReturnValue();            
       // });
      //  $A.enqueueAction(action);       
    },
    clickSubmit : function(component, event, helper) {
        
        //helper.onSelectChange(component, event);
        var allValid = component.find('fieldId').reduce(function (validSoFar, inputCmp) {
           // alert('bbb');
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && !inputCmp.get('v.validity').valueMissing;
        }, true);
        if (allValid) {
            var companyInformation='';
            var servicesOffered='';
            var referenceClients='';
          //  var notes='';
            var empvalue='';
            var clienttypeselected;
            var programmingselected;
            var apptypeselected='';
            for(var cmp in component.find('fieldId')) {
               // console.log('field name'+component.find("fieldId")[cmp].get("v.name"));
               // console.log('field value'+component.find("fieldId")[cmp].get("v.value")); 
                if(component.find("fieldId")[cmp].get("v.name")=='companyInformation'){
                    companyInformation=component.find("fieldId")[cmp].get("v.value");
                }
                else if(component.find("fieldId")[cmp].get("v.name")=='servicesOffered'){
                    servicesOffered=component.find("fieldId")[cmp].get("v.value");
                }
                else if(component.find("fieldId")[cmp].get("v.name")=='referenceClients'){
                    referenceClients=component.find("fieldId")[cmp].get("v.value");
                }
                /*else if(component.find("fieldId")[cmp].get("v.name")=='notes'){
                    notes=component.find("fieldId")[cmp].get("v.value");
                }*/
                else if(component.find("fieldId")[cmp].get("v.name")=='empvalue'){
                    empvalue=component.find("fieldId")[cmp].get("v.value");
                }
                else if(component.find("fieldId")[cmp].get("v.name")=='clienttypeselected'){
                    clienttypeselected=component.find("fieldId")[cmp].get("v.value");
                }
                else if(component.find("fieldId")[cmp].get("v.name")=='programmingselected'){
                    programmingselected=component.find("fieldId")[cmp].get("v.value");
                }
                else if(component.find("fieldId")[cmp].get("v.name")=='apptypeselected'){
                    apptypeselected=component.find("fieldId")[cmp].get("v.value");
                }                
            }
    		var action = component.get('c.saveData');
                action.setParams({  
                                    cId : component.get("v.cId"),
                                    companyInformation : companyInformation,
                                    servicesOffered : servicesOffered,
                                    referenceClients : referenceClients,
                                    empvalue : empvalue,
                                    clienttypeselected :clienttypeselected,
                                    programmingselected : programmingselected,
                                    apptypeselected : apptypeselected
                                });          
                action.setCallback(this,function(response){
                var state = response.getState();
                console.log('state==='+state);
                if (state === "SUCCESS") {
                    var result=response.getReturnValue();
                    var resultJSON = JSON.stringify(result);
                    console.log('resultJSON11==='+resultJSON);
                    if(result.errorMessage!=''){
                        console.log('result.errorMessage==='+result.errorMessage);
                        var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            title : 'Error Message',
                            message:result.errorMessage,
                            duration:' 5000',
                            key: 'info_alt',
                            type: 'error',
                            mode: 'pester'
                        });
                        toastEvent.fire();
                    }
                    else{
                        var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({
                            title : 'Success Message',
                            message:'Saved successfully',
                            duration:' 500000',
                            key: 'info_alt',
                            type: 'success',
                            mode: 'pester'
                        });
                        toastEvent.fire();   
                        component.find('btnSubmit').set("v.disabled", true);
                    }                    
                }
                else if (state === "ERROR") {
                var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " + 
                                     errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }                    
                }               
            });
			$A.enqueueAction(action);            
            //alert('All form entries look valid. Ready to submit!');
        } else {
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                title : 'Error Message',
                message:'Please complete all required fields.',
                //messageTemplate: 'Mode is pester ,duration is 5sec and Message is overrriden',
                duration:' 3000',
                key: 'info_alt',
                type: 'error',
                mode: 'pester'
            });
            toastEvent.fire();
        }
    }	    
})