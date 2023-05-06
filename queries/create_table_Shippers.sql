USE Orders_RELATIONAL_DB;
GO

DROP TABLE IF EXISTS [dbo].[Shippers]
GO

CREATE TABLE [dbo].[Shippers](
	ShipperID int PRIMARY KEY,
	CompanyName varchar(40) NOT NULL,
	Phone varchar(24) NULL,
);
