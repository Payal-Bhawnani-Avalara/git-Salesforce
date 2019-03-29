({
    nextTab : function(component, event, helper) {
        component.set("v.setMessage", '');           
        var showIntro = component.get("v.showIntro");
        var showComInfo = component.get("v.showComInfo");
        var showSSTState = component.get("v.showSSTState");
        var showNexus = component.get("v.showNexus");
        var showReg = component.get("v.showReg");
        var showData = component.get("v.showData");
       
        helper.fetchbusinessEntityTypePicklist(component) ; 
        helper.fetchstateOfInPicklist(component) ; 
        helper.fetchSStStatePicklist(component) ; 
        helper.fetcharRegisteredPicklist(component) ; 
        helper.fetcharFilPicklist(component) ; 
        helper.fetchInReturns(component) ;
        helper.fetcharSSTV(component) ;
        helper.fetcharNV(component) ;
         
        if(showIntro == true){
          component.set("v.showIntro", false);
	      component.set("v.showComInfo", true);
	      component.set("v.showSSTState", false); 
	      component.set("v.showNexus", false);
	      component.set("v.showReg", false);
	      component.set("v.showError", false);
	      component.set("v.showData", false);
        }    
        if(showComInfo == true){      
		    component.set("v.showIntro", false);
		    component.set("v.showComInfo", false);
		    component.set("v.showSSTState", true);
		    component.set("v.showNexus", false);
		    component.set("v.showReg", false);
		    component.set("v.showError", false);
		    component.set("v.showData", false); 
        }   
        
        if(showSSTState == true){
	        component.set("v.showSSTState", false);
	        component.set("v.showNexus", true);
	        component.set("v.showReg", false);
	        component.set("v.showComInfo", false);
	        component.set("v.showIntro", false)
	        component.set("v.showError", false);
	        component.set("v.showData", false);  
        }        
        if(showNexus == true){
	        component.set("v.showSSTState", false);
	        component.set("v.showNexus", false);
	        component.set("v.showReg", true);
	        component.set("v.showComInfo", false);
	        component.set("v.showIntro", false)
	        component.set("v.showError", false);
	        component.set("v.showData", false);  
        } 
         if(showReg == true){
	        component.set("v.showSSTState", false);
	        component.set("v.showNexus", false);
	        component.set("v.showReg", false);
	        component.set("v.showComInfo", false);
	        component.set("v.showIntro", false)
	        component.set("v.showError", false);
	        component.set("v.showData", false);  
        }     
    },
    
    prevTab : function(component, event, helper) {
        var showIntro = component.get("v.showIntro");
        var showComInfo = component.get("v.showComInfo");
        var showSSTState = component.get("v.showSSTState");
        var showNexus = component.get("v.showNexus");
        var showReg = component.get("v.showReg");
        var showData = component.get("v.showData");
        
        
        if(showComInfo == true){
            component.set("v.showIntro", true);
            component.set("v.showComInfo", false);
            component.set("v.showSSTState", false);
             component.set("v.showNexus", false);
            component.set("v.showError", false);
            component.set("v.showData", false);
            
            
        }    
        if(showNexus == true){
            component.set("v.showIntro", false);
            component.set("v.showComInfo", false);
            component.set("v.showSSTState", true);
            component.set("v.showNexus", false);
            component.set("v.showReg", false);
            component.set("v.showError", false);
            component.set("v.showData", false);
            
            
        } 
         if(showSSTState == true){
            component.set("v.showIntro", false);
            component.set("v.showComInfo", true);
            component.set("v.showSSTState", false);
            component.set("v.showNexus", false);
            component.set("v.showReg", false);
            component.set("v.showError", false);
            component.set("v.showData", false);
            
            
        } 
        if(showNexus == true){
            component.set("v.showIntro", false);
            component.set("v.showComInfo", false);
            component.set("v.showSSTState", true);
            component.set("v.showNexus", false);
            component.set("v.showReg", false); 
            component.set("v.showError", false);
            component.set("v.showData", false);             
        }  
        if(showReg == true){
            component.set("v.showIntro", false);
            component.set("v.showComInfo", false);
            component.set("v.showSSTState", false);
            component.set("v.showNexus", true);
            component.set("v.showReg", false); 
            component.set("v.showError", false);
            component.set("v.showData", false);             
        }  
        if(showData == true){
            component.set("v.showIntro", false);
            component.set("v.showComInfo", false);
            component.set("v.showSSTState", false);
            component.set("v.showNexus", false);
            component.set("v.showReg", true); 
            component.set("v.showError", false);
            component.set("v.showData", false);             
        }  
    },
     doInit : function(component, event) {
         
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
	      var sel = component.find("fieldId");
	      var nav=sel.get("v.value");
	      if (nav=="GO - Government" || nav=="CO - Corporation" || nav=="LL - Limited Liability" || nav=="PA - Partnership" || nav=="TR - Trusts" ){
	         component.set("v.showCo", true);
	         component.set("v.showSP", false);
	      }    
	       else if(nav == "OT - Other"){
            component.set("v.showCo", false);
            component.set("v.showSP", false);
         }
	 else if(nav == "SP - Sole proprietor"){
            component.set("v.showCo", false);
            component.set("v.showSP", true);
         }
    },
    sstNexus: function (component, event, helper) {
	      var sel = component.find("sstStateId");
	      var nav=sel.get("v.value");
	      if(nav.length > 0){
	         for(var i = 0; i < nav.length; i++) {
	           if(nav[i] =="Arkansas"){
	               component.set("v.showAr", true); 
	           
	           }else if (nav[i] =="Georgia"){
	              component.set("v.showGe", true);
	           }else if (nav[i] =="Indiana"){
	              component.set("v.showIn", true);
	           }else if (nav[i] =="Iowa"){
	              component.set("v.showIo", true);
	           }else if (nav[i] =="Kansas"){
	              component.set("v.showKa", true);
	           }else if (nav[i] =="Kentucky"){
	              component.set("v.showKe", true);
	           }else if (nav[i] =="Michigan"){
	              component.set("v.showMi", true);
	           }else if (nav[i] =="Minnesota"){
	              component.set("v.showMn", true);
	           }else if (nav[i] =="Nebraska"){
	              component.set("v.showNe", true);
	           }else if (nav[i] =="Nevada"){
	              component.set("v.showNv", true);
	           }else if (nav[i] =="New Jersey"){
	              component.set("v.showNj", true);
	           }else if (nav[i] =="North Carolina"){
	              component.set("v.showNc", true);
	           }else if (nav[i] =="North Dakota"){
	              component.set("v.showNd", true);
	           }else if (nav[i] =="Ohio"){
	              component.set("v.showOh", true);
	           }else if (nav[i] =="Oklahoma"){
	              component.set("v.showOk", true);
	           }else if (nav[i] =="Rhode Island"){
	              component.set("v.showRi", true);
	           }else if (nav[i] =="South Dakota"){
	              component.set("v.showSd", true);
	           }else if (nav[i] =="Tennessee"){
	              component.set("v.showTe", true);
	           }else if (nav[i] =="Utah"){
	              component.set("v.showUt", true);
	           }else if (nav[i] =="Vermont"){
	              component.set("v.showVe", true);
	           }else if (nav[i] =="Washington"){
	              component.set("v.showWa", true);
	           }else if (nav[i] =="	West Virginia"){
	              component.set("v.showWv", true);
	           }else if (nav[i] =="Wisconsin"){
	              component.set("v.showWi", true);
	           }else if (nav[i] =="Wyoming"){
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
	}
})