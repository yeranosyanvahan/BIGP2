USE Orders_RELATIONAL_DB;
GO

DROP TABLE IF EXISTS [dbo].[OrderDetails]
GO

CREATE TABLE [dbo].[OrderDetails](
	OrderID int NOT NULL,
	ProductID int NOT NULL,
	UnitPrice money NOT NULL,
	Quantity smallint NOT NULL,
	Discoumt real NOT NULL,
	FOREIGN KEY(OrderID) references Orders(OrderID),
	FOREIGN KEY(ProductID) references Products(ProductID),
	PRIMARY KEY(OrderID,ProductID)
);