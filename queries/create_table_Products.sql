CREATE TABLE {db}.{schema}.{table}(
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