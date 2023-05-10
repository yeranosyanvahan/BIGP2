CREATE TABLE {db}.{schema}.Categories(
	CategoryID int PRIMARY KEY,
	CategoryName nvarchar(15) NOT NULL,
	Description varchar(500) NULL
);


create database Orders_RELATIONAL_DB;
create database Orders_DIMENSIONAL_DW;
