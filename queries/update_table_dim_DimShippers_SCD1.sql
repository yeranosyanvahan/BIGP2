MERGE {db_dim}.{schema_dim}.{table_dim} AS DST -- destination
USING {db_rel}.{schema_rel}.{table_rel} AS SRC -- source
ON ( SRC.ShipperID = DST.ShipperID_NK )
WHEN NOT MATCHED THEN -- there are IDs in the source table that are not in the destination table
  INSERT (ShipperID_NK, CompanyName, Phone)
  VALUES (SRC.ShipperID, SRC.CompanyName, SRC.Phone)
WHEN MATCHED AND (
  ISNULL(DST.ShipperID_NK, '') <> Isnull(SRC.ShipperID, '') OR
  ISNULL(DST.CompanyName, '') <> Isnull(SRC.CompanyName, '') OR
  ISNULL(DST.Phone, '') <> Isnull(SRC.Phone, ''))
  THEN
    UPDATE SET
        DST.ShipperID_NK = SRC.ShipperID,
        DST.CompanyName = SRC.CompanyName,
        DST.Phone = SRC.Phone;