INSERT INTO Orders_DIMENSIONAL_DW.dbo.FactOrders 
(OrderID_NK, OrderDate, RequiredDate, ShippedDate, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry, UnitPrice, Quantity, Discount, ShipVia_FK, CustomerID_FK, EmployeeID_FK, ProductID_FK) 
SELECT 
	o.OrderId as OrderID_NK,
	o.OrderDate,
	o.RequiredDate,
	o.ShippedDate,
	o.Freight,
	o.ShipName,
	o.ShipAddress,
	o.ShipCity,
	o.ShipRegion,
	o.ShipPostalCode,
	o.ShipCountry,
	od.UnitPrice,
	od.Quantity,
	od.Discount,
	o.ShipVia,
	c.CustomerID_PK_SK as CustomerID_FK,
	e.EmployeeID_PK_SK as EmployeeID_FK,
	p.ProductID_PK_SK as ProductID_FK
FROM 
	Orders_RELATIONAL_DB.dbo.OrderDetails as od 
	JOIN Orders_RELATIONAL_DB.dbo.Orders as o ON od.OrderID = o.OrderId 
	JOIN Orders_DIMENSIONAL_DW.dbo.DimProducts_SCD1 as p on p.ProductId_NK = od.ProductId
	JOIN Orders_DIMENSIONAL_DW.dbo.DimCustomers_SCD2 as c on c.CustomerID_NK = o.CustomerID
	JOIN Orders_DIMENSIONAL_DW.dbo.DimEmployees_SCD1 as e on e.EmployeeID_NK = o.EmployeeID
	JOIN Orders_DIMENSIONAL_DW.dbo.DimShippers_SCD1 as s on s.ShipperID_NK = o.ShipVia;
