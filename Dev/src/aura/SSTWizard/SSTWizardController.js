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
        
   },
   nextTab : function(component, event, helper) {
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
        if(showNexus == true){
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
     
         if(showReg == true){
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
         if(showStats == true){
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
    },
    
    prevTab : function(component, event, helper) {
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
    onSelectChange : function(component, event, helper) {
        var selected = component.find("StageName").get("v.value");
        component.set("v.OpportunityData.StageName",selected);
        console.log('opp::::'+JSON.stringify(selected));
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
	        component.set("v.showCo", false);
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
		               component.set("v.showCoV",true); 
		           }
	            }
	         }  
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Georgia'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showGe", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Indiana'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showIn", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Iowa'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showIo", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Kansas'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showKa", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Kentucky'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showKe", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Michigan'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showMi", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Minnesota'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showMn", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Nebraska'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNe", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Nevada'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNv", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='New Jersey'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNj", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='North Carolina'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNc", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='North Dakota'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNd", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Ohio'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showOh", true); 
	       }
	    }
	    if(component.find("sstStateId")[cmp].get("v.name")=='Oklahoma'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showOk", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Rhode Island'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showRi", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='South Dakota'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showSd", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Tennessee'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showTe", true); 
	       }else if(!nav){
	           component.set("v.showTe", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Utah'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showUt", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Vermont'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showVe", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Washington'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWa", true); 
	       }else if(!nav){
	           component.set("v.showWa", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='West Virginia'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWv", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Wisconsin'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWi", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Wyoming'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWy", true); 
	       }
	    }
	  }              
    },arFalse: function (component, event, helper) {
	      var sel = component.find("arSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.arFalse", true);
	      }    
    },geFalse: function (component, event, helper) {
	      var sel = component.find("geSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.geFalse", true);
	      }    
    },inFalse: function (component, event, helper) {
	      var sel = component.find("inSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.inFalse", true);
	      }   
    },ioFalse: function (component, event, helper) {
	      var sel = component.find("ioSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.ioFalse", true);
	      }
	},kaFalse: function (component, event, helper) {
	      var sel = component.find("kaSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.kaFalse", true);
	      }
	},keFalse: function (component, event, helper) {
	      var sel = component.find("keSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.keFalse", true);
	      }
	},miFalse: function (component, event, helper) {
	      var sel = component.find("miSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.miFalse", true);
	     }
	},mnFalse: function (component, event, helper) {
	      var sel = component.find("mnSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.mnFalse", true);
	      }
	},neFalse: function (component, event, helper) {
	      var sel = component.find("neSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.neFalse", true);
	      }
	},nvFalse: function (component, event, helper) {
	      var sel = component.find("nvSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.nvFalse", true);
	     }
	},njFalse: function (component, event, helper) {
	      var sel = component.find("njSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.njFalse", true);
	     }
	},ncFalse: function (component, event, helper) {
	      var sel = component.find("ncSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.ncFalse", true);
	      }
	},ndFalse: function (component, event, helper) {
	      var sel = component.find("ndSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.ndFalse", true);
	      }
	},ohFalse: function (component, event, helper) {
	      var sel = component.find("ohSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.ohFalse", true);
	      }
	},okFalse: function (component, event, helper) {
	      var sel = component.find("okSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.okFalse", true);
	      }
	},riFalse: function (component, event, helper) {
	      var sel = component.find("riSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.riFalse", true);
	     }
	},sdFalse: function (component, event, helper) {
	      var sel = component.find("sdSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.sdFalse", true);
	      }
	},tefalse: function (component, event, helper) {
	      var sel = component.find("teSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.tefalse", true);
	      }
	},utFalse: function (component, event, helper) {
	      var sel = component.find("utSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.utFalse", true);
	      }
	},veFalse: function (component, event, helper) {
	      var sel = component.find("veSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.veFalse", true);
	     }
	},waFalse: function (component, event, helper) {
	      var sel = component.find("waSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.waFalse", true);
	      }
	},wvFalse: function (component, event, helper) {
	      var sel = component.find("wvSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.wvFalse", true);
	      }
	},wiFalse: function (component, event, helper) {
	      var sel = component.find("wiSV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.wiFalse", true);
	      }
	},wyFalse: function (component, event, helper) {
	      var sel = component.find("wySV");
	      var nav=sel.get("v.value");
	      if (nav=="False (SST Non-Volunteer)"){
	         component.set("v.wyFalse", true);
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
	},showSSTProgOther: function (component, event, helper) {
	      var sel = component.find("showStatsIntro");
	      var nav=sel.get("v.value");
	      if (nav=="Other"){
	         component.set("v.showSSTProgOther", true);
	     }else{
	         component.set("v.showSSTProgOther", false);
	     }
	},showSSTJoinOther: function (component, event, helper) {
	      var sel = component.find("showJoinStats");
	      var nav=sel.get("v.value");
	      if (nav=="Other"){
	         component.set("v.showSSTJoinOther", true);
	     }else{
	         component.set("v.showSSTJoinOther", false);
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
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Georgia'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showGe", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Indiana'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showIn", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Iowa'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showIo", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Kansas'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showKa", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Kentucky'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showKe", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Michigan'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showMi", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Minnesota'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showMn", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Nebraska'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNe", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Nevada'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNv", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='New Jersey'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNj", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='North Carolina'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNc", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='North Dakota'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNd", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Ohio'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showOh", true); 
	       }
	    }
	    if(component.find("sstStateId")[cmp].get("v.name")=='Oklahoma'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showOk", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Rhode Island'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showRi", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='South Dakota'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showSd", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Tennessee'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showTe", true); 
	       }else if(!nav){
	           component.set("v.showTe", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Utah'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showUt", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Vermont'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showVe", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Washington'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWa", true); 
	       }else if(!nav){
	           component.set("v.showWa", false); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='West Virginia'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWv", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Wisconsin'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWi", true); 
	       }
	    }if(component.find("sstStateId")[cmp].get("v.name")=='Wyoming'){  
           var nav = component.find("sstStateId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWy", true); 
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
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='IndianaReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showInFF", true); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='IowaReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showIoFF", true); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='KansasReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showKaFF", true); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='KentuckyReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showKeFF", true); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='MichiganReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showMiFF", true); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='MinnesotaReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showMnFF", true); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='NebraskaReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNeFF", true); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='NevadaReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNvFF", true); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='NJReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNjFF", true); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='NCReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNcFF", true); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='NDReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showNdFF", true); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='OhReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showOhFF", true); 
	       }
	    }
	    if(component.find("tableId")[cmp].get("v.name")=='OkReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showOkFF", true); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='RiReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showRiFF", true); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='SdReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showSdFF", true); 
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
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='VeReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showVeFF", true); 
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
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='WiReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWiFF", true); 
	       }
	    }if(component.find("tableId")[cmp].get("v.name")=='WyReg'){  
           var nav = component.find("tableId")[cmp].get("v.checked");    
	       if(nav){
	           component.set("v.showWyFF", true); 
	       }
	    }
	   }
    },Init : function(component, event, helper) {
        helper.doInit(component, event, helper);
     },
     erase:function(component, event, helper){
        helper.eraseHelper(component, event, helper);
    },
    save:function(component, event, helper){
        helper.saveHelper(component, event, helper);
    },sstNonVoluteer:function(component, event, helper){
       for(var cmp in component.find('tableId')) { 
        if(component.find("tableId")[cmp].get("v.name")=='ArkansasRe'){  
                 var nav = component.find("tableId")[cmp].get("v.checked");    
	             if(nav){
	               component.set("v.showArV", true); 
	               component.set("v.showArVol", false); 
	                component.set("v.showCoV",false);
	               
	           }
	         }
	   }
	   
	 }
})