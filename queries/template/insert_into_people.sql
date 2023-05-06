--- parametrized SQL Scripts
INSERT INTO {db}.{schema}.people
    ([BusinessEntityID],[FirstName],[LastName])
    values (?, ?, ?);