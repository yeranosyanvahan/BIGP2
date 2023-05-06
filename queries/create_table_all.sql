
-- Part1
USE master;
GO
DROP DATABASE IF EXISTS   Orders_RELATION_DB
GO
CREATE DATABASE Orders_RELATION_DB;

GO
USE Orders_RELATION_DB;
GO

DROP TABLE IF EXISTS  [dbo].[OrderDetails]
GO
DROP TABLE IF EXISTS  [dbo].[Orders]
GO
DROP TABLE IF EXISTS  [dbo].[Products]
GO
DROP TABLE IF EXISTS  [dbo].[Shippers]
GO
DROP TABLE IF EXISTS  [dbo].[Customers]
GO
DROP TABLE IF EXISTS  [dbo].[Suppliers]
GO
DROP TABLE IF EXISTS  [dbo].[Categories]
GO
DROP TABLE IF EXISTS  [dbo].[EmployeeTerritories]
GO
DROP TABLE IF EXISTS  [dbo].[Employees]
GO
DROP TABLE IF EXISTS  [dbo].[Territories]
GO
DROP TABLE IF EXISTS   [dbo].[Region]
GO


CREATE TABLE  [dbo].[Region](
	RegionID int PRIMARY KEY,
	RegionDescription nchar(50) NOT NULL 
);



CREATE TABLE  [dbo].[Territories](
	TerritoryID nvarchar(20) PRIMARY KEY,
	TerritoryDescription nchar(50) NOT NULL,
	RegionID int  NOT NULL,
	FOREIGN KEY(RegionID) references Region(RegionID)
);




CREATE TABLE  [dbo].[Employees](
	EmployeeID int PRIMARY KEY,
	LastName nvarchar(20) NOT NULL,
	FirstName nvarchar(10)  NOT NULL,
	Title nvarchar(30) NULL,
	TitleOfCourtesy nvarchar(25) NULL, 
	BirthDate datetime NULL,
	HireDate datetime NULL,
	Address nvarchar(60) NULL,
	City nvarchar(15) NULL,
	Region nvarchar(15) NULL,
	PostalCode nvarchar(10) NULL,
	Country nvarchar(15) NULL,
	HomePhone nvarchar(24) NULL,
	Extension nvarchar(4) NULL,
	Photo image NULL,
	Notes varchar(MAX) NULL,
	ReportsTo int NULL,
	PhotoPath nvarchar(255) NULL,
	FOREIGN KEY(ReportsTo) references Employees(EmployeeID)
);



CREATE TABLE  [dbo].[EmployeeTerritories](
	EmployeeID int NOT NULL,
	TerritoryID nvarchar(20) NOT NULL,
	FOREIGN KEY(EmployeeID) references Employees(EmployeeID),
	FOREIGN KEY(TerritoryID) references Territories(TerritoryID),
	PRIMARY KEY(EmployeeID, TerritoryID)
);



CREATE TABLE  [dbo].[Categories](
	CategoryID int PRIMARY KEY,
	CategorName nvarchar(15) NOT NULL,
	Description varchar(MAX) NULL,
	Picture image NULL
);


CREATE TABLE  [dbo].[Suppliers](
	SupplierID int PRIMARY KEY,
	CompanyName nvarchar(40) NOT NULL,
	ContactName nvarchar(30) NULL,
	ContactTitle nvarchar(30) NULL,
	Address nvarchar(60) NULL,
	City nvarchar(15) NULL,
	Region nvarchar(15) NULL,
	PostalCode nvarchar(10) NULL,
	Country nvarchar(15) NULL,
	Phone nvarchar(24) NULL,
	Fax nvarchar(24) NULL,
	HomePage varchar(MAX) NULL
);





CREATE TABLE  [dbo].[Customers](
	CustomerID nchar(5) PRIMARY KEY,
	CompanyName nvarchar(40) NOT NULL,
	ContactName nvarchar(30) NULL,
	ContactTitle nvarchar(30) NULL,
	Address nvarchar(60) NULL,
	City nvarchar(15) NULL,
	Region nvarchar(15) NULL,
	PostalCode nvarchar(10) NULL,
	Country nvarchar(15) NULL,
	Phone nvarchar(24) NULL,
	Fax nvarchar(24) NULL
);




CREATE TABLE  [dbo].[Shippers](
	ShipperID int PRIMARY KEY,
	CompanyName nvarchar(40) NOT NULL,
	Phone nvarchar(24) NULL,
);




CREATE TABLE  [dbo].[Products](
	ProductID int PRIMARY KEY,
	ProductName nvarchar(40) NOT NULL,
	SupplierID int NULL,
	CategoryID int NULL,
	QuantityPer nvarchar(20) NULL,
	UnitsInStock smallint NULL,
	UnitOnOrder smallint NULL,
	RecorderLevel smallint NULL,
	Discontinued bit NOT NULL,
	FOREIGN KEY(CategoryID) references Categories(CategoryID),
	FOREIGN KEY(SupplierID) references Suppliers(SupplierID)
);


CREATE TABLE  [dbo].[Orders](
	OrderID int PRIMARY KEY,
	CustomerID nchar(5) NULL,
	EmployeeID int NULL,
	OrderDate datetime NULL,
	RequiredDate datetime NULL,
	ShippedDate datetime NULL,
	ShipVia int NULL,
	Freight money NULL,
	ShipName nvarchar(40) NULL,
	ShipAddress nvarchar(60) NULL,
	ShipCity nvarchar(15) NULL,
	ShipRegion nvarchar(15) NULL,
	ShipPostalCode nvarchar(10) NULL,
	ShipCountry nvarchar(15) NULL,
	FOREIGN KEY(CustomerID) references Customers(CustomerID),
	FOREIGN KEY(EmployeeID) references Employees(EmployeeID),
	FOREIGN KEY(ShipVia) references Shippers(ShipperID)
);



CREATE TABLE  [dbo].[OrderDetails](
	OrderID int NOT NULL,
	ProductID int NOT NULL,
	UnitPrice money NOT NULL,
	Quantity smallint NOT NULL,
	Discoumt real NOT NULL,
	FOREIGN KEY(OrderID) references Orders(OrderID),
	FOREIGN KEY(ProductID) references Products(ProductID),
	PRIMARY KEY(OrderID,ProductID)
);
