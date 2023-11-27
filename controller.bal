import ballerina/http;
public type NewAddressRequest record {
    string address;
    string NIC;
    string gramaDivision;
};

public type UpdateStatusRequest record {J
    string grama_nic;
    string request_id;
    string status;
};

service /address on new http:Listener(8082){
    isolated resource function get requests(string gdid="", string status="", int rlimit = -1, int offset = -1) returns AddressRequest[]|error {
        if (gdid != "" && status != "") {
            return getRequestsByStatusAndGramaDivision(status, gdid);
        }
        else if (status != "") {
            return getRequestsByStatus(status);
        }
        else if (gdid != "") {
            return getRequestsByGramaDivision(gdid);
        }
        else {
            return getRequests();
        }
    }

    isolated resource function get requests/[string id]() returns AddressRequest|error {
        return getRequest(id);
    }

    isolated resource function post requests(NewAddressRequest request) returns AddressRequest|error {
        return addRequest(request);
    }

    isolated resource function put requests(UpdateStatusRequest request) returns ()|error {
        error? changeRequestStatusResult = changeRequestStatus(request.request_id, request.status, request.grama_nic);
        if changeRequestStatusResult is error {
            return changeRequestStatusResult;
        }
        else {
            return ();
        }
    }

    isolated resource function delete requests/[string id]() returns ()|error {
        error? deleteRequestResult = deleteRequest(id);
        if deleteRequestResult is error {
            return deleteRequestResult;
        }
        else {
            return ();
        }
    }

    isolated resource function get divisions() returns GramaDivision[]|error {
        return getGramaDivisions();
    }
}