
USE ToolsRentDatabase

CREATE TABLE tblTool
(
Id INT IDENTITY NOT NULL,
Model NVARCHAR(50) NOT NULL,
Manufacturer NVARCHAR(50) NOT NULL,
Kind NVARCHAR(50) NOT NULL,
SerialNumber NVARCHAR(50) NOT NULL,
Cost NUMERIC(18,4) NOT NULL,
CONSTRAINT PK_tblTools_Id PRIMARY KEY (Id)
)

CREATE TABLE tblCustomer
(
Id INT IDENTITY NOT NULL,
Name NVARCHAR(50) NOT NULL,
Surname NVARCHAR(50) NOT NULL,
ContactPhone NVARCHAR(50) NOT NULL,
Adress NVARCHAR(50) NOT NULL,
CONSTRAINT PK_tblCustomers_Id PRIMARY KEY (Id)
)

CREATE TABLE tblOperator
(
Id INT IDENTITY NOT NULL,
[Login] VARCHAR(30) NOT NULL,
[Password] VARCHAR(40) NOT NULL,
Name VARCHAR(50) NOT NULL,
Surname VARCHAR(50) NOT NULL,
-- Review HP: Missing comma after column definition 
[Disabled] BIT NOT NULL
CONSTRAINT PK_tblOperator_Id PRIMARY KEY (Id),
CONSTRAINT UQ_tblOperator_Login UNIQUE ([Login])
)

CREATE TABLE tblRentOrder
(
Id INT IDENTITY NOT NULL,
IdTool INT NOT NULL,
IdCustomer INT NOT NULL,
IdOperator INT NOT NULL,
DateStart DATETIME NOT NULL,
DateEnd DATETIME NOT NULL,
RentStatus INT NOT NULL,
-- Review HP: Missing comma after column definition 
RentPrice NUMERIC (18,4)
CONSTRAINT PK_tblRentOrder_Id PRIMARY KEY (Id),
CONSTRAINT FK_tblRentOrder_tblTool_Id FOREIGN KEY (IdTool) REFERENCES tblTool(Id),
CONSTRAINT FK_tblRentOrder_tblCustomer_Id FOREIGN KEY (IdCustomer) REFERENCES tblCustomer(Id),
CONSTRAINT FK_tblRentOrder_tblOperator_Id FOREIGN KEY (IdOperator) REFERENCES tblOperator (Id)
)


