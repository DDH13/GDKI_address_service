INSERT INTO GDKI_address.GramaDivision
SELECT * FROM GDKI_identity.GramaDivision;

-- Generating 10 rows of dummy data for AddressRequest table with UUIDs for ID
INSERT INTO AddressRequest (id, address, NIC, applied_date, approved_by, status, gramadivisionId)
VALUES
    (UUID(), '123 Main St', '200040724825', '2023-11-01', 'Approver1', 'Pending', '6c7f2204-8c5e-11ee-96e8-42010a8e0fea'),
    (UUID(), '456 Elm St', '200319274625', '2023-11-02', 'Approver2', 'Rejected', '6c7f332f-8c5e-11ee-96e8-42010a8e0fea'),
    (UUID(), '789 Oak St', '200512349871', '2023-11-03', 'Approver3', 'Cleared', '6c7f3550-8c5e-11ee-96e8-42010a8e0fea'),
    (UUID(), '101 Pine St', '200625489732', '2023-11-04', 'Approver1', 'Pending', '6c7f35ca-8c5e-11ee-96e8-42010a8e0fea'),
    (UUID(), '111 Cedar St', '200117491593', '2023-11-05', 'Approver2', 'Rejected', '6c7f362e-8c5e-11ee-96e8-42010a8e0fea'),
    (UUID(), '222 Maple St', '200239613714', '2023-11-06', 'Approver3', 'Cleared', '6c7f3689-8c5e-11ee-96e8-42010a8e0fea'),
    (UUID(), '333 Walnut St', '200712349871', '2023-11-07', 'Approver1', 'Pending', '6c7f36d6-8c5e-11ee-96e8-42010a8e0fea'),
    (UUID(), '444 Birch St', '200040724825', '2023-11-08', 'Approver2', 'Rejected', '6c7f3727-8c5e-11ee-96e8-42010a8e0fea'),
    (UUID(), '555 Ash St', '200319274625', '2023-11-09', 'Approver3', 'Cleared', '6c7f3780-8c5e-11ee-96e8-42010a8e0fea'),
    (UUID(), '666 Spruce St', '200512349871', '2023-11-10', 'Approver1', 'Pending', '6c7f37c5-8c5e-11ee-96e8-42010a8e0fea');

