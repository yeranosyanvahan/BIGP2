DROP TABLE IF EXISTS {db}.{schema}.DimRegion_SCD4_History;
CREATE TABLE {db}.{schema}.DimRegion_SCD4_History(
    Region_Key int PRIMARY KEY,
    Description varchar(20) NOT NULL,
    Valid_From int NULL,
    Valid_To int NULL
)

CREATE TABLE {db}.{schema}.DimRegion_SCD4(
	RegionID_PK_SK int PRIMARY KEY IDENTITY(1,1),
	RegionID_NK int,
	Region_Key int NOT NULL,
    FOREIGN KEY(Region_Key) references DimRegion_SCD4_History(Region_Key)
);
