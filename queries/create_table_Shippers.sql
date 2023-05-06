USE Orders_RELATIONAL_DB;
GO

DROP TABLE IF EXISTS [dbo].[Shippers]
GO

CREATE TABLE [dbo].[Shippers](
	ShipperID int PRIMARY KEY,
	CompanyName nvarchar(40) NOT NULL,
	Phone nvarchar(24) NULL,
);
