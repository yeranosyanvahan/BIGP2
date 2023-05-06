
CREATE TABLE {db}.{schema}.{table}(
	TerritoryID nvarchar(20) PRIMARY KEY,
	TerritoryDescription nchar(50) NOT NULL,
	RegionID int  NOT NULL,
	FOREIGN KEY(RegionID) references Region(RegionID)
);