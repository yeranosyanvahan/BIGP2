MERGE Orders_DIMENSIONAL_DW.dbo.DimEmployees_SCD1 AS DST
USING (SELECT m.*, r.EmployeeID_PK_SK as DimReportsTo FROM Orders_RELATIONAL_DB.dbo.Employees as m
left join Orders_DIMENSIONAL_DW.dbo.DimEmployees_SCD1 as r
ON r.EmployeeID_NK = m.ReportsTo) as SRC
ON ( SRC.EmployeeID = DST.EmployeeID_NK )
WHEN NOT MATCHED THEN 
  INSERT (EmployeeID_NK, LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone, Extension,  Notes, PhotoPath, ReportsTo)
  VALUES (SRC.EmployeeID, SRC.LastName, SRC.FirstName, SRC.Title, SRC.TitleOfCourtesy, SRC.BirthDate, SRC.HireDate, SRC.Address, SRC.City, SRC.Region, SRC.PostalCode, SRC.Country, SRC.HomePhone, SRC.Extension, SRC.Notes, SRC.PhotoPath, SRC.DimReportsTo)
WHEN MATCHED AND (
  ISNULL(DST.ReportsTo, '') <> ISNULL(SRC.DimReportsTo, '') OR
  ISNULL(DST.LastName, '') <> ISNULL(SRC.LastName, '') OR
  ISNULL(DST.FirstName, '') <> ISNULL(SRC.FirstName, '') OR
  ISNULL(DST.Title, '') <> ISNULL(SRC.Title, '') OR
  ISNULL(DST.BirthDate, '') <> ISNULL(SRC.BirthDate, '') OR
  ISNULL(DST.HireDate, '') <> ISNULL(SRC.HireDate, '') OR
  ISNULL(DST.Address, '') <> ISNULL(SRC.Address, '') OR
  ISNULL(DST.City, '') <> ISNULL(SRC.City, '') OR
  ISNULL(DST.Region, '') <> ISNULL(SRC.Region, '') OR
  ISNULL(DST.PostalCode, '') <> ISNULL(SRC.PostalCode, '') OR
  ISNULL(DST.Country, '') <> ISNULL(SRC.Country, '') OR
  ISNULL(DST.HomePhone, '') <> ISNULL(SRC.HomePhone, '') OR
  ISNULL(DST.Extension, '') <> ISNULL(SRC.Extension, '') OR
  ISNULL(DST.Notes, '') <> ISNULL(SRC.Notes, '') OR
  ISNULL(DST.PhotoPath, '') <> ISNULL(SRC.PhotoPath, '') OR
  ISNULL(DST.TitleOfCourtesy, '') <> ISNULL(SRC.TitleOfCourtesy, ''))
  THEN
    UPDATE SET
        DST.LastName  = SRC.LastName ,
        DST.FirstName  = SRC.FirstName ,
        DST.Title  = SRC.Title ,
        DST.BirthDate  = SRC.BirthDate ,
        DST.HireDate  = SRC.HireDate ,
        DST.Address  = SRC.Address ,
        DST.City  = SRC.City ,
        DST.Region  = SRC.Region ,
        DST.PostalCode  = SRC.PostalCode ,
        DST.Country  = SRC.Country ,
        DST.HomePhone  = SRC.HomePhone ,
        DST.Extension  = SRC.Extension ,
        DST.Notes  = SRC.Notes ,
        DST.PhotoPath  = SRC.PhotoPath,
        DST.TitleOfCourtesy = SRC.TitleOfCourtesy,
        DST.ReportsTo = SRC.DimReportsTo;

MERGE Orders_DIMENSIONAL_DW.dbo.DimEmployees_SCD1 AS DST
USING (SELECT m.*, r.EmployeeID_PK_SK as DimReportsTo FROM Orders_RELATIONAL_DB.dbo.Employees as m
left join Orders_DIMENSIONAL_DW.dbo.DimEmployees_SCD1 as r
ON r.EmployeeID_NK = m.ReportsTo) as SRC
ON ( SRC.EmployeeID = DST.EmployeeID_NK )
WHEN NOT MATCHED THEN 
  INSERT (EmployeeID_NK, LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone, Extension,  Notes, PhotoPath, ReportsTo)
  VALUES (SRC.EmployeeID, SRC.LastName, SRC.FirstName, SRC.Title, SRC.TitleOfCourtesy, SRC.BirthDate, SRC.HireDate, SRC.Address, SRC.City, SRC.Region, SRC.PostalCode, SRC.Country, SRC.HomePhone, SRC.Extension, SRC.Notes, SRC.PhotoPath, SRC.DimReportsTo)
WHEN MATCHED AND (
  ISNULL(DST.ReportsTo, '') <> ISNULL(SRC.DimReportsTo, '') OR
  ISNULL(DST.LastName, '') <> ISNULL(SRC.LastName, '') OR
  ISNULL(DST.FirstName, '') <> ISNULL(SRC.FirstName, '') OR
  ISNULL(DST.Title, '') <> ISNULL(SRC.Title, '') OR
  ISNULL(DST.BirthDate, '') <> ISNULL(SRC.BirthDate, '') OR
  ISNULL(DST.HireDate, '') <> ISNULL(SRC.HireDate, '') OR
  ISNULL(DST.Address, '') <> ISNULL(SRC.Address, '') OR
  ISNULL(DST.City, '') <> ISNULL(SRC.City, '') OR
  ISNULL(DST.Region, '') <> ISNULL(SRC.Region, '') OR
  ISNULL(DST.PostalCode, '') <> ISNULL(SRC.PostalCode, '') OR
  ISNULL(DST.Country, '') <> ISNULL(SRC.Country, '') OR
  ISNULL(DST.HomePhone, '') <> ISNULL(SRC.HomePhone, '') OR
  ISNULL(DST.Extension, '') <> ISNULL(SRC.Extension, '') OR
  ISNULL(DST.Notes, '') <> ISNULL(SRC.Notes, '') OR
  ISNULL(DST.PhotoPath, '') <> ISNULL(SRC.PhotoPath, '') OR
  ISNULL(DST.TitleOfCourtesy, '') <> ISNULL(SRC.TitleOfCourtesy, ''))
  THEN
    UPDATE SET
        DST.LastName  = SRC.LastName ,
        DST.FirstName  = SRC.FirstName ,
        DST.Title  = SRC.Title ,
        DST.BirthDate  = SRC.BirthDate ,
        DST.HireDate  = SRC.HireDate ,
        DST.Address  = SRC.Address ,
        DST.City  = SRC.City ,
        DST.Region  = SRC.Region ,
        DST.PostalCode  = SRC.PostalCode ,
        DST.Country  = SRC.Country ,
        DST.HomePhone  = SRC.HomePhone ,
        DST.Extension  = SRC.Extension ,
        DST.Notes  = SRC.Notes ,
        DST.PhotoPath  = SRC.PhotoPath,
        DST.TitleOfCourtesy = SRC.TitleOfCourtesy,
        DST.ReportsTo = SRC.DimReportsTo;