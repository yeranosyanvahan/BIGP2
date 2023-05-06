## GET STARTED
To get started modify the config files in sampleconfig folder to your specific configuration parameters and put(and rename them) <br/>
```config.py.sample``` to ```/src/config.py``` path relative to the repository<br/>
```sql_server_config.cfg.sample``` to ```/sql_server_config.cfg``` path relative to the repository

### DS 206: GROUP PROJECT #2
#### PART 1. RELATIONAL DATABASE CREATION (40)
1. Create an empty script file named database_creation.sql. Add a DDL query to 
create an empty database named Orders_RELATIONAL_DB and run it (within
SQL Server). 
2. Store the database connection configurations in the sql_server_config.cfg file 
(feel free to name the config file differently).
3. Create parametrized SQL scripts named create_table_{}.sql for creating empty 
tables for each sheet in the raw_data_source.xlsx data file. 
4. Establish the primary and foreign key constraints based on Table 1 and Table 2
respectively.
5. Create parametrized SQL scripts named insert_into_{}.sql to ingest data into the 
empty tables from raw_data_source.xlsx. 
6. Write Python utilities (utils.py), tasks (tasks.py) and flow ({}_flow.py) to create 
a unified process for creating the tables for the relational database and ingesting 
data into them. Ensure the atomicity and the reproducibility of Your Python 
scripts.
7. IMPORTANT: Make sure to have informative logging in place. You may 
use formatted print() statements or the logging module of Python to achieve 
this