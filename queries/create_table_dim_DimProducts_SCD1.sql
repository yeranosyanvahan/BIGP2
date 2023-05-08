CREATE TABLE {db}.{schema}.Products(
	ProductID_PK_SK int PRIMARY KEY IDENTITY(1,1),
	ProductID_NK int,
	ProductName varchar(40) NOT NULL,
	SupplierID int NULL,
	CategoryID int NULL,
	QuantityPerUnit varchar(20) NULL,
	UnitPrice real NULL,
	UnitsInStock smallint NULL,
	UnitsOnOrder smallint NULL,
	ReorderLevel smallint NULL,
	Discontinued bit NOT NULL,
	FOREIGN KEY(CategoryID) references Categories(CategoryID),
	FOREIGN KEY(SupplierID) references Suppliers(SupplierID)
);