CREATE TABLE {db}.{schema}.DimTerritories_SCD4(
	TerritoryID int PRIMARY KEY,
	Territory_Key int NOT NULL,
	RegionID int  NOT NULL,
	FOREIGN KEY(RegionID) references Region(RegionID)
);

CREATE TABLE {db}.{schema}.DimTerritories_SCD4_History(
    Territory_Key int PRIMARY KEY,
    TerritoryDescription varchar(30) NOT NULL,
    Valid_From int NULL,
    Valid_To int NULL,
    FOREIGN KEY(Territory_Key) references DimTerritories_SCD4(Territory_Key)
)