-- Insert new records into DimTerritories_SCD4_History table
INSERT INTO {db}.{schema}.DimTerritories_SCD4_History
    (Territory_Key, TerritoryDescription, Valid_From, Valid_To)
SELECT
    NEWID(), -- generate a new unique key for the new history record
    T.TerritoryDescription,
    CONVERT(int, FORMAT(GETDATE(), 'yyyyMMdd')), -- set the valid from date to today
    NULL -- set the valid to date to null since this is the latest record
FROM
    {db}.{schema}.Territories AS T
    LEFT JOIN {db}.{schema}.DimTerritories_SCD4 AS D ON T.TerritoryID = D.TerritoryID
WHERE
    D.TerritoryID IS NULL -- only insert new records that don't exist in the dimensional table yet

-- Update the foreign key in DimTerritories_SCD4 to point to the new history record
UPDATE
    D
SET
    Territory_Key = H.Territory_Key,
    RegionID = T.RegionID
FROM
    {db}.{schema}.DimTerritories_SCD4 AS D
    INNER JOIN {db}.{schema}.Territories AS T ON D.TerritoryID = T.TerritoryID
    INNER JOIN {db}.{schema}.DimTerritories_SCD4_History AS H ON H.TerritoryDescription = T.TerritoryDescription
WHERE
    H.Valid_To IS NULL -- only update records that are the latest in the history table
