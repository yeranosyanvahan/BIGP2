MERGE {db_dim}.{schema_dim}.{table_dim} AS DST -- destination
USING {db_rel}.{schema_rel}.{table_rel} AS SRC -- source
ON ( SRC.BusinessEntityID = DST.BusinessEntityID_NK )
WHEN NOT MATCHED THEN -- there are IDs in the source table that are not in the destination table
  INSERT (BusinessEntityID_NK, FirstName, LastName)
  VALUES (SRC.BusinessEntityID, SRC.FirstName, SRC.LastName)
WHEN MATCHED AND (
  ISNULL(DST.FirstName, '') <> Isnull(SRC.FirstName, '') OR
  ISNULL(DST.LastName, '') <> Isnull(SRC.LastName, ''))
  THEN
    UPDATE SET
        DST.FirstName = SRC.FirstName,
        DST.LastName = SRC.LastName;