CREATE TABLE {db}.{schema}.Territories(
	TerritoryID int PRIMARY KEY,
	TerritoryDescription varchar(30) NOT NULL,
	RegionID int  NOT NULL,
	FOREIGN KEY(RegionID) references Region(RegionID)
);