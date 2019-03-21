/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class zChargeGroup {
    global String groupID {
        get;
    }
    global Integer groupType {
        get;
    }
    global String productName {
        get;
    }
    global String productRatePlanZuoraID {
        get;
    }
    global zqu__Quote__c quote {
        get;
    }
    global String ratePlanName {
        get;
    }
    global static Integer TYPE_AMENDMENT_NEWPRODUCT;
    global static Integer TYPE_AMENDMENT_ORIGINAL;
    global static Integer TYPE_AMENDMENT_REMOVEPRODUCT;
    global static Integer TYPE_AMENDMENT_UPDATEPRODUCT;
    global static Integer TYPE_CANCELLATION_ORIGINAL;
    global static Integer TYPE_PRODUCT_NEW;
    global static Integer TYPE_RENEWAL_NEWPRODUCT;
    global static Integer TYPE_RENEWAL_REMOVEPRODUCT;
    global static Integer TYPE_RENEWAL_RENEWED;
    global static Integer TYPE_RENEWAL_UPDATEPRODUCT;
    global static Integer TYPE_SUBSCRIPTION_ADDED;
    global List<zqu.zCharge> zCharges {
        get;
        set;
    }
    global zqu.zChargeGroup deepClone() {
        return null;
    }
    global Boolean getShowVisualForceDelete() {
        return null;
    }
    global Boolean getShowVisualForceEdit() {
        return null;
    }
    global Boolean getShowVisualForceUndelete() {
        return null;
    }
}
