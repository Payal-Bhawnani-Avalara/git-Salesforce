({
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
        
   }
})