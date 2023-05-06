USE Orders_RELATIONAL_DB;
GO

DROP TABLE IF EXISTS [dbo].[Territories]
GO

CREATE TABLE [dbo].[Territories](
	TerritoryID int PRIMARY KEY,
	TerritoryDescription varchar(30) NOT NULL,
	RegionID int  NOT NULL,
	FOREIGN KEY(RegionID) references Region(RegionID)
);