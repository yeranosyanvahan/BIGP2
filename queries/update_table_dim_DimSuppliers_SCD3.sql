DECLARE @Yesterday INT;
DECLARE @Today INT;
SET @Yesterday = CONVERT(INT, CONVERT(VARCHAR(8), DATEADD(DAY, -1, CAST(GETDATE() AS DATE)), 112));
SET @Today = CONVERT(INT, CONVERT(VARCHAR(8), GETDATE(), 112));

MERGE Orders_DIMENSIONAL_DW.dbo.DimSuppliers_SCD3 AS DST -- destination
USING Orders_RELATIONAL_DB.dbo.Suppliers AS SRC -- source
ON ( SRC.SupplierID = DST.SupplierID_NK )
WHEN NOT MATCHED THEN -- there are IDs in the source table that are not in the destination table
  INSERT (SupplierID_NK, CompanyName,ContactName,ContactTitle,Address,City,Region,PostalCode,Country,Phone,Fax,HomePage, Creation_Date) --There is no ValidTo
  VALUES (SRC.SupplierID, SRC.CompanyName,SRC.ContactName,SRC.ContactTitle,SRC.Address,SRC.City,SRC.Region,SRC.PostalCode,SRC.Country,Phone,Fax,HomePage, @Today)
WHEN MATCHED AND (
  ISNULL(DST.CompanyName, '') <> Isnull(SRC.CompanyName, '') AND
  ISNULL(DST.ContactName, '') <> Isnull(SRC.ContactName, '') AND
  ISNULL(DST.ContactTitle, '') <> Isnull(SRC.ContactTitle, '') AND
  ISNULL(DST.Address, '') <> Isnull(SRC.Address, '') AND
  ISNULL(DST.City, '') <> Isnull(SRC.City, '') AND
  ISNULL(DST.Region, '') <> Isnull(SRC.Region, '') AND
  ISNULL(DST.PostalCode, '') <> Isnull(SRC.PostalCode, '') AND
  ISNULL(DST.Country, '') <> Isnull(SRC.Country, '') AND
  ISNULL(DST.Phone, '') <> Isnull(SRC.Phone, '') AND
  ISNULL(DST.Fax, '') <> Isnull(SRC.Fax, '') AND
  ISNULL(DST.HomePage, '') <> Isnull(SRC.HomePage, ''))
  THEN 
    UPDATE SET  
      DST.CompanyName = SRC.CompanyName,
          DST.ContactName = SRC.ContactName,
          DST.Address = SRC.Address,
          DST.City = SRC.City,
          DST.Region = SRC.Region,
          DST.Country = SRC.Country,
          DST.Fax = SRC.Fax,
          DST.HomePage = SRC.HomePage,
          DST.Phone_Prev = (CASE WHEN DST.Phone <> SRC.Phone THEN DST.Phone ELSE DST.Phone_Prev END),
          DST.Change_Date = (CASE WHEN DST.Phone <> SRC.Phone THEN @Yesterday ELSE DST.Change_Date END),
          DST.Phone = SRC.Phone;