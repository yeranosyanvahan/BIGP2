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

    def create_table_fact(self,conn):
        pass

    def update_fact_table(self,conn):
        pass

    def execute(self):
        conn_Rel = FLOW.create_connection("RELATIONAL") 
        self.drop_tables_rel(conn_Rel)
        self.create_tables_rel(conn_Rel)
        self.insert_into_table(conn_Rel)
        conn_Rel.close()

        conn_Dim = FLOW.create_connection("DIMENTIONAL") 
        self.drop_tables_dim(conn_Dim)
        self.create_tables_dim(conn_Dim)
        self.update_dim_table(conn_Dim)
        self.create_table_fact(conn_Dim)
        self.update_fact_table(conn_Dim)
        conn_Dim.close()        
