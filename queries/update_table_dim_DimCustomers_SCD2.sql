DECLARE @Yesterday INT;
DECLARE @Today INT;
SET @Yesterday = CONVERT(INT, CONVERT(VARCHAR(8), DATEADD(DAY, -1, CAST(GETDATE() AS DATE)), 112));
SET @Today = CONVERT(INT, CONVERT(VARCHAR(8), GETDATE(), 112));

INSERT INTO Orders_DIMENSIONAL_DW.dbo.DimCustomers_SCD2
(CustomerID_NK, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax, ValidFrom, IsCurrent)
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax, @Today, 1 FROM(
	MERGE Orders_DIMENSIONAL_DW.dbo.DimCustomers_SCD2 AS DST -- destination
	USING Orders_RELATIONAL_DB.dbo.Customers AS SRC -- source
	ON ( SRC.CustomerID = DST.CustomerID_NK )
	WHEN NOT MATCHED THEN -- there are IDs in the source table that are not in the destination table
	  INSERT (CustomerID_NK, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax, ValidFrom, IsCurrent)
	  VALUES (SRC.CustomerID, SRC.CompanyName, SRC.ContactName, SRC.ContactTitle, SRC.Address, SRC.City, SRC.Region, SRC.PostalCode, SRC.Country, SRC.Phone, SRC.Fax, @Today, 1)
	WHEN MATCHED AND IsCurrent = 1  AND (
		ISNULL(DST.CompanyName, '') <> ISNULL(SRC.CompanyName, '')  OR  
		ISNULL(DST.ContactName, '') <> ISNULL(SRC.ContactName, '')  OR   
		ISNULL(DST.ContactTitle, '') <> ISNULL(SRC.ContactTitle, '')  OR   
		ISNULL(DST.Address, '') <> ISNULL(SRC.Address, '')  OR   
		ISNULL(DST.City, '') <> ISNULL(SRC.City, '')  OR   
		ISNULL(DST.Region, '') <> ISNULL(SRC.Region, '')  OR   
		ISNULL(DST.PostalCode, '') <> ISNULL(SRC.PostalCode, '')  OR   
		ISNULL(DST.Country, '') <> ISNULL(SRC.Country, '')  OR   
		ISNULL(DST.Phone, '') <> ISNULL(SRC.Phone, '')  OR   
		ISNULL(DST.Fax, '') <> ISNULL(SRC.Fax, ''))
	  THEN
		UPDATE SET
		   DST.IsCurrent = 0, 
		   DST.ValidTo = @Yesterday
		   OUTPUT SRC.CustomerID, SRC.CompanyName, SRC.ContactName, SRC.ContactTitle, SRC.Address, SRC.City, SRC.Region, SRC.PostalCode, SRC.Country, SRC.Phone, SRC.Fax, $Action AS MergeAction
) AS MRG WHERE MRG.MergeAction = 'UPDATE' ;
