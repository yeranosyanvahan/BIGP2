MERGE {db_dim}.{schema_dim}.{table_dim} AS DST -- destination
USING {db_rel}.{schema_rel}.{table_rel} AS SRC -- source
ON ( SRC.CategoryID = DST.CategoryID_NK )
WHEN NOT MATCHED THEN -- there are IDs in the source table that are not in the destination table
  INSERT (BusinessEntityID_NK, FirstName, LastName)
  VALUES (SRC.BusinessEntityID, SRC.FirstName, SRC.LastName)
WHEN MATCHED AND (
  ISNULL(DST.CategoryName, '') <> Isnull(SRC.CategoryName, '')
  THEN
    UPDATE SET
        DST.CategoryName = SRC.CategoryName;
