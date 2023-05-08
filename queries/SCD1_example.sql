MERGE (SELECT p.*, c.CategoryID_PK_SK as CategoryID , s.SupplierID_PK_SK as SupplierID FROM Orders_RELATIONAL_DB.dbo.Products as p 
LEFT JOIN Orders_DIMENSIONAL_DW.dbo.DimCategory_SCD1 as c
LEFT JOIN Orders_DIMENSIONAL_DW.dbo.DimSupplier_SCD3 as s) as SRC -- source
USING Orders_DIMENSIONAL_DB.dbo.Products_SCD1 AS DST -- source
ON ( SRC.ProductID = DST.ProductID_NK )
WHEN NOT MATCHED THEN -- there are IDs in the source table that are not in the destination table
  INSERT (ProductID_NK, ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
  VALUES (SRC.ProductID, SRC.ProductName, SRC.SupplierID, SRC.CategoryID, SRC.QuantityPerUnit, SRC.UnitPrice, SRC.UnitsInStock, SRC.UnitsOnOrder, SRC.ReorderLevel, SRC.Discontinued)
WHEN MATCHED AND (
  ISNULL(DST.ProductID_NK, '') <> Isnull(SRC.ProductID, ''),
  ISNULL(DST.ProductName, '') <> Isnull(SRC.ProductName, ''),
  ISNULL(DST.SupplierID, '') <> Isnull(SRC.SupplierID, ''),
  ISNULL(DST.CategoryID, '') <> Isnull(SRC.CategoryID, ''),
  ISNULL(DST.QuantityPerUnit, '') <> Isnull(SRC.QuantityPerUnit, ''),
  ISNULL(DST.UnitPrice, '') <> Isnull(SRC.UnitPrice, ''),
  ISNULL(DST.UnitsInStock, '') <> Isnull(SRC.UnitsInStock, ''),
  ISNULL(DST.UnitsOnOrder, '') <> Isnull(SRC.UnitsOnOrder, ''),
  ISNULL(DST.ReorderLevel, '') <> Isnull(SRC.ReorderLevel, ''),
  ISNULL(DST.Discontinued, '') <> Isnull(SRC.Discontinued, '')))
  THEN
    UPDATE SET
        DST.ProductID_NK = SRC.ProductID,
        DST.ProductName = SRC.ProductName,
        DST.SupplierID = SRC.SupplierID,
        DST.CategoryID = SRC.CategoryID,
        DST.QuantityPerUnit = SRC.QuantityPerUnit,
        DST.UnitPrice = SRC.UnitPrice,
        DST.UnitsInStock = SRC.UnitsInStock,
        DST.UnitsOnOrder = SRC.UnitsOnOrder,
        DST.ReorderLevel = SRC.ReorderLevel,
        DST.Discontinued = SRC.Discontinued;