MERGE {db_dim}.{schema_dim}.{table_dim} AS DST -- destination
USING {db_rel}.{schema_rel}.{table_rel} AS SRC -- source
ON ( SRC.SupplierID = DST.SupplierID_NK )
WHEN NOT MATCHED THEN -- there are IDs in the source table that are not in the destination table
  INSERT (SupplierID, CompanyName,ContactName,ContactTitle,Address,City,Region,PostalCode,Country,Phone,Fax,HomePage) --There is no ValidTo
  VALUES (SRC.SupplierID, SRC.CompanyName,SRC.ContactName,SRC.ContactTitle,SRC.Address,SRC.City,SRC.Region,SRC.PostalCode,SRC.Country,Phone,Fax,HomePage)
WHEN MATCHED AND (
  ISNULL(DST.CompanyName, '') <> Isnull(SRC.CompanyName, ''),
  ISNULL(DST.ContactName, '') <> Isnull(SRC.ContactName, ''),
  ISNULL(DST.ContactTitle, '') <> Isnull(SRC.ContactTitle, ''),
  ISNULL(DST.Address, '') <> Isnull(SRC.Address, ''),
  ISNULL(DST.City, '') <> Isnull(SRC.City, ''),
  ISNULL(DST.Region, '') <> Isnull(SRC.Region, ''),
  ISNULL(DST.PostalCode, '') <> Isnull(SRC.PostalCode, ''),
  ISNULL(DST.Country, '') <> Isnull(SRC.Country, ''),
  ISNULL(DST.Phone, '') <> Isnull(SRC.Phone, ''),
  ISNULL(DST.Fax, '') <> Isnull(SRC.Fax, ''),
  ISNULL(DST.HomePage, '') <> Isnull(SRC.HomePage, ''),
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
          DST.Phone_Prev_ValidTo = (CASE WHEN DST.Phone <> SRC.Phone THEN @Yesterday ELSE DST.Phone_Prev_ValidTo END),
          DST.Phone = SRC.Phone
