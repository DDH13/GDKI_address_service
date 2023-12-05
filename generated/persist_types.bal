// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.
import ballerina/time;

public type AddressRequest record {|
    readonly string id;
    string address;
    string NIC;
    time:Utc applied_date;
    time:Utc approved_date;
    string approved_by;
    string gramadivisionId;
    string status;
|};

public type AddressRequestOptionalized record {|
    string id?;
    string address?;
    string NIC?;
    time:Utc applied_date?;
    time:Utc approved_date?;
    string approved_by?;
    string gramadivisionId?;
    string status?;
|};

public type AddressRequestWithRelations record {|
    *AddressRequestOptionalized;
    GramaDivisionOptionalized gramaDivision?;
|};

public type AddressRequestTargetType typedesc<AddressRequestWithRelations>;

public type AddressRequestInsert AddressRequest;

public type AddressRequestUpdate record {|
    string address?;
    string NIC?;
    time:Utc applied_date?;
    time:Utc approved_date?;
    string approved_by?;
    string gramadivisionId?;
    string status?;
|};

public type GramaDivision record {|
    readonly string id;
    string province;
    string district;
    string DS_division;
    string GN_division;
|};

public type GramaDivisionOptionalized record {|
    string id?;
    string province?;
    string district?;
    string DS_division?;
    string GN_division?;
|};

public type GramaDivisionWithRelations record {|
    *GramaDivisionOptionalized;
    AddressRequestOptionalized[] addressRequests?;
|};

public type GramaDivisionTargetType typedesc<GramaDivisionWithRelations>;

public type GramaDivisionInsert GramaDivision;

public type GramaDivisionUpdate record {|
    string province?;
    string district?;
    string DS_division?;
    string GN_division?;
|};

