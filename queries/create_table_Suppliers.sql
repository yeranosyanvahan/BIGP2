USE Orders_RELATIONAL_DB;
GO

DROP TABLE IF EXISTS [dbo].[Suppliers]
GO

CREATE TABLE [dbo].[Suppliers](
	SupplierID int PRIMARY KEY,
	CompanyName nvarchar(40) NOT NULL,
	ContactName nvarchar(30) NULL,
	ContactTitle nvarchar(30) NULL,
	Address nvarchar(60) NULL,
	City nvarchar(15) NULL,
	Region nvarchar(15) NULL,
	PostalCode nvarchar(10) NULL,
	Country nvarchar(15) NULL,
	Phone nvarchar(24) NULL,
	Fax nvarchar(24) NULL,
	HomePage varchar(MAX) NULL
);