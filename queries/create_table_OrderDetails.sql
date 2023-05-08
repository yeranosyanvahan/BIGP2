CREATE TABLE {db}.{schema}.OrderDetails(
	OrderID int NOT NULL,
	ProductID int NOT NULL,
	UnitPrice money NOT NULL,
	Quantity smallint NOT NULL,
	Discount real NOT NULL,
	FOREIGN KEY(OrderID) references Orders(OrderID),
	FOREIGN KEY(ProductID) references Products(ProductID),
	PRIMARY KEY(OrderID,ProductID)
);