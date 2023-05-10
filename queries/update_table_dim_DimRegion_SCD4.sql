DECLARE @Yesterday INT;
DECLARE @Today INT;
SET @Yesterday = CONVERT(INT, CONVERT(VARCHAR(8), DATEADD(DAY, -1, CAST(GETDATE() AS DATE)), 112));
SET @Today = CONVERT(INT, CONVERT(VARCHAR(8), GETDATE(), 112));

-- MERGE Orders_DIMENSIONAL_DW.dbo.DimRegion_SCD4 AS DST -- destination
-- USING Orders_RELATIONAL_DB.dbo.Region AS SRC -- source
-- ON (SRC.RegionID = DST.RegionID_NK)
-- WHEN NOT MATCHED THEN -- there are IDs in the source table that are not in the destination table
--   INSERT (RegionID, Region_Key) -- There is no Valid_From and Valid_To in SCD4
--   VALUES (SRC.RegionID, @Today)
-- WHEN MATCHED AND (
--   ISNULL(DST.Region_Key, 0) <> @Today)
-- THEN 
--   UPDATE SET  
--     DST.Region_Key = @Today;