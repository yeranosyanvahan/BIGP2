USE Orders_RELATIONAL_DB;
GO

DROP TABLE IF EXISTS [dbo].[Region]
GO

CREATE TABLE [dbo].[Region](
	RegionID int PRIMARY KEY,
	RegionDescription nchar(50) NOT NULL 
);