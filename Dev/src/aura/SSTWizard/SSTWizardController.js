({
    nextTab : function(component, event, helper) {
        component.set("v.setMessage", '');           
        var showIntro = component.get("v.showIntro");
        var showComInfo = component.get("v.showComInfo");
        var showSSTState = component.get("v.showSSTState");
        var showNexus = component.get("v.showNexus");
        var showData = component.get("v.showData");
        helper.fetchbusinessEntityTypePicklist(component) ; 
        helper.fetchstateOfInPicklist(component) ; 
        helper.fetchSStStatePicklist(component) ; 
        helper.fetcharRegisteredPicklist(component) ; 
        helper.fetcharFilPicklist(component) ; 
        if(showIntro == true){
          component.set("v.showIntro", false);
	      component.set("v.showComInfo", true);
	      component.set("v.showSSTState", false); 
	      component.set("v.showNexus", false);
	      component.set("v.showError", false);
	      component.set("v.showData", false);
        }    
        if(showComInfo == true){      
		    component.set("v.showIntro", false);
		    component.set("v.showComInfo", false);
		    component.set("v.showSSTState", true);
		    component.set("v.showNexus", false);
		    component.set("v.showError", false);
		    component.set("v.showData", false); 
        }   
        
        if(showSSTState == true){
	        component.set("v.showSSTState", false);
	        component.set("v.showNexus", true);
	        component.set("v.showComInfo", false);
	        component.set("v.showIntro", false)
	        component.set("v.showError", false);
	        component.set("v.showData", false);  
        }        
        if(showNexus == true){
	        component.set("v.showSSTState", false);
	        component.set("v.showNexus", true);
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
            component.set("v.showError", false);
            component.set("v.showData", false);
            
            
        } 
         if(showSSTState == true){
            component.set("v.showIntro", false);
            component.set("v.showComInfo", true);
            component.set("v.showSSTState", false);
             component.set("v.showNexus", false);
            component.set("v.showError", false);
            component.set("v.showData", false);
            
            
        } 
        if(showData == true){
            component.set("v.showIntro", false);
            component.set("v.showComInfo", false);
            component.set("v.showSSTState", true);
             component.set("v.showNexus", false);
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
	           }
	         }
	      }
    }
 
})