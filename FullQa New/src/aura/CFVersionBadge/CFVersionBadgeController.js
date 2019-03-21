({
   openModel: function(component, event, helper) {
      // for Display Model,set the "isOpen" attribute to "true"
      component.set("v.isOpen", true);
   },
 
   closeModel: function(component, event, helper) {
      // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
      component.set("v.isOpen", false);
   },
   showNotes: function(component, event, helper) {
      // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
      var showNotes=component.get("v.showNotes");
       console.log('Show Hide Notes========='+showNotes);
       if(showNotes==true){
      	component.set("v.showNotes", false);
       }
       else
       {
           component.set("v.showNotes", true);
       }

   }    
})