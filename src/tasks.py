import config
import os
import pandas as pd
import pyodbc
import utils



def connect_db_create_cursor(database_conf_name):
    # Call to read the configuration file
    db_conf = utils.get_sql_config(config.sql_server_config, database_conf_name)
    # Create a connection string for SQL Server
    db_conn_str = 'Driver={};Server={};Database={};Trusted_Connection={};'.format(*db_conf)
    # Connect to the server and to the desired database
    db_conn = pyodbc.connect(db_conn_str)
    # Create a Cursor class instance for executing T-SQL statements
    db_cursor = db_conn.cursor()
    return db_cursor


def load_query(query_name):
    for script in os.listdir(config.input_dir):
        if query_name in script:
            with open(config.input_dir + '\\' + script, 'r') as script_file:
                sql_script = script_file.read()
            break
    return sql_script

def drop_table(cursor, table_name, db, schema):
    drop_table_script = load_query('drop_table').format(db=db, schema=schema, table=table_name)
    cursor.execute(drop_table_script)
    cursor.commit()
    print("The {schema}.{table_name} table from the database {db} has been dropped".format(db=db, schema=schema,
                                                                                       table_name=table_name))

def create_table(cursor, table_name, db, schema):
    create_table_script = load_query('create_table_{}'.format(table_name)).format(db=db, schema=schema)
    cursor.execute(create_table_script)
    cursor.commit()
    print("The {schema}.{table_name} table from the database {db} has been created".format(db=db, schema=schema,
                                                                                           table_name=table_name))

def insert_into_table(cursor, table_name, db, schema, source_data):
    # Read the excel table
    df = pd.read_csv(source_data, header=0)

    insert_into_table_script = load_query('insert_into_{}'.format(table_name)).format(db=db, schema=schema)

    # Populate a table in sql server
    for index, row in df.iterrows():
        cursor.execute(insert_into_table_script, row['BusinessEntityID'], row['FirstName'], row['LastName'])
        cursor.commit()

    print(f"{len(df)} rows have been inserted into the {db}.{schema}.{table_name} table")

def update_dim_table(cursor, table_dst, db_dst, schema_dst, table_src, db_src, schema_src):

    update_table_script = load_query('update_table_{}'.format(table_dst)).format(
        db_dim=db_dst, schema_dim=schema_dst, table_dim=table_dst,
        db_rel=db_src, schema_rel=schema_src, table_rel=table_src)

    # Execute the query
    cursor.execute(update_table_script)
    cursor.commit()

    print(f"The dimension table {table_dst} has been updated.")