CREATE TABLE {db}.{schema}.DimCustomers(
	CustomerID_PK_SK INT PRIMARY KEY IDENTITY(1, 1),
	CustomerID_NK char(5) PRIMARY KEY,
	CompanyName varchar(40) NOT NULL,
	ContactName varchar(30) NULL,
	ContactTitle varchar(30) NULL,
	Address varchar(60) NULL,
	City varchar(15) NULL,
	Region varchar(15) NULL,
	PostalCode varchar(10) NULL,
	Country varchar(15) NULL,
	Phone varchar(24) NULL,
	Fax varchar(24) NULL
);