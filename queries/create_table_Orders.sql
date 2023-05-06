USE Orders_RELATIONAL_DB;
GO

DROP TABLE IF EXISTS [dbo].[Orders]
GO

CREATE TABLE [dbo].[Orders](
	OrderID int PRIMARY KEY,
	CustomerID char(5) NULL,
	EmployeeID int NULL,
	OrderDate datetime NULL,
	RequiredDate datetime NULL,
	ShippedDate datetime NULL,
	ShipVia int NULL,
	Freight money NULL,
	ShipName varchar(40) NULL,
	ShipAddress varchar(60) NULL,
	ShipCity varchar(15) NULL,
	ShipRegion varchar(15) NULL,
	ShipPostalCode varchar(10) NULL,
	ShipCountry varchar(15) NULL,
	TerritoryID int NULL,
	FOREIGN KEY(CustomerID) references Customers(CustomerID),
	FOREIGN KEY(EmployeeID) references Employees(EmployeeID),
	FOREIGN KEY(ShipVia) references Shippers(ShipperID),
	FOREIGN KEY(TerritoryID) references Territories(TerritoryID)
);