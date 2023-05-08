CREATE TABLE {db}.{schema}.Orders(
	OrderID_PK_SK INT PRIMARY KEY IDENTITY(1, 1),
	OrderID_NK int,
	ProductID int NOT NULL,
	UnitPrice money NOT NULL,
	Quantity smallint NOT NULL,
	Discount real NOT NULL,	
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
	FOREIGN KEY(OrderID) references Orders(OrderID),
	FOREIGN KEY(ProductID) references Products(ProductID),
	PRIMARY KEY(OrderID,ProductID)	
);