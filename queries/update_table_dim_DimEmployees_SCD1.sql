MERGE {db_dim}.{schema_dim}.{table_dim} AS DST -- destination
USING {db_rel}.{schema_rel}.{table_rel} AS SRC -- source
ON ( SRC.EmployeeID = DST.EmployeeID_NK )
WHEN NOT MATCHED THEN -- there are IDs in the source table that are not in the destination table
  INSERT (EmployeeID_NK, LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone, Extension, Photo, Notes, ReportsTo, PhotoPath)
  VALUES (SRC.EmployeeID, SRC.LastName, SRC.FirstName, SRC.Title, SRC.TitleOfCourtesy, SRC.BirthDate, SRC.HireDate, SRC.Address, SRC.City, SRC.Region, SRC.PostalCode, SRC.Country, SRC.HomePhone, SRC.Extension, SRC.Photo, SRC.Notes, SRC.ReportsTo, SRC.PhotoPath)
WHEN MATCHED AND (
  ISNULL(DST.LastName, '') <> Isnull(SRC.LastName, '')
  THEN
    UPDATE SET
        DST.LastName = SRC.LastName;