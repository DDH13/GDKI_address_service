import ballerina/persist as _;
import ballerina/time;

public type AddressRequest record {|
    readonly string id;
    string address;
    string NIC;
    time:Date applied_date;
    string approved_by;
    GramaDivision gramaDivision;
    string status;
|};

public type GramaDivision record {|
    readonly string id;
    string province;
    string district;
    string DS_division;
    string GN_division;
    AddressRequest[] addressRequests;
|};