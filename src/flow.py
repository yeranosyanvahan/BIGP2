import tasks

class FLOW:
    def __init__(self, config, sourcedatafile):
        self.config = config
        self.sourcedatafile = sourcedatafile

    @staticmethod
    def create_connection(argument):
        if argument == 'RELATIONAL':
            conn = tasks.connect_db_create_cursor("Orders_RELATIONAL_DB") 
        elif argument == 'DIMENSIONAL':
            conn = tasks.connect_db_create_cursor("Orders_DIMENSIONAL_DW")
        else:
            conn = tasks.connect_db_master_create_cursor("master")
        return conn

    def drop_tables_rel(self, conn):
        for tablename in self.config.relational_table_list[::-1]:
            tasks.drop_table(conn, tablename,'Orders_RELATIONAL_DB', 'dbo')     

    def drop_tables_dim(self, conn):
        for tablename in self.config.dimentional_table_list[::-1]:
            tasks.drop_table(conn, tablename,'Orders_DIMENSIONAL_DW', 'dbo')          

    def create_tables_rel(self, conn):
        for tablename in self.config.relational_table_list:
            tasks.create_table(conn, tablename, 'Orders_RELATIONAL_DB', 'dbo')  

    def insert_into_table(self, conn):
        for tablename in self.config.relational_table_list:
            tasks.insert_into_table(conn, tablename,'Orders_RELATIONAL_DB', 'dbo', self.sourcedatafile)    

    def create_tables_dim(self, conn):
        for tablename in self.config.dimentional_table_list:
            tasks.create_table_dim(conn, tablename, 'Orders_DIMENSIONAL_DW', 'dbo')  

    def update_dim_table(self, conn):
        for reltablename, dimtablename in zip(self.config.relational_table_list, self.config.dimentional_table_list):
            tasks.update_dim_table(conn, 'Orders_RELATIONAL_DB', 'dbo', reltablename,
                                         'Orders_DIMENSIONAL_DW', 'dbo', dimtablename)    
    def create_database(self,conn):
        tasks.create_database(conn)

    def create_table_fact(self,conn):
        facttablename = self.config.fact_table_name
        tasks.create_table_fact(conn, 'Orders_DIMENSIONAL_DW', 'dbo', facttablename) 

    def update_fact_table(self,conn):
        facttablename = self.config.fact_table_name
        tasks.update_fact_table(conn, 'Orders_RELATIONAL_DB', 'dbo', facttablename,
                                      'Orders_DIMENSIONAL_DW', 'dbo', facttablename)

    def drop_fact_table(self,conn):
        facttablename = self.config.fact_table_name
        tasks.drop_fact_table(conn, 'Orders_DIMENSIONAL_DW', 'dbo', facttablename)

    def execute(self):
        conn_master = FLOW.create_connection("master") 
        try:
            self.create_database(conn_master)
        except:
            print("The Database has already been Created")
        finally:
            conn_master.close()

        conn_Rel = FLOW.create_connection("RELATIONAL") 
        self.drop_tables_rel(conn_Rel)
        self.create_tables_rel(conn_Rel)
        self.insert_into_table(conn_Rel)
        conn_Rel.close()

        conn_Dim = FLOW.create_connection("DIMENTIONAL") 
        self.drop_fact_table(conn_Dim)

        self.drop_tables_dim(conn_Dim)
        self.create_tables_dim(conn_Dim)
        self.update_dim_table(conn_Dim)

        self.create_table_fact(conn_Dim)
        self.update_fact_table(conn_Dim)
        conn_Dim.close()        
