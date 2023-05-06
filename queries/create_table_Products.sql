USE Orders_RELATIONAL_DB;
GO

DROP TABLE IF EXISTS [dbo].[Products]
GO

CREATE TABLE [dbo].[Products](
	ProductID int PRIMARY KEY,
	ProductName varchar(40) NOT NULL,
	SupplierID int NULL,
	CategoryID int NULL,
	QuantityPerUnit varchar(20) NULL,
	UnitPrice real NULL,
	UnitsInStock smallint NULL,
	UnitOnOrder smallint NULL,
	ReorderLevel smallint NULL,
	Discontinued bit NOT NULL,
	FOREIGN KEY(CategoryID) references Categories(CategoryID),
	FOREIGN KEY(SupplierID) references Suppliers(SupplierID)
);