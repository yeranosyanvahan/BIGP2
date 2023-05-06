USE Orders_RELATIONAL_DB;
GO

DROP TABLE IF EXISTS [dbo].[Territories]
GO

CREATE TABLE [dbo].[Territories](
	TerritoryID nvarchar(20) PRIMARY KEY,
	TerritoryDescription nchar(50) NOT NULL,
	RegionID int  NOT NULL,
	FOREIGN KEY(RegionID) references Region(RegionID)
);