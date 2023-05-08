CREATE TABLE {db}.{schema}.Suppliers(
	SupplierID int PRIMARY KEY,
	CompanyName varchar(100) NOT NULL,
	ContactName varchar(40) NULL,
	ContactTitle varchar(30) NULL,
	Address varchar(60) NULL,
	City varchar(20) NULL,
	Region varchar(15) NULL,
	PostalCode varchar(10) NULL,
	Country varchar(15) NULL,
	Phone varchar(24) NULL,
	Fax varchar(24) NULL,
	HomePage varchar(500) NULL
);