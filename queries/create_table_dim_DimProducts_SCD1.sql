CREATE TABLE {db}.{schema}.DimProducts_SCD1(
	ProductID_PK_SK int PRIMARY KEY IDENTITY(1,1),
	ProductID_NK int,
	ProductName varchar(40) NOT NULL,
	SupplierID_FK_SK int NULL,
	CategoryID_FK_SK int NULL,
	QuantityPerUnit varchar(20) NULL,
	UnitPrice real NULL,
	UnitsInStock smallint NULL,
	UnitsOnOrder smallint NULL,
	ReorderLevel smallint NULL,
	Discontinued bit NOT NULL,
	FOREIGN KEY(CategoryID_FK_SK) references DimCategories_SCD1(CategoryID_PK_SK),
	FOREIGN KEY(SupplierID_FK_SK) references DimSuppliers_SCD3(SupplierID_PK_SK)
);