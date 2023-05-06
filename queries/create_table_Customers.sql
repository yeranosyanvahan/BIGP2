USE Orders_RELATIONAL_DB;
GO

DROP TABLE IF EXISTS [dbo].[Customers]
GO

CREATE TABLE [dbo].[Customers](
	CustomerID char(5) PRIMARY KEY,
	CompanyName varchar(40) NOT NULL,
	ContactName varchar(30) NULL,
	ContactTitle varchar(30) NULL,
	'Address' varchar(60) NULL,
	City varchar(15) NULL,
	Region varchar(15) NULL,
	PostalCode varchar(10) NULL,
	Country varchar(15) NULL,
	Phone varchar(24) NULL,
	Fax varchar(24) NULL
);