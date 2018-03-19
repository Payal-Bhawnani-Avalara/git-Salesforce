({
	redirect : function(component) {
      var navEvt = $A.get("e.CameleonCPQ:navigateToURL");
      navEvt.setParams({
         "url": '/'+component.get("v.entityId")
      });
      navEvt.fire();		
	}
})