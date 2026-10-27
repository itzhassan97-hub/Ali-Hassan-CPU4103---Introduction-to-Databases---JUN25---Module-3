# CPU4:103 - Crownfield Eye Hospital Database

## Project Overview
This repository contains the physical database implementation for *Crownfield Eye Hospital*, developed as part of the CPU4:103 Introduction to Database assessment. The project involves analyzing unnormalized dataset, designing a normalized relational schema (3NF), and implementing the physical design using MySQL.

## Assumptions
During the conceptual design phase, the following business rules and assumptions were applied to model the data accurately:
1. Each clinician is assigned to only one primary medical specialty.
2. A single appointment might result in zero or multiple prescriptions (e.g., routine checkups may not require medicine).
3. One prescription can contain multiple different medicines (Medicine Items), each with its own specific dose and duration.

## Repository Structure
The repository is organized into the following files, representing different stages of the physical implementation. The SQL scripts must be executed in numerical order:

* *01_schema.sql*: Contains the Data Definition Language (DDL) statements to create the database and tables with appropriate Primary and Foreign Keys. It also includes the Data Manipulation Language (DML) INSERT statements to populate the tables with dummy data.
* *02_individual_queries.sql*: Contains the 6 required database queries (including JOINS, aggregate functions, and subqueries) designed to extract meaningful information.
* *03_procedure_and_trigger.sql*: Contains the SQL code for creating the required stored procedure and database trigger.
* *04_security.sql*: Contains the scripts to create specific user roles (Administrator, Doctor, Patient, Receptionist) and grant them appropriate database permissions.
* *05_ERD.jpg*: The Entity-Relationship Diagram (Conceptual Data Model) designed using standard Crow's Foot notation.

## Instructions to Run
To run and test this project locally:
1. Open *MySQL Workbench* (or any compatible SQL IDE).
2. Execute 01_schema.sql first to build the tables and insert the dummy records.
3. Run the remaining SQL files (02 to 04) one by one to test the queries, procedures, and security roles.
