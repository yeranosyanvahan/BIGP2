USE Orders_RELATIONAL_DB;
GO

DROP TABLE IF EXISTS [dbo].[Categories]
GO

CREATE TABLE [dbo].[Categories](
	CategoryID int PRIMARY KEY,
	CategorName nvarchar(15) NOT NULL,
	'Description' varchar(500) NULL,
);
