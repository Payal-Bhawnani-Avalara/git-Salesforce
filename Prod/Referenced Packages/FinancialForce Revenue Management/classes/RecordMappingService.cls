/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class RecordMappingService {
    global RecordMappingService() {

    }
    global static ffrr.RecordMappingService.TransferResult transferValues(List<ffrr.RecordMappingService.TransferContext> contexts) {
        return null;
    }
    global static ffrr.RecordMappingService.TransferResult transferValues(List<ffrr.RecordMappingService.TransferContext> contexts, Boolean withSecurity) {
        return null;
    }
global class FieldMapping {
    global Object FixedValue {
        get;
        set;
    }
    global Schema.SObjectField SourceField {
        get;
        set;
    }
    global List<Schema.SObjectField> TargetFields {
        get;
        set;
    }
    global Boolean UseRecordName {
        get;
        set;
    }
    global FieldMapping() {

    }
}
global class TransferContext {
    global List<ffrr.RecordMappingService.FieldMapping> FieldMappings {
        get;
        set;
    }
    global Id SourceRecordId {
        get;
        set;
    }
    global List<Id> TargetRecordIds {
        get;
        set;
    }
    global TransferContext() {

    }
}
global class TransferResult {
    global List<Id> Ids {
        get;
        set;
    }
    global TransferResult() {

    }
}
}
