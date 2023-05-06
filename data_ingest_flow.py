# Import the necessary modules

import tasks

if __name__ == '__main__':
    conn_ER = tasks.connect_db_create_cursor("Database1")
    tasks.drop_table(conn_ER, 'people', 'Orders_ER', 'dbo')
    tasks.create_table(conn_ER, 'people', 'Orders_ER', 'dbo')
    tasks.insert_into_table(conn_ER, 'people', 'Orders_ER', 'dbo', 'excel_test.csv')

    conn_Dim = tasks.connect_db_create_cursor("Database2")
    tasks.drop_table(conn_Dim, 'dim_people_scd1', 'Orders_DW', 'dbo')
    tasks.create_table(conn_Dim, 'dim_people_scd1', 'Orders_DW', 'dbo')
    tasks.update_dim_table(conn_Dim, 'dim_people_scd1', 'Orders_DW', 'dbo',
                           'people', 'Orders_ER', 'dbo')

    conn_ER.close()
    conn_Dim.close()


