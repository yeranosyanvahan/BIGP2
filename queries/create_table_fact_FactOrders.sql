CREATE TABLE {db}.{schema}.FactOrders(
    OrderID_PK_SK int PRIMARY KEY IDENTITY(1,1),
    OrderID_NK int,
	OrderDate datetime NULL,
	RequiredDate datetime NULL,
	ShippedDate datetime NULL,
	Freight money NULL,
	ShipName varchar(40) NULL,
	ShipAddress varchar(60) NULL,
	ShipCity varchar(15) NULL,
	ShipRegion varchar(15) NULL,
	ShipPostalCode varchar(10) NULL,
	ShipCountry varchar(15) NULL,
	UnitPrice money NOT NULL,
	Quantity smallint NOT NULL,
	Discount real NOT NULL,

	ShipVia_FK int NULL,
	CustomerID_FK int NULL,
	EmployeeID_FK int NULL,
	ProductID_FK int NOT NULL,
--	TerritoryID_FK int NULL,
--	FOREIGN KEY(TerritoryID) references Territories(TerritoryID)    
	FOREIGN KEY(ProductID_FK) references DimProducts_SCD1(ProductID_PK_SK),
	FOREIGN KEY(CustomerID_FK) references DimCustomers_SCD2(CustomerID_PK_SK),
	FOREIGN KEY(EmployeeID_FK) references DimEmployees_SCD1(EmployeeID_PK_SK),
	FOREIGN KEY(ShipVia_FK) references DimShippers_SCD1(ShipperID_PK_SK)

);