CREATE TABLE {db}.{schema}.DimCategories_SCD1(
	CategoryID_PK_SK INT PRIMARY KEY IDENTITY(1, 1),
	CategoryID_NK int,
	CategoryName nvarchar(15) NOT NULL,
	Description varchar(500) NULL,
);
