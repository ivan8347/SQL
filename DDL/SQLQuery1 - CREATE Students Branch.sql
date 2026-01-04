-- SQLQuery1 - CREATE Students Branch.sql
USE SPU_411_DDL;
-- CREATE TABLE Directions
-- (
-- direction_id    TINYINT			PRIMARY KEY,
-- direction_name  NVARCHAR(150)    NOT NULL
-- )
--CREATE TABLE Groups
--(
--group_id    INT			     PRIMARY KEY,
--group_name  NVARCHAR(24)		 NOT NULL,
--direction   TINYINT			 NOT NULL
--CONSTRAINT  FK_Groups_Directions  FOREIGN KEY REFERENCES Directions(direction_id)
--);
CREATE TABLE Students 
(
student_id  INT					PRIMARY KEY,
last_name   NVARCHAR(50)		NOT NULL,
first_name  NVARCHAR(50)		NOT NULL,
midl_name   NVARCHAR(50)		NULL,
birth_date  DATE				NOT NULL,
[group]     INT					NOT NULL
CONSTRAINT  FK_Students_Groups  FOREIGN KEY REFERENCES Groups(group_id)
 );