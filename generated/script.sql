-- AUTO-GENERATED FILE.

-- This file is an auto-generated file by Ballerina persistence layer for model.
-- Please verify the generated scripts and execute them against the target DB server.

DROP TABLE IF EXISTS `AddressRequest`;
DROP TABLE IF EXISTS `GramaDivision`;

CREATE TABLE `GramaDivision` (
	`id` VARCHAR(191) NOT NULL,
	`province` VARCHAR(191) NOT NULL,
	`district` VARCHAR(191) NOT NULL,
	`DS_division` VARCHAR(191) NOT NULL,
	`GN_division` VARCHAR(191) NOT NULL,
	PRIMARY KEY(`id`)
);

CREATE TABLE `AddressRequest` (
	`id` VARCHAR(191) NOT NULL,
	`address` VARCHAR(191) NOT NULL,
	`NIC` VARCHAR(191) NOT NULL,
	`applied_date` TIMESTAMP NOT NULL,
	`approved_by` VARCHAR(191) NOT NULL,
	`status` VARCHAR(191) NOT NULL,
	`gramadivisionId` VARCHAR(191) NOT NULL,
	FOREIGN KEY(`gramadivisionId`) REFERENCES `GramaDivision`(`id`),
	PRIMARY KEY(`id`)
);
