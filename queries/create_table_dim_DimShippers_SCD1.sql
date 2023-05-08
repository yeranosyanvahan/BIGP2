CREATE TABLE {db}.{schema}.Shippers(
	ShipperID_PK_SK int PRIMARY KEY IDENTITY(1,1),
	ShipperID_NK int,
	CompanyName varchar(40) NOT NULL,
	Phone varchar(24) NULL,
);
