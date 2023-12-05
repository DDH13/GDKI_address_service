// AUTO-GENERATED FILE. DO NOT MODIFY.
// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.
import ballerina/jballerina.java;
import ballerina/persist;
import ballerina/sql;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerinax/persist.sql as psql;

const ADDRESS_REQUEST = "addressrequests";
const GRAMA_DIVISION = "gramadivisions";

public isolated client class Client {
    *persist:AbstractPersistClient;

    private final mysql:Client dbClient;

    private final map<psql:SQLClient> persistClients;

    private final record {|psql:SQLMetadata...;|} & readonly metadata = {
        [ADDRESS_REQUEST] : {
            entityName: "AddressRequest",
            tableName: "AddressRequest",
            fieldMetadata: {
                id: {columnName: "id"},
                address: {columnName: "address"},
                NIC: {columnName: "NIC"},
                applied_date: {columnName: "applied_date"},
                approved_by: {columnName: "approved_by"},
                approved_date: {columnName: "approved_date"},
                gramadivisionId: {columnName: "gramadivisionId"},
                status: {columnName: "status"},
                "gramaDivision.id": {relation: {entityName: "gramaDivision", refField: "id"}},
                "gramaDivision.province": {relation: {entityName: "gramaDivision", refField: "province"}},
                "gramaDivision.district": {relation: {entityName: "gramaDivision", refField: "district"}},
                "gramaDivision.DS_division": {relation: {entityName: "gramaDivision", refField: "DS_division"}},
                "gramaDivision.GN_division": {relation: {entityName: "gramaDivision", refField: "GN_division"}}
            },
            keyFields: ["id"],
            joinMetadata: {gramaDivision: {entity: GramaDivision, fieldName: "gramaDivision", refTable: "GramaDivision", refColumns: ["id"], joinColumns: ["gramadivisionId"], 'type: psql:ONE_TO_MANY}}
        },
        [GRAMA_DIVISION] : {
            entityName: "GramaDivision",
            tableName: "GramaDivision",
            fieldMetadata: {
                id: {columnName: "id"},
                province: {columnName: "province"},
                district: {columnName: "district"},
                DS_division: {columnName: "DS_division"},
                GN_division: {columnName: "GN_division"},
                "addressRequests[].id": {relation: {entityName: "addressRequests", refField: "id"}},
                "addressRequests[].address": {relation: {entityName: "addressRequests", refField: "address"}},
                "addressRequests[].NIC": {relation: {entityName: "addressRequests", refField: "NIC"}},
                "addressRequests[].applied_date": {relation: {entityName: "addressRequests", refField: "applied_date"}},
                "addressRequests[].approved_by": {relation: {entityName: "addressRequests", refField: "approved_by"}},
                "addressRequests[].approved_date": {relation: {entityName: "addressRequests", refField: "approved_date"}},
                "addressRequests[].gramadivisionId": {relation: {entityName: "addressRequests", refField: "gramadivisionId"}},
                "addressRequests[].status": {relation: {entityName: "addressRequests", refField: "status"}}
            },
            keyFields: ["id"],
            joinMetadata: {addressRequests: {entity: AddressRequest, fieldName: "addressRequests", refTable: "AddressRequest", refColumns: ["gramadivisionId"], joinColumns: ["id"], 'type: psql:MANY_TO_ONE}}
        }
    };

    public isolated function init() returns persist:Error? {
        mysql:Client|error dbClient = new (host = host, user = user, password = password, database = database, port = port, options = connectionOptions);
        if dbClient is error {
            return <persist:Error>error(dbClient.message());
        }
        self.dbClient = dbClient;
        self.persistClients = {
            [ADDRESS_REQUEST] : check new (dbClient, self.metadata.get(ADDRESS_REQUEST), psql:MYSQL_SPECIFICS),
            [GRAMA_DIVISION] : check new (dbClient, self.metadata.get(GRAMA_DIVISION), psql:MYSQL_SPECIFICS)
        };
    }

    isolated resource function get addressrequests(AddressRequestTargetType targetType = <>, sql:ParameterizedQuery whereClause = ``, sql:ParameterizedQuery orderByClause = ``, sql:ParameterizedQuery limitClause = ``, sql:ParameterizedQuery groupByClause = ``) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get addressrequests/[string id](AddressRequestTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post addressrequests(AddressRequestInsert[] data) returns string[]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ADDRESS_REQUEST);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from AddressRequestInsert inserted in data
            select inserted.id;
    }

    isolated resource function put addressrequests/[string id](AddressRequestUpdate value) returns AddressRequest|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ADDRESS_REQUEST);
        }
        _ = check sqlClient.runUpdateQuery(id, value);
        return self->/addressrequests/[id].get();
    }

    isolated resource function delete addressrequests/[string id]() returns AddressRequest|persist:Error {
        AddressRequest result = check self->/addressrequests/[id].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ADDRESS_REQUEST);
        }
        _ = check sqlClient.runDeleteQuery(id);
        return result;
    }

    isolated resource function get gramadivisions(GramaDivisionTargetType targetType = <>, sql:ParameterizedQuery whereClause = ``, sql:ParameterizedQuery orderByClause = ``, sql:ParameterizedQuery limitClause = ``, sql:ParameterizedQuery groupByClause = ``) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get gramadivisions/[string id](GramaDivisionTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post gramadivisions(GramaDivisionInsert[] data) returns string[]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(GRAMA_DIVISION);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from GramaDivisionInsert inserted in data
            select inserted.id;
    }

    isolated resource function put gramadivisions/[string id](GramaDivisionUpdate value) returns GramaDivision|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(GRAMA_DIVISION);
        }
        _ = check sqlClient.runUpdateQuery(id, value);
        return self->/gramadivisions/[id].get();
    }

    isolated resource function delete gramadivisions/[string id]() returns GramaDivision|persist:Error {
        GramaDivision result = check self->/gramadivisions/[id].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(GRAMA_DIVISION);
        }
        _ = check sqlClient.runDeleteQuery(id);
        return result;
    }

    remote isolated function queryNativeSQL(sql:ParameterizedQuery sqlQuery, typedesc<record {}> rowType = <>) returns stream<rowType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor"
    } external;

    remote isolated function executeNativeSQL(sql:ParameterizedQuery sqlQuery) returns psql:ExecutionResult|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor"
    } external;

    public isolated function close() returns persist:Error? {
        error? result = self.dbClient.close();
        if result is error {
            return <persist:Error>error(result.message());
        }
        return result;
    }
}

