MERGE Orders_DIMENSIONAL_DW.dbo.DimShippers_SCD1 AS DST -- destination
USING Orders_RELATIONAL_DB.dbo.Shippers AS SRC -- source
ON (SRC.ShipperID = DST.ShipperID_NK)
WHEN NOT MATCHED THEN
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
