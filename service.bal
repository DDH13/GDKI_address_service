import ballerina/log;
import ballerina/time;
import ballerina/uuid;
import ballerinax/mysql.driver as _;
import ballerina/persist;

isolated function addRequest(NewAddressRequest newrequest) returns AddressRequest|error {
    //check if gramasevaka division exists
    GramaDivision|error grama_division = getGramaDivision(newrequest.gramaDivision);
    if (grama_division is error) {
        return grama_division;
    }

    AddressRequest request = {
        id: uuid:createType4AsString(),
        address: newrequest.address,
        NIC: newrequest.NIC,
        gramadivisionId: newrequest.gramaDivision,
        applied_date: time:utcToCivil(time:utcNow()),
        status: "Pending",
        approved_by: ""
        };

    string[]|error added = dbclient->/addressrequests.post([request]);
    if (added is error) {
        log:printError("Error adding request");
        return request;
    }
    return request;
}

isolated function changeRequestStatus(string request_id, string status, string grama_id) returns ()|error {
    AddressRequest|error updated = dbclient->/addressrequests/[request_id].put({status: status, approved_by: grama_id});
    if (updated is error) {
        return updated;
    }
    return ();
}

isolated function getRequests() returns AddressRequest[]|error {
    AddressRequest[]|error requests = from var request in dbclient->/addressrequests(targetType = AddressRequest)
        select request;
    if requests is error {
        log:printError("Error while retrieving requests from the database", 'error = requests);
        return requests;
    } else {
        return requests;
    }
}

isolated function getRequest(string id) returns AddressRequest|error {
    AddressRequest|error request = dbclient->/addressrequests/[id];
    if request is error {
        return request;
    } else {
        return request;
    }
}

isolated function deleteRequest(string id) returns ()|error {
    AddressRequest|persist:Error deleted = dbclient->/addressrequests/[id].delete();
    if (deleted is error) {
        return deleted;
    }
    return ();
}

isolated function getRequestsByGramaDivision(string grama_division_id) returns AddressRequest[]|error {
    AddressRequest[]|error requests = from var request in dbclient->/addressrequests(targetType = AddressRequest)
        where request.gramadivisionId == grama_division_id
        select request;
    if requests is error {
        log:printError("Error while retrieving requests from the database", 'error = requests);
        return requests;
    } else {
        return requests;
    }
}

isolated function getRequestsByStatus(string status) returns AddressRequest[]|error {
    AddressRequest[]|error requests = from var request in dbclient->/addressrequests(targetType = AddressRequest)
        where request.status == status
        select request;
    if requests is error {
        log:printError("Error while retrieving requests from the database", 'error = requests);
        return requests;
    } else {
        return requests;
    }
}

isolated function getRequestsByStatusAndGramaDivision(string status, string grama_division_id) returns AddressRequest[]|error {
    AddressRequest[]|error requests = from var request in dbclient->/addressrequests(targetType = AddressRequest)
        where request.status == status
        where request.gramadivisionId == grama_division_id
        select request;
    if requests is error {
        log:printError("Error while retrieving requests from the database", 'error = requests);
        return requests;
    } else {
        return requests;
    }
}

isolated function getRequestsByNIC(string nic) returns AddressRequest[]|error {
    AddressRequest[]|error requests = from var request in dbclient->/addressrequests(targetType = AddressRequest)
        where request.NIC == nic
        select request;
    if requests is error {
        log:printError("Error while retrieving requests from the database", 'error = requests);
        return requests;
    } else {
        return requests;
    }
}

isolated function checkRequestIsValid(AddressRequest request) returns boolean|error {
    time:Utc applied_date = check time:utcFromCivil(<time:Civil>request.applied_date);
    time:Utc now = time:utcNow();
    time:Utc six_months_ago = time:utcAddSeconds(now, -15768000);
    //check if difference between applied date and now is less than 6 months
    if (applied_date<six_months_ago) {
        return false;
    }
    return true;
}

isolated function getGramaDivision(string id) returns GramaDivision|error {
    GramaDivision|error grama_division = dbclient->/gramadivisions/[id];
    if grama_division is error {
        return grama_division;
    } else {
        return grama_division;
    }
}

isolated function getGramaDivisions() returns GramaDivision[]|error {
    GramaDivision[]|error grama_divisions = from var grama_division in dbclient->/gramadivisions(targetType = GramaDivision)
        select grama_division;
    if grama_divisions is error {
        log:printError("Error while retrieving grama divisions from the database", 'error = grama_divisions);
        return grama_divisions;
    } else {
        return grama_divisions;
    }
}

function initializeDbClient() returns Client|error {
    return new Client();
}

final Client dbclient = check initializeDbClient();


