MERGE Orders_DIMENSIONAL_DW.dbo.DimProducts_SCD1 AS DST  -- source
USING (SELECT p.*, c.CategoryID_PK_SK as CategoryID_FK_SK , s.SupplierID_PK_SK as SupplierID_FK_SK FROM Orders_RELATIONAL_DB.dbo.Products as p 
LEFT JOIN Orders_DIMENSIONAL_DW.dbo.DimCategories_SCD1 as c ON c.CategoryId_NK = p.CategoryID
LEFT JOIN Orders_DIMENSIONAL_DW.dbo.DimSuppliers_SCD3 as s ON s.SupplierID_NK = p.SupplierID) as SRC -- source
ON ( SRC.ProductID = DST.ProductID_NK )
WHEN NOT MATCHED THEN -- there are IDs in the source table that are not in the destination table
  INSERT (ProductID_NK, ProductName, SupplierID_FK_SK, CategoryID_FK_SK, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
  VALUES (SRC.ProductID, SRC.ProductName, SRC.SupplierID_FK_SK, SRC.CategoryID_FK_SK, SRC.QuantityPerUnit, SRC.UnitPrice, SRC.UnitsInStock, SRC.UnitsOnOrder, SRC.ReorderLevel, SRC.Discontinued)
WHEN MATCHED AND (
  ISNULL(DST.ProductID_NK, '') <> Isnull(SRC.ProductID, '') OR
  ISNULL(DST.ProductName, '') <> Isnull(SRC.ProductName, '') OR
  ISNULL(DST.SupplierID_FK_SK, '') <> Isnull(SRC.SupplierID_FK_SK, '') OR
  ISNULL(DST.CategoryID_FK_SK, '') <> Isnull(SRC.CategoryID_FK_SK, '') OR
  ISNULL(DST.QuantityPerUnit, '') <> Isnull(SRC.QuantityPerUnit, '') OR
  ISNULL(DST.UnitPrice, '') <> Isnull(SRC.UnitPrice, '') OR
  ISNULL(DST.UnitsInStock, '') <> Isnull(SRC.UnitsInStock, '') OR
  ISNULL(DST.UnitsOnOrder, '') <> Isnull(SRC.UnitsOnOrder, '') OR
  ISNULL(DST.ReorderLevel, '') <> Isnull(SRC.ReorderLevel, '') OR
  ISNULL(DST.Discontinued, '') <> Isnull(SRC.Discontinued, ''))
  THEN
    UPDATE SET
        DST.ProductID_NK = SRC.ProductID,
        DST.ProductName = SRC.ProductName,
        DST.SupplierID_FK_SK = SRC.SupplierID_FK_SK,
        DST.CategoryID_FK_SK = SRC.CategoryID_FK_SK,
        DST.QuantityPerUnit = SRC.QuantityPerUnit,
        DST.UnitPrice = SRC.UnitPrice,
        DST.UnitsInStock = SRC.UnitsInStock,
        DST.UnitsOnOrder = SRC.UnitsOnOrder,
        DST.ReorderLevel = SRC.ReorderLevel,
        DST.Discontinued = SRC.Discontinued;