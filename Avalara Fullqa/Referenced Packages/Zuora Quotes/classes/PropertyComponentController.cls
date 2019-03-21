/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class PropertyComponentController {
global interface ICancelPlugin {
    System.PageReference doCancel(SObject param0, zqu.PropertyComponentController.ParentController param1);
}
global interface IGoBackPlugin {
    System.PageReference goBack(SObject param0, zqu.PropertyComponentController.ParentController param1);
}
global interface IPopulateValueAndLookupPlugin extends zqu.PropertyComponentController.IPopulateValuePlugin {
    zqu.LookupComponentOptions getLookupOption(String param0);
    void setLookupOptions(zqu.PropertyComponentController.ParentController param0);
}
global interface IPopulateValuePlugin {
    void populateDefaultFieldValue(SObject param0, zqu.PropertyComponentController.ParentController param1);
}
global interface IRelatedObjectPlugin {
    Map<String,SObject> getRelatedObject(zqu.PropertyComponentController.ParentController param0);
}
global interface IUpdatePlugin {
    System.PageReference doUpdate(SObject param0, zqu.PropertyComponentController.ParentController param1);
}
global virtual class ParentController {
    global ParentController() {

    }
    global virtual void registerController(zqu.PropertyComponentController pcc, String instanceName) {

    }
}
global class PropertyComponentPluginException extends Exception {
}
}
