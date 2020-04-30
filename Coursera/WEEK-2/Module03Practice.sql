create database DBMSWeek2;

use DBMSWeek2;

-- 1. Write a CREATE TABLE statement for the Customer table. 
-- Choose data types appropriate for the DBMS used in your course. 
-- All columns are required (not null).
  
CREATE TABLE Customer 
 (CustNo VARCHAR(8) NOT NULL, 
  CustName VARCHAR(30) NOT NULL, 
  Address VARCHAR(50) NOT NULL, 
  Internal CHAR(1) NOT NULL, 
  Contact VARCHAR(35) NOT NULL, 
  Phone VARCHAR(11) NOT NULL, 
  City VARCHAR(30) NOT NULL,
  State VARCHAR(2) NOT NULL, 
  Zip VARCHAR(10) NOT NULL,
  CONSTRAINT CustNo_PK PRIMARY KEY (CustNo));
  
-- -------------------------------------------------------------------------------------

--  2. Write a CREATE TABLE statement for the Facility table. 
--  Choose data types appropriate for the DBMS used in your course. 
--  All columns are required (not null).
  
  CREATE TABLE Facility
(FacNo VARCHAR(8) NOT NULL, 
 FacName VARCHAR(30) NOT NULL,
 CONSTRAINT FacNo_PK PRIMARY KEY (FacNo));
 
-- ------------------------------------------------------------------------------------

-- 3. Write a CREATE TABLE statement for the Location table. 
-- Choose data types appropriate for the DBMS used in your course. 
-- LocName column is required (not null).
 
 CREATE TABLE Location
(LocNo VARCHAR(8) NOT NULL, 
 FacNo VARCHAR(8), 
 LocName VARCHAR(30) NOT NULL,
 CONSTRAINT LocNo_PK PRIMARY KEY (LocNo));
 
-- ------------------------------------------------------------------------------------
 
-- 4. Identify the foreign key(s) and 1-M relationship(s) among the Customer, Facility,and 
-- Location tables. For each relationship, identify the parent table and the child table.
 
-- Ans: Foreign key is FacNo in Location table reference to FacNo in Facility table.
--      Parent table - Facility
--      Child table  - Location
 
-- --------------------------------------------------------------------------------------
 
-- 5. Extend your CREATE TABLE statement from problem (3) with referential integrity 
--  constraints.

ALTER TABLE Location ADD CONSTRAINT FacNo_FK FOREIGN KEY(FacNo) 
REFERENCES Facility(FacNo);

-- 5.1. From examination of the sample data and your common understanding of scheduling 
-- and operation of events, are null values allowed for the foreign key in the Location 
-- table?  Why or why not? Extend the CREATE TABLE statement in problem (5) to enforce 
-- the null value restrictions if any.
 
 ALTER TABLE Location MODIFY FacNo VARCHAR(8) NOT NULL;
 
--  5.2. Extend your CREATE TABLE statement for the Facility table (problem 2) 
--  with a unique constraint for FacName. Use an external named constraint clause 
--  for the unique constraint.
 
 ALTER TABLE Facility ADD CONSTRAINT FacName_UK UNIQUE(FacName);
 

 
 
 
 
 