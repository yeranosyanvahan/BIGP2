MERGE Orders_DIMENSIONAL_DW.dbo.DimEmployee_SCD_1 AS DST -- destination
USING Orders_RELATIONAL_DB.dbo.Employees AS SRC -- source
ON ( SRC.EmployeeID = DST.EmployeeID_NK )

/*
MERGE Orders_DIMENSIONAL_DW.dbo.Employees AS DST
USING (
    SELECT
        e.*,
        d.EmployeeID_PK_SK AS EmployeeID
    FROM
        Orders_RELATIONAL_DB.dbo.Employees AS e
    LEFT JOIN
        Orders_DIMENSIONAL_DW.dbo.DimEmployees_SCD1 AS d
    ON
        e.EmployeeID = d.EmployeeID_NK
) SRC
ON (SRC.EmployeeID = DST.EmployeeID_NK)
*/

WHEN NOT MATCHED THEN
    INSERT (
        EmployeeID_NK, LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, Region,
        PostalCode, Country, HomePhone, Extension, Photo, Notes, ReportsTo, PhotoPath
    )
    VALUES (
        SRC.EmployeeID, SRC.LastName, SRC.FirstName, SRC.Title, SRC.TitleOfCourtesy, SRC.BirthDate, SRC.HireDate,
        SRC.Address, SRC.City, SRC.Region, SRC.PostalCode, SCR.Country, SRC.HomePhone, SRC.Extension, SRC.Photo,
        SRC.Notes, SRC.ReportsTo, SRC.PhotoPath
    )
WHEN MATCHED AND (
        ISNULL(DST.EmployeeID_NK, '') <> ISNULL(SRC.EmployeeID, '') OR
        ISNULL(DST.LastName, '') <> ISNULL(SRC.LastName, '') OR
        ISNULL(DST.FirstName, '') <> ISNULL(SRC.FirstName, '') OR
        ISNULL(DST.Title, '') <> ISNULL(SRC.Title, '') OR
        ISNULL(DST.TitleOfCourtesy, '') <> ISNULL(SRC.TitleOfCourtesy, '') OR
        ISNULL(DST.BirthDate, '') <> ISNULL(SRC.BirthDate, '') OR
        ISNULL(DST.HireDate, '') <> ISNULL(SRC.HireDate, '') OR
        ISNULL(DST.Address, '') <> ISNULL(SRC.Address, '') OR
        ISNULL(DST.City, '') <> ISNULL(SRC.City, '') OR
        ISNULL(DST.Region, '') <> ISNULL(SRC.Region, '') OR
        ISNULL(DST.PostalCode, '') <> ISNULL(SRC.PostalCode, '') OR
        ISNULL(DST.Country, '') <> ISNULL(SRC.Country, '') OR
        ISNULL(DST.HomePhone, '') <> ISNULL(SRC.HomePhone, '') OR
        ISNULL(DST.Extension, '') <> ISNULL(SRC.Extension, '') OR
        ISNULL(DST.Photo, '') <> ISNULL(SRC.Photo, '') OR
        ISNULL(DST.Notes, '') <> ISNULL(SRC.Notes, '') OR
        ISNULL(DST.ReportsTo, '') <> ISNULL(SRC.ReportsTo, '') OR
        ISNULL(DST.PhotoPath, '') <> ISNULL(SRC.PhotoPath, '')
    )
THEN
    UPDATE SET
        DST.EmployeeID_NK = SRC.EmployeeID,
        DST.LastName = SRC.LastName,
        DST.FirstName = SRC.FirstName,
        DST.Title = SRC.Title,
        DST.TitleOfCourtesy = SRC.TitleOfCourtesy,
        DST.BirthDate = SRC.BirthDate,
        DST.HireDate = SRC.HireDate,
        DST.Address = SRC.Address,
        DST.City = SRC.City,
        DST.Region = SRC.Region,
        DST.PostalCode = SRC.PostalCode,
        DST.Country = SRC.Country,
        DST.HomePhone = SRC.HomePhone,
		DST.Extension = SRC.Extension

WHEN NOT MATCHED BY SOURCE THEN
    DELETE;
