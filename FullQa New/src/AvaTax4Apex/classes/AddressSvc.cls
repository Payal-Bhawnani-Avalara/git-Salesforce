/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class AddressSvc {
    global AddressSvc() {

    }
global class AddressSvcSoap {
    global CBEO.AddressSvc.Profile Profile;
    global CBEO.AddressSvc.Security Security;
    global Integer timeout_x {
        get;
        set;
    }
    global AddressSvcSoap(String SvcURL) {

    }
    global CBEO.AddressSvc.IsAuthorizedResult IsAuthorized(String Operations) {
        return null;
    }
    global CBEO.AddressSvc.PingResult Ping(String Message) {
        return null;
    }
    global CBEO.AddressSvc.ValidateResult Validate(CBEO.AddressSvc.ValidateRequest ValidateRequest) {
        return null;
    }
}
global class ArrayOfMessage {
    global List<CBEO.AddressSvc.Message> Message;
    global ArrayOfMessage() {

    }
}
global class ArrayOfValidAddress {
    global List<CBEO.AddressSvc.ValidAddress> ValidAddress;
    global ArrayOfValidAddress() {

    }
}
global class BaseAddress {
    global String AddressCode;
    global String City;
    global String Country;
    global String Latitude;
    global String Line1;
    global String Line2;
    global String Line3;
    global String Longitude;
    global String PostalCode;
    global String Region;
    global Integer TaxRegionId;
    global BaseAddress() {

    }
}
global class IsAuthorizedResult {
    global Datetime Expires;
    global CBEO.AddressSvc.ArrayOfMessage Messages;
    global String Operations;
    global String ResultCode;
    global String TransactionId;
    global IsAuthorizedResult() {

    }
}
global class Message {
    global String Details;
    global String HelpLink;
    global String Name;
    global String RefersTo;
    global String Severity;
    global String Source;
    global String Summary;
    global Message() {

    }
}
global class PingResult {
    global CBEO.AddressSvc.ArrayOfMessage Messages;
    global String ResultCode;
    global String TransactionId;
    global String Version;
    global PingResult() {

    }
}
global class Profile {
    global String Adapter;
    global String Client;
    global String Machine;
    global String Name;
    global Profile() {

    }
}
global class Security {
    global CBEO.AddressSvc.UsernameToken_element UsernameToken;
    global Security() {

    }
}
global class UsernameToken_element {
    global String Password;
    global String Username;
    global UsernameToken_element() {

    }
}
global class ValidAddress {
    global String AddressCode;
    global String AddressType;
    global String CarrierRoute;
    global String City;
    global String Country;
    global String County;
    global String FipsCode;
    global String GeocodeType;
    global String Latitude;
    global String Line1;
    global String Line2;
    global String Line3;
    global String Line4;
    global String Longitude;
    global String PostalCode;
    global String PostNet;
    global String Region;
    global Integer TaxRegionId;
    global String ValidateStatus;
    global ValidAddress() {

    }
}
global class ValidateRequest {
    global CBEO.AddressSvc.BaseAddress Address;
    global Boolean Coordinates;
    global Date Date_x;
    global Boolean Taxability;
    global String TextCase;
    global ValidateRequest() {

    }
}
global class ValidateResult {
    global CBEO.AddressSvc.ArrayOfMessage Messages;
    global String ResultCode;
    global Boolean Taxable;
    global String TransactionId;
    global CBEO.AddressSvc.ArrayOfValidAddress ValidAddresses;
    global ValidateResult() {

    }
}
}
