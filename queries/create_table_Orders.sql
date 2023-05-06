USE Orders_RELATIONAL_DB;
GO

DROP TABLE IF EXISTS [dbo].[Orders]
GO

CREATE TABLE [dbo].[Orders](
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