CREATE TABLE {db}.{schema}.dim_people_scd1 (
    [BusinessEntityID_SK] INT PRIMARY KEY IDENTITY(1,1)
	,[BusinessEntityID_NK] INT
	,[FirstName] VARCHAR(50)
	,[LastName] VARCHAR(100));