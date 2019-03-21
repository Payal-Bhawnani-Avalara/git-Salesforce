/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global virtual class TaxSvc {
    global TaxSvc() {

    }
global class AdjustTaxRequest {
    global String AdjustmentDescription;
    global Integer AdjustmentReason;
    global CBEO.TaxSvc.GetTaxRequest GetTaxRequest;
    global AdjustTaxRequest() {

    }
}
global class AdjustTaxResult {
    global String AdjustmentDescription;
    global Integer AdjustmentReason;
    global String DocCode;
    global Date DocDate;
    global String DocStatus;
    global String DocType;
    global Boolean Locked;
    global Boolean Reconciled;
    global CBEO.TaxSvc.ArrayOfTaxAddress TaxAddresses;
    global Date TaxDate;
    global CBEO.TaxSvc.ArrayOfTaxLine TaxLines;
    global CBEO.TaxSvc.ArrayOfTaxDetail TaxSummary;
    global Datetime Timestamp;
    global Decimal TotalAmount;
    global Decimal TotalDiscount;
    global Decimal TotalExemption;
    global Decimal TotalTax;
    global Decimal TotalTaxable;
    global Decimal TotalTaxCalculated;
    global Integer Version;
    global AdjustTaxResult() {

    }
}
global class ApplyPaymentRequest {
    global String CompanyCode;
    global String DocCode;
    global String DocType;
    global Date PaymentDate;
    global ApplyPaymentRequest() {

    }
}
global class ApplyPaymentResult {
    global ApplyPaymentResult() {

    }
}
global class ArrayOfBaseAddress {
    global List<CBEO.TaxSvc.BaseAddress> BaseAddress;
    global ArrayOfBaseAddress() {

    }
}
global class ArrayOfGetTaxResult {
    global List<CBEO.TaxSvc.GetTaxResult> GetTaxResult;
    global ArrayOfGetTaxResult() {

    }
}
global class ArrayOfLine {
    global List<CBEO.TaxSvc.Line> Line;
    global ArrayOfLine() {

    }
}
global class ArrayOfMessage {
    global List<CBEO.TaxSvc.Message> Message;
    global ArrayOfMessage() {

    }
}
global class ArrayOfTaxAddress {
    global List<CBEO.TaxSvc.TaxAddress> TaxAddress;
    global ArrayOfTaxAddress() {

    }
}
global class ArrayOfTaxDetail {
    global List<CBEO.TaxSvc.TaxDetail> TaxDetail;
    global ArrayOfTaxDetail() {

    }
}
global class ArrayOfTaxLine {
    global List<CBEO.TaxSvc.TaxLine> TaxLine;
    global ArrayOfTaxLine() {

    }
}
global class AuditMessage {
    global String Message;
    global AuditMessage() {

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
global class CancelTaxRequest {
    global String CancelCode;
    global String CompanyCode;
    global String DocCode;
    global String DocType;
    global CancelTaxRequest() {

    }
}
global class CancelTaxResult {
    global CBEO.TaxSvc.ArrayOfMessage Messages;
    global String ResultCode;
    global String TransactionId;
    global CancelTaxResult() {

    }
}
global class CommitTaxRequest {
    global String CompanyCode;
    global String DocCode;
    global String DocType;
    global String NewDocCode;
    global CommitTaxRequest() {

    }
}
global class CommitTaxResult {
    global String DocId;
    global CBEO.TaxSvc.ArrayOfMessage Messages;
    global String ResultCode;
    global String TransactionId;
    global CommitTaxResult() {

    }
}
global class GetTaxHistoryRequest {
    global String CompanyCode;
    global String DetailLevel;
    global String DocCode;
    global String DocType;
    global GetTaxHistoryRequest() {

    }
}
global class GetTaxHistoryResult {
    global CBEO.TaxSvc.GetTaxRequest GetTaxRequest;
    global CBEO.TaxSvc.GetTaxResult GetTaxResult;
    global CBEO.TaxSvc.ArrayOfMessage Messages;
    global String ResultCode;
    global String TransactionId;
    global GetTaxHistoryResult() {

    }
}
global class GetTaxRequest {
    global CBEO.TaxSvc.ArrayOfBaseAddress Addresses;
    global String BatchCode;
    global Boolean Commit_x;
    global String CompanyCode;
    global String CurrencyCode;
    global String CustomerCode;
    global String CustomerUsageType;
    global String DestinationCode;
    global String DetailLevel;
    global Decimal Discount;
    global String DocCode;
    global Date DocDate;
    global String DocType;
    global Decimal ExchangeRate;
    global Date ExchangeRateEffDate;
    global String ExemptionNo;
    global CBEO.TaxSvc.ArrayOfLine Lines;
    global String LocationCode;
    global String OriginCode;
    global Date PaymentDate;
    global String PurchaseOrderNo;
    global String ReferenceCode;
    global String SalespersonCode;
    global String ServiceMode;
    global CBEO.TaxSvc.TaxOverride TaxOverride;
    global GetTaxRequest() {

    }
}
global class GetTaxResult {
    global String AdjustmentDescription;
    global Integer AdjustmentReason;
    global String DocCode;
    global Date DocDate;
    global String DocId;
    global String DocStatus;
    global String DocType;
    global Integer HashCode;
    global Boolean Locked;
    global CBEO.TaxSvc.ArrayOfMessage Messages;
    global Boolean Reconciled;
    global String ResultCode;
    global CBEO.TaxSvc.ArrayOfTaxAddress TaxAddresses;
    global Date TaxDate;
    global CBEO.TaxSvc.ArrayOfTaxLine TaxLines;
    global CBEO.TaxSvc.ArrayOfTaxDetail TaxSummary;
    global Datetime Timestamp;
    global Decimal TotalAmount;
    global Decimal TotalDiscount;
    global Decimal TotalExemption;
    global Decimal TotalTax;
    global Decimal TotalTaxable;
    global Decimal TotalTaxCalculated;
    global String TransactionId;
    global Integer Version;
    global GetTaxResult() {

    }
}
global class IsAuthorizedResult {
    global Datetime Expires;
    global CBEO.TaxSvc.ArrayOfMessage Messages;
    global String Operations;
    global String ResultCode;
    global String TransactionId;
    global IsAuthorizedResult() {

    }
}
global class Line {
    global Decimal Amount;
    global String CustomerUsageType;
    global String Description;
    global String DestinationCode;
    global Boolean Discounted;
    global String ExemptionNo;
    global String ItemCode;
    global String No;
    global String OriginCode;
    global Decimal Qty;
    global String Ref1;
    global String Ref2;
    global String RevAcct;
    global String TaxCode;
    global Boolean TaxIncluded;
    global CBEO.TaxSvc.TaxOverride TaxOverride;
    global Line() {

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
    global CBEO.TaxSvc.ArrayOfMessage Messages;
    global String ResultCode;
    global String TransactionId;
    global String Version;
    global PingResult() {

    }
}
global class PostTaxRequest {
    global Boolean Commit_x;
    global String CompanyCode;
    global String DocCode;
    global Date DocDate;
    global String DocType;
    global Integer HashCode;
    global String NewDocCode;
    global Decimal TotalAmount;
    global Decimal TotalTax;
    global PostTaxRequest() {

    }
}
global class PostTaxResult {
    global CBEO.TaxSvc.ArrayOfMessage Messages;
    global String ResultCode;
    global String TransactionId;
    global PostTaxResult() {

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
global class ReconcileTaxHistoryRequest {
    global String CompanyCode;
    global String DocStatus;
    global String DocType;
    global Date EndDate;
    global String LastDocCode;
    global Integer PageSize;
    global Boolean Reconciled;
    global Date StartDate;
    global ReconcileTaxHistoryRequest() {

    }
}
global class ReconcileTaxHistoryResult {
    global CBEO.TaxSvc.ArrayOfGetTaxResult GetTaxResults;
    global String LastDocCode;
    global CBEO.TaxSvc.ArrayOfMessage Messages;
    global Integer RecordCount;
    global String ResultCode;
    global String TransactionId;
    global ReconcileTaxHistoryResult() {

    }
}
global class Security {
    global CBEO.AddressSvc.UsernameToken_element UsernameToken;
    global Security() {

    }
}
global class TaxAddress {
    global String Address;
    global String AddressCode;
    global Integer BoundaryLevel;
    global String City;
    global String Country;
    global String GeocodeType;
    global String JurisCode;
    global String Latitude;
    global String Longitude;
    global String PostalCode;
    global String Region;
    global Integer TaxRegionId;
    global String ValidateStatus;
    global TaxAddress() {

    }
}
global class TaxDetail {
    global Decimal Base;
    global String Country;
    global Decimal Exemption;
    global String JurisCode;
    global String JurisName;
    global String JurisType;
    global Decimal NonTaxable;
    global Decimal Rate;
    global String RateType;
    global String Region;
    global String StateAssignedNo;
    global Decimal Tax;
    global Decimal Taxable;
    global Integer TaxAuthorityType;
    global Decimal TaxCalculated;
    global String TaxGroup;
    global String TaxName;
    global String TaxType;
    global TaxDetail() {

    }
}
global class TaxLine {
    global String AccountingMethod;
    global String BoundaryLevel;
    global Decimal Discount;
    global Integer ExemptCertId;
    global Decimal Exemption;
    global String No;
    global Decimal Rate;
    global Date ReportingDate;
    global Decimal Tax;
    global Boolean Taxability;
    global Decimal Taxable;
    global Decimal TaxCalculated;
    global String TaxCode;
    global Date TaxDate;
    global CBEO.TaxSvc.ArrayOfTaxDetail TaxDetails;
    global Boolean TaxIncluded;
    global TaxLine() {

    }
}
global class TaxOverride {
    global String Reason;
    global Decimal TaxAmount;
    global Date TaxDate;
    global String TaxOverrideType;
    global TaxOverride() {

    }
}
global class TaxSvcSoap {
    global CBEO.TaxSvc.AuditMessage AuditMessage;
    global CBEO.TaxSvc.Profile Profile;
    global CBEO.TaxSvc.Security Security;
    global Integer timeout_x {
        get;
        set;
    }
    global TaxSvcSoap(String SvcURL) {

    }
    global CBEO.TaxSvc.AdjustTaxResult AdjustTax(CBEO.TaxSvc.AdjustTaxRequest AdjustTaxRequest) {
        return null;
    }
    global CBEO.TaxSvc.ApplyPaymentResult ApplyPayment(CBEO.TaxSvc.ApplyPaymentRequest ApplyPaymentRequest) {
        return null;
    }
    global CBEO.TaxSvc.CancelTaxResult CancelTax(CBEO.TaxSvc.CancelTaxRequest CancelTaxRequest) {
        return null;
    }
    global CBEO.TaxSvc.CommitTaxResult CommitTax(CBEO.TaxSvc.CommitTaxRequest CommitTaxRequest) {
        return null;
    }
    global CBEO.TaxSvc.GetTaxResult GetTax(CBEO.TaxSvc.GetTaxRequest GetTaxRequest) {
        return null;
    }
    global CBEO.TaxSvc.GetTaxHistoryResult GetTaxHistory(CBEO.TaxSvc.GetTaxHistoryRequest GetTaxHistoryRequest) {
        return null;
    }
    global CBEO.TaxSvc.IsAuthorizedResult IsAuthorized(String Operations) {
        return null;
    }
    global CBEO.TaxSvc.PingResult Ping(String Message) {
        return null;
    }
    global CBEO.TaxSvc.PostTaxResult PostTax(CBEO.TaxSvc.PostTaxRequest PostTaxRequest) {
        return null;
    }
    global CBEO.TaxSvc.ReconcileTaxHistoryResult ReconcileTaxHistory(CBEO.TaxSvc.ReconcileTaxHistoryRequest ReconcileTaxHistoryRequest) {
        return null;
    }
}
global class UsernameToken_element {
    global String Password;
    global String Username;
    global UsernameToken_element() {

    }
}
}
