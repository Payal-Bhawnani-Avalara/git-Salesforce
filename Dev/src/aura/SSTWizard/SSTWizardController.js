({
	doInit : function(component, event, helper) {
	        helper.fetchbusinessEntityTypePicklist(component) ; 
	        helper.fetchstateOfInPicklist(component) ; 
	        helper.fetcharRegisteredPicklist(component) ; 
	        helper.fetcharFilPicklist(component) ; 
	        helper.fetchInReturns(component) ;
	        helper.fetcharSSTV(component) ;
	        helper.fetcharNV(component) ;
	        helper.fetchregSSTPicklist(component) ;
	        helper.fetchcomAffPicklist(component) 
	        helper.fetchtypeBusPicklist(component) ;
	        helper.fetchsstProgPicklist(component) ;    
	        helper.fetchjoinSSTProgPicklist(component) ;
	        helper.fetchsstRemotePicklist(component) ;
	        helper.fetchwaBOCPicklist(component) ; 
	        helper.fetchConPicklist(component) ; 
	      
     },
  getStarted : function(component, event, helper) {
        component.set("v.setMessage", '');           
        var showIntro = component.get("v.showIntro");
        var showComInfo = component.get("v.showComInfo");
        var showRandom = component.get("v.showRandom");
        var showSSTState = component.get("v.showSSTState");
        var showNexus = component.get("v.showNexus");
        var showReg = component.get("v.showReg");
        var showStats = component.get("v.showStats");
        var showData = component.get("v.showData");
        
        if(showIntro == true){
          component.set("v.showIntro", false);
	      component.set("v.showComInfo", true);
	      component.set("v.showRandom", false);
	      component.set("v.showSSTState", false); 
	      component.set("v.showNexus", false);
	      component.set("v.showReg", false);
	      component.set("v.showStats", false);
	      component.set("v.showError", false);
	      component.set("v.showData", false);
        }    
        
   }, comTab : function(component, event, helper) {
        component.set("v.setMessage", '');           
        var showIntro = component.get("v.showIntro");
        var showComInfo = component.get("v.showComInfo");
        var showRandom = component.get("v.showRandom");
        var showSSTState = component.get("v.showSSTState");
        var showNexus = component.get("v.showNexus");
        var showReg = component.get("v.showReg");
        var showStats = component.get("v.showStats");
        var showData = component.get("v.showData");
        
           if(showComInfo == true){
             if(component.find('newSSTform') !=null){
	           var validExpense = component.find('newSSTform').reduce(function (validSoFar, inputCmp) {
		            // Displays error messages for invalid fields
		            inputCmp.showHelpMessageIfInvalid();
		            return validSoFar && !inputCmp.get('v.validity').valueMissing;
		        }, true);
		        
		        // If we pass error checking, do some real work
		        if(validExpense){
		          component.set("v.showIntro", false);
			      component.set("v.showComInfo", false);
			      component.set("v.showRandom", true);
			      component.set("v.showSSTState", false); 
			      component.set("v.showNexus", false);
			      component.set("v.showReg", false);
			      component.set("v.showStats", false);
			      component.set("v.showError", false);
			      component.set("v.showData", false);
		        } else {
		           
	            alert('Please complete all required fields.');
		        }   
		       }
	       
        }    
        
   },randomTab : function(component, event, helper) {
        component.set("v.setMessage", '');           
        var showIntro = component.get("v.showIntro");
        var showComInfo = component.get("v.showComInfo");
        var showRandom = component.get("v.showRandom");
        var showSSTState = component.get("v.showSSTState");
        var showNexus = component.get("v.showNexus"); 
        var showReg = component.get("v.showReg");
        var showStats = component.get("v.showStats");
        var showData = component.get("v.showData");
        
           if(showRandom == true){
             if(component.find('newSSTreg') !=null){
           var validExpense = component.find('newSSTreg').reduce(function (validSoFar, inputCmp) {
	            // Displays error messages for invalid fields
	            inputCmp.showHelpMessageIfInvalid();
	            return validSoFar && inputCmp.checkValidity();
	        }, true);
	        
	        // If we pass error checking, do some real work
	        if(validExpense){
	            component.set("v.showRandom", false);
		        component.set("v.showSSTState", true);
		        component.set("v.showNexus", false);
                component.set("v.showReg", false);
		        component.set("v.showStats", false);
		        component.set("v.showComInfo", false);
		        component.set("v.showIntro", false)
		        component.set("v.showError", false);
		        component.set("v.showData", false);  
	        } else {
	           alert('Please complete all required fields.');
	        }   
	      }
        }    
        
   },SSTStateTab: function(component, event, helper) {
       component.set("v.setMessage", '');           
        var showIntro = component.get("v.showIntro");
        var showComInfo = component.get("v.showComInfo");
        var showRandom = component.get("v.showRandom");
        var showSSTState = component.get("v.showSSTState");
        var showNexus = component.get("v.showNexus");
        var showReg = component.get("v.showReg");
        var showStats = component.get("v.showStats");
        var showData = component.get("v.showData");
        
       
        if(showSSTState == true){
            if(component.find('sstStateId') !=null){
             var validExpense = component.find('sstStateId').reduce(function (validSoFar, inputCmp) {
	            // Displays error messages for invalid fields
	            inputCmp.showHelpMessageIfInvalid();
	            return validSoFar && inputCmp.checkValidity();
	        }, true);
	        
	        // If we pass error checking, do some real work
	        if(validExpense){
	        component.set("v.showSSTState", false);
	        component.set("v.showNexus", true);	   
	        component.set("v.showReg", false);
	        component.set("v.showStats", false);
	        component.set("v.showComInfo", false);
	        component.set("v.showIntro", false)
	        component.set("v.showError", false);
	        component.set("v.showData", false);  
	        component.set("v.showRandom", false);
            }
           }
        }      
   },NexusTab: function(component, event, helper) {
       component.set("v.setMessage", '');           
        var showIntro = component.get("v.showIntro");
        var showComInfo = component.get("v.showComInfo");
        var showRandom = component.get("v.showRandom");
        var showSSTState = component.get("v.showSSTState");
        var showNexus = component.get("v.showNexus");
        var showReg = component.get("v.showReg");
        var showStats = component.get("v.showStats");
        var showData = component.get("v.showData");
        
       
        if(showNexus == true){
          if(component.find('tableId') !=null){
             var validExpense = component.find('tableId').reduce(function (validSoFar, inputCmp) {
	            // Displays error messages for invalid fields
	            inputCmp.showHelpMessageIfInvalid();
	            return validSoFar && inputCmp.checkValidity();
	        }, true);
	        
	        // If we pass error checking, do some real work
	        if(validExpense){
	        component.set("v.showSSTState", false);
	        component.set("v.showNexus", false);
	        component.set("v.showReg", true);
	        component.set("v.showStats", false);
	        component.set("v.showComInfo", false);
	        component.set("v.showIntro", false)
	        component.set("v.showError", false);
	        component.set("v.showData", false);
	        component.set("v.showRandom", false);
            }
          }
        }      
   },RegTab: function(component, event, helper) {
       component.set("v.setMessage", '');           
        var showIntro = component.get("v.showIntro");
        var showComInfo = component.get("v.showComInfo");
        var showRandom = component.get("v.showRandom");
        var showSSTState = component.get("v.showSSTState");
        var showNexus = component.get("v.showNexus");
        var showReg = component.get("v.showReg");
        var showStats = component.get("v.showStats");
        var showData = component.get("v.showData");
        
       
        if(showReg == true){
              var validExpense = component.find('sstReg').reduce(function (validSoFar, inputCmp) {
	            // Displays error messages for invalid fields
	            inputCmp.showHelpMessageIfInvalid();
	            return validSoFar && inputCmp.checkValidity();
	        }, true);
	        
	        // If we pass error checking, do some real work
	        if(validExpense){
	        // If we pass error checking, do some real work 
	        component.set("v.showSSTState", false);
	        component.set("v.showNexus", false);
	        component.set("v.showRemoteState", false);
	        component.set("v.showReg", false);
	        component.set("v.showStats", true);
	        component.set("v.showComInfo", false);
	        component.set("v.showIntro", false)
	        component.set("v.showError", false);
	        component.set("v.showData", false);  
	        component.set("v.showRandom", false);
           }
          
        }      
   },statsTab : function(component, event, helper) {
        component.set("v.setMessage", '');           
        var showIntro = component.get("v.showIntro");
        var showComInfo = component.get("v.showComInfo");
        var showRandom = component.get("v.showRandom");
        var showSSTState = component.get("v.showSSTState");
        var showNexus = component.get("v.showNexus");
        var showReg = component.get("v.showReg");
        var showStats = component.get("v.showStats");
        var showData = component.get("v.showData");

         if(showStats == true){
             if(component.find('statsId') !=null){
          var validExpense = component.find('statsId').reduce(function (validSoFar, inputCmp) {
	            // Displays error messages for invalid fields
	            inputCmp.showHelpMessageIfInvalid();
	            return validSoFar && inputCmp.checkValidity();
	        }, true);
	        
	        // If we pass error checking, do some real work
	        if(validExpense){
	        component.set("v.showSSTState", false);
	        component.set("v.showNexus", false);
	        component.set("v.showRemoteState", false);
	        component.set("v.showReg", false);
	        component.set("v.showStats", false);
	        component.set("v.showComInfo", false);
	        component.set("v.showIntro", false)
	        component.set("v.showError", false);
	        component.set("v.showData", true);  
	        component.set("v.showRandom", false);
	        }
	      }
        }   
    },prevTab : function(component, event, helper) {
        var showIntro = component.get("v.showIntro");
        var showComInfo = component.get("v.showComInfo");
        var showRandom = component.get("v.showRandom");
        var showSSTState = component.get("v.showSSTState");
        var showNexus = component.get("v.showNexus"); 
        var showReg = component.get("v.showReg");
        var showStats = component.get("v.showStats");
        var showData = component.get("v.showData");
        
        
        if(showComInfo == true){
            component.set("v.showIntro", true);
            component.set("v.showComInfo", false);
            component.set("v.showSSTState", false);
            component.set("v.showNexus", false);
            component.set("v.showError", false);
            component.set("v.showData", false); 
            component.set("v.showRandom", false); 
            component.set("v.showStats", false);    
        }    
        if(showRandom == true){
            component.set("v.showIntro", false);
            component.set("v.showComInfo", true);
            component.set("v.showSSTState", false);
            component.set("v.showNexus", false); 
            component.set("v.showReg", false);
            component.set("v.showError", false);
            component.set("v.showData", false);    
            component.set("v.showRandom", false); 
            component.set("v.showStats", false);
        } 
         if(showSSTState == true){
            component.set("v.showIntro", false);
            component.set("v.showComInfo", false);
            component.set("v.showRandom", true); 
            component.set("v.showSSTState", false);
            component.set("v.showNexus", false); 
            component.set("v.showReg", false);
            component.set("v.showStats", false);
            component.set("v.showError", false);
            component.set("v.showData", false);    
        } 
        if(showNexus == true){
            component.set("v.showIntro", false);
            component.set("v.showComInfo", false);
            component.set("v.showSSTState", true);
            component.set("v.showNexus", false); 
            component.set("v.showReg", false); 
            component.set("v.showStats", false);
            component.set("v.showError", false);
            component.set("v.showData", false);             
        }  
        if(showReg == true){
            component.set("v.showIntro", false);
            component.set("v.showComInfo", false);
            component.set("v.showSSTState", false);
            component.set("v.showNexus", true);
            component.set("v.showReg", false); 
            component.set("v.showStats", false);
            component.set("v.showError", false);
            component.set("v.showData", false);             
        }  
        if(showStats == true){
            component.set("v.showIntro", false);
            component.set("v.showComInfo", false);
            component.set("v.showSSTState", false);
            component.set("v.showNexus", false);
            component.set("v.showReg", true); 
            component.set("v.showStats", false);
            component.set("v.showStats", false);
            component.set("v.showError", false);
            component.set("v.showData", false);             
        }  
        if(showData == true){
            component.set("v.showIntro", false);
            component.set("v.showComInfo", false);
            component.set("v.showSSTState", false);
            component.set("v.showNexus", false);
            component.set("v.showReg", false); 
            component.set("v.showStats", true);
            component.set("v.showError", false);
            component.set("v.showData", false);             
        }  
    },
        saveRecord : function(component, event, helper) {
        helper.saveData(component, event, helper);               
    },
	beType: function (component, event, helper) {
	  for(var cmp in component.find('newSSTform')) {
        if(component.find("newSSTform")[cmp].get("v.name")=='entityValue'){  
          var nav = component.find("newSSTform")[cmp].get("v.value");
	      if (nav=="GO - Government" || nav=="CO - Corporation" || nav=="LL - Limited Liability" || nav=="PA - Partnership" || nav=="TR - Trusts" ){
	         component.set("v.showCo", true);
	         component.set("v.showSP", false);
	      }    
	       else if(nav == "OT - Other"){
	        component.set("v.showCo", true);
	        component.set("v.showSP", false);
	        //component.find("stateId").set("OT");
	      }
	      else if(nav == "SP - Sole proprietor"){
	        component.set("v.showCo", false);
	        component.set("v.showSP", true);
	      }
        }
      }
    },
    sstNexus: function (component, event, helper) {
       for(var cmp in component.find('sstStateId')) {
        if(component.find("sstStateId")[cmp].get("v.name")=='Arkansas'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showAr", true); 
	           component.set("v.showArVol", true); 
	            for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="AR"){
		               component.set("v.showArV", false); 
		               component.set("v.showArVol", false); 
		               component.set("v.showArCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showAr", false); 
	           component.set("v.showArVol", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Georgia'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showGe", true); 
               component.set("v.showGeVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="GA"){
		               component.set("v.showGeV", false); 
		               component.set("v.showGeVol", false); 
		               component.set("v.showGeCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showGe", false); 
	           component.set("v.showGeVol", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Indiana'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showIn", true); 
               component.set("v.showInVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="IN"){
		               component.set("v.showInV", false); 
		               component.set("v.showInVol", false); 
		               component.set("v.showInCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showIn", false); 
	           component.set("v.showInVol", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Iowa'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showIo", true); 
               component.set("v.showIoVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="IA"){
		               component.set("v.showIoV", false); 
		               component.set("v.showIoVol", false); 
		               component.set("v.showIoCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showIo", false); 
	           component.set("v.showIoVol", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Kansas'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showKa", true); 
               component.set("v.showKaVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="KS"){
		               component.set("v.showKaV", false); 
		               component.set("v.showKaVol", false); 
		               component.set("v.showKaCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showKa", false); 
	           component.set("v.showKaVol", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Kentucky'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showKe", true); 
               component.set("v.showKeVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="KY"){
		               component.set("v.showKeV", false); 
		               component.set("v.showKeVol", false); 
		               component.set("v.showKeCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showKe", false); 
	           component.set("v.showKeVol", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Michigan'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showMi", true);
               component.set("v.showMiVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="MI"){
		               component.set("v.showMiV", false); 
		               component.set("v.showMiVol", false); 
		               component.set("v.showMiCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showMi", false); 
	           component.set("v.showMiVol", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Minnesota'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showMn", true); 
                component.set("v.showMnVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="MN"){
		               component.set("v.showMnV", false); 
		               component.set("v.showMnVol", false); 
		               component.set("v.showMnCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showMn", false); 
	           component.set("v.showMnVol", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Nebraska'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNe", true);
               component.set("v.showNeVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="NE"){
		               component.set("v.showNeV", false); 
		               component.set("v.showNeVol", false); 
		               component.set("v.showNeCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showNe", false); 
	           component.set("v.showNeVol", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Nevada'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNv", true);
                component.set("v.showNvVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="NV"){
		               component.set("v.showNvV", false); 
		               component.set("v.showNvVol", false); 
		               component.set("v.showNvCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showNv", false); 
	           component.set("v.showNvVol", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='New Jersey'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNj", true);
                component.set("v.showNjVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="NJ"){
		               component.set("v.showNjV", false); 
		               component.set("v.showNjVol", false); 
		               component.set("v.showNjCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showNj", false); 
	           component.set("v.showNjVol", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='North Carolina'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNc", true); 
                component.set("v.showNcVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="NC"){
		               component.set("v.showNcV", false); 
		               component.set("v.showNcVol", false); 
		               component.set("v.showNcCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showNc", false); 
	           component.set("v.showNcVol", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='North Dakota'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNd", true);
               component.set("v.showNdVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="ND"){
		               component.set("v.showNdV", false); 
		               component.set("v.showNdVol", false); 
		               component.set("v.showNdCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showNd", false); 
	           component.set("v.showNdVol", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Ohio'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showOh", true);
                component.set("v.showOhVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="OH"){
		               component.set("v.showOhV", false); 
		               component.set("v.showOhVol", false); 
		               component.set("v.showOhCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showOh", false); 
	           component.set("v.showOhVol", false); 
	       }
	    }
	    if(component.find("sstStateId")[cmp].get("v.name")=='Oklahoma'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showOk", true);
                component.set("v.showOkVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="OK"){
		               component.set("v.showOkV", false); 
		               component.set("v.showOkVol", false); 
		               component.set("v.showOkCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showOk", false); 
	           component.set("v.showOkVol", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Rhode Island'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showRi", true);
                component.set("v.showRiVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="RI"){
		               component.set("v.showRiV", false); 
		               component.set("v.showRiVol", false); 
		               component.set("v.showRiCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showRi", false); 
	           component.set("v.showRiVol", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='South Dakota'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showSd", true);
                component.set("v.showSdVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="SD"){
		               component.set("v.showSdV", false); 
		               component.set("v.showSdVol", false); 
		               component.set("v.showSdCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showSd", false); 
	           component.set("v.showSdVol", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Tennessee'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showTe", true);
                component.set("v.showTeVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="TN"){
		               component.set("v.showTeV", false); 
		               component.set("v.showTeVol", false); 
		               component.set("v.showTeCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showTe", false); 
	           component.set("v.showTeVol", false);
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Utah'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showUt", true);
               component.set("v.showUtVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="UT"){
		               component.set("v.showUtV", false); 
		               component.set("v.showUtVol", false); 
		               component.set("v.showUtCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showUt", false); 
	           component.set("v.showUtVol", false);
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Vermont'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showVe", true);
               component.set("v.showVeVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="VT"){
		               component.set("v.showVeV", false); 
		               component.set("v.showVeVol", false); 
		               component.set("v.showVeCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showVe", false); 
	           component.set("v.showVeVol", false);
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Washington'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWa", true);
               component.set("v.showWaVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="WA"){
		               component.set("v.showWaV", false); 
		               component.set("v.showWaVol", false); 
		               component.set("v.showWaCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showWa", false); 
	           component.set("v.showWaVol", false);
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='West Virginia'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWv", true);
               component.set("v.showWvVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="WV"){
		               component.set("v.showWvV", false); 
		               component.set("v.showWvVol", false); 
		               component.set("v.showWvCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showWv", false); 
	           component.set("v.showWvVol", false);
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Wisconsin'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWi", true);
               component.set("v.showiaVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="WI"){
		               component.set("v.showWiV", false); 
		               component.set("v.showWiVol", false); 
		               component.set("v.showWiCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showWi", false); 
	           component.set("v.showiaVol", false);
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Wyoming'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWy", true);
               component.set("v.showWyVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="WY"){
		               component.set("v.showWyV", false); 
		               component.set("v.showWyVol", false); 
		               component.set("v.showWyCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showWy", false); 
	           component.set("v.showWyVol", false);
	       }
	    }
	  }              
    }, sstReg: function (component, event, helper) { 
        for (var cmp =0;cmp< component.find("sstReg").length;cmp++) {  
	       if(component.find("sstReg")[cmp].get("v.name")=='arSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.arFalse", true);
		      }else{
		         component.set("v.arFalse", false);
		      }
	        } 
	       if(component.find("sstReg")[cmp].get("v.name")=='geSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.geFalse", true);
		      }else{
		         component.set("v.geFalse", false);
		      }      
	        }if(component.find("sstReg")[cmp].get("v.name")=='inSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.inFalse", true);
		      } else{
		         component.set("v.inFalse", false);
		      }       
	        }if(component.find("sstReg")[cmp].get("v.name")=='ioSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.ioFalse", true);
		      } else{
		         component.set("v.ioFalse", false);
		      }       
	        }if(component.find("sstReg")[cmp].get("v.name")=='kaSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.kaFalse", true);
		      }else{
		         component.set("v.kaFalse", false);
		      }        
	        }if(component.find("sstReg")[cmp].get("v.name")=='keSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.keFalse", true);
		      }else{
		         component.set("v.kaFalse", false);
		      }       
	        }if(component.find("sstReg")[cmp].get("v.name")=='miSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.miFalse", true);
		      }else{
		         component.set("v.miFalse", false);
		      }        
	        }if(component.find("sstReg")[cmp].get("v.name")=='mnSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.mnFalse", true);
		      }else{
		         component.set("v.mnFalse", false);
		      }        
	        }if(component.find("sstReg")[cmp].get("v.name")=='neSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.neFalse", true);
		      }else{
		         component.set("v.neFalse", false);
		      }        
	        }if(component.find("sstReg")[cmp].get("v.name")=='nvSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.nvFalse", true);
		      }else{
		         component.set("v.nvFalse", false);
		      }       
	        }if(component.find("sstReg")[cmp].get("v.name")=='njSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.njFalse", true);
		      }else{
		         component.set("v.njFalse", false);
		      }        
	        }if(component.find("sstReg")[cmp].get("v.name")=='ncSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.ncFalse", true);
		      }else{
		         component.set("v.ncFalse", false);
		      }       
	        }if(component.find("sstReg")[cmp].get("v.name")=='ndSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.ndFalse", true);
		      }else{
		         component.set("v.ndFalse", false);
		      }           
	        }if(component.find("sstReg")[cmp].get("v.name")=='ohSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.ohFalse", true);
		      }else{
		         component.set("v.ohFalse", false);
		      }       
	        }if(component.find("sstReg")[cmp].get("v.name")=='okSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.okFalse", true);
		      }else{
		         component.set("v.okFalse", false);
		      }        
	        }if(component.find("sstReg")[cmp].get("v.name")=='riSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.riFalse", true);
		      }else{
		         component.set("v.riFalse", false);
		      }        
	        }if(component.find("sstReg")[cmp].get("v.name")=='sdSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.sdFalse", true);
		      }else{
		         component.set("v.sdFalse", false);
		      }        
	        }if(component.find("sstReg")[cmp].get("v.name")=='teSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.tefalse", true);
		      }else{
		         component.set("v.tefalse", false);
		      }       
	        }if(component.find("sstReg")[cmp].get("v.name")=='utSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.utFalse", true);
		      }else{
		         component.set("v.utFalse", false);
		      }       
	        }if(component.find("sstReg")[cmp].get("v.name")=='veSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.veFalse", true);
		      }else{
		         component.set("v.veFalse", false);
		      }      
	        }if(component.find("sstReg")[cmp].get("v.name")=='waSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.waFalse", true);
		      }else{
		         component.set("v.waFalse", false);
		      }       
	        }if(component.find("sstReg")[cmp].get("v.name")=='wvSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.wvFalse", true);
		      }else{
		         component.set("v.wvFalse", false);
		      }       
	        }if(component.find("sstReg")[cmp].get("v.name")=='wiSV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.wiFalse", true);
		      }else{
		         component.set("v.wiFalse", false);
		      }       
	        }if(component.find("sstReg")[cmp].get("v.name")=='wySV'){  
	           var nav = component.find("sstReg")[cmp].get("v.value");
	            if (nav=="False (SST Non-Volunteer)"){
		         component.set("v.wyFalse", true);
		      }else{
		         component.set("v.wyFalse", false);
		      }        
	        }
	     }    
    },sameAsMailing: function (component, event, helper) {
	      var sel = component.find("sameAsMailing");
	      var nav=sel.get("v.checked");
	      if (!nav){
	         component.set("v.sameAsMailing", true);
	     }else if(nav){
	        component.set("v.sameAsMailing", false);
	     }
	},showRegSSN: function (component, event, helper) {
	  for(var cmp in component.find('newSSTreg')) {     
        if(component.find("newSSTreg")[cmp].get("v.name")=='regSSNId'){
	      var nav=component.find("newSSTreg")[cmp].get("v.value");
	      if (nav=="Yes"){
	         component.set("v.showRegSSN", true);
	     }else if(nav=="No"){
	        component.set("v.showRegSSN", false);
	     }
	  }
	}
   },phyTn: function (component, event, helper) {
	  for(var cmp in component.find('sstStateId')) {     
        if(component.find("sstStateId")[cmp].get("v.name")=='tnPhy'){
	      var nav=component.find("sstStateId")[cmp].get("v.value");
	      if (nav=="Yes"){
	         component.set("v.shoTnPhy", true); 
	    }else if(nav=="No"){
	        component.set("v.shoTnPhy", false);
	     }
	  }
	 }
   },showAfInfo: function (component, event, helper) {
    for(var cmp in component.find('newSSTreg')) {     
        if(component.find("newSSTreg")[cmp].get("v.name")=='affBus'){
	      var nav=component.find("newSSTreg")[cmp].get("v.value");
	      if (nav=="Yes"){
	         component.set("v.showAfInfo", true);
	     }else if(nav=="No"){
	        component.set("v.showAfInfo", false);
	     }
	    }
	   }
	},showSSTStat: function (component, event, helper) {
	   for(var cmp in component.find('statsId')) {     
        if(component.find("statsId")[cmp].get("v.name")=='showStatsIntro'){
	      var nav=component.find("statsId")[cmp].get("v.value");
	      if (nav=="Other"){
	         component.set("v.showSSTProgOther", true);
	     }else{
	        component.set("v.showSSTProgOther", false);
	     }
	    }if(component.find("statsId")[cmp].get("v.name")=='showStatsJoin'){
	      var nav=component.find("statsId")[cmp].get("v.value");
	      if (nav=="Other"){
	         component.set("v.showSSTJoinOther", true);
	     }else {
	        component.set("v.showSSTJoinOther", false);
	     }
	    }
	   }
	},selectAll: function (component, event, helper) {
	   if(component.find('allStates').get("v.checked")) {
         component.set('v.isAllSelected', true);
	    }else{
         component.set('v.isAllSelected', false);
	    }
	    const myCheckboxes = component.find('sstStateId'); 
	    let chk = (myCheckboxes.length == null) ? [myCheckboxes] : myCheckboxes;
	    chk.forEach(checkbox => checkbox.set('v.checked', component.get('v.isAllSelected')));
	    
            
		    for(var cmp in component.find('sstStateId')) {
	        if(component.find("sstStateId")[cmp].get("v.name")=='Arkansas'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showAr", true); 
	           component.set("v.showArVol", true); 
	            for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="AR"){
		               component.set("v.showArV", false); 
		               component.set("v.showArVol", false); 
		               component.set("v.showArCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Georgia'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showGe", true); 
               component.set("v.showGeVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="GA"){
		               component.set("v.showGeV", false); 
		               component.set("v.showGeVol", false); 
		               component.set("v.showGeCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Indiana'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showIn", true); 
               component.set("v.showInVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="IN"){
		               component.set("v.showInV", false); 
		               component.set("v.showInVol", false); 
		               component.set("v.showInCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Iowa'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showIo", true); 
               component.set("v.showIoVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="IA"){
		               component.set("v.showIoV", false); 
		               component.set("v.showIoVol", false); 
		               component.set("v.showIoCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Kansas'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showKa", true); 
               component.set("v.showKaVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="KS"){
		               component.set("v.showKaV", false); 
		               component.set("v.showKaVol", false); 
		               component.set("v.showKaCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Kentucky'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showKe", true); 
               component.set("v.showKeVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="KY"){
		               component.set("v.showKeV", false); 
		               component.set("v.showKeVol", false); 
		               component.set("v.showKeCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Michigan'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showMi", true);
               component.set("v.showMiVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="MI"){
		               component.set("v.showMiV", false); 
		               component.set("v.showMiVol", false); 
		               component.set("v.showMiCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Minnesota'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showMn", true); 
                component.set("v.showMnVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="MN"){
		               component.set("v.showMnV", false); 
		               component.set("v.showMnVol", false); 
		               component.set("v.showMnCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Nebraska'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNe", true);
               component.set("v.showNeVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="NE"){
		               component.set("v.showNeV", false); 
		               component.set("v.showNeVol", false); 
		               component.set("v.showNeCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Nevada'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNv", true);
                component.set("v.showNvVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="NV"){
		               component.set("v.showNvV", false); 
		               component.set("v.showNvVol", false); 
		               component.set("v.showNvCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='New Jersey'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNj", true);
                component.set("v.showNjVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="NJ"){
		               component.set("v.showNjV", false); 
		               component.set("v.showNjVol", false); 
		               component.set("v.showNjCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='North Carolina'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNc", true); 
                component.set("v.showNcVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="NC"){
		               component.set("v.showNcV", false); 
		               component.set("v.showNcVol", false); 
		               component.set("v.showNcCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='North Dakota'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNd", true);
               component.set("v.showNdVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="ND"){
		               component.set("v.showNdV", false); 
		               component.set("v.showNdVol", false); 
		               component.set("v.showNdCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Ohio'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showOh", true);
                component.set("v.showOhVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="OH"){
		               component.set("v.showOhV", false); 
		               component.set("v.showOhVol", false); 
		               component.set("v.showOhCoV",true); 
		           }
	            }
	         }  
	       }
	    }
	    if(component.find("sstStateId")[cmp].get("v.name")=='Oklahoma'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showOk", true);
                component.set("v.showOkVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="OK"){
		               component.set("v.showOkV", false); 
		               component.set("v.showOkVol", false); 
		               component.set("v.showOkCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Rhode Island'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showRi", true);
                component.set("v.showRiVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="RI"){
		               component.set("v.showRiV", false); 
		               component.set("v.showRiVol", false); 
		               component.set("v.showRiCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='South Dakota'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showSd", true);
                component.set("v.showSdVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="SD"){
		               component.set("v.showSdV", false); 
		               component.set("v.showSdVol", false); 
		               component.set("v.showSdCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Tennessee'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showTe", true);
                component.set("v.showTeVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="TN"){
		               component.set("v.showTeV", false); 
		               component.set("v.showTeVol", false); 
		               component.set("v.showTeCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showTe", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Utah'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showUt", true);
               component.set("v.showUtVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="UT"){
		               component.set("v.showUtV", false); 
		               component.set("v.showUtVol", false); 
		               component.set("v.showUtCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Vermont'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showVe", true);
               component.set("v.showVeVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="VT"){
		               component.set("v.showVeV", false); 
		               component.set("v.showVeVol", false); 
		               component.set("v.showVeCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Washington'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWa", true);
               component.set("v.showWaVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="WA"){
		               component.set("v.showWaV", false); 
		               component.set("v.showWaVol", false); 
		               component.set("v.showWaCoV",true); 
		           }
	            }
	         }  
	       }else if(!nav){
	           component.set("v.showWa", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='West Virginia'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWv", true);
               component.set("v.showWvVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="WV"){
		               component.set("v.showWvV", false); 
		               component.set("v.showWvVol", false); 
		               component.set("v.showWvCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Wisconsin'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWi", true);
               component.set("v.showiaVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="WI"){
		               component.set("v.showWiV", false); 
		               component.set("v.showWiVol", false); 
		               component.set("v.showWiCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Wyoming'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWy", true);
               component.set("v.showWyVol", true);
                for(var cmp in component.find('newSSTform')) { 
                 if(component.find("newSSTform")[cmp].get("v.name")=='stateCo'){  
                      var nav = component.find("newSSTform")[cmp].get("v.value");    
		             if(nav=="WY"){
		               component.set("v.showWyV", false); 
		               component.set("v.showWyVol", false); 
		               component.set("v.showWyCoV",true); 
		           }
	            }
	         }  
	       }
	    }
		  }   
		     
	   
	},sstFF: function (component, event, helper) {
	  for(var cmp in component.find('tableId')) {
        if(component.find("tableId")[cmp].get("v.name")=='ArkansasReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showArFF", true); 
	       }else if(!nav){
	           component.set("v.showArFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='GeorgiaReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showGeFF", true); 
	       }else if(!nav){
	           component.set("v.showGeFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='IndianaReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showInFF", true); 
	       }else if(!nav){
	           component.set("v.showInFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='IowaReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showIoFF", true); 
	       }else if(!nav){
	           component.set("v.showIoFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='KansasReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showKaFF", true); 
	       }else if(!nav){
	           component.set("v.showKaFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='KentuckyReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showKeFF", true); 
	       }else if(!nav){
	           component.set("v.showKeFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='MichiganReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showMiFF", true); 
	       }else if(!nav){
	           component.set("v.showMiFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='MinnesotaReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showMnFF", true); 
	       }else if(!nav){
	           component.set("v.showMnFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='NebraskaReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNeFF", true); 
	       }else if(!nav){
	           component.set("v.showNeFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='NevadaReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNvFF", true); 
	       }else if(!nav){
	           component.set("v.showNvFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='NJReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNjFF", true); 
	       }else if(!nav){
	           component.set("v.showNjFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='NCReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNcFF", true); 
	       }else if(!nav){
	           component.set("v.showNcFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='NDReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNdFF", true); 
	       }else if(!nav){
	           component.set("v.showNdFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='OhReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showOhFF", true); 
	       }else if(!nav){
	           component.set("v.showOhFF", false); 
	       }
	    }
	    if(component.find("tableId")[cmp].get("v.name")=='OkReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showOkFF", true); 
	       }else if(!nav){
	           component.set("v.showOkFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='RiReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showRiFF", true); 
	       }else if(!nav){
	           component.set("v.showRiFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='SdReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showSdFF", true); 
	       }else if(!nav){
	           component.set("v.showSdFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='TnReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showTeFF", true); 
	       }else if(!nav){
	           component.set("v.showTeFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='UtReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showUtFF", true); 
	       }else if(!nav){
	           component.set("v.showUtFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='VeReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showVeFF", true); 
	       }else if(!nav){
	           component.set("v.showVeFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='WaReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWaFF", true); 
	       }else if(!nav){
	           component.set("v.showWaFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='WvReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWvFF", true); 
	       }else if(!nav){
	           component.set("v.showWvFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='WiReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWiFF", true); 
	       }else if(!nav){
	           component.set("v.showWiFF", false); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='WyReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWyFF", true); 
	       }else if(!nav){
	           component.set("v.showWyFF", false); 
	       }
	    }
	   }
    },Init : function(component, event, helper) {
        helper.doInit(component, event, helper);
     },
   sstNonVoluteer:function(component, event, helper){
       for(var cmp in component.find('tableId')) { 
        if(component.find("tableId")[cmp].get("v.name")=='ArkansasRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showArV", true); 
	               component.set("v.showArVol", false); 
	               component.set("v.showArCoV",false);
	               
	           }else if(!nav){
	              component.set("v.showArV", false); 
	               component.set("v.showArVol", false); 
	               component.set("v.showArCoV",false);
	           
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='GeorgiaRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showGeV", true); 
	               component.set("v.showGeVol", false); 
	               component.set("v.showGeCoV",false);
	               
	           }else if(!nav){
	              component.set("v.showGeV", false); 
	               component.set("v.showGeVol", false); 
	               component.set("v.showGeCoV",false);
	           
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='IndianaRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showInV", true); 
	               component.set("v.showInVol", false); 
	               component.set("v.showInCoV",false);
	               
	           }else if(!nav){
	               component.set("v.showInV", false); 
	               component.set("v.showInVol", false); 
	               component.set("v.showInCoV",false);
	           
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='IowaRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showIoV", true); 
	               component.set("v.showIoVol", false); 
	               component.set("v.showIoCoV",false);
	               
	           }else if(!nav){
	               component.set("v.showIoV", false); 
	               component.set("v.showIoVol", false); 
	               component.set("v.showIoCoV",false);
	           
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='KansasRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showKaV", true); 
	               component.set("v.showKaVol", false); 
	               component.set("v.showKaCoV",false);
	               
	           }else if(!nav){
	               component.set("v.showKaV", false); 
	               component.set("v.showKaVol", false); 
	               component.set("v.showKaCoV",false);
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='KentuckyRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showKeV", true); 
	               component.set("v.showKeVol", false); 
	               component.set("v.showKeCoV",false);  
	           }else if(!nav){
	                component.set("v.showKeV", false); 
	               component.set("v.showKeVol", false); 
	               component.set("v.showKeCoV",false);  
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='MichiganRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showMiV", true); 
	               component.set("v.showMiVol", false); 
	               component.set("v.showMiCoV",false);
	               
	           }else if(!nav){
	                component.set("v.showMiV", false); 
	               component.set("v.showMiVol", false); 
	               component.set("v.showMiCoV",false);
	               
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='MinnesotaRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showMnV", true); 
	               component.set("v.showMnVol", false); 
	               component.set("v.showMnCoV",false);   
	           }else if(!nav){
	               component.set("v.showMnV", false); 
	               component.set("v.showMnVol", false); 
	               component.set("v.showMnCoV",false);  
	               
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='NebraskaRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showNeV", true); 
	               component.set("v.showNeVol", false); 
	               component.set("v.showNeCoV",false);    
	           }else if(!nav){
	               component.set("v.showNeV", false); 
	               component.set("v.showNeVol", false); 
	               component.set("v.showNeCoV",false);      
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='NevadaRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showNvV", true); 
	               component.set("v.showNvVol", false); 
	               component.set("v.showNvCoV",false);  
	           }else if(!nav){
	                component.set("v.showNvV", false); 
	               component.set("v.showNvVol", false); 
	               component.set("v.showNvCoV",false);       
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='NJRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showNjV", true); 
	               component.set("v.showNjVol", false); 
	               component.set("v.showNjCoV",false);   
	           }else if(!nav){
	               component.set("v.showNjV", false); 
	               component.set("v.showNjVol", false); 
	               component.set("v.showNjCoV",false);       
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='NCRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showNcV", true); 
	               component.set("v.showNcVol", false); 
	               component.set("v.showNcCoV",false);   
	           }else if(!nav){
	               component.set("v.showNcV", false); 
	               component.set("v.showNcVol", false); 
	               component.set("v.showNcCoV",false);      
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='NDRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showNdV", true); 
	               component.set("v.showNdVol", false); 
	               component.set("v.showNdCoV",false);  
	           }else if(!nav){
	               component.set("v.showNdV", false); 
	               component.set("v.showNdVol", false); 
	               component.set("v.showNdCoV",false);      
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='OhRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showOhV", true); 
	               component.set("v.showOhVol", false); 
	               component.set("v.showOhCoV",false);   
	           }else if(!nav){
	               component.set("v.showOhV", false); 
	               component.set("v.showOhVol", false); 
	               component.set("v.showOhCoV",false);  
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='OkRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showOkV", true); 
	               component.set("v.showOkVol", false); 
	               component.set("v.showOkCoV",false);   
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='RiRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showRiV", true); 
	               component.set("v.showRiVol", false); 
	               component.set("v.showRiCoV",false);   
	           }else if(!nav){
	               component.set("v.showRiV", false); 
	               component.set("v.showRiVol", false); 
	               component.set("v.showRiCoV",false); 
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='SdRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showSdV", true); 
	               component.set("v.showSdVol", false); 
	               component.set("v.showSdCoV",false);   
	           }else if(!nav){
	               component.set("v.showSdV", false); 
	               component.set("v.showSdVol", false); 
	               component.set("v.showSdCoV",false); 
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='TnRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showTeV", true); 
	               component.set("v.showTeVol", false); 
	               component.set("v.showTeCoV",false);   
	           }else if(!nav){
	               component.set("v.showTeV", false); 
	               component.set("v.showTeVol", false); 
	               component.set("v.showTeCoV",false);   
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='UtRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showUtV", true); 
	               component.set("v.showUtVol", false); 
	               component.set("v.showUtCoV",false);   
	           }else if(!nav){
	                component.set("v.showUtV", false); 
	               component.set("v.showUtVol", false); 
	               component.set("v.showUtCoV",false);    
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='VeRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showVeV", true); 
	               component.set("v.showVeVol", false); 
	               component.set("v.showVeCoV",false);   
	           }else if(!nav){
	                component.set("v.showVeV", false); 
	               component.set("v.showVeVol", false); 
	               component.set("v.showVeCoV",false);  
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='WaRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showWaV", true); 
	               component.set("v.showWaVol", false); 
	               component.set("v.showWaCoV",false);   
	           }else if(!nav){
	                component.set("v.showWaV", false); 
	               component.set("v.showWaVol", false); 
	               component.set("v.showWaCoV",false);  
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='WvRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showWvV", true); 
	               component.set("v.showWvVol", false); 
	               component.set("v.showWvCoV",false);   
	           }else if(!nav){
	                component.set("v.showWaV", false); 
	               component.set("v.showWaVol", false); 
	               component.set("v.showWaCoV",false);  
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='WiRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showWiV", true); 
	               component.set("v.showWiVol", false); 
	               component.set("v.showWiCoV",false);   
	           }else if(!nav){
	                 component.set("v.showWiV", false); 
	               component.set("v.showWiVol", false); 
	               component.set("v.showWiCoV",false);  
	           }
	         }if(component.find("tableId")[cmp].get("v.name")=='WyRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showWyV", true); 
	               component.set("v.showWyVol", false); 
	               component.set("v.showWyCoV",false);   
	           }else if(!nav){
	                component.set("v.showWyV", false); 
	               component.set("v.showWyVol", false); 
	               component.set("v.showWyCoV",false);  
	           }
	         }
	   }
	 }
})