import tasks

class FLOW:
    def __init__(self, config, sourcedatafile):
        self.config = config
        self.sourcedatafile = sourcedatafile

    @staticmethod
    def create_connection(argument):
        if argument == 'RELATIONAL':
            conn = tasks.connect_db_create_cursor("Orders_RELATIONAL_DB") 
        else:
            conn = tasks.connect_db_create_cursor("Orders_DIMENSIONAL_DW")
        return conn

    def drop_tables_dim(self, conn):
        pass

    def drop_tables_rel(self, conn):
        for tablename in self.config.relational_table_list[::-1]:
            tasks.drop_table(conn, tablename,'Orders_RELATIONAL_DB', 'dbo')           

    def create_tables_rel(self, conn):
        for tablename in self.config.relational_table_list:
            tasks.create_table(conn, tablename, 'Orders_RELATIONAL_DB', 'dbo')  

    def insert_into_table(self, conn):
        for tablename in self.config.relational_table_list:
            tasks.insert_into_table(conn, tablename,'Orders_RELATIONAL_DB', 'dbo', self.sourcedatafile)    

    def execute(self):
        conn_Rel = FLOW.create_connection("RELATIONAL") 
        self.drop_tables_rel(conn_Rel)
        self.create_tables_rel(conn_Rel)
        self.insert_into_table(conn_Rel)
        conn_Rel.close()

#         conn_Dim = FLOW.create_connection("DIMENTIONAL") 
#         self.drop_tables_dim(conn_Rel)
#         self.create_tables_dim(conn_Rel)
#         self.update_into_dim(conn_Rel)
#         self.insert_into_fact(conn_Rel)
#         conn_Dim.close()        

# if __name__ == '__main__':
#     conn_Rel = tasks.connect_db_create_cursor("Orders_RELATIONAL_DB") 
#     tasks.drop_table(conn_Rel,'Categories','Orders_RELATIONAL_DB', 'dbo')           
#     tasks.drop_table(conn_Rel,'Customers','Orders_RELATIONAL_DB', 'dbo')            
#     tasks.drop_table(conn_Rel,'Employees','Orders_RELATIONAL_DB', 'dbo')            
#     tasks.drop_table(conn_Rel,'Order_Details','Orders_RELATIONAL_DB', 'dbo')         
#     tasks.drop_table(conn_Rel,'Orders','Orders_RELATIONAL_DB', 'dbo')               
#     tasks.drop_table(conn_Rel,'Products','Orders_RELATIONAL_DB', 'dbo')             
#     tasks.drop_table(conn_Rel,'Region','Orders_RELATIONAL_DB', 'dbo')               
#     tasks.drop_table(conn_Rel,'Shippers','Orders_RELATIONAL_DB', 'dbo')             
#     tasks.drop_table(conn_Rel,'Suppliers','Orders_RELATIONAL_DB', 'dbo')            
#     tasks.drop_table(conn_Rel,'Territories','Orders_RELATIONAL_DB', 'dbo') 

#     tasks.create_table(conn_Rel,'Categories','Orders_RELATIONAL_DB', 'dbo')           
#     tasks.create_table(conn_Rel,'Employees','Orders_RELATIONAL_DB', 'dbo')            
#     tasks.create_table(conn_Rel,'Order_Details','Orders_RELATIONAL_DB', 'dbo')         
#     tasks.create_table(conn_Rel,'Customers','Orders_RELATIONAL_DB', 'dbo')            
#     tasks.create_table(conn_Rel,'Orders','Orders_RELATIONAL_DB', 'dbo')               
#     tasks.create_table(conn_Rel,'Products','Orders_RELATIONAL_DB', 'dbo')             
#     tasks.create_table(conn_Rel,'Region','Orders_RELATIONAL_DB', 'dbo')               
#     tasks.create_table(conn_Rel,'Shippers','Orders_RELATIONAL_DB', 'dbo')             
#     tasks.create_table(conn_Rel,'Suppliers','Orders_RELATIONAL_DB', 'dbo')            
#     tasks.create_table(conn_Rel,'Territories','Orders_RELATIONAL_DB', 'dbo')

#     tasks.insert_into_table(conn_Rel,'Categories','Orders_RELATIONAL_DB', 'dbo')           
#     tasks.insert_into_table(conn_Rel,'Employees','Orders_RELATIONAL_DB', 'dbo')            
#     tasks.insert_into_table(conn_Rel,'Order_Details','Orders_RELATIONAL_DB', 'dbo')         
#     tasks.insert_into_table(conn_Rel,'Customers','Orders_RELATIONAL_DB', 'dbo')            
#     tasks.insert_into_table(conn_Rel,'Orders','Orders_RELATIONAL_DB', 'dbo')               
#     tasks.insert_into_table(conn_Rel,'Products','Orders_RELATIONAL_DB', 'dbo')             
#     tasks.insert_into_table(conn_Rel,'Region','Orders_RELATIONAL_DB', 'dbo')               
#     tasks.insert_into_table(conn_Rel,'Shippers','Orders_RELATIONAL_DB', 'dbo')             
#     tasks.insert_into_table(conn_Rel,'Suppliers','Orders_RELATIONAL_DB', 'dbo')            
#     tasks.insert_into_table(conn_Rel,'Territories','Orders_RELATIONAL_DB', 'dbo')     

#     conn_Dim = tasks.connect_db_create_cursor("Orders_DIMENSIONAL_DW")

#     tasks.drop_table(conn_Dim,'Categories','Orders_DIMENSIONAL_DW', 'dbo')           
#     tasks.drop_table(conn_Dim,'Customers','Orders_DIMENSIONAL_DW', 'dbo')            
#     tasks.drop_table(conn_Dim,'Employees','Orders_DIMENSIONAL_DW', 'dbo')            
#     tasks.drop_table(conn_Dim,'Order_Details','Orders_DIMENSIONAL_DW', 'dbo')         
#     tasks.drop_table(conn_Dim,'Orders','Orders_DIMENSIONAL_DW', 'dbo')               
#     tasks.drop_table(conn_Dim,'Products','Orders_DIMENSIONAL_DW', 'dbo')             
#     tasks.drop_table(conn_Dim,'Region','Orders_DIMENSIONAL_DW', 'dbo')               
#     tasks.drop_table(conn_Dim,'Shippers','Orders_DIMENSIONAL_DW', 'dbo')             
#     tasks.drop_table(conn_Dim,'Suppliers','Orders_DIMENSIONAL_DW', 'dbo')            
#     tasks.drop_table(conn_Dim,'Territories','Orders_DIMENSIONAL_DW', 'dbo') 

#     tasks.create_table(conn_Dim, 'dim_people_scd1', 'Orders_DW', 'dbo')
#     tasks.update_dim_table(conn_Dim, 'dim_people_scd1', 'Orders_DW', 'dbo',
#                            'people', 'Orders_ER', 'dbo')

#     conn_Rel.close()
#     conn_Dim.close()


